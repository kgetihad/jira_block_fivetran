view: legands {
  sql_table_name: jira.legands ;;

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: legend {
    type: string
    sql: ${TABLE}.legand ;;
  }

  dimension: score {
    type: number
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
