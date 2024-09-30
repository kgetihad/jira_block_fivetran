# The name of this view in Looker is "Issue"
view: issue {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: jira.issue ;;
  drill_fields: [external_issue_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: external_issue_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.external_issue_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called " " in Explore.

  dimension: _ {
    type: string
    sql: ${TABLE}._ ;;
  }

  dimension: _as_ar_alfwayd_al_wayd {
    type: number
    sql: ${TABLE}._as_ar_alfwayd_al_wayd ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: _of_amendment {
    type: string
    sql: ${TABLE}._of_amendment ;;
  }

  dimension: _original_estimate {
    type: number
    sql: ${TABLE}._original_estimate ;;
  }

  dimension: _remaining_estimate {
    type: number
    sql: ${TABLE}._remaining_estimate ;;
  }

  dimension: _time_spent {
    type: number
    sql: ${TABLE}._time_spent ;;
  }

  dimension: _tribes_tech_department_name {
    type: number
    sql: ${TABLE}._tribes_tech_department_name ;;
  }

  dimension: _wsayl_akhry {
    type: string
    sql: ${TABLE}._wsayl_akhry ;;
  }

  dimension: acceptance_criteria {
    type: string
    sql: ${TABLE}.acceptance_criteria ;;
  }

  dimension: acceptance_criteria_mandatory_ {
    type: string
    sql: ${TABLE}.acceptance_criteria_mandatory_ ;;
  }

  dimension: access_request_type {
    type: number
    sql: ${TABLE}.access_request_type ;;
  }

  dimension: account_issues {
    type: number
    sql: ${TABLE}.account_issues ;;
  }

  dimension: account_no_ {
    type: string
    sql: ${TABLE}.account_no_ ;;
  }

  dimension: account_status {
    type: number
    sql: ${TABLE}.account_status ;;
  }

  dimension: account_type_ {
    type: number
    sql: ${TABLE}.account_type_ ;;
  }

  dimension: action_plan {
    type: string
    sql: ${TABLE}.action_plan ;;
  }

  dimension: action_taken {
    type: string
    sql: ${TABLE}.action_taken ;;
  }

  dimension: actual {
    type: string
    sql: ${TABLE}.actual ;;
  }

  dimension: actual_1 {
    type: string
    sql: ${TABLE}.actual_1 ;;
  }

  dimension: actual_2 {
    type: string
    sql: ${TABLE}.actual_2 ;;
  }

  dimension: actual_3 {
    type: string
    sql: ${TABLE}.actual_3 ;;
  }

  dimension: actual_4 {
    type: string
    sql: ${TABLE}.actual_4 ;;
  }

  dimension: actual_5 {
    type: string
    sql: ${TABLE}.actual_5 ;;
  }

  dimension: actual_6 {
    type: string
    sql: ${TABLE}.actual_6 ;;
  }

  dimension_group: actual_delivery {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.actual_delivery_date ;;
  }

  dimension_group: actual_release {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.actual_release_date ;;
  }

  dimension: additional_comments {
    type: string
    sql: ${TABLE}.additional_comments ;;
  }

  dimension: additional_notes {
    type: string
    sql: ${TABLE}.additional_notes ;;
  }

  dimension: admin_request {
    type: number
    sql: ${TABLE}.admin_request ;;
  }

  dimension: advice_type {
    type: number
    sql: ${TABLE}.advice_type ;;
  }

  dimension: affected_hardware {
    type: string
    sql: ${TABLE}.affected_hardware ;;
  }

  dimension: affected_version {
    type: number
    sql: ${TABLE}.affected_version ;;
  }

  dimension: aha_reference {
    type: string
    sql: ${TABLE}.aha_reference ;;
  }

  dimension: akhry_ {
    type: string
    sql: ${TABLE}.akhry_ ;;
  }

  dimension: al_mwlat_w_alrswm_ {
    type: number
    sql: ${TABLE}.al_mwlat_w_alrswm_ ;;
  }

  dimension: al_qwd_w_shrwt_alt_aml_ {
    type: number
    sql: ${TABLE}.al_qwd_w_shrwt_alt_aml_ ;;
  }

  dimension: ala_tdhar_ll_myl {
    type: number
    sql: ${TABLE}.ala_tdhar_ll_myl ;;
  }

  dimension: ala_tdhar_mn_al_myl_ly_alt_wyd_almady_almtlwb {
    type: number
    sql: ${TABLE}.ala_tdhar_mn_al_myl_ly_alt_wyd_almady_almtlwb ;;
  }

  dimension: alast_lam_alaytmany_ {
    type: number
    sql: ${TABLE}.alast_lam_alaytmany_ ;;
  }

  dimension: alatsalat_aladafyt_allahqt_ {
    type: string
    sql: ${TABLE}.alatsalat_aladafyt_allahqt_ ;;
  }

  dimension: albtaqat_albnkyt_ {
    type: number
    sql: ${TABLE}.albtaqat_albnkyt_ ;;
  }

  dimension: aldayrt {
    type: number
    sql: ${TABLE}.aldayrt ;;
  }

  dimension: aldmanat_w_alkfla_ {
    type: number
    sql: ${TABLE}.aldmanat_w_alkfla_ ;;
  }

  dimension: alert_reason {
    type: number
    sql: ${TABLE}.alert_reason ;;
  }

  dimension: alhsabat {
    type: number
    sql: ${TABLE}.alhsabat ;;
  }

  dimension: alhwalat_ {
    type: number
    sql: ${TABLE}.alhwalat_ ;;
  }

  dimension: aljht_almswwlt_n_alkhta_ {
    type: number
    sql: ${TABLE}.aljht_almswwlt_n_alkhta_ ;;
  }

  dimension: alkhdmat_alalktrwnyh_ {
    type: number
    sql: ${TABLE}.alkhdmat_alalktrwnyh_ ;;
  }

  dimension: alkhtt_almstqblyt_ {
    type: string
    sql: ${TABLE}.alkhtt_almstqblyt_ ;;
  }

  dimension: alm_dl_alnhayy {
    type: number
    sql: ${TABLE}.alm_dl_alnhayy ;;
  }

  dimension: almntj_alkhdmt {
    type: number
    sql: ${TABLE}.almntj_alkhdmt ;;
  }

  dimension: almntj_alkhdmt_mhl_alshkwy_ {
    type: string
    sql: ${TABLE}.almntj_alkhdmt_mhl_alshkwy_ ;;
  }

  dimension: almwzf_alm_ny_bhl_alshkwy_ {
    type: number
    sql: ${TABLE}.almwzf_alm_ny_bhl_alshkwy_ ;;
  }

  dimension: almwzf_almswwl_n_ttbyq_alkhtt_almstqblyt_ {
    type: string
    sql: ${TABLE}.almwzf_almswwl_n_ttbyq_alkhtt_almstqblyt_ ;;
  }

  dimension: alntyjt_alnhayyt_llshkwy_ {
    type: string
    sql: ${TABLE}.alntyjt_alnhayyt_llshkwy_ ;;
  }

  dimension: alqsm_alm_ny {
    type: number
    sql: ${TABLE}.alqsm_alm_ny ;;
  }

  dimension: alrqm_almrj_y_llshkwy {
    type: string
    sql: ${TABLE}.alrqm_almrj_y_llshkwy ;;
  }

  dimension: alrqm_alwtny {
    type: string
    sql: ${TABLE}.alrqm_alwtny ;;
  }

  dimension: alrqm_alwtny_rqm_jwaz_alsfr {
    type: string
    sql: ${TABLE}.alrqm_alwtny_rqm_jwaz_alsfr ;;
  }

  dimension_group: altarykh_almtwq_llttbyq_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.altarykh_almtwq_llttbyq_ ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;  }
  measure: average_amount {
    type: average
    sql: ${amount} ;;  }

  dimension: amount_of_increase {
    type: number
    sql: ${TABLE}.amount_of_increase ;;
  }

  dimension: analytics_tracking_mandatory_ {
    type: string
    sql: ${TABLE}.analytics_tracking_mandatory_ ;;
  }

  dimension: analytics_tracking_table {
    type: string
    sql: ${TABLE}.analytics_tracking_table ;;
  }

  dimension: analytics_tracking_table_mandatory_ {
    type: string
    sql: ${TABLE}.analytics_tracking_table_mandatory_ ;;
  }

  dimension: ap_report_request_type {
    type: number
    sql: ${TABLE}.ap_report_request_type ;;
  }

  dimension: ap_request_type {
    type: number
    sql: ${TABLE}.ap_request_type ;;
  }

  dimension: api_links_mandatory_ {
    type: string
    sql: ${TABLE}.api_links_mandatory_ ;;
  }

  dimension: app_vendor_ {
    type: number
    sql: ${TABLE}.app_vendor_ ;;
  }

  dimension: appian_links {
    type: string
    sql: ${TABLE}.appian_links ;;
  }

  dimension: appian_project {
    type: number
    sql: ${TABLE}.appian_project ;;
  }

  dimension: application_number {
    type: string
    sql: ${TABLE}.application_number ;;
  }

  dimension: application_version {
    type: string
    sql: ${TABLE}.application_version ;;
  }

  dimension: approvers {
    type: string
    sql: ${TABLE}.approvers ;;
  }

  dimension: ar_request_type_ {
    type: number
    sql: ${TABLE}.ar_request_type_ ;;
  }

  dimension: are_there_any_departments_involved_in_the_execution_of_your_proposed_solution {
    type: number
    sql: ${TABLE}.are_there_any_departments_involved_in_the_execution_of_your_proposed_solution ;;
  }

  dimension: area_of_impact {
    type: string
    sql: ${TABLE}.area_of_impact ;;
  }

  dimension: asbab_rfd_alshkawy_ {
    type: number
    sql: ${TABLE}.asbab_rfd_alshkawy_ ;;
  }

  dimension: asm_alabn_alabnh {
    type: string
    sql: ${TABLE}.asm_alabn_alabnh ;;
  }

  dimension: asm_almshtky_balkaml_ {
    type: string
    sql: ${TABLE}.asm_almshtky_balkaml_ ;;
  }

  dimension: asm_almwzf {
    type: string
    sql: ${TABLE}.asm_almwzf ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}.assignee ;;
  }

  dimension_group: assignment_date_to {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.assignment_date_to ;;
  }

  dimension: assumptions {
    type: string
    sql: ${TABLE}.assumptions ;;
  }

  dimension: atkhadh_ajra_at_tshyhyt_akhry_ {
    type: number
    sql: ${TABLE}.atkhadh_ajra_at_tshyhyt_akhry_ ;;
  }

  dimension: atlas_project_key {
    type: string
    sql: ${TABLE}.atlas_project_key ;;
  }

  dimension: atlas_project_status {
    type: string
    sql: ${TABLE}.atlas_project_status ;;
  }

  dimension: atm_facility_ {
    type: string
    sql: ${TABLE}.atm_facility_ ;;
  }

  dimension: atm_issue {
    type: number
    sql: ${TABLE}.atm_issue ;;
  }

  dimension: atm_name_location {
    type: string
    sql: ${TABLE}.atm_name_location ;;
  }

  dimension: atm_number {
    type: number
    sql: ${TABLE}.atm_number ;;
  }

  dimension: attachment_count {
    type: number
    sql: ${TABLE}.attachment_count ;;
  }

  dimension: authorize {
    type: number
    sql: ${TABLE}.authorize ;;
  }

  dimension: automation_status {
    type: number
    sql: ${TABLE}.automation_status ;;
  }

  dimension: backendless_links {
    type: string
    sql: ${TABLE}.backendless_links ;;
  }

  dimension: backendless_links_mandatory_ {
    type: string
    sql: ${TABLE}.backendless_links_mandatory_ ;;
  }

  dimension: backout_plan {
    type: string
    sql: ${TABLE}.backout_plan ;;
  }

  dimension: backup_plan {
    type: string
    sql: ${TABLE}.backup_plan ;;
  }

  dimension: baseline {
    type: string
    sql: ${TABLE}.baseline ;;
  }

  dimension: baseline_1 {
    type: string
    sql: ${TABLE}.baseline_1 ;;
  }

  dimension: baseline_2 {
    type: string
    sql: ${TABLE}.baseline_2 ;;
  }

  dimension: baseline_3 {
    type: string
    sql: ${TABLE}.baseline_3 ;;
  }

  dimension: baseline_4 {
    type: string
    sql: ${TABLE}.baseline_4 ;;
  }

  dimension: baseline_5 {
    type: string
    sql: ${TABLE}.baseline_5 ;;
  }

  dimension: baseline_6 {
    type: string
    sql: ${TABLE}.baseline_6 ;;
  }

  dimension_group: baseline_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.baseline_end_date ;;
  }

  dimension_group: baseline_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.baseline_start_date ;;
  }

  dimension_group: begin {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.begin_date ;;
  }

  dimension: bill_amount {
    type: number
    sql: ${TABLE}.bill_amount ;;
  }

  dimension: bill_number {
    type: number
    sql: ${TABLE}.bill_number ;;
  }

  dimension: biller {
    type: string
    sql: ${TABLE}.biller ;;
  }

  dimension: billing_number_ {
    type: string
    sql: ${TABLE}.billing_number_ ;;
  }

  dimension: box_number_ {
    type: string
    sql: ${TABLE}.box_number_ ;;
  }

  dimension: bpm_request_error_ {
    type: number
    sql: ${TABLE}.bpm_request_error_ ;;
  }

  dimension: bpm_systems {
    type: number
    sql: ${TABLE}.bpm_systems ;;
  }

  dimension: branch {
    type: number
    sql: ${TABLE}.branch ;;
  }

  dimension: btaqat_aldf_ {
    type: number
    sql: ${TABLE}.btaqat_aldf_ ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: bugs_of_epic_count {
    type: number
    sql: ${TABLE}.bugs_of_epic_count ;;
  }

  dimension: bugs_of_epic_in_done_status_category_count {
    type: number
    sql: ${TABLE}.bugs_of_epic_in_done_status_category_count ;;
  }

  dimension: bugs_of_epic_in_in_progress_status_category_count {
    type: number
    sql: ${TABLE}.bugs_of_epic_in_in_progress_status_category_count ;;
  }

  dimension: bugs_of_epic_in_to_do_status_category_count {
    type: number
    sql: ${TABLE}.bugs_of_epic_in_to_do_status_category_count ;;
  }

  dimension: bundled_field {
    type: string
    sql: ${TABLE}.bundled_field ;;
  }

  dimension: business_case {
    type: string
    sql: ${TABLE}.business_case ;;
  }

  dimension: business_case_description {
    type: string
    sql: ${TABLE}.business_case_description ;;
  }

  dimension: business_case_form {
    type: number
    sql: ${TABLE}.business_case_form ;;
  }

  dimension: business_case_reason {
    type: string
    sql: ${TABLE}.business_case_reason ;;
  }

  dimension: business_case_title {
    type: string
    sql: ${TABLE}.business_case_title ;;
  }

  dimension: business_case_type {
    type: number
    sql: ${TABLE}.business_case_type ;;
  }

  dimension: business_owner {
    type: string
    sql: ${TABLE}.business_owner ;;
  }

  dimension: business_requirements_ {
    type: string
    sql: ${TABLE}.business_requirements_ ;;
  }

  dimension: business_revenue_value {
    type: number
    sql: ${TABLE}.business_revenue_value ;;
  }

  dimension: byyt_al_ml_ {
    type: number
    sql: ${TABLE}.byyt_al_ml_ ;;
  }

  dimension: cab {
    type: string
    sql: ${TABLE}.cab ;;
  }

  dimension: call_purpose {
    type: number
    sql: ${TABLE}.call_purpose ;;
  }

  dimension: can_the_problem_be_solved_without_technology_minimize_the_role_of_technology {
    type: number
    sql: ${TABLE}.can_the_problem_be_solved_without_technology_minimize_the_role_of_technology ;;
  }

  dimension: candidates_employee_name_ {
    type: string
    sql: ${TABLE}.candidates_employee_name_ ;;
  }

  dimension: candidates_employee_position_ {
    type: string
    sql: ${TABLE}.candidates_employee_position_ ;;
  }

  dimension: card_type_ {
    type: number
    sql: ${TABLE}.card_type_ ;;
  }

  dimension: cards_issues {
    type: number
    sql: ${TABLE}.cards_issues ;;
  }

  dimension: category {
    type: number
    sql: ${TABLE}.category ;;
  }

  dimension: category_type {
    type: number
    sql: ${TABLE}.category_type ;;
  }

  dimension: category_typy {
    type: number
    sql: ${TABLE}.category_typy ;;
  }

  dimension: cc_application_issue {
    type: number
    sql: ${TABLE}.cc_application_issue ;;
  }

  dimension: cc_department_ {
    type: number
    sql: ${TABLE}.cc_department_ ;;
  }

  dimension: cc_employee_name_ {
    type: number
    sql: ${TABLE}.cc_employee_name_ ;;
  }

  dimension: cc_user {
    type: string
    sql: ${TABLE}.cc_user ;;
  }

  dimension: cc_user_10 {
    type: string
    sql: ${TABLE}.cc_user_10 ;;
  }

  dimension: cc_user_2 {
    type: string
    sql: ${TABLE}.cc_user_2 ;;
  }

  dimension: cc_user_3 {
    type: string
    sql: ${TABLE}.cc_user_3 ;;
  }

  dimension: cc_user_4 {
    type: string
    sql: ${TABLE}.cc_user_4 ;;
  }

  dimension: cc_user_5 {
    type: string
    sql: ${TABLE}.cc_user_5 ;;
  }

  dimension: cc_user_6 {
    type: string
    sql: ${TABLE}.cc_user_6 ;;
  }

  dimension: cc_user_7 {
    type: string
    sql: ${TABLE}.cc_user_7 ;;
  }

  dimension: cc_user_8 {
    type: string
    sql: ${TABLE}.cc_user_8 ;;
  }

  dimension: cc_user_9 {
    type: string
    sql: ${TABLE}.cc_user_9 ;;
  }

  dimension: cf_branch {
    type: string
    sql: ${TABLE}.cf_branch ;;
  }

  dimension: change_ {
    type: string
    sql: ${TABLE}.change_ ;;
  }

  dimension_group: change_completion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.change_completion_date ;;
  }

  dimension: change_managers {
    type: string
    sql: ${TABLE}.change_managers ;;
  }

  dimension: change_reason {
    type: number
    sql: ${TABLE}.change_reason ;;
  }

  dimension: change_risk {
    type: number
    sql: ${TABLE}.change_risk ;;
  }

  dimension_group: change_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.change_start_date ;;
  }

  dimension: change_type {
    type: number
    sql: ${TABLE}.change_type ;;
  }

  dimension: channels {
    type: number
    sql: ${TABLE}.channels ;;
  }

  dimension: checklist_completed {
    type: string
    sql: ${TABLE}.checklist_completed ;;
  }

  dimension: checklist_content_yaml {
    type: string
    sql: ${TABLE}.checklist_content_yaml ;;
  }

  dimension: checklist_progress {
    type: string
    sql: ${TABLE}.checklist_progress ;;
  }

  dimension: checklist_progress_ {
    type: number
    sql: ${TABLE}.checklist_progress_ ;;
  }

  dimension: checklist_progress_obsolete_ {
    type: string
    sql: ${TABLE}.checklist_progress_obsolete_ ;;
  }

  dimension: checklist_progress_resignation_employee {
    type: string
    sql: ${TABLE}.checklist_progress_resignation_employee ;;
  }

  dimension: checklist_progress_to_do {
    type: string
    sql: ${TABLE}.checklist_progress_to_do ;;
  }

  dimension: checklist_text {
    type: string
    sql: ${TABLE}.checklist_text ;;
  }

  dimension: checklist_text_view_only_ {
    type: string
    sql: ${TABLE}.checklist_text_view_only_ ;;
  }

  dimension: children_of_epic_count {
    type: number
    sql: ${TABLE}.children_of_epic_count ;;
  }

  dimension: children_of_epic_in_done_status_category_count {
    type: number
    sql: ${TABLE}.children_of_epic_in_done_status_category_count ;;
  }

  dimension: children_of_epic_in_in_progress_status_category_count {
    type: number
    sql: ${TABLE}.children_of_epic_in_in_progress_status_category_count ;;
  }

  dimension: children_of_epic_in_to_do_status_category_count {
    type: number
    sql: ${TABLE}.children_of_epic_in_to_do_status_category_count ;;
  }

  dimension: cif_ {
    type: string
    sql: ${TABLE}.cif_ ;;
  }

  dimension: collateral_list {
    type: number
    sql: ${TABLE}.collateral_list ;;
  }

  dimension: comment_count {
    type: number
    sql: ${TABLE}.comment_count ;;
  }

  dimension: commercial_details {
    type: string
    sql: ${TABLE}.commercial_details ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: compass {
    type: string
    sql: ${TABLE}.compass ;;
  }

  dimension: competitive_analysis_metric_results_quantitative_ {
    type: string
    sql: ${TABLE}.competitive_analysis_metric_results_quantitative_ ;;
  }

  dimension: complexity {
    type: number
    sql: ${TABLE}.complexity ;;
  }

  dimension: configurable_content_keys {
    type: string
    sql: ${TABLE}.configurable_content_keys ;;
  }

  dimension: connection_ {
    type: number
    sql: ${TABLE}.connection_ ;;
  }

  dimension: connectivity_status_ {
    type: number
    sql: ${TABLE}.connectivity_status_ ;;
  }

  dimension: container_id_ {
    type: string
    sql: ${TABLE}.container_id_ ;;
  }

  dimension: content_list {
    type: number
    sql: ${TABLE}.content_list ;;
  }

  dimension: contract_number {
    type: number
    sql: ${TABLE}.contract_number ;;
  }

  dimension: contract_type {
    type: number
    sql: ${TABLE}.contract_type ;;
  }

  dimension: contract_value {
    type: string
    sql: ${TABLE}.contract_value ;;
  }

  dimension: core_links {
    type: string
    sql: ${TABLE}.core_links ;;
  }

  dimension: corporate_banking_issue {
    type: number
    sql: ${TABLE}.corporate_banking_issue ;;
  }

  dimension: corrective_action {
    type: string
    sql: ${TABLE}.corrective_action ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: cost_efficiency {
    type: string
    sql: ${TABLE}.cost_efficiency ;;
  }

  dimension: count_channels_branches_call_center_app_etc_ {
    type: number
    sql: ${TABLE}.count_channels_branches_call_center_app_etc_ ;;
  }

  dimension: count_department {
    type: number
    sql: ${TABLE}.count_department ;;
  }

  dimension: count_market {
    type: number
    sql: ${TABLE}.count_market ;;
  }

  dimension: count_of_departments_affected_post_implementation_expected_value {
    type: number
    sql: ${TABLE}.count_of_departments_affected_post_implementation_expected_value ;;
  }

  dimension: count_of_departments_affected_pre_implementation_expected_value {
    type: number
    sql: ${TABLE}.count_of_departments_affected_pre_implementation_expected_value ;;
  }

  dimension: count_of_people_involved_post_implementation_value {
    type: number
    sql: ${TABLE}.count_of_people_involved_post_implementation_value ;;
  }

  dimension: count_of_people_involved_pre_implementation_value {
    type: number
    sql: ${TABLE}.count_of_people_involved_pre_implementation_value ;;
  }

  dimension: count_of_segments_affected_post_implementation_expected_value {
    type: number
    sql: ${TABLE}.count_of_segments_affected_post_implementation_expected_value ;;
  }

  dimension: count_of_segments_affected_pre_implementation_expected_value {
    type: number
    sql: ${TABLE}.count_of_segments_affected_pre_implementation_expected_value ;;
  }

  dimension: count_of_targeted_markets {
    type: number
    sql: ${TABLE}.count_of_targeted_markets ;;
  }

  dimension: count_others {
    type: string
    sql: ${TABLE}.count_others ;;
  }

  dimension: count_segment {
    type: number
    sql: ${TABLE}.count_segment ;;
  }

  dimension: country {
    type: number
    sql: ${TABLE}.country ;;
  }

  dimension: coverage_ {
    type: number
    sql: ${TABLE}.coverage_ ;;
  }

  dimension: covered_by_nagios_ {
    type: number
    sql: ${TABLE}.covered_by_nagios_ ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created ;;
  }

  dimension: creating_gls_details {
    type: string
    sql: ${TABLE}.creating_gls_details ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}.creator ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_acquisition_cost_calculation_and_result {
    type: string
    sql: ${TABLE}.customer_acquisition_cost_calculation_and_result ;;
  }

  dimension: customer_cif_ {
    type: string
    sql: ${TABLE}.customer_cif_ ;;
  }

  dimension: customer_cif_id {
    type: string
    sql: ${TABLE}.customer_cif_id ;;
  }

  dimension: customer_engagement_and_activity_level_of_impact {
    type: number
    sql: ${TABLE}.customer_engagement_and_activity_level_of_impact ;;
  }

  dimension: customer_engagement_and_activity_post_implementation_value {
    type: number
    sql: ${TABLE}.customer_engagement_and_activity_post_implementation_value ;;
  }

  dimension: customer_engagement_and_activity_pre_implementation_value {
    type: number
    sql: ${TABLE}.customer_engagement_and_activity_pre_implementation_value ;;
  }

  dimension: customer_engagement_and_activity_realization_period {
    type: number
    sql: ${TABLE}.customer_engagement_and_activity_realization_period ;;
  }

  dimension: customer_issue {
    type: number
    sql: ${TABLE}.customer_issue ;;
  }

  dimension: customer_lifetime_value_expected_estimate_calculation_and_result {
    type: string
    sql: ${TABLE}.customer_lifetime_value_expected_estimate_calculation_and_result ;;
  }

  dimension: customer_name_ {
    type: string
    sql: ${TABLE}.customer_name_ ;;
  }

  dimension: customer_number {
    type: string
    sql: ${TABLE}.customer_number ;;
  }

  dimension: customer_phone_number {
    type: string
    sql: ${TABLE}.customer_phone_number ;;
  }

  dimension: customer_request_type {
    type: string
    sql: ${TABLE}.customer_request_type ;;
  }

  dimension: customer_satisfaction_rate_percentage_post_implementation_value {
    type: number
    sql: ${TABLE}.customer_satisfaction_rate_percentage_post_implementation_value ;;
  }

  dimension: customer_satisfaction_rate_percentage_pre_implementation_value {
    type: number
    sql: ${TABLE}.customer_satisfaction_rate_percentage_pre_implementation_value ;;
  }

  dimension: customer_satisfaction_rate_post_implementation_value {
    type: string
    sql: ${TABLE}.customer_satisfaction_rate_post_implementation_value ;;
  }

  dimension: customer_satisfaction_rate_pre_implementation_value {
    type: string
    sql: ${TABLE}.customer_satisfaction_rate_pre_implementation_value ;;
  }

  dimension: customer_satisfaction_rate_realization_period {
    type: number
    sql: ${TABLE}.customer_satisfaction_rate_realization_period ;;
  }

  dimension: customer_segment {
    type: number
    sql: ${TABLE}.customer_segment ;;
  }

  dimension: customer_value {
    type: number
    sql: ${TABLE}.customer_value ;;
  }

  dimension: customer_waiting_time_minutes_post_implementation_value {
    type: number
    sql: ${TABLE}.customer_waiting_time_minutes_post_implementation_value ;;
  }

  dimension: customer_waiting_time_minutes_pre_implementation_value {
    type: number
    sql: ${TABLE}.customer_waiting_time_minutes_pre_implementation_value ;;
  }

  dimension: customer_waiting_time_post_implementation_value {
    type: string
    sql: ${TABLE}.customer_waiting_time_post_implementation_value ;;
  }

  dimension: customer_waiting_time_pre_implementation_value {
    type: string
    sql: ${TABLE}.customer_waiting_time_pre_implementation_value ;;
  }

  dimension: customer_waiting_time_realization_period {
    type: number
    sql: ${TABLE}.customer_waiting_time_realization_period ;;
  }

  dimension: cv_referrals_ {
    type: string
    sql: ${TABLE}.cv_referrals_ ;;
  }

  dimension: cvss {
    type: number
    sql: ${TABLE}.cvss ;;
  }

  dimension: cvssv_2_base_score {
    type: string
    sql: ${TABLE}.cvssv_2_base_score ;;
  }

  dimension: cvssv_2_temporal_score {
    type: string
    sql: ${TABLE}.cvssv_2_temporal_score ;;
  }

  dimension: cvssv_3_base_score {
    type: string
    sql: ${TABLE}.cvssv_3_base_score ;;
  }

  dimension: cvssv_3_temporal_score {
    type: string
    sql: ${TABLE}.cvssv_3_temporal_score ;;
  }

  dimension: dashboard_name_ {
    type: string
    sql: ${TABLE}.dashboard_name_ ;;
  }

  dimension_group: date_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_ ;;
  }

  dimension_group: date_of_hire {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_of_hire ;;
  }

  dimension_group: date_of_resignation {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_of_resignation ;;
  }

  dimension: dba_name_ {
    type: number
    sql: ${TABLE}.dba_name_ ;;
  }

  dimension_group: deadline {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.deadline ;;
  }

  dimension: delivery_confidence {
    type: number
    sql: ${TABLE}.delivery_confidence ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_ {
    type: string
    sql: ${TABLE}.department_ ;;
  }

  dimension: department_field {
    type: string
    sql: ${TABLE}.department_field ;;
  }

  dimension: department_name {
    type: number
    sql: ${TABLE}.department_name ;;
  }

  dimension: departments_ {
    type: number
    sql: ${TABLE}.departments_ ;;
  }

  dimension: departments_affected_post_implementation_expected_value {
    type: string
    sql: ${TABLE}.departments_affected_post_implementation_expected_value ;;
  }

  dimension: departments_affected_pre_implementation_expected_value {
    type: string
    sql: ${TABLE}.departments_affected_pre_implementation_expected_value ;;
  }

  dimension: departments_affected_realization_period {
    type: number
    sql: ${TABLE}.departments_affected_realization_period ;;
  }

  dimension: dependencies {
    type: string
    sql: ${TABLE}.dependencies ;;
  }

  dimension: deposit_amount {
    type: number
    sql: ${TABLE}.deposit_amount ;;
  }

  dimension: deposits_issue {
    type: number
    sql: ${TABLE}.deposits_issue ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: description_source_problem {
    type: string
    sql: ${TABLE}.description_source_problem ;;
  }

  dimension: design_link_mandatory_ {
    type: string
    sql: ${TABLE}.design_link_mandatory_ ;;
  }

  dimension: design_links {
    type: string
    sql: ${TABLE}.design_links ;;
  }

  dimension: designs_ready {
    type: number
    sql: ${TABLE}.designs_ready ;;
  }

  dimension_group: dev_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dev_end_date ;;
  }

  dimension: dev_ops_size {
    type: number
    sql: ${TABLE}.dev_ops_size ;;
  }

  dimension: dev_size {
    type: number
    sql: ${TABLE}.dev_size ;;
  }

  dimension_group: dev_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dev_start_date ;;
  }

  dimension: development {
    type: string
    sql: ${TABLE}.development ;;
  }

  dimension: device_date_ {
    type: number
    sql: ${TABLE}.device_date_ ;;
  }

  dimension: device_dns_name {
    type: string
    sql: ${TABLE}.device_dns_name ;;
  }

  dimension: device_mac_addresses {
    type: string
    sql: ${TABLE}.device_mac_addresses ;;
  }

  dimension: device_module {
    type: string
    sql: ${TABLE}.device_module ;;
  }

  dimension: device_net_bios_name {
    type: string
    sql: ${TABLE}.device_net_bios_name ;;
  }

  dimension: device_network_id {
    type: string
    sql: ${TABLE}.device_network_id ;;
  }

  dimension: devops_links {
    type: string
    sql: ${TABLE}.devops_links ;;
  }

  dimension: difficulty {
    type: number
    sql: ${TABLE}.difficulty ;;
  }

  dimension: digital_on_boarding_issue {
    type: number
    sql: ${TABLE}.digital_on_boarding_issue ;;
  }

  dimension: does_it_impact_multiple_key_results {
    type: number
    sql: ${TABLE}.does_it_impact_multiple_key_results ;;
  }

  dimension: down_time_required {
    type: number
    sql: ${TABLE}.down_time_required ;;
  }

 dimension_group: due_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.due_date ;;
  }

  dimension_group: due_date_c_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.due_date_c_ ;;
  }

  dimension: duration_of_down_time {
    type: string
    sql: ${TABLE}.duration_of_down_time ;;
  }

  dimension: ecc_error_type_ {
    type: number
    sql: ${TABLE}.ecc_error_type_ ;;
  }

  dimension: effect_who_is_impacted_ {
    type: string
    sql: ${TABLE}.effect_who_is_impacted_ ;;
  }

  dimension: effort {
    type: number
    sql: ${TABLE}.effort ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_issue {
    type: number
    sql: ${TABLE}.email_issue ;;
  }

  dimension: emails_to_receive_report_ {
    type: string
    sql: ${TABLE}.emails_to_receive_report_ ;;
  }

  dimension: empact {
    type: number
    sql: ${TABLE}.empact ;;
  }

  dimension: employee_authorizer {
    type: string
    sql: ${TABLE}.employee_authorizer ;;
  }

  dimension: employee_id_number_ {
    type: string
    sql: ${TABLE}.employee_id_number_ ;;
  }

  dimension: employee_name_ {
    type: string
    sql: ${TABLE}.employee_name_ ;;
  }

  dimension: employee_position_ {
    type: string
    sql: ${TABLE}.employee_position_ ;;
  }

  dimension: employee_productivity_i_e_rework_percentage_post_implementation_value {
    type: number
    sql: ${TABLE}.employee_productivity_i_e_rework_percentage_post_implementation_value ;;
  }

  dimension: employee_productivity_i_e_rework_percentage_pre_implementation_value {
    type: number
    sql: ${TABLE}.employee_productivity_i_e_rework_percentage_pre_implementation_value ;;
  }

  dimension: employee_productivity_i_e_rework_post_implementation_value {
    type: string
    sql: ${TABLE}.employee_productivity_i_e_rework_post_implementation_value ;;
  }

  dimension: employee_productivity_i_e_rework_pre_implementation_value {
    type: string
    sql: ${TABLE}.employee_productivity_i_e_rework_pre_implementation_value ;;
  }

  dimension: employee_productivity_i_e_rework_realization_period {
    type: number
    sql: ${TABLE}.employee_productivity_i_e_rework_realization_period ;;
  }

  dimension: employee_role {
    type: number
    sql: ${TABLE}.employee_role ;;
  }

  dimension: employee_title_ {
    type: string
    sql: ${TABLE}.employee_title_ ;;
  }

  dimension_group: end_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: ending_date_time_ {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ending_date_time_ ;;
  }

  dimension: enhance_customer_experience_realization_period {
    type: number
    sql: ${TABLE}.enhance_customer_experience_realization_period ;;
  }

  dimension: entry {
    type: number
    sql: ${TABLE}.entry ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
  }

  dimension: epic_color {
    type: string
    sql: ${TABLE}.epic_color ;;
  }

  dimension: epic_link {
    type: number
    sql: ${TABLE}.epic_link ;;
  }

  dimension: epic_name {
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension: epic_status {
    type: number
    sql: ${TABLE}.epic_status ;;
  }

  dimension: epp_discounts {
    type: number
    sql: ${TABLE}.epp_discounts ;;
  }

  dimension: estimate_the_number_of_days_required_to_launch_your_proposed_solution {
    type: number
    sql: ${TABLE}.estimate_the_number_of_days_required_to_launch_your_proposed_solution ;;
  }

  dimension: estimate_the_number_of_individuals_required_to_launch_your_proposed_solution {
    type: number
    sql: ${TABLE}.estimate_the_number_of_individuals_required_to_launch_your_proposed_solution ;;
  }

  dimension: estimation_period_of_achievement_for_mandatory_benefits_ {
    type: string
    sql: ${TABLE}.estimation_period_of_achievement_for_mandatory_benefits_ ;;
  }

  dimension: estimation_period_of_achievement_for_other_benefits_ {
    type: string
    sql: ${TABLE}.estimation_period_of_achievement_for_other_benefits_ ;;
  }

  dimension: exit_strategy_details {
    type: string
    sql: ${TABLE}.exit_strategy_details ;;
  }

  dimension: expected {
    type: string
    sql: ${TABLE}.expected ;;
  }

  dimension: expected_1 {
    type: string
    sql: ${TABLE}.expected_1 ;;
  }

  dimension: expected_2 {
    type: string
    sql: ${TABLE}.expected_2 ;;
  }

  dimension: expected_3 {
    type: string
    sql: ${TABLE}.expected_3 ;;
  }

  dimension: expected_4 {
    type: string
    sql: ${TABLE}.expected_4 ;;
  }

  dimension: expected_5 {
    type: string
    sql: ${TABLE}.expected_5 ;;
  }

  dimension: expected_6 {
    type: string
    sql: ${TABLE}.expected_6 ;;
  }

  dimension_group: expected_date_for_solution {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.expected_date_for_solution ;;
  }

  dimension: expected_dis_advantages_ {
    type: string
    sql: ${TABLE}.expected_dis_advantages_ ;;
  }

  dimension: expected_expenses_ {
    type: string
    sql: ${TABLE}.expected_expenses_ ;;
  }

  dimension: expected_period_for_the_project_ {
    type: string
    sql: ${TABLE}.expected_period_for_the_project_ ;;
  }

  dimension: expected_risks_ {
    type: string
    sql: ${TABLE}.expected_risks_ ;;
  }

  dimension_group: expected_time_of_delivery {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expected_time_of_delivery ;;
  }

  dimension: ext_ {
    type: string
    sql: ${TABLE}.ext_ ;;
  }

  dimension: ext_mobile_number {
    type: string
    sql: ${TABLE}.ext_mobile_number ;;
  }

  dimension_group: extend_due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.extend_due_date ;;
  }

  dimension: feature_deeplink {
    type: string
    sql: ${TABLE}.feature_deeplink ;;
  }

  dimension: feature_deeplinks {
    type: string
    sql: ${TABLE}.feature_deeplinks ;;
  }

  dimension: fields_to_be_added_removed {
    type: string
    sql: ${TABLE}.fields_to_be_added_removed ;;
  }

  dimension: fields_to_be_included_in_the_report_ {
    type: string
    sql: ${TABLE}.fields_to_be_included_in_the_report_ ;;
  }

  dimension: final_complaint_ {
    type: number
    sql: ${TABLE}.final_complaint_ ;;
  }

  dimension: financial_impact_ {
    type: number
    sql: ${TABLE}.financial_impact_ ;;
  }

  dimension: financial_loss_ {
    type: number
    sql: ${TABLE}.financial_loss_ ;;
  }

  dimension: finding_severity {
    type: string
    sql: ${TABLE}.finding_severity ;;
  }

  dimension: first_6_digits_ {
    type: string
    sql: ${TABLE}.first_6_digits_ ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: fix_version {
    type: number
    sql: ${TABLE}.fix_version ;;
  }

  dimension: flagged {
    type: number
    sql: ${TABLE}.flagged ;;
  }

  dimension: follow_up_account_ops {
    type: number
    sql: ${TABLE}.follow_up_account_ops ;;
  }

  dimension: follow_up_aml {
    type: number
    sql: ${TABLE}.follow_up_aml ;;
  }

  dimension: follow_up_branches {
    type: number
    sql: ${TABLE}.follow_up_branches ;;
  }

  dimension: follow_up_business_team {
    type: number
    sql: ${TABLE}.follow_up_business_team ;;
  }

  dimension: follow_up_card_ops {
    type: number
    sql: ${TABLE}.follow_up_card_ops ;;
  }

  dimension: follow_up_clearing_dep_ {
    type: number
    sql: ${TABLE}.follow_up_clearing_dep_ ;;
  }

  dimension: follow_up_collection_team {
    type: number
    sql: ${TABLE}.follow_up_collection_team ;;
  }

  dimension: follow_up_credit_admin {
    type: number
    sql: ${TABLE}.follow_up_credit_admin ;;
  }

  dimension: follow_up_customer_complaints {
    type: number
    sql: ${TABLE}.follow_up_customer_complaints ;;
  }

  dimension: follow_up_deposits_instructions {
    type: number
    sql: ${TABLE}.follow_up_deposits_instructions ;;
  }

  dimension: follow_up_direct_sales {
    type: number
    sql: ${TABLE}.follow_up_direct_sales ;;
  }

  dimension: follow_up_dob_team {
    type: number
    sql: ${TABLE}.follow_up_dob_team ;;
  }

  dimension: follow_up_exchange_unit {
    type: number
    sql: ${TABLE}.follow_up_exchange_unit ;;
  }

  dimension: follow_up_loans_and_salaries {
    type: number
    sql: ${TABLE}.follow_up_loans_and_salaries ;;
  }

  dimension: follow_up_outward_transfer {
    type: number
    sql: ${TABLE}.follow_up_outward_transfer ;;
  }

  dimension: follow_up_retail_credit {
    type: number
    sql: ${TABLE}.follow_up_retail_credit ;;
  }

  dimension: follow_up_type_ {
    type: number
    sql: ${TABLE}.follow_up_type_ ;;
  }

  dimension: forms_locked {
    type: number
    sql: ${TABLE}.forms_locked ;;
  }

  dimension: forms_open {
    type: number
    sql: ${TABLE}.forms_open ;;
  }

  dimension: forms_submitted {
    type: number
    sql: ${TABLE}.forms_submitted ;;
  }

  dimension: forms_total {
    type: number
    sql: ${TABLE}.forms_total ;;
  }

  dimension: frequency_of_the_problem_opportunity {
    type: string
    sql: ${TABLE}.frequency_of_the_problem_opportunity ;;
  }

  dimension: from_branch {
    type: number
    sql: ${TABLE}.from_branch ;;
  }

  dimension: ft_number {
    type: string
    sql: ${TABLE}.ft_number ;;
  }

  dimension: g_mail_request {
    type: number
    sql: ${TABLE}.g_mail_request ;;
  }

  dimension_group: gantt_pro_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.gantt_pro_end_date ;;
  }

  dimension_group: gantt_pro_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.gantt_pro_start_date ;;
  }

  dimension: github_repos {
    type: string
    sql: ${TABLE}.github_repos ;;
  }

  dimension: goal_impact {
    type: number
    sql: ${TABLE}.goal_impact ;;
  }

  dimension: grant_access_to {
    type: string
    sql: ${TABLE}.grant_access_to ;;
  }

  dimension: hardware {
    type: number
    sql: ${TABLE}.hardware ;;
  }

  dimension: hardware_request_option {
    type: number
    sql: ${TABLE}.hardware_request_option ;;
  }

  dimension: head_teller_teller_ecc_alternative_id {
    type: string
    sql: ${TABLE}.head_teller_teller_ecc_alternative_id ;;
  }

  dimension: head_teller_teller_till_box_number_ {
    type: string
    sql: ${TABLE}.head_teller_teller_till_box_number_ ;;
  }

  dimension: help_center_key {
    type: string
    sql: ${TABLE}.help_center_key ;;
  }

  dimension: help_desk {
    type: string
    sql: ${TABLE}.help_desk ;;
  }

  dimension: help_desk_request {
    type: number
    sql: ${TABLE}.help_desk_request ;;
  }

  dimension_group: hired_date_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.hired_date_ ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: how_easily_can_the_price_be_adjusted_ {
    type: number
    sql: ${TABLE}.how_easily_can_the_price_be_adjusted_ ;;
  }

  dimension: how_is_it_related_to_this_okr {
    type: string
    sql: ${TABLE}.how_is_it_related_to_this_okr ;;
  }

  dimension: how_is_it_related_to_this_okr_description_ {
    type: string
    sql: ${TABLE}.how_is_it_related_to_this_okr_description_ ;;
  }

  dimension: how_is_related_to_okr_baseline_ {
    type: string
    sql: ${TABLE}.how_is_related_to_okr_baseline_ ;;
  }

  dimension: how_is_related_to_okr_target_ {
    type: string
    sql: ${TABLE}.how_is_related_to_okr_target_ ;;
  }

  dimension: how_many_demographics_are_being_targeted_ {
    type: number
    sql: ${TABLE}.how_many_demographics_are_being_targeted_ ;;
  }

  dimension: how_many_market_segments_are_being_targeted_ {
    type: number
    sql: ${TABLE}.how_many_market_segments_are_being_targeted_ ;;
  }

  dimension: hrkat_tzwyr_ahtyal {
    type: number
    sql: ${TABLE}.hrkat_tzwyr_ahtyal ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: if_training_or_recruiting_is_required_provide_details {
    type: string
    sql: ${TABLE}.if_training_or_recruiting_is_required_provide_details ;;
  }

  dimension: if_yes {
    type: number
    sql: ${TABLE}.if_yes ;;
  }

  dimension: if_yes_name_of_new_system_and_approximite_cost {
    type: string
    sql: ${TABLE}.if_yes_name_of_new_system_and_approximite_cost ;;
  }

  dimension: impact {
    type: number
    sql: ${TABLE}.impact ;;
  }

  dimension: impact_issue_ {
    type: number
    sql: ${TABLE}.impact_issue_ ;;
  }

  dimension: impacted_application {
    type: number
    sql: ${TABLE}.impacted_application ;;
  }

  dimension: impediment_type {
    type: number
    sql: ${TABLE}.impediment_type ;;
  }

  dimension: implementation_period {
    type: number
    sql: ${TABLE}.implementation_period ;;
  }

  dimension: implementation_plan {
    type: string
    sql: ${TABLE}.implementation_plan ;;
  }

  dimension: importance {
    type: number
    sql: ${TABLE}.importance ;;
  }

  dimension: increase_business_growth_realization_period {
    type: number
    sql: ${TABLE}.increase_business_growth_realization_period ;;
  }

  dimension: increase_business_opportunities_realization_period {
    type: number
    sql: ${TABLE}.increase_business_opportunities_realization_period ;;
  }

  dimension: increase_customer_growth_level_of_impact {
    type: number
    sql: ${TABLE}.increase_customer_growth_level_of_impact ;;
  }

  dimension: increase_customer_growth_percentage_of_increase {
    type: number
    sql: ${TABLE}.increase_customer_growth_percentage_of_increase ;;
  }

  dimension: increase_customer_growth_realization_period {
    type: number
    sql: ${TABLE}.increase_customer_growth_realization_period ;;
  }

  dimension: increase_employee_productivity_realization_period {
    type: number
    sql: ${TABLE}.increase_employee_productivity_realization_period ;;
  }

  dimension: increase_growth_business_opportunities {
    type: string
    sql: ${TABLE}.increase_growth_business_opportunities ;;
  }

  dimension: increase_market_share_level_of_impact {
    type: number
    sql: ${TABLE}.increase_market_share_level_of_impact ;;
  }

  dimension: increase_market_share_percentage_of_increase {
    type: number
    sql: ${TABLE}.increase_market_share_percentage_of_increase ;;
  }

  dimension: increase_market_share_realization_period {
    type: number
    sql: ${TABLE}.increase_market_share_realization_period ;;
  }

  dimension: increase_revenue_level_of_impact {
    type: number
    sql: ${TABLE}.increase_revenue_level_of_impact ;;
  }

  dimension: increase_revenue_percentage_of_increase {
    type: number
    sql: ${TABLE}.increase_revenue_percentage_of_increase ;;
  }

  dimension: increase_revenue_realization_period {
    type: number
    sql: ${TABLE}.increase_revenue_realization_period ;;
  }

  dimension: initiative {
    type: string
    sql: ${TABLE}.initiative ;;
  }

  dimension: inquiry {
    type: number
    sql: ${TABLE}.inquiry ;;
  }

  dimension: internal_rate_of_return_irr_calculation_and_results {
    type: string
    sql: ${TABLE}.internal_rate_of_return_irr_calculation_and_results ;;
  }

  dimension: internal_transfer_requests_ {
    type: number
    sql: ${TABLE}.internal_transfer_requests_ ;;
  }

  dimension: internet_access_service_ip_address_ {
    type: string
    sql: ${TABLE}.internet_access_service_ip_address_ ;;
  }

  dimension: investigation_reason {
    type: number
    sql: ${TABLE}.investigation_reason ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: ip_address_for_servers_to_be_accessed {
    type: string
    sql: ${TABLE}.ip_address_for_servers_to_be_accessed ;;
  }

  dimension: is_the_issue_customer_related_ {
    type: number
    sql: ${TABLE}.is_the_issue_customer_related_ ;;
  }

  dimension: is_the_project_supported_by_a_market_study {
    type: number
    sql: ${TABLE}.is_the_project_supported_by_a_market_study ;;
  }

  dimension: is_this_identified_process_in_end_2_end_framework_ {
    type: number
    value_format_name: id
    sql: ${TABLE}.is_this_identified_process_in_end_2_end_framework_ ;;
  }

  dimension: is_training_or_recruiting_required_ {
    type: number
    sql: ${TABLE}.is_training_or_recruiting_required_ ;;
  }

  dimension: issue_classification {
    type: number
    sql: ${TABLE}.issue_classification ;;
  }

  dimension: issue_color {
    type: string
    sql: ${TABLE}.issue_color ;;
  }

  dimension: issue_link_count {
    type: number
    sql: ${TABLE}.issue_link_count ;;
  }

  dimension: issue_type {
    type: number
    sql: ${TABLE}.issue_type ;;
  }

  dimension: it_action {
    type: string
    sql: ${TABLE}.it_action ;;
  }

  dimension: iteration_field {
    type: string
    sql: ${TABLE}.iteration_field ;;
  }

  dimension: justification_ {
    type: string
    sql: ${TABLE}.justification_ ;;
  }

  dimension: justification_for_change {
    type: string
    sql: ${TABLE}.justification_for_change ;;
  }

  dimension: justification_implementation_more_than_6_sprints {
    type: string
    sql: ${TABLE}.justification_implementation_more_than_6_sprints ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: khta_bnk_am_la {
    type: number
    sql: ${TABLE}.khta_bnk_am_la ;;
  }

  dimension: known_error {
    type: number
    sql: ${TABLE}.known_error ;;
  }

  dimension: kyc_support_type {
    type: number
    sql: ${TABLE}.kyc_support_type ;;
  }

  dimension: last_4_digits_ {
    type: string
    sql: ${TABLE}.last_4_digits_ ;;
  }

  dimension: last_name_ {
    type: string
    sql: ${TABLE}.last_name_ ;;
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_viewed ;;
  }

  dimension_group: last_working_day {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_working_day ;;
  }

  dimension: level_2_support_assignee {
    type: string
    sql: ${TABLE}.level_2_support_assignee ;;
  }

  dimension: level_2_support_sla {
    type: string
    sql: ${TABLE}.level_2_support_sla ;;
  }

  dimension: level_3_support_assignee {
    type: string
    sql: ${TABLE}.level_3_support_assignee ;;
  }

  dimension: level_of_impact_ {
    type: number
    sql: ${TABLE}.level_of_impact_ ;;
  }

  dimension: level_of_impact_affected_party_ {
    type: number
    sql: ${TABLE}.level_of_impact_affected_party_ ;;
  }

  dimension: level_of_impact_area_others {
    type: number
    sql: ${TABLE}.level_of_impact_area_others ;;
  }

  dimension: level_of_impact_customer_experience {
    type: number
    sql: ${TABLE}.level_of_impact_customer_experience ;;
  }

  dimension: level_of_impact_customer_satisfaction_rate {
    type: number
    sql: ${TABLE}.level_of_impact_customer_satisfaction_rate ;;
  }

  dimension: level_of_impact_customer_waiting_time {
    type: number
    sql: ${TABLE}.level_of_impact_customer_waiting_time ;;
  }

  dimension: level_of_impact_customers {
    type: number
    sql: ${TABLE}.level_of_impact_customers ;;
  }

  dimension: level_of_impact_departments_affected {
    type: number
    sql: ${TABLE}.level_of_impact_departments_affected ;;
  }

  dimension: level_of_impact_employee_productivity {
    type: number
    sql: ${TABLE}.level_of_impact_employee_productivity ;;
  }

  dimension: level_of_impact_employees {
    type: number
    sql: ${TABLE}.level_of_impact_employees ;;
  }

  dimension: level_of_impact_financial_costs {
    type: number
    sql: ${TABLE}.level_of_impact_financial_costs ;;
  }

  dimension: level_of_impact_implementation_urgency {
    type: number
    sql: ${TABLE}.level_of_impact_implementation_urgency ;;
  }

  dimension: level_of_impact_legal {
    type: number
    sql: ${TABLE}.level_of_impact_legal ;;
  }

  dimension: level_of_impact_non_customers {
    type: number
    sql: ${TABLE}.level_of_impact_non_customers ;;
  }

  dimension: level_of_impact_number_of_people_involved {
    type: number
    sql: ${TABLE}.level_of_impact_number_of_people_involved ;;
  }

  dimension: level_of_impact_operational {
    type: number
    sql: ${TABLE}.level_of_impact_operational ;;
  }

  dimension: level_of_impact_others {
    type: number
    sql: ${TABLE}.level_of_impact_others ;;
  }

  dimension: level_of_impact_partners {
    type: number
    sql: ${TABLE}.level_of_impact_partners ;;
  }

  dimension: level_of_impact_process_efficiency {
    type: number
    sql: ${TABLE}.level_of_impact_process_efficiency ;;
  }

  dimension: level_of_impact_risk {
    type: number
    sql: ${TABLE}.level_of_impact_risk ;;
  }

  dimension: level_of_impact_segments_affected {
    type: number
    sql: ${TABLE}.level_of_impact_segments_affected ;;
  }

  dimension: level_of_implementation_urgency_post_implementation_expected_value {
    type: string
    sql: ${TABLE}.level_of_implementation_urgency_post_implementation_expected_value ;;
  }

  dimension: level_of_implementation_urgency_pre_implementation_value {
    type: string
    sql: ${TABLE}.level_of_implementation_urgency_pre_implementation_value ;;
  }

  dimension: link_to_report {
    type: string
    sql: ${TABLE}.link_to_report ;;
  }

  dimension: list_of_approval {
    type: string
    sql: ${TABLE}.list_of_approval ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: locked_forms {
    type: number
    sql: ${TABLE}.locked_forms ;;
  }

  dimension: login_failure_issue {
    type: number
    sql: ${TABLE}.login_failure_issue ;;
  }

  dimension: m_lwmat_alatsal_balmwzf_ {
    type: string
    sql: ${TABLE}.m_lwmat_alatsal_balmwzf_ ;;
  }

  dimension: major_incident {
    type: string
    sql: ${TABLE}.major_incident ;;
  }

  dimension: manager_approval {
    type: number
    sql: ${TABLE}.manager_approval ;;
  }

  dimension: mandatory_benefits {
    type: string
    sql: ${TABLE}.mandatory_benefits ;;
  }

  dimension: market_analysis_metric_others_results {
    type: string
    sql: ${TABLE}.market_analysis_metric_others_results ;;
  }

  dimension: market_analysis_sources {
    type: string
    sql: ${TABLE}.market_analysis_sources ;;
  }

  dimension: market_growth_metric_results_quantitative_ {
    type: string
    sql: ${TABLE}.market_growth_metric_results_quantitative_ ;;
  }

  dimension: market_size_metric_results_quantitative_ {
    type: string
    sql: ${TABLE}.market_size_metric_results_quantitative_ ;;
  }

  dimension: market_trends_results {
    type: string
    sql: ${TABLE}.market_trends_results ;;
  }

  dimension: measurement {
    type: string
    sql: ${TABLE}.measurement ;;
  }

  dimension: measurement_method {
    type: string
    sql: ${TABLE}.measurement_method ;;
  }

  dimension: metric {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: metric_loss_in_jod {
    type: string
    sql: ${TABLE}.metric_loss_in_jod ;;
  }

  dimension: metric_loss_in_jod_field {
    type: string
    sql: ${TABLE}.metric_loss_in_jod_field ;;
  }

  dimension: metric_percentage_of_amendment_ {
    type: number
    sql: ${TABLE}.metric_percentage_of_amendment_ ;;
  }

  dimension: metric_rework_rate_percentage_ {
    type: number
    sql: ${TABLE}.metric_rework_rate_percentage_ ;;
  }

  dimension: metric_tat {
    type: string
    sql: ${TABLE}.metric_tat ;;
  }

  dimension: metric_tat_in_minutes_ {
    type: number
    sql: ${TABLE}.metric_tat_in_minutes_ ;;
  }

  dimension: metric_tat_rework {
    type: string
    sql: ${TABLE}.metric_tat_rework ;;
  }

  dimension: milestones_ {
    type: string
    sql: ${TABLE}.milestones_ ;;
  }

  dimension: minimize_operational_risks_realization_period {
    type: number
    sql: ${TABLE}.minimize_operational_risks_realization_period ;;
  }

  dimension: mlkhs_alshkwy_ {
    type: string
    sql: ${TABLE}.mlkhs_alshkwy_ ;;
  }

  dimension: mobile_application_issue {
    type: number
    sql: ${TABLE}.mobile_application_issue ;;
  }

  dimension: mobile_platform_ {
    type: number
    sql: ${TABLE}.mobile_platform_ ;;
  }

  dimension: mobile_type_ {
    type: number
    sql: ${TABLE}.mobile_type_ ;;
  }

  dimension: mos_no_ {
    type: string
    sql: ${TABLE}.mos_no_ ;;
  }

  dimension: mule_links {
    type: string
    sql: ${TABLE}.mule_links ;;
  }

  dimension: mvp_details {
    type: string
    sql: ${TABLE}.mvp_details ;;
  }

  dimension: name_ {
    type: string
    sql: ${TABLE}.name_ ;;
  }

  dimension: nationality_id_ {
    type: string
    sql: ${TABLE}.nationality_id_ ;;
  }

  dimension: needs_description {
    type: string
    sql: ${TABLE}.needs_description ;;
  }

  dimension: net_present_value_npv_calculation_and_result {
    type: string
    sql: ${TABLE}.net_present_value_npv_calculation_and_result ;;
  }

  dimension: new_opportunity {
    type: number
    sql: ${TABLE}.new_opportunity ;;
  }

  dimension: non_pos_request {
    type: number
    sql: ${TABLE}.non_pos_request ;;
  }

  dimension: north_star {
    type: number
    sql: ${TABLE}.north_star ;;
  }

  dimension: note_ {
    type: string
    sql: ${TABLE}.note_ ;;
  }

  dimension: number_of_people_involved_post_implementation_value {
    type: string
    sql: ${TABLE}.number_of_people_involved_post_implementation_value ;;
  }

  dimension: number_of_people_involved_pre_implementation_value {
    type: string
    sql: ${TABLE}.number_of_people_involved_pre_implementation_value ;;
  }

  dimension: number_of_people_involved_realization_period {
    type: number
    sql: ${TABLE}.number_of_people_involved_realization_period ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}.objective ;;
  }

  dimension: objective_old {
    type: string
    sql: ${TABLE}.objective_old ;;
  }

  dimension: open_forms {
    type: number
    sql: ${TABLE}.open_forms ;;
  }

  dimension: operational_categorization {
    type: number
    sql: ${TABLE}.operational_categorization ;;
  }

  dimension: original_estimate {
    type: number
    sql: ${TABLE}.original_estimate ;;
  }

  dimension: os_version_ {
    type: string
    sql: ${TABLE}.os_version_ ;;
  }

  dimension: other_benefits_ {
    type: string
    sql: ${TABLE}.other_benefits_ ;;
  }

  dimension: other_reason_for_wow_moment {
    type: string
    sql: ${TABLE}.other_reason_for_wow_moment ;;
  }

  dimension: other_recommended_gift {
    type: string
    sql: ${TABLE}.other_recommended_gift ;;
  }

  dimension: other_source {
    type: string
    sql: ${TABLE}.other_source ;;
  }

  dimension: otp_type {
    type: number
    sql: ${TABLE}.otp_type ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: parent {
    type: number
    sql: ${TABLE}.parent ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: parent_link {
    type: number
    sql: ${TABLE}.parent_link ;;
  }

  dimension: party_name {
    type: string
    sql: ${TABLE}.party_name ;;
  }

  dimension: patch_publication_date {
    type: string
    sql: ${TABLE}.patch_publication_date ;;
  }

  dimension: payback_period_pp_calculation_and_result {
    type: string
    sql: ${TABLE}.payback_period_pp_calculation_and_result ;;
  }

  dimension: payment_method {
    type: number
    sql: ${TABLE}.payment_method ;;
  }

  dimension: pending_reason {
    type: number
    sql: ${TABLE}.pending_reason ;;
  }

  dimension: percentage_of_employee_satisfaction_level_of_impact {
    type: number
    sql: ${TABLE}.percentage_of_employee_satisfaction_level_of_impact ;;
  }

  dimension: percentage_of_employee_satisfaction_post_implementation_value {
    type: number
    sql: ${TABLE}.percentage_of_employee_satisfaction_post_implementation_value ;;
  }

  dimension: percentage_of_employee_satisfaction_pre_implementation_value {
    type: number
    sql: ${TABLE}.percentage_of_employee_satisfaction_pre_implementation_value ;;
  }

  dimension: percentage_of_employee_satisfaction_realization_period {
    type: number
    sql: ${TABLE}.percentage_of_employee_satisfaction_realization_period ;;
  }

  dimension: performance_availability_level_of_impact {
    type: number
    sql: ${TABLE}.performance_availability_level_of_impact ;;
  }

  dimension: performance_availability_post_implementation_value {
    type: number
    sql: ${TABLE}.performance_availability_post_implementation_value ;;
  }

  dimension: performance_availability_pre_implementation_value {
    type: number
    sql: ${TABLE}.performance_availability_pre_implementation_value ;;
  }

  dimension: performance_availability_realization_period {
    type: number
    sql: ${TABLE}.performance_availability_realization_period ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension_group: planned_delivery {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.planned_delivery_date ;;
  }

  dimension_group: planned_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.planned_end_date ;;
  }

  dimension_group: planned_release {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.planned_release_date ;;
  }

  dimension_group: planned_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.planned_start_date ;;
  }

  dimension: plugin_output {
    type: string
    sql: ${TABLE}.plugin_output ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: port {
    type: number
    sql: ${TABLE}.port ;;
  }

  dimension: preventive_action {
    type: string
    sql: ${TABLE}.preventive_action ;;
  }

  dimension: pricing_strategy_justification_and_supporting_data {
    type: string
    sql: ${TABLE}.pricing_strategy_justification_and_supporting_data ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: privilege_request_type {
    type: number
    sql: ${TABLE}.privilege_request_type ;;
  }

  dimension: problem_statement {
    type: string
    sql: ${TABLE}.problem_statement ;;
  }

  dimension: problem_type {
    type: number
    sql: ${TABLE}.problem_type ;;
  }

  dimension: process_category_ {
    type: number
    sql: ${TABLE}.process_category_ ;;
  }

  dimension: process_efficency_i_e_tat_post_implementation_expected_value {
    type: string
    sql: ${TABLE}.process_efficency_i_e_tat_post_implementation_expected_value ;;
  }

  dimension: process_efficency_i_e_tat_pre_implementation_value {
    type: string
    sql: ${TABLE}.process_efficency_i_e_tat_pre_implementation_value ;;
  }

  dimension: process_efficency_i_e_tat_realization_period {
    type: number
    sql: ${TABLE}.process_efficency_i_e_tat_realization_period ;;
  }

  dimension: process_efficiency_i_e_tat_post_implementation_expected_value {
    type: number
    sql: ${TABLE}.process_efficiency_i_e_tat_post_implementation_expected_value ;;
  }

  dimension: process_efficiency_i_e_tat_pre_implementation_value {
    type: number
    sql: ${TABLE}.process_efficiency_i_e_tat_pre_implementation_value ;;
  }

  dimension: product {
    type: number
    sql: ${TABLE}.product ;;
  }

  dimension: product_area {
    type: number
    sql: ${TABLE}.product_area ;;
  }

  dimension: product_categorization {
    type: number
    sql: ${TABLE}.product_categorization ;;
  }

  dimension: product_category_ {
    type: number
    sql: ${TABLE}.product_category_ ;;
  }

  dimension: product_name {
    type: number
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_reference {
    type: string
    sql: ${TABLE}.product_reference ;;
  }

  dimension: product_squad {
    type: number
    sql: ${TABLE}.product_squad ;;
  }

  dimension: program_increment {
    type: string
    sql: ${TABLE}.program_increment ;;
  }

  dimension: project {
    type: number
    sql: ${TABLE}.project ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: project_overview_key {
    type: string
    sql: ${TABLE}.project_overview_key ;;
  }

  dimension: project_overview_status {
    type: string
    sql: ${TABLE}.project_overview_status ;;
  }

  dimension: project_size {
    type: number
    sql: ${TABLE}.project_size ;;
  }

  dimension: project_start {
    type: string
    sql: ${TABLE}.project_start ;;
  }

  dimension: project_target {
    type: string
    sql: ${TABLE}.project_target ;;
  }

  dimension: project_team {
    type: number
    sql: ${TABLE}.project_team ;;
  }

  dimension: project_type {
    type: number
    sql: ${TABLE}.project_type ;;
  }

  dimension: proposed_out_put {
    type: string
    sql: ${TABLE}.proposed_out_put ;;
  }

  dimension: proposed_solution_ {
    type: string
    sql: ${TABLE}.proposed_solution_ ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: public_description {
    type: string
    sql: ${TABLE}.public_description ;;
  }

  dimension: q_progress {
    type: number
    sql: ${TABLE}.q_progress ;;
  }

  dimension: q_progress_reason {
    type: string
    sql: ${TABLE}.q_progress_reason ;;
  }

  dimension_group: qa_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.qa_end_date ;;
  }

  dimension: qa_size {
    type: number
    sql: ${TABLE}.qa_size ;;
  }

  dimension_group: qa_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.qa_start_date ;;
  }

  dimension: qa_team_lead {
    type: number
    sql: ${TABLE}.qa_team_lead ;;
  }

  dimension: quality_of_the_process_level_of_impact {
    type: number
    sql: ${TABLE}.quality_of_the_process_level_of_impact ;;
  }

  dimension: quality_of_the_process_post_implementation_value {
    type: number
    sql: ${TABLE}.quality_of_the_process_post_implementation_value ;;
  }

  dimension: quality_of_the_process_pre_implementation_value {
    type: number
    sql: ${TABLE}.quality_of_the_process_pre_implementation_value ;;
  }

  dimension: quality_of_the_process_realization_period {
    type: number
    sql: ${TABLE}.quality_of_the_process_realization_period ;;
  }

  dimension: qymt_alt_wyd_almaly {
    type: string
    sql: ${TABLE}.qymt_alt_wyd_almaly ;;
  }

  dimension: rank {
    type: string
    sql: ${TABLE}.rank ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension_group: re_open {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.re_open_date ;;
  }

  dimension: realization_period {
    type: number
    sql: ${TABLE}.realization_period ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: reason_for_release {
    type: string
    sql: ${TABLE}.reason_for_release ;;
  }

  dimension: reason_for_wow_moment_ {
    type: number
    sql: ${TABLE}.reason_for_wow_moment_ ;;
  }

  dimension: reason_of_error {
    type: number
    sql: ${TABLE}.reason_of_error ;;
  }

  dimension: reason_of_retention {
    type: string
    sql: ${TABLE}.reason_of_retention ;;
  }

  dimension_group: receiving_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.receiving_date_time ;;
  }

  dimension: recommended_gift {
    type: number
    sql: ${TABLE}.recommended_gift ;;
  }

  dimension: recurring_ {
    type: number
    sql: ${TABLE}.recurring_ ;;
  }

  dimension: red_flag_issue {
    type: number
    sql: ${TABLE}.red_flag_issue ;;
  }

  dimension: reduce_churn_level_of_impact {
    type: number
    sql: ${TABLE}.reduce_churn_level_of_impact ;;
  }

  dimension: reduce_churn_percentage_of_churn_reduction {
    type: number
    sql: ${TABLE}.reduce_churn_percentage_of_churn_reduction ;;
  }

  dimension: reduce_churn_realization_period {
    type: number
    sql: ${TABLE}.reduce_churn_realization_period ;;
  }

  dimension: reduce_costs_level_of_impact {
    type: number
    sql: ${TABLE}.reduce_costs_level_of_impact ;;
  }

  dimension: reduce_costs_percentage_of_reduction {
    type: number
    sql: ${TABLE}.reduce_costs_percentage_of_reduction ;;
  }

  dimension: reduce_costs_realization_period {
    type: number
    sql: ${TABLE}.reduce_costs_realization_period ;;
  }

  dimension: reduce_operational_risks_level_of_impact {
    type: number
    sql: ${TABLE}.reduce_operational_risks_level_of_impact ;;
  }

  dimension: reduce_operational_risks_percentage_of_reduction {
    type: number
    sql: ${TABLE}.reduce_operational_risks_percentage_of_reduction ;;
  }

  dimension: reduce_operational_risks_realization_period {
    type: number
    sql: ${TABLE}.reduce_operational_risks_realization_period ;;
  }

  dimension: rejection_reason {
    type: string
    sql: ${TABLE}.rejection_reason ;;
  }

  dimension: related_application_bpm {
    type: number
    sql: ${TABLE}.related_application_bpm ;;
  }

  dimension: related_application_cb {
    type: number
    sql: ${TABLE}.related_application_cb ;;
  }

  dimension: related_application_e_channels {
    type: number
    sql: ${TABLE}.related_application_e_channels ;;
  }

  dimension_group: release_date_and_time_ {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.release_date_and_time_ ;;
  }

  dimension: release_notes_en_ar_ {
    type: string
    sql: ${TABLE}.release_notes_en_ar_ ;;
  }

  dimension: release_related_ticket_ {
    type: string
    sql: ${TABLE}.release_related_ticket_ ;;
  }

  dimension: releases_breakdown {
    type: string
    sql: ${TABLE}.releases_breakdown ;;
  }

  dimension: remaining_estimate {
    type: number
    sql: ${TABLE}.remaining_estimate ;;
  }

  dimension: report_name_ {
    type: string
    sql: ${TABLE}.report_name_ ;;
  }

  dimension: report_reason_s_aim_s_ {
    type: string
    sql: ${TABLE}.report_reason_s_aim_s_ ;;
  }

  dimension: report_request_type {
    type: number
    sql: ${TABLE}.report_request_type ;;
  }

  dimension: report_type_ {
    type: number
    sql: ${TABLE}.report_type_ ;;
  }

  dimension: reporter {
    type: string
    sql: ${TABLE}.reporter ;;
  }

  dimension: request_type_ {
    type: number
    sql: ${TABLE}.request_type_ ;;
  }

  dimension: requested_service {
    type: number
    sql: ${TABLE}.requested_service ;;
  }

  dimension: research_justification {
    type: string
    sql: ${TABLE}.research_justification ;;
  }

  dimension: resolution {
    type: number
    sql: ${TABLE}.resolution ;;
  }

  dimension_group: resolved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.resolved ;;
  }

  dimension_group: restart_date_and_time_ {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.restart_date_and_time_ ;;
  }

  dimension: restart_required {
    type: number
    sql: ${TABLE}.restart_required ;;
  }

  dimension: return_on_investment_roi_calculation_and_result {
    type: string
    sql: ${TABLE}.return_on_investment_roi_calculation_and_result ;;
  }

  dimension: revenue {
    type: string
    sql: ${TABLE}.revenue ;;
  }

  dimension: revision {
    type: string
    sql: ${TABLE}.revision ;;
  }

  dimension: reward_issue_ {
    type: number
    sql: ${TABLE}.reward_issue_ ;;
  }

  dimension: rfd_alshkwy_ {
    type: number
    sql: ${TABLE}.rfd_alshkwy_ ;;
  }

  dimension: risk_impact_ {
    type: string
    sql: ${TABLE}.risk_impact_ ;;
  }

  dimension: risk_index {
    type: string
    sql: ${TABLE}.risk_index ;;
  }

  dimension: risk_index_details {
    type: string
    sql: ${TABLE}.risk_index_details ;;
  }

  dimension: risk_index_text {
    type: string
    sql: ${TABLE}.risk_index_text ;;
  }

  dimension: risk_management_ {
    type: string
    sql: ${TABLE}.risk_management_ ;;
  }

  dimension: risk_probability_ {
    type: string
    sql: ${TABLE}.risk_probability_ ;;
  }

  dimension: risk_reduction {
    type: number
    sql: ${TABLE}.risk_reduction ;;
  }

  dimension: roadmap {
    type: number
    sql: ${TABLE}.roadmap ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension_group: roll_back_date_ {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.roll_back_date_ ;;
  }

  dimension_group: rollback_date_and_time_ {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.rollback_date_and_time_ ;;
  }

  dimension: rollback_plan {
    type: string
    sql: ${TABLE}.rollback_plan ;;
  }

  dimension: rollback_requires_restart_ {
    type: number
    sql: ${TABLE}.rollback_requires_restart_ ;;
  }

  dimension: root_cause {
    type: string
    sql: ${TABLE}.root_cause ;;
  }

  dimension: root_cause_defined_ {
    type: number
    sql: ${TABLE}.root_cause_defined_ ;;
  }

  dimension: salary_offer {
    type: number
    sql: ${TABLE}.salary_offer ;;
  }

  dimension: satisfaction {
    type: number
    sql: ${TABLE}.satisfaction ;;
  }

  dimension_group: satisfaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.satisfaction_date ;;
  }

  dimension: scalable_yes {
    type: string
    sql: ${TABLE}.scalable_yes ;;
  }

  dimension: scenario_id_ {
    type: string
    sql: ${TABLE}.scenario_id_ ;;
  }

  dimension: scheduled_ {
    type: number
    sql: ${TABLE}.scheduled_ ;;
  }

  dimension: scheduled_restart_ {
    type: number
    sql: ${TABLE}.scheduled_restart_ ;;
  }

  dimension: scheduling_frequency {
    type: string
    sql: ${TABLE}.scheduling_frequency ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: searching_fields_ {
    type: string
    sql: ${TABLE}.searching_fields_ ;;
  }

  dimension: security_level {
    type: number
    sql: ${TABLE}.security_level ;;
  }

  dimension: segment {
    type: number
    sql: ${TABLE}.segment ;;
  }

  dimension: segments_affected_post_implementation_expected_value {
    type: string
    sql: ${TABLE}.segments_affected_post_implementation_expected_value ;;
  }

  dimension: segments_affected_pre_implementation_expected_value {
    type: string
    sql: ${TABLE}.segments_affected_pre_implementation_expected_value ;;
  }

  dimension: segments_affected_realization_period {
    type: number
    sql: ${TABLE}.segments_affected_realization_period ;;
  }

  dimension: services_kr_1 {
    type: number
    sql: ${TABLE}.services_kr_1 ;;
  }

  dimension: services_kr_2 {
    type: number
    sql: ${TABLE}.services_kr_2 ;;
  }

  dimension: services_kr_3 {
    type: number
    sql: ${TABLE}.services_kr_3 ;;
  }

  dimension: services_kr_4 {
    type: number
    sql: ${TABLE}.services_kr_4 ;;
  }

  dimension: services_kr_5 {
    type: number
    sql: ${TABLE}.services_kr_5 ;;
  }

  dimension: services_kr_6 {
    type: number
    sql: ${TABLE}.services_kr_6 ;;
  }

  dimension: services_squad {
    type: number
    sql: ${TABLE}.services_squad ;;
  }

  dimension: severity {
    type: number
    sql: ${TABLE}.severity ;;
  }

  dimension: share_folder_issue {
    type: number
    sql: ${TABLE}.share_folder_issue ;;
  }

  dimension: show_hide_details {
    type: string
    sql: ${TABLE}.show_hide_details ;;
  }

  dimension: show_hide_details_mandatory_ {
    type: string
    sql: ${TABLE}.show_hide_details_mandatory_ ;;
  }

  dimension: show_hide_feature_keys {
    type: string
    sql: ${TABLE}.show_hide_feature_keys ;;
  }

  dimension: show_hide_feature_link {
    type: string
    sql: ${TABLE}.show_hide_feature_link ;;
  }

  dimension: show_hide_features {
    type: string
    sql: ${TABLE}.show_hide_features ;;
  }

  dimension: show_hide_links {
    type: string
    sql: ${TABLE}.show_hide_links ;;
  }

  dimension: slwk_alt_aml_almhny_ {
    type: number
    sql: ${TABLE}.slwk_alt_aml_almhny_ ;;
  }

  dimension: sms_on_a_2_a_system_ {
    type: number
    sql: ${TABLE}.sms_on_a_2_a_system_ ;;
  }

  dimension: sms_otp_issue {
    type: number
    sql: ${TABLE}.sms_otp_issue ;;
  }

  dimension: sms_services_status_ {
    type: number
    sql: ${TABLE}.sms_services_status_ ;;
  }

  dimension: software_issue_specify {
    type: string
    sql: ${TABLE}.software_issue_specify ;;
  }

  dimension: software_list {
    type: number
    sql: ${TABLE}.software_list ;;
  }

  dimension: solution {
    type: string
    sql: ${TABLE}.solution ;;
  }

  dimension: source {
    type: number
    sql: ${TABLE}.source ;;
  }

  dimension: spec_ready {
    type: number
    sql: ${TABLE}.spec_ready ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension_group: status_category_changed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.status_category_changed ;;
  }

  dimension: stories_of_epic_count {
    type: number
    sql: ${TABLE}.stories_of_epic_count ;;
  }

  dimension: stories_of_epic_in_done_status_category_count {
    type: number
    sql: ${TABLE}.stories_of_epic_in_done_status_category_count ;;
  }

  dimension: stories_of_epic_in_in_progress_status_category_count {
    type: number
    sql: ${TABLE}.stories_of_epic_in_in_progress_status_category_count ;;
  }

  dimension: stories_of_epic_in_to_do_status_category_count {
    type: number
    sql: ${TABLE}.stories_of_epic_in_to_do_status_category_count ;;
  }

  dimension: story_point_estimate {
    type: number
    sql: ${TABLE}.story_point_estimate ;;
  }

  dimension: story_points {
    type: number
    sql: ${TABLE}.story_points ;;
  }

  dimension: strategic_goal_metric_measure {
    type: string
    sql: ${TABLE}.strategic_goal_metric_measure ;;
  }

  dimension: sub_a_mal_albstnt_w_alhdayq {
    type: number
    sql: ${TABLE}.sub_a_mal_albstnt_w_alhdayq ;;
  }

  dimension: sub_a_mal_khrbayyt {
    type: number
    sql: ${TABLE}.sub_a_mal_khrbayyt ;;
  }

  dimension: sub_a_mal_mdnyt {
    type: number
    sql: ${TABLE}.sub_a_mal_mdnyt ;;
  }

  dimension: sub_a_mal_njart {
    type: number
    sql: ${TABLE}.sub_a_mal_njart ;;
  }

  dimension: sub_a_mal_t_qym {
    type: number
    sql: ${TABLE}.sub_a_mal_t_qym ;;
  }

  dimension: sub_albryd_w_alkhdmat_almsandt {
    type: number
    sql: ${TABLE}.sub_albryd_w_alkhdmat_almsandt ;;
  }

  dimension: sub_almsa_d {
    type: number
    sql: ${TABLE}.sub_almsa_d ;;
  }

  dimension: sub_almykanyk {
    type: number
    sql: ${TABLE}.sub_almykanyk ;;
  }

  dimension: sub_alnql {
    type: number
    sql: ${TABLE}.sub_alnql ;;
  }

  dimension: sub_alsht_w_alslamt_al_amt {
    type: number
    sql: ${TABLE}.sub_alsht_w_alslamt_al_amt ;;
  }

  dimension: sub_cabinet_repairs {
    type: number
    sql: ${TABLE}.sub_cabinet_repairs ;;
  }

  dimension: sub_dhan {
    type: number
    sql: ${TABLE}.sub_dhan ;;
  }

  dimension: sub_khdmat_aldyaft {
    type: number
    sql: ${TABLE}.sub_khdmat_aldyaft ;;
  }

  dimension: sub_khdmat_alghsyl_aldakhlyt {
    type: number
    sql: ${TABLE}.sub_khdmat_alghsyl_aldakhlyt ;;
  }

  dimension: sub_khdmat_alhrast {
    type: number
    sql: ${TABLE}.sub_khdmat_alhrast ;;
  }

  dimension: sub_khdmat_altnzyf_alm_tadt {
    type: number
    sql: ${TABLE}.sub_khdmat_altnzyf_alm_tadt ;;
  }

  dimension: sub_mkafht_alhshrat_w_alqward {
    type: number
    sql: ${TABLE}.sub_mkafht_alhshrat_w_alqward ;;
  }

  dimension: sub_mshakl_albna_ {
    type: number
    sql: ${TABLE}.sub_mshakl_albna_ ;;
  }

  dimension: sub_mshakl_smkrt {
    type: number
    sql: ${TABLE}.sub_mshakl_smkrt ;;
  }

  dimension: sub_nzam_althwyt_w_altkyyf {
    type: number
    sql: ${TABLE}.sub_nzam_althwyt_w_altkyyf ;;
  }

  dimension: sub_nzam_andhar_w_atfa_alhryq {
    type: number
    sql: ${TABLE}.sub_nzam_andhar_w_atfa_alhryq ;;
  }

  dimension: submitted_forms {
    type: number
    sql: ${TABLE}.submitted_forms ;;
  }

  dimension: subtask_count {
    type: number
    sql: ${TABLE}.subtask_count ;;
  }

  dimension: suggested_position {
    type: string
    sql: ${TABLE}.suggested_position ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: support_ticket_type_ {
    type: number
    sql: ${TABLE}.support_ticket_type_ ;;
  }

  dimension: synopsis {
    type: string
    sql: ${TABLE}.synopsis ;;
  }

  dimension: systems_involved {
    type: number
    sql: ${TABLE}.systems_involved ;;
  }

  dimension_group: target_date_for_sla_time_limit_1 {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.target_date_for_sla_time_limit_1 ;;
  }

  dimension_group: target_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.target_end ;;
  }

  dimension_group: target_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.target_start ;;
  }

  dimension_group: tarykh_aghlaq_alshkwy_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.tarykh_aghlaq_alshkwy_ ;;
  }

  dimension_group: tarykh_almylad_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.tarykh_almylad_ ;;
  }

  dimension_group: tarykh_astlam_alshkwy_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.tarykh_astlam_alshkwy_ ;;
  }

  dimension_group: tarykh_tqdym_alshkwy {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.tarykh_tqdym_alshkwy ;;
  }

  dimension: task_number_ {
    type: string
    sql: ${TABLE}.task_number_ ;;
  }

  dimension: task_priority {
    type: number
    sql: ${TABLE}.task_priority ;;
  }

  dimension: task_progress {
    type: number
    sql: ${TABLE}.task_progress ;;
  }

  dimension: task_status_comment_ {
    type: string
    sql: ${TABLE}.task_status_comment_ ;;
  }

  dimension: task_url {
    type: string
    sql: ${TABLE}.task_url ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  dimension: team_s_involved {
    type: number
    sql: ${TABLE}.team_s_involved ;;
  }

  dimension: tech_squad_team {
    type: number
    sql: ${TABLE}.tech_squad_team ;;
  }

  dimension: tech_team {
    type: number
    sql: ${TABLE}.tech_team ;;
  }

  dimension: technical_development_details_ {
    type: string
    sql: ${TABLE}.technical_development_details_ ;;
  }

  dimension: telephone_request_ {
    type: number
    sql: ${TABLE}.telephone_request_ ;;
  }

  dimension: template {
    type: number
    sql: ${TABLE}.template ;;
  }

  dimension: tenable_bid {
    type: string
    sql: ${TABLE}.tenable_bid ;;
  }

  dimension: tenable_cve {
    type: string
    sql: ${TABLE}.tenable_cve ;;
  }

  dimension: tenable_fqdn {
    type: string
    sql: ${TABLE}.tenable_fqdn ;;
  }

  dimension: tenable_ms_bulletin {
    type: string
    sql: ${TABLE}.tenable_ms_bulletin ;;
  }

  dimension: tenable_operating_system {
    type: string
    sql: ${TABLE}.tenable_operating_system ;;
  }

  dimension: tenable_platform {
    type: string
    sql: ${TABLE}.tenable_platform ;;
  }

  dimension: tenable_plugin_family {
    type: string
    sql: ${TABLE}.tenable_plugin_family ;;
  }

  dimension: tenable_plugin_id {
    type: string
    sql: ${TABLE}.tenable_plugin_id ;;
  }

  dimension: tenable_plugin_name {
    type: string
    sql: ${TABLE}.tenable_plugin_name ;;
  }

  dimension: tenable_service {
    type: string
    sql: ${TABLE}.tenable_service ;;
  }

  dimension: tenable_solution {
    type: string
    sql: ${TABLE}.tenable_solution ;;
  }

  dimension: tenable_source {
    type: string
    sql: ${TABLE}.tenable_source ;;
  }

  dimension: tenable_vpr_score {
    type: string
    sql: ${TABLE}.tenable_vpr_score ;;
  }

  dimension: tenable_vpr_scores {
    type: string
    sql: ${TABLE}.tenable_vpr_scores ;;
  }

  dimension: tenable_vulnerability_title {
    type: string
    sql: ${TABLE}.tenable_vulnerability_title ;;
  }

  dimension: test_automated {
    type: number
    sql: ${TABLE}.test_automated ;;
  }

  dimension: test_cases_link {
    type: string
    sql: ${TABLE}.test_cases_link ;;
  }

  dimension: test_plan {
    type: string
    sql: ${TABLE}.test_plan ;;
  }

  dimension: test_unit {
    type: number
    sql: ${TABLE}.test_unit ;;
  }

  dimension: testing_env {
    type: string
    sql: ${TABLE}.testing_env ;;
  }

  dimension: this_training_certification_is_linked_to_which_competency_please_make_sure_it_is_related_to_the_competency_framework {
    type: string
    sql: ${TABLE}.this_training_certification_is_linked_to_which_competency_please_make_sure_it_is_related_to_the_competency_framework ;;
  }

  dimension: thlyl_alsbb_aljdhry_ {
    type: number
    sql: ${TABLE}.thlyl_alsbb_aljdhry_ ;;
  }

  dimension: ticket_number {
    type: string
    sql: ${TABLE}.ticket_number ;;
  }

  dimension: ticket_type {
    type: number
    sql: ${TABLE}.ticket_type ;;
  }

  dimension_group: time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time ;;
  }

  dimension: time_critical {
    type: number
    sql: ${TABLE}.time_critical ;;
  }

  dimension: time_critical_urgency {
    type: number
    sql: ${TABLE}.time_critical_urgency ;;
  }

  dimension: time_criticality_justification {
    type: string
    sql: ${TABLE}.time_criticality_justification ;;
  }

  dimension_group: time_estimate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time_estimate ;;
  }

  dimension: time_spent {
    type: number
    sql: ${TABLE}.time_spent ;;
  }

  dimension: time_to_approve_normal_change {
    type: string
    sql: ${TABLE}.time_to_approve_normal_change ;;
  }

  dimension: time_to_auto_close {
    type: string
    sql: ${TABLE}.time_to_auto_close ;;
  }

  dimension: time_to_close_after_resolution {
    type: string
    sql: ${TABLE}.time_to_close_after_resolution ;;
  }

  dimension: time_to_escalation_reminder {
    type: string
    sql: ${TABLE}.time_to_escalation_reminder ;;
  }

  dimension: time_to_first_response {
    type: string
    sql: ${TABLE}.time_to_first_response ;;
  }

  dimension: time_to_resolution {
    type: string
    sql: ${TABLE}.time_to_resolution ;;
  }

  dimension: time_to_response {
    type: string
    sql: ${TABLE}.time_to_response ;;
  }

  dimension: time_to_review_normal_change {
    type: string
    sql: ${TABLE}.time_to_review_normal_change ;;
  }

  dimension: tmdyd_ftrt_alnzr_fy_alshkwy_ {
    type: string
    sql: ${TABLE}.tmdyd_ftrt_alnzr_fy_alshkwy_ ;;
  }

  dimension: to_branch {
    type: number
    sql: ${TABLE}.to_branch ;;
  }

  dimension: to_which_off_the_following_strategic_objectives_your_project_links_ {
    type: number
    sql: ${TABLE}.to_which_off_the_following_strategic_objectives_your_project_links_ ;;
  }

  dimension: total_forms {
    type: number
    sql: ${TABLE}.total_forms ;;
  }

  dimension: tqdym_t_wyd_mady_ {
    type: number
    sql: ${TABLE}.tqdym_t_wyd_mady_ ;;
  }

  dimension: training_type {
    type: number
    sql: ${TABLE}.training_type ;;
  }

  dimension_group: transaction_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_date_time ;;
  }

  dimension: transfer_amount {
    type: string
    sql: ${TABLE}.transfer_amount ;;
  }

  dimension: transfer_issue {
    type: number
    sql: ${TABLE}.transfer_issue ;;
  }

  dimension: translation_links {
    type: string
    sql: ${TABLE}.translation_links ;;
  }

  dimension: tribe_department_name {
    type: number
    sql: ${TABLE}.tribe_department_name ;;
  }

  dimension: tsnyf_alhsab_ {
    type: number
    sql: ${TABLE}.tsnyf_alhsab_ ;;
  }

  dimension: tsnyf_aljht_almshtky_lyha_ {
    type: number
    sql: ${TABLE}.tsnyf_aljht_almshtky_lyha_ ;;
  }

  dimension: tsnyf_almshtky_ {
    type: number
    sql: ${TABLE}.tsnyf_almshtky_ ;;
  }

  dimension: tswyq_alkhdmat_w_almntjat_ {
    type: number
    sql: ${TABLE}.tswyq_alkhdmat_w_almntjat_ ;;
  }

  dimension: type_of_modification_ {
    type: number
    sql: ${TABLE}.type_of_modification_ ;;
  }

  dimension: type_of_request {
    type: number
    sql: ${TABLE}.type_of_request ;;
  }

  dimension: type_of_request_ {
    type: number
    sql: ${TABLE}.type_of_request_ ;;
  }

  dimension: ui_fields_mapping {
    type: string
    sql: ${TABLE}.ui_fields_mapping ;;
  }

  dimension: ui_fields_mapping_mandatory_ {
    type: string
    sql: ${TABLE}.ui_fields_mapping_mandatory_ ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated ;;
  }

  dimension: updated_by_users_count {
    type: number
    sql: ${TABLE}.updated_by_users_count ;;
  }

  dimension: urgency {
    type: number
    sql: ${TABLE}.urgency ;;
  }

  dimension: user_journey_workflow {
    type: string
    sql: ${TABLE}.user_journey_workflow ;;
  }

  dimension: user_journey_workflow_mandatory_ {
    type: string
    sql: ${TABLE}.user_journey_workflow_mandatory_ ;;
  }

  dimension: vendor_company_name {
    type: string
    sql: ${TABLE}.vendor_company_name ;;
  }

  dimension: vendor_e_mail_address {
    type: string
    sql: ${TABLE}.vendor_e_mail_address ;;
  }

  dimension: vendor_mobile_number {
    type: string
    sql: ${TABLE}.vendor_mobile_number ;;
  }

  dimension: vendor_name {
    type: number
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: verify {
    type: number
    sql: ${TABLE}.verify ;;
  }

  dimension: visit_overall_score {
    type: string
    sql: ${TABLE}.visit_overall_score ;;
  }

  dimension: voucher_name {
    type: string
    sql: ${TABLE}.voucher_name ;;
  }

  dimension_group: vulnerability_first_seen {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.vulnerability_first_seen ;;
  }

  dimension_group: vulnerability_last_fixed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.vulnerability_last_fixed ;;
  }

  dimension_group: vulnerability_last_seen {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.vulnerability_last_seen ;;
  }

  dimension: vulnerability_port {
    type: string
    sql: ${TABLE}.vulnerability_port ;;
  }

  dimension: vulnerability_protocol {
    type: string
    sql: ${TABLE}.vulnerability_protocol ;;
  }

  dimension: vulnerability_repository_id {
    type: string
    sql: ${TABLE}.vulnerability_repository_id ;;
  }

  dimension: vulnerability_repository_name {
    type: string
    sql: ${TABLE}.vulnerability_repository_name ;;
  }

  dimension: vulnerability_severity {
    type: string
    sql: ${TABLE}.vulnerability_severity ;;
  }

  dimension: vulnerability_state {
    type: string
    sql: ${TABLE}.vulnerability_state ;;
  }

  dimension: what_are_the_product_s_specifications_features_unique_selling_point_usp_ {
    type: string
    sql: ${TABLE}.what_are_the_product_s_specifications_features_unique_selling_point_usp_ ;;
  }

  dimension: what_is_the_expected_product_review_period_in_months_ {
    type: number
    sql: ${TABLE}.what_is_the_expected_product_review_period_in_months_ ;;
  }

  dimension: what_is_the_objective_that_needs_to_be_achieved_or_the_problem_that_need_to_be_solved_improved_upon_ {
    type: string
    sql: ${TABLE}.what_is_the_objective_that_needs_to_be_achieved_or_the_problem_that_need_to_be_solved_improved_upon_ ;;
  }

  dimension: what_is_the_objective_that_needs_to_be_achieved_or_the_problem_that_need_to_be_solved_improved_upon_field {
    type: string
    sql: ${TABLE}.what_is_the_objective_that_needs_to_be_achieved_or_the_problem_that_need_to_be_solved_improved_upon_field ;;
  }

  dimension: what_is_the_proposed_product_and_how_does_it_fit_into_your_findings_ {
    type: string
    sql: ${TABLE}.what_is_the_proposed_product_and_how_does_it_fit_into_your_findings_ ;;
  }

  dimension: what_is_your_estimated_budget_to_achieve_all_of_the_mentioned_objectives_ {
    type: string
    sql: ${TABLE}.what_is_your_estimated_budget_to_achieve_all_of_the_mentioned_objectives_ ;;
  }

  dimension: what_is_your_estimated_budget_to_achieve_all_of_the_mentioned_objectives_thousands_jod_ {
    type: number
    sql: ${TABLE}.what_is_your_estimated_budget_to_achieve_all_of_the_mentioned_objectives_thousands_jod_ ;;
  }

  dimension: what_is_your_estimated_needed_budget {
    type: number
    sql: ${TABLE}.what_is_your_estimated_needed_budget ;;
  }

  dimension: what_s_the_objective_of_taking_the_mentioned_training_certification_ {
    type: string
    sql: ${TABLE}.what_s_the_objective_of_taking_the_mentioned_training_certification_ ;;
  }

  dimension: when_do_you_expect_the_benefits_to_be_realized_ {
    type: number
    sql: ${TABLE}.when_do_you_expect_the_benefits_to_be_realized_ ;;
  }

  dimension: which_demographics_are_targeted_ {
    type: string
    sql: ${TABLE}.which_demographics_are_targeted_ ;;
  }

  dimension: which_dep_branch_employee_should_we_follow_up_with_ {
    type: string
    sql: ${TABLE}.which_dep_branch_employee_should_we_follow_up_with_ ;;
  }

  dimension: which_employee_section_drop_down_list {
    type: number
    sql: ${TABLE}.which_employee_section_drop_down_list ;;
  }

  dimension: which_market_segments_are_being_targeted_ {
    type: string
    sql: ${TABLE}.which_market_segments_are_being_targeted_ ;;
  }

  dimension: which_section_ {
    type: number
    sql: ${TABLE}.which_section_ ;;
  }

  dimension: who_is_the_target_market_ {
    type: string
    sql: ${TABLE}.who_is_the_target_market_ ;;
  }

  dimension: will_your_solution_require_technical_development_ {
    type: number
    sql: ${TABLE}.will_your_solution_require_technical_development_ ;;
  }

  dimension: will_your_solution_require_the_installation_of_a_new_system_application_platform_ {
    type: number
    sql: ${TABLE}.will_your_solution_require_the_installation_of_a_new_system_application_platform_ ;;
  }

  dimension: work_category {
    type: string
    sql: ${TABLE}.work_category ;;
  }

  dimension: work_environment {
    type: number
    sql: ${TABLE}.work_environment ;;
  }

  dimension: work_ratio {
    type: number
    sql: ${TABLE}.work_ratio ;;
  }

  dimension: workaround {
    type: string
    sql: ${TABLE}.workaround ;;
  }

  dimension: wsylt_tqdym_alshkwy_ {
    type: number
    sql: ${TABLE}.wsylt_tqdym_alshkwy_ ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  external_issue_id,
  _tribes_tech_department_name,
  tribe_department_name,
  product_name,
  department_name,
  vendor_name,
  voucher_name,
  device_dns_name,
  tenable_plugin_name,
  device_net_bios_name,
  vulnerability_repository_name,
  project_name,
  party_name,
  company_name,
  vendor_company_name,
  epic_name,
  first_name
  ]
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


  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [key,assignee, reporter, created_date,priority.name, covered_by_nagios]


  }

  # ----- Sets of fields for drilling ------
  #set: detail {
  #  fields: [
  #    external_issue_id,
  #  ]
  #}





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


  dimension: is_issue_resolved {
    group_label: "Resolution"
    type: yesno
    sql: ${resolved_date} IS NOT NULL ;;
  }

  dimension: Highlight {
    type: string
    sql: ${TABLE}.HIGHLIGHT ;;
  }

  dimension: Estimated_Effort_Sprints {
    type: string
    sql: ${TABLE}.ESTIMATED_EFFORT_SPRINTS_ ;;

  }




}
