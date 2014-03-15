$userlist = get-content c:\temp\Import-CSV.txt


foreach ($user in $userlist){
  $filter = "displayname -eq ""$user"""
  $userdetail = get-aduser -filter $filter -properties * -searchbase "ou=allusers,dc=cpcc,dc=edu" -searchscope 2

  $dname = $userdetail.DisplayName
  $dname = $dname -replace "`t|`n|`r",""

  $dept = $userdetail.Department
  $dept = $dept -replace "`t|`n|`r",""

  $formatstring = "$dname,$dept"
  $formatstring | Add-Content 'c:\temp\adoutput.txt'
  

### Added to an array, but I think I'm just going to write straight to the file
#  $myoutput += $formatstring


###
### Working output, but gd newlines
###
#  write-output $userdetail.DisplayName "," $userdetail.Department

}