view: project_score {
  sql_table_name: jira.project_score ;;

  dimension: actuallaunch {
    type: date
    sql: ${TABLE}.actuallaunch ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: plannedlaunch {
    type: date
    sql: ${TABLE}.plannedlaunch ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: projectscore {
    type: number
    sql: ${TABLE}.projectscore ;;
  }

  dimension: projectweight {
    type: number
    sql: ${TABLE}.projectweight ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
