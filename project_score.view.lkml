view: project_score {
  sql_table_name: jira.project_score ;;

  dimension: actual_launch {
    type: date
    sql: ${TABLE}.actuallaunch ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: planned_launch {
    type: date
    sql: ${TABLE}.plannedlaunch ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: project_score {
    type: number
    sql: ${TABLE}.projectscore ;;
  }

  dimension: project_weight {
    type: number
    sql: ${TABLE}.projectweight ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }



  dimension: deliverd {
    case: {
      when: {
        sql:   ${actual_launch} is null ;;
        label: "No"
      }
      else: "Yes"
    }
  }

  dimension: deviation_in_days{
    type: number
    sql:  DATEDIFF(days,${planned_launch},${actual_launch});;
  }


  dimension: deviation_in_weeks{
    type: number
    sql: ${deviation_in_days} /7;;
  }




}
