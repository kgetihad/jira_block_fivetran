view: hours_per_ticket_per_assignee {
  derived_table: {
    sql: SELECT sum(days_diff),user_id,issue_id
      FROM
      (SELECT *,
          (DATEDIFF(hours,
                    MIN(time)
                      OVER (PARTITION BY issue_id
                         ORDER BY TIME
                         ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
                        ),
                    Time
                   )
          ) AS days_diff
      FROM jira.issue_assignee_history
      ) as m
      GROUP BY user_id ,issue_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sum {
    type: number
    sql: ${TABLE}.sum ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  set: detail {
    fields: [sum, user_id, issue_id]
  }
}
