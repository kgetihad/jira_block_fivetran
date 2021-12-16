view: credits_used {
  sql_table_name: fivetran_log.credits_used ;;

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

  dimension: credits_consumed {
    type: number
    sql: ${TABLE}.credits_consumed ;;
  }

  dimension: destination_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.destination_id ;;
  }

  dimension: measured_month {
    type: string
    sql: ${TABLE}.measured_month ;;
  }

  measure: count {
    type: count
    drill_fields: [destination.name, destination.id]
  }
}
