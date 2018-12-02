view: project_score {
  sql_table_name: jira.project_score ;;

  dimension: actual_launch {
    type: date
    sql: ${TABLE}.actuallaunch:: TIMESTAMP ;;
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
    type: date
    sql: ${TABLE}.plannedlaunch:: TIMESTAMP ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}.start_date:: TIMESTAMP ;;

  }

  dimension: project_duration_days {
    type: number
    sql:  DATEDIFF(days,${start_date},${actual_launch});;
  }

  dimension: deviation_percantage {
    type: number
    sql: ${deviation_in_days}/ ${project_duration_days} ;;
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
    sql:  case
    when ${actual_launch} is not null then DATEDIFF(days,${planned_launch},${actual_launch})
    when (${actual_launch} is null AND   trunc(getdate()) > ${planned_launch}  )   then DATEDIFF(days,${planned_launch},trunc(getdate()))
    else null
    end
    ;;
  }


  dimension: deviation_in_weeks{
    type: number
    sql: (${deviation_in_days} /7) - ${exception_weeks};;
  }




}
