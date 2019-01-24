view: issue_labels {
  sql_table_name: JIRA.ISSUE_LABELS ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    primary_key: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.VALUE ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.issue_key, issue.epic_name]
  }
}
