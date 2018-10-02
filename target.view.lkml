view: target {
  sql_table_name: jira.target ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: hours {
    type: string
    sql: ${TABLE}.hours ;;
  }

  dimension: issla {
    type: string
    sql: ${TABLE}.issla ;;
  }

  dimension: minutes {
    type: string
    sql: ${TABLE}.minutes ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
