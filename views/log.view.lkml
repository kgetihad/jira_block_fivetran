view: log {
  sql_table_name: fivetran_log.log ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: message_data {
    type: string
    sql: ${TABLE}.message_data ;;
  }

  dimension: message_event {
    type: string
    sql: ${TABLE}.message_event ;;
  }

  dimension_group: time_stamp {
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
    sql: ${TABLE}.time_stamp ;;
  }

  dimension: transformation_id {
    type: string
    sql: ${TABLE}.transformation_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, connector.connector_name, connector.connector_id]
  }
}
