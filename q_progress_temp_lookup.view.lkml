
view: q_progress_temp_lookup {
  derived_table: {
    sql: select * from jira.q_progress_lookup ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: q_progress_id {
    type: number
    sql: ${TABLE}.q_progress_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  set: detail {
    fields: [
        q_progress_id,
	description
    ]
  }
}
