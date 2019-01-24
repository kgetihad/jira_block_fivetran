view: nagios_hosts {
  sql_table_name: nagios.nagios_hosts ;;

  dimension: action_url {
    type: string
    sql: ${TABLE}.action_url ;;
  }

  dimension: active_checks_enabled {
    type: number
    sql: ${TABLE}.active_checks_enabled ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: check_command_args {
    type: string
    sql: ${TABLE}.check_command_args ;;
  }

  dimension: check_command_object_id {
    type: number
    sql: ${TABLE}.check_command_object_id ;;
  }

  dimension: check_interval {
    type: number
    sql: ${TABLE}.check_interval ;;
  }

  dimension: check_timeperiod_object_id {
    type: number
    sql: ${TABLE}.check_timeperiod_object_id ;;
  }

  dimension: config_type {
    type: number
    sql: ${TABLE}.config_type ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: event_handler_enabled {
    type: number
    sql: ${TABLE}.event_handler_enabled ;;
  }

  dimension: eventhandler_command_args {
    type: string
    sql: ${TABLE}.eventhandler_command_args ;;
  }

  dimension: eventhandler_command_object_id {
    type: number
    sql: ${TABLE}.eventhandler_command_object_id ;;
  }

  dimension: failure_prediction_enabled {
    type: number
    sql: ${TABLE}.failure_prediction_enabled ;;
  }

  dimension: failure_prediction_options {
    type: string
    sql: ${TABLE}.failure_prediction_options ;;
  }

  dimension: first_notification_delay {
    type: number
    sql: ${TABLE}.first_notification_delay ;;
  }

  dimension: flap_detection_enabled {
    type: number
    sql: ${TABLE}.flap_detection_enabled ;;
  }

  dimension: flap_detection_on_down {
    type: number
    sql: ${TABLE}.flap_detection_on_down ;;
  }

  dimension: flap_detection_on_unreachable {
    type: number
    sql: ${TABLE}.flap_detection_on_unreachable ;;
  }

  dimension: flap_detection_on_up {
    type: number
    sql: ${TABLE}.flap_detection_on_up ;;
  }

  dimension: freshness_checks_enabled {
    type: number
    sql: ${TABLE}.freshness_checks_enabled ;;
  }

  dimension: freshness_threshold {
    type: number
    sql: ${TABLE}.freshness_threshold ;;
  }

  dimension: have_2d_coords {
    type: number
    sql: ${TABLE}.have_2d_coords ;;
  }

  dimension: have_3d_coords {
    type: number
    sql: ${TABLE}.have_3d_coords ;;
  }

  dimension: high_flap_threshold {
    type: number
    sql: ${TABLE}.high_flap_threshold ;;
  }

  dimension: host_id {
    type: number
    sql: ${TABLE}.host_id ;;
  }

  dimension: host_object_id {
    type: number
    sql: ${TABLE}.host_object_id ;;
  }

  dimension: icon_image {
    type: string
    sql: ${TABLE}.icon_image ;;
  }

  dimension: icon_image_alt {
    type: string
    sql: ${TABLE}.icon_image_alt ;;
  }

  dimension: importance {
    type: number
    sql: ${TABLE}.importance ;;
  }

  dimension: instance_id {
    type: number
    sql: ${TABLE}.instance_id ;;
  }

  dimension: low_flap_threshold {
    type: number
    sql: ${TABLE}.low_flap_threshold ;;
  }

  dimension: max_check_attempts {
    type: number
    sql: ${TABLE}.max_check_attempts ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: notes_url {
    type: string
    sql: ${TABLE}.notes_url ;;
  }

  dimension: notification_interval {
    type: number
    sql: ${TABLE}.notification_interval ;;
  }

  dimension: notification_timeperiod_object_id {
    type: number
    sql: ${TABLE}.notification_timeperiod_object_id ;;
  }

  dimension: notifications_enabled {
    type: number
    sql: ${TABLE}.notifications_enabled ;;
  }

  dimension: notify_on_down {
    type: number
    sql: ${TABLE}.notify_on_down ;;
  }

  dimension: notify_on_downtime {
    type: number
    sql: ${TABLE}.notify_on_downtime ;;
  }

  dimension: notify_on_flapping {
    type: number
    sql: ${TABLE}.notify_on_flapping ;;
  }

  dimension: notify_on_recovery {
    type: number
    sql: ${TABLE}.notify_on_recovery ;;
  }

  dimension: notify_on_unreachable {
    type: number
    sql: ${TABLE}.notify_on_unreachable ;;
  }

  dimension: obsess_over_host {
    type: number
    sql: ${TABLE}.obsess_over_host ;;
  }

  dimension: passive_checks_enabled {
    type: number
    sql: ${TABLE}.passive_checks_enabled ;;
  }

  dimension: process_performance_data {
    type: number
    sql: ${TABLE}.process_performance_data ;;
  }

  dimension: retain_nonstatus_information {
    type: number
    sql: ${TABLE}.retain_nonstatus_information ;;
  }

  dimension: retain_status_information {
    type: number
    sql: ${TABLE}.retain_status_information ;;
  }

  dimension: retry_interval {
    type: number
    sql: ${TABLE}.retry_interval ;;
  }

  dimension: stalk_on_down {
    type: number
    sql: ${TABLE}.stalk_on_down ;;
  }

  dimension: stalk_on_unreachable {
    type: number
    sql: ${TABLE}.stalk_on_unreachable ;;
  }

  dimension: stalk_on_up {
    type: number
    sql: ${TABLE}.stalk_on_up ;;
  }

  dimension: statusmap_image {
    type: string
    sql: ${TABLE}.statusmap_image ;;
  }

  dimension: vrml_image {
    type: string
    sql: ${TABLE}.vrml_image ;;
  }

  dimension: x_2d {
    type: number
    sql: ${TABLE}.x_2d ;;
  }

  dimension: x_3d {
    type: number
    sql: ${TABLE}.x_3d ;;
  }

  dimension: y_2d {
    type: number
    sql: ${TABLE}.y_2d ;;
  }

  dimension: y_3d {
    type: number
    sql: ${TABLE}.y_3d ;;
  }

  dimension: z_3d {
    type: number
    sql: ${TABLE}.z_3d ;;
  }

  measure: count {
    type: count
    drill_fields: [display_name]
  }
}
