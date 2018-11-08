
view: time_assigned_per_assignee {
  derived_table: {
    sql:
SELECT user_id,issue_id , sum(sum) as sum , sum(working_hours) as working_hours
from
(
SELECT s.user_id,issue_id,

case
when sum_time is null then DATEDIFF(s,s.time,

case when i.resolved is null then GETDATE() else  i.resolved end

)
else sum_time end as sum
,

case
when businesshours is null and i.resolved is null then
  (DATEDIFF(minute, s.time,  GETDATE())/60.0-
    DATEDIFF(day,   s.time,  GETDATE())*16 -
    DATEDIFF(week,s.time,  GETDATE())*16 )
when  businesshours is null and i.resolved is not null then
(DATEDIFF(minute, s.time,  i.resolved)/60.0-
    DATEDIFF(day,   s.time,   i.resolved)*16 -
    DATEDIFF(week,s.time,  i.resolved)*16 )
else businesshours * -1 end as working_hours


FROM
    (
    select
      sum(k.seconds_diff) as sum_time, sum(k.businesshours) as businesshours, user_id, issue_id,time
      from (

      SELECT *,
      ABS((DATEDIFF(s,  lag(time) over (partition by ISSUE_id order by TIME desc),
                          Time
                         )
                ))  seconds_diff,

                 DATEDIFF(minute, lag(time) over (partition by ISSUE_id order by TIME desc),  Time) /60.0-
    DATEDIFF(day,    lag(time) over (partition by ISSUE_id order by TIME desc),  Time)*16 -
    DATEDIFF(week,   lag(time) over (partition by ISSUE_id order by TIME desc),  Time)*16  AS businesshours


      FROM jira.issue_assignee_history

       -- where issue_id = 97051

      ) as k
      group by user_id, issue_id ,time
      ) as s
      JOIN jira.issue as i on i.id = s.issue_id
      ) as work
      group by user_id,issue_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  measure: sum_ticket {
    type: sum
    sql:cast(${sla_score} as integer);;
  }
  measure: avg_spent_on_ticket {
    type: average
    sql: ${working_hours}  ;;
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
