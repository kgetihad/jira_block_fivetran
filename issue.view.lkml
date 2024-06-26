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

  dimension: actual {
    type: string
    sql: ${TABLE}.actual ;;
  }

  dimension: Actual_Clean {
    type: number
    sql: regexp_replace(${actual},'[^0-9.]', '')  ;;
  }

  dimension: expected {
    type: string
    sql: ${TABLE}.expected ;;
  }

  dimension: Expected_Clean {
    type: number
    sql: regexp_replace(${expected},'[^0-9.]', '')  ;;
  }


  dimension: epic_link {
    type: string
    sql: ${TABLE}.epic_link ;;
  }


  dimension: baseline {
    type: string
    sql: ${TABLE}.baseline ;;
  }

  dimension: Baseline_Clean {
    type: number
    sql: regexp_replace(${baseline},'[^0-9.]', '')  ;;
  }

  dimension: change_percentage {
    type: number
    sql: ${TABLE}.change_ ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: parent_key {
    type: string
    sql: (select key from jira.issue where ${TABLE}.id = ${parent_id}) ;;
  }

  dimension: fix_version {
    type: string
    sql: ${TABLE}.fix_version ;;
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

  dimension: date_q {
    type: date
    sql: date_trunc('Year',${created_date});;
  }

  dimension: product_squad_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.product_squad =13382;;
        label: "Daily Banking"
      }
      when: {
        sql: ${TABLE}.product_squad =13383;;
        label: "CVM"
      }
      when: {
        sql: ${TABLE}.product_squad =13617;;
        label: "Cards"
      }
      when: {
        sql: ${TABLE}.product_squad =13618;;
        label: "Churn Management"
      }
      when: {
        sql: ${TABLE}.product_squad =13619;;
        label: "Omni-channel"
      }
      when: {
        sql: ${TABLE}.product_squad =13620;;
        label: "Online Acquisition"
      }
      when: {
        sql: ${TABLE}.product_squad =13621;;
        label: "Segments and Loyalty"
      }
      when: {
        sql: ${TABLE}.product_squad =13622;;
        label: "Transactional Banking"
      }
      else: "null"
    }
  }


dimension: Process_efficiency_i_e_tat_post_implementation_expected_value {
  type: number
  sql: nvl(${TABLE}.Process_efficiency_i_e_tat_post_implementation_expected_value,1) ;;
}

  dimension: process_efficiency_i_e_tat_pre_implementation_value {
    type: number
    sql: nvl(${TABLE}.process_efficiency_i_e_tat_pre_implementation_value,1) ;;
  }

  dimension: process_efficency_i_e_tat_realization_period {
    sql: ${TABLE}.process_efficency_i_e_tat_realization_period ;;
  }

  dimension: process_efficency_i_e_tat_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.process_efficency_i_e_tat_realization_period =13493;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.process_efficency_i_e_tat_realization_period =13494;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.process_efficency_i_e_tat_realization_period =13495;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.process_efficency_i_e_tat_realization_period =13496;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: count_of_departments_affected_post_implementation_expected_value {
    sql: nvl(${TABLE}.count_of_departments_affected_post_implementation_expected_value,1) ;;
  }

  dimension: count_of_departments_affected_pre_implementation_expected_value {
    sql: nvl(${TABLE}.count_of_departments_affected_pre_implementation_expected_value,1) ;;
  }

  dimension: departments_affected_realization_period {
    sql: ${TABLE}.departments_affected_realization_period ;;
  }

dimension: departments_affected_realization_period_code {
  type: string
  case: {
    when: {
      sql: ${TABLE}.departments_affected_realization_period =13497;;
      label: "1.8"
    }
    when: {
      sql: ${TABLE}.departments_affected_realization_period =13498;;
      label: "1.7"
    }
    when: {
      sql: ${TABLE}.departments_affected_realization_period =13499;;
      label: "1.6"
    }
    when: {
      sql: ${TABLE}.departments_affected_realization_period =13500;;
      label: "1.5"
    }
    else: "0"
  }
}
  dimension: count_of_segments_affected_post_implementation_expected_value {
    sql: nvl(${TABLE}.count_of_segments_affected_post_implementation_expected_value,1) ;;
  }

  dimension:count_of_segments_affected_pre_implementation_expected_value {
    sql:nvl(${TABLE}.count_of_segments_affected_pre_implementation_expected_value,1) ;;
  }

  dimension: segments_affected_realization_period {
    sql: ${TABLE}.segments_affected_realization_period ;;
  }

  dimension: segments_affected_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.segments_affected_realization_period =13501;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.segments_affected_realization_period =13502;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.segments_affected_realization_period =13503;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.segments_affected_realization_period =13504;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: level_of_implementation_urgency_post_implementation_expected_value{
    sql: nvl(${TABLE}.level_of_implementation_urgency_post_implementation_expected_value,1) ;;
  }

  dimension:level_of_implementation_urgency_pre_implementation_value {
    sql: nvl(${TABLE}.level_of_implementation_urgency_pre_implementation_value,1) ;;
  }

  dimension:count_of_people_involved_post_implementation_value {
    sql: nvl(${TABLE}.count_of_people_involved_post_implementation_value,1) ;;
  }

  dimension:count_of_people_involved_pre_implementation_value {
    sql: nvl(${TABLE}.count_of_people_involved_pre_implementation_value,1) ;;
  }

  dimension:number_of_people_involved_realization_period {
    sql: ${TABLE}.count_of_people_realization_period ;;
  }

  dimension: number_of_people_involved_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.number_of_people_involved_realization_period =13509;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.number_of_people_involved_realization_period =13510;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.number_of_people_involved_realization_period =13511;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.number_of_people_involved_realization_period =13512;;
        label: "1.5"
      }
      else: "0"
    }
  }



  dimension: employee_productivity_i_e_rework_percentage_post_implementation_value {
    sql: nvl(${TABLE}.employee_productivity_i_e_rework_percentage_post_implementation_value,1) ;;
  }

  dimension: employee_productivity_i_e_rework_percentage_pre_implementation_value{
    sql: nvl(${TABLE}.employee_productivity_i_e_rework_percentage_pre_implementation_value,1) ;;
  }

  dimension:employee_productivity_i_e_rework_realization_period {
    sql: ${TABLE}.employee_productivity_i_e_rework_realization_period ;;
  }

  dimension: issue_is_the_solution_scalable_ {
    sql: ${TABLE}.issue_is_the_solution_scalable_ ;;
  }

  dimension: employee_productivity_i_e_rework_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.employee_productivity_i_e_rework_realization_period =13513;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.employee_productivity_i_e_rework_realization_period =13514;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.employee_productivity_i_e_rework_realization_period =13515;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.employee_productivity_i_e_rework_realization_period =13516;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension:customer_satisfaction_rate_percentage_post_implementation_value {
    sql: nvl(${TABLE}.customer_satisfaction_rate_percentage_post_implementation_value,1) ;;
  }

  dimension:customer_satisfaction_rate_percentage_pre_implementation_value {
    sql: nvl(${TABLE}.customer_satisfaction_rate_percentage_pre_implementation_value,1) ;;
  }

  dimension:customer_satisfaction_rate_realization_period {
    sql: ${TABLE}.customer_satisfaction_rate_realization_period ;;
  }

  dimension: customer_satisfaction_rate_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.customer_satisfaction_rate_realization_period =13521;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.customer_satisfaction_rate_realization_period =13522;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.customer_satisfaction_rate_realization_period =13523;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.customer_satisfaction_rate_realization_period =13524;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: customer_waiting_time_minutes_post_implementation_value {
    sql: nvl(${TABLE}.customer_waiting_time_minutes_post_implementation_value,1) ;;
  }

  dimension:customer_waiting_time_minutes_pre_implementation_value{
    sql: nvl(${TABLE}.customer_waiting_time_minutes_pre_implementation_value,1) ;;
  }

  dimension: customer_waiting_time_realization_period {
        sql: ${TABLE}.customer_waiting_time_realization_period ;;

  }
  dimension:customer_waiting_time_realization_period_code {
    # sql: ${TABLE}.customer_waiting_time_realization_period ;;
    type: string
    case: {
      when: {
        sql: ${TABLE}.customer_waiting_time_realization_period =13525;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.customer_waiting_time_realization_period =13526;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.customer_waiting_time_realization_period =13527;;
        label: "1.6"
        }
      when: {
        sql: ${TABLE}.customer_waiting_time_realization_period =13527;;
        label: "1.5"
        }
      else: "0"
    }
  }

  dimension: business_case_title {
    sql: ${TABLE}.business_case_title ;;
  }

  dimension: Tribe_department_name {
    sql: ${TABLE}.Tribe_department_name ;;
  }

  dimension: Tribe_department_name_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.Tribe_department_name =13373;;
        label: "Digital Services"
      }
      when: {
        sql: ${TABLE}.Tribe_department_name =13374;;
        label: "Digital Products"
      }
      when: {
        sql: ${TABLE}.Tribe_department_name =13384;;
        label: "Department"
      }
      else: "null"
    }
  }


  dimension: department_name {
    sql: ${TABLE}.department_name ;;
  }

  dimension: department_name_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.department_name =12915;;
        label: "Technology"
      }
      when: {
        sql: ${TABLE}.department_name =12916;;
        label: "Technology | Technology Department Management"
      }
      when: {
        sql: ${TABLE}.department_name =12917;;
        label: "Technology | Digital Channels"
      }
      when: {
        sql: ${TABLE}.department_name =12918;;
        label: "Technology | Enterprise Operations"
      }
      when: {
        sql: ${TABLE}.department_name =12919;;
        label: "Technology | DevOps"
      }
      when: {
        sql: ${TABLE}.department_name =12920;;
        label: "Technology | Data Science"
      }
      when: {
        sql: ${TABLE}.department_name =12921;;
        label: "Technology | Integrations"
      }
      when: {
        sql: ${TABLE}.department_name =12922;;
        label: "Technology | Enterprise Solutions"
      }
      when: {
        sql: ${TABLE}.department_name =12923;;
        label: "Technology | Core Systems"
      }
      else: "Other Departments"
    }
  }

  dimension: category_type {
    sql: ${TABLE}.category_type ;;
  }

  dimension: category_type_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.category_type =13386;;
        label: "Product"
      }
      when: {
        sql: ${TABLE}.category_type =13385;;
        label: "Process"
      }
      else: "null"
    }
  }

  dimension: services_squad {
    sql: ${TABLE}.services_squad ;;
  }

  dimension: services_squad_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.services_squad =13375;;
        label: "Process Transformation"
      }
      when: {
        sql: ${TABLE}.services_squad =13376;;
        label: "Payment"
      }
      when: {
        sql: ${TABLE}.services_squad =13377;;
        label: "Business Lending"
      }
      when: {
        sql: ${TABLE}.services_squad =13378;;
        label: "Retail Lending"
      }
      when: {
        sql: ${TABLE}.services_squad =13379;;
        label: "CRM"
      }
      when: {
        sql: ${TABLE}.services_squad =13380;;
        label: "In-Person Acquisition"
      }
      else: "null"
    }
  }

# dimension: branch_name {
#   type: string
#   sql: ${branch_name}.name ;;

# }

  dimension: branch {
    type: number
    sql: ${TABLE}.branch ;;

  }

  dimension: call_purpose {
    type: number
    sql: ${TABLE}.call_purpose ;;

  }

  dimension: follow_up_type {
    type: number
    sql: ${TABLE}.follow_up_type_ ;;

  }

  dimension: customer_cif {
    type: string

    sql: ${TABLE}.customer_cif_ ;;

  }

  dimension: time_to_first_response {
    type: string
    sql: ${TABLE}.time_to_first_response ;;

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

  dimension: vulnerability_severity {
    type: string
    sql: ${TABLE}.vulnerability_severity ;;
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

  dimension: appian_customer_cif {
    type: string
    sql: ${TABLE}.customer_cif_ ;;
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

 dimension: customer_engagement_and_activity_level_of_impact {
    type: number
    sql: nvl(${TABLE}.customer_engagement_and_activity_level_of_impact,1) ;;
  }

  dimension: customer_engagement_and_activity_pre_implementation_value {
    type: number
    sql: nvl(${TABLE}.customer_engagement_and_activity_pre_implementation_value,1) ;;
  }

  dimension: customer_engagement_and_activity_post_implementation_value {
    type: number
    sql: nvl(${TABLE}.customer_engagement_and_activity_post_implementation_value,1) ;;
  }

  dimension: customer_engagement_and_activity_realization_period {
    sql: ${TABLE}.customer_waiting_time_realization_period ;;
  }

  dimension: customer_engagement_and_activity_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.customer_engagement_and_activity_realization_period =14011;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.customer_engagement_and_activity_realization_period =14012;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.customer_engagement_and_activity_realization_period =14013;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.customer_engagement_and_activity_realization_period =14014;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: quality_of_the_process_pre_implementation_value {
    type: number
    sql: nvl(${TABLE}.quality_of_the_process_pre_implementation_value,1) ;;
  }

  dimension: quality_of_the_process_post_implementation_value {
    type: number
    sql: nvl(${TABLE}.quality_of_the_process_post_implementation_value,1) ;;
  }

  dimension: quality_of_the_process_level_of_impact {
    type: number
    sql: nvl(${TABLE}.quality_of_the_process_level_of_impact,1) ;;
  }

  dimension: quality_of_the_process_realization_period {
    sql: ${TABLE}.quality_of_the_process_realization_period ;;
  }

  dimension: quality_of_the_process_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.quality_of_the_process_realization_period =13928;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.quality_of_the_process_realization_period =13929;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.quality_of_the_process_realization_period =13930;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.quality_of_the_process_realization_period =13931;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: performance_availability_pre_implementation_value {
    type: number
    sql: nvl(${TABLE}.performance_availability_pre_implementation_value,1) ;;
  }

  dimension: performance_availability_post_implementation_value {
    type: number
    sql: nvl(${TABLE}.performance_availability_post_implementation_value,1) ;;
  }

  dimension: performance_availability_level_of_impact {
    type: number
    sql: nvl(${TABLE}.performance_availability_level_of_impact,1) ;;
  }

  dimension: performance_availability_realization_period {
    sql: ${TABLE}.performance_availability_realization_period ;;
  }

  dimension: performance_availability_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.performance_availability_realization_period =13924;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.performance_availability_realization_period =13925;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.performance_availability_realization_period =13926;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.performance_availability_realization_period =13927;;
        label: "1.5"
      }
      else: "0"
    }
  }


  dimension: percentage_of_employee_satisfaction_pre_implementation_value {
    type: number
    sql: nvl(${TABLE}.percentage_of_employee_satisfaction_pre_implementation_value,1) ;;
  }

  dimension: percentage_of_employee_satisfaction_post_implementation_value {
    type: number
    sql: nvl(${TABLE}.percentage_of_employee_satisfaction_post_implementation_value,1) ;;
  }

  dimension: percentage_of_employee_satisfaction_level_of_impact {
    type: number
    sql: nvl(${TABLE}.percentage_of_employee_satisfaction_level_of_impact,1) ;;
  }

  dimension: percentage_of_employee_satisfaction_realization_period {
    sql: ${TABLE}.percentage_of_employee_satisfaction_realization_period ;;
  }

  dimension: percentage_of_employee_satisfaction_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.percentage_of_employee_satisfaction_realization_period =13942;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.percentage_of_employee_satisfaction_realization_period =13943;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.percentage_of_employee_satisfaction_realization_period =13944;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.percentage_of_employee_satisfaction_realization_period =13945;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: reduce_operational_risks_percentage_of_reduction {
    type: number
    sql: nvl(${TABLE}.reduce_operational_risks_percentage_of_reduction,1) ;;
  }

  dimension: reduce_operational_risks_level_of_impact {
    type: number
    sql: nvl(${TABLE}.reduce_operational_risks_level_of_impact,1) ;;
  }

  dimension: reduce_operational_risks_realization_period {
    sql: nvl(${TABLE}.reduce_operational_risks_realization_period,1) ;;
  }

  dimension: minimize_operational_risks_realization_period {
    sql: ${TABLE}.minimize_operational_risks_realization_period ;;
  }

  dimension: minimize_operational_risks_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.minimize_operational_risks_realization_period =13946;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.minimize_operational_risks_realization_period =13947;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.minimize_operational_risks_realization_period =13948;;
        label: "1.4"
      }
      when: {
        sql: ${TABLE}.minimize_operational_risks_realization_period =13949;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: reduce_operational_risks_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.reduce_operational_risks_realization_period =13946;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.reduce_operational_risks_realization_period =13947;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.reduce_operational_risks_realization_period =13948;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.reduce_operational_risks_realization_period =13949;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: increase_revenue_percentage_of_increase {
    type: number
    sql: nvl(${TABLE}.increase_revenue_percentage_of_increase,1) ;;
  }

  dimension: increase_revenue_level_of_impact {
    type: number
    sql: nvl(${TABLE}.increase_revenue_level_of_impact,1) ;;
  }

  dimension: increase_revenue_realization_period {
    sql: ${TABLE}.increase_revenue_realization_period ;;
  }

  dimension: increase_revenue_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.increase_revenue_realization_period =13955;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.increase_revenue_realization_period =13956;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.increase_revenue_realization_period =13957;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.increase_revenue_realization_period =13958;;
        label: "1.5"
      }
      else: "0"
    }
  }


  dimension: increase_customer_growth_percentage_of_increase {
    type: number
    sql: nvl(${TABLE}.increase_customer_growth_percentage_of_increase,1) ;;
  }

  dimension: increase_customer_growth_level_of_impact {
    type: number
    sql: nvl(${TABLE}.increase_customer_growth_level_of_impact,1) ;;
  }

  dimension: increase_customer_growth_realization_period {
    sql: ${TABLE}.increase_customer_growth_realization_period ;;
  }

  dimension: increase_customer_growth_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.increase_customer_growth_realization_period =13964;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.increase_customer_growth_realization_period =13965;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.increase_customer_growth_realization_period =13966;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.increase_customer_growth_realization_period =13967;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: increase_market_share_percentage_of_increase {
    type: number
    sql: nvl(${TABLE}.increase_market_share_percentage_of_increase,1) ;;
  }

  dimension: increase_market_share_level_of_impact {
    type: number
    sql: nvl(${TABLE}.increase_market_share_level_of_impact,1) ;;
  }

  dimension: increase_market_share_realization_period {
    sql: ${TABLE}.increase_market_share_realization_period ;;
  }

 dimension: increase_market_share_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.increase_market_share_realization_period =13991;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.increase_market_share_realization_period =13992;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.increase_market_share_realization_period =13993;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.increase_market_share_realization_period =13994;;
        label: "1.5"
      }
      else: "0"
    }
  }
  dimension: reduce_churn_percentage_of_churn_reduction {
    type: number
    sql: nvl(${TABLE}.reduce_churn_percentage_of_churn_reduction,1) ;;
  }

  dimension: reduce_churn_level_of_impact {
    type: number
    sql: nvl(${TABLE}.reduce_churn_level_of_impact,1) ;;
  }

  dimension: reduce_churn_realization_period {
    sql: ${TABLE}.reduce_churn_realization_period ;;
  }

  dimension: reduce_churn_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.reduce_churn_realization_period =13973;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.reduce_churn_realization_period =13974;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.reduce_churn_realization_period =13975;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.reduce_churn_realization_period =13976;;
        label: "1.5"
      }
      else: "0"
    }
  }

  dimension: reduce_costs_percentage_of_reduction {
    type: number
    sql: nvl(${TABLE}.reduce_costs_percentage_of_reduction,1) ;;
  }

  dimension: reduce_costs_level_of_impact {
    type: number
    sql: nvl(${TABLE}.reduce_costs_level_of_impact,1) ;;
  }

  dimension: reduce_costs_realization_period {
    sql: ${TABLE}.reduce_costs_realization_period ;;
  }

  dimension: reduce_costs_realization_period_code {
    type: string
    case: {
      when: {
        sql: ${TABLE}.reduce_costs_realization_period =13982;;
        label: "1.8"
      }
      when: {
        sql: ${TABLE}.reduce_costs_realization_period =13983;;
        label: "1.7"
      }
      when: {
        sql: ${TABLE}.reduce_costs_realization_period =13984;;
        label: "1.6"
      }
      when: {
        sql: ${TABLE}.reduce_costs_realization_period =13985;;
        label: "1.5"
      }
      else: "0"
    }
  }

}
