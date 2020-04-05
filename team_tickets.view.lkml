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
  measure:  resolved_assigned_sla{
    case : {
      when : {
        label:"5"
        sql: ${count_resolved_sla} / ${count_sla} >=85 ;;
      }
      when : {
        label:"4"
        sql: ${count_resolved_sla} / ${count_sla} >=75 ;;
      }
      when : {
        label:"3"
        sql: ${count_resolved_sla} / ${count_sla} >=65 ;;
      }
      when : {
        label:"2"
        sql: ${count_resolved_sla} / ${count_sla} >=55 ;;
      }
      when : {
        label:"1"
        sql: ${count_resolved_sla} / ${count_sla} >=45 ;;
      }
      else: "0"
    }
  }

  measure:  resolved_assigned_ola{
    case : {
      when : {
        label:"5"
        sql: ${count_resolved_ola} / ${count_ola} >=85 ;;
      }
      when : {
        label:"4"
        sql: ${count_resolved_ola} / ${count_ola} >=75 ;;
      }
      when : {
        label:"3"
        sql: ${count_resolved_ola} / ${count_ola} >=65 ;;
      }
      when : {
        label:"2"
        sql: ${count_resolved_ola} / ${count_ola} >=55 ;;
      }
      when : {
        label:"1"
        sql: ${count_resolved_ola} / ${count_ola} >=45 ;;
      }
      else: "0"
    }
  }

  measure: avg_sla {
    label : "AVG SLA Score"
    type:  average
    sql: ${sla_score}  ;;
    filters: [ slaola_type: "SLA"]
  }

  measure: avg_ola {
    label : "AVG OLA Score"
    type:  average
    sql: ${sla_score}  ;;
    filters: [ slaola_type: "OLA"]
  }

  measure: count_sla {
    label : "Counnt Distinct SLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "SLA"]
  }

  measure: count_ola {
    label : "Counnt Distinct OLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "OLA"]
  }

  measure: count_resolved_sla {
    label : "Counnt Resolved SLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "SLA", issue.resolved_date:  "NULL"]
  }

  measure: count_resolved_ola {
    label : "Counnt Resolved OLA"
    type:  count_distinct
    sql: ${issue_id}  ;;
    filters: [ slaola_type: "OLA", issue.resolved_date:  "NULL"]
  }

}
