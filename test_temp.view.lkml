view: test_temp {
  derived_table: {
    sql: SELECT
        issue.key  AS "issue.issue_key",
        issue.reporter  AS "issue.reporter",
        issue_assignee_history.USER_ID  AS "issue_assignee_history.user_id",
        issue_assignee_history.TIME  AS "issue_assignee_history.time",
        priority.NAME  AS "priority.name",
        DATE(CONVERT_TIMEZONE('UTC', 'Asia/Amman', issue.resolved )) AS "issue.resolved_date",
        DATEDIFF(h,issue.created,issue.resolved)  AS "issue.hours_to_resolve_issue",
        DATEDIFF(h,"issue_assignee_history.time",issue.resolved) diff,
        DATE(CONVERT_TIMEZONE('UTC', 'Asia/Amman', issue.created )) AS "issue.created_date"
      FROM JIRA.PROJECT  AS project
      LEFT JOIN jira.issue  AS issue ON project.ID = issue.project
      LEFT JOIN JIRA.ISSUE_ASSIGNEE_HISTORY  AS issue_assignee_history ON issue.id=issue_assignee_history.ISSUE_ID
      LEFT JOIN JIRA.PRIORITY  AS priority ON issue.priority = priority.ID

      WHERE (project.NAME = 'ITP') AND ((issue.created  >= (CONVERT_TIMEZONE('Asia/Amman', 'UTC', DATEADD(year,0, DATE_TRUNC('year', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'Asia/Amman', GETDATE()))) ))))) AND ((DATE(CONVERT_TIMEZONE('UTC', 'Asia/Amman', issue.resolved ))) IS NOT NULL)
      GROUP BY 1,2,3,4,5,6,7,8,9
      ORDER BY 4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: issue_issue_key {
    type: string
    sql: ${TABLE}."issue.issue_key" ;;
  }

  dimension: issue_reporter {
    type: string
    sql: ${TABLE}."issue.reporter" ;;
  }

  dimension: issue_assignee_history_user_id {
    type: string
    sql: ${TABLE}."issue_assignee_history.user_id" ;;
  }

  dimension_group: issue_assignee_history_time {
    type: time
    sql: ${TABLE}."issue_assignee_history.time" ;;
  }

  dimension: priority_name {
    type: string
    sql: ${TABLE}."priority.name" ;;
  }

  dimension: issue_resolved_date {
    type: date
    sql: ${TABLE}."issue.resolved_date" ;;
  }

  dimension: issue_hours_to_resolve_issue {
    type: number
    sql: ${TABLE}."issue.hours_to_resolve_issue" ;;
  }

  dimension: issue_created_date {
    type: date
    sql: ${TABLE}."issue.created_date" ;;
  }
  measure: Diff {
    type: sum
    sql: ${TABLE}.diff ;;
  }

  set: detail {
    fields: [
      issue_issue_key,
      issue_reporter,
      issue_assignee_history_user_id,
      issue_assignee_history_time_time,
      priority_name,
      issue_resolved_date,
      issue_hours_to_resolve_issue,
      issue_created_date
    ]
  }
}
