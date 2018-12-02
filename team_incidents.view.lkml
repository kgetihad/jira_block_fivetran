view: team_incidents {
  derived_table: {
    sql: SELECT i.key,i.id , f.name as recurrence , i.reporter , i.assignee
      FROM jira.issue as i
      JOIN jira.issue_recurring_history as r on r.issue_id = i.id
      JOIN jira.field_option as f on f.id = r.field_option_id
      JOIN jira.project as p on p.id = i.project
      WHERE p.name = 'TI'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum {
    type: sum
    sql: ${recurrence} ;;
    drill_fields: [detail*]
  }
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: recurrence {
    type: string
    sql: ${TABLE}.recurrence ;;
  }

  dimension: reporter {
    type: string
    sql: ${TABLE}.reporter ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}.assignee ;;
  }

  set: detail {
    fields: [key, id, recurrence, reporter, assignee]
  }
}
