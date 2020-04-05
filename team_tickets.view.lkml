view: team_tickets {
  sql_table_name: jira.team_tickets ;;

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }
  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension: sla_score {
    type: number
    sql: ${TABLE}.sla_score ;;
  }

  dimension: slaola_type {
    type: string
    sql: ${TABLE}.slaola_type ;;
  }

  dimension: sum {
    type: number
    sql: ${TABLE}.sum ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: working_hours {
    type: number
    sql: ${TABLE}.working_hours ;;
  }

  dimension: working_minus_target {
    type: number
    sql: ${TABLE}.working_minus_target ;;
  }

  dimension: working_minus_target_percentage {
    type: number
    sql: ${TABLE}.working_minus_target_percentage ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${issue_id};;

  }

  measure: count_resolved_sla_count_sla {
    type: number
    sql:100 *  ${count_resolved_sla} / NULLIF(${count_sla},0);;
  }
  measure:  resolved_assigned_sla{
    case : {
      when : {
        label:"5"
        sql:(100 *  ${count_resolved_sla} / NULLIF(${count_sla},0) ) >=85 ;;
      }
      when : {
        label:"4"
        sql:(100 *  ${count_resolved_sla} /NULLIF(${count_sla},0) )>=75 ;;
      }
      when : {
        label:"3"
        sql: (100 * ${count_resolved_sla} / NULLIF(${count_sla},0) ) >=65 ;;
      }
      when : {
        label:"2"
        sql: (100 * ${count_resolved_sla} / NULLIF(${count_sla},0) ) >=55 ;;
      }
      when : {
        label:"1"
        sql:(100 *  ${count_resolved_sla} /  NULLIF(${count_sla},0) )>=45 ;;
      }
      else: "0"
    }
  }

  measure:  resolved_assigned_ola{
    case : {
      when : {
        label:"5"
        sql:( 100 * ${count_resolved_ola} /  NULLIF(${count_ola},0) ) >=85 ;;
      }
      when : {
        label:"4"
        sql:(100 *   ${count_resolved_ola} /  NULLIF(${count_ola},0)) >=75 ;;
      }
      when : {
        label:"3"
        sql:(100 *  ${count_resolved_ola} /  NULLIF(${count_ola},0) )>=65 ;;
      }
      when : {
        label:"2"
        sql:(100 *  ${count_resolved_ola} /  NULLIF(${count_ola},0)  )>=55 ;;
      }
      when : {
        label:"1"
        sql: (100 * ${count_resolved_ola} / NULLIF(${count_ola},0)) >=45 ;;
      }
      else: "0"
    }
  }

  measure: count_resolved_sla_count_ola {
    type: number
    sql:100 *  ${count_resolved_ola} / NULLIF(${count_ola},0);;
    drill_fields: [issue.issue_key,issue.reporter,status.name,issue_id,sla_score,slaola_type,sum,user_id,working_minus_target_percentage]
  }

  measure: avg_sla {
    label : "AVG SLA Score"
    type:  average
    sql: ${sla_score}  ;;
    filters: [ slaola_type: "SLA"]
    drill_fields: [issue.issue_key,issue.reporter,status.name,issue_id,sla_score,slaola_type,sum,user_id,working_minus_target_percentage]
  }

  measure: avg_ola {
    label : "AVG OLA Score"
    type:  average
    sql: ${sla_score}  ;;
    filters: [ slaola_type: "OLA"]
    drill_fields: [issue.issue_key,issue.reporter,status.name,issue_id,sla_score,slaola_type,sum,user_id,working_minus_target_percentage]
  }


  measure: count_sla {
    label : "Count Distinct SLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "SLA"]
    drill_fields: [issue.issue_key,issue.reporter,status.name,issue_id,sla_score,slaola_type,sum,user_id,working_minus_target_percentage]
  }

  measure: count_ola {
    label : "Count Distinct OLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "OLA"]
    drill_fields: [issue.issue_key,issue.reporter,status.name,issue_id,sla_score,slaola_type,sum,user_id,working_minus_target_percentage]
  }

  measure: count_resolved_sla {
    label : "Count Resolved SLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "SLA", issue.resolved_date:  "NOT NULL"]
    drill_fields: [issue.issue_key,issue.reporter,status.name,issue_id,sla_score,slaola_type,sum,user_id,working_minus_target_percentage]
  }

  measure: count_resolved_ola {
    label : "Count Resolved OLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "OLA", issue.resolved_date:  "NOT NULL"]
    drill_fields: [issue.issue_key,issue.reporter,status.name,issue_id,sla_score,slaola_type,sum,user_id,working_minus_target_percentage]
  }




}
