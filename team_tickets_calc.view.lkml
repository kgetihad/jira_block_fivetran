view: team_tickets_calc {

  derived_table : {
    sql:    SELECT s_date,
      o_date,
      m.sub_dep ,
      coalesce(m.c) as sla_count,
      coalesce( m.c/CASE WHEN M.A=0 THEN 1 ELSE M.A END,1) as sla_avg,
      coalesce(m.a,0) as team_count_sla,
      coalesce(k.c,0) as ola_count,
      coalesce(k.c/CASE WHEN K.A=0 THEN 1 ELSE K.A END,1) as ola_avg,
      coalesce(k.a,0) as team_count_ola

FROM (SELECT distinct count(t.issue_id) over (partition by sub_dep) c ,
(select count(distinct u2.accountid) from jira.team u2 where u.sub_dep=u2.sub_dep) a  ,
u.sub_dep,slaola_type,date_trunc('YEAR',i.created) s_date
FROM jira.team as u
INNER JOIN jira.team_tickets as t on t.user_id = u.accountid
INNER JOIN jira.issue as i on i.id = t.issue_id
WHERE slaola_type ='SLA'
AND trunc(i.created) BETWEEN '2025-01-01' AND  '2025-12-31'
) as m
left JOIN
(SELECT distinct count(t.issue_id) over (partition by sub_dep) c ,
(select count(distinct u2.accountid) from jira.team u2 where u.sub_dep=u2.sub_dep) a  ,
u.sub_dep,slaola_type,date_trunc('YEAR',i.created) o_date
FROM jira.team as u
INNER JOIN jira.team_tickets as t on t.user_id = u.accountid
INNER JOIN jira.issue as i on i.id = t.issue_id
WHERE slaola_type ='OLA'
AND trunc(i.created) BETWEEN '2025-01-01' AND  '2025-12-31'
) as k on k.sub_dep = m.sub_dep;;
    }


  dimension: sla_count {
    type: number
    sql: ${TABLE}.sla_count ;;
  }

  dimension: o_date {
    type: date
    sql: ${TABLE}.o_date ;;
  }

  dimension: s_date {
    type: date
    sql: ${TABLE}.s_date ;;
  }

  dimension: sla_avg {
    type: number
    sql: ${TABLE}.sla_avg ;;
  }

  dimension: ola_count {
    type: number
    sql: ${TABLE}.ola_count ;;
  }

  dimension: ola_avg {
    type: number
    sql: ${TABLE}.ola_avg ;;
  }

  dimension: sub_dep {
    type: string
    sql: ${TABLE}.sub_dep ;;
  }


}
