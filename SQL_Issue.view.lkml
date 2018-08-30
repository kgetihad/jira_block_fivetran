view: sql_issue {
    derived_table: {
      sql: SELECT * FROM
      (SELECT a.id
      , b.time
      ,if( @lastID  = a.id, TIMESTAMPDIFF(hour,@lastValue,b.time ) , 000.00 ) as T
      ,@lastID := a.id as last_id
      ,@lastValue := b.time as time_a

     from jira.issue as a
     JOIN jira.issue_assignee_history as b ON
      b.issue_id = a.id
      JOIN
      ( select @lastID := 0,
      @lastValue := 0
      ) SQLVars

      ORDER BY issue.id ASC
   ) as t
    ;;
 }
dimension: Issue_ID{
  type: number
  sql: ${TABLE}.id;;

}
dimension: Spent_Time {
  type: number
  sql: ${TABLE}.T;;
}

}


