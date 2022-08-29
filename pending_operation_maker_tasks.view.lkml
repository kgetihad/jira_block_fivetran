view: pending_operation_maker_tasks {
  derived_table: {
    sql: select  s.id as ID,parent_id as Request_ID,loan_type_name,arabic_name,status_name as Status,assigned_at
      from appian_prod_data.lm_request_details_report_view s
      INNER JOIN lm_request_details r on s.customer_id=r.customer_id
      INNER JOIN lm_auditlog l on r.id=l.parent_id
      where loan_type in (11,12,13)  and (s.status=9 or s.status=28)
      order by assigned_at desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: request_id {
    type: string
    sql: ${TABLE}.Request_ID ;;
  }

  dimension: loan_type_name {
    type: string
    sql: ${TABLE}.loan_type_name ;;
  }

  dimension: arabic_name {
    type: string
    sql: ${TABLE}.arabic_name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension_group: assigned_at {
    type: time
    sql: ${TABLE}.assigned_at ;;
  }

  set: detail {
    fields: [
      id,
      request_id,
      loan_type_name,
      arabic_name,
      status,
      assigned_at_time
    ]
  }
}
