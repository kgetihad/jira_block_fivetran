view: issue_market_growth_level_of_impact {
  sql_table_name: jira.issue_market_growth_level_of_impact ;;

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
