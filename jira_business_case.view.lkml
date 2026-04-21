
view: jira_business_case {
  derived_table: {
    sql: select
        i.id as issue_id,
        i.project as project_id,
        i.request_type_,
        r2.name as resolution_name,
        r2.description as resolution_description,
        i.key,
        u.name as assignee,
        r.name as reporter,
        c.name as creator,
        it.name as issue_type,
        p.name as project_name,
        p.key as project_key,
        p.project_type_key,
        i.created,
        i.updated,
        i.actual_delivery_date,
        i.planned_delivery_date,
        i.severity,
        p2.name as priority,
        i.parent_link,
        s.name as status_name,
        i.description,
        i.summary,
        case when e.name is null then i.epic_name else e.name end as epic_name,
        s2.name as epic_status,
        qpl.description as qpl_description,
        max(v.release_date) over (
          partition by case when i.epic_link is null then i.id else i.epic_link end
        ) as version_release_date,

        COALESCE(case
          when i.incremental_revenue_jod_ - i.incremental_cost_jod_ < 100000 then 0
          when i.incremental_revenue_jod_ - i.incremental_cost_jod_ < 500000 then 0.5
          when i.incremental_revenue_jod_ - i.incremental_cost_jod_ < 1000000 then 0.75
          when i.incremental_revenue_jod_ - i.incremental_cost_jod_ >= 1000000 then 1.2
          else 0
        end) as revenue_weight,

        COALESCE(case
          when fo2.name = 'Yes' then
            case fo3.name
              when 'Minor convenience improvement' then 0
              when 'Solves significant user pain point' then 0.4
              when 'Transforms critical user journey' then 0.8
              else 0
            end
          else 0
        end) as problem_to_solve_relates_to_score,

        COALESCE(case fo4.name
          when 'No impact, less than 1% of users' then 0
          when 'Affects 15-30% of users' then 1
          when 'Affects >50% of users' then 2
          else 0
        end) as to_whom_we_are_impacting,

        COALESCE(case when fo5.name = 'Yes' then
          case fo6.name
            when '0-4.99%' then 0
            when '5% - 9.99%' then 0.4
            when '10% - 14.99%' then 0.6
            when '>15%' then 0.96
            else 0
          end
        end) as cx,

        COALESCE(case when fo7.name = 'Yes' then
          case fo8.name
            when '0' then 0
            when '5' then 0.83
            when '10' then 1.25
            when '>15' then 2
            else 0
          end
        end,0) as impact_on_prod_and_serv,

        COALESCE(case fo9.name
          when 'Tactical enhancement' then 0
          when 'Enables future capabilities or maintains market position' then 0.4
          when 'Platform transformation or new business model' then 0.8
          else 0
        end,0) as serv_strat_roadmap,

        COALESCE(case fo10.name
          when 'Minor convenience improvement' then 0
          when 'Solves significant process setup' then 0.4
          when 'Transforms heavily the process' then 0.8
        else 0
      end,0) as process_improv_impact,

        COALESCE(-1 * (
          case fo11.name
            when 'Single system modification' then 0
            when '2-3 connected systems' then 0.4
            when 'Complex multi-system integration' then 0.8
            else 0
          end
        ),0) as impact_on_dependancy,

        COALESCE(-1 * (
          case fo12.name
            when 'Straightforward/single path' then 0
            when 'Multiple paths/standard flows' then 0.4
            when 'Complex paths/many exceptions' then 0.8
            else 0
          end
        ),0) as impact_on_flow_complexity,

        COALESCE(-1 * (
          case fo13.name
            when 'No sensitive data/core flows affected' then 0
            when 'Affects sensitive data/important flows' then 0.4
            when 'Affects core banking/payment systems' then 0.8
            else 0
          end
        ),0) as impact_on_risk_level,

        i.business_case,
        fo17.name as what_is_the_strategic_value_,

        COALESCE(case fo17.name
          when 'Not developing it soon, cause no delay nor a blocker to the project' then 0.4
          when 'Not developing it soon, may cause delay or is a blocker to the project' then 0.8
          else 0
        end,0) as what_is_strateg_valu,

        fo18.name as what_strategic_initiative_it_relates_to_,
        fo2.name as is_it_aligned_to_any_strategic_project_in_the_bank_,
        fo3.name as problem_to_solve_relates_to,
        fo4.name as reach_to_existing_clients,
        fo5.name as does_it_have_any_impact_on_customer_experience_,
        fo6.name as _of_csat_improvement,
        fo7.name as does_it_have_any_impact_on_the_efficiency_engine_of_the_bank_,
        fo8.name as _of_productivity_increase,
        fo9.name as what_is_the_impact_on_the_product_or_service_strategic_roadmap_,
        fo10.name as process_improvement_impact,
        fo11.name as what_is_the_impact_on_dependency_,
        fo12.name as what_is_the_impact_on_flow_complexity_,
        fo13.name as what_is_the_impact_on_risk_level_,
        fo14.name as _of_productivity_improvement,
        fo15.name as _of_process_improvement,

        COALESCE(case fo14.name
          when '0-4.99%' then 0
          when '5% - 9.99%' then 0.4
          when '10% - 14.99%' then 0.6
          when '>15%' then 0.96
          else 0
        end,0) as prod_impr,

        COALESCE(case fo15.name
          when '0-4.99%' then 0
          when '5% - 9.99%' then 0.4
          when '10% - 14.99%' then 0.6
          when '>15%' then 0.96
          else 0
        end,0) as proc_impr,

        fo16.name as does_it_have_any_incremental_revenue_or_cost_impact_on_profit_,
        i.incremental_revenue_jod_,
        i.incremental_cost_jod_

      from jira.issue i

      left join jira.user u on i.assignee = u.id and u.is_active = 1
      left join jira.user r on i.reporter = r.id and r.is_active = 1
      left join jira.user c on i.creator = c.id and c.is_active = 1
      left join jira.project p on p.id = i.project
      left join jira.epic e on e.id = i.epic_link
      left join jira.status s on s.id = i.status
      left join jira.status s2 on s2.id = i.epic_status
      inner join jira.issue_type it on it.id = i.issue_type and it.name = 'Business Case'
      left join jira.priority p2 on p2.id = i.priority
      left join jira.resolution r2 on r2.id = i.resolution
      left join jira.q_progress_lookup qpl on qpl.q_progress_id = i.q_progress
      left join jira.issue_fix_versions ifv on ifv.issue_id = i.id
      left join jira.version v on v.id = ifv.version_id

      left join jira.field_option fo2 on fo2.id = i.is_it_aligned_to_any_strategic_project_in_the_bank_
      left join jira.field_option fo3 on fo3.id = i.problem_to_solve_relates_to
      left join jira.field_option fo4 on fo4.id = i.reach_to_existing_clients
      left join jira.field_option fo5 on fo5.id = i.does_it_have_any_impact_on_customer_experience_
      left join jira.field_option fo6 on fo6.id = i._of_csat_improvement
      left join jira.field_option fo7 on fo7.id = i.does_it_have_any_impact_on_the_efficiency_engine_of_the_bank_
      left join jira.field_option fo8 on fo8.id = i._of_productivity_increase
      left join jira.field_option fo9 on fo9.id = i.what_is_the_impact_on_the_product_or_service_strategic_roadmap_
      left join jira.field_option fo10 on fo10.id = i.process_improvement_impact
      left join jira.field_option fo11 on fo11.id = i.what_is_the_impact_on_dependency_
      left join jira.field_option fo12 on fo12.id = i.what_is_the_impact_on_flow_complexity_
      left join jira.field_option fo13 on fo13.id = i.what_is_the_impact_on_risk_level_
      left join jira.field_option fo14 on fo14.id = i._of_productivity_improvement
      left join jira.field_option fo15 on fo15.id = i._of_process_improvement
      left join jira.field_option fo16 on fo16.id = i.does_it_have_any_incremental_revenue_or_cost_impact_on_profit_
      left join jira.field_option fo17 on fo17.id = i.what_is_the_strategic_value_
      left join jira.field_option fo18 on fo18.id = i.what_strategic_initiative_it_relates_to_

      where i.created >= '2025-01-01' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: request_type_ {
    type: number
    sql: ${TABLE}.request_type_ ;;
  }

  dimension: resolution_name {
    type: string
    sql: ${TABLE}.resolution_name ;;
  }

  dimension: resolution_description {
    type: string
    sql: ${TABLE}.resolution_description ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}.assignee ;;
  }

  dimension: reporter {
    type: string
    sql: ${TABLE}.reporter ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}.creator ;;
  }

  dimension: issue_type {
    type: string
    sql: ${TABLE}.issue_type ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: project_key {
    type: string
    sql: ${TABLE}.project_key ;;
  }

  dimension: project_type_key {
    type: string
    sql: ${TABLE}.project_type_key ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension_group: updated {
    type: time
    sql: ${TABLE}.updated ;;
  }

  dimension: actual_delivery_date {
    type: date
    sql: ${TABLE}.actual_delivery_date ;;
  }

  dimension: planned_delivery_date {
    type: date
    sql: ${TABLE}.planned_delivery_date ;;
  }

  dimension: severity {
    type: number
    sql: ${TABLE}.severity ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: parent_link {
    type: number
    sql: ${TABLE}.parent_link ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}.status_name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: epic_name {
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension: epic_status {
    type: string
    sql: ${TABLE}.epic_status ;;
  }

  dimension: qpl_description {
    type: string
    sql: ${TABLE}.qpl_description ;;
  }

  dimension: version_release_date {
    type: date
    sql: ${TABLE}.version_release_date ;;
  }

  dimension: revenue_weight {
    type: number
    sql: ${TABLE}.revenue_weight ;;
  }

  dimension: problem_to_solve_relates_to_score {
    type: number
    sql: ${TABLE}.problem_to_solve_relates_to_score ;;
  }

  dimension: to_whom_we_are_impacting {
    type: number
    sql: ${TABLE}.to_whom_we_are_impacting ;;
  }

  dimension: cx {
    type: number
    sql: COALESCE(${TABLE}.cx,0) ;;
  }

  dimension: impact_on_prod_and_serv {
    type: number
    sql: ${TABLE}.impact_on_prod_and_serv ;;
  }

  dimension: serv_strat_roadmap {
    type: number
    sql: ${TABLE}.serv_strat_roadmap ;;
  }

  dimension: process_improv_impact {
    type: number
    sql: ${TABLE}.process_improv_impact ;;
  }

  dimension: impact_on_dependancy {
    type: number
    sql: ${TABLE}.impact_on_dependancy ;;
  }

  dimension: impact_on_flow_complexity {
    type: number
    sql: ${TABLE}.impact_on_flow_complexity ;;
  }

  dimension: impact_on_risk_level {
    type: number
    sql: ${TABLE}.impact_on_risk_level ;;
  }

  dimension: business_case {
    type: string
    sql: ${TABLE}.business_case ;;
  }

  dimension: what_is_the_strategic_value_ {
    type: string
    sql: ${TABLE}.what_is_the_strategic_value_ ;;
  }

  dimension: what_is_strateg_valu {
    type: number
    sql: ${TABLE}.what_is_strateg_valu ;;
  }

  dimension: what_strategic_initiative_it_relates_to_ {
    type: string
    sql: ${TABLE}.what_strategic_initiative_it_relates_to_ ;;
  }

  dimension: is_it_aligned_to_any_strategic_project_in_the_bank_ {
    type: string
    sql: ${TABLE}.is_it_aligned_to_any_strategic_project_in_the_bank_ ;;
  }

  dimension: problem_to_solve_relates_to {
    type: string
    sql: ${TABLE}.problem_to_solve_relates_to ;;
  }

  dimension: reach_to_existing_clients {
    type: string
    sql: ${TABLE}.reach_to_existing_clients ;;
  }

  dimension: does_it_have_any_impact_on_customer_experience_ {
    type: string
    sql: ${TABLE}.does_it_have_any_impact_on_customer_experience_ ;;
  }

  dimension: _of_csat_improvement {
    type: string
    sql: ${TABLE}._of_csat_improvement ;;
  }

  dimension: does_it_have_any_impact_on_the_efficiency_engine_of_the_bank_ {
    type: string
    sql: ${TABLE}.does_it_have_any_impact_on_the_efficiency_engine_of_the_bank_ ;;
  }

  dimension: _of_productivity_increase {
    type: string
    sql: ${TABLE}._of_productivity_increase ;;
  }

  dimension: what_is_the_impact_on_the_product_or_service_strategic_roadmap_ {
    type: string
    sql: ${TABLE}.what_is_the_impact_on_the_product_or_service_strategic_roadmap_ ;;
  }

  dimension: process_improvement_impact {
    type: string
    sql: ${TABLE}.process_improvement_impact ;;
  }

  dimension: what_is_the_impact_on_dependency_ {
    type: string
    sql: ${TABLE}.what_is_the_impact_on_dependency_ ;;
  }

  dimension: what_is_the_impact_on_flow_complexity_ {
    type: string
    sql: ${TABLE}.what_is_the_impact_on_flow_complexity_ ;;
  }

  dimension: what_is_the_impact_on_risk_level_ {
    type: string
    sql: ${TABLE}.what_is_the_impact_on_risk_level_ ;;
  }

  dimension: _of_productivity_improvement {
    type: string
    sql: ${TABLE}._of_productivity_improvement ;;
  }

  dimension: _of_process_improvement {
    type: string
    sql: ${TABLE}._of_process_improvement ;;
  }

  dimension: prod_impr {
    type: number
    sql: ${TABLE}.prod_impr ;;
  }

  dimension: proc_impr {
    type: number
    sql: ${TABLE}.proc_impr ;;
  }

  dimension: does_it_have_any_incremental_revenue_or_cost_impact_on_profit_ {
    type: string
    sql: ${TABLE}.does_it_have_any_incremental_revenue_or_cost_impact_on_profit_ ;;
  }

  dimension: incremental_revenue_jod_ {
    type: number
    sql: ${TABLE}.incremental_revenue_jod_ ;;
  }

  dimension: incremental_cost_jod_ {
    type: number
    sql: ${TABLE}.incremental_cost_jod_ ;;
  }

  measure: total_weight {
    type: number
    sql: sum(
          ${revenue_weight}
          + ${problem_to_solve_relates_to_score}
          + ${to_whom_we_are_impacting}
          + ${cx}
          + ${impact_on_prod_and_serv}
          + ${serv_strat_roadmap}
          + ${process_improv_impact}
          + ${impact_on_dependancy}
          + ${impact_on_flow_complexity}
          + ${impact_on_risk_level}
          + ${proc_impr}
          + ${prod_impr}
          + ${what_is_strateg_valu}
        ) ;;
  }


  set: detail {
    fields: [
        issue_id,
  project_id,
  request_type_,
  resolution_name,
  resolution_description,
  key,
  assignee,
  reporter,
  creator,
  issue_type,
  project_name,
  project_key,
  project_type_key,
  created_time,
  updated_time,
  actual_delivery_date,
  planned_delivery_date,
  severity,
  priority,
  parent_link,
  status_name,
  description,
  summary,
  epic_name,
  epic_status,
  qpl_description,
  version_release_date,
  revenue_weight,
  problem_to_solve_relates_to_score,
  to_whom_we_are_impacting,
  cx,
  impact_on_prod_and_serv,
  serv_strat_roadmap,
  process_improv_impact,
  impact_on_dependancy,
  impact_on_flow_complexity,
  impact_on_risk_level,
  business_case,
  what_is_the_strategic_value_,
  what_is_strateg_valu,
  what_strategic_initiative_it_relates_to_,
  is_it_aligned_to_any_strategic_project_in_the_bank_,
  problem_to_solve_relates_to,
  reach_to_existing_clients,
  does_it_have_any_impact_on_customer_experience_,
  _of_csat_improvement,
  does_it_have_any_impact_on_the_efficiency_engine_of_the_bank_,
  _of_productivity_increase,
  what_is_the_impact_on_the_product_or_service_strategic_roadmap_,
  process_improvement_impact,
  what_is_the_impact_on_dependency_,
  what_is_the_impact_on_flow_complexity_,
  what_is_the_impact_on_risk_level_,
  _of_productivity_improvement,
  _of_process_improvement,
  prod_impr,
  proc_impr,
  does_it_have_any_incremental_revenue_or_cost_impact_on_profit_,
  incremental_revenue_jod_,
  incremental_cost_jod_
    ]
  }
}
