view: issue_is_the_solution_scalable_ {
  sql_table_name: jira.issue_is_the_solution_scalable_ ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
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

  dimension: field_option_id {
    type: number
    sql: ${TABLE}.field_option_id ;;
  }

  dimension: is_solution_scalable {
    type: string
    case: {
      when: {
        sql: ${TABLE}.field_option_id =13595;;
        label: "1"
      }

      else: "0"
    }
  }
  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
