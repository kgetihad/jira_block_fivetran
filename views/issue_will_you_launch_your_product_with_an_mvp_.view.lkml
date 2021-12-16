view: issue_will_you_launch_your_product_with_an_mvp_ {
  sql_table_name: jira.issue_will_you_launch_your_product_with_an_mvp_ ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: field_option_id {
    type: number
    sql: ${TABLE}.field_option_id ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
