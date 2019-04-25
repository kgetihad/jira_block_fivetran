view: team {
  sql_table_name: jira.team ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: dep {
    type: string
    sql: ${TABLE}.dep ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, username]
  }

  measure: count_team_member {
    type: count_distinct
    sql: ${username} ;;

  }
}
