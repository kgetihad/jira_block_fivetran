
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

       where issue_id = 97051

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

  dimension: working_hours {
    type: number
    sql: ${TABLE}.working_hours ;;
  }

  set: detail {
    fields: [sum_in_secs, user_id]
  }
}
