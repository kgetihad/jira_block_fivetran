view: app_branch_srv_mule_test {
  sql_table_name: jira.app_branch_srv_mule_test ;;

  dimension: branch_code {
    type: string
    sql: ${TABLE}.branch_code ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: sr_sub_area {
    type: string
    sql: ${TABLE}.sr_sub_area ;;
  }

  dimension: sr_sub_area_id {
    type: number
    sql: ${TABLE}.sr_sub_area_id ;;
  }

  dimension_group: srv_created {
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
    sql: ${TABLE}.srv_created_date ;;
  }

  dimension: srv_sub_status {
    type: string
    sql: ${TABLE}.srv_sub_status ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
