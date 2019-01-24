view: nagios_notifications {
  sql_table_name: nagios.nagios_notifications ;;

  dimension: contacts_notified {
    type: number
    sql: ${TABLE}.contacts_notified ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: end_time_usec {
    type: number
    sql: ${TABLE}.end_time_usec ;;
  }

  dimension: escalated {
    type: number
    sql: ${TABLE}.escalated ;;
  }

  dimension: instance_id {
    type: number
    sql: ${TABLE}.instance_id ;;
  }

  dimension: long_output {
    type: string
    sql: ${TABLE}.long_output ;;
  }

  dimension: notification_id {
    type: number
    sql: ${TABLE}.notification_id ;;
  }

  dimension: notification_reason {
    type: number
    sql: ${TABLE}.notification_reason ;;
  }

  dimension: notification_type {
    type: number
    sql: ${TABLE}.notification_type ;;
  }

  dimension: object_id {
    type: number
    sql: ${TABLE}.object_id ;;
  }

  dimension: output {
    type: string
    sql: ${TABLE}.output ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
  }

  dimension: start_time_usec {
    type: number
    sql: ${TABLE}.start_time_usec ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
