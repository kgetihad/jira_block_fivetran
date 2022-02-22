view: team_tickets_calc {

  derived_table : {
    sql: SELECT m.dep ,
       m.c as sla_count,
       m.c/m.a as sla_avg,
       m.a as team_count_sla,
       k.c as ola_count,
       k.c/k.a as ola_avg,
       k.a as team_count_ola

FROM (SELECT count( DISTINCT t.issue_id) c ,count(DISTINCT u.accountid)a ,u.dep
FROM jira.team as u
LEFT JOIN jira.team_tickets as t on t.user_id = u.accountid
LEFT JOIN jira.issue as i on i.id = t.issue_id
WHERE slaola_type ='SLA'
AND trunc(i.created) BETWEEN '2021-01-01' AND  '2021-12-31'
group by u.dep) as m
JOIN
(SELECT count(DISTINCT t.issue_id) c,count(DISTINCT u.accountid) a,u.dep,slaola_type
FROM jira.team as u
LEFT JOIN jira.team_tickets as t on t.user_id = u.accountid
LEFT JOIN jira.issue as i on i.id = t.issue_id
WHERE slaola_type ='OLA'
AND trunc(i.created) BETWEEN '2021-01-01' AND  '2021-12-31'
group by u.dep,slaola_type) as k on k.dep = m.dep;;
    }

  dimension: department {
    type: string
    sql: ${TABLE}.dep ;;
  }

  dimension: sla_count {
    type: number
    sql: ${TABLE}.sla_count ;;
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


}
