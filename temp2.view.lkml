view: temp2 {

    derived_table: {
      sql: WITH CTE AS (SELECT *,
          ABS((DATEDIFF(m,  lag(time) over (partition by ISSUE_id order by TIME desc),
                    Time
                   )
          )) AS hours_diff
      FROM jira.issue_assignee_history
       )
SELECT
  CTE.issue_id  AS "CTE.issue_id_1",
  CTE.user_id  AS "CTE.user_id_1",
   CTE.time  AS "CTE.time_time_1",
  CTE.hours_diff  AS "CTE.hours_diff_1"
FROM CTE

ORDER BY 1
LIMIT 500
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

    dimension: CTE_user_id_1 {
      type: string
      sql: ${TABLE}."CTE.user_id_1" ;;
    }

    dimension: CTE_time_time_1 {
      type: string
      sql: ${TABLE}."CTE.time_time_1" ;;
    }

    dimension:Diff_min
    {
      type: number
      sql: ${TABLE}."CTE.hours_diff_1" ;;
    }
  measure: Diff_Mins{
    type: sum
    sql: ${TABLE}."CTE.hours_diff_1" ;;
  }

    set: detail {
      fields: [CTE_issue_id_1, CTE_user_id_1, CTE_time_time_1]
    }
  }
