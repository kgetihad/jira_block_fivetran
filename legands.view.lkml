view: legands {
  sql_table_name: jira.legands ;;

  dimension: legend {
    type: string
    sql: ${TABLE}.legend ;;
  }

  dimension: score {
    type: string
    sql: ${TABLE}.score ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
