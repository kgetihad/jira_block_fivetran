view: Temp1_time {
  derived_table: {
    sql: SELECT *,
          (DATEDIFF(h,
                    MIN(time)
                      OVER (PARTITION BY issue_id
                         ORDER BY TIME
                         ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
                        ),
                    Time
                   )
          ) AS hours_diff
      FROM jira.issue_assignee_history
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension_group: time {
    type: time
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: hours_diff {
    type: number
    sql: ${TABLE}.hours_diff ;;
  }
  measure: Hours_diff  {
    type: number
    sql: ${TABLE}.hours_diff ;;

  }

  set: detail {
    fields: [
      issue_id,
      time_time,
      user_id,
      _fivetran_id,
      _fivetran_synced_time,
      hours_diff
    ]
  }
}
