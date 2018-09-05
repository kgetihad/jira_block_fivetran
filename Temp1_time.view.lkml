view: Temp1_time {
  derived_table: {
    sql:WITH Temp1_time AS (SELECT *,
          ABS((DATEDIFF(m,  lag(time) over (partition by ISSUE_id order by TIME desc),
                    Time
                   )
          )) AS hours_diff
      FROM jira.issue_assignee_history
       )
SELECT
  Temp1_time.issue_id  AS "temp1_time.issue_id_1",
  Temp1_time.user_id  AS "temp1_time.user_id_1",
  TO_CHAR(CONVERT_TIMEZONE('UTC', 'Asia/Amman', Temp1_time.time ), 'YYYY-MM-DD HH24:MI:SS') AS "temp1_time.time_time_1",
  Temp1_time.hours_diff  AS "temp1_time.hours_diff_1"
FROM Temp1_time

GROUP BY 1,2,3,4
ORDER BY 1 ,3 ,4;;
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

dimension: Hours_differ
    {
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

    ]
  }
}
