view: team_tickets {
  sql_table_name: jira.team_tickets ;;

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }
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

  measure: count_distinct {
    type: count_distinct
    sql: ${issue_id};;

  }

  measure: avg_sla {
    type:  average
    sql: ${sla_score}  ;;
    filters: [ slaola_type: "SLA"]
  }

  measure: avg_ola {
    type:  average
    sql: ${sla_score}  ;;
    filters: [ slaola_type: "OLA"]
  }

  measure: count_sla {
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "SLA"]
  }

  measure: count_ola {
    type:  average
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "OLA"]
  }

}
