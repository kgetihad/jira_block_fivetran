view: team2 {
  sql_table_name: jira.team ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: dep {
    type: string
    sql: ${TABLE}.dep ;;
    drill_fields: [issue.issue_key,issue.summary,issue.created_date]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, username]
  }

  measure: count_team_member {
    type: count_distinct
    sql: ${username} ;;

  }
}
