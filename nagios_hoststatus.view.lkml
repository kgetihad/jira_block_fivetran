view: nagios_hoststatus {
  sql_table_name: nagios.nagios_hoststatus ;;

  dimension: acknowledgement_type {
    type: number
    sql: ${TABLE}.acknowledgement_type ;;
  }

  dimension: active_checks_enabled {
    type: number
    sql: ${TABLE}.active_checks_enabled ;;
  }

  dimension: check_command {
    type: string
    sql: ${TABLE}.check_command ;;
  }

  dimension: check_timeperiod_object_id {
    type: number
    sql: ${TABLE}.check_timeperiod_object_id ;;
  }

  dimension: check_type {
    type: number
    sql: ${TABLE}.check_type ;;
  }

  dimension: current_check_attempt {
    type: number
    sql: ${TABLE}.current_check_attempt ;;
  }

  dimension: current_notification_number {
    type: number
    sql: ${TABLE}.current_notification_number ;;
  }

  dimension: current_state {
    type: number
    sql: ${TABLE}.current_state ;;
  }

  dimension: event_handler {
    type: string
    sql: ${TABLE}.event_handler ;;
  }

  dimension: event_handler_enabled {
    type: number
    sql: ${TABLE}.event_handler_enabled ;;
  }

  dimension: execution_time {
    type: number
    sql: ${TABLE}.execution_time ;;
  }

  dimension: failure_prediction_enabled {
    type: number
    sql: ${TABLE}.failure_prediction_enabled ;;
  }

  dimension: flap_detection_enabled {
    type: number
    sql: ${TABLE}.flap_detection_enabled ;;
  }

  dimension: has_been_checked {
    type: number
    sql: ${TABLE}.has_been_checked ;;
  }

  dimension: host_object_id {
    type: number
    sql: ${TABLE}.host_object_id ;;
  }

  dimension: hoststatus_id {
    type: number
    sql: ${TABLE}.hoststatus_id ;;
  }

  dimension: instance_id {
    type: number
    sql: ${TABLE}.instance_id ;;
  }

  dimension: is_flapping {
    type: number
    sql: ${TABLE}.is_flapping ;;
  }

  dimension_group: last_check {
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
    sql: ${TABLE}.last_check ;;
  }

  dimension: last_hard_state {
    type: number
    sql: ${TABLE}.last_hard_state ;;
  }

  dimension_group: last_hard_state_change {
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
    sql: ${TABLE}.last_hard_state_change ;;
  }

  dimension_group: last_notification {
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
    sql: ${TABLE}.last_notification ;;
  }

  dimension_group: last_state_change {
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
    sql: ${TABLE}.last_state_change ;;
  }

  dimension_group: last_time_down {
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
    sql: ${TABLE}.last_time_down ;;
  }

  dimension_group: last_time_unreachable {
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
    sql: ${TABLE}.last_time_unreachable ;;
  }

  dimension_group: last_time_up {
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
    sql: ${TABLE}.last_time_up ;;
  }

  dimension: latency {
    type: number
    sql: ${TABLE}.latency ;;
  }

  dimension: long_output {
    type: string
    sql: ${TABLE}.long_output ;;
  }

  dimension: max_check_attempts {
    type: number
    sql: ${TABLE}.max_check_attempts ;;
  }

  dimension: modified_host_attributes {
    type: number
    sql: ${TABLE}.modified_host_attributes ;;
  }

  dimension_group: next_check {
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
    sql: ${TABLE}.next_check ;;
  }

  dimension_group: next_notification {
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
    sql: ${TABLE}.next_notification ;;
  }

  dimension: no_more_notifications {
    type: number
    sql: ${TABLE}.no_more_notifications ;;
  }

  dimension: normal_check_interval {
    type: number
    sql: ${TABLE}.normal_check_interval ;;
  }

  dimension: notifications_enabled {
    type: number
    sql: ${TABLE}.notifications_enabled ;;
  }

  dimension: obsess_over_host {
    type: number
    sql: ${TABLE}.obsess_over_host ;;
  }

  dimension: output {
    type: string
    sql: ${TABLE}.output ;;
  }

  dimension: passive_checks_enabled {
    type: number
    sql: ${TABLE}.passive_checks_enabled ;;
  }

  dimension: percent_state_change {
    type: number
    sql: ${TABLE}.percent_state_change ;;
  }

  dimension: perfdata {
    type: string
    sql: ${TABLE}.perfdata ;;
  }

  dimension: problem_has_been_acknowledged {
    type: number
    sql: ${TABLE}.problem_has_been_acknowledged ;;
  }

  dimension: process_performance_data {
    type: number
    sql: ${TABLE}.process_performance_data ;;
  }

  dimension: retry_check_interval {
    type: number
    sql: ${TABLE}.retry_check_interval ;;
  }

  dimension: scheduled_downtime_depth {
    type: number
    sql: ${TABLE}.scheduled_downtime_depth ;;
  }

  dimension: should_be_scheduled {
    type: number
    sql: ${TABLE}.should_be_scheduled ;;
  }

  dimension: state_type {
    type: number
    sql: ${TABLE}.state_type ;;
  }

  dimension_group: status_update {
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
    sql: ${TABLE}.status_update_time ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
