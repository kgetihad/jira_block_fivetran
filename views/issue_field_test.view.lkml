view: issue_field_test {
  sql_table_name: jira.issue_field_test ;;

  dimension: issue_issue_key {
    type: string
    sql: ${TABLE}."issue.issue_key" ;;
  }

  dimension: product_squad_id {
    type: number
    sql: ${TABLE}."product_squad.id" ;;
  }

  dimension: product_squad_name {
    type: string
    sql: ${TABLE}."product_squad.name" ;;
  }

  measure: count {
    type: count
    drill_fields: [product_squad_name]
  }
}
