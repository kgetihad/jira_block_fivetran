view: temp2 {

    derived_table: {
      sql: WITH CTE AS (SELECT *,
          ABS((DATEDIFF(m,  lag(time) over (partition by ISSUE_id order by TIME desc),
                    Time
                   )
          ))  hours_diff
      FROM jira.issue_assignee_history
       )
SELECT
  CTE.issue_id  AS "CTE.issue_id_1",
  CTE.user_id  AS "CTE.user_id_1",
  CTE.time  AS "CTE.time_time_1",
  CTE.hours_diff  AS "CTE.hours_diff_1"
FROM CTE

ORDER BY 1

 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: CTE_issue_id_1 {
      type: number
      sql: ${TABLE}."CTE.issue_id_1" ;;
    }
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: concat(concat(${TABLE}."CTE.issue_id_1",${TABLE}."CTE.user_id_1"),${TABLE}."CTE.time_time_1" ;;

  }
    dimension: CTE_user_id_1 {
      type: string
      sql: ${TABLE}."CTE.user_id_1" ;;
    }

    dimension: CTE_time_time_1 {
      type: string
      sql: ${TABLE}."CTE.time_time_1" ;;
    }

    dimension:Diff_mins
    {
      type: number
      sql: ${TABLE}."CTE.hours_diff_1" ;;
    }
    dimension: Difference_in_hours{
    type: number
    sql:${Diff_mins}/60 ;;
  }
  measure: Diff_mins_m{
    type: sum
    sql:${TABLE}."CTE.hours_diff_1" ;;
  }

    set: detail {
      fields: [CTE_issue_id_1, CTE_user_id_1, CTE_time_time_1]
    }
  }
