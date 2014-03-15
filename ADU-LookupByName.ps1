$userlist = import-csv c:\temp\ulist-import.csv

foreach ($user in $userlist){
  
  get-aduser -filter {displayName -like "$user"} -properties department, displayName | select displayName, department | export-csv "ADOut.out" 

}