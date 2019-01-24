view: nagios_logentries {
  sql_table_name: nagios.nagios_logentries ;;

  dimension_group: entry {
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
    sql: ${TABLE}.entry_time ;;
  }

  dimension: entry_time_usec {
    type: number
    sql: ${TABLE}.entry_time_usec ;;
  }

  dimension: inferred_data_extracted {
    type: number
    sql: ${TABLE}.inferred_data_extracted ;;
  }

  dimension: instance_id {
    type: number
    sql: ${TABLE}.instance_id ;;
  }

  dimension: logentry_data {
    type: string
    sql: ${TABLE}.logentry_data ;;
  }

  dimension: logentry_id {
    type: number
    sql: ${TABLE}.logentry_id ;;
  }

  dimension_group: logentry {
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
    sql: ${TABLE}.logentry_time ;;
  }

  dimension: logentry_type {
    type: number
    sql: ${TABLE}.logentry_type ;;
  }

  dimension: realtime_data {
    type: number
    sql: ${TABLE}.realtime_data ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
