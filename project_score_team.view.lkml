view: project_score_team {
  sql_table_name: jira.project_score_team ;;

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: team_member {
    type: string
    sql: ${TABLE}.teammember ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [username]
  }
}
