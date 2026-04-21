
view: individual_final_score {
  derived_table: {
    sql: SELECT distinct EMPLOYEE_NAME,
      TEAM,
      PO_PM,
      SLA_OLA_OR_OKR,
      PRIMARY_SCORE,
      SECONDARY_SCORE,
      DELIVERY_SCORE,
      MAXIMUM_SCORE,
      MAX(DELIVERY_SCORE) OVER (PARTITION BY TEAM) TEAM_MAX_SCORE,
      PROJECT_COUNT,
      DELIVERY_SCORE/NULLIF(MAX(DELIVERY_SCORE) OVER (PARTITION BY TEAM),0) PROJECT_SCORE_BEFORE_MULTI,
      (DELIVERY_SCORE/NULLIF(MAX(DELIVERY_SCORE) OVER (PARTITION BY TEAM),0))*0.35 PROJECT_SCORE_AFTER_MULTI,
      OKR_SCORE,
       CASE WHEN DEP IN ('Digital Service Tribe','Digital Product Tribe') THEN   OKR_SCORE + PROJECT_SCORE_AFTER_MULTI ELSE PROJECT_SCORE_BEFORE_MULTI END PROJECT_OKR_SCORE,
      sla_ola_Score,
      sla_ola_Score_percentage,
      TEAM_AVG_SLA_TICKETS,
      TEAM_AVG_OLA_TICKETS,
      COUNT_INDIVIDUAL_SLA,
      COUNT_INDIVIDUAL_OLA,
      '' PROJECT_PERCENTAGE,
      '' PROJECT_SCORE_WEIGHT,
      '' OLA_SLA_WEIGHTED,
      
      LEAST(
        CASE 
          WHEN DEP = 'Digital Product Tribe' AND TEAM = 'Tech Support' THEN SLA_OLA_SCORE_PERCENTAGE
          WHEN TEAM = 'Data Center' THEN NVL(PROJECT_SCORE_BEFORE_MULTI * 0.25, 0) + NVL(SLA_OLA_SCORE_PERCENTAGE * 0.75, 0)
          WHEN DEP = 'Technology' AND TEAM NOT IN ('Data Center', 'Integration', 'Goverance') 
            THEN NVL(PROJECT_SCORE_BEFORE_MULTI * 0.5, 0) + NVL(SLA_OLA_SCORE_PERCENTAGE * 0.5, 0)
          WHEN DEP IN ('Digital Service Tribe','Digital Product Tribe') OR TEAM IN ('Data Center','Integration','Goverance') 
            THEN NVL(OKR_SCORE, 0) + NVL(PROJECT_SCORE_AFTER_MULTI, 0)
          ELSE NVL(PROJECT_SCORE_BEFORE_MULTI * 0.5, 0) + NVL(SLA_OLA_SCORE_PERCENTAGE * 0.5, 0)
        END,
      1
      ) AS FINAL_SCORE
      
      
      
      
      
      
       FROM (
      SELECT DISTINCT T.NAME EMPLOYEE_NAME,
      T.DEP,
      T.SUB_DEP TEAM,
      COALESCE(PO,PM) PO_PM,
      '' SLA_OLA_OR_OKR,
      T.SUB_DEP TEAM_FOR_OKR_CALCULATION,
      COALESCE(SUM(CASE WHEN ASSIGNEE_TYPE='PRIMARY'  THEN PS.SCORE END ),0)PRIMARY_SCORE,
      COALESCE(SUM(CASE WHEN ASSIGNEE_TYPE='SECONDARY' THEN PS.SCORE END ),0)SECONDARY_SCORE,
      COALESCE(SUM(CASE WHEN ASSIGNEE_TYPE='PRIMARY'  THEN PS.SCORE END ),0)+ COALESCE(SUM(CASE WHEN ASSIGNEE_TYPE='SECONDARY' THEN PS.SCORE END ),0)DELIVERY_SCORE,
      COALESCE(SUM(CASE WHEN ASSIGNEE_TYPE='PRIMARY'  THEN ORIGINAL_SCORE END ),0)+ COALESCE(SUM(CASE WHEN ASSIGNEE_TYPE='SECONDARY' THEN ORIGINAL_SCORE END ),0)MAXIMUM_SCORE,
      COUNT(DISTINCT PS.ID) PROJECT_COUNT,
      eligibility_score sla_ola_Score,
      eligibility_score/5 sla_ola_Score_percentage,
      SLA_AVG TEAM_AVG_SLA_TICKETS,
      OLA_AVG TEAM_AVG_OLA_TICKETS,
      COUNT_SLA COUNT_INDIVIDUAL_SLA,
      COUNT_OLA COUNT_INDIVIDUAL_OLA,
      CASE WHEN T.DEP IN ('Digital Service Tribe','Digital Product Tribe') THEN SUM(FINAL_SCORE) ELSE 0  END /100 OKR_SCORE
      FROM JIRA.TEAM T
      
      LEFT JOIN JIra.team_projects_score  PS ON  TRIM(ACCOUNTID)= TRIM(ASSIGNEE)
      
      left JOIN JIRA.TEAM_TICKETS_FINAL_SCORE TT ON TRIM(T.ACCOUNTID)=TRIM(TT.ACCOUNTID)
      
      
      LEFT JOIN JIRA.OKR O ON T.DEP=O.DEP AND O.SUB_DEP=O.SUB_DEP
      
      GROUP BY T.NAME ,
      T.SUB_DEP ,
      COALESCE(PO,PM),
      eligibility_score,
      OLA_AVG,
      SLA_AVG,
      COUNT_OLA,
      COUNT_SLA ,
      T.DEP)
      
      ORDER BY TEAM,EMPLOYEE_NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: employee_name {
    type: string
    sql: ${TABLE}.employee_name ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  dimension: po_pm {
    type: string
    sql: ${TABLE}.po_pm ;;
  }

  dimension: sla_ola_or_okr {
    type: string
    sql: ${TABLE}.sla_ola_or_okr ;;
  }

  dimension: primary_score {
    type: number
    sql: ${TABLE}.primary_score ;;
  }

  dimension: secondary_score {
    type: number
    sql: ${TABLE}.secondary_score ;;
  }

  dimension: delivery_score {
    type: number
    sql: ${TABLE}.delivery_score ;;
  }

  dimension: maximum_score {
    type: number
    sql: ${TABLE}.maximum_score ;;
  }

  dimension: team_max_score {
    type: number
    sql: ${TABLE}.team_max_score ;;
  }

  dimension: project_count {
    type: number
    sql: ${TABLE}.project_count ;;
  }

  dimension: project_score_before_multi {
    type: number
    sql: ${TABLE}.project_score_before_multi ;;
  }

  dimension: project_score_after_multi {
    type: number
    sql: ${TABLE}.project_score_after_multi ;;
  }

  dimension: okr_score {
    type: number
    sql: ${TABLE}.okr_score ;;
  }

  dimension: project_okr_score {
    type: number
    sql: ${TABLE}.project_okr_score ;;
  }

  dimension: sla_ola_score {
    type: number
    sql: ${TABLE}.sla_ola_score ;;
  }

  dimension: sla_ola_score_percentage {
    type: number
    sql: ${TABLE}.sla_ola_score_percentage ;;
  }

  dimension: team_avg_sla_tickets {
    type: number
    sql: ${TABLE}.team_avg_sla_tickets ;;
  }

  dimension: team_avg_ola_tickets {
    type: number
    sql: ${TABLE}.team_avg_ola_tickets ;;
  }

  dimension: count_individual_sla {
    type: number
    sql: ${TABLE}.count_individual_sla ;;
  }

  dimension: count_individual_ola {
    type: number
    sql: ${TABLE}.count_individual_ola ;;
  }

  dimension: project_percentage {
    type: string
    sql: ${TABLE}.project_percentage ;;
  }

  dimension: project_score_weight {
    type: string
    sql: ${TABLE}.project_score_weight ;;
  }

  dimension: ola_sla_weighted {
    type: string
    sql: ${TABLE}.ola_sla_weighted ;;
  }

  dimension: final_score {
    type: number
    sql: ${TABLE}.final_score ;;
  }

  set: detail {
    fields: [
        employee_name,
	team,
	po_pm,
	sla_ola_or_okr,
	primary_score,
	secondary_score,
	delivery_score,
	maximum_score,
	team_max_score,
	project_count,
	project_score_before_multi,
	project_score_after_multi,
	okr_score,
	project_okr_score,
	sla_ola_score,
	sla_ola_score_percentage,
	team_avg_sla_tickets,
	team_avg_ola_tickets,
	count_individual_sla,
	count_individual_ola,
	project_percentage,
	project_score_weight,
	ola_sla_weighted,
	final_score
    ]
  }
}
