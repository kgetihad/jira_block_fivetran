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

   dimension: pk {
     type: string
    sql: concat(${project},${username}) ;;
    primary_key: yes
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
    sql: case when ${TABLE}.role = 'Primary' then ( cast(${legands.score} as decimal(4,1)) * ${project_score.project_weight})
    else ( cast(${legands.score} as decimal(4,1)) * ${project_score.project_weight}*0.5 )end  ;;
  }

  measure: sum_score {
    type: sum
    sql: ${contributor_score} ;;

  }

}
