view: project_score {
  sql_table_name: jira.project_score ;;

  dimension: actual_launch {
    type: string
    sql: ${TABLE}.actuallaunch;;
  }

  dimension: pk {
    type: string
    sql: concat(${project},${team}) ;;
    primary_key: yes
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: planned_launch {
    type: string
    sql: ${TABLE}.plannedlaunch;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.start_date;;

  }

  dimension: project_duration_days {
    type: number
    sql:  DATEDIFF(days,TO_DATE(${start_date}, 'YYYY-MM-DD'),TO_DATE(${planned_launch}, 'YYYY-MM-DD'));;
  }

  dimension: deviation_percantage {
    type: number
    sql: 100.00 * ${deviation_in_days}/ ${project_duration_days} ;;
  }
  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: project_score {
    type: number
    sql: ROUND(${TABLE}.projectscore,2) ;;
  }

  dimension: project_weight {
    type: number
    sql: ROUND(${TABLE}.projectweight,2) ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  measure: count {
    type: count
    drill_fields: [project,project_score,project_weight,planned_launch,actual_launch,category,deliverd,deviation_in_weeks,exception_weeks]
  }



  dimension: deliverd {
    case: {
      when: {
        sql:   ${actual_launch} is null  ;;
        label: "No"
      }
      else: "Yes"
    }
  }

  measure: sum_deliverd{
    type: count
    filters: {
      field: deliverd
      value : "Yes"
    }
    drill_fields: [project,project_score,project_weight,planned_launch,actual_launch,category,deliverd,deviation_in_weeks,exception_weeks]

  }

  dimension: exception_weeks{
    type: number
    sql: ${TABLE}.exception_weeks ;;
  }

  measure: sum_not_deliverd{
    type: count
    filters: {
      field: deliverd
      value : "No"
    }
    drill_fields: [project,project_score,project_weight,planned_launch,actual_launch,category,deliverd,deviation_in_weeks,exception_weeks]
  }

  dimension: deviation_in_days{
    type: number
    sql:  case
    when ${actual_launch} is not null then DATEDIFF(days,TO_DATE(${planned_launch}, 'YYYY-MM-DD'),TO_DATE(${actual_launch}, 'YYYY-MM-DD'))
    when (${actual_launch} is null AND trunc(TO_DATE('12-31-2018', 'YYYY-MM-DD')) > trunc(TO_DATE(${planned_launch}, 'YYYY-MM-DD')))   then DATEDIFF(days,TO_DATE(${planned_launch}, 'YYYY-MM-DD'),trunc(TO_DATE('12-31-2018', 'YYYY-MM-DD')))

    else null
    end
    ;;
  }


  dimension: deviation_in_weeks{
    type: number
    sql: (${deviation_in_days} /7) ;;
  }

  dimension: Exception_in_days{
    type: number
    sql: (${exception_weeks} *7);;
  }


}
