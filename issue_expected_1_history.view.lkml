view: issue_expected_1_history {
  derived_table: {
    sql: --select * from jira.issue_expected_history where issue_id = 400631
      --limit 10 jira.issue_salary_offer_history

      select distinct issue_id,
      first_value(value ignore nulls)
      over(partition by issue_id
      order by value desc
      rows between unbounded preceding and unbounded following)
      from (select * from jira.issue_expected_history)

      order by value
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension: first_value {
    type: string
    sql: ${TABLE}.first_value ;;
  }

  set: detail {
    fields: [issue_id, first_value]
  }
}
