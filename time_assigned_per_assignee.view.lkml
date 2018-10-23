view: time_assigned_per_assignee {
  derived_table: {
    sql: select
       sum(m.seconds_diff),user_id, issue_id
      from (SELECT *,ABS((DATEDIFF(s,  lag(time) over (partition by ISSUE_id order by TIME desc),
                          Time
                         )
                ))  seconds_diff
      -- (DATEDIFF(seconds,
      --       MIN(time)
      --       OVER (PARTITION BY issue_id
      --         ORDER BY TIME desc
      --         ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
      --         ),
      --       Time
      --       )
      -- ) AS days_diff
      FROM jira.issue_assignee_history
      --where issue_id = 97547
      ) as m
       group by user_id, issue_id
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
