view: team_tickets_test {
  sql_table_name: jira.team_tickets_test ;;

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension: sla_score {
    type: number
    sql: ${TABLE}.sla_score ;;
  }

  dimension: slaola_type {
    type: string
    sql: ${TABLE}.slaola_type ;;
  }

  dimension: sum {
    type: number
    sql: ${TABLE}.sum ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: working_hours {
    type: number
    sql: ${TABLE}.working_hours ;;
  }

  dimension: working_minus_target {
    type: number
    sql: ${TABLE}.working_minus_target ;;
  }

  dimension: working_minus_target_percentage {
    type: number
    sql: ${TABLE}.working_minus_target_percentage ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
