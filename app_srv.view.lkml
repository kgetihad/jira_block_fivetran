view: app_srv {
  sql_table_name: jira.app_srv ;;

  dimension: branch_code {
    type: string
    sql: ${TABLE}.branch_code ;;
  }

  dimension: count_srv {
    type: number
    sql: ${TABLE}.count_srv ;;
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
