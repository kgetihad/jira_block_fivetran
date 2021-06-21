view: issue {
  sql_table_name: jira.issue ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

#   dimension: external_issue_id {
#     type: string
#     sql: ${TABLE}.external_issue_id ;;
#   }

  dimension: _original_estimate {
    type: number
    sql: ${TABLE}._original_estimate ;;
  }

  dimension: root_cause_defined {
    type: string
    case: {
      when: {
        sql: ${TABLE}.root_cause_defined_ =12643;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.root_cause_defined_ =12644;;
        label: "No"
      }
      else: "None"
    }
    }

  dimension: product_squad {
    type: number
    sql: ${TABLE}.product_squad ;;
  }


dimension: Process_efficiency_i_e_tat_post_implementation_expected_value {
  sql: ${TABLE}.Process_efficiency_i_e_tat_post_implementation_expected_value ;;
}

  dimension: process_efficiency_i_e_tat_pre_implementation_value {
    sql: ${TABLE}.process_efficiency_i_e_tat_pre_implementation_value ;;
  }

  dimension: process_efficency_i_e_tat_realization_period {
    sql: ${TABLE}.process_efficency_i_e_tat_realization_period ;;
  }

  dimension: count_of_departments_affected_post_implementation_expected_value {
    sql: ${TABLE}.count_of_departments_affected_post_implementation_expected_value ;;
  }

  dimension: count_of_departments_affected_pre_implementation_expected_value {
    sql: ${TABLE}.count_of_departments_affected_pre_implementation_expected_value ;;
  }

  dimension: departments_affected_realization_period {
    sql: ${TABLE}.departments_affected_realization_period ;;
  }

  dimension: count_of_segments_affected_post_implementation_expected_value {
    sql: ${TABLE}.count_of_segments_affected_post_implementation_expected_value ;;
  }

  dimension:count_of_segments_affected_pre_implementation_expected_value {
    sql: ${TABLE}.count_of_segments_affected_pre_implementation_expected_value ;;
  }

  dimension: segments_affected_realization_period {
    sql: ${TABLE}.segments_affected_realization_period ;;
  }

  dimension: level_of_implementation_urgency_post_implementation_expected_value{
    sql: ${TABLE}.level_of_implementation_urgency_post_implementation_expected_value ;;
  }

  dimension:level_of_implementation_urgency_pre_implementation_value {
    sql: ${TABLE}.level_of_implementation_urgency_pre_implementation_value ;;
  }

  dimension:count_of_people_involved_post_implementation_value {
    sql: ${TABLE}.count_of_people_involved_post_implementation_value ;;
  }

  dimension:count_of_people_involved_pre_implementation_value {
    sql: ${TABLE}.count_of_people_involved_pre_implementation_value ;;
  }

  dimension: employee_productivity_i_e_rework_percentage_post_implementation_value {
    sql: ${TABLE}.employee_productivity_i_e_rework_percentage_post_implementation_value ;;
  }

  dimension: employee_productivity_i_e_rework_percentage_pre_implementation_value{
    sql: ${TABLE}.employee_productivity_i_e_rework_percentage_pre_implementation_value ;;
  }

  dimension:employee_productivity_i_e_rework_realization_period {
    sql: ${TABLE}.employee_productivity_i_e_rework_realization_period ;;
  }

  dimension:customer_satisfaction_rate_percentage_post_implementation_value {
    sql: ${TABLE}.customer_satisfaction_rate_percentage_post_implementation_value ;;
  }

  dimension:customer_satisfaction_rate_percentage_pre_implementation_value {
    sql: ${TABLE}.customer_satisfaction_rate_percentage_pre_implementation_value ;;
  }

  dimension:customer_satisfaction_rate_realization_period {
    sql: ${TABLE}.customer_satisfaction_rate_realization_period ;;
  }

  dimension: customer_waiting_time_minutes_post_implementation_value {
    sql: ${TABLE}.customer_waiting_time_minutes_post_implementation_value ;;
  }

  dimension:customer_waiting_time_minutes_pre_implementation_value{
    sql: ${TABLE}.customer_waiting_time_minutes_pre_implementation_value ;;
  }

  dimension:customer_waiting_time_realization_period {
    sql: ${TABLE}.customer_waiting_time_realization_period ;;
  }

dimension: IsInward {
  type: string
  case: {
    when: {
      sql: ${reporter} in ('t.allaham','z.asfour', 'h.mustafa','t.ayoub');;
      label: "Inward"
  }
  else: "Outward"
  }}

  dimension: issue_type {
    type: string
    sql: ${TABLE}.issue_type ;;
  }

  dimension: issue_key {
    type: string
    sql: ${TABLE}.key ;;
    drill_fields: [issue_key, assignee, created_date]
  }

  dimension: _remaining_estimate {
    type: number
    sql: ${TABLE}._remaining_estimate ;;
  }

  dimension: _time_spent {
    type: number
    sql: ${TABLE}._time_spent ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}.assignee ;;
    drill_fields: [issue_key,status,created_date,is_issue_resolved,minutes_to_resolve_issue]
  }



  dimension: reporter {
    type: string
    sql: ${TABLE}.reporter ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: SLAOLA  {
    type: string
    case: {
      when: {
        sql: (${reporter} in (select username from team)) AND ${reporter} != ${assignee} ;;
        label: "OLA"
      }
      # Possibly more when statements
      else: "SLA"
    }
  }
  dimension_group: created {
    group_label: "Dates"
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
    sql: ${TABLE}.created ;;
  }


  dimension: department {
    hidden: yes
    type: number
    sql: ${TABLE}.op_department ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: due {
    group_label: "Dates"
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
    sql: ${TABLE}.due_date ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
  }



  dimension: original_estimate {
    type: number
    sql: ${TABLE}.original_estimate ;;
  }

  dimension: priority {
    type: number
    hidden: yes
    sql: ${TABLE}.priority ;;

  }

  dimension: project {
    label: "Current Project"
    hidden: yes
    type: number
    sql: ${TABLE}.project ;;
  }

  dimension: resolution {
    group_label: "Resolution"
    hidden: no
    type: number
    sql: ${TABLE}.resolution ;;
  }


  dimension: is_duplicate {
    group_label: "Resolution"
    type: yesno
    sql: ${TABLE}.resolution =10002;;
  }

  dimension: is_known_error {
    group_label: "Resolution"
    type: yesno
    sql: ${TABLE}.resolution =10300;;
  }


  dimension_group: resolved {
    group_label: "Resolution"
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
    sql: ${TABLE}.resolved ;;
  }

  # Additional field for a simple way to determine
  # if an issue is resolved
  dimension: is_issue_resolved {
    group_label: "Resolution"
    type: yesno
    sql: ${resolved_date} IS NOT NULL ;;
  }

  measure: count_of_resolved {
    type: count
    filters: {
      field: is_issue_resolved
      value: "Yes"

    }
  }


  # Custom dimensions for time to resolve issue
  dimension: hours_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Hours)"
    type: number
    sql: DATEDIFF(h,${created_raw},${resolved_raw}) ;;
    value_format_name: decimal_0
  }

  dimension: minutes_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Minutes)"
    type: number
    sql: DATEDIFF(m,${created_raw},${resolved_raw}) ;;
    value_format_name: decimal_0
  }

  dimension: days_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Days)"
    type: number
    sql: DATEDIFF(d,${created_raw},${resolved_raw}) ;;
    value_format_name: decimal_0
  }

  measure: total_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Total Time to Resolve Issues per Grouping"
    description: "The total hours required to resolve all issues in the chosen dimension grouping"
    type: sum
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: avg_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Avg Time to Resolve Issues per Grouping"
    description: "The average hours required to resolve all issues in the chosen dimension grouping"
    type: average
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  # dimension: severity {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.severity ;;
  # }

  dimension: status {
    hidden: yes
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: story_points {
    type: number
    sql: ${TABLE}.story_points ;;
  }

  dimension: recurring {
    type: number
    sql: 1.00 * ${TABLE}.recurring_ ;;
  }

  dimension: number_of_occurence {
    type: string
    case: {
      when: {
        sql: ${recurring} = 12610 ;;
        label: "1"
      }
      when: {
        sql: ${recurring} = 12613 ;;
        label: "2"
      }
      when: {
        sql: ${recurring} = 12612 ;;
        label: "3"
      }
      when: {
        sql: ${recurring} = 12611 ;;
        label: "2"
      }
      when: {
        sql: ${recurring} = 12613 ;;
        label: "4"
      }
      when: {
        sql: ${recurring} = 12614 ;;
        label: "5"
      }
      else: "0"
    }
  }

  dimension: covered_by_nagios {
    type: yesno
    sql: ${TABLE}.covered_by_nagios_ ;;
  }

  measure: total_story_points {
    type: sum
    sql: ${story_points} ;;
  }



# # measure: total_open_story_points {
#    type: sum
#    sql: ${story_points} ;;
##    filters: {
#      field: status.name
#      value:"Open, In Progress, In Development, In QA, In Review"
#    }
#  }

#  measure: total_closed_story_points {
#    type: sum
#    sql: ${story_points} ;;
#    filters: {
#      field: status.name
#      value:"Closed, Done, Ready for Production"
#    }
#  }

  dimension_group: updated {
    group_label: "Dates"
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
    sql: ${TABLE}.updated ;;
  }

  measure: count {
    type: count

    drill_fields: [issue_key, assignee, reporter, created_date,priority.name, recurring, IsInward, covered_by_nagios, issue_labels.value ]


 }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [issue_key, assignee, reporter, created_date,priority.name, recurring, IsInward, covered_by_nagios, issue_labels.value ]


  }

  # ----- Sets of fields for drilling ------
  #set: detail {
  #  fields: [
  #    external_issue_id,
  #  ]
  #}

}
