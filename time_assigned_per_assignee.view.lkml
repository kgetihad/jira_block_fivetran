
view: time_assigned_per_assignee {
  derived_table: {
    sql:

SELECT
  user_id,
  issue_id,
  SUM(sum) AS sum,
  SUM(working_hours) AS working_hours,
  slaola_type

FROM (SELECT
  s.slaola_type,
  s.user_id,
  issue_id,

  CASE
    WHEN sum_time IS NULL THEN DATEDIFF(s, s.time,

      CASE
        WHEN i.resolved IS NULL THEN GETDATE()
        ELSE i.resolved
      END

      )
    ELSE sum_time
  END AS sum,

  CASE
    WHEN businesshours IS NULL AND
      i.resolved IS NULL THEN (DATEDIFF(MINUTE, s.time, GETDATE()) / 60.0 -
      DATEDIFF(DAY, s.time, GETDATE()) * 16 -
      DATEDIFF(WEEK, s.time, GETDATE()) * 16)
    WHEN businesshours IS NULL AND
      i.resolved IS NOT NULL THEN (DATEDIFF(MINUTE, s.time, i.resolved) / 60.0 -
      DATEDIFF(DAY, s.time, i.resolved) * 16 -
      DATEDIFF(WEEK, s.time, i.resolved) * 16)
    ELSE businesshours * -1
  END AS working_hours



FROM (SELECT
  SUM(k.seconds_diff) AS sum_time,
  SUM(k.businesshours) AS businesshours,
  slaola_type,
  user_id,
  issue_id,
  time
FROM (SELECT
  h.*,
  ABS((DATEDIFF(s, LAG(h.time) OVER (PARTITION BY h.ISSUE_id ORDER BY h.TIME DESC), h.Time))) seconds_diff,
  DATEDIFF(MINUTE, LAG(h.time) OVER (PARTITION BY h.ISSUE_id ORDER BY h.TIME DESC), h.Time) / 60.0 -
  DATEDIFF(DAY, LAG(h.time) OVER (PARTITION BY h.ISSUE_id ORDER BY h.TIME DESC), h.Time) * 16 -
  DATEDIFF(WEEK, LAG(h.time) OVER (PARTITION BY h.ISSUE_id ORDER BY h.TIME DESC), h.Time) * 16 AS businesshours,
  CASE
    WHEN u.email not like '%@bankaletihad.com' THEN 'None'
    WHEN tr.accountid IS NULL AND
      ta.accountid IS NOT NULL THEN 'SLA'
    WHEN tr.accountid = ta.accountid THEN 'None'
    WHEN tr.dep = ta.dep THEN 'None'
    WHEN tr.accountid != ta.accountid AND
      tr.dep != ta.dep AND
      tr.accountid IS NOT NULL AND
      ta.accountid IS NOT NULL THEN 'OLA'
    ELSE 'None'
  END AS slaola_type

FROM jira.issue_assignee_history AS h
JOIN jira.issue AS i
  ON i.id = h.issue_id
LEFT JOIN jira.user as u on u.id = i.reporter
LEFT JOIN jira.team AS tr
  ON tr.accountid = i.reporter
LEFT JOIN jira.team AS ta
  ON ta.accountid = h.user_id
-- WHERE h.issue_id = 97051
-- WHERE i.key in ('BPM-3146','BPM-2414')
) AS k
GROUP BY slaola_type,
         user_id,
         issue_id,
         time) AS s
JOIN jira.issue AS i
  ON i.id = s.issue_id) AS work
GROUP BY slaola_type,
         user_id,
         issue_id

       ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.assignee,issue.reporter,issue.issue_key,target.priority,SLAOLA,target.hours,sla_score,avg_spent_on_ticket]
  }


  measure: sum_ticket {
    type: sum
    sql:cast(${sla_score} as integer);;
  }
  measure: avg_spent_on_ticket {
    type: average
    sql: ${working_hours}  ;;
  }

  measure:  count_within_target{
    type: count
    filters:{
      field: sla_score
      value: "5"
    }
}



  measure: avg_deviation_from_sla {
    type: average
    sql: ${sla_matching_percentage} ;;
  }

  dimension: sla_matching_percentage {
    type: number
    value_format: "0.00\%"
    sql:case when ${working_hours}  is null or ${working_hours} = 0 then null else
    case when  (${working_hours}  -  ${target.hours})  <= 0 then 0 else
    (( ${working_hours}  -  ${target.hours} ) / ${target.hours} ) * 100
    end
    end ;;
  }

  dimension: target_assignee_hours {
    type: number
    value_format: "#.00"
    sql:1.00 * (${target.hours});;
  }


  dimension: working_minus_target_percentage {
    type: number
    value_format: "#.00"
    sql:100.00 * ( ${working_hours} - ${target.hours})/${target.hours}  ;;

  }

  dimension: working_minus_target {
    type: number
    value_format: "#.00"
    sql: 1.00 *(${working_hours} - ${target.hours}) ;;

  }

  dimension: sla_score {
    case: {
      when : {
        sql: ${working_minus_target_percentage} >= 95 ;;
        label : "-5"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 95   and ${working_minus_target_percentage} >= 90;;
        label : "-4"
      }

      when : {
        sql:  ${working_minus_target_percentage} < 90   and ${working_minus_target_percentage} >= 85;;
        label : "-3"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 85   and ${working_minus_target_percentage} >= 75;;
        label : "-2"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 75   and ${working_minus_target_percentage} >= 65;;
        label : "-1"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 65   and ${working_minus_target_percentage} >= 55;;
        label : "0"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 55  and ${working_minus_target_percentage} >= 45 ;;
        label : "1"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 45  and ${working_minus_target_percentage} >= 35 ;;
        label : "2"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 35  and ${working_minus_target_percentage} >= 25 ;;
        label : "3"
      }
      when : {
        sql:  ${working_minus_target_percentage} < 25   and ${working_minus_target_percentage} >= 15;;
        label : "4"
      }

      when : {
        sql:  ${working_minus_target_percentage} < 15  ;;
        label : "5"
      }
    }
  }

  dimension: sum_in_secs {
    type: number
    value_format: "#,##0"
    sql: ${TABLE}.working_hours ;;
  }

  dimension: pk_user_issue {
    type: string
    sql: CONCAT(${TABLE}.user_id, ${TABLE}.issue_id) ;;
      primary_key:yes
  }




  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    drill_fields: [issue.assignee,issue.reporter,issue.issue_key,issue.project]
  }

  dimension: SLAOLA  {
    type: string
    sql: ${TABLE}.slaola_type ;;

    }




  dimension: sum_in_mins {
    type: number
    value_format: "0.00"
    sql: ${sum_in_secs}/60 ;;
  }

  dimension: sum_in_hrs {
    type: number
    value_format: "0.00"
    sql: ${sum_in_mins}/60 ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension: working_hours {
    type: number
    value_format: "0.000"
    sql: ${TABLE}.working_hours ;;
  }

  set: detail {
    fields: [sum_in_secs, user_id]
  }
}
