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

 dimension: legand_score {
  case: {

    when : {
      sql:   ${project_score.deviation_percantage} > 75;;
      label : "-10"
    }

    when : {
      sql:  ${project_score.deviation_percantage} <=  75   and ${project_score.deviation_percantage} > 70;;
      label : "-9"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 70   and ${project_score.deviation_percantage} > 65;;
      label : "-8"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 65   and ${project_score.deviation_percantage} > 60;;
      label : "-7"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 60   and ${project_score.deviation_percantage} > 55;;
      label : "-6"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 55  and ${project_score.deviation_percantage} > 50 ;;
      label : "-5"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 50  and ${project_score.deviation_percantage} > 45 ;;
      label : "-4"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 45  and ${project_score.deviation_percantage} > 40 ;;
      label : "-3"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 40   and ${project_score.deviation_percantage} > 35;;
      label : "-2"
    }

    when : {
      sql:  ${project_score.deviation_percantage} <= 35   and ${project_score.deviation_percantage} > 30;;
      label : "-1"
    }

    when : {
      sql:  ${project_score.deviation_percantage} <=30   and ${project_score.deviation_percantage} >  25;;
      label : "0"
    }

    when : {
      sql:  ${project_score.deviation_percantage} <= 25   and ${project_score.deviation_percantage} > 20;;
      label : "1"
    }

    when : {
      sql:  ${project_score.deviation_percantage} <= 20   and ${project_score.deviation_percantage} > 15;;
      label : "2"
    }

    when : {
      sql:  ${project_score.deviation_percantage} <= 15   and ${project_score.deviation_percantage} > 10;;
      label : "3"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 10   and ${project_score.deviation_percantage} > 5;;
      label : "4"
    }
    when : {
      sql:  ${project_score.deviation_percantage} <= 5;;
      label : "5"
    }



  }
 }

  dimension: contr_scr {
    type: number
    sql: case
            when ${role} = 'Primary'    THEN ( cast(${legand_score} as decimal(4,1)) * ${project_score.project_weight})
            when ${role} = 'Secondary' THEN ( cast(${legand_score} as decimal(4,1)) * ${project_score.project_weight}*0.5 )
            else 0
        end  ;;

    }

#  dimension: contr_scr {
#     type: number
#     sql: case
#             when ${role} = 'Primary'    THEN ( cast(${legands.score} as decimal(4,1)) * ${project_score.project_weight})
#             when ${role} = 'Secondary' THEN ( cast(${legands.score} as decimal(4,1)) * ${project_score.project_weight}*0.5 )
#             else 0
#         end  ;;
#
#  }
  dimension:  contributor_score{
    type: number
    sql: case
            when ${project_score.deliverd} ='Yes' THEN ${contr_scr}
            when ${project_score.deliverd} ='No' AND ${project_score.deviation_in_days} >= 0 AND ${contr_scr} <0 THEN ${contr_scr}
            else 0
        end;;
  }

  measure: sum_score {
    type: sum
    sql: ${contributor_score} ;;
    drill_fields: [username,project,team_member,contributor_score,role,project_score.category,project_score.planned_launch,project_score.actual_launch,project_score.project_weight,project_score.deviation_in_weeks]

  }

}
