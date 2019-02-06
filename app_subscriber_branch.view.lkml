view: app_subscriber_branch {
  sql_table_name: jira.app_subscriber_branch ;;

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: registration {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.registration_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_registered_in_current_quarter {
    type: count

    filters: {
      field: registration_quarter
      value: "this quarter"
    }
    drill_fields: []
  }
}
