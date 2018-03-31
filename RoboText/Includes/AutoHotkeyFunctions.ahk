; Create a tolist based on the day of the week.
CreateToDoList()
{
	global NOTES_DIR
	
	; current date
	date:= a_now
	
	; day of week (subtract 2; if today is Monday no days should be subtracted)
	dayofwk := A_WDay-2 ; A_WDay is 2 for Monday

	If (A_WDay = 1) ; sun
		date +=1,days
	Else
		date += -%dayofwk%,days
		
	formattime, mmdd_start, %date%,MMMM yyyy_dddd_dd_MMM
	formattime, mmdd_start_title, %date%,MMMM yyyy dddd dd MMM
	
	; find date of following Friday
	date += 4,days
	formattime, mmdd_end, %date%, dddd dd MMM
	formattime, mmdd_end_title, %date%, dddd dd MMM yyyy
	filename=%NOTES_DIR%\TODO %mmdd_start%_to_%mmdd_end%.txt
	title= TODO %mmdd_start_title% to %mmdd_end_title%`r
	
	brief=Monday Vision:	Define Top 3 Weekly Outcomes`r
	brief=%brief%Daily Outcomes:	3 outcomes and next best thing`r
	brief=%brief%Friday Reflection:	Lessons Learnt`r
	
	if not FileExist(filename)
	{
		fileappend,%title%, %filename%
		fileappend,%brief%, %filename%
		
		run %filename%
	}
}