WITH ListOfIds ( List )  AS 
(
-- ",1,2,3,4,5,6,7,8,9"
	SELECT TOP 9
		   ',' + STR(ROW_NUMBER() OVER ( ORDER BY (SELECT NULL)) , 1 ,0)
	  FROM SYS.COLUMNS
	  FOR XML PATH('')
) 
-- ",1,2,3,4,5,6,7,8,9" ==> "1,2,3,4,5,6,7,8,9"
SELECT STUFF(List,1,1,'')
  FROM ListOfIds
 
