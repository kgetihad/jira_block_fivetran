connection: "jiradb"

# include all the views
include: "*.view"
include: "/views/issue_is_the_solution_scalable_.view.lkml"
# include all the dashboards
include: "*.dashboard"
include: "/views/team_tickets_test.view.lkml"
include: "/views/issue.view.lkml"

datagroup: fivetran_datagroup {
  sql_trigger: SELECT max(date_trunc('minute', done)) FROM jira.fivetran_audit ;;
  max_cache_age: "24 hours"
}

persist_with: fivetran_datagroup

explore: technology_team {

  persist_for:: "24 hours"
  view_label: "Tech | Team"
  label: "Tech | Team"
  from :  team

  join: incidents_table {
    view_label: "Team | Incidents"
    sql_on: ${technology_team.accountid} = ${incidents_table.name} ;;
    relationship: one_to_one
    type: left_outer
  }

  join: team_tickets {
    type: left_outer
    view_label: "Team | Tickets"
    relationship: many_to_many
    sql_on: ${team_tickets.user_id}=${technology_team.accountid} ;;
  }

  join : issue {
    view_label: "Jira | Issues"
    type: left_outer
    relationship: many_to_many
    sql_on: ${issue.id}=${team_tickets.issue_id} ;;
  }



  join: status {
    view_label: "Team | Issue Status"
    type: left_outer
    relationship: many_to_one
    sql_on: ${status.id}=${issue.status} ;;
  }


  join: team_tickets_calc {
    view_label: "Team | Department Calcuation"
    type: left_outer
    relationship: one_to_one
    sql_on: ${team_tickets_calc.sub_dep}  = ${technology_team.sub_dep}

    ;;
  }


  join: project_score_team {
    view_label: "Team | Project Contributors"
    type: left_outer
    relationship: one_to_many
    sql_on: ${project_score_team.username}  = ${technology_team.accountid};;
  }

  join: project_score {
    view_label: "Team | Project"
    type: left_outer
    relationship: one_to_many
    sql_on: ${project_score.project}  = ${project_score_team.project};;
  }

}


explore: siebel_srv {}
explore: app_srv {}

explore: all_services_app_siebel {}
explore: sprint {
  join: issue_sprint {
    type:  left_outer
    sql_on: ${sprint.id} = ${issue_sprint.sprint_id} ;;
    relationship: one_to_many
  }
  join: issue {
    type:  left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue.id} ;;
    relationship: one_to_many
  }

}
explore: app_subscriber_branch {}
explore: project_raw_data {}
explore: app_branch_srv_mule_test {}
explore: app_branch_srv {}
explore: issue_assignee_history {}
explore: issue_status_history {}
# explore: field_option {}

# Update based on how you are associating versions to
explore: version {
  join: issue_fix_version {
    type: left_outer
    relationship: one_to_many
    sql_on: ${version.id} = ${issue_fix_version.version_id} ;;
  }
  join: issue {
    type: left_outer
    relationship: one_to_one
    sql_on: ${issue_fix_version.issue_id} = ${issue.id} ;;
  }
}

explore: issue_history_2 {
  label: "Issue History"
#  fields: [ALL_FIELDS*, -issue.total_open_story_points,-issue.total_closed_story_points]
  view_name: issue

# #  always_filter: {
#     filters: {
#       field: issue.id
#       value: ""
#     }
#   }

  join: issue_history_all {
    type:  left_outer
    sql_on: ${issue.id} = ${issue_history_all.issue_id} ;;
    relationship: many_to_one
  }

  join: issue_status_history {
    type: left_outer
    sql_on: ${issue.id}=${issue_status_history.issue_id} ;;
    relationship: many_to_one
  }

  join: issue_assignee_history {
    type: left_outer
    sql_on: ${issue.id}=${issue_assignee_history.issue_id} ;;
    relationship: many_to_one

  }

  join:  status {
    type:  left_outer
    sql_on: ${issue_status_history.status_id} = ${status.id} ;;
    relationship: many_to_one
  }

  join: resolution {
    relationship: one_to_one
    sql_on: ${issue.resolution} = ${resolution.id} ;;
  }


  join: project {
    type: left_outer
    sql_on: ${issue.project}=project.id;;
    relationship: many_to_one
  }

}

explore: time_assigned_per_assignee {
  join: team {
    relationship: one_to_one
    sql_on: ${time_assigned_per_assignee.user_id}= ${team.accountid};;
  }

  join: target {
    relationship: one_to_one
    sql_on: ${target.team}=${team.dep} ;;
  }

  join: issue {
    relationship: one_to_one
    sql_on: ${time_assigned_per_assignee.issue_id}=${issue.id} ;;
  }
}

### CURRENT OVERVIEW OF STATUS OF PROJECTS, ISSUES, AND ISSUE FACTS (E.G. # OF COMMENTS)
explore: project {
  join: issue {
    type:  left_outer
    sql_on: ${project.id} = ${issue.project} ;;
    relationship: many_to_one
  }
  join: product_squad {
    from: field_option
    view_label: "Field | Product Squad"
    relationship: one_to_one
    sql_on: ${issue.product_squad} = ${product_squad.id} ;;
  }
  join: resolution {
    relationship: one_to_one
    sql_on: ${issue.resolution} = ${resolution.id} ;;
  }


  join: issue_expected_1_history {
    relationship: one_to_one
    sql_on: ${issue.id} = ${issue_expected_1_history.issue_id} ;;
  }

  join: parent_issue {
    from: issue
    type: left_outer
    relationship: one_to_many
    sql_on: ${parent_issue.id} = ${issue.parent_id};;
  }

  join: parent_issue_details {
    from: issue
    type: left_outer
    relationship: one_to_one
    sql_on: ${parent_issue.id} = ${parent_issue_details.id} ;;
  }

  join: issue_fix_versions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${issue_fix_versions.issue_id} = ${issue.id} ;;
  }

  join: branch_name {
    from: field_option
    view_label: "Issue Branch name"
    relationship: one_to_one
    sql_on: ${issue.branch}= ${branch_name.id};;
  }

  join: call_purpose {
    from: field_option
    view_label: "Issue Call Purpose"
    relationship: one_to_one
    sql_on: ${issue.call_purpose}= ${call_purpose.id};;
  }

  # join: follow_up_type {
  #   from: field_option
  #   view_label: "Issue Follow Up Type"
  #   relationship: one_to_one
  #   sql_on: ${issue.follow_up_type}= ${follow_up_type.id};;
  # }



  join: version {

    relationship: one_to_one
    sql_on: ${issue_fix_versions.version_id}= ${version.id};;
  }

join: issue_primary_assignees {
  type: left_outer
  relationship: many_to_one
  sql_on: ${issue_primary_assignees.issue_id}=${issue.id} ;;
}

  join: issue_secondary_assignee {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_secondary_assignee.issue_id}=${issue.id} ;;
  }

  join: epic {
    type: left_outer
    relationship: one_to_one
    sql_on: ${epic.id}=${issue.epic_link} ;;
  }

  join: customer_satisfaction_realization_period {
    from: field_option
    view_label: "Field | Customer Satisfaction Realization Period"
    relationship: one_to_one
    sql_on: ${issue.customer_satisfaction_rate_realization_period} = ${customer_satisfaction_realization_period.id} ;;
  }

  join: customer_waiting_time_realization_period {
    from: field_option
    view_label: "Field | Customer Waiting Time Realization Period"
    relationship: one_to_one
    sql_on: ${issue.customer_waiting_time_realization_period} = ${customer_waiting_time_realization_period.id} ;;
  }

  join: departments_affected_realization_period {
    from: field_option
    view_label: "Field | Department Affected Realization Period"
    relationship: one_to_one
    sql_on: ${issue.departments_affected_realization_period} = ${departments_affected_realization_period.id} ;;
  }

  join: employee_productivity_i_e_rework_realization_period {
    from: field_option
    view_label: "Field | Employee Productivity Rework Realization Period"
    relationship: one_to_one
    sql_on: ${issue.employee_productivity_i_e_rework_realization_period} = ${employee_productivity_i_e_rework_realization_period.id} ;;
  }

  join: process_efficency_i_e_tat_realization_period {
    from: field_option
    view_label: "Field | Process Efficiency TAT Realization Period"
    relationship: one_to_one
    sql_on: ${issue.process_efficency_i_e_tat_realization_period} = ${process_efficency_i_e_tat_realization_period.id} ;;
  }

  join: segments_affected_realization_period {
    from: field_option
    view_label: "Field | Segments Affected Realization Period"
    relationship: one_to_one
    sql_on: ${issue.segments_affected_realization_period} = ${segments_affected_realization_period.id} ;;
  }


  join: issue_is_the_solution_scalable_ {
    # from: issue_is_the_solution_scalable_
    view_label: "Field | Is The Solution Scalable"
    relationship: one_to_one
    sql_on: ${issue.id} = ${issue_is_the_solution_scalable_.issue_id} ;;
  }

  join: issue_assignee_history {
    type: left_outer
    sql_on: ${issue.id}=${issue_assignee_history.issue_id} ;;
    relationship: one_to_many
  }

  join: time_assigned_per_assignee {
    relationship: one_to_many
    sql_on: ${issue.id} = ${time_assigned_per_assignee.issue_id} and  ${issue_assignee_history.user_id} = ${time_assigned_per_assignee.user_id};;
  }


  join: team {
    type: left_outer
    relationship: one_to_one
    sql_on: ${team.accountid}=${issue_assignee_history.user_id} and ${team.accountid}=${time_assigned_per_assignee.user_id} ;;
  }

  join: incidents_table {
    relationship: one_to_one
    sql_on: ${team.accountid}=${incidents_table.name} ;;
  }

  join: directors {
    relationship: one_to_many
    sql_on: ${directors.dept}=${team.dep} ;;
  }

  join: team2 {
    type: left_outer
    relationship: many_to_one
    sql_on:  ${team2.accountid}=${issue.assignee};;
  }

  join: target {
    relationship: one_to_one
    sql_on: ${team.dep} = ${target.team} AND ${priority.name} = ${target.priority} and ${issue.SLAOLA} = ${target.issla};;
#     sql_where:   ${issue.priority} = ${target.priority};;
  }

  join: issue_status_history {
    type: left_outer
    sql_on: ${issue_status_history.issue_id}=${issue_assignee_history.issue_id} ;;
    relationship: many_to_many
  }
  join: issue_labels {
    type:  left_outer
    sql_on: ${issue.id}=${issue_labels.issue_id} ;;
    relationship: one_to_many
  }

  join: temp2 {
    type: left_outer
    relationship: many_to_many
    sql_on: ${temp2.CTE_issue_id_1}=${issue_assignee_history.issue_id} ;;
  }



  join:  issue_type {
    type:  left_outer
    sql_on: ${issue.issue_type} = ${issue_type.id} ;;
    relationship: many_to_one
  }
  join: issue_sprint {
    type: left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue.id} ;;
    relationship: many_to_one
  }
  join: sprint {
    from: sprint_details
    type: left_outer
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
    relationship: many_to_one
  }
  join:  priority {
    type:  left_outer
    sql_on: ${issue.priority} = ${priority.id} ;;
    relationship: many_to_one
  }
  join:  status {
    type:  left_outer
    sql_on: ${issue.status} = ${status.id} ;;
    relationship: many_to_one
  }
  join:  status_category {
    type:  left_outer
    sql_on: ${status.status_category_id} = ${status_category.id} ;;
    relationship: many_to_one
  }

  join: issue_link {
    type: left_outer
    relationship: one_to_many
    sql_on: ${issue_link.issue_id} = ${issue.id};;
  }

  join: linked_issue_details {
    from: issue
    type: left_outer
    relationship: one_to_one
    sql_on: ${issue_link.related_issue_id} = ${linked_issue_details.id} ;;
  }

  ### AS OF NOW, FACT TABLE ONLY INCLUDES COMMENT INFORMATION - SHOULD MAKE THIS A GIANT DERIVED TABLE
  ### WITH FACTS FROM ALL ISSUE-RELATED TABLES SUCH AS PRIORITY, TYPE, ETC.

  join:  issue_comment_facts {
    type:  left_outer
    sql_on: ${issue.id} = ${issue_comment_facts.issue_id} ;;
    relationship: many_to_one
  }

}


### HISTORICAL OVERVIEWS

explore: sprint_by_date {
  label: "Sprint History"

  join: issue {
    view_label: "Issue"
    type: left_outer
    sql_on: ${sprint_by_date.issue_id} = ${issue.id} ;;
    relationship: many_to_one
  }

  ### JOIN SINGULAR TABLES WITH NO ASSOCIATED HISTORY TABLES

  join: issue_type {
    type: left_outer
    sql_on: ${issue.issue_type} = ${issue_type.id} ;;
    relationship: many_to_one
  }

  join: priority {
    view_label: "Issue Priority"
    type: left_outer
    sql_on: ${issue.priority} = ${priority.id} ;;
    relationship: many_to_one
  }

  join: sprint {
    type: left_outer
    sql_on: ${sprint.id} = ${sprint_by_date.sprint_id} ;;
    relationship: many_to_one
  }

  join: sprint_details {
    type: left_outer
    sql_on: ${sprint_details.id} = ${sprint_by_date.sprint_id} ;;
    relationship: many_to_one
  }

  join: status {
    view_label: "Issue Status"
    type: left_outer
    sql_on: ${status.id} = ${issue.status} ;;
    relationship: many_to_one
  }

  join: status_category {
    view_label: "Issue Status"
    type: left_outer
    sql_on: ${status.status_category_id} = ${status_category.id} ;;
    relationship: many_to_one
  }
}


explore: team_incidents {
  join: team {
    sql_on: ${team.username} = ${team_incidents.assignee} ;;
    relationship: one_to_one
  }
}

explore: sprint_burndown {
  view_name: looker_calendar
  join: issue {
    type: left_outer
    sql_on:
    ${looker_calendar.series_date_raw} >= ${issue.created_raw}
    AND ${looker_calendar.series_date_raw} <= NVL(${issue.resolved_raw},current_date)
    ;;
    relationship: one_to_many
  }
  join: issue_sprint {
    type: left_outer
    sql_on: ${issue.id} = ${issue_sprint.issue_id} ;;
    relationship: one_to_many
  }
  join: sprint {
    type: left_outer
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
    relationship: many_to_one
  }
  join: sprint_start_points {
    type: left_outer
    sql_on: ${sprint.id} = ${sprint_start_points.id} ;;
    relationship: one_to_one
  }

  join:  status {
    type:  left_outer
    sql_on: ${issue.status} = ${status.id} ;;
    relationship: many_to_one
  }

  sql_always_where:
   ${looker_calendar.series_date_raw} >= ${sprint.start_raw}
  AND ${looker_calendar.series_date_raw} <= ${sprint.end_raw}
  ;;
  #always_filter: {
  #  filters: {
  #    field: sprint.name
  #    value: "Data Sprint 5"
  #  }
  #}

}

explore: team {
  join: incidents_table {
    type: left_outer
    sql_on: ${team.accountid} = ${incidents_table.name} ;;
    relationship: one_to_one
  }
}
explore: project_score {
  join: team {
    type: left_outer
    sql_on: ${team.name} = ${project_score.team} ;;
    relationship: one_to_one
  }
  join: legands {
    type: left_outer
    relationship: one_to_one
    sql_on: ${legands.legend} = ${project_score.deviation_in_weeks} AND ${legands.type}='deviation_weeks' ;;
  }

  join: project_score_team {
    type: left_outer
    relationship: one_to_many
    sql_on: ${project_score_team.project}=${project_score.project} ;;
  }

}
explore: legands {}


explore: sql_issue {
}
explore: test_temp {

}
explore: Temp1_time {

}
explore: temp2 {

}
explore: jira_custom_dt {}
