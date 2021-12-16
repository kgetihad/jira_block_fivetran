view: active_volume {
  sql_table_name: fivetran_log.active_volume ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: connector_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.connector_id ;;
  }

  dimension: destination_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.destination_id ;;
  }

  dimension_group: measured {
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
    sql: ${TABLE}.measured_at ;;
  }

  dimension: monthly_active_rows {
    type: number
    sql: ${TABLE}.monthly_active_rows ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_name ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      table_name,
      schema_name,
      connector.connector_name,
      connector.connector_id,
      destination.name,
      destination.id
    ]
  }
}
