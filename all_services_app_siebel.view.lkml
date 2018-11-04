view: all_services_app_siebel {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }


# view: all_services_app_siebel {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
         SR_SUB_AREA_ID ,
 SR_SUB_AREA       ,
 SRV_SUB_STATUS    ,
 SRV_CREATED_DATE  ,
 BRANCH_CODE       ,
 COUNT_SRV   , 'app' as source
from jira.app_srv
union all
         select SR_SUB_AREA_ID ,
 SR_SUB_AREA       ,
 SRV_SUB_STATUS    ,
 SRV_CREATED_DATE  ,
 BRANCH_CODE       ,
 COUNT_SRV   , 'siebel' as source
from jira.SIEBEL_SRV

      ;;
  }

  dimension: branch_code {
    type: string
    sql: ${TABLE}.branch_code ;;
    drill_fields: [sr_sub_area,count]
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

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
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
    type: sum
    sql: ${count_srv} ;;
    drill_fields: [branch_code,srv_created_week,count]
  }


  }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
