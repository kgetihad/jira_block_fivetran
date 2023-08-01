#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: project_raw_data {
  derived_table: {
    sql: SELECT * FROM JIRA.PROJECT_RAW_DATA ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: sub_dep {
    type: string
    sql: ${TABLE}.sub_dep ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension: due_date {
    type: date
    sql: ${TABLE}.due_date ;;
  }

  dimension_group: resolved_date {
    type: time
    sql: ${TABLE}.resolved_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: assignee_type {
    type: string
    sql: ${TABLE}.assignee_type ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}.assignee ;;
  }

  set: detail {
    fields: [
        id,
	key,
	sub_dep,
	project_name,
	created_time,
	due_date,
	resolved_date_time,
	status,
	score,
	assignee_type,
	assignee
    ]
  }
}
