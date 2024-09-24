 view: jira_custom_dt {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql:

    select
  i.id as issue_id,
  i.project as project_id,
  i.request_type_,
  CASE
        WHEN i.project IN (15152,10700,15161,10500,14106,14133,10800,10811,12700,14052,12800,13600,14089,11301,15138,11400) THEN 'Tech'
        WHEN i.project IN (14100,14101,14099,14095,14098,14102,14097) THEN 'Service'
        WHEN i.project IN (14093,14094,15159,14091,14092,15160) THEN 'Product'
        ELSE 'Unknown'
  END AS Tribe,
  CASE
        WHEN i.project in (15152,10700,15161) THEN 'Mule'
        WHEN i.project in (10500,14106,14133,10800,10811,12700,14052,12800) THEN 'Core'
        WHEN i.project = 13600 THEN 'Devops & DBA'
        WHEN i.project = 14089 THEN 'Cards'
        WHEN i.project = 11301 THEN 'Data Science'
        WHEN i.project in (15138,11400) THEN 'Infra'
        WHEN i.project = 14100 THEN 'Payments'
        WHEN i.project = 14101 THEN 'Business Lending'
        WHEN i.project = 14099 THEN 'CRM'
        WHEN i.project = 14095 THEN 'Churn'
        WHEN i.project = 14098 THEN 'IPO'
        WHEN i.project = 14102 THEN 'Process Transformations'
        WHEN i.project = 14097 THEN 'Retail Lending'
        WHEN i.project = 14093 THEN 'Business Banking'
        WHEN i.project = 14094 THEN 'Daily Banking'
        WHEN i.project = 15159 THEN 'Lending & lifestyle'
        WHEN i.project = 14091 THEN 'Loyalty'
        WHEN i.project = 14092 THEN 'OmniChannel'
        WHEN i.project = 15160 THEN 'Transfers'
        ELSE 'Unknown'
  END AS Squad,
  r2.name as resolution_name,
  r2.description as resolution_description,
  i.key,
  u.name as assignee,
  r.name as reporter ,
  c.name as creator ,
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
  s.name,
  i.description,
  i.summary,
  case when e.name is null then i.epic_name else e.name end as epic_name,
  s2.name as epic_status,
  qpl.description as qpl_description,
  v.release_date as version_release_date

from jira.issue  i

left join jira.user u
  on i.assignee = u.id
  and u.is_active = 1

left join jira.user r
  on i.reporter = r.id
  and r.is_active = 1

left join jira.user c
  on i.creator = c.id
  and c.is_active = 1

left join jira.project p
  on p.id = i.project

left join jira.epic e
  on e.id = i.epic_link

left join jira.status s
  on s.id = i.status

left join jira.status s2
  on s2.id = i.epic_status

left join jira.issue_type it
  on it.id = i.issue_type

left join jira.priority p2
  on p2.id = i.priority

left join jira.resolution r2
  on r2.id = i.resolution

left join jira.q_progress_lookup qpl
  on qpl.q_progress_id = i.q_progress

left join jira.issue_fix_versions ifv
  on ifv.issue_id = i.id

left join jira.version v
  on v.id = ifv.version_id

where i.created >= '2022-01-01'
       ;;
   }

  dimension:  issue_id{
    primary_key: yes
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension:  project_id{
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension:  request_type_{
    type: number
    sql: ${TABLE}.request_type_ ;;
  }

  dimension:  Tribe{
    type: string
    sql: ${TABLE}.Tribe ;;
  }

  dimension:  Squad{
    type: string
    sql: ${TABLE}.Squad ;;
  }

  dimension:  resolution_name{
    type: string
    sql: ${TABLE}.resolution_name ;;
  }

  dimension:  resolution_description{
    type: string
    sql: ${TABLE}.resolution_description ;;
  }

  dimension:  key{
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension:  assignee{
    type: string
    sql: ${TABLE}.assignee ;;
  }

  dimension:  reporter{
    type: string
    sql: ${TABLE}.reporter ;;
  }

  dimension:  creator{
    type: string
    sql: ${TABLE}.creator ;;
  }

  dimension:  issue_type{
    type: string
    sql: ${TABLE}.issue_type ;;
  }

  dimension:  project_name{
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension:  project_key{
    type: string
    sql: ${TABLE}.project_key ;;
  }

  dimension:  project_type_key{
    type: string
    sql: ${TABLE}.project_type_key ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.created ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.updated ;;
  }

  dimension_group: actual_delivery_date {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.actual_delivery_date ;;
  }

  dimension_group: planned_delivery_date {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.planned_delivery_date ;;
  }

  dimension_group: version_release_date {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.version_release_date ;;
  }

  dimension:  severity{
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension:  qpl_description{
    type: string
    sql: ${TABLE}.qpl_description ;;
  }

  dimension:  priority{
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension:  parent_link{
    type: number
    sql: ${TABLE}.parent_link ;;
  }

  dimension:  name{
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension:  description{
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension:  summary{
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension:  epic_name{
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension:  epic_status{
    type: string
    sql: ${TABLE}.epic_status ;;
  }

  measure: count {
    type: count
  }


}
