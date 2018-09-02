view: issue_assignee_history {
  sql_table_name: JIRA.ISSUE_ASSIGNEE_HISTORY ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: time {
    type: date_time
    sql: ${TABLE}.TIME ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name, user.id, user.name]
  }
}
