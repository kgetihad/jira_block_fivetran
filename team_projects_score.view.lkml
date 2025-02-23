
view: team_projects_score {
  derived_table: {
    sql: select * from jira.team_projects_score ;;
  }

  measure: count {
    type: count_distinct
    sql: ${TABLE}.key ;;
    drill_fields: [key,epic_key,epic_name,original_score,sub_dep,created_date,planned_delivery_date_date,actual_delivery_date_date,status,score,assignee_type,name]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: epic_key {
    type: string
    sql: ${TABLE}.epic_key ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: epic_name {
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: original_score {
    type: sum
    sql: ${TABLE}.original_score ;;
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

  dimension_group: fixed_version_date {
    type: time
    sql: ${TABLE}.fixed_version_date ;;
  }


  dimension_group: planned_delivery_date {
    type: time
    sql: ${TABLE}.planned_delivery_date ;;
  }

  dimension_group: actual_delivery_date {
    type: time
    sql: ${TABLE}.actual_delivery_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: score {
    type: sum
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: owner_ {
    type: string
    sql: ${TABLE}.owner_ ;;
  }

  dimension: project_size {
    type: string
    sql: ${TABLE}.project_size ;;
  }



  set: detail {
    fields: [
        id,
  key,
  epic_key,
  summary,
  epic_name,
  description,
  original_score,
  sub_dep,
  project_name,
  created_time,
  planned_delivery_date_time,
  actual_delivery_date_time,
  status,
  score,
  assignee_type,
  assignee,
  name,
  email,
  owner_
    ]
  }
}
