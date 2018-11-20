view: project_score_team {
  sql_table_name: jira.project_score_team ;;

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: team_member {
    type: string
    sql: ${TABLE}.teammember ;;
  }

 dimension: id {
   type: number
  primary_key: yes
  sql: ${TABLE}.id ;;

 }
  dimension: username {
    type: string
    sql: ${TABLE}.username ;;

  }

  measure: count {
    type: count
    drill_fields: [username]
  }

  dimension:  contributor_score{
    type: number
    sql: case
            when ${role} = 'Primary'    THEN ( cast(${legands.score} as decimal(4,1)) * ${project_score.project_weight})
            when ${role} = 'Secondary' THEN ( cast(${legands.score} as decimal(4,1)) * ${project_score.project_weight}*0.5 )
            else 0
        end  ;;
  }

  measure: sum_score {
    type: sum
    sql: ${contributor_score} ;;
    drill_fields: [username,project,team_member,contributor_score,role,project_score.category,project_score.planned_launch,project_score.actual_launch,project_score.project_weight,project_score.deviation_in_weeks]

  }

}
