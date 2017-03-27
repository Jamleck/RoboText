; this year
:*:yyy::
	SendInput %A_YYYY%
return

;Short date with _separator
:*:date_::
	FormatTime, CurrentDateTime,, dd_MM_yyyy
	SendInput %CurrentDateTime%
return

;Short date with -separator
:*:date-::
	FormatTime, CurrentDateTime,, dd-MM-yyyy
	SendInput %CurrentDateTime%
return

;Short date with /separator
:*:date/::
:*:ddd::
	FormatTime, CurrentDateTime,, dd/MM/yyyy
	SendInput %CurrentDateTime%
return

;Short date in reverse
:*:dater::
	FormatTime, CurrentDateTime,, yyyy-MM-dd
	SendInput %CurrentDateTime%
return

; Short date and time
:*:datett::
	FormatTime, CurrentDateTime,, d/M/yyyy h:mm tt
	SendInput %CurrentDateTime%
return

; Time
:*:ttt::
	FormatTime, CurrentDateTime,, Time
	SendInput %CurrentDateTime%
return

; Create temp file name
:*:temp??::
{
	FormatTime, TimeString,, yyyy-MM-dd_HHmmss
	FileName=C:\TEMP\temp_data_%TimeString%.csv
	SendInput, %FileName%
	return
}
	
; Computer name
:*:COMP??::
{
	SendInput %A_ComputerName%
	return
}

;Emails
:C*P1:a@::
:C*P1:c@::
{
	SendInput %EMAIL%
	return
}

:C*P1:b@::
:C*P1:j@::
{
	SendInput %EMAIL2%
	return
}

