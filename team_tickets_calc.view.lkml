view: team_tickets_calc {

  derived_table : {
    sql:   SELECT s_date,
      o_date,
      m.sub_dep ,
       m.c as sla_count,
       m.c/m.a as sla_avg,
       m.a as team_count_sla,
       k.c as ola_count,
       k.c/k.a as ola_avg,
       k.a as team_count_ola

FROM (SELECT distinct count(t.issue_id) over (partition by sub_dep) c ,
(select count(distinct u2.accountid) from jira.team u2 where u.sub_dep=u2.sub_dep) a  ,
u.sub_dep,slaola_type,date_trunc('YEAR',i.created) s_date
FROM jira.team as u
INNER JOIN jira.team_tickets as t on t.user_id = u.accountid
INNER JOIN jira.issue as i on i.id = t.issue_id
WHERE slaola_type ='SLA'
AND trunc(i.created) BETWEEN '2023-01-01' AND  '2023-12-31'
) as m
JOIN
(SELECT distinct count(t.issue_id) over (partition by sub_dep) c ,
(select count(distinct u2.accountid) from jira.team u2 where u.sub_dep=u2.sub_dep) a  ,
u.sub_dep,slaola_type,date_trunc('YEAR',i.created) o_date
FROM jira.team as u
INNER JOIN jira.team_tickets as t on t.user_id = u.accountid
INNER JOIN jira.issue as i on i.id = t.issue_id
WHERE slaola_type ='OLA'
AND trunc(i.created) BETWEEN '2023-01-01' AND  '2023-12-31'
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
