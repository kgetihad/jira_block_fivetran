view: connector {
  sql_table_name: fivetran_log.connector ;;
  drill_fields: [connector_id]

  dimension: connector_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.connector_id ;;
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

  dimension: connecting_user_id {
    type: string
    sql: ${TABLE}.connecting_user_id ;;
  }

  dimension: connector_name {
    type: string
    sql: ${TABLE}.connector_name ;;
  }

  dimension: connector_type {
    type: string
    sql: ${TABLE}.connector_type ;;
  }

  dimension: destination_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.destination_id ;;
  }

  dimension: paused {
    type: yesno
    sql: ${TABLE}.paused ;;
  }

  dimension_group: signed_up {
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
    sql: ${TABLE}.signed_up ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      connector_id,
      connector_name,
      destination.name,
      destination.id,
      active_volume.count,
      log.count
    ]
  }
}
