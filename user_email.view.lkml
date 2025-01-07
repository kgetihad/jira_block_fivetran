
view: user_email {
  derived_table: {
    sql: select * from jira.user_email ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  set: detail {
    fields: [
        account_id,
	name,
	email
    ]
  }
}
