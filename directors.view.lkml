view: directors {
  sql_table_name: jira.directors ;;

  dimension: dept {
    type: string
    sql: ${TABLE}.dept ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

#   measure: director_score {
#     type: average
#     sql: team. ;;
#   }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
