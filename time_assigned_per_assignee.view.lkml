
view: time_assigned_per_assignee {
  derived_table: {
    sql: SELECT s.user_id,issue_id,

case
when sum_time is null then DATEDIFF(s,s.time,i.resolved)
else sum_time end as sum

FROM
     (  select
       sum(k.seconds_diff) as sum_time,user_id, issue_id,time
      from (SELECT *,ABS((DATEDIFF(s,  lag(time) over (partition by ISSUE_id order by TIME desc),
                          Time
                         )
                ))  seconds_diff


      FROM jira.issue_assignee_history

     --  where issue_id = 103165

      ) as k
       group by user_id, issue_id , time
       ) as s
       JOIN jira.issue as i on i.id = s.issue_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sum_in_secs {
    type: number
    value_format: "#,##0"
    sql: ${TABLE}.sum ;;
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

  set: detail {
    fields: [sum_in_secs, user_id]
  }
}
