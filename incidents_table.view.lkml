view: incidents_table {
  sql_table_name: jira.incidents_table ;;
  dimension:  id{
    type: number
    primary_key: yes
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_high_impact_incidents {
    type: number
    sql: ${TABLE}.number_of_high_impact_incidents ;;
  }

  dimension: number_of_incidents {
    type: number
    sql: ${TABLE}.number_of_incidents ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
