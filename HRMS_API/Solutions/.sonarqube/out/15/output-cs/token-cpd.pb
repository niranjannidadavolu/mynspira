∞
åF:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.Model.Business.SearchCriteria\Administration\RoleInformationSearchCriteria.cs
	namespace 	
Phoenix
 
. 
Model 
. 
Business  
.  !
SearchCriteria! /
./ 0
Administration0 >
{ 
public 

class )
RoleInformationSearchCriteria .
:/ 0
SearchBaseEntity1 A
{ 
public 
string 
UserSearchValue %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
}		 
}

 ∞
åF:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.Model.Business.SearchCriteria\Administration\UserInformationSearchCriteria.cs
	namespace 	
Phoenix
 
. 
Model 
. 
Business  
.  !
SearchCriteria! /
./ 0
Administration0 >
{ 
public 

class )
UserInformationSearchCriteria .
:/ 0
SearchBaseEntity1 A
{ 
public 
string 
UserSearchValue %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
}		 
}

 ˜
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.Model.Business.SearchCriteria\Class1.cs
	namespace 	
Phoenix
 
. 
Model 
. 
Business  
.  !
SearchCriteria! /
{ 
public 

class 
Class1 
{ 
} 
} Ù
ïF:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.Model.Business.SearchCriteria\EmployeeInformation\EmployeeInformationSearchCriteria.cs
	namespace 	
Phoenix
 
. 
Model 
. 
Business  
.  !
SearchCriteria! /
./ 0
EmployeeInformation0 C
{ 
public 

class -
!EmployeeInformationSearchCriteria 2
:3 4
SearchBaseEntity5 E
{ 
public 
string 
SearchValue !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
int		 
	ManagerId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public 
int 
IncludeSelf 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ß
ÉF:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.Model.Business.SearchCriteria\LeaveManagement\LeaveSearchCriteria.cs
	namespace 	
Phoenix
 
. 
Model 
. 
Business  
.  !
SearchCriteria! /
./ 0
LeaveManagement0 ?
{ 
public 

class 
LeaveSearchCriteria $
{ 
public 
DateTime 
FromDate  
{ 	
get		 
{

 
DateTime 
fromDate !
=" #
	LeaveFrom$ -
.- .
ToDateTimeOrDefault. A
(A B
)B C
;C D
return 
fromDate 
;  
} 
} 	
public 
DateTime 
ToDate 
{ 	
get 
{ 
DateTime 
toDate 
=  !
LeaveTo" )
.) *
ToDateTimeOrDefault* =
(= >
)> ?
;? @
return 
toDate 
; 
} 
} 	
public 
int 
EmployeeSlno 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
	LeaveFrom "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? 
LeaveTo  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ∫
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.Model.Business.SearchCriteria\NSL\EmployeeProfileSearchCriteria.cs
	namespace 	
Phoenix
 
. 
Model 
. 
Business  
.  !
SearchCriteria! /
./ 0
EmployeeInformation0 C
{ 
public 

class )
EmployeeProfileSearchCriteria .
:/ 0
SearchBaseEntity1 A
{ 
public 
int 
	PageIndex 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
}		 
}

 †	
âF:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.Model.Business.SearchCriteria\TimeSheet\ReporteeTimeSheetSearchCriteria.cs
	namespace		 	
Phoenix		
 
.		 
Model		 
.		 
Business		  
.		  !
SearchCriteria		! /
.		/ 0
	TimeSheet		0 9
{

 
public 

class +
ReporteeTimeSheetSearchCriteria 0
:1 2
SearchBaseEntity3 C
{ 
public 
int  
ReportingManagerSlno '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DateTime 
? 
	StartDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? 
EndDate  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
	ReportFor 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} 