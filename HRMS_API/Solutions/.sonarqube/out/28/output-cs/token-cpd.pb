ç
bF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Base\BaseApiController.cs
	namespace

 	
Phoenix


 
.

 
Web

 
.

 
Service

 
.

 
Base

 "
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BaseApiController "
:# $
BaseController% 3
{ 
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
dynamic !
>! "
DownloadFile# /
(/ 0
)0 1
{ 	
byte 
[ 
] 
response 
= 
null "
;" #
string 
file 
= 
Request !
.! "
Form" &
[& '
$str' 0
]0 1
.1 2
ToString2 :
(: ;
); <
;< =
string 
[ 
] 
fileData 
= 
file  $
.$ %
Split% *
(* +
$char+ /
)/ 0
;0 1
FileInfo 
fileInfo 
= 
new  #
FileInfo$ ,
(, -
file- 1
)1 2
;2 3
if 
( 
fileData 
!= 
null  
&&! #
fileData$ ,
., -
Length- 3
>4 5
$num6 7
)7 8
{ 
string 
filePath 
=  !
string" (
.( )
Join) -
(- .
$char. 1
,1 2
fileData3 ;
); <
;< =
StringBuilder 

strBuilder (
=) *
new+ .
StringBuilder/ <
(< =
)= >
;> ?

strBuilder 
. 
Append !
(! "
filePath" *
)* +
;+ ,
Uri 
uri 
= 
new 
Uri !
(! "

strBuilder" ,
., -
ToString- 5
(5 6
)6 7
)7 8
;8 9
response   
=   
new   
	WebClient   (
(  ( )
)  ) *
.  * +
DownloadData  + 7
(  7 8
uri  8 ;
.  ; <
AbsoluteUri  < G
)  G H
;  H I
}!! 
return"" 
File"" 
("" 
response""  
,""  !
	Constants""" +
.""+ ,
IMGMIMETYPE"", 7
,""7 8
fileInfo""9 A
.""A B
	Extension""B K
)""K L
;""L M
}## 	
}$$ 
}%% ¡
_F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Base\BaseController.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
. 
Controllers (
.( )
Base) -
{ 
public 

class 
BaseController 
:  !
ControllerBase" 0
{		 
private

 
readonly

 
IConfiguration

 '
configuration

( 5
;

5 6
private 
IDistributedCache !

redisCache" ,
;, -
public 
BaseController 
( 
) 
{ 	
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
BaseController 
( 
IDistributedCache /

redisCache0 :
): ;
:< =
this> B
(B C
)C D
{ 	
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
BaseController 
( 
IConfiguration ,
configuration- :
,: ;
IDistributedCache< M

redisCacheN X
)X Y
:Z [
this\ `
(` a
)a b
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
}"" 
}## ò
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Base\IBaseController.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
. 
Controllers (
.( )
Base) -
{ 
public 

	interface 
IBaseController $
{ 
} 
} å/
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Administration\LeaveInformationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Administration* 8
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class &
LeaveInformationController +
:, -
BaseController. <
{ 
private 
readonly (
ILeaveInformationApplication 5'
leaveInformationApplication6 Q
;Q R
public &
LeaveInformationController )
() *(
ILeaveInformationApplication* F'
leaveInformationApplicationG b
)b c
{ 	
this 
. '
leaveInformationApplication ,
=- .'
leaveInformationApplication/ J
;J K
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str $
)$ %
]% &
public 
async 
Task 
< 
List 
< 
LeaveInformation /
>/ 0
>0 1
GetLeaveInformation2 E
(E F
)F G
{ 	
List 
< 
LeaveInformation !
>! " 
leaveInformationList# 7
=8 9
await: ?'
leaveInformationApplication@ [
.[ \
GetLeaveInformation\ o
(o p
)p q
;q r 
leaveInformationList!!  
=!!! " 
leaveInformationList!!# 7
.!!7 8
OrderByDescending!!8 I
(!!I J
x!!J K
=>!!L N
x!!O P
.!!P Q 
LeaveInformationName!!Q e
)!!e f
.!!f g
ToList!!g m
(!!m n
)!!n o
;!!o p
return##  
leaveInformationList## '
;##' (
}$$ 	
[%% 	
	Authorize%%	 
]%% 
[&& 	
HttpPost&&	 
]&& 
['' 	
Route''	 
('' 
$str'' '
)''' (
]''( )
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) "
UpdateLeaveInformation))  6
())6 7
[))7 8
FromBody))8 @
]))@ A#
LeaveInformationSaveReq))B Y
leaveInformationn))Z k
)))k l
{** 	
bool++ 
isSaved++ 
=++ 
await++  '
leaveInformationApplication++! <
.++< ="
UpdateLeaveInformation++= S
(++S T
leaveInformationn++T e
)++e f
;++f g
return,, 
isSaved,, 
;,, 
}-- 	
[.. 	
	Authorize..	 
].. 
[// 	
HttpPost//	 
]// 
[00 	
Route00	 
(00 
$str00 &
)00& '
]00' (
public22 
async22 
Task22 
<22 
bool22 
>22 !
SavedLeaveInformation22  5
(225 6
[226 7
FromBody227 ?
]22? @#
LeaveInformationSaveReq22A X
leaveInformationn22Y j
)22j k
{33 	
bool44 
isSaved44 
=44 
await44  '
leaveInformationApplication44! <
.44< =!
SavedLeaveInformation44= R
(44R S
leaveInformationn44S d
)44d e
;44e f
return55 
isSaved55 
;55 
}66 	
[88 	
	Authorize88	 
]88 
[99 	

HttpDelete99	 
]99 
[:: 	
Route::	 
(:: 
$str:: '
)::' (
]::( )
public<< 
async<< 
Task<< 
<<< 
bool<< 
><< "
DeleteLeaveInformation<<  6
(<<6 7
int<<7 :
leaveInformationId<<; M
)<<M N
{== 	
bool>> 
isSaved>> 
=>> 
await>>  '
leaveInformationApplication>>! <
.>>< ="
DeleteLeaveInformation>>= S
(>>S T
leaveInformationId>>T f
)>>f g
;>>g h
return?? 
isSaved?? 
;?? 
}@@ 	
[AA 	
	AuthorizeAA	 
]AA 
[BB 	
HttpGetBB	 
]BB 
[CC 	
RouteCC	 
(CC 
$strCC )
)CC) *
]CC* +
publicDD 
asyncDD 
TaskDD 
<DD 
ListDD 
<DD  
LeaveTypeInformationDD 3
>DD3 4
>DD4 5$
GetLeaveInformationByOfcDD6 N
(DDN O
intDDO R
officeTypeSlnoDDS a
,DDa b
intDDc f
?DDf g

branchSlnoDDh r
)DDr s
{EE 	
ListFF 
<FF  
LeaveTypeInformationFF %
>FF% & 
leaveTypeInformationFF' ;
=FF< =
awaitFF> C'
leaveInformationApplicationFFD _
.FF_ `$
GetLeaveInformationByOfcFF` x
(FFx y
officeTypeSlno	FFy á
,
FFá à

branchSlno
FFâ ì
)
FFì î
;
FFî ï 
leaveTypeInformationHH  
=HH! " 
leaveTypeInformationHH# 7
.HH7 8
OrderByDescendingHH8 I
(HHI J
xHHJ K
=>HHL N
xHHO P
.HHP Q
LeaveInformationIdHHQ c
)HHc d
.HHd e
ToListHHe k
(HHk l
)HHl m
;HHm n
returnII  
leaveTypeInformationII '
;II' (
}JJ 	
}KK 
}LL »%
áF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Administration\LeavePolicyInformationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Administration* 8
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class ,
 LeavePolicyInformationController 1
:2 3
BaseController4 B
{ 
private 
readonly .
"ILeavePolicyInformationApplication ;-
!leavePolicyInformationApplication< ]
;] ^
public ,
 LeavePolicyInformationController /
(/ 0.
"ILeavePolicyInformationApplication0 R-
!leavePolicyInformationApplicationS t
)t u
{ 	
this 
. -
!leavePolicyInformationApplication 2
=3 4-
!leavePolicyInformationApplication5 V
;V W
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str *
)* +
]+ ,
public 
async 
Task 
< 
List 
< "
LeavePolicyInformation 5
>5 6
>6 7%
GetLeavePolicyInformation8 Q
(Q R
)R S
{ 	
List   
<   "
LeavePolicyInformation   '
>  ' (&
leavePolicyInformationList  ) C
=  D E
await  F K-
!leavePolicyInformationApplication  L m
.  m n&
GetLeavePolicyInformation	  n á
(
  á à
)
  à â
;
  â ä&
leavePolicyInformationList"" &
=""' (&
leavePolicyInformationList"") C
.""C D
OrderByDescending""D U
(""U V
x""V W
=>""X Z
x""[ \
.""\ ]

PolicyName""] g
)""g h
.""h i
ToList""i o
(""o p
)""p q
;""q r
return## &
leavePolicyInformationList## -
;##- .
}$$ 	
[%% 	
	Authorize%%	 
]%% 
[&& 	
HttpPost&&	 
]&& 
['' 	
Route''	 
('' 
$str'' +
)''+ ,
]'', -
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) &
SaveLeavePolicyInformation))  :
()): ;
[)); <
FromBody))< D
]))D E"
LeavePolicyInformation))F \
userInformation))] l
)))l m
{** 	
bool++ 
isSaved++ 
=++ 
await++  -
!leavePolicyInformationApplication++! B
.++B C&
SaveLeavePolicyInformation++C ]
(++] ^
userInformation++^ m
)++m n
;++n o
return,, 
isSaved,, 
;,, 
}-- 	
[.. 	
	Authorize..	 
].. 
[// 	
HttpPost//	 
]// 
[00 	
Route00	 
(00 
$str00 -
)00- .
]00. /
public22 
async22 
Task22 
<22 
bool22 
>22 (
UpdateLeavePolicyInformation22  <
(22< =
[22= >
FromBody22> F
]22F G%
LeavePolicyInformationReq22H a
userInformation22b q
)22q r
{33 	
bool44 
isSaved44 
=44 
await44  -
!leavePolicyInformationApplication44! B
.44B C(
UpdateLeavePolicyInformation44C _
(44_ `
userInformation44` o
)44o p
;44p q
return55 
isSaved55 
;55 
}66 	
[77 	
	Authorize77	 
]77 
[88 	

HttpDelete88	 
]88 
[99 	
Route99	 
(99 
$str99 -
)99- .
]99. /
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; (
DeleteLeavePolicyInformation;;  <
(;;< =
int;;= @
policyID;;A I
);;I J
{<< 	
bool== 
isSaved== 
=== 
await==  -
!leavePolicyInformationApplication==! B
.==B C(
DeleteLeavePolicyInformation==C _
(==_ `
policyID==` h
)==h i
;==i j
return>> 
isSaved>> 
;>> 
}?? 	
}@@ 
}AA ë7
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Administration\LogFileController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Administration* 8
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
LogFileController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IFileProvider &
_fileProvider' 4
;4 5
public 
LogFileController  
(  !
IFileProvider! .
fileProvider/ ;
); <
{ 	
_fileProvider 
= 
fileProvider (
;( )
} 	
[$$ 	
HttpGet$$	 
]$$ 
[%% 	
Route%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
List&& 
<&& 
LogFile&& 
>&& 
GetLogFiles&& (
(&&( )
)&&) *
{'' 	
string(( 

folderName(( 
=(( 
Path((  $
.(($ %
Combine((% ,
(((, -
ApplicationSettings((- @
.((@ A
Current((A H
.((H I
LogFilePath((I T
)((T U
;((U V
string)) 

pathToRead)) 
=)) 
Path))  $
.))$ %
Combine))% ,
()), -
	Directory))- 6
.))6 7
GetCurrentDirectory))7 J
())J K
)))K L
,))L M

folderName))N X
)))X Y
;))Y Z
List** 
<** 
LogFile** 
>** 
files** 
=**  !
new**" %
List**& *
<*** +
LogFile**+ 2
>**2 3
(**3 4
)**4 5
;**5 6
var++ 
	filesList++ 
=++ 
	Directory++ &
.++& '
EnumerateFiles++' 5
(++5 6

pathToRead++6 @
,++@ A
$str++A D
,++D E
SearchOption++E Q
.++Q R
AllDirectories++R `
)++` a
;++a b
foreach,, 
(,, 
string,, 
x,, 
in,,  
	filesList,,! *
),,* +
{-- 
LogFile// 
file// 
=// 
new// "
LogFile//# *
(//* +
)//+ ,
{00 
FileName11 
=11 
Path11 #
.11# $
GetFileName11$ /
(11/ 0
x110 1
)111 2
,112 3
CreatedDate22 
=22  !
x22" #
.22# $

ToFileInfo22$ .
(22. /
)22/ 0
.220 1
CreationTime221 =
,22= >
LastWriteDate33 !
=33" #
x33$ %
.33% &

ToFileInfo33& 0
(330 1
)331 2
.332 3
LastWriteTime333 @
,33@ A
FileExtension44 !
=44" #
Path44$ (
.44( )
GetExtension44) 5
(445 6
x446 7
)447 8
,448 9
FileUrl55 
=55 
x55 
,55  

FolderName66 
=66  
Path66" &
.66& '
GetFileName66' 2
(662 3
Path663 7
.667 8
GetDirectoryName668 H
(66H I
x66I J
)66J K
.66K L
TrimEnd66L S
(66S T
Path66T X
.66X Y"
DirectorySeparatorChar66Y o
)66o p
)66p q
}77 
;77 
files88 
.88 
Add88 
(88 
file88 
)88 
;88  
}99 
returnDD 
filesDD 
;DD 
}EE 	
[GG 	
HttpGetGG	 
,GG #
DisableRequestSizeLimitGG )
]GG) *
[HH 	
RouteHH	 
(HH 
$strHH  
)HH  !
]HH! "
publicII 
asyncII 
TaskII 
<II 
IActionResultII '
>II' (
DownloadLogFileII) 8
(II8 9
[II9 :
	FromQueryII: C
]IIC D
stringIIE K
fileUrlIIL S
)IIS T
{JJ 	
varKK 
filePathKK 
=KK 
PathKK 
.KK  
CombineKK  '
(KK' (
	DirectoryKK( 1
.KK1 2
GetCurrentDirectoryKK2 E
(KKE F
)KKF G
,KKG H
fileUrlKKI P
)KKP Q
;KKQ R
stringLL 
downLoadFileNameLL #
=LL$ %
PathLL& *
.LL* +
GetFileNameLL+ 6
(LL6 7
filePathLL7 ?
)LL? @
;LL@ A
ifNN 
(NN 
!NN 
SystemNN 
.NN 
IONN 
.NN 
FileNN 
.NN  
ExistsNN  &
(NN& '
filePathNN' /
)NN/ 0
)NN0 1
returnOO 
NotFoundOO 
(OO  
)OO  !
;OO! "
varPP 
memoryPP 
=PP 
newPP 
MemoryStreamPP )
(PP) *
)PP* +
;PP+ ,
awaitQQ 
usingQQ 
(QQ 
varQQ 
streamQQ #
=QQ$ %
newQQ& )

FileStreamQQ* 4
(QQ4 5
filePathQQ5 =
,QQ= >
FileModeQQ? G
.QQG H
OpenQQH L
)QQL M
)QQM N
{RR 
awaitSS 
streamSS 
.SS 
CopyToAsyncSS (
(SS( )
memorySS) /
)SS/ 0
;SS0 1
}TT 
memoryUU 
.UU 
PositionUU 
=UU 
$numUU 
;UU  
returnVV 
FileVV 
(VV 
memoryVV 
,VV 
GetContentTypeVV  .
(VV. /
filePathVV/ 7
)VV7 8
,VV8 9
downLoadFileNameVV: J
)VVJ K
;VVK L
}WW 	
privateYY 
stringYY 
GetContentTypeYY %
(YY% &
stringYY& ,
pathYY- 1
)YY1 2
{ZZ 	
var[[ 
provider[[ 
=[[ 
new[[ ,
 FileExtensionContentTypeProvider[[ ?
([[? @
)[[@ A
;[[A B
string\\ 
contentType\\ 
;\\ 
if^^ 
(^^ 
!^^ 
provider^^ 
.^^ 
TryGetContentType^^ +
(^^+ ,
path^^, 0
,^^0 1
out^^2 5
contentType^^6 A
)^^A B
)^^B C
{__ 
contentType`` 
=`` 
$str`` 8
;``8 9
}aa 
returncc 
contentTypecc 
;cc 
}dd 	
}ee 
}ff «
ÇF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Administration\ModuleInformationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Administration* 8
{ 
[ 
	Authorize 
] 
public 

class '
ModuleInformationController ,
:- .
BaseController/ =
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
private 
readonly )
IModuleInformationApplication 6(
moduleInformationApplication7 S
;S T
public '
ModuleInformationController *
(* +)
IModuleInformationApplication+ H(
moduleInformationApplicationI e
,e f
IConfigurationg u
configuration	v É
,
É Ñ
IDistributedCache
Ö ñ

redisCache
ó °
)
° ¢
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
. (
moduleInformationApplication -
=. /(
moduleInformationApplication0 L
;L M
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
[   	
HttpGet  	 
(   
$str   @
)  @ A
]  A B
public!! 
async!! 
Task!! 
<!! 
List!! 
<!! 
SecurityModule!! -
>!!- .
>!!. /(
LoadActiveModuleInformations!!0 L
(!!L M
)!!M N
{"" 	
List## 
<## 
SecurityModule## 
>##  
moduleInformations##! 3
=##4 5
await##6 ;(
moduleInformationApplication##< X
.##X Y(
LoadActiveModuleInformations##Y u
(##u v
)##v w
;##w x
return$$ 
moduleInformations$$ %
;$$% &
}%% 	
}&& 
}'' ˚>
ÄF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Administration\RoleInformationController.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
. 
Controllers (
.( )
Administration) 7
{ 
[ 
Route 

(
 
$str 
) 
]  
public 

class %
RoleInformationController *
:+ ,
BaseController- ;
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
private 
readonly '
IRoleInformationApplication 4
roleApplication5 D
;D E
public %
RoleInformationController (
(( )'
IRoleInformationApplication) D
roleApplicationE T
,T U
IConfigurationV d
configuratione r
,r s
IDistributedCache	u Ü

redisCache
á ë
)
ë í
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
. 
roleApplication  
=! "
roleApplication# 2
;2 3
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
[   	
	Authorize  	 
]   
["" 	
HttpGet""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% 
RoleInformation%% .
>%%. /
>%%/ 0
GetUserRoles%%1 =
(%%= >
long%%> B
employeeSlno%%C O
)%%O P
{&& 	
List'' 
<'' 
RoleInformation''  
>''  !
roleInformations''" 2
=''3 4
await''5 :
roleApplication''; J
.''J K
GetUserRoles''K W
(''W X
employeeSlno''X d
)''d e
;''e f
return(( 
roleInformations(( #
;((# $
})) 	
[++ 	
	Authorize++	 
]++ 
[-- 	
HttpGet--	 
]-- 
[.. 	
Route..	 
(.. 
$str.. "
).." #
]..# $
public00 
async00 
Task00 
<00 
List00 
<00 
RoleInformation00 .
>00. /
>00/ 0
GetAllActiveRoles001 B
(00B C
)00C D
{11 	
List22 
<22 
RoleInformation22  
>22  !
roleInformations22" 2
=223 4
await225 :
roleApplication22; J
.22J K
GetAllActiveRoles22K \
(22\ ]
)22] ^
;22^ _
return33 
roleInformations33 #
;33# $
}44 	
[66 	
	Authorize66	 
]66 
[88 	
HttpPost88	 
]88 
[99 	
Route99	 
(99 
$str99 
)99 
]99 
public;; 
async;; 
Task;; 
<;; 
List;; 
<;; 
RoleInformation;; .
>;;. /
>;;/ 0
SearchRoles;;1 <
(;;< =
[;;= >
FromBody;;> F
];;F G)
RoleInformationSearchCriteria;;H e
searchCriteria;;f t
);;t u
{<< 	
List== 
<== 
RoleInformation==  
>==  !
roleInformations==" 2
===3 4
await==5 :
roleApplication==; J
.==J K
SearchRoles==K V
(==V W
searchCriteria==W e
)==e f
;==f g
return>> 
roleInformations>> #
;>># $
}?? 	
[AA 	
	AuthorizeAA	 
]AA 
[CC 	
HttpPostCC	 
]CC 
[DD 	
RouteDD	 
(DD 
$strDD 
)DD  
]DD  !
publicFF 
asyncFF 
TaskFF 
<FF 
ListFF 
<FF 
RoleInformationFF .
>FF. /
>FF/ 0
MapRolesToUserFF1 ?
(FF? @
)FF@ A
{GG 	
ListHH 
<HH 
RoleInformationHH  
>HH  !
roleInformationsHH" 2
=HH3 4
awaitHH5 :
roleApplicationHH; J
.HHJ K
GetAllActiveRolesHHK \
(HH\ ]
)HH] ^
;HH^ _
returnII 
roleInformationsII #
;II# $
}JJ 	
[LL 	
	AuthorizeLL	 
]LL 
[NN 	
HttpGetNN	 
]NN 
[OO 	
RouteOO	 
(OO 
$strOO 
)OO 
]OO 
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
boolQQ 
>QQ 
ActivateRoleQQ  ,
(QQ, -
longQQ- 1
roleSlnoQQ2 :
)QQ: ;
{RR 
boolSS 
isUserActivatedSS  
=SS! "
awaitSS# (
roleApplicationSS) 8
.SS8 9
ActivateRoleSS9 E
(SSE F
roleSlnoSSF N
)SSN O
;SSO P
returnTT 
isUserActivatedTT "
;TT" #
}UU 	
[WW 	
	AuthorizeWW	 
]WW 
[YY 	
HttpGetYY	 
]YY 
[ZZ 	
RouteZZ	 
(ZZ 
$strZZ 
)ZZ  
]ZZ  !
public\\ 
async\\ 
Task\\ 
<\\ 
bool\\ 
>\\ 
DeActivateRole\\  .
(\\. /
long\\/ 3
roleSlno\\4 <
)\\< =
{]] 
bool^^ 
isUserDeactivated^^ "
=^^# $
await^^% *
roleApplication^^+ :
.^^: ;
DeActivateRole^^; I
(^^I J
roleSlno^^J R
)^^R S
;^^S T
return__ 
isUserDeactivated__ $
;__$ %
}`` 	
[bb 	
	Authorizebb	 
]bb 
[dd 	
HttpGetdd	 
]dd 
[ee 	
Routeee	 
(ee 
$stree #
)ee# $
]ee$ %
publicgg 
asyncgg 
Taskgg 
<gg 
RoleInformationgg )
>gg) *
GetRoleInformationgg+ =
(gg= >
longgg> B
roleSlnoggC K
)ggK L
{hh 	
RoleInformationii 
roleInformationii +
=ii, -
awaitii. 3
roleApplicationii4 C
.iiC D
GetRoleInformationiiD V
(iiV W
roleSlnoiiW _
)ii_ `
;ii` a
returnjj 
roleInformationjj "
;jj" #
}kk 	
[mm 	
	Authorizemm	 
]mm 
[oo 	
HttpPostoo	 
]oo 
[pp 	
Routepp	 
(pp 
$strpp $
)pp$ %
]pp% &
publicrr 
asyncrr 
Taskrr 
<rr 
boolrr 
>rr 
SaveRoleInformationrr  3
(rr3 4
[rr4 5
FromBodyrr5 =
]rr= >
RoleInformationrr? N
roleInformationrrO ^
)rr^ _
{ss 	
booltt 
isSavedtt 
=tt 
awaittt  
roleApplicationtt! 0
.tt0 1
SaveRoleInformationtt1 D
(ttD E
roleInformationttE T
)ttT U
;ttU V
returnuu 
isSaveduu 
;uu 
}vv 	
}ww 
}xx Ô 
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Administration\SecurityModuleController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Administration* 8
{ 
[ 
	Authorize 
] 
public 

class $
SecurityModuleController )
:* +
BaseController, :
{ 
private 
readonly &
ISecurityModuleApplication 3%
SecurityModuleApplication4 M
;M N
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public $
SecurityModuleController '
(' (&
ISecurityModuleApplication( B%
SecurityModuleApplicationC \
,\ ]
IConfiguration^ l
configurationm z
,z {
IDistributedCache	| ç

redisCache
é ò
)
ò ô
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
. %
SecurityModuleApplication *
=+ ,%
SecurityModuleApplication- F
;F G
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
[   	
HttpGet  	 
(   
$str   C
)  C D
]  D E
public!! 
async!! 
Task!! 
<!! 
List!! 
<!! 
SecurityModule!! -
>!!- .
>!!. /+
LoadRoleLevelAccessPermisssions!!0 O
(!!O P
)!!P Q
{"" 	
List## 
<## 
SecurityModule## 
>##  
securityModules##! 0
;##0 1
securityModules$$ 
=$$ 
await$$ #%
SecurityModuleApplication$$$ =
.$$= >+
LoadRoleLevelAccessPermisssions$$> ]
($$] ^
)$$^ _
;$$_ `
return%% 
securityModules%% "
;%%" #
}&& 	
[(( 	
HttpGet((	 
((( 
$str(( 9
)((9 :
]((: ;
public)) 
async)) 
Task)) 
<)) 
List)) 
<)) 
SecurityModule)) -
>))- .
>)). /!
LoadMappedPermissions))0 E
())E F
int))F I
roleId))J P
)))P Q
{** 	
List++ 
<++ 
SecurityModule++ 
>++  
securityModules++! 0
;++0 1
securityModules,, 
=,, 
await,, #%
SecurityModuleApplication,,$ =
.,,= >!
LoadMappedPermissions,,> S
(,,S T
roleId,,T Z
),,Z [
;,,[ \
return-- 
securityModules-- "
;--" #
}.. 	
[00 	
HttpPost00	 
(00 
$str00 4
)004 5
]005 6
public11 
async11 
Task11 
<11 
bool11 
>11 
SavePermissions11  /
(11/ 0
[110 1
FromBody111 9
]119 :
UserRolePermissions11; N
userRolePermissions11O b
)11b c
{22 	
bool33 
isSaved33 
=33 
false33  
;33  !
isSaved44 
=44 
await44 %
SecurityModuleApplication44 5
.445 6
SavePermissions446 E
(44E F
userRolePermissions44F Y
.44Y Z
Permissions44Z e
,44e f
userRolePermissions44g z
.44z {
RoleId	44{ Å
)
44Å Ç
;
44Ç É
return55 
isSaved55 
;55 
}66 	
}77 
}88 £J
ÄF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Administration\UserInformationController.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
. 
Controllers (
.( )
Administration) 7
{ 
[ 
Route 

(
 
$str 
) 
]  
public 

class %
UserInformationController *
:+ ,
BaseController- ;
{ 
private 
readonly '
IUserInformationApplication 4&
userInformationApplication5 O
;O P
private 
readonly 
ICryptography &
cryptography' 3
;3 4
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public %
UserInformationController (
(( )'
IUserInformationApplication) D&
userInformationApplicationE _
,_ `
ICryptographya n
cryptographyo {
,{ |
IDistributedCache	} é

redisCache
è ô
)
ô ö
: 
base 
( 

redisCache 
) 
{ 	
this 
. 

redisCache 
= 

redisCache (
;( )
this 
. &
userInformationApplication +
=, -&
userInformationApplication. H
;H I
this 
. 
cryptography 
= 
cryptography  ,
;, -
} 	
[   	
	Authorize  	 
]   
[!! 	
HttpPost!!	 
]!! 
["" 	
Route""	 
("" 
$str"" 
)""  
]""  !
public## 
async## 
Task## 
<## 
bool## 
>## 
ChangePassword##  .
(##. /
[##/ 0
FromBody##0 8
]##8 9
UserInformation##: I
userInformation##J Y
)##Y Z
{$$ 	
bool%% 
isPasswordChanged%% "
=%%# $
await%%% *&
userInformationApplication%%+ E
.%%E F
ChangePassword%%F T
(%%T U
userInformation%%U d
)%%d e
;%%e f
return&& 
isPasswordChanged&& $
;&&$ %
}'' 	
[)) 	
HttpGet))	 
])) 
[** 	
Route**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
OtpData++ !
>++! "
GetOtp++# )
(++) *
string++* 0
userName++1 9
,++9 :
bool++: >
isSignUp++? G
)++G H
{,, 	
OtpData-- 
isOtpGenerated-- "
=--# $
await--% *&
userInformationApplication--+ E
.--E F
GetOtp--F L
(--L M
userName--M U
,--U V
isSignUp--V ^
)--^ _
;--_ `
return.. 
isOtpGenerated.. !
;..! "
}// 	
[11 	
HttpGet11	 
]11 
[22 	
Route22	 
(22 
$str22 
)22 
]22 
public33 
async33 
Task33 
<33 
bool33 
>33 
ValidateOtp33  +
(33+ ,
string33, 2
userName333 ;
,33; <
string33= C
otpValue33D L
)33L M
{44 	
bool55 
isOtpGenerated55 
=55  !
await55" '&
userInformationApplication55( B
.55B C
ValidateOtp55C N
(55N O
userName55O W
,55W X
otpValue55Y a
)55a b
;55b c
return66 
isOtpGenerated66 !
;66! "
}77 	
[99 	
HttpPost99	 
]99 
[:: 	
Route::	 
(:: 
$str:: 
)::  
]::  !
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; 
ForgotPassword;;  .
(;;. /
[;;/ 0
FromBody;;0 8
];;8 9
UserInformation;;: I
userInformation;;J Y
);;Y Z
{<< 	
bool== 
isPasswordChanged== "
===# $
await==% *&
userInformationApplication==+ E
.==E F
ChangePassword==F T
(==T U
userInformation==U d
)==d e
;==e f
return>> 
isPasswordChanged>> $
;>>$ %
}?? 	
[AA 	
HttpGetAA	 
]AA 
[BB 	
RouteBB	 
(BB 
$strBB 
)BB 
]BB 
publicCC 
asyncCC 
TaskCC 
<CC 
OtpDataCC !
>CC! "
SignUpCC# )
(CC) *
stringCC* 0
userNameCC1 9
)CC9 :
{DD 	
OtpDataEE 
isPasswordChangedEE %
=EE& '
awaitEE( -&
userInformationApplicationEE. H
.EEH I
SignUpEEI O
(EEO P
userNameEEP X
)EEX Y
;EEY Z
returnFF 
isPasswordChangedFF $
;FF$ %
}GG 	
[II 	
	AuthorizeII	 
]II 
[KK 	
HttpGetKK	 
]KK 
[LL 	
RouteLL	 
(LL 
$strLL 
)LL 
]LL 
publicNN 
asyncNN 
TaskNN 
<NN 
boolNN 
>NN 
ActivateUserNN  ,
(NN, -
longNN- 1
employeeSlnoNN2 >
)NN> ?
{OO 	
boolPP 
isUserActivatedPP  
=PP! "
awaitPP# (&
userInformationApplicationPP) C
.PPC D
ActivateUserPPD P
(PPP Q
employeeSlnoPPQ ]
)PP] ^
;PP^ _
returnQQ 
isUserActivatedQQ "
;QQ" #
}RR 	
[TT 	
	AuthorizeTT	 
]TT 
[VV 	
HttpGetVV	 
]VV 
[WW 	
RouteWW	 
(WW 
$strWW 
)WW  
]WW  !
publicYY 
asyncYY 
TaskYY 
<YY 
boolYY 
>YY 
DeActivateUserYY  .
(YY. /
longYY/ 3
employeeSlnoYY4 @
)YY@ A
{ZZ 	
bool[[ 
isUserDeactivated[[ "
=[[# $
await[[% *&
userInformationApplication[[+ E
.[[E F
DeActivateUser[[F T
([[T U
employeeSlno[[U a
)[[a b
;[[b c
return\\ 
isUserDeactivated\\ $
;\\$ %
}]] 	
[__ 	
	Authorize__	 
]__ 
[aa 	
HttpPostaa	 
]aa 
[bb 	
Routebb	 
(bb 
$strbb !
)bb! "
]bb" #
publicdd 
asyncdd 
Taskdd 
<dd 
booldd 
>dd 
SaveOrUpdateUserdd  0
(dd0 1
[dd1 2
FromBodydd2 :
]dd: ;
UserInformationdd< K
userInformationddL [
)dd[ \
{ee 	
boolff 
isSavedff 
=ff 
awaitff  &
userInformationApplicationff! ;
.ff; <
SaveOrUpdateUserff< L
(ffL M
userInformationffM \
)ff\ ]
;ff] ^
returngg 
isSavedgg 
;gg 
}hh 	
[jj 	
	Authorizejj	 
]jj 
[ll 	
HttpGetll	 
]ll 
[mm 	
Routemm	 
(mm 
$strmm 
)mm  
]mm  !
publicoo 
asyncoo 
Taskoo 
<oo 
Listoo 
<oo 
RoleInformationoo .
>oo. /
>oo/ 0
GetMappedRolesoo1 ?
(oo? @
intoo@ C
employeeSlnoooD P
)ooP Q
{pp 	
Listqq 
<qq 
RoleInformationqq  
>qq  !
mappedRolesqq" -
=qq. /
awaitqq0 5&
userInformationApplicationqq6 P
.qqP Q
GetMappedRolesqqQ _
(qq_ `
employeeSlnoqq` l
)qql m
;qqm n
returnrr 
mappedRolesrr 
;rr 
}ss 	
[uu 	
	Authorizeuu	 
]uu 
[ww 	
HttpGetww	 
]ww 
[xx 	
Routexx	 
(xx 
$strxx (
)xx( )
]xx) *
publiczz 
asynczz 
Taskzz 
<zz 
Listzz 
<zz 
BranchInformationzz 0
>zz0 1
>zz1 2#
GetUserBranchesFromNerpzz3 J
(zzJ K
intzzK N
userSlnozzO W
)zzW X
{{{ 	
List|| 
<|| 
BranchInformation|| "
>||" #
mappedBranches||$ 2
=||3 4
await||5 :&
userInformationApplication||; U
.||U V#
GetUserBranchesFromNerp||V m
(||m n
userSlno||n v
)||v w
;||w x
return}} 
mappedBranches}} !
;}}! "
}~~ 	
}
ÅÅ 
}ÇÇ ˘<
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Authentication\AuthenticationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Authentication* 8
{ 
[ 
Route 

(
 
$str 
) 
]  
public 

class $
AuthenticationController )
:* +
BaseController, :
{ 
private 
readonly &
IAuthenticationApplication 3%
authenticationApplication4 M
;M N
private 
readonly 
ICryptography &
cryptography' 3
;3 4
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public $
AuthenticationController '
(' (&
IAuthenticationApplication( B%
authenticationApplicationC \
,\ ]
ICryptography^ k
cryptographyl x
,x y
IDistributedCache	z ã

redisCache
å ñ
)
ñ ó
: 
base 
( 

redisCache 
) 
{ 	
this 
. %
authenticationApplication *
=+ ,%
authenticationApplication- F
;F G
this 
. 

redisCache 
= 

redisCache (
;( )
this 
. 
cryptography 
= 
cryptography  ,
;, -
} 	
[   	
HttpPost  	 
]   
[!! 	
Route!!	 
(!! 
$str!! !
)!!! "
]!!" #
public"" 
async"" 
Task"" 
<"" 
UserInformation"" )
>"") *
AuthenticateUser""+ ;
(""; <
[""< =
FromBody""= E
]""E F
LoginInformation""G W
loginInformation""X h
)""h i
{## 	
UserInformation$$ 
userInformation$$ +
=$$, -
await$$. 3%
authenticationApplication$$4 M
.$$M N
AuthenticateUser$$N ^
($$^ _
loginInformation$$_ o
)$$o p
;$$p q
return%% 
userInformation%% "
;%%" #
}&& 	
['' 	
HttpGet''	 
]'' 
[(( 	
Route((	 
((( 
$str(( .
)((. /
]((/ 0
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) )
FetchEqualVerificationDetials))  =
())= >
string))> D
idempotencyId))E R
)))R S
{** 	
bool++ 
verified++ 
=++ 
await++ !%
authenticationApplication++" ;
.++; <)
FetchEqualVerificationDetials++< Y
(++Y Z
idempotencyId++Z g
)++g h
;++h i
return,, 
verified,, 
;,, 
}-- 	
[// 	
HttpPost//	 
]// 
[00 	
Route00	 
(00 
$str00 (
)00( )
]00) *
public11 
async11 
Task11 
<11 
UserInformation11 )
>11) *#
AuthenticateUserForNerp11+ B
(11B C
[11C D
FromBody11D L
]11L M
LoginInformation11N ^
loginInformation11_ o
)11o p
{22 	
UserInformation33 
userInformation33 +
=33, -
await33. 3%
authenticationApplication334 M
.33M N#
AuthenticateUserForNerp33N e
(33e f
loginInformation33f v
)33v w
;33w x
return44 
userInformation44 "
;44" #
}55 	
[88 	
HttpGet88	 
]88 
[99 	
Route99	 
(99 
$str99 ,
)99, -
]99- .
public:: 
async:: 
Task:: 
<:: 
UserInformation:: )
>::) *'
ValidateAndAuthenticateUser::+ F
(::F G
string::G M
userName::N V
)::V W
{;; 	
userName<< 
=<< 
userName<< 
.<<  
Replace<<  '
(<<' (
$str<<( +
,<<+ ,
$str<<- 0
)<<0 1
;<<1 2
string== 
decryptedUsername== $
===% &
AES==' *
.==* +
Decrypt==+ 2
(==2 3
userName==3 ;
,==; <
NConnectSettings=== M
.==M N
Current==N U
.==U V
SecurityKey==V a
,==a b
NConnectSettings==c s
.==s t
Current==t {
.=={ |
SecuritySalt	==| à
)
==à â
;
==â ä
UserInformation>> 
userInformation>> +
=>>, -
new>>. 1
UserInformation>>2 A
(>>A B
)>>B C
;>>C D
userInformation?? 
.?? 
UserName?? $
=??% &
decryptedUsername??' 8
;??8 9
userInformation@@ 
=@@ 
await@@ #%
authenticationApplication@@$ =
.@@= >'
ValidateAndAuthenticateUser@@> Y
(@@Y Z
decryptedUsername@@Z k
)@@k l
;@@l m
returnAA 
userInformationAA "
;AA" #
}BB 	
[DD 	
HttpPostDD	 
]DD 
[EE 	
RouteEE	 
(EE 
$strEE )
)EE) *
]EE* +
publicFF 
asyncFF 
TaskFF 
<FF 
UserInformationFF )
>FF) *3
'RefreshTokenValidateAndAuthenticateUserFF+ R
(FFR S
[FFS T
FromBodyFFT \
]FF\ ]
UserInformationFF^ m
userInformationreq	FFn Ä
)
FFÄ Å
{GG 	
UserInformationHH 
userInformationHH +
=HH, -
newHH. 1
UserInformationHH2 A
(HHA B
)HHB C
;HHC D
userInformationII 
=II 
awaitII #%
authenticationApplicationII$ =
.II= >3
'RefreshTokenValidateAndAuthenticateUserII> e
(IIe f
userInformationreqIIf x
)IIx y
;IIy z
returnJJ 
userInformationJJ "
;JJ" #
}KK 	
[MM 	
HttpGetMM	 
]MM 
[NN 	
RouteNN	 
(NN 
$strNN 
)NN 
]NN 
publicOO 
asyncOO 
TaskOO 
<OO 
UserInformationOO )
>OO) *
EncryptUserOO+ 6
(OO6 7
stringOO7 =
userNameOO> F
)OOF G
{PP 	
stringRR 
encryptedUserNameRR $
=RR% &
AESRR' *
.RR* +
EncryptRR+ 2
(RR2 3
userNameRR3 ;
,RR; <
NConnectSettingsRR= M
.RRM N
CurrentRRN U
.RRU V
SecurityKeyRRV a
,RRa b
NConnectSettingsRRc s
.RRs t
CurrentRRt {
.RR{ |
SecuritySalt	RR| à
)
RRà â
;
RRâ ä
UserInformationSS 
userInformationSS +
=SS, -
newSS. 1
UserInformationSS2 A
(SSA B
)SSB C
;SSC D
userInformationTT 
.TT 
UserNameTT $
=TT% &
encryptedUserNameTT' 8
;TT8 9
returnWW 
userInformationWW "
;WW" #
}XX 	
}bb 
}cc ¸>
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\CarLease\CarLeaseController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
CarLease* 2
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
CarLeaseController #
:$ %
BaseApiController& 7
{ 
private 
readonly  
ICarLeaseApplication -
carLeaseApplication. A
;A B
public 
CarLeaseController !
(! " 
ICarLeaseApplication" 6
carLeaseApplication7 J
)J K
{ 	
this 
. 
carLeaseApplication $
=% &
carLeaseApplication' :
;: ;
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str %
)% &
]& '
public 
async 
Task 
< 
List 
< 
CarLeaseBillName /
>/ 0
>0 1 
GetCarLeaseBillNames2 F
(F G
)G H
{ 	
List 
< 
CarLeaseBillName !
>! "
carLeaseBillNames# 4
=5 6
await7 <
carLeaseApplication= P
.P Q 
GetCarLeaseBillNamesQ e
(e f
)f g
;g h
return 
carLeaseBillNames $
;$ %
}   	
["" 	
	Authorize""	 
]"" 
[## 	
HttpGet##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ .
)$$. /
]$$/ 0
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% &
CarLeaseMaintenanceBalance%% 9
>%%9 :
>%%: ;)
GetCarLeaseMaintenanceBalance%%< Y
(%%Y Z
int%%Z ]
empSLNo%%^ e
)%%e f
{&& 	
List'' 
<'' &
CarLeaseMaintenanceBalance'' +
>''+ ,&
carLeaseMaintenanceBalance''- G
=''H I
await''J O
carLeaseApplication''P c
.''c d*
GetCarLeaseMaintenanceBalance	''d Å
(
''Å Ç
empSLNo
''Ç â
)
''â ä
;
''ä ã
return)) &
carLeaseMaintenanceBalance)) -
;))- .
}** 	
[,, 	
	Authorize,,	 
],, 
[-- 	

HttpDelete--	 
]-- 
[.. 	
Route..	 
(.. 
$str.. &
)..& '
]..' (
public// 
async// 
Task// 
<// 
bool// 
>// !
DeleteMaintenenceBill//  5
(//5 6
int//6 9
recordId//: B
)//B C
{00 	
bool11 
response11 
=11 
await11 !
carLeaseApplication11" 5
.115 6!
DeleteMaintenenceBill116 K
(11K L
recordId11L T
)11T U
;11U V
return22 
response22 
;22 
}33 	
[66 	
	Authorize66	 
]66 
[77 	
HttpGet77	 
]77 
[88 	
Route88	 
(88 
$str88 3
)883 4
]884 5
public99 
async99 
Task99 
<99 
List99 
<99 +
CarLeaseMaintenancePendingBills99 >
>99> ?
>99? @.
"GetCarLeaseMaintenancePendingBills99A c
(99c d
int99d g
empSLNo99h o
)99o p
{:: 	
List;; 
<;; +
CarLeaseMaintenancePendingBills;; 0
>;;0 1+
carLeaseMaintenancePendingBills;;2 Q
=;;R S
await;;T Y
carLeaseApplication;;Z m
.;;m n/
"GetCarLeaseMaintenancePendingBills	;;n ê
(
;;ê ë
empSLNo
;;ë ò
)
;;ò ô
;
;;ô ö
return<< +
carLeaseMaintenancePendingBills<< 2
;<<2 3
}== 	
[?? 	
	Authorize??	 
]?? 
[@@ 	
HttpPost@@	 
]@@ 
[AA 	
RouteAA	 
(AA 
$strAA *
)AA* +
]AA+ ,
publicBB 
asyncBB 
TaskBB 
<BB 
boolBB 
>BB %
UploadCarLeaseMaintenanceBB  9
(BB9 :
)BB: ;
{CC	 

boolDD +
carLeaseMaintenancePendingBillsDD 0
=DD1 2
falseDD3 8
;DD8 9%
CarLeaseMaintenanceDetailEE %
carLeaseBillsEE& 3
=EE4 5
JsonConvertEE6 A
.EEA B
DeserializeObjectEEB S
<EES T%
CarLeaseMaintenanceDetailEET m
>EEm n
(EEn o
RequestEEo v
.EEv w
FormEEw {
[EE{ |
$str	EE| ã
]
EEã å
.
EEå ç
ToString
EEç ï
(
EEï ñ
)
EEñ ó
)
EEó ò
;
EEò ô
ifFF 
(FF 
carLeaseBillsFF 
.FF 
FileFF "
!=FF" $
nullFF$ (
)FF( )
{GG +
carLeaseMaintenancePendingBillsHH /
=HH0 1
awaitHH2 7
carLeaseApplicationHH8 K
.HHK L%
UploadCarLeaseMaintenanceHHL e
(HHe f
carLeaseBillsHHf s
)HHs t
;HHt u
}II 
returnJJ +
carLeaseMaintenancePendingBillsJJ 2
;JJ2 3
}KK 	
[NN 	
HttpGetNN	 
]NN 
[OO 	
RouteOO	 
(OO 
$strOO *
)OO* +
]OO+ ,
publicPP 
asyncPP 
TaskPP 
<PP 
ListPP 
<PP "
CarLeaseAgreementBillsPP 5
>PP5 6
>PP6 7%
GetCarLeaseAgreementBillsPP8 Q
(PPQ R
intPPR U
employeeSLNoPPV b
)PPb c
{QQ 	
ListSS 
<SS "
CarLeaseAgreementBillsSS '
>SS' ("
carLeaseAgreementBillsSS) ?
=SS@ A
awaitSSB G
carLeaseApplicationSSH [
.SS[ \%
GetCarLeaseAgreementBillsSS\ u
(SSu v
employeeSLNo	SSv Ç
)
SSÇ É
;
SSÉ Ñ
returnTT "
carLeaseAgreementBillsTT )
;TT) *
}UU 	
[WW 	
HttpPostWW	 
]WW 
[XX 	
RouteXX	 
(XX 
$strXX ,
)XX, -
]XX- .
publicYY 
asyncYY 
TaskYY 
<YY 
boolYY 
>YY '
UploadCarLeaseAgreementBillYY  ;
(YY; <
[YY< =
FromBodyYY= E
]YYE F
ListYYG K
<YYK L"
CarLeaseAgreementBillsYYL b
>YYb c'
carLeaseAgreementBillUploadYYd 
)	YY Ä
{ZZ 	
List[[ 
<[[ "
CarLeaseAgreementBills[[ '
>[[' (
uploadedData[[) 5
=[[6 7'
carLeaseAgreementBillUpload[[8 S
.[[S T
Where[[T Y
([[Y Z
x[[Z [
=>[[\ ^
x[[_ `
.[[` a
FileData[[a i
!=[[j l
null[[m q
&&[[r t
x[[u v
.[[v w
BillNo[[w }
!=	[[~ Ä
$num
[[Å Ç
)
[[Ç É
.
[[É Ñ
ToList
[[Ñ ä
(
[[ä ã
)
[[ã å
;
[[å ç
bool\\ 
resp\\ 
=\\ 
await\\ 
carLeaseApplication\\ 1
.\\1 2'
UploadCarLeaseAgreementBill\\2 M
(\\M N
uploadedData\\N Z
)\\Z [
;\\[ \
return]] 
resp]] 
;]] 
}^^ 	
}aa 
}bb º
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Districts\DistrictsController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
	Districts* 3
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
DistrictsController $
:% &
BaseController' 5
{ 
private 
readonly !
IDistrictsApplication . 
districtsApplication/ C
;C D
private 
readonly 
IHubContext $
<$ %

SignalrHub% /
>/ 0

hubContext1 ;
;; <
public 
DistrictsController "
(" #!
IDistrictsApplication# 8 
districtsApplication9 M
,M N
IHubContextO Z
<Z [

SignalrHub[ e
>e f
hubg j
)j k
{ 	
this 
.  
districtsApplication %
=& ' 
districtsApplication( <
;< =
this 
. 

hubContext 
= 
hub !
;! "
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[   	
Route  	 
(   
$str   
)   
]   
public!! 
async!! 
Task!! 
<!! 
List!! 
<!! 
DistrictDetails!! .
>!!. /
>!!/ 0
GetDistricts!!1 =
(!!= >
int!!> A
	stateSlNo!!B K
)!!K L
{"" 	
List## 
<## 
DistrictDetails##  
>##  !
	districts##" +
=##, -
await##. 3 
districtsApplication##4 H
.##H I
GetDistrictDetails##I [
(##[ \
	stateSlNo##\ e
)##e f
;##f g
return%% 
	districts%% 
;%% 
}&& 	
[(( 	
HttpGet((	 
](( 
[)) 	
Route))	 
()) 
$str)) $
)))$ %
]))% &
public** 
async** 
Task** 
<** 
List** 
<** 
DistrictDetails** .
>**. /
>**/ 0
GetSignalRDistricts**1 D
(**D E
)**E F
{++ 	
List,, 
<,, 
DistrictDetails,,  
>,,  !
	districts,," +
=,,, -
await,,. 3 
districtsApplication,,4 H
.,,H I
GetDistrictDetails,,I [
(,,[ \
$num,,\ ^
),,^ _
;,,_ `
await-- 

hubContext-- 
.-- 
Clients-- $
.--$ %
All--% (
.--( )
	SendAsync--) 2
(--2 3
$str--3 K
,--K L
	districts--M V
)--V W
;--W X
await.. 

hubContext.. 
... 
Clients.. $
...$ %
All..% (
...( )
	SendAsync..) 2
(..2 3
$str..3 E
,..E F
$str..G c
)..c d
;..d e
return// 
	districts// 
;// 
}00 	
}11 
}22 ©†
áF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\DocumentManagement\DocumentManagementController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
	Districts* 3
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class (
DocumentManagementController -
:. /
BaseController0 >
{   
readonly!! 
	IAmazonS3!! 
	_s3Client!! $
;!!$ %
public"" (
DocumentManagementController"" +
(""+ ,
)"", -
{## 	
	_s3Client%% 
=%% 
new%% 
AmazonS3Client%% *
(%%* +
S3BucketSettings%%+ ;
.%%; <
Current%%< C
.%%C D
	AccessKey%%D M
,%%M N
S3BucketSettings%%O _
.%%_ `
Current%%` g
.%%g h
	SecretKey%%h q
,%%q r
RegionEndpoint	%%s Å
.
%%Å Ç
APSouth1
%%Ç ä
)
%%ä ã
;
%%ã å
}&& 	
[(( 	
	Authorize((	 
](( 
[)) 	
HttpGet))	 
])) 
[** 	
Route**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
List++ 
<++ 
FileItem++ '
>++' (
>++( )
GetAllFilesAsync++* :
(++: ;
string++; A

folderName++B L
)++L M
{,, 	
List-- 
<-- 
FileItem-- 
>-- 
	fileItems-- $
=--% &
null--' +
;--+ ,
string.. 
modifiedPrefix.. !
=.." #
string..$ *
...* +
Format..+ 1
(..1 2
$str..2 E
,..E F

folderName..G Q
)..Q R
;..R S
var// 
request// 
=// 
new//  
ListObjectsV2Request// 2
(//2 3
)//3 4
{00 

BucketName11 
=11 
S3BucketSettings11 -
.11- .
Current11. 5
.115 6

BucketName116 @
,11@ A
Prefix22 
=22 
modifiedPrefix22 '
,22' (
}33 
;33 !
ListObjectsV2Response44 !
result44" (
=44) *
await44+ 0
	_s3Client441 :
.44: ;
ListObjectsV2Async44; M
(44M N
request44N U
)44U V
;44V W
if55 
(55 
result55 
!=55 
null55 
)55 
{66 
List77 
<77 
S3Object77 
>77 
	s3Objects77 (
=77) *
result77+ 1
.771 2
	S3Objects772 ;
;77; <
var88 
rootFileItem88  
=88! "
GetDirectoryTree88# 3
(883 4
	s3Objects884 =
,88= >

folderName88? I
)88I J
;88J K
if99 
(99 
rootFileItem99  
.99  !
items99! &
.99& '
Count99' ,
>99- .
$num99/ 0
)990 1
{:: 
	fileItems;; 
=;; 
rootFileItem;;  ,
.;;, -
items;;- 2
[;;2 3
$num;;3 4
];;4 5
.;;5 6
items;;6 ;
;;;; <
}<< 
}== 
return>> 
	fileItems>> 
;>> 
}GG 	
privateII 
FileItemII 
GetDirectoryTreeII )
(II) *
ListII* .
<II. /
S3ObjectII/ 7
>II7 8
pathsII9 >
,II> ?
stringII@ F
nameIIG K
=IIL M
nullIIN R
)IIR S
{JJ 	
varKK 
nodeKK 
=KK 
newKK 
FileItemKK #
{LL 
nameMM 
=MM 
nameMM 
??MM 
$strMM %
,MM% &
itemsNN 
=NN 
newNN 
ListNN  
<NN  !
FileItemNN! )
>NN) *
(NN* +
)NN+ ,
}OO 
;OO 
stringPP 
modifiedPrefixPP !
=PP" #
stringPP$ *
.PP* +
FormatPP+ 1
(PP1 2
$strPP2 8
,PP8 9
namePP: >
)PP> ?
;PP? @
foreachQQ 
(QQ 
varQQ 
pathQQ 
inQQ  
pathsQQ! &
)QQ& '
{RR 
varSS 
directoriesSS 
=SS  !
pathSS" &
.SS& '
KeySS' *
.SS* +
SplitSS+ 0
(SS0 1
$strSS1 4
)SS4 5
.SS5 6
ToListSS6 <
(SS< =
)SS= >
;SS> ?
ifTT 
(TT 
StringTT 
.TT 
IsNullOrWhiteSpaceTT -
(TT- .
directoriesTT. 9
.TT9 :
LastTT: >
(TT> ?
)TT? @
)TT@ A
)TTA B
{TTC D
directoriesTTE P
.TTP Q
RemoveTTQ W
(TTW X
$strTTX Z
)TTZ [
;TT[ \
}TT] ^
varUU 
currentUU 
=UU 
nodeUU "
;UU" #
forWW 
(WW 
intWW 
iWW 
=WW 
$numWW 
;WW 
iWW  !
<WW" #
directoriesWW$ /
.WW/ 0
CountWW0 5
;WW5 6
iWW7 8
++WW8 :
)WW: ;
{XX 
varYY 
directoryNameYY %
=YY& '
directoriesYY( 3
[YY3 4
iYY4 5
]YY5 6
;YY6 7
varZZ 
childZZ 
=ZZ 
currentZZ  '
.ZZ' (
itemsZZ( -
.ZZ- .
FirstOrDefaultZZ. <
(ZZ< =
cZZ= >
=>ZZ? A
cZZB C
.ZZC D
nameZZD H
==ZZI K
directoryNameZZL Y
)ZZY Z
;ZZZ [
if\\ 
(\\ 
child\\ 
==\\  
null\\! %
)\\% &
{]] 
child^^ 
=^^ 
new^^  #
FileItem^^$ ,
{__ 
name``  
=``! "
directoryName``# 0
,``0 1
itemsaa !
=aa" #
newaa$ '
Listaa( ,
<aa, -
FileItemaa- 5
>aa5 6
(aa6 7
)aa7 8
,aa8 9
OriginalFileNamebb ,
=bb- .
pathbb/ 3
.bb3 4
Keybb4 7
.bb7 8
ToStringbb8 @
(bb@ A
)bbA B
,bbB C
filedatecc $
=cc% &
pathcc' +
.cc+ ,
LastModifiedcc, 8
,cc8 9
sizedd  
=dd! "
pathdd# '
.dd' (
Sizedd( ,
,dd, -
isDirectoryee '
=ee( )
!ee* +
directoryNameee+ 8
.ee8 9
Containsee9 A
(eeA B
$streeB E
)eeE F
,eeF G
ParentDirectoryff +
=ff, -
pathff. 2
.ff2 3
Keyff3 6
==ff7 9
modifiedPrefixff: H
?ffI J
nullffK O
:ffP Q
modifiedPrefixffR `
,ff` a
IsParentDirectorygg -
=gg. /
pathgg0 4
.gg4 5
Keygg5 8
==gg9 ;
modifiedPrefixgg< J
,ggJ K
}hh 
;hh 
currentii 
.ii  
itemsii  %
.ii% &
Addii& )
(ii) *
childii* /
)ii/ 0
;ii0 1
}jj 
currentll 
=ll 
childll #
;ll# $
}mm 
}nn 
returnpp 
nodepp 
;pp 
}qq 	
[ss 	
HttpGetss	 
]ss 
[tt 	
	Authorizett	 
]tt 
[uu 	
Routeuu	 
(uu 
$struu 
)uu 
]uu  
publicvv 
asyncvv 
Taskvv 
<vv 
dynamicvv !
>vv! "
DownloadFilesvv# 0
(vv0 1
stringvv1 7
fileKeyvv8 ?
)vv? @
{ww 	
MemoryStreamxx 
msxx 
=xx 
nullxx "
;xx" #
stringyy 
fileDownloadNameyy #
=yy$ %
stringyy& ,
.yy, -
Emptyyy- 2
;yy2 3
fileKeyzz 
=zz 
stringzz 
.zz 
Formatzz #
(zz# $
$strzz$ -
,zz- .
$strzz/ >
,zz> ?
fileKeyzz@ G
)zzG H
;zzH I
GetObjectRequest|| 
getObjectRequest|| -
=||. /
new||0 3
GetObjectRequest||4 D
{}} 

BucketName~~ 
=~~ 
S3BucketSettings~~ -
.~~- .
Current~~. 5
.~~5 6

BucketName~~6 @
,~~@ A
Key 
= 
fileKey 
}
ÄÄ 
;
ÄÄ 
using
ÇÇ 
(
ÇÇ 
var
ÇÇ 
response
ÇÇ 
=
ÇÇ  !
await
ÇÇ" '
	_s3Client
ÇÇ( 1
.
ÇÇ1 2
GetObjectAsync
ÇÇ2 @
(
ÇÇ@ A
getObjectRequest
ÇÇA Q
)
ÇÇQ R
)
ÇÇR S
{
ÉÉ 
if
ÑÑ 
(
ÑÑ 
response
ÑÑ 
.
ÑÑ 
HttpStatusCode
ÑÑ +
==
ÑÑ, .
HttpStatusCode
ÑÑ/ =
.
ÑÑ= >
OK
ÑÑ> @
)
ÑÑ@ A
{
ÖÖ 
using
ÜÜ 
(
ÜÜ 
ms
ÜÜ 
=
ÜÜ 
new
ÜÜ  #
MemoryStream
ÜÜ$ 0
(
ÜÜ0 1
)
ÜÜ1 2
)
ÜÜ2 3
{
áá 
await
àà 
response
àà &
.
àà& '
ResponseStream
àà' 5
.
àà5 6
CopyToAsync
àà6 A
(
ààA B
ms
ààB D
)
ààD E
;
ààE F
}
ââ 
}
ää 
}
ãã 
if
çç 
(
çç 
ms
çç 
is
çç 
null
çç 
||
çç 
ms
çç  
.
çç  !
ToArray
çç! (
(
çç( )
)
çç) *
.
çç* +
Length
çç+ 1
<
çç2 3
$num
çç4 5
)
çç5 6
throw
éé 
new
éé #
FileNotFoundException
éé /
(
éé/ 0
string
éé0 6
.
éé6 7
Format
éé7 =
(
éé= >
$str
éé> _
,
éé_ `
fileKey
ééa h
)
ééh i
)
ééi j
;
ééj k
string
êê 
[
êê 
]
êê 
	fileNames
êê 
=
êê  
fileKey
êê! (
.
êê( )
Split
êê) .
(
êê. /
$str
êê/ 2
)
êê2 3
;
êê3 4
if
ëë 
(
ëë 
	fileNames
ëë 
.
ëë 
Length
ëë 
>
ëë  !
$num
ëë" #
)
ëë# $
{
íí 
var
ìì 
x
ìì 
=
ìì 
	fileNames
ìì !
.
ìì! "
Reverse
ìì" )
<
ìì) *
string
ìì* 0
>
ìì0 1
(
ìì1 2
)
ìì2 3
;
ìì3 4
fileDownloadName
îî  
=
îî! "
x
îî# $
.
îî$ %
FirstOrDefault
îî% 3
(
îî3 4
)
îî4 5
;
îî5 6
}
ïï 
return
ññ 
File
ññ 
(
ññ 
ms
ññ 
.
ññ 
ToArray
ññ "
(
ññ" #
)
ññ# $
,
ññ$ %
	Constants
ññ& /
.
ññ/ 0
PDFMIMETYPE
ññ0 ;
,
ññ; <
fileDownloadName
ññ= M
)
ññM N
;
ññN O
}
óó 	
[
ôô 	
HttpPost
ôô	 
]
ôô 
[
öö 	
Route
öö	 
(
öö 
$str
öö 
)
öö 
]
öö 
public
õõ 
async
õõ 
Task
õõ 
<
õõ 
bool
õõ 
>
õõ 

UploadFile
õõ  *
(
õõ* +
	IFormFile
õõ+ 4
file
õõ5 9
,
õõ9 :
string
õõ; A

folderPath
õõB L
)
õõL M
{
úú 	
try
ùù 
{
ûû 
using
üü 
(
üü 
var
üü 
newMemoryStream
üü *
=
üü+ ,
new
üü- 0
MemoryStream
üü1 =
(
üü= >
)
üü> ?
)
üü? @
{
†† 
file
°° 
.
°° 
CopyTo
°° 
(
°°  
newMemoryStream
°°  /
)
°°/ 0
;
°°0 1
var
££ 
uploadRequest
££ %
=
££& '
new
££( +*
TransferUtilityUploadRequest
££, H
{
§§ 
InputStream
•• #
=
••$ %
newMemoryStream
••& 5
,
••5 6
Key
¶¶ 
=
¶¶ 

folderPath
¶¶ (
+
¶¶) *
$char
¶¶+ .
+
¶¶/ 0
file
¶¶1 5
.
¶¶5 6
FileName
¶¶6 >
,
¶¶> ?

BucketName
ßß "
=
ßß# $
S3BucketSettings
ßß% 5
.
ßß5 6
Current
ßß6 =
.
ßß= >

BucketName
ßß> H
,
ßßH I
ContentType
®® #
=
®®$ %
file
®®& *
.
®®* +
ContentType
®®+ 6
}
©© 
;
©© 
var
´´ !
fileTransferUtility
´´ +
=
´´, -
new
´´. 1
TransferUtility
´´2 A
(
´´A B
	_s3Client
´´B K
)
´´K L
;
´´L M
await
≠≠ !
fileTransferUtility
≠≠ -
.
≠≠- .
UploadAsync
≠≠. 9
(
≠≠9 :
uploadRequest
≠≠: G
)
≠≠G H
;
≠≠H I
return
ØØ 
true
ØØ 
;
ØØ  
}
∞∞ 
}
±± 
catch
≤≤ 
(
≤≤ 
	Exception
≤≤ 
)
≤≤ 
{
≥≥ 
return
¥¥ 
false
¥¥ 
;
¥¥ 
throw
µµ 
;
µµ 
}
∂∂ 
}
∑∑ 	
private
ππ 
async
ππ 
Task
ππ 
<
ππ 
IEnumerable
ππ &
<
ππ& '
FileSystemItem
ππ' 5
>
ππ5 6
>
ππ6 7
GetItems
ππ8 @
(
ππ@ A
string
ππA G

folderName
ππH R
)
ππR S
{
∫∫ 	
var
ªª 
result
ªª 
=
ªª 
new
ªª 
List
ªª !
<
ªª! "
FileSystemItem
ªª" 0
>
ªª0 1
(
ªª1 2
)
ªª2 3
;
ªª3 4
var
ºº 
continuationtoken
ºº !
=
ºº" #
string
ºº$ *
.
ºº* +
Empty
ºº+ 0
;
ºº0 1
var
ΩΩ 
dirKey
ΩΩ 
=
ΩΩ 

folderName
ΩΩ #
;
ΩΩ# $
var
¿¿ 

objrequest
¿¿ 
=
¿¿ 
new
¿¿  "
ListObjectsV2Request
¿¿! 5
{
¡¡ 

BucketName
¬¬ 
=
¬¬ 
S3BucketSettings
¬¬ -
.
¬¬- .
Current
¬¬. 5
.
¬¬5 6

BucketName
¬¬6 @
,
¬¬@ A
	Delimiter
√√ 
=
√√ 
$str
√√ 
,
√√  
Prefix
ƒƒ 
=
ƒƒ 
dirKey
ƒƒ 
,
ƒƒ  
ContinuationToken
≈≈ !
=
≈≈" #
$str
≈≈$ ,
,
≈≈, -
}
∆∆ 
;
∆∆ #
ListObjectsV2Response
«« !
response
««" *
=
««+ ,
await
««- 2
	_s3Client
««3 <
.
««< = 
ListObjectsV2Async
««= O
(
««O P

objrequest
««P Z
)
««Z [
;
««[ \
var
»» 
x
»» 
=
»» 
response
»» 
;
»» 
do
…… 
{
   
continuationtoken
ÀÀ !
=
ÀÀ" #
response
ÀÀ$ ,
.
ÀÀ, -
ContinuationToken
ÀÀ- >
;
ÀÀ> ?
foreach
ÃÃ 
(
ÃÃ 
var
ÃÃ 
obj
ÃÃ  
in
ÃÃ! #
response
ÃÃ$ ,
.
ÃÃ, -
	S3Objects
ÃÃ- 6
)
ÃÃ6 7
{
ÕÕ 
var
ŒŒ 
filename
ŒŒ  
=
ŒŒ! "
Path
ŒŒ# '
.
ŒŒ' (
GetFileName
ŒŒ( 3
(
ŒŒ3 4
obj
ŒŒ4 7
.
ŒŒ7 8
Key
ŒŒ8 ;
)
ŒŒ; <
;
ŒŒ< =
var
–– 
item
–– 
=
–– 
new
–– "
FileSystemItem
––# 1
{
—— 
Name
““ 
=
““ 
filename
““ '
,
““' (
DateModified
”” $
=
””% &
obj
””' *
.
””* +
LastModified
””+ 7
,
””7 8
Size
‘‘ 
=
‘‘ 
obj
‘‘ "
.
‘‘" #
Size
‘‘# '
,
‘‘' (
Key
’’ 
=
’’ 
obj
’’ !
.
’’! "
Key
’’" %
,
’’% &
IsDirectory
÷÷ #
=
÷÷$ %
false
÷÷& +
}
◊◊ 
;
◊◊ 
result
ÿÿ 
.
ÿÿ 
Add
ÿÿ 
(
ÿÿ 
item
ÿÿ #
)
ÿÿ# $
;
ÿÿ$ %
}
ŸŸ 
foreach
⁄⁄ 
(
⁄⁄ 
var
⁄⁄ 
p
⁄⁄ 
in
⁄⁄ !
response
⁄⁄" *
.
⁄⁄* +
CommonPrefixes
⁄⁄+ 9
)
⁄⁄9 :
{
€€ 
var
‹‹ 

rootfolder
‹‹ "
=
‹‹# $
p
‹‹% &
.
‹‹& '
Count
‹‹' ,
(
‹‹, -
f
‹‹- .
=>
‹‹/ 1
f
‹‹2 3
==
‹‹4 6
$char
‹‹7 :
)
‹‹: ;
;
‹‹; <
if
›› 
(
›› 

rootfolder
›› "
>
››" #
$num
››# $
)
››$ %
{
ﬁﬁ 
var
ﬂﬂ 
	subfolder
ﬂﬂ %
=
ﬂﬂ& '
p
ﬂﬂ( )
.
ﬂﬂ) *
Replace
ﬂﬂ* 1
(
ﬂﬂ1 2
dirKey
ﬂﬂ2 8
,
ﬂﬂ8 9
$str
ﬂﬂ: <
)
ﬂﬂ< =
;
ﬂﬂ= >
var
‡‡ 
folder
‡‡ "
=
‡‡# $
	subfolder
‡‡% .
.
‡‡. /
Split
‡‡/ 4
(
‡‡4 5
$char
‡‡5 8
)
‡‡8 9
.
‡‡9 :
First
‡‡: ?
(
‡‡? @
)
‡‡@ A
;
‡‡A B
var
·· 
item
··  
=
··! "
new
··# &
FileSystemItem
··' 5
{
‚‚ 
IsDirectory
„„ '
=
„„( )
true
„„* .
,
„„. /
HasSubDirectories
‰‰ -
=
‰‰. /
true
‰‰0 4
,
‰‰4 5
Name
ÂÂ  
=
ÂÂ! "
folder
ÂÂ# )
,
ÂÂ) *
}
ÊÊ 
;
ÊÊ 
result
ÁÁ 
.
ÁÁ 
Add
ÁÁ "
(
ÁÁ" #
item
ÁÁ# '
)
ÁÁ' (
;
ÁÁ( )
}
ËË 
else
ÈÈ 
{
ÍÍ 
var
ÎÎ 
folder
ÎÎ "
=
ÎÎ# $
p
ÎÎ% &
.
ÎÎ& '
Split
ÎÎ' ,
(
ÎÎ, -
$char
ÎÎ- 0
)
ÎÎ0 1
.
ÎÎ1 2
First
ÎÎ2 7
(
ÎÎ7 8
)
ÎÎ8 9
;
ÎÎ9 :
var
ÏÏ 
item
ÏÏ  
=
ÏÏ! "
new
ÏÏ# &
FileSystemItem
ÏÏ' 5
{
ÌÌ 
IsDirectory
ÓÓ '
=
ÓÓ( )
true
ÓÓ* .
,
ÓÓ. /
HasSubDirectories
ÔÔ -
=
ÔÔ. /
true
ÔÔ0 4
,
ÔÔ4 5
Name
  
=
! "
folder
# )
,
) *
}
ÒÒ 
;
ÒÒ 
result
ÚÚ 
.
ÚÚ 
Add
ÚÚ "
(
ÚÚ" #
item
ÚÚ# '
)
ÚÚ' (
;
ÚÚ( )
}
ÛÛ 
}
ÙÙ 
}
ıı 
while
ıı 
(
ıı 
continuationtoken
ıı &
!=
ıı' )
null
ıı* .
)
ıı. /
;
ıı/ 0
return
ˆˆ 
result
ˆˆ 
.
ˆˆ 
OrderByDescending
ˆˆ +
(
ˆˆ+ ,
item
ˆˆ, 0
=>
ˆˆ1 3
item
ˆˆ4 8
.
ˆˆ8 9
IsDirectory
ˆˆ9 D
)
ˆˆD E
.
˜˜ 
ThenBy
˜˜ 
(
˜˜ 
item
˜˜ 
=>
˜˜ 
item
˜˜  $
.
˜˜$ %
Name
˜˜% )
)
˜˜) *
.
¯¯ 
ToList
¯¯ 
(
¯¯ 
)
¯¯ 
;
¯¯ 
}
˘˘ 	
}
˙˙ 
}˝˝ ˘!
ãF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\EmployeeVerification\EmployeeVerificationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) * 
EmployeeVerification* >
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class *
EmployeeVerificationController /
:0 1
BaseController2 @
{ 
private 
readonly ,
 IEmployeeVerificationApplication 9+
employeeVerificationApplication: Y
;Y Z
public *
EmployeeVerificationController -
(- .,
 IEmployeeVerificationApplication. N+
employeeVerificationApplicationO n
)n o
{ 	
this 
. +
employeeVerificationApplication 0
=1 2+
employeeVerificationApplication3 R
;R S
} 	
[ 	
HttpGet	 
] 
[   	
Route  	 
(   
$str   )
)  ) *
]  * +
public!! 
async!! 
Task!! 
<!! 
bool!! 
>!! 
GetVerifiedResult!!  1
(!!1 2
string!!2 8
idempotencyId!!9 F
,!!F G
int!!H K
employeeSlno!!L X
)!!X Y
{"" 	
bool## 

isVerified## 
=## 
false## #
;### $
if$$ 
($$ 
idempotencyId$$ 
!=$$  
null$$! %
)$$% &
{%% 

isVerified&& 
=&& 
await&& "
this&&# '
.&&' (+
employeeVerificationApplication&&( G
.&&G H$
SaveEmployeeVerifiedData&&H `
(&&` a
idempotencyId&&a n
,&&n o
employeeSlno&&p |
)&&| }
;&&} ~
}'' 
return(( 

isVerified(( 
;(( 
})) 	
[++ 	
HttpGet++	 
]++ 
[,, 	
Route,,	 
(,, 
$str,, "
),," #
],,# $
public-- 
async-- 
Task-- 
<-- 
Root-- 
>--  
GetVerficationResult--  4
(--4 5
string--5 ;
idempotencyId--< I
,--I J
int--K N
employeeSlno--O [
)--[ \
{.. 	
Root// 
verificationResult// #
=//$ %
null//& *
;//* +
if00 
(00 
idempotencyId00 
!=00  
null00! %
)00% &
{11 
verificationResult22 "
=22# $
await22% *
this22+ /
.22/ 0+
employeeVerificationApplication220 O
.22O P 
GetVerficationResult22P d
(22d e
idempotencyId22e r
,22r s
employeeSlno	22t Ä
)
22Ä Å
;
22Å Ç
}33 
return44 
verificationResult44 %
;44% &
}55 	
[77 	
HttpPut77	 
]77 
[88 	
Route88	 
(88 
$str88 1
)881 2
]882 3
public99 
async99 
Task99 
<99 
bool99 
>99 ,
 UpdateEmployeeVerificationStatus99  @
(99@ A
[99A B
FromBody99B J
]99J K)
EmployeeVerificationStatusReq99L i
req99j m
)99m n
{:: 	
bool;; 

isVerified;; 
=;; 
false;; #
;;;# $
if<< 
(<< 
req<< 
.<< 
EmployeeSlno<<  
!=<<! #
null<<$ (
)<<( )
{== 

isVerified>> 
=>> 
await>> "
this>># '
.>>' (+
employeeVerificationApplication>>( G
.>>G H,
 UpdateEmployeeVerificationStatus>>H h
(>>h i
req>>i l
)>>l m
;>>m n
}?? 
return@@ 

isVerified@@ 
;@@ 
}AA 	
}CC 
}DD î≥
äF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\EmplpoyeeInformation\EmployeeInformationController.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
. 
Controllers (
.( )
Administration) 7
{ 
[ 
Route 

(
 
$str 
) 
]  
public 

class )
EmployeeInformationController .
:/ 0
BaseController1 ?
{ 
private 
readonly +
IEmployeeInformationApplication 8*
employeeInformationApplication9 W
;W X
public )
EmployeeInformationController ,
(, -+
IEmployeeInformationApplication- L*
employeeInformationApplicationM k
)k l
: 
base 
( 
) 
{ 	
this 
. *
employeeInformationApplication /
=0 1*
employeeInformationApplication2 P
;P Q
} 	
[ 	
	Authorize	 
] 
[   	
HttpGet  	 
]   
[!! 	
Route!!	 
(!! 
$str!! '
)!!' (
]!!( )
public"" 
async"" 
Task"" 
<"" 
EmployeeProfile"" )
>"") *"
GetEmployeeInformation""+ A
(""A B
int""B E
employeeSlno""F R
)""R S
{## 	
EmployeeProfile$$ 
employeeProfile$$ +
=$$, -
new$$. 1
EmployeeProfile$$2 A
($$A B
)$$B C
;$$C D
return%% 
employeeProfile%% "
;%%" #
}&& 	
[(( 	
	Authorize((	 
](( 
[)) 	
HttpGet))	 
])) 
[** 	
Route**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
EmployeeProfile++ )
>++) *
GetMyProfile+++ 7
(++7 8
int++8 ;
employeeSlno++< H
)++H I
{,, 	
EmployeeProfile-- 
employeeProfile-- +
=--, -
null--. 2
;--2 3
employeeProfile.. 
=.. 
await.. #*
employeeInformationApplication..$ B
...B C"
GetEmployeeInformation..C Y
(..Y Z
employeeSlno..Z f
)..f g
;..g h
return// 
employeeProfile// "
;//" #
}00 	
[33 	
	Authorize33	 
]33 
[44 	
HttpGet44	 
]44 
[55 	
Route55	 
(55 
$str55 *
)55* +
]55+ ,
public66 
async66 
Task66 
<66 
EmployeeProfile66 )
>66) *%
GetEmployeeMinimumProfile66+ D
(66D E
int66E H
employeeSlno66I U
)66U V
{77 	
EmployeeProfile88 
employeeProfile88 +
=88, -
null88. 2
;882 3
employeeProfile99 
=99 
await99 #*
employeeInformationApplication99$ B
.99B C%
GetEmployeeMinimumProfile99C \
(99\ ]
employeeSlno99] i
)99i j
;99j k
return:: 
employeeProfile:: "
;::" #
};; 	
[== 	
	Authorize==	 
]== 
[>> 	
HttpGet>>	 
]>> 
[?? 	
Route??	 
(?? 
$str?? #
)??# $
]??$ %
public@@ 
async@@ 
Task@@ 
<@@ 
EmployeeProfile@@ )
>@@) *
GetEmployeeProfile@@+ =
(@@= >
string@@> D

employeeId@@E O
)@@O P
{AA 	
EmployeeProfileBB 
employeeProfileBB +
=BB, -
nullBB. 2
;BB2 3
employeeProfileCC 
=CC 
awaitCC #*
employeeInformationApplicationCC$ B
.CCB C
GetEmployeeProfileCCC U
(CCU V

employeeIdCCV `
)CC` a
;CCa b
returnDD 
employeeProfileDD "
;DD" #
}EE 	
[GG 	
	AuthorizeGG	 
]GG 
[HH 	
HttpGetHH	 
]HH 
[II 	
RouteII	 
(II 
$strII %
)II% &
]II& '
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
ListJJ 
<JJ 
	BioMetricJJ (
>JJ( )
>JJ) * 
GetEmployeeTimeSheetJJ+ ?
(JJ? @
longJJ@ D

employeeIdJJE O
)JJO P
{KK 	
ListLL 
<LL 
	BioMetricLL 
>LL 

attendanceLL &
=LL' (
awaitLL) .*
employeeInformationApplicationLL/ M
.LLM N 
GetEmployeeTimeSheetLLN b
(LLb c

employeeIdLLc m
)LLm n
;LLn o
returnMM 

attendanceMM 
;MM 
}NN 	
[QQ 	
HttpGetQQ	 
]QQ 
[RR 	
RouteRR	 
(RR 
$strRR $
)RR$ %
]RR% &
publicSS 
asyncSS 
TaskSS 
<SS 
ListSS 
<SS 
HolidayInformationSS 1
>SS1 2
>SS2 3
GetEmployeeHolidaysSS4 G
(SSG H
longSSH L

employeeIdSSM W
)SSW X
{TT 	
ListUU 
<UU 
HolidayInformationUU #
>UU# $
holidaysUU% -
=UU. /
awaitUU0 5*
employeeInformationApplicationUU6 T
.UUT U
GetEmployeeHolidaysUUU h
(UUh i

employeeIdUUi s
)UUs t
;UUt u
returnVV 
holidaysVV 
;VV 
}WW 	
[YY 	
	AuthorizeYY	 
]YY 
[ZZ 	
HttpPostZZ	 
]ZZ 
[[[ 	
Route[[	 
([[ 
$str[[ +
)[[+ ,
][[, -
public\\ 
async\\ 
Task\\ 
<\\ 
PagedResultSet\\ (
<\\( )
EmployeeProfile\\) 8
>\\8 9
>\\9 :&
SearchEmployeeInformations\\; U
(\\U V
[\\V W
FromBody\\W _
]\\_ `.
!EmployeeInformationSearchCriteria	\\a Ç
searchCriteria
\\É ë
)
\\ë í
{]] 	
PagedResultSet^^ 
<^^ 
EmployeeProfile^^ *
>^^* +
userList^^, 4
=^^5 6
null^^7 ;
;^^; <
userList__ 
=__ 
await__ *
employeeInformationApplication__ ;
.__; <&
SearchEmployeeInformations__< V
(__V W
searchCriteria__W e
)__e f
;__f g
return`` 
userList`` 
;`` 
}aa 	
[cc 	
	Authorizecc	 
]cc 
[dd 	
HttpPostdd	 
]dd 
[ee 	
Routeee	 
(ee 
$stree !
)ee! "
]ee" #
publicff 
asyncff 
Taskff 
<ff 
PagedResultSetff (
<ff( )
EmployeeProfileff) 8
>ff8 9
>ff9 :
GetMyTeamMembersff; K
(ffK L
[ffL M
FromBodyffM U
]ffU V-
!EmployeeInformationSearchCriteriaffW x
searchCriteria	ffy á
)
ffá à
{gg 	
PagedResultSethh 
<hh 
EmployeeProfilehh *
>hh* +
userListhh, 4
=hh5 6
nullhh7 ;
;hh; <
userListii 
=ii 
awaitii *
employeeInformationApplicationii ;
.ii; <
GetMyTeamMembersii< L
(iiL M
searchCriteriaiiM [
)ii[ \
;ii\ ]
returnjj 
userListjj 
;jj 
}kk 	
[ll 	
	Authorizell	 
]ll 
[mm 	
HttpPostmm	 
]mm 
[nn 	
Routenn	 
(nn 
$strnn 1
)nn1 2
]nn2 3
publicoo 
asyncoo 
Taskoo 
<oo 
booloo 
>oo ,
 GetUpdateEmployeeEmailAddressOtpoo  @
(oo@ A
[ooA B
FromBodyooB J
]ooJ K 
UpdadteEmployeeEmailooL ` 
updadteEmployeeEmailooa u
)oou v
{pp 	
boolqq 
	isUpdatedqq 
=qq 
awaitqq "*
employeeInformationApplicationqq# A
.qqA B,
 GetUpdateEmployeeEmailAddressOtpqqB b
(qqb c 
updadteEmployeeEmailqqc w
)qqw x
;qqx y
returnrr 
	isUpdatedrr 
;rr 
}ss 	
[tt 	
	Authorizett	 
]tt 
[uu 	
HttpPostuu	 
]uu 
[vv 	
Routevv	 
(vv 
$strvv 4
)vv4 5
]vv5 6
publicww 
asyncww 
Taskww 
<ww 
boolww 
>ww /
#VerifyUpdateEmployeeEmailAddressOtpww  C
(wwC D
[wwD E
FromBodywwE M
]wwM N 
UpdadteEmployeeEmailwwO c 
updadteEmployeeEmailwwd x
)wwx y
{xx 	
boolyy 
	isUpdatedyy 
=yy 
awaityy "*
employeeInformationApplicationyy# A
.yyA B/
#VerifyUpdateEmployeeEmailAddressOtpyyB e
(yye f 
updadteEmployeeEmailyyf z
)yyz {
;yy{ |
returnzz 
	isUpdatedzz 
;zz 
}{{ 	
[|| 	
	Authorize||	 
]|| 
[}} 	
HttpPost}}	 
]}} 
[~~ 	
Route~~	 
(~~ 
$str~~ ,
)~~, -
]~~- .
public 
async 
Task 
< 
bool 
> '
UpdateEmployeeFamilyDetails  ;
(; <
[< =
FromBody= E
]E F
FamilyDetailG S
familyDetailsT a
)a b
{
ÄÄ 	
bool
ÅÅ 
	isUpdated
ÅÅ 
=
ÅÅ 
await
ÅÅ ",
employeeInformationApplication
ÅÅ# A
.
ÅÅA B)
UpdateEmployeeFamilyDetails
ÅÅB ]
(
ÅÅ] ^
familyDetails
ÅÅ^ k
)
ÅÅk l
;
ÅÅl m
return
ÇÇ 
	isUpdated
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
[
ÖÖ 	
	Authorize
ÖÖ	 
]
ÖÖ 
[
ÜÜ 	
HttpPost
ÜÜ	 
]
ÜÜ 
[
áá 	
Route
áá	 
(
áá 
$str
áá /
)
áá/ 0
]
áá0 1
public
àà 
async
àà 
Task
àà 
<
àà 
bool
àà 
>
àà ,
UpdateEmployeeEducationDetails
àà  >
(
àà> ?
[
àà? @
FromBody
àà@ H
]
ààH I
EducationDetail
ààJ Y
educationDetail
ààZ i
)
àài j
{
ââ 	
bool
ää 
	isUpdated
ää 
=
ää 
await
ää ",
employeeInformationApplication
ää# A
.
ääA B,
UpdateEmployeeEducationDetails
ääB `
(
ää` a
educationDetail
ääa p
)
ääp q
;
ääq r
return
ãã 
	isUpdated
ãã 
;
ãã 
}
åå 	
[
éé 	
	Authorize
éé	 
]
éé 
[
èè 	
HttpPost
èè	 
]
èè 
[
êê 	
Route
êê	 
(
êê 
$str
êê 0
)
êê0 1
]
êê1 2
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
bool
ëë 
>
ëë -
UpdateEmployeeExperienceDetails
ëë  ?
(
ëë? @
[
ëë@ A
FromBody
ëëA I
]
ëëI J
ExperienceDetail
ëëK [
experienceDetail
ëë\ l
)
ëël m
{
íí 	
bool
ìì 
	isUpdated
ìì 
=
ìì 
await
ìì ",
employeeInformationApplication
ìì# A
.
ììA B-
UpdateEmployeeExperienceDetails
ììB a
(
ììa b
experienceDetail
ììb r
)
ììr s
;
ììs t
return
îî 
	isUpdated
îî 
;
îî 
}
ïï 	
[
óó 	
	Authorize
óó	 
]
óó 
[
òò 	

HttpDelete
òò	 
]
òò 
[
ôô 	
Route
ôô	 
(
ôô 
$str
ôô ,
)
ôô, -
]
ôô- .
public
öö 
async
öö 
Task
öö 
<
öö 
bool
öö 
>
öö )
DeleteEmployeeFamilyDetails
öö  ;
(
öö; <
int
öö< ?

empFamSlno
öö@ J
)
ööJ K
{
õõ 	
bool
úú 
	isUpdated
úú 
=
úú 
await
úú ",
employeeInformationApplication
úú# A
.
úúA B)
DeleteEmployeeFamilyDetails
úúB ]
(
úú] ^

empFamSlno
úú^ h
)
úúh i
;
úúi j
return
ùù 
	isUpdated
ùù 
;
ùù 
}
ûû 	
[
†† 	
	Authorize
††	 
]
†† 
[
°° 	

HttpDelete
°°	 
]
°° 
[
¢¢ 	
Route
¢¢	 
(
¢¢ 
$str
¢¢ /
)
¢¢/ 0
]
¢¢0 1
public
££ 
async
££ 
Task
££ 
<
££ 
bool
££ 
>
££ ,
DeleteEmployeeEducationDetails
££  >
(
££> ?
int
££? B

empEduSlno
££C M
)
££M N
{
§§ 	
bool
•• 
	isUpdated
•• 
=
•• 
await
•• ",
employeeInformationApplication
••# A
.
••A B,
DeleteEmployeeEducationDetails
••B `
(
••` a

empEduSlno
••a k
)
••k l
;
••l m
return
¶¶ 
	isUpdated
¶¶ 
;
¶¶ 
}
ßß 	
[
©© 	
	Authorize
©©	 
]
©© 
[
™™ 	

HttpDelete
™™	 
]
™™ 
[
´´ 	
Route
´´	 
(
´´ 
$str
´´ 0
)
´´0 1
]
´´1 2
public
¨¨ 
async
¨¨ 
Task
¨¨ 
<
¨¨ 
bool
¨¨ 
>
¨¨ -
DeleteEmployeeExperienceDetails
¨¨  ?
(
¨¨? @
int
¨¨@ C
	empExSlno
¨¨D M
)
¨¨M N
{
≠≠ 	
bool
ÆÆ 
	isUpdated
ÆÆ 
=
ÆÆ 
await
ÆÆ ",
employeeInformationApplication
ÆÆ# A
.
ÆÆA B-
DeleteEmployeeExperienceDetails
ÆÆB a
(
ÆÆa b
	empExSlno
ÆÆb k
)
ÆÆk l
;
ÆÆl m
return
ØØ 
	isUpdated
ØØ 
;
ØØ 
}
∞∞ 	
[
≤≤ 	
	Authorize
≤≤	 
]
≤≤ 
[
≥≥ 	
HttpGet
≥≥	 
]
≥≥ 
[
¥¥ 	
Route
¥¥	 
(
¥¥ 
$str
¥¥ .
)
¥¥. /
]
¥¥/ 0
public
µµ 
async
µµ 
Task
µµ 
<
µµ 
List
µµ 
<
µµ 
BloodRelation
µµ ,
>
µµ, -
>
µµ- .+
GetFamilyBloodRelationDetails
µµ/ L
(
µµL M
)
µµM N
{
∂∂ 	
List
∑∑ 
<
∑∑ 
BloodRelation
∑∑ 
>
∑∑ "
familyBloodRelations
∑∑  4
=
∑∑5 6
await
∑∑7 <,
employeeInformationApplication
∑∑= [
.
∑∑[ \+
GetFamilyBloodRelationDetails
∑∑\ y
(
∑∑y z
)
∑∑z {
;
∑∑{ |
return
∏∏ "
familyBloodRelations
∏∏ '
;
∏∏' (
}
ππ 	
[
ªª 	
	Authorize
ªª	 
]
ªª 
[
ºº 	
HttpGet
ºº	 
]
ºº 
[
ΩΩ 	
Route
ΩΩ	 
(
ΩΩ 
$str
ΩΩ $
)
ΩΩ$ %
]
ΩΩ% &
public
ææ 
async
ææ 
Task
ææ 
<
ææ 
List
ææ 
<
ææ 
	Education
ææ (
>
ææ( )
>
ææ) *!
GetEducationDetails
ææ+ >
(
ææ> ?
)
ææ? @
{
øø 	
List
¿¿ 
<
¿¿ 
	Education
¿¿ 
>
¿¿ 
educationDetails
¿¿ ,
=
¿¿- .
await
¿¿/ 4,
employeeInformationApplication
¿¿5 S
.
¿¿S T!
GetEducationDetails
¿¿T g
(
¿¿g h
)
¿¿h i
;
¿¿i j
return
¡¡ 
educationDetails
¡¡ #
;
¡¡# $
}
¬¬ 	
[
ƒƒ 	
	Authorize
ƒƒ	 
]
ƒƒ 
[
≈≈ 	
HttpGet
≈≈	 
]
≈≈ 
[
∆∆ 	
Route
∆∆	 
(
∆∆ 
$str
∆∆ *
)
∆∆* +
]
∆∆+ ,
public
«« 
async
«« 
Task
«« 
<
«« 
List
«« 
<
«« 
	Education
«« (
>
««( )
>
««) *'
GetEducationCourseDetails
««+ D
(
««D E
)
««E F
{
»» 	
List
…… 
<
…… 
	Education
…… 
>
…… 
educationDetails
…… ,
=
……- .
await
……/ 4,
employeeInformationApplication
……5 S
.
……S T'
GetEducationCourseDetails
……T m
(
……m n
)
……n o
;
……o p
return
   
educationDetails
   #
;
  # $
}
ÀÀ 	
[
ÕÕ 	
	Authorize
ÕÕ	 
]
ÕÕ 
[
ŒŒ 	
HttpGet
ŒŒ	 
]
ŒŒ 
[
œœ 	
Route
œœ	 
(
œœ 
$str
œœ +
)
œœ+ ,
]
œœ, -
public
–– 
async
–– 
Task
–– 
<
–– 
List
–– 
<
–– %
AdditionalQualification
–– 6
>
––6 7
>
––7 8(
GetAdditionalQualification
––9 S
(
––S T
)
––T U
{
—— 	
List
““ 
<
““ %
AdditionalQualification
““ (
>
““( )%
additionalQualification
““* A
=
““B C
await
““D I,
employeeInformationApplication
““J h
.
““h i)
GetAdditionalQualification““i É
(““É Ñ
)““Ñ Ö
;““Ö Ü
return
”” %
additionalQualification
”” *
;
””* +
}
‘‘ 	
[
÷÷ 	
	Authorize
÷÷	 
]
÷÷ 
[
◊◊ 	
HttpGet
◊◊	 
]
◊◊ 
[
ÿÿ 	
Route
ÿÿ	 
(
ÿÿ 
$str
ÿÿ $
)
ÿÿ$ %
]
ÿÿ% &
public
ŸŸ 
async
ŸŸ 
Task
ŸŸ 
<
ŸŸ 
List
ŸŸ 
<
ŸŸ 
Courses
ŸŸ &
>
ŸŸ& '
>
ŸŸ' (
CourseFilter
ŸŸ) 5
(
ŸŸ5 6
int
ŸŸ6 9
slno
ŸŸ: >
)
ŸŸ> ?
{
⁄⁄ 	
List
€€ 
<
€€ 
Courses
€€ 
>
€€ 
courses
€€ !
=
€€" #
await
€€$ ),
employeeInformationApplication
€€* H
.
€€H I
CourseFilter
€€I U
(
€€U V
slno
€€V Z
)
€€Z [
;
€€[ \
return
‹‹ 
courses
‹‹ 
;
‹‹ 
}
›› 	
[
‡‡ 	
	Authorize
‡‡	 
]
‡‡ 
[
·· 	
HttpGet
··	 
]
·· 
[
‚‚ 	
Route
‚‚	 
(
‚‚ 
$str
‚‚ 
)
‚‚ 
]
‚‚  
public
„„ 
async
„„ 
Task
„„ 
<
„„ 
List
„„ 
<
„„ 

BloodGroup
„„ )
>
„„) *
>
„„* +
GetBloodGroup
„„, 9
(
„„9 :
)
„„: ;
{
‰‰ 	
List
ÂÂ 
<
ÂÂ 

BloodGroup
ÂÂ 
>
ÂÂ 

bloodGroup
ÂÂ '
=
ÂÂ( )
await
ÂÂ* /,
employeeInformationApplication
ÂÂ0 N
.
ÂÂN O
GetBloodGroup
ÂÂO \
(
ÂÂ\ ]
)
ÂÂ] ^
;
ÂÂ^ _
return
ÊÊ 

bloodGroup
ÊÊ 
;
ÊÊ 
}
ÁÁ 	
[
ÍÍ 	
	Authorize
ÍÍ	 
]
ÍÍ 
[
ÎÎ 	
HttpPost
ÎÎ	 
]
ÎÎ 
[
ÏÏ 	
Route
ÏÏ	 
(
ÏÏ 
$str
ÏÏ %
)
ÏÏ% &
]
ÏÏ& '
public
ÌÌ 
async
ÌÌ 
Task
ÌÌ 
<
ÌÌ 
List
ÌÌ 
<
ÌÌ 
	BioMetric
ÌÌ (
>
ÌÌ( )
>
ÌÌ) *"
GetReporteeTimeSheet
ÌÌ+ ?
(
ÌÌ? @
[
ÌÌ@ A
FromBody
ÌÌA I
]
ÌÌI J-
ReporteeTimeSheetSearchCriteria
ÌÌK j
searchCriteria
ÌÌk y
)
ÌÌy z
{
ÓÓ 	
List
ÔÔ 
<
ÔÔ 
	BioMetric
ÔÔ 
>
ÔÔ 
projectDetails
ÔÔ *
=
ÔÔ+ ,
await
ÔÔ- 2,
employeeInformationApplication
ÔÔ3 Q
.
ÔÔQ R"
GetReporteeTimeSheet
ÔÔR f
(
ÔÔf g
searchCriteria
ÔÔg u
)
ÔÔu v
;
ÔÔv w
return
 
projectDetails
 !
;
! "
}
ÒÒ 	
[
ÛÛ 	
HttpGet
ÛÛ	 
]
ÛÛ 
[
ÙÙ 	
Route
ÙÙ	 
(
ÙÙ 
$str
ÙÙ 
)
ÙÙ  
]
ÙÙ  !
public
ıı 
async
ıı 
Task
ıı 
<
ıı 
List
ıı 
<
ıı 
EmployeeProfile
ıı .
>
ıı. /
>
ıı/ 0
SearchEmployee
ıı1 ?
(
ıı? @
string
ıı@ F
searchValue
ııG R
)
ııR S
{
ˆˆ 	
List
˜˜ 
<
˜˜ 
EmployeeProfile
˜˜  
>
˜˜  !
employeeProfiles
˜˜" 2
=
˜˜3 4
null
˜˜5 9
;
˜˜9 :
employeeProfiles
¯¯ 
=
¯¯ 
await
¯¯ $,
employeeInformationApplication
¯¯% C
.
¯¯C D
SearchEmployee
¯¯D R
(
¯¯R S
searchValue
¯¯S ^
)
¯¯^ _
;
¯¯_ `
foreach
˘˘ 
(
˘˘ 
EmployeeProfile
˘˘ $
profile
˘˘% ,
in
˘˘- /
employeeProfiles
˘˘0 @
)
˘˘@ A
{
˙˙ 
profile
˚˚ 
.
˚˚ 
GrossSalary
˚˚ #
=
˚˚$ %
profile
˚˚& -
.
˚˚- .
	EmpStatus
˚˚. 7
==
˚˚8 :
$num
˚˚; <
?
˚˚= >
$num
˚˚? @
:
˚˚A B
profile
˚˚C J
.
˚˚J K
GrossSalary
˚˚K V
;
˚˚V W
}
¸¸ 
return
˝˝ 
employeeProfiles
˝˝ #
;
˝˝# $
}
˛˛ 	
}
ˇˇ 
}ÄÄ Á
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Form16\Form16Controller.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Form16* 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
Form16Controller !
:" #
BaseApiController$ 5
{ 
private 
readonly 
IForm16Application +
form16Application, =
;= >
private 
IConfiguration 
configuration ,
{- .
get/ 2
;2 3
}4 5
public 
Form16Controller 
(  
IForm16Application  2
form16Application3 D
,D E
IConfigurationF T
configurationU b
)b c
{ 	
this 
. 
form16Application "
=# $
form16Application% 6
;6 7
this 
. 
configuration 
=  
configuration! .
;. /
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public   
async   
Task   
<   
List   
<   
TaxDocuments   +
>  + ,
>  , -
	GetForm16  . 7
(  7 8
string  8 >
panNo  ? D
)  D E
{!! 	
using"" 
var"" 
report"" 
="" 
new"" "
LocalReport""# .
("". /
)""/ 0
;""0 1
List## 
<## 
TaxDocuments## 
>## 

form16Data## )
=##* +
await##, 1
form16Application##2 C
.##C D
	GetForm16##D M
(##M N
panNo##N S
)##S T
;##T U
return$$ 

form16Data$$ 
;$$ 
}%% 	
[(( 	
	Authorize((	 
](( 
[)) 	
HttpPost))	 
])) 
[** 	
Route**	 
(** 
$str** 
)**  
]**  !
public++ 
async++ 
Task++ 
<++ 
dynamic++ !
>++! "
DownLoadForm16++# 1
(++1 2
YearWiseTaxDocument++2 E
taxDocument++F Q
)++Q R
{,, 	
byte-- 
[-- 
]-- 

form16Byte-- 
=-- 
await--  %
form16Application--& 7
.--7 8
DownLoadForm16--8 F
(--F G
taxDocument--G R
)--R S
;--S T
return.. 
File.. 
(.. 

form16Byte.. "
,.." #
	Constants..$ -
...- .
PDFMIMETYPE... 9
,..9 :
	Constants..; D
...D E
PDFEXTENSION..E Q
)..Q R
;..R S
}// 	
}00 
}11 Ä
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\HelpDocuments\HelpDocumentsController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
HelpDocuments* 7
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class #
HelpDocumentsController (
:) *
BaseApiController+ <
{ 
private 
readonly %
IHelpDocumentsApplication 2$
helpDocumentsApplication3 K
;K L
public #
HelpDocumentsController &
(& '%
IHelpDocumentsApplication' @$
helpDocumentsApplicationA Y
)Y Z
{ 	
this 
. $
helpDocumentsApplication )
=* +$
helpDocumentsApplication, D
;D E
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str "
)" #
]# $
public 
async 
Task 
< 
List 
< 
HelpDocument +
>+ ,
>, -
GetActiveHelpDocs. ?
(? @
int@ C
officeTypeSLNOD R
)R S
{ 	
List 
< 
HelpDocument 
> 
helpDocs '
=( )
await* /$
helpDocumentsApplication0 H
.H I
GetActiveHelpDocsI Z
(Z [
officeTypeSLNO[ i
)i j
;j k
return 
helpDocs 
; 
} 	
[   	
	Authorize  	 
]   
[!! 	
HttpPost!!	 
]!! 
["" 	
Route""	 
("" 
$str"" !
)""! "
]""" #
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
DownloadDocument##) 9
(##9 :
[##: ;
FromBody##; C
]##C D
HelpDocument##E Q
helpDocument##R ^
)##^ _
{$$ 	
string%% 
fileName%% 
=%% 
helpDocument%% *
?%%* +
.%%+ ,
FileName%%, 4
;%%4 5
FileInfo&& 
fileInfo&& 
=&& 
new&&  #
FileInfo&&$ ,
(&&, -
fileName&&- 5
)&&5 6
;&&6 7
string(( 
fileExtension((  
=((! "
fileInfo((# +
.((+ ,
	Extension((, 5
==((6 8
$str((9 @
?((A B
	Constants((C L
.((L M
WORDEXTENSION((M Z
:(([ \
fileInfo((] e
.((e f
	Extension((f o
;((o p
string)) 
fileMimeType)) 
=))  !
fileInfo))" *
.))* +
	Extension))+ 4
==))5 7
$str))8 ?
?))@ A
	Constants))B K
.))K L
WORDMIMETYPE))L X
:))Y Z
	Constants))[ d
.))d e
PDFMIMETYPE))e p
;))p q
byte++ 
[++ 
]++ 
documentData++ 
=++  !
await++" '$
helpDocumentsApplication++( @
.++@ A
DownloadDocument++A Q
(++Q R
helpDocument++R ^
)++^ _
;++_ `
return,, 
File,, 
(,, 
documentData,, $
,,,$ %
fileMimeType,,& 2
,,,2 3
fileExtension,,4 A
),,A B
;,,B C
}-- 	
}.. 
}// öW
ÉF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\InvestmentProofs\InvestmentProofsController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
InvestmentProofs* :
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class &
InvestmentProofsController +
:, -
BaseApiController/ @
{ 
private 
readonly (
IInvestmentProofsApplication 5'
investmentProofsApplication6 Q
;Q R
public &
InvestmentProofsController )
() *(
IInvestmentProofsApplication* F'
investmentProofsApplicationG b
)b c
{ 	
this 
. '
investmentProofsApplication ,
=- .'
investmentProofsApplication/ J
;J K
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str !
)! "
]" #
public   
async   
Task   
<   
List   
<   
Chapter6FileDetails   2
>  2 3
>  3 4
GetChapter6Files  5 E
(  E F
int  F I
chapter6DetailId  J Z
)  Z [
{!! 	
List"" 
<"" 
Chapter6FileDetails"" $
>""$ %
chapter6FileDetails""& 9
="": ;
await""< A'
investmentProofsApplication""B ]
.""] ^
GetChapter6Files""^ n
(""n o
chapter6DetailId""o 
)	"" Ä
;
""Ä Å
return## 
chapter6FileDetails## &
;##& '
}$$ 	
['' 	
	Authorize''	 
]'' 
[(( 	
HttpGet((	 
](( 
[)) 	
Route))	 
()) 
$str)) $
)))$ %
]))% &
public** 
async** 
Task** 
<** 
List** 
<** "
HouseIncomeFileDetails** 5
>**5 6
>**6 7
GetHouseIncomeFiles**8 K
(**K L
int**L O
houseIncomeDetailId**P c
)**c d
{++ 	
List,, 
<,, "
HouseIncomeFileDetails,, '
>,,' ("
houseIncomeFileDetails,,) ?
=,,@ A
await,,B G'
investmentProofsApplication,,H c
.,,c d
GetHouseIncomeFiles,,d w
(,,w x 
houseIncomeDetailId	,,x ã
)
,,ã å
;
,,å ç
return-- "
houseIncomeFileDetails-- )
;--) *
}.. 	
[11 	
	Authorize11	 
]11 
[22 	
HttpGet22	 
]22 
[33 	
Route33	 
(33 
$str33 *
)33* +
]33+ ,
public44 
async44 
Task44 
<44 
List44 
<44 "
HouseRentAllowanceFile44 5
>445 6
>446 7%
GetHouseRentAllowancFiles448 Q
(44Q R
int44R U
rentPaymentId44V c
)44c d
{55 	
List66 
<66 "
HouseRentAllowanceFile66 '
>66' (#
houseRentAllowanceFiles66) @
=66A B
await66C H'
investmentProofsApplication66I d
.66d e%
GetHouseRentAllowancFiles66e ~
(66~ 
rentPaymentId	66 å
)
66å ç
;
66ç é
return77 #
houseRentAllowanceFiles77 *
;77* +
}88 	
[:: 	
	Authorize::	 
]:: 
[;; 	
HttpGet;;	 
];; 
[<< 	
Route<<	 
(<< 
$str<< $
)<<$ %
]<<% &
public== 
async== 
Task== 
<== 
List== 
<== "
OtherIncomeFileDetails== 5
>==5 6
>==6 7
GetOtherIncomeFiles==8 K
(==K L
int==L O
otherIncomeDetailId==P c
)==c d
{>> 	
List?? 
<?? "
OtherIncomeFileDetails?? '
>??' ("
otherIncomeFileDetails??) ?
=??@ A
await??B G'
investmentProofsApplication??H c
.??c d
GetOtherIncomeFiles??d w
(??w x 
otherIncomeDetailId	??x ã
)
??ã å
;
??å ç
return@@ "
otherIncomeFileDetails@@ )
;@@) *
}AA 	
[FF 	
	AuthorizeFF	 
]FF 
[GG 	
HttpPostGG	 
]GG 
[HH 	
RouteHH	 
(HH 
$strHH -
)HH- .
]HH. /
publicII 
asyncII 
TaskII 
<II 
boolII 
>II (
UploadHouseRentAllowanceFileII  <
(II< =
[II= >
FromBodyII> F
]IIF G"
HouseRentAllowanceFileIIH ^"
houseRentAllowanceFileII_ u
)IIu v
{JJ 	
boolKK 
respKK 
=KK 
awaitKK '
investmentProofsApplicationKK 9
.KK9 :(
UploadHouseRentAllowanceFileKK: V
(KKV W"
houseRentAllowanceFileKKW m
)KKm n
;KKn o
returnLL 
respLL 
;LL 
}MM 	
[OO 	
	AuthorizeOO	 
]OO 
[PP 	
HttpPostPP	 
]PP 
[QQ 	
RouteQQ	 
(QQ 
$strQQ #
)QQ# $
]QQ$ %
publicRR 
asyncRR 
TaskRR 
<RR 
boolRR 
>RR 
UploadChapter6FileRR  2
(RR2 3
[RR3 4
FromBodyRR4 <
]RR< =
Chapter6FileDetailsRR> Q
chapter6FileDetailsRRR e
)RRe f
{SS 	
boolTT 
respTT 
=TT 
awaitTT '
investmentProofsApplicationTT 9
.TT9 :
UploadChapter6FileTT: L
(TTL M
chapter6FileDetailsTTM `
)TT` a
;TTa b
returnUU 
respUU 
;UU 
}VV 	
[XX 	
	AuthorizeXX	 
]XX 
[YY 	
HttpPostYY	 
]YY 
[ZZ 	
RouteZZ	 
(ZZ 
$strZZ &
)ZZ& '
]ZZ' (
public[[ 
async[[ 
Task[[ 
<[[ 
bool[[ 
>[[ !
UploadHouseIncomeFile[[  5
([[5 6
[[[6 7
FromBody[[7 ?
][[? @"
HouseIncomeFileDetails[[A W"
houseIncomeFileDetails[[X n
)[[n o
{\\ 	
bool]] 
resp]] 
=]] 
await]] '
investmentProofsApplication]] 9
.]]9 :!
UploadHouseIncomeFile]]: O
(]]O P"
houseIncomeFileDetails]]P f
)]]f g
;]]g h
return^^ 
resp^^ 
;^^ 
}`` 	
[bb 	
	Authorizebb	 
]bb 
[cc 	
HttpPostcc	 
]cc 
[dd 	
Routedd	 
(dd 
$strdd &
)dd& '
]dd' (
publicee 
asyncee 
Taskee 
<ee 
boolee 
>ee !
UploadOtherIncomeFileee  5
(ee5 6
[ee6 7
FromBodyee7 ?
]ee? @"
OtherIncomeFileDetailseeA W"
otherIncomeFileDetailseeX n
)een o
{ff 	
boolgg 
respgg 
=gg 
awaitgg '
investmentProofsApplicationgg 9
.gg9 :!
UploadOtherIncomeFilegg: O
(ggO P"
otherIncomeFileDetailsggP f
)ggf g
;ggg h
returnhh 
resphh 
;hh 
}ii 	
[nn 	
	Authorizenn	 
]nn 
[oo 	
HttpGetoo	 
]oo 
[pp 	
Routepp	 
(pp 
$strpp -
)pp- .
]pp. /
publicqq 
asyncqq 
Taskqq 
<qq 
boolqq 
>qq (
RemoveHouseRentAllowanceFileqq  <
(qq< =
intqq= @
	hraFileIdqqA J
)qqJ K
{rr 	
boolss 
respss 
=ss 
awaitss '
investmentProofsApplicationss 9
.ss9 :(
RemoveHouseRentAllowanceFiless: V
(ssV W
	hraFileIdssW `
)ss` a
;ssa b
returntt 
resptt 
;tt 
}uu 	
[ww 	
	Authorizeww	 
]ww 
[xx 	
HttpGetxx	 
]xx 
[yy 	
Routeyy	 
(yy 
$stryy #
)yy# $
]yy$ %
publiczz 
asynczz 
Taskzz 
<zz 
boolzz 
>zz 
RemoveChapter6Filezz  2
(zz2 3
intzz3 6
chapter6FileIdzz7 E
)zzE F
{{{ 	
bool|| 
resp|| 
=|| 
await|| '
investmentProofsApplication|| 9
.||9 :
RemoveChapter6File||: L
(||L M
chapter6FileId||M [
)||[ \
;||\ ]
return}} 
resp}} 
;}} 
}~~ 	
[
ÄÄ 	
	Authorize
ÄÄ	 
]
ÄÄ 
[
ÅÅ 	
HttpGet
ÅÅ	 
]
ÅÅ 
[
ÇÇ 	
Route
ÇÇ	 
(
ÇÇ 
$str
ÇÇ &
)
ÇÇ& '
]
ÇÇ' (
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
bool
ÉÉ 
>
ÉÉ #
RemoveHouseIncomeFile
ÉÉ  5
(
ÉÉ5 6
int
ÉÉ6 9
houseIncomeFileId
ÉÉ: K
)
ÉÉK L
{
ÑÑ 	
bool
ÖÖ 
resp
ÖÖ 
=
ÖÖ 
await
ÖÖ )
investmentProofsApplication
ÖÖ 9
.
ÖÖ9 :#
RemoveHouseIncomeFile
ÖÖ: O
(
ÖÖO P
houseIncomeFileId
ÖÖP a
)
ÖÖa b
;
ÖÖb c
return
ÜÜ 
resp
ÜÜ 
;
ÜÜ 
}
áá 	
[
ää 	
	Authorize
ää	 
]
ää 
[
ãã 	
HttpGet
ãã	 
]
ãã 
[
åå 	
Route
åå	 
(
åå 
$str
åå &
)
åå& '
]
åå' (
public
çç 
async
çç 
Task
çç 
<
çç 
bool
çç 
>
çç  #
RemoveOtherIncomeFile
çç! 6
(
çç6 7
int
çç7 :
otherIncomeFileId
çç; L
)
ççL M
{
éé 	
bool
èè 
resp
èè 
=
èè 
await
èè )
investmentProofsApplication
èè 9
.
èè9 :#
RemoveOtherIncomeFile
èè: O
(
èèO P
otherIncomeFileId
èèP a
)
èèa b
;
èèb c
return
êê 
resp
êê 
;
êê 
}
ëë 	
}
îî 
}ïï ‰*
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Investment\InvestmentController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *

Investment* 4
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
InvestmentController %
:& '
BaseController( 6
{ 
private 
readonly "
IInvestmentApplication /!
investmentApplication0 E
;E F
private 
readonly 
ILoggerManager '
logger( .
;. /
public  
InvestmentController #
(# $"
IInvestmentApplication$ :!
investmentApplication; P
,P Q
ILoggerManagerR `
loggera g
)g h
{ 	
this 
. !
investmentApplication &
=' (!
investmentApplication) >
;> ?
this 
. 
logger 
= 
logger  
;  !
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str )
)) *
]* +
public   
async   
Task   
<   !
InvestmentDeclaration   /
>  / 0$
GetInvestmentDeclaration  1 I
(  I J
int  J M
finSLNo  N U
,  U V
int  W Z
employeeSLNo  [ g
)  g h
{!! 	!
InvestmentDeclaration"" !!
investmentDeclaration""" 7
=""8 9
await"": ?!
investmentApplication""@ U
.""U V$
GetInvestmentDeclaration""V n
(""n o
finSLNo""o v
,""v w
employeeSLNo	""x Ñ
)
""Ñ Ö
;
""Ö Ü
return## !
investmentDeclaration## (
;##( )
}$$ 	
['' 	
HttpPost''	 
]'' 
[(( 	
Route((	 
((( 
$str(( +
)((+ ,
]((, -
public)) 
async)) 
Task)) 
<)) !
InvestmentDeclaration)) /
>))/ 0&
SaveInvestmentDeclarations))1 K
())K L
[))L M
FromBody))M U
]))U V!
InvestmentDeclaration))W l"
investmentDeclaration	))m Ç
)
))Ç É
{** 	!
InvestmentDeclaration++ !"
investmentDeclarations++" 8
=++9 :
await++; @!
investmentApplication++A V
.++V W&
SaveInvestmentDeclarations++W q
(++q r"
investmentDeclaration	++r á
)
++á à
;
++à â
return,, "
investmentDeclarations,, )
;,,) *
}-- 	
[// 	
	Authorize//	 
]// 
[00 	
HttpGet00	 
]00 
[11 	
Route11	 
(11 
$str11 "
)11" #
]11# $
public22 
async22 
Task22 
<22 
List22 
<22 !
AssessmentTypeDetails22 4
>224 5
>225 6"
GetAssesseeTypeDetails227 M
(22M N
)22N O
{33 	
List55 
<55 !
AssessmentTypeDetails55 &
>55& '!
assessmentTypeDetails55( =
=55> ?
await55@ E!
investmentApplication55F [
.55[ \"
GetAssesseeTypeDetails55\ r
(55r s
)55s t
;55t u
return66 !
assessmentTypeDetails66 (
;66( )
}77 	
[99 	
	Authorize99	 
]99 
[:: 	
HttpGet::	 
]:: 
[;; 	
Route;;	 
(;; 
$str;;  
);;  !
];;! "
public<< 
async<< 
Task<< 
<<< 
List<< 
<<< 
HRALocations<< +
><<+ ,
><<, -
GetHRALocations<<. =
(<<= >
)<<> ?
{== 	
List>> 
<>> 
HRALocations>> 
>>> 
hRALocations>> +
=>>, -
await>>. 3!
investmentApplication>>4 I
.>>I J
GetHRALocations>>J Y
(>>Y Z
)>>Z [
;>>[ \
return?? 
hRALocations?? 
;??  
}@@ 	
[BB 	
	AuthorizeBB	 
]BB 
[CC 	
HttpGetCC	 
]CC 
[DD 	
RouteDD	 
(DD 
$strDD +
)DD+ ,
]DD, -
publicEE 
asyncEE 
TaskEE 
<EE 
TaxDeductionDetailsEE -
>EE- .&
GetIncomeTaxPaymentDetailsEE/ I
(EEI J
intEEJ M
employeeSLNoEEN Z
)EEZ [
{FF 	
TaxDeductionDetailsGG 
taxDeductionDetailsGG! 4
=GG5 6
awaitGG7 <!
investmentApplicationGG= R
.GGR S&
GetIncomeTaxPaymentDetailsGGS m
(GGm n
employeeSLNoGGn z
)GGz {
;GG{ |
returnHH 
taxDeductionDetailsHH &
;HH& '
}II 	
}JJ 
}KK Ó+
ÄF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\LeaveManagementReports\ReportsController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *"
LeaveManagementReports* @
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
ReportsController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IReportsApplication ,&
leaveManagementApplication- G
;G H
public 
ReportsController  
(  !
IReportsApplication! 4&
leaveManagementApplication5 O
)O P
{ 	
this 
. &
leaveManagementApplication +
=, -&
leaveManagementApplication. H
;H I
} 	
[ 	
	Authorize	 
] 
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str 
)  
]  !
public 
async 
Task 
< 
List 
< 
LeaveDetailReport 0
>0 1
>1 2
GetLeaveReport3 A
(A B
GetLeaveReportReqB S
getLeaveReportReqT e
)e f
{ 	
List 
< 
LeaveDetailReport "
>" #
leaveStatusList$ 3
=4 5
await6 ;&
leaveManagementApplication< V
.V W
GetLeaveReportW e
(e f
getLeaveReportReqf w
)w x
;x y
return   
leaveStatusList   "
;  " #
}!! 	
[## 	
	Authorize##	 
]## 
[$$ 	
HttpPost$$	 
]$$ 
[%% 	
Route%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
async&& 
Task&& 
<&& 
List&& 
<&& 
LeaveDetailReport&& 0
>&&0 1
>&&1 2
GetAllLeaves&&3 ?
(&&? @
GetLeaveReportReq&&@ Q
getLeaveReportReq&&R c
)&&c d
{'' 	
List(( 
<(( 
LeaveDetailReport(( "
>((" #
leaveStatusList(($ 3
=((4 5
await((6 ;&
leaveManagementApplication((< V
.((V W
GetAllLeaves((W c
(((c d
getLeaveReportReq((d u
)((u v
;((v w
return)) 
leaveStatusList)) "
;))" #
}** 	
[,, 	
	Authorize,,	 
],, 
[-- 	
HttpPost--	 
]-- 
[.. 	
Route..	 
(.. 
$str.. &
)..& '
]..' (
public// 
async// 
Task// 
<// 
List// 
<// 
AutoApprovalReport// 1
>//1 2
>//2 3!
GetAutoApprovalReport//4 I
(//I J
GetLeaveReportReq//J [
getLeaveReportReq//\ m
)//m n
{00 	
List11 
<11 
AutoApprovalReport11 #
>11# $
leaveStatusList11% 4
=115 6
await117 <&
leaveManagementApplication11= W
.11W X!
GetAutoApprovalReport11X m
(11m n
getLeaveReportReq11n 
)	11 Ä
;
11Ä Å
return22 
leaveStatusList22 "
;22" #
}33 	
[55 	
	Authorize55	 
]55 
[66 	
HttpPost66	 
]66 
[77 	
Route77	 
(77 
$str77 %
)77% &
]77& '
public88 
async88 
Task88 
<88 
List88 
<88 
LeaveDetailReport88 0
>880 1
>881 2 
GetLeaveTransactions883 G
(88G H"
GetLeaveTransactionReq88H ^"
getLeaveTransactionReq88_ u
)88u v
{99 	
List:: 
<:: 
LeaveDetailReport:: "
>::" #

leavesList::$ .
=::/ 0
await::1 6&
leaveManagementApplication::7 Q
.::Q R 
GetLeaveTransactions::R f
(::f g"
getLeaveTransactionReq::g }
)::} ~
;::~ 
return;; 

leavesList;; 
;;; 
}<< 	
[?? 	
	Authorize??	 
]?? 
[@@ 	
HttpPost@@	 
]@@ 
[AA 	
RouteAA	 
(AA 
$strAA .
)AA. /
]AA/ 0
publicBB 
asyncBB 
TaskBB 
<BB 
ListBB 
<BB ,
 EmployeeVerificationDetailReportBB ?
>BB? @
>BB@ A)
GetEmployeeVerificationReportBBB _
(BB_ `)
EmployeeVerificationReportReqBB` }
	reportReq	BB~ á
)
BBá à
{CC 	
ListDD 
<DD ,
 EmployeeVerificationDetailReportDD 1
>DD1 2

resultListDD3 =
=DD> ?
awaitDD@ E&
leaveManagementApplicationDDF `
.DD` a)
GetEmployeeVerificationReportDDa ~
(DD~ 
	reportReq	DD à
)
DDà â
;
DDâ ä
returnEE 

resultListEE 
;EE 
}FF 	
}GG 
}HH ∞1
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\LeaveManagement\LeaveEncashmentController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
LeaveManagement* 9
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class %
LeaveEncashmentController *
:+ ,
ControllerBase- ;
{ 
private 
readonly '
ILeaveEncashmentApplication 4&
leaveEncashmentApplication5 O
;O P
public %
LeaveEncashmentController (
(( )'
ILeaveEncashmentApplication) D&
leaveEncashmentApplicationE _
)_ `
{ 	
this 
. &
leaveEncashmentApplication +
=, -&
leaveEncashmentApplication. H
;H I
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str #
)# $
]$ %
public 
async 
Task 
< 
List 
< 
LeaveEncashment .
>. /
>/ 0
GetLeaveEncashment1 C
(C D
intD G
employeeSlnoH T
)T U
{   	
List!! 
<!! 
LeaveEncashment!!  
>!!  !
leaveEncashment!!" 1
=!!2 3
await!!4 9&
leaveEncashmentApplication!!: T
.!!T U
GetLeaveEncashment!!U g
(!!g h
employeeSlno!!h t
)!!t u
;!!u v
leaveEncashment## 
=## 
leaveEncashment## -
.##- .
OrderByDescending##. ?
(##? @
x##@ A
=>##B D
x##E F
.##F G
EncashmentId##G S
)##S T
.##T U
ToList##U [
(##[ \
)##\ ]
;##] ^
return$$ 
leaveEncashment$$ "
;$$" #
}%% 	
['' 	
	Authorize''	 
]'' 
[(( 	
HttpPost((	 
](( 
[)) 	
Route))	 
()) 
$str)) $
)))$ %
]))% &
public** 
async** 
Task** 
<** 
bool** 
>**  
SaveLeaveEntitlement**  4
(**4 5
LeaveEncashmentReq**5 G&
employeeLeaveEncashmentReq**H b
)**b c
{++ 	
bool,, 
	isUpdated,, 
=,, 
await,, "&
leaveEncashmentApplication,,# =
.,,= >
SaveLeaveEncashment,,> Q
(,,Q R&
employeeLeaveEncashmentReq,,R l
),,l m
;,,m n
return-- 
	isUpdated-- 
;-- 
}.. 	
[// 	
	Authorize//	 
]// 
[00 	
HttpPost00	 
]00 
[11 	
Route11	 
(11 
$str11 /
)11/ 0
]110 1
public22 
async22 
Task22 
<22 
bool22 
>22 *
UpdateEmployeeEncashmentStatus22  >
(22> ?
UpdateEncashmentReq22? R
leaveDetail22S ^
)22^ _
{33 	
bool44 
	isUpdated44 
=44 
await44 "&
leaveEncashmentApplication44# =
.44= >*
UpdateEmployeeEncashmentStatus44> \
(44\ ]
leaveDetail44] h
)44h i
;44i j
return55 
	isUpdated55 
;55 
}66 	
[99 	
	Authorize99	 
]99 
[:: 	
HttpPost::	 
]:: 
[;; 	
Route;;	 
(;; 
$str;; &
);;& '
];;' (
public<< 
async<< 
Task<< 
<<< 
bool<< 
><< !
DeleteLeaveEncashment<<  5
(<<5 6
DeleteEncashmentReq<<6 I
deleteEncashmentReq<<J ]
)<<] ^
{== 	
bool>> 
	isUpdated>> 
=>> 
await>> "&
leaveEncashmentApplication>># =
.>>= >!
DeleteLeaveEncashment>>> S
(>>S T
deleteEncashmentReq>>T g
)>>g h
;>>h i
return?? 
	isUpdated?? 
;?? 
}@@ 	
[CC 	
HttpPostCC	 
]CC 
[DD 	
RouteDD	 
(DD 
$strDD ,
)DD, -
]DD- .
publicEE 
asyncEE 
TaskEE 
<EE 
decimalEE !
>EE! "'
GetEmployeeTDSAmountDetailsEE# >
(EE> ?
[EE? @
FromBodyEE@ H
]EEH I#
EmployeeTDSMountDetailsEEJ a#
employeeTDSMountDetailsEEb y
)EEy z
{FF 	
decimalGG 
	tdsAmountGG 
=GG 
awaitGG  %&
leaveEncashmentApplicationGG& @
.GG@ A'
GetEmployeeTDSAmountDetailsGGA \
(GG\ ]#
employeeTDSMountDetailsGG] t
)GGt u
;GGu v
returnHH 
	tdsAmountHH 
;HH 
}II 	
[KK 	
HttpGetKK	 
]KK 
[LL 	
RouteLL	 
(LL 
$strLL ,
)LL, -
]LL- .
publicMM 
asyncMM 
TaskMM 
<MM 
ListMM 
<MM +
LeaveEncashmentApprovalsDetailsMM >
>MM> ?
>MM? @'
GetLeavesEncashmentApprovalMMA \
(MM\ ]
intMM] `
employeeSlnoMMa m
)MMm n
{NN 	
ListOO 
<OO +
LeaveEncashmentApprovalsDetailsOO 0
>OO0 1$
leaveEncashmentApprovalsOO2 J
=OOK L
awaitOOM R&
leaveEncashmentApplicationOOS m
.OOm n(
GetLeavesEncashmentApproval	OOn â
(
OOâ ä
employeeSlno
OOä ñ
)
OOñ ó
;
OOó ò
returnPP $
leaveEncashmentApprovalsPP +
;PP+ ,
}QQ 	
}SS 
}TT ó$
ÇF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\LeaveManagement\LeaveEntitlementController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
LeaveManagement* 9
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class &
LeaveEntitlementController +
:, -
BaseController. <
{ 
private 
readonly (
ILeaveEntitlementApplication 5'
leaveEntitlementApplication6 Q
;Q R
public &
LeaveEntitlementController )
() *(
ILeaveEntitlementApplication* F'
leaveEntitlementApplicationG b
)b c
{ 	
this 
. '
leaveEntitlementApplication ,
=- .'
leaveEntitlementApplication/ J
;J K
} 	
[ 	
	Authorize	 
] 
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str $
)$ %
]% &
public 
async 
Task 
< 
List 
< 
LeaveEntitlement /
>/ 0
>0 1
GetLeaveEntitlement2 E
(E F*
GetEmployeeLeaveEntitlementReqF d(
employeeLeaveEntitlementReq	e Ä
)
Ä Å
{ 	
List 
< 
LeaveEntitlement !
>! " 
leaveEntitlementList# 7
=8 9
await: ?'
leaveEntitlementApplication@ [
.[ \
GetLeaveEntitlement\ o
(o p(
employeeLeaveEntitlementReq	p ã
)
ã å
;
å ç
return##  
leaveEntitlementList## '
;##' (
}$$ 	
[&& 	
	Authorize&&	 
]&& 
['' 	
HttpPost''	 
]'' 
[(( 	
Route((	 
((( 
$str(( '
)((' (
]((( )
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) "
UpdateLeaveEntitlement))  6
())6 7
[))7 8
FromBody))8 @
]))@ A
List))B F
<))F G
LeaveEntitlement))G W
>))W X
leaveEntitlements))Y j
)))j k
{** 	
bool++ 
	isUpdated++ 
=++ 
await++ "'
leaveEntitlementApplication++# >
.++> ?"
UpdateLeaveEntitlement++? U
(++U V
leaveEntitlements++V g
)++g h
;++h i
return,, 
	isUpdated,, 
;,, 
}-- 	
[// 	
	Authorize//	 
]// 
[00 	
HttpPost00	 
]00 
[11 	
Route11	 
(11 
$str11 %
)11% &
]11& '
public22 
async22 
Task22 
<22 
bool22 
>22  
SaveLeaveEntitlement22  4
(224 5
[225 6
FromBody226 >
]22> ?
List22@ D
<22D E
LeaveEntitlement22E U
>22U V
leaveEntitlements22W h
)22h i
{33 	
bool44 
	isUpdated44 
=44 
await44 "'
leaveEntitlementApplication44# >
.44> ? 
SaveLeaveEntitlement44? S
(44S T
leaveEntitlements44T e
)44e f
;44f g
return55 
	isUpdated55 
;55 
}66 	
[88 	
	Authorize88	 
]88 
[99 	
HttpPost99	 
]99 
[:: 	
Route::	 
(:: 
$str:: '
)::' (
]::( )
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; "
DeleteLeaveEntitlement;;! 7
(;;7 8-
!DeleteEmployeeLeaveEntitlementReq;;8 Y-
!deleteEmployeeLeaveEntitlementReq;;Z {
);;{ |
{<< 	
bool== 
	isUpdated== 
=== 
await== "'
leaveEntitlementApplication==# >
.==> ?"
DeleteLeaveEntitlement==? U
(==U V-
!deleteEmployeeLeaveEntitlementReq==V w
)==w x
;==x y
return>> 
	isUpdated>> 
;>> 
}?? 	
}@@ 
}AA àb
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\LeaveManagement\LeaveManagementController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
LeaveManagement* 9
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class %
LeaveManagementController *
:+ ,
BaseApiController- >
{ 
private 
readonly '
ILeaveManagementApplication 4&
leaveManagementApplication5 O
;O P
public %
LeaveManagementController (
(( )'
ILeaveManagementApplication) D&
leaveManagementApplicationE _
)_ `
{ 	
this 
. &
leaveManagementApplication +
=, -&
leaveManagementApplication. H
;H I
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str "
)" #
]# $
public 
async 
Task 
< 
List 
< 
LeaveDetail *
>* +
>+ ,
GetEmployeeLeaves- >
(> ?
int? B
employeeSLNoC O
,O P
intQ T
statusIdU ]
,] ^
bool_ c
isDashBoardd o
)o p
{ 	
List 
< 
LeaveDetail 
> 
leaveStatusList -
=. /
await0 5&
leaveManagementApplication6 P
.P Q
GetEmployeeLeavesQ b
(b c
employeeSLNoc o
,o p
statusIdq y
)y z
;z {
if   
(   
isDashBoard   
)   
{!! 
leaveStatusList## 
=##  !
leaveStatusList##" 1
.##1 2
Take##2 6
(##6 7
$num##7 9
)##9 :
.##: ;
ToList##; A
(##A B
)##B C
;##C D
}$$ 
return%% 
leaveStatusList%% "
;%%" #
}&& 	
[(( 	
HttpGet((	 
](( 
[)) 	
Route))	 
()) 
$str)) !
)))! "
]))" #
public** 
async** 
Task** 
<** !
EmpLeavePolicyDetails** /
>**/ 0!
GetEmpLeavesbyLeaveId**1 F
(**F G
int**G J
leaveId**K R
)**R S
{++ 	!
EmpLeavePolicyDetails,, !!
empLeavePolicyDetails,," 7
=,,8 9
await,,: ?&
leaveManagementApplication,,@ Z
.,,Z [!
GetEmpLeavesbyLeaveId,,[ p
(,,p q
leaveId,,q x
),,x y
;,,y z
return-- !
empLeavePolicyDetails-- (
;--( )
}.. 	
[// 	
	Authorize//	 
]// 
[00 	
HttpGet00	 
]00 
[11 	
Route11	 
(11 
$str11 ,
)11, -
]11- .
public22 
async22 
Task22 
<22 
List22 
<22 
LeaveDetail22 *
>22* +
>22+ ,'
GetLeavesWaitingForApproval22- H
(22H I
int22I L
employeeSlno22M Y
)22Y Z
{33 	
List44 
<44 
LeaveDetail44 
>44 
empList44 %
=44& '
await44( -&
leaveManagementApplication44. H
.44H I'
GetLeavesWaitingForApproval44I d
(44d e
employeeSlno44e q
)44q r
;44r s
return55 
empList55 
;55 
}66 	
[88 	
	Authorize88	 
]88 
[99 	
HttpPost99	 
]99 
[:: 	
Route::	 
(:: 
$str:: 
):: 
]::  
public;; 
async;; 
Task;; 
<;; 
List;; 
<;; 
GetTeamLeavesData;; 0
>;;0 1
>;;1 2
GetTeamLeaves;;3 @
(;;@ A
[;;A B
FromBody;;B J
];;J K
LeaveSearchCriteria;;L _
searchCriteria;;` n
);;n o
{<< 	
List== 
<== 
GetTeamLeavesData== "
>==" #
empList==$ +
===, -
await==. 3&
leaveManagementApplication==4 N
.==N O
GetTeamLeaves==O \
(==\ ]
searchCriteria==] k
)==k l
;==l m
return>> 
empList>> 
;>> 
}?? 	
[AA 	
	AuthorizeAA	 
]AA 
[BB 	
HttpPostBB	 
]BB 
[CC 	
RouteCC	 
(CC 
$strCC (
)CC( )
]CC) *
publicDD 
asyncDD 
TaskDD 
<DD 
ListDD 
<DD  
GetTeamEmpLeavesDataDD 3
>DD3 4
>DD4 5#
GetMyTeamEmployeeLeavesDD6 M
(DDM N
LeaveSearchCriteriaDDN a
searchCriteriaDDb p
)DDp q
{EE 	
ListFF 
<FF  
GetTeamEmpLeavesDataFF %
>FF% &
	leaveListFF' 0
=FF1 2
awaitFF3 8&
leaveManagementApplicationFF9 S
.FFS T#
GetMyTeamEmployeeLeavesFFT k
(FFk l
searchCriteriaFFl z
)FFz {
;FF{ |
returnGG 
	leaveListGG 
;GG 
}HH 	
[JJ 	
	AuthorizeJJ	 
]JJ 
[KK 	
HttpGetKK	 
]KK 
[LL 	
RouteLL	 
(LL 
$strLL (
)LL( )
]LL) *
publicMM 
asyncMM 
TaskMM 
<MM 
ListMM 
<MM 
EmpLeaveBalanceMM .
>MM. /
>MM/ 0#
GetEmployeeLeaveBalanceMM1 H
(MMH I
intMMI L
employeeSLNoMMM Y
)MMY Z
{NN 	
ListOO 
<OO 
EmpLeaveBalanceOO  
>OO  !

leavesListOO" ,
=OO- .
awaitOO/ 4&
leaveManagementApplicationOO5 O
.OOO P#
GetEmployeeLeaveBalanceOOP g
(OOg h
employeeSLNoOOh t
)OOt u
;OOu v
returnPP 

leavesListPP 
;PP 
}QQ 	
[SS 	
	AuthorizeSS	 
]SS 
[TT 	
HttpPostTT	 
]TT 
[UU 	
RouteUU	 
(UU 
$strUU *
)UU* +
]UU+ ,
publicVV 
asyncVV 
TaskVV 
<VV 
boolVV 
>VV %
UpdateEmployeeLeaveStatusVV  9
(VV9 :
[VV: ;
FromBodyVV; C
]VVC D
LeaveDetailVVE P
	empLeavesVVQ Z
)VVZ [
{WW 	
boolXX %
updateEmployeeLeaveStatusXX *
=XX+ ,
awaitXX- 2&
leaveManagementApplicationXX3 M
.XXM N%
UpdateEmployeeLeaveStatusXXN g
(XXg h
	empLeavesXXh q
)XXq r
;XXr s
returnYY %
updateEmployeeLeaveStatusYY ,
;YY, -
}ZZ 	
[\\ 	
	Authorize\\	 
]\\ 
[]] 	
HttpPost]]	 
]]] 
[^^ 	
Route^^	 
(^^ 
$str^^ 2
)^^2 3
]^^3 4
public__ 
async__ 
Task__ 
<__ 
bool__ 
>__ -
!UpdateMultipleEmployeeLeaveStatus__  A
(__A B0
$UpdateMultipleEmployeeLeaveStatusReq__B f
empLeaveDetails__g v
)__v w
{`` 	
boolaa %
updateEmployeeLeaveStatusaa *
=aa+ ,
awaitaa- 2&
leaveManagementApplicationaa3 M
.aaM N-
!UpdateMultipleEmployeeLeaveStatusaaN o
(aao p
empLeaveDetailsaap 
)	aa Ä
;
aaÄ Å
returnbb %
updateEmployeeLeaveStatusbb ,
;bb, -
}cc 	
[ee 	
	Authorizeee	 
]ee 
[ff 	
HttpPostff	 
]ff 
[gg 	
Routegg	 
(gg 
$strgg "
)gg" #
]gg# $
publichh 
asynchh 
Taskhh 
<hh 
EmpLeaveResponsehh *
>hh* +
SaveEmployeeLeavehh, =
(hh= >
[hh> ?
FromBodyhh? G
]hhG H
EmployeeLeavehhI V
empLeaveRequesthhW f
)hhf g
{ii 	
EmpLeaveResponsejj 
saveLeaveRequestjj -
=jj. /
awaitjj0 5&
leaveManagementApplicationjj6 P
.jjP Q
SaveEmployeeLeavejjQ b
(jjb c
empLeaveRequestjjc r
)jjr s
;jjs t
returnkk 
saveLeaveRequestkk #
;kk# $
}ll 	
[pp 	
	Authorizepp	 
]pp 
[qq 	
HttpGetqq	 
]qq 
[rr 	
Routerr	 
(rr 
$strrr )
)rr) *
]rr* +
publicss 
asyncss 
Taskss 
<ss 
Listss 
<ss 
LeaveDetailss *
>ss* +
>ss+ ,$
GetManagerApprovalLeavesss- E
(ssE F
intssF I
employeeSlnossJ V
)ssV W
{tt 	
Listuu 
<uu 
LeaveDetailuu 
>uu 
empListuu %
=uu& '
awaituu( -&
leaveManagementApplicationuu. H
.uuH I$
GetManagerApprovalLeavesuuI a
(uua b
employeeSlnouub n
)uun o
;uuo p
returnvv 
empListvv 
;vv 
}ww 	
[yy 	
	Authorizeyy	 
]yy 
[zz 	
HttpGetzz	 
]zz 
[{{ 	
Route{{	 
({{ 
$str{{ $
){{$ %
]{{% &
public|| 
async|| 
Task|| 
<|| 
int|| 
>|| 
GetUtilizedOnDuties|| 2
(||2 3
int||3 6
employeeSlno||7 C
)||C D
{}} 	
int~~ 
utilizedOnDuties~~  
=~~! "
await~~# (&
leaveManagementApplication~~) C
.~~C D
GetUtilizedOnDuties~~D W
(~~W X
employeeSlno~~X d
)~~d e
;~~e f
return 
utilizedOnDuties #
;# $
}
ÄÄ 	
[
ÉÉ 	
HttpGet
ÉÉ	 
]
ÉÉ 
[
ÑÑ 	
Route
ÑÑ	 
(
ÑÑ 
$str
ÑÑ !
)
ÑÑ! "
]
ÑÑ" #
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
List
ÖÖ 
<
ÖÖ !
EmpLeaveFileDetails
ÖÖ 2
>
ÖÖ2 3
>
ÖÖ3 4
GetEmpLeaveFiles
ÖÖ5 E
(
ÖÖE F
int
ÖÖF I
leaveId
ÖÖJ Q
)
ÖÖQ R
{
ÜÜ 	
List
áá 
<
áá !
EmpLeaveFileDetails
áá $
>
áá$ %
leaveFileDetails
áá& 6
=
áá7 8
await
áá9 >(
leaveManagementApplication
áá? Y
.
ááY Z
GetEmpLeaveFiles
ááZ j
(
ááj k
leaveId
áák r
)
áár s
;
áás t
return
àà 
leaveFileDetails
àà #
;
àà# $
}
ââ 	
[
ãã 	
	Authorize
ãã	 
]
ãã 
[
åå 	

HttpDelete
åå	 
]
åå 
[
çç 	
Route
çç	 
(
çç 
$str
çç 
)
çç 
]
çç 
public
éé 
async
éé 
Task
éé 
<
éé 
bool
éé 
>
éé 
CancelLeave
éé  +
(
éé+ ,
int
éé, /
leaveId
éé0 7
)
éé7 8
{
èè 	
bool
êê '
updateEmployeeLeaveStatus
êê *
=
êê+ ,
await
êê- 2(
leaveManagementApplication
êê3 M
.
êêM N
CancelLeave
êêN Y
(
êêY Z
leaveId
êêZ a
)
êêa b
;
êêb c
return
ëë '
updateEmployeeLeaveStatus
ëë ,
;
ëë, -
}
íí 	
}
îî 
}ïï “
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Mandals\MandalsController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Mandals* 1
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
MandalsController "
:# $
BaseController% 3
{ 
private 
readonly 
IMandalsApplication ,
mandalsApplication- ?
;? @
public 
MandalsController  
(  !
IMandalsApplication! 4
mandalsApplication5 G
)G H
{ 	
this 
. 
mandalsApplication #
=$ %
mandalsApplication& 8
;8 9
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
List 
< 
MandalDetails ,
>, -
>- .

GetMandals/ 9
(9 :
int: =
districtSlNo> J
)J K
{ 	
List 
< 
MandalDetails 
> 
mandals  '
=( )
await* /
mandalsApplication0 B
.B C
GetMandalDetailsC S
(S T
districtSlNoT `
)` a
;a b
return 
mandals 
; 
} 	
}   
}!! ª
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Masters\AttendanceReportTypeController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Masters* 1
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class *
AttendanceReportTypeController /
:0 1
BaseController2 @
{ 
private 
readonly ,
 IAttendanceReportTypeApplication 9+
attendanceReportTypeApplication: Y
;Y Z
public *
AttendanceReportTypeController -
(- .,
 IAttendanceReportTypeApplication. N+
attendanceReportTypeApplicationO n
)n o
{ 	
this 
. +
attendanceReportTypeApplication 0
=1 2+
attendanceReportTypeApplication3 R
;R S
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str )
)) *
]* +
public 
async 
Task 
< 
List 
<  
AttendanceReportType 3
>3 4
>4 5$
GetAttendanceReportTypes6 N
(N O
)O P
{ 	
List 
<  
AttendanceReportType %
>% &
reportTypes' 2
=3 4
await5 :+
attendanceReportTypeApplication; Z
.Z [$
GetAttendanceReportTypes[ s
(s t
)t u
;u v
return 
reportTypes 
; 
}   	
}!! 
}"" Ò!
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Masters\BranchController.cs
	namespace		 	
Phoenix		
 
.		 
Web		 
.		 
Service		 
.		 
Controllers		 )
.		) *
Masters		* 1
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BranchController !
:" #
BaseController$ 2
{ 
private 
readonly 
IBranchApplication +
branchApplication, =
;= >
public 
BranchController 
(  
IBranchApplication  2
branchApplication3 D
)D E
{ 	
this 
. 
branchApplication "
=# $
branchApplication% 6
;6 7
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
List 
< 
Branch %
>% &
>& '
GetHRBranch( 3
(3 4
int4 7
employeeSlno8 D
)D E
{ 	
List 
< 
Branch 
> 
branch 
=  !
await" '
branchApplication( 9
.9 :
GetHRBranch: E
(E F
employeeSlnoF R
)R S
;S T
return 
branch 
; 
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[   	
Route  	 
(   
$str   %
)  % &
]  & '
public!! 
async!! 
Task!! 
<!! 
List!! 
<!! 
Branch!! %
>!!% &
>!!& ' 
GetBranchesByOfcType!!( <
(!!< =
int!!= @
officeTypeSlno!!A O
,!!O P
int!!Q T
employeeSlno!!U a
)!!a b
{"" 	
List## 
<## 
Branch## 
>## 
branch## 
=##  !
await##" '
branchApplication##( 9
.##9 : 
GetBranchesByOfcType##: N
(##N O
officeTypeSlno##O ]
,##] ^
employeeSlno##_ k
)##k l
;##l m
return$$ 
branch$$ 
;$$ 
}%% 	
['' 	
	Authorize''	 
]'' 
[(( 	
HttpGet((	 
](( 
[)) 	
Route))	 
()) 
$str)) 
))) 
]))  
public** 
async** 
Task** 
<** 
List** 
<** 

OfficeType** )
>**) *
>*** +
GetOfficeType**, 9
(**9 :
)**: ;
{++ 	
List,, 
<,, 

OfficeType,, 
>,, 

officeType,, '
=,,( )
await,,* /
branchApplication,,0 A
.,,A B
GetOfficeType,,B O
(,,O P
),,P Q
;,,Q R
return-- 

officeType-- 
;-- 
}.. 	
[00 	
	Authorize00	 
]00 
[11 	
HttpGet11	 
]11 
[22 	
Route22	 
(22 
$str22 
)22  
]22  !
public33 
async33 
Task33 
<33 
List33 
<33 
	BranchRMS33 (
>33( )
>33) *
GetHRBranchRMS33+ 9
(339 :
int33: =
employeeSlno33> J
)33J K
{44 	
List55 
<55 
	BranchRMS55 
>55 
branch55 "
=55# $
await55% *
branchApplication55+ <
.55< =
GetHRBranchRMS55= K
(55K L
employeeSlno55L X
)55X Y
;55Y Z
return66 
branch66 
;66 
}77 	
}88 
}99 œ
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Masters\LeaveDayTypeController.cs
	namespace

 	
Phoenix


 
.

 
Web

 
.

 
Service

 
.

 
Controllers

 )
.

) *
Masters

* 1
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class "
LeaveDayTypeController '
:( )
BaseController* 8
{ 
private 
readonly $
ILeaveDayTypeApplication 1#
leaveDayTypeApplication2 I
;I J
public "
LeaveDayTypeController %
(% &$
ILeaveDayTypeApplication& >#
leaveDayTypeApplication? V
)V W
{ 	
this 
. #
leaveDayTypeApplication (
=) *#
leaveDayTypeApplication+ B
;B C
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str !
)! "
]" #
public 
async 
Task 
< 
List 
< 
LeaveDayType +
>+ ,
>, -
GetLeaveDayTypes. >
(> ?
)? @
{ 	
List 
< 
LeaveDayType 
> 
leaveDayTypes ,
=- .
await/ 4#
leaveDayTypeApplication5 L
.L M
GetLeaveDayTypesM ]
(] ^
)^ _
;_ `
return 
leaveDayTypes  
;  !
} 	
} 
}   ª
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Masters\LeaveStatusController.cs
	namespace		 	
Phoenix		
 
.		 
Web		 
.		 
Service		 
.		 
Controllers		 )
.		) *
Masters		* 1
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class !
LeaveStatusController &
:' (
BaseController) 7
{ 
private 
readonly #
ILeaveStatusApplication 0"
leaveStatusApplication1 G
;G H
public !
LeaveStatusController $
($ %#
ILeaveStatusApplication% <"
leaveStatusApplication= S
)S T
{ 	
this 
. "
leaveStatusApplication '
=( )"
leaveStatusApplication* @
;@ A
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
)  
]  !
public 
async 
Task 
< 
List 
< 
LeaveStatus *
>* +
>+ ,
GetLeaveStatus- ;
(; <
)< =
{ 	
List 
< 
LeaveStatus 
> 
leaveStatus )
=* +
await, 1"
leaveStatusApplication2 H
.H I
GetLeaveStatusI W
(W X
)X Y
;Y Z
return 
leaveStatus 
; 
} 	
} 
} Á
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Masters\LeaveTypeController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Masters* 1
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
LeaveTypeController $
:% &
BaseController' 5
{ 
private 
readonly !
ILeaveTypeApplication . 
leaveTypeApplication/ C
;C D
public 
LeaveTypeController "
(" #!
ILeaveTypeApplication# 8 
leaveTypeApplication9 M
)M N
{ 	
this 
.  
leaveTypeApplication %
=& ' 
leaveTypeApplication( <
;< =
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
]  
public 
async 
Task 
< 
List 
< 
	LeaveType (
>( )
>) *
GetLeaveTypes+ 8
(8 9
)9 :
{ 	
List 
< 
	LeaveType 
> 

leaveTypes &
=' (
await) . 
leaveTypeApplication/ C
.C D
GetLeaveTypesD Q
(Q R
)R S
;S T
return 

leaveTypes 
; 
}   	
["" 	
	Authorize""	 
]"" 
[## 	
HttpGet##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ &
)$$& '
]$$' (
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% 
	LeaveType%% (
>%%( )
>%%) *!
GetAssignedLeaveTypes%%+ @
(%%@ A
int%%A D
employeeSlno%%E Q
)%%Q R
{&& 	
List'' 
<'' 
	LeaveType'' 
>'' 

leaveTypes'' &
=''' (
await'') . 
leaveTypeApplication''/ C
.''C D!
GetAssignedLeaveTypes''D Y
(''Y Z
employeeSlno''Z f
)''f g
;''g h
return(( 

leaveTypes(( 
;(( 
})) 	
}** 
},, ™
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Notification\NotificationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Notification* 6
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class "
NotificationController '
:( )
BaseController* 8
{ 
private 
readonly $
INotificationApplication 1#
NotificationApplication2 I
;I J
public "
NotificationController %
(% &$
INotificationApplication& >#
NotificationApplication? V
)V W
{ 	
this 
. #
NotificationApplication (
=) *#
NotificationApplication+ B
;B C
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str !
)! "
]" #
public 
async 
Task 
< 
List 
< 
NotificationDetail 1
>1 2
>2 3
GetNotifications4 D
(D E
intE H
employeeSlnoI U
)U V
{ 	
List 
< 
NotificationDetail #
># $
notifications% 2
=3 4
await5 :#
NotificationApplication; R
.R S
GetNotificationsS c
(c d
employeeSlnod p
)p q
;q r
return 
notifications  
;  !
} 	
}   
}!! ù
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\NSL\NslEmployeeInformationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
NSL* -
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class (
NslEmployeeProfileController -
:. /
BaseController0 >
{ 
private 
readonly *
INslEmployeeProfileApplication 7)
NslEmployeeProfileApplication8 U
;U V
public (
NslEmployeeProfileController +
(+ ,*
INslEmployeeProfileApplication, J)
NslEmployeeProfileApplicationK h
)h i
{ 	
this 
. )
NslEmployeeProfileApplication .
=/ 0)
NslEmployeeProfileApplication1 N
;N O
} 	
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str '
)' (
]( )
public 
async 
Task 
< 
PagedResultSet (
<( )
EmployeeProfileData) <
>< =
>= >"
GetAllEmployeeProfiles? U
(U V)
EmployeeProfileSearchCriteriaV s
searchCriteria	t Ç
)
Ç É
{ 	
PagedResultSet 
< 
EmployeeProfileData .
>. /
employeeProfiles0 @
=A B
nullC G
;G H
employeeProfiles 
= 
await $
this% )
.) *)
NslEmployeeProfileApplication* G
.G H"
GetAllEmployeeProfilesH ^
(^ _
searchCriteria_ m
)m n
;n o
return   
employeeProfiles   #
;  # $
}!! 	
[## 	
HttpGet##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ #
)$$# $
]$$$ %
public%% 
async%% 
Task%% 
<%% 
EmployeeProfileData%% -
>%%- .
GetEmployeeProfile%%/ A
(%%A B
string%%B H

employeeId%%I S
)%%S T
{&& 	
EmployeeProfileData'' 
employeeProfile''  /
=''0 1
null''2 6
;''6 7
employeeProfile(( 
=(( 
await(( #
this(($ (
.((( ))
NslEmployeeProfileApplication(() F
.((F G
GetEmployeeProfile((G Y
(((Y Z

employeeId((Z d
)((d e
;((e f
return)) 
employeeProfile)) "
;))" #
}** 	
}-- 
}.. —
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Payslips\PayslipsController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
Payslips* 2
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
PayslipsController #
:$ %
BaseApiController& 7
{ 
private 
readonly  
IPayslipsApplication -
payslipsApplication. A
;A B
public 
PayslipsController !
(! " 
IPayslipsApplication" 6
payslipsApplication7 J
)J K
{ 	
this 
. 
payslipsApplication $
=% &
payslipsApplication' :
;: ;
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str  
)  !
]! "
public 
async 
Task 
< 
IActionResult '
>' (
DownloadPaySlip) 8
(8 9
int9 <
employeeSlno= I
)I J
{ 	
using 
var 
report 
= 
new "
LocalReport# .
(. /
)/ 0
;0 1
byte 
[ 
] 
payslipsDataRow "
=# $
await% *
payslipsApplication+ >
.> ?
DownloadPaySlip? N
(N O
employeeSlnoO [
)[ \
;\ ]
return 
File 
( 
payslipsDataRow '
,' (
	Constants) 2
.2 3
PDFMIMETYPE3 >
,> ?
	Constants@ I
.I J
PDFEXTENSIONJ V
)V W
;W X
}   	
[## 	
	Authorize##	 
]## 
[$$ 	
HttpGet$$	 
]$$ 
[%% 	
Route%%	 
(%% 
$str%% #
)%%# $
]%%$ %
public&& 
async&& 
Task&& 
<&& 
List&& 
<&& 
Payslip&& &
>&&& '
>&&' (
GetEmployeePaylips&&) ;
(&&; <
string&&< B
employeeSlno&&C O
)&&O P
{'' 	
List(( 
<(( 
Payslip(( 
>(( 
payslips(( "
=((# $
await((% *
payslipsApplication((+ >
.((> ?
GetEmployeePayslip((? Q
(((Q R
employeeSlno((R ^
)((^ _
;((_ `
return)) 
payslips)) 
;)) 
}** 	
}++ 
},, Ú'
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\Reimbursement\ReimbursementController.cs
	namespace		 	
Phoenix		
 
.		 
Web		 
.		 
Service		 
.		 
Controllers		 )
.		) *
Reimbursement		* 7
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class #
ReimbursementController (
:) *
BaseApiController+ <
{ 
private 
readonly %
IReimbursementApplication 2$
reimbursementApplication3 K
;K L
public #
ReimbursementController &
(& '%
IReimbursementApplication' @$
reimbursementApplicationA Y
)Y Z
{ 	
this 
. $
reimbursementApplication )
=* +$
reimbursementApplication, D
;D E
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str !
)! "
]" #
public 
async 
Task 
< 
List 
< !
ApprovedReimbursement 4
>4 5
>5 6
GetApprovedBills7 G
(G H
intH K
employeeNumberL Z
)Z [
{ 	
List 
< !
ApprovedReimbursement &
>& '
approvedBills( 5
=6 7
await8 =$
reimbursementApplication> V
.V W
GetApprovedBillsW g
(g h
employeeNumberh v
)v w
;w x
decimal 
amount 
= 
$num 
; 
foreach 
( 
var 
item 
in  
approvedBills! .
). /
{   
amount!! 
=!! 
amount!! 
+!!  !
item!!" &
.!!& '
Balance!!' .
;!!. /
}"" 
if## 
(## 
approvedBills## 
.## 
Count## "
>### $
$num##% &
)##& '
{$$ 
approvedBills%% 
[%% 
$num%% 
]%%  
.%%  !
TotalAmount%%! ,
=%%- .
amount%%/ 5
;%%5 6
}&& 
return'' 
approvedBills''  
;''  !
})) 	
[++ 	
	Authorize++	 
]++ 
[,, 	
HttpGet,,	 
],, 
[-- 	
Route--	 
(-- 
$str--  
)--  !
]--! "
public.. 
async.. 
Task.. 
<.. 
List.. 
<..  
PendingReimbursement.. 3
>..3 4
>..4 5
GetPendingBills..6 E
(..E F
int..F I
employeeNumber..J X
)..X Y
{// 	
List00 
<00  
PendingReimbursement00 %
>00% &!
pendingReimbursements00' <
=00= >
await00? D$
reimbursementApplication00E ]
.00] ^
GetPendingBills00^ m
(00m n
employeeNumber00n |
)00| }
;00} ~
return11 !
pendingReimbursements11 (
;11( )
}22 	
[44 	
	Authorize44	 
]44 
[55 	
HttpPost55	 
]55 
[66 	
Route66	 
(66 
$str66 $
)66$ %
]66% &
public77 
async77 
Task77 
<77 
bool77 
>77 
UploadReimburesment77  3
(773 4%
UploadReimbursmentDetails774 M%
uploadReimbursmentDetails77N g
)77g h
{88 	
var99 
resp99 
=99 
await99 $
reimbursementApplication99 5
.995 6 
UploadReimburesement996 J
(99J K%
uploadReimbursmentDetails99K d
)99d e
;99e f
return:: 
resp:: 
;:: 
};; 	
[== 	
	Authorize==	 
]== 
[>> 	
HttpGet>>	 
]>> 
[?? 	
Route??	 
(?? 
$str?? (
)??( )
]??) *
public@@ 
async@@ 
Task@@ 
<@@ 
bool@@ 
>@@ #
DeleteReimbursementBill@@  7
(@@7 8
int@@8 ;
reimbursementId@@< K
)@@K L
{AA 	
boolBB 
	isDeletedBB 
=BB 
awaitBB "$
reimbursementApplicationBB# ;
.BB; <#
DeleteReimbursementBillBB< S
(BBS T
reimbursementIdBBT c
)BBc d
;BBd e
returnCC 
	isDeletedCC 
;CC 
}DD 	
}EE 
}FF ´
ÉF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\SiteNotification\SiteNotificationController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
SiteNotification* :
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class &
SiteNotificationController +
:, -
ControllerBase. <
{ 
private 
readonly (
ISiteNotificationApplication 5'
SiteNotificationApplication6 Q
;Q R
private 
readonly (
IResignedEmployeeApplication 5'
resignedEmployeeApplication6 Q
;Q R
public &
SiteNotificationController )
() *(
ISiteNotificationApplication* F'
SiteNotificationApplicationG b
,b c(
IResignedEmployeeApplication ('
resignedEmployeeApplication) D
)D E
{ 	
this 
. '
SiteNotificationApplication ,
=- .'
SiteNotificationApplication/ J
;J K
this 
. '
resignedEmployeeApplication ,
=- .'
resignedEmployeeApplication/ J
;J K
} 	
[!! 	
	Authorize!!	 
]!! 
["" 	
HttpGet""	 
]"" 
[## 	
Route##	 
(## 
$str## %
)##% &
]##& '
public$$ 
async$$ 
Task$$ 
<$$ #
SiteNotificationDetails$$ 1
>$$1 2
GetNotifications$$3 C
($$C D
int$$D G
officeTypeslno$$H V
)$$V W
{%% 	#
SiteNotificationDetails&& #
sitenotifications&&$ 5
=&&6 7
await&&8 ='
SiteNotificationApplication&&> Y
.&&Y Z 
GetSiteNotifications&&Z n
(&&n o
officeTypeslno&&o }
)&&} ~
;&&~ 
return'' 
sitenotifications'' $
;''$ %
}(( 	
[++ 	
HttpPost++	 
]++ 
[,, 	
Route,,	 
(,, 
$str,, %
),,% &
],,& '
public-- 
async-- 
Task-- 
<-- 
EmpLeaveResponse-- *
>--* + 
SaveEmployeeFeedback--, @
(--@ A
[--A B
FromBody--B J
]--J K#
EmployeeFeedbackDetails--L c
empFeedbackRequest--d v
)--v w
{.. 	
EmpLeaveResponse// 
saveLeaveRequest// -
=//. /
await//0 5'
SiteNotificationApplication//6 Q
.//Q R 
SaveEmployeeFeedback//R f
(//f g
empFeedbackRequest//g y
)//y z
;//z {
return00 
saveLeaveRequest00 #
;00# $
}11 	
[33 	
HttpGet33	 
]33 
[44 	
Route44	 
(44 
$str44 %
)44% &
]44& '
public55 
async55 
Task55 
<55 
List55 
<55 
ResignedEmployee55 /
>55/ 0
>550 1 
GetResignedEmployees552 F
(55F G
)55G H
{66 	
List77 
<77 
ResignedEmployee77 #
>77# $
sitenotifications77% 6
=777 8
await779 >'
resignedEmployeeApplication77? Z
.77Z [ 
GetResignedEmployees77[ o
(77o p
)77p q
;77q r
return88 
sitenotifications88 $
;88$ %
}99 	
}:: 
};; ˛
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\States\StatesController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
States* 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
StatesController !
:" #
BaseController$ 2
{ 
private 
readonly 
IStatesApplication +
statesApplication, =
;= >
public 
StatesController 
(  
IStatesApplication  2
statesApplication3 D
)D E
{ 	
this 
. 
statesApplication "
=# $
statesApplication% 6
;6 7
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
List 
< 
StatesDetails ,
>, -
>- .
	GetStates/ 8
(8 9
)9 :
{ 	
List 
< 
StatesDetails 
> 
states  &
=' (
await) .
statesApplication/ @
.@ A
GetStatesDetailsA Q
(Q R
)R S
;S T
return 
states 
; 
} 	
} 
}   ß
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Controllers\TimeSheet\TimeSheetController.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Controllers )
.) *
	TimeSheet* 3
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
TimeSheetController $
:% &
BaseApiController' 8
{ 
private 
readonly !
ITimeSheetApplication . 
timeSheetApplication/ C
;C D
public 
TimeSheetController "
(" #!
ITimeSheetApplication# 8 
timeSheetApplication9 M
)M N
{ 	
this 
.  
timeSheetApplication %
=& ' 
timeSheetApplication( <
;< =
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str *
)* +
]+ ,
public 
async 
Task 
< 
List 
< #
TimeSheetProjectDetails 6
>6 7
>7 8%
GetEmployeeProjectDetails9 R
(R S
intS V
employeeSLNoW c
)c d
{ 	
List 
< #
TimeSheetProjectDetails (
>( )
projectDetails* 8
=9 :
await; @ 
timeSheetApplicationA U
.U V%
GetEmployeeProjectDetailsV o
(o p
employeeSLNop |
)| }
;} ~
return 
projectDetails !
;! "
} 	
}%% 
}&& ’t
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\CronJobs\AppointmentLetterJob.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
CronJobs &
{ 
public 

class  
AppointmentLetterJob %
:& '
CronJobService( 6
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly )
IAppointmentLetterApplication 6*
employeeInformationApplication7 U
;U V
private 
readonly !
ISendEmailApplication . 
sendEmailApplication/ C
;C D
private 
bool 
isFlag 
= 
true "
;" #
readonly 
	IAmazonS3 
	_s3Client $
;$ %
private 
readonly 
string 
rootFilePath  ,
;, -
public!!  
AppointmentLetterJob!! #
(!!# $
IWebHostEnvironment!!$ 7
environment!!8 C
,!!C D
IScheduleConfig!!E T
<!!T U 
EmailNotificationJob!!U i
>!!i j
config!!k q
,!!q r
ILoggerManager	!!s Å
logger
!!Ç à
,
!!à â+
IAppointmentLetterApplication
!!ä ß,
employeeInformationApplication
!!® ∆
)
!!∆ «
:"" 
base"" 
("" 
config"" 
."" 
CronExpression"" (
,""( )
config""* 0
.""0 1
TimeZoneInfo""1 =
)""= >
{## 	
this$$ 
.$$ 
logger$$ 
=$$ 
logger$$ 
;$$ 
this%% 
.%% *
employeeInformationApplication%% /
=%%/ 0*
employeeInformationApplication%%0 N
;%%N O
	_s3Client&& 
=&& 
new&& 
AmazonS3Client&& *
(&&* +
S3BucketSettings&&+ ;
.&&; <
Current&&< C
.&&C D
	AccessKey&&D M
,&&M N
S3BucketSettings&&O _
.&&_ `
Current&&` g
.&&g h
	SecretKey&&h q
,&&q r
RegionEndpoint	&&s Å
.
&&Å Ç
APSouth1
&&Ç ä
)
&&ä ã
;
&&ã å
rootFilePath'' 
='' 
environment'' &
.''& '
ContentRootPath''' 6
;''6 7
}(( 	
public** 
override** 
async** 
Task** "

StartAsync**# -
(**- .
CancellationToken**. ?
cancellationToken**@ Q
)**Q R
{++ 	
logger,, 
.,, 
LogInfo,, 
(,, 
$str,, =
),,= >
;,,> ?
await-- 
base-- 
.-- 

StartAsync-- !
(--! "
cancellationToken--" 3
)--3 4
;--4 5
}.. 	
public00 
override00 
async00 
Task00 "
DoWork00# )
(00) *
CancellationToken00* ;
cancellationToken00< M
)00M N
{11 	
logger22 
.22 
LogInfo22 
(22 
string22 !
.22! "
Format22" (
(22( )
$str22) T
,22T U
DateTime22V ^
.22^ _
Now22_ b
.22b c
ToString22c k
(22k l
$str22l o
)22o p
)22p q
)22q r
;22r s
if33 
(33 
isFlag33 
&&33 
JobSettings33 %
.33% &
Current33& -
.33- .$
CreateAppointmentLetters33. F
)33F G
{44 
isFlag55 
=55 
false55 
;55 
List66 
<66 
AppointmentLetter66 &
>66& '
appointmentLetters66( :
=66; <
await66= B*
employeeInformationApplication66C a
.66a b'
GetPendingAppointmentLetter66b }
(66} ~
)66~ 
;	66 Ä
foreach77 
(77 
var77 
item77 !
in77" $
appointmentLetters77% 7
)777 8
{88 
await99 %
GenerateAppointmentLetter99 3
(993 4
item994 8
)998 9
;999 :
}:: 
isFlag;; 
=;; 
true;; 
;;; 
}<< 
else== 
{>> 
logger?? 
.?? 
LogWarn?? 
(?? 
$str	?? ã
)
??ã å
;
??å ç
}AA 
}BB 	
publicDD 
overrideDD 
asyncDD 
TaskDD "
	StopAsyncDD# ,
(DD, -
CancellationTokenDD- >
cancellationTokenDD? P
)DDP Q
{EE 	
loggerFF 
.FF 
LogInfoFF 
(FF 
$strFF =
)FF= >
;FF> ?
awaitGG 
baseGG 
.GG 
	StopAsyncGG  
(GG  !
cancellationTokenGG! 2
)GG2 3
;GG3 4
}HH 	
publicII 
asyncII 
TaskII %
GenerateAppointmentLetterII 3
(II3 4
AppointmentLetterII4 E
appointmentLetterIIF W
)IIW X
{JJ 	
stringKK 
inputFileNameKK  
;KK  !
stringLL 
inputFilePathLL  
;LL  !
stringMM 
outputFileNameMM !
;MM! "
ifOO 
(OO 
ApplicationSettingsOO #
.OO# $
CurrentOO$ +
.OO+ , 
AllowedLegalBranchesOO, @
.OO@ A
ContainsOOA I
(OOI J
appointmentLetterOOJ [
.OO[ \
LegalBranchNameOO\ k
)OOk l
)OOl m
{PP 

DictionaryQQ 
<QQ 
stringQQ !
,QQ! "
objectQQ# )
>QQ) *
myFormFieldsQQ+ 7
=QQ8 9
appointmentLetterQQ: K
.QQK L
MyFormFieldsQQL X
;QQX Y
inputFileNameRR 
=RR 
$"RR  "
{RR" #
appointmentLetterRR# 4
.RR4 5
LegalBranchNameRR5 D
}RRD E
$strRRE I
"RRI J
;RRJ K
inputFilePathSS 
=SS 
PathSS  $
.SS$ %
CombineSS% ,
(SS, -
rootFilePathSS- 9
,SS9 :
$strSS; F
,SSF G
$strSSH \
)SS\ ]
;SS] ^
inputFileNameTT 
=TT 
stringTT  &
.TT& '
FormatTT' -
(TT- .
$strTT. 8
,TT8 9
inputFilePathTT: G
,TTG H
inputFileNameTTI V
)TTV W
;TTW X
outputFileNameUU 
=UU  
stringUU! '
.UU' (
FormatUU( .
(UU. /
$strUU/ 8
,UU8 9
appointmentLetterUU: K
.UUK L
EmployeeNumberUUL Z
,UUZ [
$strUU\ t
)UUt u
;UUu v
outputFileNameVV 
=VV  
stringVV! '
.VV' (
FormatVV( .
(VV. /
$strVV/ @
,VV@ A
S3BucketSettingsVVB R
.VVR S
CurrentVVS Z
.VVZ [
EmployeesFolderVV[ j
,VVj k
appointmentLetterVVl }
.VV} ~

EmployeeId	VV~ à
,
VVà â
$str
VVä ò
,
VVò ô
outputFileName
VVö ®
)
VV® ©
;
VV© ™
ifWW 
(WW 
appointmentLetterWW %
.WW% &
AppointmentNumberWW& 7
.WW7 8
IsNotNullOrEmptyWW8 H
(WWH I
)WWI J
)WWJ K
{XX 
MemoryStreamYY  
finalStreamYY! ,
=YY- .
SetFieldValuesYY/ =
(YY= >
myFormFieldsYY> J
,YYJ K
inputFileNameYYL Y
,YYY Z
inputFilePathYY[ h
,YYh i
appointmentLetterYYj {
.YY{ |
EmployeeNumber	YY| ä
)
YYä ã
;
YYã å
awaitZZ 
UploadFileAsyncZZ )
(ZZ) *
finalStreamZZ* 5
,ZZ5 6
outputFileNameZZ7 E
)ZZE F
;ZZF G
await[[ )
UpdateAppointmentLetterStatus[[ 7
([[7 8
appointmentLetter[[8 I
.[[I J
EmployeeSlno[[J V
)[[V W
;[[W X
}\\ 
}]] 
}^^ 	
private`` 
async`` 
Task`` )
UpdateAppointmentLetterStatus`` 8
(``8 9
int``9 <
employeeNumber``= K
)``K L
{aa 	
awaitbb *
employeeInformationApplicationbb 0
.bb0 1)
UpdateAppointmentLetterStatusbb1 N
(bbN O
employeeNumberbbO ]
)bb] ^
;bb^ _
}cc 	
privateee 
MemoryStreamee 
SetFieldValuesee +
(ee+ ,

Dictionaryee, 6
<ee6 7
stringee7 =
,ee= >
objectee? E
>eeE F
	fieldDataeeG P
,eeP Q
stringeeR X
templatePatheeY e
,eee f
stringeeg m

outputPatheen x
,eex y
string	eez Ä
employeeNumber
eeÅ è
)
eeè ê
{ff 	
Fontgg 
boldgg 
=gg 
FontFactorygg #
.gg# $
GetFontgg$ +
(gg+ ,
FontFactorygg, 7
.gg7 8
HELVETICA_BOLDgg8 F
,ggF G
$numggH J
,ggJ K
FontggL P
.ggP Q
BOLDggQ U
)ggU V
;ggV W
	PdfReaderhh 
readerhh 
=hh 
newhh "
	PdfReaderhh# ,
(hh, -
templatePathhh- 9
)hh9 :
;hh: ;
varii 
outputFilePathii 
=ii  
Pathii! %
.ii% &
Combineii& -
(ii- .

outputPathii. 8
,ii8 9
$"ii: <
{ii< =
employeeNumberii= K
}iiK L
$striiL c
"iic d
)iid e
.iie f
ToStringiif n
(iin o
)iio p
;iip q

FileStreamjj 
fsjj 
=jj 
newjj 

FileStreamjj  *
(jj* +
outputFilePathjj+ 9
,jj9 :
FileModejj; C
.jjC D
	CreateNewjjD M
,jjM N

FileAccessjjO Y
.jjY Z
	ReadWritejjZ c
)jjc d
;jjd e

PdfStamperkk 
stamperkk 
=kk  
newkk! $

PdfStamperkk% /
(kk/ 0
readerkk0 6
,kk6 7
fskk8 :
)kk: ;
;kk; <

AcroFieldsll 
fieldStamperll #
=ll$ %
stamperll& -
.ll- .

AcroFieldsll. 8
;ll8 9
foreachnn 
(nn 
varnn 
datann 
innn  
	fieldDatann! *
)nn* +
{oo 
fieldStamperpp 
.pp 
SetFieldPropertypp -
(pp- .
datapp. 2
.pp2 3
Keypp3 6
,pp6 7
$strpp8 B
,ppB C
boldppD H
.ppH I
BaseFontppI Q
,ppQ R
nullppS W
)ppW X
;ppX Y
fieldStamperqq 
.qq 
SetFieldqq %
(qq% &
dataqq& *
.qq* +
Keyqq+ .
,qq. /
dataqq0 4
.qq4 5
Valueqq5 :
.qq: ;
ToStringqq; C
(qqC D
)qqD E
)qqE F
;qqF G
}rr 
stampertt 
.tt 
Writertt 
.tt 
CompressionLeveltt +
=tt, -
	PdfStreamtt. 7
.tt7 8
BEST_COMPRESSIONtt8 H
;ttH I
stamperuu 
.uu 
Writeruu 
.uu 
SetFullCompressionuu -
(uu- .
)uu. /
;uu/ 0
stampervv 
.vv 
FormFlatteningvv "
=vv# $
truevv% )
;vv) *
stamperww 
.ww 
Closeww 
(ww 
)ww 
;ww 
fsxx 
.xx 
Closexx 
(xx 
)xx 
;xx 
readeryy 
.yy 
Closeyy 
(yy 
)yy 
;yy 
MemoryStreamzz 
mszz 
=zz 
newzz !
MemoryStreamzz" .
(zz. /
Filezz/ 3
.zz3 4
ReadAllByteszz4 @
(zz@ A
outputFilePathzzA O
)zzO P
)zzP Q
;zzQ R
File{{ 
.{{ 
Delete{{ 
({{ 
outputFilePath{{ &
){{& '
;{{' (
return|| 
ms|| 
;|| 
}~~ 	
public 
async 
Task 
< 
bool 
> 
UploadFileAsync  /
(/ 0
System0 6
.6 7
IO7 9
.9 :
Stream: @
inputStreamA L
,L M
stringN T
fileNameU ]
)] ^
{
ÄÄ 	
try
ÅÅ 
{
ÇÇ 
inputStream
ÉÉ 
.
ÉÉ 
Seek
ÉÉ  
(
ÉÉ  !
$num
ÉÉ! "
,
ÉÉ" #

SeekOrigin
ÉÉ$ .
.
ÉÉ. /
Begin
ÉÉ/ 4
)
ÉÉ4 5
;
ÉÉ5 6
PutObjectRequest
ÑÑ  
request
ÑÑ! (
=
ÑÑ) *
new
ÑÑ+ .
PutObjectRequest
ÑÑ/ ?
(
ÑÑ? @
)
ÑÑ@ A
{
ÖÖ 
InputStream
ÜÜ 
=
ÜÜ  !
inputStream
ÜÜ" -
,
ÜÜ- .

BucketName
áá 
=
áá  
S3BucketSettings
áá! 1
.
áá1 2
Current
áá2 9
.
áá9 :

BucketName
áá: D
,
ááD E
Key
àà 
=
àà 
fileName
àà "
}
ââ 
;
ââ 
PutObjectResponse
ää !
response
ää" *
=
ää+ ,
await
ää- 2
	_s3Client
ää3 <
.
ää< =
PutObjectAsync
ää= K
(
ääK L
request
ääL S
)
ääS T
;
ääT U
if
ãã 
(
ãã 
response
ãã 
.
ãã 
HttpStatusCode
ãã +
==
ãã, .
System
ãã/ 5
.
ãã5 6
Net
ãã6 9
.
ãã9 :
HttpStatusCode
ãã: H
.
ããH I
OK
ããI K
)
ããK L
return
åå 
true
åå 
;
åå  
else
çç 
return
éé 
false
éé  
;
éé  !
}
èè 
catch
êê 
(
êê 
	Exception
êê 
ex
êê 
)
êê  
{
ëë 
throw
ìì 
ex
ìì 
;
ìì 
}
îî 
}
ïï 	
}
óó 
}òò ÍG
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\CronJobs\EmailNotificationJob.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
CronJobs &
{ 
public 

class  
EmailNotificationJob %
:& '
CronJobService( 6
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly !
ISendEmailApplication . 
sendEmailApplication/ C
;C D
private 
bool 
isFlag 
= 
true "
;" #
public  
EmailNotificationJob #
(# $
IScheduleConfig$ 3
<3 4 
EmailNotificationJob4 H
>H I
configJ P
,P Q
ILoggerManagerR `
loggera g
,g h!
ISendEmailApplicationi ~!
sendEmailApplication	 ì
)
ì î
: 
base 
( 
config 
. 
CronExpression (
,( )
config* 0
.0 1
TimeZoneInfo1 =
)= >
{ 	
this 
. 
logger 
= 
logger 
; 
this 
.  
sendEmailApplication %
=% & 
sendEmailApplication& :
;: ;
}   	
public"" 
override"" 
async"" 
Task"" "

StartAsync""# -
(""- .
CancellationToken"". ?
cancellationToken""@ Q
)""Q R
{## 	
logger$$ 
.$$ 
LogInfo$$ 
($$ 
$str$$ ;
)$$; <
;$$< =
await%% 
base%% 
.%% 

StartAsync%% !
(%%! "
cancellationToken%%" 3
)%%3 4
;%%4 5
}&& 	
public(( 
override(( 
async(( 
Task(( "
DoWork((# )
((() *
CancellationToken((* ;
cancellationToken((< M
)((M N
{)) 	
logger** 
.** 
LogInfo** 
(** 
string** !
.**! "
Format**" (
(**( )
$str**) S
,**S T
DateTime**U ]
.**] ^
Now**^ a
.**a b
ToString**b j
(**j k
$str**k n
)**n o
)**o p
)**p q
;**q r
if++ 
(++ 
isFlag++ 
)++ 
{,, 
List-- 
<-- 
EmailDetails-- !
>--! "
pendingEmails--# 0
=--1 2
await--3 8 
sendEmailApplication--9 M
.--M N
GetPendingEmails--N ^
(--^ _
)--_ `
;--` a
if.. 
(.. 
JobSettings.. 
...  
Current..  '
...' (
SendEmialJob..( 4
&&..5 7
pendingEmails..8 E
...E F
Count..F K
>..L M
$num..M N
)..N O
{// 
isFlag00 
=00 
false00 "
;00" #
await11 !
SendEmailNotification11 /
(11/ 0
pendingEmails110 =
)11= >
;11> ?
}22 
isFlag33 
=33 
true33 
;33 
}55 
}66 	
public88 
override88 
async88 
Task88 "
	StopAsync88# ,
(88, -
CancellationToken88- >
cancellationToken88? P
)88P Q
{99 	
logger:: 
.:: 
LogInfo:: 
(:: 
$str:: =
)::= >
;::> ?
await;; 
base;; 
.;; 
	StopAsync;;  
(;;  !
cancellationToken;;! 2
);;2 3
;;;3 4
}<< 	
public>> 
async>> 
Task>> !
SendEmailNotification>> /
(>>/ 0
List>>0 4
<>>4 5
EmailDetails>>5 A
>>>A B
pendingEmails>>C P
)>>P Q
{?? 	
List@@ 
<@@ 
string@@ 
>@@ 
toEmailAddresses@@ )
=@@* +
null@@, 0
;@@0 1
ListAA 
<AA 
stringAA 
>AA 
ccEmailAddressesAA )
=AA* +
nullAA, 0
;AA0 1
ifBB 
(BB 
JobSettingsBB 
.BB 
CurrentBB #
.BB# $
SendEmialJobBB$ 0
)BB0 1
{CC 
ifDD 
(DD 
ApplicationSettingsDD '
.DD' (
CurrentDD( /
.DD/ 0
EnvironmentDD0 ;
.DD; <
ToUpperDD< C
(DDC D
)DDD E
==DDF H
$strDDI O
)DDO P
{EE 
foreachFF 
(FF 
varFF  
itemFF! %
inFF& (
pendingEmailsFF) 6
)FF6 7
{GG 
toEmailAddressesHH (
=HH) *
itemHH+ /
.HH/ 0
TOEMPLOYEEEMAILHH0 ?
.HH? @
SplitHH@ E
(HHE F
$strHHF I
,HHI J
StringSplitOptionsHHK ]
.HH] ^
RemoveEmptyEntriesHH^ p
)HHp q
.HHq r
ToListHHr x
(HHx y
)HHy z
;HHz {
ccEmailAddressesII (
=II) *
itemII+ /
.II/ 0
CCEMPLOYEEEMAILII0 ?
.II? @
SplitII@ E
(IIE F
$strIIF I
,III J
StringSplitOptionsIIK ]
.II] ^
RemoveEmptyEntriesII^ p
)IIp q
.IIq r
ToListIIr x
(IIx y
)IIy z
;IIz {
awaitKK 
	SendEmailKK '
(KK' (
itemKK( ,
.KK, -
SUBJECTKK- 4
,KK4 5
itemKK6 :
.KK: ;
	EMAILBODYKK; D
,KKD E
toEmailAddressesKKF V
.KKV W
ToArrayKKW ^
(KK^ _
)KK_ `
,KK` a
ccEmailAddressesKKb r
.KKr s
ToArrayKKs z
(KKz {
)KK{ |
)KK| }
;KK} ~
}LL 
}MM 
elseNN 
{OO 
foreachPP 
(PP 
varPP  
itemPP! %
inPP& (
pendingEmailsPP) 6
)PP6 7
{QQ 
toEmailAddressesRR (
=RR) *
EmailConfigurationRR+ =
.RR= >
CurrentRR> E
.RRE F
ToEmailAddressRRF T
.RRT U
SplitRRU Z
(RRZ [
$strRR[ ^
,RR^ _
StringSplitOptionsRR` r
.RRr s
RemoveEmptyEntries	RRs Ö
)
RRÖ Ü
.
RRÜ á
ToList
RRá ç
(
RRç é
)
RRé è
;
RRè ê
ccEmailAddressesSS (
=SS) *
EmailConfigurationSS+ =
.SS= >
CurrentSS> E
.SSE F
CcEmailAddressSSF T
.SST U
SplitSSU Z
(SSZ [
$strSS[ ^
,SS^ _
StringSplitOptionsSS` r
.SSr s
RemoveEmptyEntries	SSs Ö
)
SSÖ Ü
.
SSÜ á
ToList
SSá ç
(
SSç é
)
SSé è
;
SSè ê
awaitUU 
	SendEmailUU '
(UU' (
itemUU( ,
.UU, -
SUBJECTUU- 4
,UU4 5
itemUU6 :
.UU: ;
	EMAILBODYUU; D
,UUD E
toEmailAddressesUUF V
.UUV W
ToArrayUUW ^
(UU^ _
)UU_ `
,UU` a
ccEmailAddressesUUb r
.UUr s
ToArrayUUs z
(UUz {
)UU{ |
)UU| }
;UU} ~
}VV 
}WW 
}]] 
isFlag^^ 
=^^ 
true^^ 
;^^ 
}__ 	
privateaa 
asyncaa 
Taskaa 
	SendEmailaa $
(aa$ %
stringaa% +
mailSubjectaa, 7
,aa7 8
stringaa9 ?
mailBodyaa@ H
,aaH I
stringaaJ P
[aaP Q
]aaQ R
toEmailAddressesaaS c
,aac d
stringaae k
[aak l
]aal m
ccEmailAddressesaan ~
)aa~ 
{bb 	
SendEmailServicecc 
sendEmailServicecc -
=cc. /
newcc0 3
SendEmailServicecc4 D
(ccD E
)ccE F
;ccF G
sendEmailServicedd 
.dd 
EmailSubjectdd )
=dd* +
mailSubjectdd, 7
;dd7 8
sendEmailServiceee 
.ee 
	EmailBodyee &
=ee' (
mailBodyee) 1
;ee1 2
sendEmailServiceff 
.ff 
ToEmailAddressesff -
=ff. /
toEmailAddressesff0 @
;ff@ A
sendEmailServicegg 
.gg 
CCEmailAddressesgg -
=gg. /
ccEmailAddressesgg0 @
;gg@ A
awaithh 
sendEmailServicehh "
.hh" #
	SendEmailhh# ,
(hh, -
)hh- .
;hh. /
}
çç 	
}
êê 
}ëë ‘7
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\CronJobs\GenerateEmailOTPJob.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
CronJobs &
{ 
public 

class 
GenerateEmailOTPJob $
:% &
CronJobService' 5
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly !
ISendEmailApplication . 
sendEmailApplication/ C
;C D
private 
bool 
isFlag 
= 
true "
;" #
public 
GenerateEmailOTPJob "
(" #
IScheduleConfig# 2
<2 3 
EmailNotificationJob3 G
>G H
configI O
,O P
ILoggerManagerQ _
logger` f
,f g!
ISendEmailApplicationh }!
sendEmailApplication	~ í
)
í ì
: 
base 
( 
config 
. 
CronExpression (
,( )
config* 0
.0 1
TimeZoneInfo1 =
)= >
{ 	
this 
. 
logger 
= 
logger 
; 
this   
.    
sendEmailApplication   %
=  % & 
sendEmailApplication  & :
;  : ;
}!! 	
public## 
override## 
async## 
Task## "

StartAsync### -
(##- .
CancellationToken##. ?
cancellationToken##@ Q
)##Q R
{$$ 	
logger%% 
.%% 
LogInfo%% 
(%% 
$str%% ;
)%%; <
;%%< =
await&& 
base&& 
.&& 

StartAsync&& !
(&&! "
cancellationToken&&" 3
)&&3 4
;&&4 5
}'' 	
public)) 
override)) 
async)) 
Task)) "
DoWork))# )
())) *
CancellationToken))* ;
cancellationToken))< M
)))M N
{** 	
logger++ 
.++ 
LogInfo++ 
(++ 
string++ !
.++! "
Format++" (
(++( )
$str++) S
,++S T
DateTime++U ]
.++] ^
Now++^ a
.++a b
ToString++b j
(++j k
$str++k n
)++n o
)++o p
)++p q
;++q r
if,, 
(,, 
isFlag,, 
),, 
{-- 
isFlag.. 
=.. 
false.. 
;.. 
List// 
<//  
EmailOtpVerification// )
>//) *
pendingEmails//+ 8
=//9 :
await//; @ 
sendEmailApplication//A U
.//U V
GetPendingOTPEmails//V i
(//i j
)//j k
;//k l
if00 
(00 
JobSettings00 
.00  
Current00  '
.00' (
SendOTPEmail00( 4
&&005 7
pendingEmails008 E
.00E F
Count00F K
>00L M
$num00N O
)00O P
{11 
await22 $
SendOTPEmailNotification22 2
(222 3
pendingEmails223 @
)22@ A
;22A B
}33 
else44 
{55 
isFlag66 
=66 
true66 !
;66! "
}77 
}88 
}99 	
public;; 
override;; 
async;; 
Task;; "
	StopAsync;;# ,
(;;, -
CancellationToken;;- >
cancellationToken;;? P
);;P Q
{<< 	
logger== 
.== 
LogInfo== 
(== 
$str== =
)=== >
;==> ?
await>> 
base>> 
.>> 
	StopAsync>>  
(>>  !
cancellationToken>>! 2
)>>2 3
;>>3 4
}?? 	
publicAA 
asyncAA 
TaskAA $
SendOTPEmailNotificationAA 2
(AA2 3
ListAA3 7
<AA7 8 
EmailOtpVerificationAA8 L
>AAL M
pendingEmailsAAN [
)AA[ \
{BB 	
ListDD 
<DD 
stringDD 
>DD 
toEmailAddressesDD )
=DD* +
nullDD, 0
;DD0 1
ifFF 
(FF 
JobSettingsFF 
.FF 
CurrentFF #
.FF# $
SendOTPEmailFF$ 0
)FF0 1
{GG 
foreachHH 
(HH 
varHH 
itemHH !
inHH" $
pendingEmailsHH% 2
)HH2 3
{II 
toEmailAddressesJJ $
=JJ% &
itemJJ' +
.JJ+ ,
ToEmployeeEmailJJ, ;
.JJ; <
SplitJJ< A
(JJA B
$strJJB E
,JJE F
StringSplitOptionsJJG Y
.JJY Z
RemoveEmptyEntriesJJZ l
)JJl m
.JJm n
ToListJJn t
(JJt u
)JJu v
;JJv w
awaitLL 
	SendEmailLL #
(LL# $
itemLL$ (
.LL( )
SubjectLL) 0
,LL0 1
itemLL2 6
.LL6 7
	EmailbodyLL7 @
,LL@ A
itemLLB F
.LLF G
FromEmployeeEmailLLG X
,LLX Y
toEmailAddressesLLZ j
.LLj k
ToArrayLLk r
(LLr s
)LLs t
)LLt u
;LLu v
}MM 
}SS 
isFlagTT 
=TT 
trueTT 
;TT 
}UU 	
privateWW 
asyncWW 
TaskWW 
	SendEmailWW $
(WW$ %
stringWW% +
mailSubjectWW, 7
,WW7 8
stringWW9 ?
mailBodyWW@ H
,WWH I
stringWWJ P
fromEmailAddressWWQ a
,WWa b
stringWWc i
[WWi j
]WWj k
toEmailAddressesWWl |
)WW| }
{XX 	
SendEmailServiceYY 
sendEmailServiceYY -
=YY. /
newYY0 3
SendEmailServiceYY4 D
(YYD E
)YYE F
;YYF G
sendEmailServiceZZ 
.ZZ 
EmailSubjectZZ )
=ZZ* +
mailSubjectZZ, 7
;ZZ7 8
sendEmailService[[ 
.[[ 
	EmailBody[[ &
=[[' (
mailBody[[) 1
;[[1 2
sendEmailService\\ 
.\\ 
ToEmailAddresses\\ -
=\\. /
toEmailAddresses\\0 @
;\\@ A
sendEmailService]] 
.]] 
CCEmailAddresses]] -
=]]. /
new]]0 3
List]]4 8
<]]8 9
string]]9 ?
>]]? @
(]]@ A
)]]A B
{]]C D
fromEmailAddress]]E U
}]]V W
.]]W X
ToArray]]X _
(]]_ `
)]]` a
;]]a b
await^^ 
sendEmailService^^ "
.^^" #
	SendEmail^^# ,
(^^, -
)^^- .
;^^. /
}|| 	
} 
}ÄÄ „-
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\CronJobs\NotificationJob.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
CronJobs &
{ 
public 

class 
NotificationJob  
:! "
CronJobService# 1
{ 
private 
readonly 
IScheduleConfig (
<( ) 
EmailNotificationJob) =
>= >
config? E
;E F
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly 
IMemoryCache %
memoryCache& 1
;1 2
private   
readonly   
IHubContext   $
<  $ %

SignalrHub  % /
>  / 0
hub  1 4
;  4 5
private!! 
readonly!! $
INotificationApplication!! 1#
notificationApplication!!2 I
;!!I J
private"" 
bool"" 
isFlag"" 
="" 
true"" "
;""" #
public$$ 
NotificationJob$$ 
($$ 
IScheduleConfig$$ .
<$$. / 
EmailNotificationJob$$/ C
>$$C D
config$$E K
,$$K L
ILoggerManager$$M [
logger$$\ b
,$$b c
IMemoryCache$$d p
memoryCache$$q |
,$$| }
IHubContext	$$~ â
<
$$â ä

SignalrHub
$$ä î
>
$$î ï
hub
$$ñ ô
,
$$ô ö&
INotificationApplication
$$õ ≥%
notificationApplication
$$¥ À
)
$$À Ã
:%% 
base%% 
(%% 
config%% 
.%% 
CronExpression%% (
,%%( )
config%%* 0
.%%0 1
TimeZoneInfo%%1 =
)%%= >
{&& 	
this'' 
.'' 
config'' 
='' 
config'' 
;'' 
this(( 
.(( 
logger(( 
=(( 
logger(( 
;(( 
this)) 
.)) 
memoryCache)) 
=)) 
memoryCache)) (
;))( )
this** 
.** 
hub** 
=** 
hub** 
;** 
this++ 
.++ #
notificationApplication++ (
=++( )#
notificationApplication++) @
;++@ A
},, 	
public.. 
override.. 
async.. 
Task.. "

StartAsync..# -
(..- .
CancellationToken... ?
cancellationToken..@ Q
)..Q R
{// 	
logger00 
.00 
LogInfo00 
(00 
$str00 ;
)00; <
;00< =
await11 
base11 
.11 

StartAsync11 !
(11! "
cancellationToken11" 3
)113 4
;114 5
}22 	
public44 
override44 
async44 
Task44 "
DoWork44# )
(44) *
CancellationToken44* ;
cancellationToken44< M
)44M N
{55 	
logger66 
.66 
LogInfo66 
(66 
string66 !
.66! "
Format66" (
(66( )
$str66) S
,66S T
DateTime66U ]
.66] ^
Now66^ a
.66a b
ToString66b j
(66j k
$str66k n
)66n o
)66o p
)66p q
;66q r
if77 
(77 
isFlag77 
)77 
{88 

Dictionary99 
<99 
string99 !
,99! "
string99# )
>99) *

hubClients99+ 5
=996 7
memoryCache998 C
.99C D
Get99D G
(99G H
$str99H T
)99T U
as99V X

Dictionary99Y c
<99c d
string99d j
,99j k
string99l r
>99r s
;99s t
if:: 
(:: 

hubClients:: 
!=:: !
null::" &
)::& '
{;; 
foreach<< 
(<< 
KeyValuePair<< )
<<<) *
string<<* 0
,<<0 1
string<<2 8
><<8 9
item<<: >
in<<? A

hubClients<<B L
)<<L M
{== 
int>> 
employeeSlno>> (
=>>) *
item>>+ /
.>>/ 0
Value>>0 5
.>>5 6
ToInt32OrDefault>>6 F
(>>F G
)>>G H
;>>H I
List?? 
<?? 
NotificationDetail?? /
>??/ 0
notifications??1 >
=??? @
await??A F#
notificationApplication??G ^
.??^ _
GetNotifications??_ o
(??o p
employeeSlno??p |
)??| }
;??} ~
await@@ 
hub@@ !
.@@! "
Clients@@" )
.@@) *
Clients@@* 1
(@@1 2
item@@2 6
.@@6 7
Key@@7 :
)@@: ;
.@@; <
	SendAsync@@< E
(@@E F
$str@@F Y
,@@Y Z
notifications@@[ h
)@@h i
;@@i j
}AA 
}BB 
isFlagCC 
=CC 
trueCC 
;CC 
}DD 
}EE 	
publicGG 
overrideGG 
asyncGG 
TaskGG "
	StopAsyncGG# ,
(GG, -
CancellationTokenGG- >
cancellationTokenGG? P
)GGP Q
{HH 	
loggerII 
.II 
LogInfoII 
(II 
$strII =
)II= >
;II> ?
awaitJJ 
baseJJ 
.JJ 
	StopAsyncJJ  
(JJ  !
cancellationTokenJJ! 2
)JJ2 3
;JJ3 4
}KK 	
}
òò 
}ôô “$
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\CronJobs\VisitorCountJob.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
CronJobs &
{ 
public 

class 
VisitorCountJob  
:! "
CronJobService# 1
{ 
private 
readonly 
IScheduleConfig (
<( )
VisitorCountJob) 8
>8 9
config: @
;@ A
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly 
IMemoryCache %
memoryCache& 1
;1 2
private 
readonly 
IHubContext $
<$ %

SignalrHub% /
>/ 0
hub1 4
;4 5
private 
readonly #
IVistorCountApplication 0#
visitorCountApplication1 H
;H I
private 
bool 
isFlag 
= 
true "
;" #
public 
VisitorCountJob 
( 
IScheduleConfig .
<. /
VisitorCountJob/ >
>> ?
config@ F
,F G
ILoggerManagerH V
loggerW ]
,] ^
IMemoryCache_ k
memoryCachel w
,w x
IHubContext	y Ñ
<
Ñ Ö

SignalrHub
Ö è
>
è ê
hub
ë î
,
î ï%
IVistorCountApplication
ñ ≠%
visitorCountApplication
Æ ≈
)
≈ ∆
: 
base 
( 
config 
. 
CronExpression (
,( )
config* 0
.0 1
TimeZoneInfo1 =
)= >
{ 	
this 
. 
config 
= 
config 
; 
this 
. 
logger 
= 
logger 
; 
this 
. 
memoryCache 
= 
memoryCache (
;( )
this 
. 
hub 
= 
hub 
; 
this 
. #
visitorCountApplication (
=( )#
visitorCountApplication) @
;@ A
}   	
public"" 
override"" 
async"" 
Task"" "

StartAsync""# -
(""- .
CancellationToken"". ?
cancellationToken""@ Q
)""Q R
{## 	
logger$$ 
.$$ 
LogInfo$$ 
($$ 
$str$$ ;
)$$; <
;$$< =
await%% 
base%% 
.%% 

StartAsync%% !
(%%! "
cancellationToken%%" 3
)%%3 4
;%%4 5
}&& 	
public(( 
override(( 
async(( 
Task(( "
DoWork((# )
((() *
CancellationToken((* ;
cancellationToken((< M
)((M N
{)) 	
logger** 
.** 
LogInfo** 
(** 
string** !
.**! "
Format**" (
(**( )
$str**) S
,**S T
DateTime**U ]
.**] ^
Now**^ a
.**a b
ToString**b j
(**j k
$str**k n
)**n o
)**o p
)**p q
;**q r
if++ 
(++ 
isFlag++ 
)++ 
{,, 
int-- 

usersCount-- 
=--  
await--! &#
visitorCountApplication--' >
.--> ?
GetVisitorCount--? N
(--N O
)--O P
;--P Q
await.. 
hub.. 
... 
Clients.. !
...! "
All.." %
...% &
	SendAsync..& /
(../ 0
$str..0 A
,..A B

usersCount..C M
)..M N
;..N O
}// 
isFlag00 
=00 
true00 
;00 
}11 	
public33 
override33 
async33 
Task33 "
	StopAsync33# ,
(33, -
CancellationToken33- >
cancellationToken33? P
)33P Q
{44 	
logger55 
.55 
LogInfo55 
(55 
$str55 =
)55= >
;55> ?
await66 
base66 
.66 
	StopAsync66  
(66  !
cancellationToken66! 2
)662 3
;663 4
}77 	
}
ÑÑ 
}ÖÖ »
VF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Extensions.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
{ 
public   

static   
class   

Extensions   "
{!! 
public'' 
static'' 
void'' (
AddDependencyInjectionCustom'' 7
(''7 8
this''8 <
IServiceCollection''= O
services''P X
)''X Y
{(( 	
DependencyInjector)) 
.)) 
RegisterServices)) /
())/ 0
services))0 8
)))8 9
;))9 :
}** 	
}++ 
},, ã(
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\AuthorizeAttribute.cs
	namespace

 	
Phoenix


 
.

 
Web

 
.

 
Service

 
.

 
Helper

 $
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
)D E
]E F
public 

class 
AuthorizeAttribute #
:$ %
	Attribute& /
,/ 0 
IAuthorizationFilter1 E
{ 
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
StringValues $
authorizationTokenHeader 1
;1 2
StringValues 
clientDateHeader )
;) *
DateTime 

clientDate 
=  !
DateTime" *
.* +
MinValue+ 3
;3 4
string 
authorizationToken %
=& '
string( .
.. /
Empty/ 4
;4 5
IJwtAuthManager 
jwtAuthManager *
=+ ,
new- 0
JwtAuthManager1 ?
(? @
)@ A
;A B
var 
user 
= 
( 
UserInformation '
)' (
context( /
./ 0
HttpContext0 ;
.; <
Items< A
[A B
$strB S
]S T
;T U
context 
. 
HttpContext 
.  
Request  '
.' (
Headers( /
./ 0
TryGetValue0 ;
(; <
$str< K
,K L
outM P$
authorizationTokenHeaderQ i
)i j
;j k
context 
. 
HttpContext 
.  
Request  '
.' (
Headers( /
./ 0
TryGetValue0 ;
(; <
$str< K
,K L
outM P
clientDateHeaderQ a
)a b
;b c
DateTime 
. 
TryParse 
( 
clientDateHeader .
,. /
out0 3

clientDate4 >
)> ?
;? @
if 
( $
authorizationTokenHeader '
.' (
Count( -
>. /
$num0 1
&&2 4$
authorizationTokenHeader5 M
.M N
FirstOrDefaultN \
(\ ]
)] ^
.^ _

StartsWith_ i
(i j
$strj s
)s t
)t u
{ 
authorizationToken "
=# $$
authorizationTokenHeader% =
[= >
$num> ?
]? @
;@ A
} 
if 
( 

clientDate 
!= 
DateTime &
.& '
MinValue' /
)/ 0
{   
var!! 

serverDate!! 
=!!  
DateTime!!! )
.!!) *
Now!!* -
;!!- .
if"" 
("" 

serverDate"" 
."" 
Date"" #
!=""$ &

clientDate""' 1
.""1 2
Date""2 6
)""6 7
{## 
context$$ 
.$$ 
Result$$ "
=$$# $
new$$% (

JsonResult$$) 3
($$3 4
new$$4 7
{$$8 9
Title$$: ?
=$$@ A
$str$$B \
,$$\ ]
Message$$^ e
=$$f g
$str	$$h ·
,
$$· ‚
	ErrorCode
$$„ Ï
=
$$Ì Ó
$str
$$Ô Ù
}
$$ı ˆ
)
$$ˆ ˜
{
$$¯ ˘

StatusCode
$$˙ Ñ
=
$$Ö Ü
StatusCodes
$$á í
.
$$í ì!
Status400BadRequest
$$ì ¶
}
$$ß ®
;
$$® ©
return%% 
;%% 
}&& 
}'' 
var(( 
token(( 
=(( $
authorizationTokenHeader(( 0
.((0 1
FirstOrDefault((1 ?
(((? @
)((@ A
?((A B
.((B C
Split((C H
(((H I
$str((I L
)((L M
.((M N
Last((N R
(((R S
)((S T
;((T U
if** 
(** 
!** 
jwtAuthManager** 
.**  
ValidateToken**  -
(**- .
token**. 3
)**3 4
)**4 5
{++ 
context-- 
.-- 
Result-- 
=--  
new--! $

JsonResult--% /
(--/ 0
new--0 3
{--4 5
message--6 =
=--> ?
$str--@ N
}--O P
)--P Q
{--R S

StatusCode--T ^
=--_ `
StatusCodes--a l
.--l m"
Status401Unauthorized	--m Ç
}
--É Ñ
;
--Ñ Ö
}.. 
}// 	
}00 
}11 £8
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\AwsEmailService\SendEmailService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %
AwsEmailService% 4
{ 
public 

class 
SendEmailService !
{ 
public 
string 
[ 
] 
ToEmailAddresses (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
[ 
] 
CCEmailAddresses (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
EmailSubject "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
	EmailBody 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
AWSAccessKey "
{# $
get% (
;( )
}* +
public 
string 
AWSSecretKey "
{# $
get% (
;( )
}* +
private 
readonly 
RegionEndpoint '
region( .
;. /
private 
readonly 
BasicAWSCredentials ,
creds- 2
;2 3
private 
readonly 
string 
SMTP_USERNAME  -
;- .
private 
readonly 
string 
SMTP_PASSWORD  -
;- .
private 
readonly 
string 
HOST  $
;$ %
private 
readonly 
int 
PORT !
;! "
private 
readonly 
bool 
	EnableSsl '
;' (
private 
readonly 
string 
FromEmailAddress  0
;0 1
private 
readonly 
string 
FROMNAME  (
;( )
public   
SendEmailService   
(    
)    !
{!! 	
AWSAccessKey"" 
="" 
AwsEmailSettings"" +
.""+ ,
Current"", 3
.""3 4
UserName""4 <
;""< =
AWSSecretKey## 
=## 
AwsEmailSettings## +
.##+ ,
Current##, 3
.##3 4
Password##4 <
;##< =
region$$ 
=$$ 
RegionEndpoint$$ #
.$$# $
APSouth1$$$ ,
;$$, -
creds%% 
=%% 
new%% 
BasicAWSCredentials%% +
(%%+ ,
AWSAccessKey%%, 8
,%%8 9
AWSSecretKey%%: F
)%%F G
;%%G H
SMTP_USERNAME&& 
=&& 
AWSAccessKey&& (
;&&( )
SMTP_PASSWORD'' 
='' 
AWSSecretKey'' (
;''( )
HOST(( 
=(( 
AwsEmailSettings(( #
.((# $
Current(($ +
.((+ ,
Host((, 0
;((0 1
PORT)) 
=)) 
AwsEmailSettings)) #
.))# $
Current))$ +
.))+ ,
Port)), 0
;))0 1
	EnableSsl** 
=** 
true** 
;** 
FromEmailAddress++ 
=++ 
AwsEmailSettings++ /
.++/ 0
Current++0 7
.++7 8
	FromEmail++8 A
;++A B
FROMNAME,, 
=,, 
AwsEmailSettings,, '
.,,' (
Current,,( /
.,,/ 0
	FromEmail,,0 9
;,,9 :
}-- 	
public.. 
async.. 
Task.. 
	SendEmail.. #
(..# $
)..$ %
{// 	
try00 
{11 

RawMessage22 

rawMessage22 %
=22& '
new22( +

RawMessage22, 6
(226 7
)227 8
;228 9
MailMessage33 
message33 #
=33$ %
new33& )
MailMessage33* 5
(335 6
)336 7
;337 8
message44 
.44 

IsBodyHtml44 "
=44# $
true44% )
;44) *
message55 
.55 
From55 
=55 
new55 "
MailAddress55# .
(55. /
FromEmailAddress55/ ?
,55? @
FROMNAME55A I
)55I J
;55J K
message66 
.66 
Subject66 
=66  !
EmailSubject66" .
;66. /
message77 
.77 
Body77 
=77 
	EmailBody77 (
;77( )
foreach88 
(88 
var88 
s88 
in88 !
from88" &
string88' -
s88. /
in880 2
ToEmailAddresses883 C
where99" '
s99( )
.99) *
IsValidEmail99* 6
(996 7
)997 8
select::" (
s::) *
)::* +
{;; 
message<< 
.<< 
To<< 
.<< 
Add<< "
(<<" #
new<<# &
MailAddress<<' 2
(<<2 3
s<<3 4
)<<4 5
)<<5 6
;<<6 7
}== 
foreach>> 
(>> 
var>> 
s>> 
in>> !
from>>" &
string>>' -
s>>. /
in>>0 2
CCEmailAddresses>>3 C
where??" '
s??( )
.??) *
IsValidEmail??* 6
(??6 7
)??7 8
select@@" (
s@@) *
)@@* +
{AA 
messageBB 
.BB 
CCBB 
.BB 
AddBB "
(BB" #
newBB# &
MailAddressBB' 2
(BB2 3
sBB3 4
)BB4 5
)BB5 6
;BB6 7
}CC 
ifDD 
(DD 
messageDD 
.DD 
ToDD 
.DD 
CountDD $
>DD% &
$numDD' (
)DD( )
{EE 
usingFF 
(FF 
varFF 
clientFF %
=FF& '
newFF( +

SmtpClientFF, 6
(FF6 7
HOSTFF7 ;
,FF; <
PORTFF= A
)FFA B
)FFB C
{GG 
clientII 
.II 
CredentialsII *
=II+ ,
newII, /
NetworkCredentialII0 A
(IIA B
SMTP_USERNAMEIIB O
,IIO P
SMTP_PASSWORDIIQ ^
)II^ _
;II_ `
clientJJ 
.JJ 
	EnableSslJJ (
=JJ) *
	EnableSslJJ+ 4
;JJ4 5
awaitKK 
clientKK $
.KK$ %
SendMailAsyncKK% 2
(KK2 3
messageKK3 :
)KK: ;
;KK; <
}LL 
}NN 
}OO 
catchPP 
(PP 
SystemPP 
.PP 
	ExceptionPP #
exPP$ &
)PP& '
{QQ 
}TT 
}UU 	
}VV 
}WW ˘
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\AwsHelper\DirectoryData.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %
	AwsHelper% .
{ 
public 

class 
DirectoryData 
:  "
AbstractFileSystemItem! 7
{ 
public 
static 
DirectoryData #
Virtual$ +
(+ ,
string, 2

virtualDir3 =
)= >
{		 	
return

 
new

 
DirectoryData

 $
{

% &
Name

' +
=

, -

virtualDir

. 8
.

8 9
Trim

9 =
(

= >
$char

> A
,

A B
$char

C F
)

F G
,

G H
VirtualPath

I T
=

U V

virtualDir

W a
}

b c
;

c d
} 	
} 
} Í
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\AwsHelper\FileData.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %
	AwsHelper% .
{ 
public 

abstract 
class "
AbstractFileSystemItem 0
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
RootPath 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
VirtualPath !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
Created 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
Updated 
{  !
get" %
;% &
set' *
;* +
}, -
} 
public 

class 
FileData 
: "
AbstractFileSystemItem 2
{ 
public 
long 
Length 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ∆C
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\AwsHelper\HierarchyNode.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %
	AwsHelper% .
{ 
[ 
DebuggerDisplay 
( 
$str 1
)1 2
]2 3
public 

class 
HierarchyNode 
< 
T  
>  !
{ 
public 
HierarchyNode 
( 
T 
current &
)& '
{ 	
Current 
= 
current 
; 
Children 
= 
new 
List 
<  
HierarchyNode  -
<- .
T. /
>/ 0
>0 1
(1 2
)2 3
;3 4
} 	
public 
HierarchyNode 
( 
T 
current &
,& '
IEnumerable( 3
<3 4
HierarchyNode4 A
<A B
TB C
>C D
>D E
childrenF N
)N O
{ 	
Current 
= 
current 
; 
Children 
= 
new 
List 
<  
HierarchyNode  -
<- .
T. /
>/ 0
>0 1
(1 2
children2 :
): ;
;; <
}   	
public## 
T## 
Current## 
{## 
get## 
;## 
set##  #
;### $
}##% &
public&& 
HierarchyNode&& 
<&& 
T&& 
>&& 
Parent&&  &
{&&' (
get&&) ,
;&&, -
set&&. 1
;&&1 2
}&&3 4
private(( 
IList(( 
<(( 
HierarchyNode(( #
<((# $
T(($ %
>((% &
>((& '
children((( 0
;((0 1
public** 
IList** 
<** 
HierarchyNode** "
<**" #
T**# $
>**$ %
>**% &
Children**' /
{++ 	
get,, 
{,, 
return,, 
children,, !
??,," $
(,,% &
children,,& .
=,,/ 0
new,,1 4
List,,5 9
<,,9 :
HierarchyNode,,: G
<,,G H
T,,H I
>,,I J
>,,J K
(,,K L
),,L M
),,M N
;,,N O
},,P Q
set-- 
{-- 
children-- 
=-- 
value-- "
;--" #
}--$ %
}.. 	
public00 
string00 
ToString00 
(00 
Func00 #
<00# $
T00$ %
,00% &
string00' -
>00- .
begin00/ 4
,004 5
Func006 :
<00: ;
T00; <
,00< =
string00> D
>00D E
indent00F L
,00L M
Func00N R
<00R S
T00S T
,00T U
string00V \
>00\ ]
outdent00^ e
,00e f
Func00g k
<00k l
T00l m
,00m n
string00o u
>00u v
end00w z
)00z {
{11 	
using22 
(22 
var22 
sw22 
=22 
new22 
StringWriter22  ,
(22, -
)22- .
)22. /
{33 
Write44 
(44 
sw44 
,44 
begin44 
,44  
indent44! '
,44' (
outdent44) 0
,440 1
end442 5
)445 6
;446 7
return55 
sw55 
.55 
ToString55 "
(55" #
)55# $
;55$ %
}66 
}77 	
public99 
void99 
Write99 
(99 

TextWriter99 $
writer99% +
,99+ ,
Func99- 1
<991 2
T992 3
,993 4
string995 ;
>99; <
begin99= B
,99B C
Func99D H
<99H I
T99I J
,99J K
string99L R
>99R S
indent99T Z
,99Z [
Func99\ `
<99` a
T99a b
,99b c
string99d j
>99j k
outdent99l s
,99s t
Func99u y
<99y z
T99z {
,99{ |
string	99} É
>
99É Ñ
end
99Ö à
)
99à â
{:: 	
writer;; 
.;; 
Write;; 
(;; 
begin;; 
(;; 
Current;; &
);;& '
);;' (
;;;( )
if<< 
(<< 
Children<< 
.<< 
Count<< 
><<  
$num<<! "
)<<" #
{== 
writer>> 
.>> 
Write>> 
(>> 
indent>> #
(>># $
Current>>$ +
)>>+ ,
)>>, -
;>>- .
foreach?? 
(?? 
var?? 
child?? "
in??# %
Children??& .
)??. /
{@@ 
childAA 
.AA 
WriteAA 
(AA  
writerAA  &
,AA& '
beginAA( -
,AA- .
indentAA/ 5
,AA5 6
outdentAA7 >
,AA> ?
endAA@ C
)AAC D
;AAD E
}BB 
writerCC 
.CC 
WriteCC 
(CC 
outdentCC $
(CC$ %
CurrentCC% ,
)CC, -
)CC- .
;CC. /
}DD 
writerEE 
.EE 
WriteEE 
(EE 
endEE 
(EE 
CurrentEE $
)EE$ %
)EE% &
;EE& '
}FF 	
publicHH 
voidHH 
AddHH 
(HH 
HierarchyNodeHH %
<HH% &
THH& '
>HH' (
nodeHH) -
)HH- .
{II 	
ChildrenJJ 
.JJ 
AddJJ 
(JJ 
nodeJJ 
)JJ 
;JJ 
nodeKK 
.KK 
ParentKK 
=KK 
thisKK 
;KK 
}LL 	
publicOO 
overrideOO 
boolOO 
EqualsOO #
(OO# $
objectOO$ *
objOO+ .
)OO. /
{PP 	
ifQQ 
(QQ 
CurrentQQ 
==QQ 
nullQQ 
)QQ  
returnRR 
falseRR 
;RR 
varSS 
otherSS 
=SS 
objSS 
asSS 
HierarchyNodeSS ,
<SS, -
TSS- .
>SS. /
;SS/ 0
ifTT 
(TT 
otherTT 
==TT 
nullTT 
)TT 
returnUU 
falseUU 
;UU 
returnWW 
CurrentWW 
.WW 
EqualsWW !
(WW! "
otherWW" '
.WW' (
CurrentWW( /
)WW/ 0
;WW0 1
}XX 	
publicYY 
overrideYY 
intYY 
GetHashCodeYY '
(YY' (
)YY( )
{ZZ 	
if[[ 
([[ 
Current[[ 
==[[ 
null[[ 
)[[  
return\\ 
$num\\ 
.\\ 
GetHashCode\\ $
(\\$ %
)\\% &
;\\& '
return]] 
Current]] 
.]] 
GetHashCode]] &
(]]& '
)]]' (
;]]( )
}^^ 	
publicdd 
HierarchyNodedd 
<dd 
Tdd 
>dd 
Clonedd  %
(dd% &
Funcdd& *
<dd* +
Tdd+ ,
,dd, -
booldd. 2
>dd2 3
childSelectordd4 A
=ddB C
nullddD H
)ddH I
{ee 	
varff 
clonedChildrenff 
=ff  
childSelectorff! .
!=ff/ 1
nullff2 6
?gg 
Childrengg 
.gg 
Wheregg  
(gg  !
cgg! "
=>gg# %
childSelectorgg& 3
(gg3 4
cgg4 5
.gg5 6
Currentgg6 =
)gg= >
)gg> ?
:hh 
Childrenhh 
;hh 
returnii 
newii 
HierarchyNodeii $
<ii$ %
Tii% &
>ii& '
(ii' (
Currentii( /
,ii/ 0
clonedChildrenii1 ?
)ii? @
;ii@ A
}jj 	
}kk 
}ll Ñ
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\AwsHelper\IFileSystem.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %
	AwsHelper% .
{ 
public 

	interface 
IFileSystem  
{ 
Task			 
<		 
IEnumerable		 
<		 
FileData		 "
>		" #
>		# $
GetFiles		% -
(		- .
string		. 4
parentVirtualPath		5 F
)		F G
;		G H
Task

	 
<

 
FileData

 
>

 
GetFile

 
(

  
string

  &
virtualPath

' 2
)

2 3
;

3 4
Task	 
< 
IEnumerable 
< 
DirectoryData '
>' (
>( )
GetDirectories* 8
(8 9
string9 ?
parentVirtualPath@ Q
)Q R
;R S
Task	 
< 
DirectoryData 
> 
GetDirectory )
() *
string* 0
virtualPath1 <
)< =
;= >
Task	 
< 
bool 
> 

FileExists 
( 
string %
virtualPath& 1
)1 2
;2 3
Task	 
MoveFile 
( 
string 
fromVirtualPath -
,- .
string/ 5"
destinationVirtualPath6 L
)L M
;M N
Task	 

DeleteFile 
( 
string 
virtualPath  +
)+ ,
;, -
Task 
CopyFile 
( 
string 
fromVirtualPath ,
,, -
string. 4"
destinationVirtualPath5 K
)K L
;L M
Task	 
< 
Stream 
> 
OpenFile 
( 
string %
virtualPath& 1
,1 2
bool3 7
readOnly8 @
=A B
falseC H
)H I
;I J
Task	 
	WriteFile 
( 
string 
virtualPath *
,* +
Stream, 2
inputStream3 >
)> ?
;? @
Task	 
ReadFileContents 
( 
string %
virtualPath& 1
,1 2
Stream3 9
outputStream: F
)F G
;G H
Task	 
< 
bool 
> 
DirectoryExists #
(# $
string$ *
virtualPath+ 6
)6 7
;7 8
Task	 
MoveDirectory 
( 
string "
fromVirtualPath# 2
,2 3
string4 :"
destinationVirtualPath; Q
)Q R
;R S
Task	 
DeleteDirectory 
( 
string $
virtualPath% 0
)0 1
;1 2
Task	 
CreateDirectory 
( 
string $
virtualPath% 0
)0 1
;1 2
} 
} û¬
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\AwsHelper\S3FileSystem.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %
	AwsHelper% .
{ 
public 

class 
S3FileSystem 
: 
IFileSystem  +
{ 
private 
readonly 
AmazonS3Client '
	_s3Client( 1
;1 2
private 
readonly 
string 
_bucketName  +
;+ ,
private 
const 
string 
RootURL $
=% &
$str' J
;J K
private 
const 
string 
EmptyFilename *
=+ ,
$str- 7
;7 8
public 
S3FileSystem 
( 
) 
{ 	
_bucketName 
= 
S3BucketSettings *
.* +
Current+ 2
.2 3

BucketName3 =
;= >
	_s3Client 
= 
new 
AmazonS3Client *
(* +
S3BucketSettings+ ;
.; <
Current< C
.C D
	AccessKeyD M
,M N
S3BucketSettingsO _
._ `
Current` g
.g h
	SecretKeyh q
,q r
RegionEndpoint	s Å
.
Å Ç
APSouth1
Ç ä
)
ä ã
;
ã å
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
FileData& .
>. /
>/ 0
GetFiles1 9
(9 :
string: @
parentVirtualPathA R
)R S
{   	
var!! 
request!! 
=!! 
new!! 
ListObjectsRequest!! 0
(!!0 1
)!!1 2
{"" 

BucketName## 
=## 
_bucketName## (
,##( )
Prefix$$ 
=$$ 
await$$ 
FixVirtualPath$$ -
($$- .
parentVirtualPath$$. ?
)$$? @
,$$@ A
	Delimiter%% 
=%% 
$str%%  
}&& 
;&& 
var(( 
response(( 
=(( 
await((  
	_s3Client((! *
.((* +
ListObjectsAsync((+ ;
(((; <
request((< C
)((C D
;((D E
IEnumerable)) 
<)) 
FileData))  
>))  !
files))" '
=))( )
response))* 2
.))2 3
	S3Objects))3 <
.))< =
Where))= B
())B C
file))C G
=>))H J
file))K O
.))O P
Size))P T
>))U V
$num))W X
)))X Y
.))Y Z
Select))Z `
())` a
file))a e
=>))f h
new))i l
FileData))m u
{** 
VirtualPath++ 
=++ 
file++ "
.++" #
Key++# &
,++& '
Name,, 
=,, 
file,, 
.,, 
Key,, 
.,,  
	Substring,,  )
(,,) *
file,,* .
.,,. /
Key,,/ 2
.,,2 3
LastIndexOf,,3 >
(,,> ?
$char,,? B
),,B C
+,,D E
$num,,F G
),,G H
,,,H I
Length-- 
=-- 
file-- 
.-- 
Size-- "
,--" #
Created.. 
=.. 
file.. 
... 
LastModified.. +
,..+ ,
Updated// 
=// 
file// 
.// 
LastModified// +
}00 
)00 
;00 
return11 
files11 
;11 
}22 	
public44 
async44 
Task44 
<44 
FileData44 "
>44" #
GetFile44$ +
(44+ ,
string44, 2
virtualPath443 >
)44> ?
{55 	
var66 
request66 
=66 
new66 
GetObjectRequest66 .
(66. /
)66/ 0
{77 

BucketName88 
=88 
_bucketName88 (
,88( )
Key99 
=99 
await99 
FixVirtualPath99 *
(99* +
virtualPath99+ 6
)996 7
}:: 
;:: 
FileData;; 
file;; 
;;; 
using<< 
(<< 
var<< 
response<< 
=<<  !
await<<" '
	_s3Client<<( 1
.<<1 2
GetObjectAsync<<2 @
(<<@ A
request<<A H
)<<H I
)<<I J
{== 
file>> 
=>> 
new>> 
FileData>> #
{?? 
Name@@ 
=@@ 
response@@ #
.@@# $
Key@@$ '
.@@' (
	Substring@@( 1
(@@1 2
response@@2 :
.@@: ;
Key@@; >
.@@> ?
LastIndexOf@@? J
(@@J K
$char@@K N
)@@N O
+@@P Q
$num@@R S
)@@S T
,@@T U
UpdatedAA 
=AA 
DateTimeAA &
.AA& '
NowAA' *
,AA* +
CreatedBB 
=BB 
DateTimeBB &
.BB& '
NowBB' *
,BB* +
LengthCC 
=CC 
responseCC %
.CC% &
ContentLengthCC& 3
,CC3 4
VirtualPathDD 
=DD  !
responseDD" *
.DD* +
KeyDD+ .
}EE 
;EE 
}FF 
returnGG 
fileGG 
;GG 
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IEnumerableJJ %
<JJ% &
DirectoryDataJJ& 3
>JJ3 4
>JJ4 5
GetDirectoriesJJ6 D
(JJD E
stringJJE K
parentVirtualPathJJL ]
)JJ] ^
{KK 	
parentVirtualPathLL 
=LL 
awaitLL  %
FixVirtualPathLL& 4
(LL4 5
parentVirtualPathLL5 F
)LLF G
;LLG H
varNN 
requestNN 
=NN 
newNN 
ListObjectsRequestNN 0
(NN0 1
)NN1 2
{OO 

BucketNamePP 
=PP 
_bucketNamePP (
,PP( )
PrefixQQ 
=QQ 
parentVirtualPathQQ *
,QQ* +
	DelimiterRR 
=RR 
$strRR  
}SS 
;SS 
varUU 
responseUU 
=UU 
awaitUU  
	_s3ClientUU! *
.UU* +
ListObjectsAsyncUU+ ;
(UU; <
requestUU< C
)UUC D
;UUD E
IEnumerableVV 
<VV 
DirectoryDataVV %
>VV% &
directoriesVV' 2
=VV3 4
responseVV5 =
.VV= >
CommonPrefixesVV> L
.VVL M
SelectVVM S
(VVS T
dirVVT W
=>VVX Z
newVV[ ^
DirectoryDataVV_ l
{WW 
CreatedXX 
=XX 
DateTimeXX "
.XX" #
NowXX# &
,XX& '
UpdatedYY 
=YY 
DateTimeYY "
.YY" #
NowYY# &
,YY& '
NameZZ 
=ZZ 
dirZZ 
.ZZ 
TrimEndZZ "
(ZZ" #
$charZZ# &
)ZZ& '
.ZZ' (
	SubstringZZ( 1
(ZZ1 2
dirZZ2 5
.ZZ5 6
TrimEndZZ6 =
(ZZ= >
$charZZ> A
)ZZA B
.ZZB C
LastIndexOfZZC N
(ZZN O
$charZZO R
)ZZR S
+ZZT U
$numZZV W
)ZZW X
,ZZX Y
VirtualPath[[ 
=[[ 
dir[[ !
}\\ 
)\\ 
;\\ 
return]] 
directories]] 
;]] 
}^^ 	
public`` 
async`` 
Task`` 
<`` 
DirectoryData`` '
>``' (
GetDirectory``) 5
(``5 6
string``6 <
virtualPath``= H
)``H I
{aa 	
virtualPathbb 
=bb 
awaitbb 
FixVirtualPathbb  .
(bb. /
virtualPathbb/ :
)bb: ;
;bb; <
returncc 
newcc 
DirectoryDatacc $
{dd 
Nameee 
=ee 
stringee 
.ee 
Formatee $
(ee$ %
RootURLee% ,
,ee, -
_bucketNameee. 9
,ee9 :
virtualPathee; F
)eeF G
,eeG H
VirtualPathff 
=ff 
virtualPathff )
,ff) *
Createdgg 
=gg 
DateTimegg "
.gg" #
Nowgg# &
,gg& '
Updatedhh 
=hh 
DateTimehh "
.hh" #
Nowhh# &
}ii 
;ii 
}jj 	
publicll 
asyncll 
Taskll 
<ll 
boolll 
>ll 

FileExistsll  *
(ll* +
stringll+ 1
virtualPathll2 =
)ll= >
{mm 	
varnn 
requestnn 
=nn 
newnn $
GetObjectMetadataRequestnn 6
(nn6 7
)nn7 8
{oo 

BucketNamepp 
=pp 
_bucketNamepp (
,pp( )
Keyqq 
=qq 
awaitqq 
FixVirtualPathqq *
(qq* +
virtualPathqq+ 6
)qq6 7
}rr 
;rr 
trytt 
{uu 
awaitvv 
	_s3Clientvv 
.vv  "
GetObjectMetadataAsyncvv  6
(vv6 7
requestvv7 >
)vv> ?
;vv? @
}ww 
catchxx 
(xx 
AmazonS3Exceptionxx $
)xx$ %
{yy 
returnzz 
falsezz 
;zz 
}{{ 
return|| 
true|| 
;|| 
}}} 	
public 
async 
Task 
MoveFile "
(" #
string# )
fromVirtualPath* 9
,9 :
string; A"
destinationVirtualPathB X
)X Y
{
ÄÄ 	
await
ÅÅ 
CopyFile
ÅÅ 
(
ÅÅ 
fromVirtualPath
ÅÅ *
,
ÅÅ* +$
destinationVirtualPath
ÅÅ, B
)
ÅÅB C
;
ÅÅC D
await
ÇÇ 

DeleteFile
ÇÇ 
(
ÇÇ 
fromVirtualPath
ÇÇ ,
)
ÇÇ, -
;
ÇÇ- .
}
ÉÉ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 

DeleteFile
ÖÖ $
(
ÖÖ$ %
string
ÖÖ% +
virtualPath
ÖÖ, 7
)
ÖÖ7 8
{
ÜÜ 	
var
áá 
request
áá 
=
áá 
new
áá !
DeleteObjectRequest
áá 1
(
áá1 2
)
áá2 3
{
àà 

BucketName
ââ 
=
ââ 
_bucketName
ââ (
,
ââ( )
Key
ää 
=
ää 
await
ää 
FixVirtualPath
ää *
(
ää* +
virtualPath
ää+ 6
)
ää6 7
}
ãã 
;
ãã 
await
çç 
	_s3Client
çç 
.
çç 
DeleteObjectAsync
çç -
(
çç- .
request
çç. 5
)
çç5 6
;
çç6 7
}
ëë 	
public
ìì 
async
ìì 
Task
ìì 
CopyFile
ìì "
(
ìì" #
string
ìì# )
fromVirtualPath
ìì* 9
,
ìì9 :
string
ìì; A$
destinationVirtualPath
ììB X
)
ììX Y
{
îî 	
var
ïï 
copyRequest
ïï 
=
ïï 
new
ïï !
CopyObjectRequest
ïï" 3
(
ïï3 4
)
ïï4 5
{
ññ 
SourceBucket
óó 
=
óó 
_bucketName
óó *
,
óó* +
	SourceKey
òò 
=
òò 
fromVirtualPath
òò +
,
òò+ ,
DestinationBucket
ôô !
=
ôô" #
_bucketName
ôô$ /
,
ôô/ 0
DestinationKey
öö 
=
öö  $
destinationVirtualPath
öö! 7
,
öö7 8
	CannedACL
õõ 
=
õõ 
S3CannedACL
õõ '
.
õõ' (

PublicRead
õõ( 2
}
úú 
;
úú 
await
ûû 
	_s3Client
ûû 
.
ûû 
CopyObjectAsync
ûû +
(
ûû+ ,
copyRequest
ûû, 7
)
ûû7 8
;
ûû8 9
}
üü 	
public
¢¢ 
async
¢¢ 
Task
¢¢ 
<
¢¢ 
Stream
¢¢  
>
¢¢  !
OpenFile
¢¢" *
(
¢¢* +
string
¢¢+ 1
virtualPath
¢¢2 =
,
¢¢= >
bool
¢¢? C
readOnly
¢¢D L
=
¢¢M N
false
¢¢O T
)
¢¢T U
{
££ 	
var
§§ 
request
§§ 
=
§§ 
new
§§ 
GetObjectRequest
§§ .
(
§§. /
)
§§/ 0
{
•• 

BucketName
¶¶ 
=
¶¶ 
_bucketName
¶¶ (
,
¶¶( )
Key
ßß 
=
ßß 
await
ßß 
FixVirtualPath
ßß *
(
ßß* +
virtualPath
ßß+ 6
)
ßß6 7
}
®® 
;
®® 
var
™™ 
stream
™™ 
=
™™ 
new
™™ 
MemoryStream
™™ )
(
™™) *
)
™™* +
;
™™+ ,
using
¨¨ 
(
¨¨ 
var
¨¨ 
response
¨¨ 
=
¨¨  !
await
¨¨" '
	_s3Client
¨¨( 1
.
¨¨1 2
GetObjectAsync
¨¨2 @
(
¨¨@ A
request
¨¨A H
)
¨¨H I
)
¨¨I J
{
≠≠ 
var
ÆÆ 
buffer
ÆÆ 
=
ÆÆ 
new
ÆÆ  
byte
ÆÆ! %
[
ÆÆ% &
$num
ÆÆ& +
]
ÆÆ+ ,
;
ÆÆ, -
while
ØØ 
(
ØØ 
true
ØØ 
)
ØØ 
{
∞∞ 
var
±± 
read
±± 
=
±± 
response
±± '
.
±±' (
ResponseStream
±±( 6
.
±±6 7
Read
±±7 ;
(
±±; <
buffer
±±< B
,
±±B C
$num
±±D E
,
±±E F
buffer
±±G M
.
±±M N
Length
±±N T
)
±±T U
;
±±U V
if
≤≤ 
(
≤≤ 
read
≤≤ 
<=
≤≤ 
$num
≤≤  !
)
≤≤! "
break
≥≥ 
;
≥≥ 
stream
¥¥ 
.
¥¥ 
Write
¥¥  
(
¥¥  !
buffer
¥¥! '
,
¥¥' (
$num
¥¥) *
,
¥¥* +
read
¥¥, 0
)
¥¥0 1
;
¥¥1 2
}
µµ 
}
∂∂ 
return
∑∑ 
stream
∑∑ 
;
∑∑ 
}
∏∏ 	
public
∫∫ 
async
∫∫ 
Task
∫∫ 
	WriteFile
∫∫ #
(
∫∫# $
string
∫∫$ *
virtualPath
∫∫+ 6
,
∫∫6 7
Stream
∫∫8 >
inputStream
∫∫? J
)
∫∫J K
{
ªª 	
var
ºº 
request
ºº 
=
ºº 
new
ºº 
PutObjectRequest
ºº .
(
ºº. /
)
ºº/ 0
{
ΩΩ 

BucketName
ææ 
=
ææ 
_bucketName
ææ (
,
ææ( )
	CannedACL
øø 
=
øø 
S3CannedACL
øø '
.
øø' (

PublicRead
øø( 2
,
øø2 3
Key
¿¿ 
=
¿¿ 
await
¿¿ 
FixVirtualPath
¿¿ *
(
¿¿* +
virtualPath
¿¿+ 6
)
¿¿6 7
,
¿¿7 8
InputStream
¡¡ 
=
¡¡ 
inputStream
¡¡ )
}
¬¬ 
;
¬¬ 
await
√√ 
	_s3Client
√√ 
.
√√ 
PutObjectAsync
√√ *
(
√√* +
request
√√+ 2
)
√√2 3
;
√√3 4
}
ƒƒ 	
public
∆∆ 
async
∆∆ 
Task
∆∆ 
ReadFileContents
∆∆ *
(
∆∆* +
string
∆∆+ 1
virtualPath
∆∆2 =
,
∆∆= >
Stream
∆∆? E
outputStream
∆∆F R
)
∆∆R S
{
«« 	
var
»» 
request
»» 
=
»» 
new
»» 
GetObjectRequest
»» .
(
»». /
)
»»/ 0
{
…… 

BucketName
   
=
   
_bucketName
   (
,
  ( )
Key
ÀÀ 
=
ÀÀ 
await
ÀÀ 
FixVirtualPath
ÀÀ *
(
ÀÀ* +
virtualPath
ÀÀ+ 6
)
ÀÀ6 7
}
ÃÃ 
;
ÃÃ 
using
ŒŒ 
(
ŒŒ 
var
ŒŒ 
response
ŒŒ 
=
ŒŒ  !
await
ŒŒ" '
	_s3Client
ŒŒ( 1
.
ŒŒ1 2
GetObjectAsync
ŒŒ2 @
(
ŒŒ@ A
request
ŒŒA H
)
ŒŒH I
)
ŒŒI J
{
œœ 
var
–– 
buffer
–– 
=
–– 
new
––  
byte
––! %
[
––% &
$num
––& +
]
––+ ,
;
––, -
while
—— 
(
—— 
true
—— 
)
—— 
{
““ 
var
”” 
read
”” 
=
”” 
response
”” '
.
””' (
ResponseStream
””( 6
.
””6 7
Read
””7 ;
(
””; <
buffer
””< B
,
””B C
$num
””D E
,
””E F
buffer
””G M
.
””M N
Length
””N T
)
””T U
;
””U V
if
‘‘ 
(
‘‘ 
read
‘‘ 
<=
‘‘ 
$num
‘‘  !
)
‘‘! "
break
‘‘# (
;
‘‘( )
outputStream
’’  
.
’’  !
Write
’’! &
(
’’& '
buffer
’’' -
,
’’- .
$num
’’/ 0
,
’’0 1
read
’’2 6
)
’’6 7
;
’’7 8
}
÷÷ 
}
◊◊ 
}
ÿÿ 	
public
⁄⁄ 
async
⁄⁄ 
Task
⁄⁄ 
<
⁄⁄ 
bool
⁄⁄ 
>
⁄⁄ 
DirectoryExists
⁄⁄  /
(
⁄⁄/ 0
string
⁄⁄0 6
virtualPath
⁄⁄7 B
)
⁄⁄B C
{
€€ 	
virtualPath
‹‹ 
=
‹‹ 
FixVirtualPath
‹‹ (
(
‹‹( )
virtualPath
‹‹) 4
)
‹‹4 5
+
‹‹6 7
EmptyFilename
‹‹8 E
;
‹‹E F
var
ﬁﬁ 
request
ﬁﬁ 
=
ﬁﬁ 
new
ﬁﬁ &
GetObjectMetadataRequest
ﬁﬁ 6
(
ﬁﬁ6 7
)
ﬁﬁ7 8
{
ﬂﬂ 

BucketName
‡‡ 
=
‡‡ 
_bucketName
‡‡ (
,
‡‡( )
Key
·· 
=
·· 
virtualPath
·· !
}
‚‚ 
;
‚‚ 
try
‰‰ 
{
ÂÂ 
await
ÊÊ 
	_s3Client
ÊÊ 
.
ÊÊ  $
GetObjectMetadataAsync
ÊÊ  6
(
ÊÊ6 7
request
ÊÊ7 >
)
ÊÊ> ?
;
ÊÊ? @
}
ÁÁ 
catch
ËË 
(
ËË 
AmazonS3Exception
ËË $
)
ËË$ %
{
ÈÈ 
return
ÍÍ 
false
ÍÍ 
;
ÍÍ 
}
ÎÎ 
return
ÏÏ 
true
ÏÏ 
;
ÏÏ 
}
ÌÌ 	
public
ÔÔ 
Task
ÔÔ 
MoveDirectory
ÔÔ !
(
ÔÔ! "
string
ÔÔ" (
fromVirtualPath
ÔÔ) 8
,
ÔÔ8 9
string
ÔÔ: @$
destinationVirtualPath
ÔÔA W
)
ÔÔW X
{
 	
throw
ÒÒ 
new
ÒÒ %
NotImplementedException
ÒÒ -
(
ÒÒ- .
)
ÒÒ. /
;
ÒÒ/ 0
}
ÚÚ 	
public
ÙÙ 
async
ÙÙ 
Task
ÙÙ 
DeleteDirectory
ÙÙ )
(
ÙÙ) *
string
ÙÙ* 0
virtualPath
ÙÙ1 <
)
ÙÙ< =
{
ıı 	
virtualPath
ˆˆ 
=
ˆˆ 
await
ˆˆ 
FixVirtualPath
ˆˆ  .
(
ˆˆ. /
virtualPath
ˆˆ/ :
)
ˆˆ: ;
;
ˆˆ; <(
DeleteDirectoryAndChildren
˜˜ &
(
˜˜& '
virtualPath
˜˜' 2
)
˜˜2 3
;
˜˜3 4
}
˙˙ 	
public
¸¸ 
async
¸¸ 
Task
¸¸ 
CreateDirectory
¸¸ )
(
¸¸) *
string
¸¸* 0
virtualPath
¸¸1 <
)
¸¸< =
{
˝˝ 	
virtualPath
˛˛ 
=
˛˛ 
string
˛˛  
.
˛˛  !
Format
˛˛! '
(
˛˛' (
$str
˛˛( 1
,
˛˛1 2
FixVirtualPath
˛˛3 A
(
˛˛A B
virtualPath
˛˛B M
)
˛˛M N
,
˛˛N O
EmptyFilename
˛˛P ]
)
˛˛] ^
;
˛˛^ _
var
ÄÄ 
request
ÄÄ 
=
ÄÄ 
new
ÄÄ 
PutObjectRequest
ÄÄ .
(
ÄÄ. /
)
ÄÄ/ 0
{
ÅÅ 

BucketName
ÇÇ 
=
ÇÇ 
_bucketName
ÇÇ (
,
ÇÇ( )
Key
ÉÉ 
=
ÉÉ 
virtualPath
ÉÉ !
,
ÉÉ! "
ContentBody
ÑÑ 
=
ÑÑ 
string
ÑÑ $
.
ÑÑ$ %
Empty
ÑÑ% *
}
ÖÖ 
;
ÖÖ 
await
ÜÜ 
	_s3Client
ÜÜ 
.
ÜÜ 
PutObjectAsync
ÜÜ *
(
ÜÜ* +
request
ÜÜ+ 2
)
ÜÜ2 3
;
ÜÜ3 4
}
áá 	
private
ãã 
async
ãã 
Task
ãã 
<
ãã 
string
ãã !
>
ãã! "
FixVirtualPath
ãã# 1
(
ãã1 2
string
ãã2 8
virtualPath
ãã9 D
)
ããD E
{
åå 	
if
çç 
(
çç 
virtualPath
çç 
.
çç 

StartsWith
çç &
(
çç& '
$str
çç' ,
)
çç, -
)
çç- .
return
éé 
virtualPath
éé "
.
éé" #
Replace
éé# *
(
éé* +
$str
éé+ 0
,
éé0 1
string
éé2 8
.
éé8 9
Empty
éé9 >
)
éé> ?
.
éé? @
	TrimStart
éé@ I
(
ééI J
$char
ééJ M
)
ééM N
;
ééN O
if
êê 
(
êê 
virtualPath
êê 
.
êê 

StartsWith
êê &
(
êê& '
$str
êê' .
)
êê. /
)
êê/ 0
return
ëë 
virtualPath
ëë "
.
ëë" #
Replace
ëë# *
(
ëë* +
$str
ëë+ 2
,
ëë2 3
string
ëë4 :
.
ëë: ;
Empty
ëë; @
)
ëë@ A
.
ëëA B
	TrimStart
ëëB K
(
ëëK L
$char
ëëL O
)
ëëO P
;
ëëP Q
if
ìì 
(
ìì 
virtualPath
ìì 
.
ìì 

StartsWith
ìì &
(
ìì& '
$str
ìì' 2
)
ìì2 3
)
ìì3 4
return
îî 
virtualPath
îî "
;
îî" #
return
ññ 
virtualPath
ññ 
.
ññ 
	TrimStart
ññ (
(
ññ( )
$char
ññ) ,
)
ññ, -
;
ññ- .
}
óó 	
private
ôô 
async
ôô 
Task
ôô (
DeleteDirectoryAndChildren
ôô 5
(
ôô5 6
string
ôô6 <
virtualPath
ôô= H
)
ôôH I
{
öö 	
var
õõ 
directories
õõ 
=
õõ 
await
õõ #
GetDirectories
õõ$ 2
(
õõ2 3
virtualPath
õõ3 >
)
õõ> ?
;
õõ? @
foreach
úú 
(
úú 
var
úú 
	directory
úú "
in
úú# %
directories
úú& 1
)
úú1 2
await
ùù (
DeleteDirectoryAndChildren
ùù 0
(
ùù0 1
	directory
ùù1 :
.
ùù: ;
VirtualPath
ùù; F
)
ùùF G
;
ùùG H
var
üü 
files
üü 
=
üü 
await
üü 
GetFiles
üü &
(
üü& '
virtualPath
üü' 2
)
üü2 3
;
üü3 4
foreach
†† 
(
†† 
var
†† 
file
†† 
in
††  
files
††! &
)
††& '
await
°° 

DeleteFile
°°  
(
°°  !
file
°°! %
.
°°% &
VirtualPath
°°& 1
)
°°1 2
;
°°2 3
var
££ 
request
££ 
=
££ 
new
££ !
DeleteObjectRequest
££ 1
(
££1 2
)
££2 3
{
§§ 

BucketName
•• 
=
•• 
_bucketName
•• (
,
••( )
Key
¶¶ 
=
¶¶ 
virtualPath
¶¶ !
+
¶¶" #
EmptyFilename
¶¶$ 1
}
ßß 
;
ßß 
await
®® 
	_s3Client
®® 
.
®® 
DeleteObjectAsync
®® -
(
®®- .
request
®®. 5
)
®®5 6
;
®®6 7
}
©© 	
}
´´ 
}¨¨ ‰!
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\FileSystem\FileSystemItemInfo.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %

FileSystem% /
{ 
public 

class 
FileSystemItemInfo #
{ 
public 
string 
Path 
{ 
get  
;  !
}" #
public		 
string		 
[		 
]		 
PathKeys		  
{		! "
get		# &
;		& '
}		( )
public

 
bool

 
IsDirectory

 
{

  !
get

" %
;

% &
}

' (
public 
string 
Name 
{ 
get  
;  !
}" #
public 
string 
Key 
{ 
get 
;  
}! "
public 
FileSystemItemInfo !
(! "
string" (
path) -
,- .
bool/ 3
isDirectory4 ?
,? @
stringA G
[G H
]H I
pathKeysJ R
=S T
nullU Y
)Y Z
{ 	
Path 
= 
path 
. 
Trim 
( 
$char  
,  !
$char" &
)& '
;' (
IsDirectory 
= 
isDirectory %
;% &
PathKeys 
= 
pathKeys 
??  "
GetDefaultPathKeys# 5
(5 6
path6 :
): ;
;; <
Key 
= 
( 
( 
path 
== 
string "
." #
Empty# (
)( )
?* +
string, 2
.2 3
Empty3 8
:9 :
PathKeys; C
.C D
LastD H
(H I
)I J
)J K
;K L
Name 
= 
System 
. 
IO 
. 
Path !
.! "
GetFileName" -
(- .
Path. 2
)2 3
;3 4
} 	
private 
string 
[ 
] 
GetDefaultPathKeys +
(+ ,
string, 2
path3 7
)7 8
{ 	
string 
[ 
] 
array 
= 
path !
.! "
Split" '
(' (
new( +
char, 0
[0 1
$num1 2
]2 3
{4 5
System6 <
.< =
IO= ?
.? @
Path@ D
.D E"
DirectorySeparatorCharE [
}\ ]
,] ^
StringSplitOptions_ q
.q r
RemoveEmptyEntries	r Ñ
)
Ñ Ö
;
Ö Ü
string 
[ 
] 
array2 
= 
new !
string" (
[( )
array) .
.. /
Length/ 5
]5 6
;6 7
for 
( 
int 
i 
= 
$num 
; 
i 
< 
array  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
array2 
[ 
i 
] 
= 
( 
( 
i 
==  "
$num# $
)$ %
?& '
array( -
[- .
i. /
]/ 0
:1 2
System3 9
.9 :
IO: <
.< =
Path= A
.A B
CombineB I
(I J
array2J P
[P Q
iQ R
-S T
$numU V
]V W
,W X
arrayY ^
[^ _
i_ `
]` a
)a b
)b c
;c d
} 
return 
array2 
; 
} 	
}   
}"" Ô
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\FileSystem\FileSystemLoadItemOptions.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %

FileSystem% /
{ 
public 

class %
FileSystemLoadItemOptions *
{ 
public 
FileSystemItemInfo !
	Directory" +
{, -
get. 1
;1 2
private3 :
set; >
;> ?
}@ A
public %
FileSystemLoadItemOptions (
(( )
FileSystemItemInfo) ;
	directory< E
)E F
{ 	
	Directory 
= 
	directory !
;! "
}		 	
}

 
} Ä
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Helper\FileSystem\PersistentClass.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Helper $
.$ %

FileSystem% /
{ 
public 

class 
FileSystemItem 
{ 
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
bool

 
IsDirectory

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
DateTime 
DateModified $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
long 
Size 
{ 
get 
; 
set  #
;# $
}% &
public 
bool 
HasSubDirectories %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
	Thumbnail 
{  !
get" %
;% &
set' *
;* +
}, -
public 
IDictionary 
< 
string !
,! "
object# )
>) *
CustomFields+ 7
{8 9
get: =
;= >
}? @
public 
FileSystemItem 
( 
) 
{ 	
CustomFields 
= 
new 

Dictionary )
<) *
string* 0
,0 1
object2 8
>8 9
(9 :
): ;
;; <
} 	
} 
} €s
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\HostedService\AppointmentLettersService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
HostedService +
{ 
public 

class %
AppointmentLettersService *
:+ ,
IHostedService- ;
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly )
IAppointmentLetterApplication 6*
employeeInformationApplication7 U
;U V
private 
readonly 
Timer 

EmailTimer )
;) *
readonly 
	IAmazonS3 
	_s3Client $
;$ %
private 
bool 
isFlag 
= 
true "
;" #
private 
readonly 
string 
rootFilePath  ,
;, -
TimeSpan!! 
timeUntilMidnight!! "
=!!# $
TimeSpan!!% -
.!!- .
FromDays!!. 6
(!!6 7
$num!!7 8
)!!8 9
-!!: ;
(!!< =
DateTime!!= E
.!!E F
Now!!F I
-!!J K
DateTime!!L T
.!!T U
Now!!U X
.!!X Y
Date!!Y ]
)!!] ^
;!!^ _
public"" %
AppointmentLettersService"" (
(""( )
IWebHostEnvironment"") <
environment""= H
,""H I
ILoggerManager""J X
logger""Y _
,""_ `)
IAppointmentLetterApplication""a ~+
employeeInformationApplication	"" ù
)
""ù û
{## 	
this$$ 
.$$ 
logger$$ 
=$$ 
logger$$  
;$$  !
this%% 
.%% *
employeeInformationApplication%% /
=%%0 1*
employeeInformationApplication%%2 P
;%%P Q

EmailTimer&& 
=&& 
new&& 
Timer&& "
(&&" #'
GetPendingAppointmentLetter&&# >
,&&> ?
null&&@ D
,&&D E
TimeSpan&&F N
.&&N O
Zero&&O S
,&&S T
TimeSpan&&U ]
.&&] ^
FromSeconds&&^ i
(&&i j
$num&&j l
)&&l m
)&&m n
;&&n o
	_s3Client'' 
='' 
new'' 
AmazonS3Client'' *
(''* +
S3BucketSettings''+ ;
.''; <
Current''< C
.''C D
	AccessKey''D M
,''M N
S3BucketSettings''O _
.''_ `
Current''` g
.''g h
	SecretKey''h q
,''q r
RegionEndpoint	''s Å
.
''Å Ç
APSouth1
''Ç ä
)
''ä ã
;
''ã å
rootFilePath(( 
=(( 
environment(( &
.((& '
ContentRootPath((' 6
;((6 7
}** 	
public++ 
async++ 
Task++ 

StartAsync++ $
(++$ %
CancellationToken++% 6
cancellationToken++7 H
)++H I
{,, 	
logger-- 
.-- 
LogInfo-- 
(-- 
$str-- <
)--< =
;--= >
await// 
Task// 
.// 
CompletedTask// $
;//$ %
}00 	
private11 
async11 
void11 '
GetPendingAppointmentLetter11 6
(116 7
object117 =
state11> C
)11C D
{22 	
logger33 
.33 
LogInfo33 
(33 
$str33 G
)33G H
;33H I
if44 
(44 
isFlag44 
&&44 
JobSettings44 %
.44% &
Current44& -
.44- .$
CreateAppointmentLetters44. F
)44F G
{55 
isFlag66 
=66 
false66 
;66 
List77 
<77 
AppointmentLetter77 &
>77& '
appointmentLetters77( :
=77; <
await77= B*
employeeInformationApplication77C a
.77a b'
GetPendingAppointmentLetter77b }
(77} ~
)77~ 
;	77 Ä
foreach88 
(88 
var88 
item88 !
in88" $
appointmentLetters88% 7
)887 8
{99 
await:: %
GenerateAppointmentLetter:: 2
(::2 3
item::3 7
)::7 8
;::8 9
};; 
isFlag<< 
=<< 
true<< 
;<< 
}== 
else>> 
{?? 
logger@@ 
.@@ 
LogWarn@@ 
(@@ 
$str@@ g
)@@g h
;@@h i
}BB 
}CC 	
publicEE 
asyncEE 
TaskEE %
GenerateAppointmentLetterEE 3
(EE3 4
AppointmentLetterEE4 E
appointmentLetterEEF W
)EEW X
{FF 	
stringGG 
inputFileNameGG  
;GG  !
stringHH 
inputFilePathHH  
;HH  !
stringII 
outputFileNameII !
;II! "
ifKK 
(KK 
ApplicationSettingsKK #
.KK# $
CurrentKK$ +
.KK+ , 
AllowedLegalBranchesKK, @
.KK@ A
ContainsKKA I
(KKI J
appointmentLetterKKJ [
.KK[ \
LegalBranchNameKK\ k
)KKk l
)KKl m
{LL 

DictionaryMM 
<MM 
stringMM !
,MM! "
objectMM# )
>MM) *
myFormFieldsMM+ 7
=MM8 9
appointmentLetterMM: K
.MMK L
MyFormFieldsMML X
;MMX Y
inputFileNameNN 
=NN 
$"NN  "
{NN" #
appointmentLetterNN# 4
.NN4 5
LegalBranchNameNN5 D
}NND E
$strNNE I
"NNI J
;NNJ K
inputFilePathOO 
=OO 
PathOO  $
.OO$ %
CombineOO% ,
(OO, -
rootFilePathOO- 9
,OO9 :
$strOO; F
,OOF G
$strOOH \
)OO\ ]
;OO] ^
inputFileNamePP 
=PP 
stringPP  &
.PP& '
FormatPP' -
(PP- .
$strPP. 8
,PP8 9
inputFilePathPP: G
,PPG H
inputFileNamePPI V
)PPV W
;PPW X
outputFileNameQQ 
=QQ  
stringQQ! '
.QQ' (
FormatQQ( .
(QQ. /
$strQQ/ 8
,QQ8 9
appointmentLetterQQ: K
.QQK L
EmployeeNumberQQL Z
,QQZ [
$strQQ\ t
)QQt u
;QQu v
outputFileNameRR 
=RR  
stringRR! '
.RR' (
FormatRR( .
(RR. /
$strRR/ @
,RR@ A
S3BucketSettingsRRB R
.RRR S
CurrentRRS Z
.RRZ [
EmployeesFolderRR[ j
,RRj k
appointmentLetterRRl }
.RR} ~

EmployeeId	RR~ à
,
RRà â
$str
RRä ò
,
RRò ô
outputFileName
RRö ®
)
RR® ©
;
RR© ™
ifSS 
(SS 
appointmentLetterSS %
.SS% &
AppointmentNumberSS& 7
.SS7 8
IsNotNullOrEmptySS8 H
(SSH I
)SSI J
)SSJ K
{TT 
MemoryStreamUU  
finalStreamUU! ,
=UU- .
SetFieldValuesUU/ =
(UU= >
myFormFieldsUU> J
,UUJ K
inputFileNameUUL Y
,UUY Z
inputFilePathUU[ h
,UUh i
appointmentLetterUUj {
.UU{ |
EmployeeNumber	UU| ä
)
UUä ã
;
UUã å
awaitVV 
UploadFileAsyncVV )
(VV) *
finalStreamVV* 5
,VV5 6
outputFileNameVV7 E
)VVE F
;VVF G
awaitWW )
UpdateAppointmentLetterStatusWW 7
(WW7 8
appointmentLetterWW8 I
.WWI J
EmployeeSlnoWWJ V
)WWV W
;WWW X
}XX 
}YY 
}ZZ 	
private\\ 
async\\ 
Task\\ )
UpdateAppointmentLetterStatus\\ 8
(\\8 9
int\\9 <
employeeNumber\\= K
)\\K L
{]] 	
await^^ *
employeeInformationApplication^^ 0
.^^0 1)
UpdateAppointmentLetterStatus^^1 N
(^^N O
employeeNumber^^O ]
)^^] ^
;^^^ _
}__ 	
privateaa 
MemoryStreamaa 
SetFieldValuesaa +
(aa+ ,

Dictionaryaa, 6
<aa6 7
stringaa7 =
,aa= >
objectaa? E
>aaE F
	fieldDataaaG P
,aaP Q
stringaaR X
templatePathaaY e
,aae f
stringaag m

outputPathaan x
,aax y
string	aaz Ä
employeeNumber
aaÅ è
)
aaè ê
{bb 	
Fontcc 
boldcc 
=cc 
FontFactorycc #
.cc# $
GetFontcc$ +
(cc+ ,
FontFactorycc, 7
.cc7 8
HELVETICA_BOLDcc8 F
,ccF G
$numccH J
,ccJ K
FontccL P
.ccP Q
BOLDccQ U
)ccU V
;ccV W
	PdfReaderdd 
readerdd 
=dd 
newdd "
	PdfReaderdd# ,
(dd, -
templatePathdd- 9
)dd9 :
;dd: ;
varee 
outputFilePathee 
=ee  
Pathee! %
.ee% &
Combineee& -
(ee- .

outputPathee. 8
,ee8 9
$"ee: <
{ee< =
employeeNumberee= K
}eeK L
$streeL c
"eec d
)eed e
.eee f
ToStringeef n
(een o
)eeo p
;eep q

FileStreamff 
fsff 
=ff 
newff 

FileStreamff  *
(ff* +
outputFilePathff+ 9
,ff9 :
FileModeff; C
.ffC D
	CreateNewffD M
,ffM N

FileAccessffO Y
.ffY Z
	ReadWriteffZ c
)ffc d
;ffd e

PdfStampergg 
stampergg 
=gg  
newgg! $

PdfStampergg% /
(gg/ 0
readergg0 6
,gg6 7
fsgg8 :
)gg: ;
;gg; <

AcroFieldshh 
fieldStamperhh #
=hh$ %
stamperhh& -
.hh- .

AcroFieldshh. 8
;hh8 9
foreachjj 
(jj 
varjj 
datajj 
injj  
	fieldDatajj! *
)jj* +
{kk 
fieldStamperll 
.ll 
SetFieldPropertyll -
(ll- .
datall. 2
.ll2 3
Keyll3 6
,ll6 7
$strll8 B
,llB C
boldllD H
.llH I
BaseFontllI Q
,llQ R
nullllS W
)llW X
;llX Y
fieldStampermm 
.mm 
SetFieldmm %
(mm% &
datamm& *
.mm* +
Keymm+ .
,mm. /
datamm0 4
.mm4 5
Valuemm5 :
.mm: ;
ToStringmm; C
(mmC D
)mmD E
)mmE F
;mmF G
}nn 
stamperpp 
.pp 
Writerpp 
.pp 
CompressionLevelpp +
=pp, -
	PdfStreampp. 7
.pp7 8
BEST_COMPRESSIONpp8 H
;ppH I
stamperqq 
.qq 
Writerqq 
.qq 
SetFullCompressionqq -
(qq- .
)qq. /
;qq/ 0
stamperrr 
.rr 
FormFlatteningrr "
=rr# $
truerr% )
;rr) *
stamperss 
.ss 
Closess 
(ss 
)ss 
;ss 
fstt 
.tt 
Closett 
(tt 
)tt 
;tt 
readeruu 
.uu 
Closeuu 
(uu 
)uu 
;uu 
MemoryStreamvv 
msvv 
=vv 
newvv !
MemoryStreamvv" .
(vv. /
Filevv/ 3
.vv3 4
ReadAllBytesvv4 @
(vv@ A
outputFilePathvvA O
)vvO P
)vvP Q
;vvQ R
Fileww 
.ww 
Deleteww 
(ww 
outputFilePathww &
)ww& '
;ww' (
returnxx 
msxx 
;xx 
}zz 	
public{{ 
async{{ 
Task{{ 
<{{ 
bool{{ 
>{{ 
UploadFileAsync{{  /
({{/ 0
System{{0 6
.{{6 7
IO{{7 9
.{{9 :
Stream{{: @
inputStream{{A L
,{{L M
string{{N T
fileName{{U ]
){{] ^
{|| 	
try}} 
{~~ 
inputStream 
. 
Seek  
(  !
$num! "
," #

SeekOrigin$ .
.. /
Begin/ 4
)4 5
;5 6
PutObjectRequest
ÄÄ  
request
ÄÄ! (
=
ÄÄ) *
new
ÄÄ+ .
PutObjectRequest
ÄÄ/ ?
(
ÄÄ? @
)
ÄÄ@ A
{
ÅÅ 
InputStream
ÇÇ 
=
ÇÇ  !
inputStream
ÇÇ" -
,
ÇÇ- .

BucketName
ÉÉ 
=
ÉÉ  
S3BucketSettings
ÉÉ! 1
.
ÉÉ1 2
Current
ÉÉ2 9
.
ÉÉ9 :

BucketName
ÉÉ: D
,
ÉÉD E
Key
ÑÑ 
=
ÑÑ 
fileName
ÑÑ "
}
ÖÖ 
;
ÖÖ 
PutObjectResponse
ÜÜ !
response
ÜÜ" *
=
ÜÜ+ ,
await
ÜÜ- 2
	_s3Client
ÜÜ3 <
.
ÜÜ< =
PutObjectAsync
ÜÜ= K
(
ÜÜK L
request
ÜÜL S
)
ÜÜS T
;
ÜÜT U
if
áá 
(
áá 
response
áá 
.
áá 
HttpStatusCode
áá +
==
áá, .
System
áá/ 5
.
áá5 6
Net
áá6 9
.
áá9 :
HttpStatusCode
áá: H
.
ááH I
OK
ááI K
)
ááK L
return
àà 
true
àà 
;
àà  
else
ââ 
return
ää 
false
ää  
;
ää  !
}
ãã 
catch
åå 
(
åå 
	Exception
åå 
ex
åå 
)
åå  
{
çç 
throw
èè 
ex
èè 
;
èè 
}
êê 
}
ëë 	
public
ìì 
Task
ìì 
	StopAsync
ìì 
(
ìì 
CancellationToken
ìì /
cancellationToken
ìì0 A
)
ììA B
{
îî 	
return
ïï 
Task
ïï 
.
ïï 
CompletedTask
ïï %
;
ïï% &
}
ññ 	
}
óó 
}òò ÇH
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\HostedService\EmailNotificationService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
HostedService +
{ 
public 

class $
EmailNotificationService )
:* +
IHostedService, :
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly !
ISendEmailApplication . 
sendEmailApplication/ C
;C D
private 
readonly 
Timer 

EmailTimer )
;) *
private 
readonly 
Timer 
EmailTimer2 *
;* +
private 
bool 
isFlag 
= 
true "
;" #
private 
bool 
isFlag2 
= 
true #
;# $
public $
EmailNotificationService '
(' (
ILoggerManager( 6
logger7 =
,= >!
ISendEmailApplication? T 
sendEmailApplicationU i
)i j
{ 	
this 
. 
logger 
= 
logger  
;  !
this   
.    
sendEmailApplication   %
=  & ' 
sendEmailApplication  ( <
;  < =

EmailTimer!! 
=!! 
new!! 
Timer!! "
(!!" #"
SendEmailNotifications!!# 9
,!!9 :
null!!; ?
,!!? @
TimeSpan!!A I
.!!I J
Zero!!J N
,!!N O
TimeSpan!!P X
.!!X Y
FromSeconds!!Y d
(!!d e
$num!!e g
)!!g h
)!!h i
;!!i j
}## 	
public$$ 
async$$ 
Task$$ !
SendEmailNotification$$ /
($$/ 0
List$$0 4
<$$4 5
EmailDetails$$5 A
>$$A B
pendingEmails$$C P
)$$P Q
{%% 	
List&& 
<&& 
string&& 
>&& 
toEmailAddresses&& )
=&&* +
null&&, 0
;&&0 1
List'' 
<'' 
string'' 
>'' 
ccEmailAddresses'' )
=''* +
null'', 0
;''0 1
if(( 
((( 
ApplicationSettings(( #
.((# $
Current(($ +
.((+ ,
RunJobs((, 3
&&((4 6
JobSettings((7 B
.((B C
Current((C J
.((J K
SendEmialJob((K W
)((W X
{)) 
if** 
(** 
ApplicationSettings** '
.**' (
Current**( /
.**/ 0
Environment**0 ;
.**; <
ToUpper**< C
(**C D
)**D E
==**F H
$str**I O
)**O P
{++ 
foreach,, 
(,, 
var,,  
item,,! %
in,,& (
pendingEmails,,) 6
),,6 7
{-- 
toEmailAddresses.. (
=..) *
item..+ /
.../ 0
TOEMPLOYEEEMAIL..0 ?
...? @
Split..@ E
(..E F
$str..F I
,..I J
StringSplitOptions..K ]
...] ^
RemoveEmptyEntries..^ p
)..p q
...q r
ToList..r x
(..x y
)..y z
;..z {
ccEmailAddresses// (
=//) *
item//+ /
./// 0
CCEMPLOYEEEMAIL//0 ?
.//? @
Split//@ E
(//E F
$str//F I
,//I J
StringSplitOptions//K ]
.//] ^
RemoveEmptyEntries//^ p
)//p q
.//q r
ToList//r x
(//x y
)//y z
;//z {
await11 
	SendEmail11 '
(11' (
item11( ,
.11, -
SUBJECT11- 4
,114 5
item116 :
.11: ;
	EMAILBODY11; D
,11D E
toEmailAddresses11F V
.11V W
ToArray11W ^
(11^ _
)11_ `
,11` a
ccEmailAddresses11b r
.11r s
ToArray11s z
(11z {
)11{ |
)11| }
;11} ~
}22 
}33 
else44 
{55 
foreach66 
(66 
var66  
item66! %
in66& (
pendingEmails66) 6
)666 7
{77 
toEmailAddresses88 (
=88) *
EmailConfiguration88+ =
.88= >
Current88> E
.88E F
ToEmailAddress88F T
.88T U
Split88U Z
(88Z [
$str88[ ^
,88^ _
StringSplitOptions88` r
.88r s
RemoveEmptyEntries	88s Ö
)
88Ö Ü
.
88Ü á
ToList
88á ç
(
88ç é
)
88é è
;
88è ê
ccEmailAddresses99 (
=99) *
EmailConfiguration99+ =
.99= >
Current99> E
.99E F
CcEmailAddress99F T
.99T U
Split99U Z
(99Z [
$str99[ ^
,99^ _
StringSplitOptions99` r
.99r s
RemoveEmptyEntries	99s Ö
)
99Ö Ü
.
99Ü á
ToList
99á ç
(
99ç é
)
99é è
;
99è ê
await;; 
	SendEmail;; '
(;;' (
item;;( ,
.;;, -
SUBJECT;;- 4
,;;4 5
item;;6 :
.;;: ;
	EMAILBODY;;; D
,;;D E
toEmailAddresses;;F V
.;;V W
ToArray;;W ^
(;;^ _
);;_ `
,;;` a
ccEmailAddresses;;b r
.;;r s
ToArray;;s z
(;;z {
);;{ |
);;| }
;;;} ~
}<< 
}== 
}CC 
isFlagDD 
=DD 
trueDD 
;DD 
}EE 	
privatell 
asyncll 
Taskll 
	SendEmailll $
(ll$ %
stringll% +
mailSubjectll, 7
,ll7 8
stringll9 ?
mailBodyll@ H
,llH I
stringllJ P
[llP Q
]llQ R
toEmailAddressesllS c
,llc d
stringlle k
[llk l
]lll m
ccEmailAddresseslln ~
)ll~ 
{mm 	
SendEmailServicenn 
sendEmailServicenn -
=nn. /
newnn0 3
SendEmailServicenn4 D
(nnD E
)nnE F
;nnF G
sendEmailServiceoo 
.oo 
EmailSubjectoo )
=oo* +
mailSubjectoo, 7
;oo7 8
sendEmailServicepp 
.pp 
	EmailBodypp &
=pp' (
mailBodypp) 1
;pp1 2
sendEmailServiceqq 
.qq 
ToEmailAddressesqq -
=qq. /
toEmailAddressesqq0 @
;qq@ A
sendEmailServicerr 
.rr 
CCEmailAddressesrr -
=rr. /
ccEmailAddressesrr0 @
;rr@ A
awaitss 
sendEmailServicess "
.ss" #
	SendEmailss# ,
(ss, -
)ss- .
;ss. /
}
ññ 	
public
ôô 
async
ôô 
Task
ôô 

StartAsync
ôô $
(
ôô$ %
CancellationToken
ôô% 6
cancellationToken
ôô7 H
)
ôôH I
{
öö 	
logger
õõ 
.
õõ 
LogInfo
õõ 
(
õõ 
$str
õõ 3
)
õõ3 4
;
õõ4 5
await
ùù 
Task
ùù 
.
ùù 
CompletedTask
ùù $
;
ùù$ %
}
ûû 	
private
†† 
async
†† 
void
†† $
SendEmailNotifications
†† 1
(
††1 2
object
††2 8
state
††9 >
)
††> ?
{
°° 	
if
¢¢ 
(
¢¢ 
isFlag
¢¢ 
)
¢¢ 
{
££ 
isFlag
§§ 
=
§§ 
false
§§ 
;
§§ 
if
¶¶ 
(
¶¶ !
ApplicationSettings
¶¶ '
.
¶¶' (
Current
¶¶( /
.
¶¶/ 0
RunJobs
¶¶0 7
&&
¶¶8 :
JobSettings
¶¶; F
.
¶¶F G
Current
¶¶G N
.
¶¶N O
SendEmialJob
¶¶O [
)
¶¶[ \
{
ßß 
List
®® 
<
®® 
EmailDetails
®® %
>
®®% &
pendingEmails
®®' 4
=
®®5 6
await
®®7 <"
sendEmailApplication
®®= Q
.
®®Q R
GetPendingEmails
®®R b
(
®®b c
)
®®c d
;
®®d e
await
©© #
SendEmailNotification
©© /
(
©©/ 0
pendingEmails
©©0 =
)
©©= >
;
©©> ?
}
™™ 
}
´´ 
isFlag
¨¨ 
=
¨¨ 
true
¨¨ 
;
¨¨ 
}
ÆÆ 	
public
ºº 
Task
ºº 
	StopAsync
ºº 
(
ºº 
CancellationToken
ºº /
cancellationToken
ºº0 A
)
ººA B
{
ΩΩ 	
return
ææ 
Task
ææ 
.
ææ 
CompletedTask
ææ %
;
ææ% &
}
øø 	
}
¿¿ 
}¡¡ ã?
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\HostedService\GenerateEmailOTPService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
HostedService +
{ 
public 

class #
GenerateEmailOTPService (
:) *
IHostedService+ 9
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly !
ISendEmailApplication . 
sendEmailApplication/ C
;C D
private 
readonly 
Timer 

EmailTimer )
;) *
private 
bool 
isFlag 
= 
true "
;" #
public #
GenerateEmailOTPService &
(& '
ILoggerManager' 5
logger6 <
,< =!
ISendEmailApplication> S 
sendEmailApplicationT h
)h i
{ 	
this 
. 
logger 
= 
logger  
;  !
this 
.  
sendEmailApplication %
=& ' 
sendEmailApplication( <
;< =

EmailTimer 
= 
new 
Timer "
(" #"
SendEmailNotifications# 9
,9 :
null; ?
,? @
TimeSpanA I
.I J
ZeroJ N
,N O
TimeSpanP X
.X Y
FromSecondsY d
(d e
$nume g
)g h
)h i
;i j
}   	
public!! 
async!! 
Task!! $
SendOTPEmailNotification!! 2
(!!2 3
List!!3 7
<!!7 8 
EmailOtpVerification!!8 L
>!!L M
pendingEmails!!N [
)!![ \
{"" 	
List$$ 
<$$ 
string$$ 
>$$ 
toEmailAddresses$$ )
=$$* +
null$$, 0
;$$0 1
if&& 
(&& 
ApplicationSettings&& #
.&&# $
Current&&$ +
.&&+ ,
RunJobs&&, 3
&&&&4 6
JobSettings&&7 B
.&&B C
Current&&C J
.&&J K
SendOTPEmail&&K W
)&&W X
{'' 
if(( 
((( 
ApplicationSettings(( '
.((' (
Current((( /
.((/ 0
Environment((0 ;
.((; <
ToUpper((< C
(((C D
)((D E
==((F H
$str((I O
)((O P
{)) 
foreach** 
(** 
var**  
item**! %
in**& (
pendingEmails**) 6
)**6 7
{++ 
toEmailAddresses,, (
=,,) *
item,,+ /
.,,/ 0
ToEmployeeEmail,,0 ?
.,,? @
Split,,@ E
(,,E F
$str,,F I
,,,I J
StringSplitOptions,,K ]
.,,] ^
RemoveEmptyEntries,,^ p
),,p q
.,,q r
ToList,,r x
(,,x y
),,y z
;,,z {
await.. 
	SendEmail.. '
(..' (
item..( ,
..., -
Subject..- 4
,..4 5
item..6 :
...: ;
	Emailbody..; D
,..D E
toEmailAddresses..F V
...V W
ToArray..W ^
(..^ _
).._ `
)..` a
;..a b
}// 
}00 
else11 
{22 
foreach33 
(33 
var33  
item33! %
in33& (
pendingEmails33) 6
)336 7
{44 
toEmailAddresses55 (
=55) *
EmailConfiguration55+ =
.55= >
Current55> E
.55E F
ToEmailAddress55F T
.55T U
Split55U Z
(55Z [
$str55[ ^
,55^ _
StringSplitOptions55` r
.55r s
RemoveEmptyEntries	55s Ö
)
55Ö Ü
.
55Ü á
ToList
55á ç
(
55ç é
)
55é è
;
55è ê
await77 
	SendEmail77 '
(77' (
item77( ,
.77, -
Subject77- 4
,774 5
item776 :
.77: ;
	Emailbody77; D
,77D E
toEmailAddresses77F V
.77V W
ToArray77W ^
(77^ _
)77_ `
)77` a
;77a b
}88 
}99 
}:: 
isFlag;; 
=;; 
true;; 
;;; 
}<< 	
private== 
async== 
Task== 
	SendEmail== $
(==$ %
string==% +
mailSubject==, 7
,==7 8
string==9 ?
mailBody==@ H
,==H I
string==J P
[==P Q
]==Q R
toEmailAddresses==S c
)==c d
{>> 	
SendEmailService?? 
sendEmailService?? -
=??. /
new??0 3
SendEmailService??4 D
(??D E
)??E F
;??F G
sendEmailService@@ 
.@@ 
EmailSubject@@ )
=@@* +
mailSubject@@, 7
;@@7 8
sendEmailServiceAA 
.AA 
	EmailBodyAA &
=AA' (
mailBodyAA) 1
;AA1 2
sendEmailServiceBB 
.BB 
ToEmailAddressesBB -
=BB. /
toEmailAddressesBB0 @
;BB@ A
awaitCC 
sendEmailServiceCC "
.CC" #
	SendEmailCC# ,
(CC, -
)CC- .
;CC. /
}ff 	
privategg 
voidgg 
OnEmailSentCompletegg (
(gg( )
objectgg) /
sendergg0 6
,gg6 7#
AsyncCompletedEventArgsgg8 O
eggP Q
)ggQ R
{hh 	
}jj 	
publicll 
asyncll 
Taskll 

StartAsyncll $
(ll$ %
CancellationTokenll% 6
cancellationTokenll7 H
)llH I
{mm 	
loggernn 
.nn 
LogInfonn 
(nn 
$strnn 3
)nn3 4
;nn4 5
awaitpp 
Taskpp 
.pp 
CompletedTaskpp $
;pp$ %
}qq 	
privatess 
asyncss 
voidss "
SendEmailNotificationsss 1
(ss1 2
objectss2 8
statess9 >
)ss> ?
{tt 	
ifuu 
(uu 
isFlaguu 
)uu 
{vv 
isFlagww 
=ww 
falseww 
;ww 
ifyy 
(yy 
ApplicationSettingsyy '
.yy' (
Currentyy( /
.yy/ 0
RunJobsyy0 7
&&yy8 :
JobSettingsyy; F
.yyF G
CurrentyyG N
.yyN O
SendOTPEmailyyO [
)yy[ \
{zz 
List{{ 
<{{  
EmailOtpVerification{{ -
>{{- .
pendingEmails{{/ <
={{= >
await{{? D 
sendEmailApplication{{E Y
.{{Y Z
GetPendingOTPEmails{{Z m
({{m n
){{n o
;{{o p
if|| 
(|| 
JobSettings|| #
.||# $
Current||$ +
.||+ ,
SendOTPEmail||, 8
&&||9 ;
pendingEmails||< I
.||I J
Count||J O
>||P Q
$num||R S
)||S T
{}} 
await~~ $
SendOTPEmailNotification~~ 6
(~~6 7
pendingEmails~~7 D
)~~D E
;~~E F
} 
}
ÄÄ 
else
ÅÅ 
{
ÇÇ 
isFlag
ÉÉ 
=
ÉÉ 
true
ÉÉ !
;
ÉÉ! "
}
ÑÑ 
}
ÖÖ 
}
áá 	
public
ââ 
Task
ââ 
	StopAsync
ââ 
(
ââ 
CancellationToken
ââ /
cancellationToken
ââ0 A
)
ââA B
{
ää 	
return
ãã 
Task
ãã 
.
ãã 
CompletedTask
ãã %
;
ãã% &
}
åå 	
}
çç 
}éé ä 
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\HostedService\LeaveAutoApprovalService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
HostedService +
{ 
public 

class $
LeaveAutoApprovalService )
:* +
IHostedService, :
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly 
Timer 
AutoApprovalTimer 0
;0 1
private 
readonly )
ILeaveAutoApprovalApplication 6
leaveautoapprovals7 I
;I J
private 
bool 
isFlag 
= 
true "
;" #
public $
LeaveAutoApprovalService '
(' (
ILoggerManager( 6
logger7 =
,= >)
ILeaveAutoApprovalApplication? \
leaveautoapprovals] o
)o p
{ 	
this 
. 
logger 
= 
logger  
;  !
this 
. 
leaveautoapprovals #
=$ %
leaveautoapprovals& 8
;8 9
AutoApprovalTimer 
= 
new "
Timer# (
(( )
LeaveAutoApproval) :
,: ;
null< @
,@ A
TimeSpanB J
.J K
ZeroK O
,O P
TimeSpanQ Y
.Y Z
FromSecondsZ e
(e f
$numf h
)h i
)i j
;j k
} 	
public 
async 
Task 

StartAsync $
($ %
CancellationToken% 6
cancellationToken7 H
)H I
{   	
logger!! 
.!! 
LogInfo!! 
(!! 
$str!! ;
)!!; <
;!!< =
await"" 
Task"" 
."" 
CompletedTask"" $
;""$ %
}## 	
private%% 
async%% 
void%% 
LeaveAutoApproval%% ,
(%%, -
object%%- 3
state%%4 9
)%%9 :
{&& 	
if'' 
('' 
isFlag'' 
)'' 
{(( 
if** 
(** 
JobSettings** 
.**  
Current**  '
.**' (
AutoApprovalJob**( 7
)**7 8
{++ 
if,, 
(,, 
JobSettings,, #
.,,# $
Current,,$ +
.,,+ ,
AutoApprovalJob,,, ;
&&,,< >
ApplicationSettings,,? R
.,,R S
Current,,S Z
.,,Z [
Environment,,[ f
.,,f g
ToUpper,,g n
(,,n o
),,o p
==,,q s
$str,,t z
),,z {
{-- 
isFlag.. 
=..  
false..! &
;..& '
if// 
(// 
DateTime// $
.//$ %
Now//% (
.//( )
Day//) ,
==//- /
$num//0 2
&&//3 5
DateTime//6 >
.//> ?
Now//? B
.//B C
Hour//C G
>//H I
$num//J K
&&//L N
DateTime//O W
.//W X
Now//X [
.//[ \
Hour//\ `
<//a b
$num//c d
)//d e
{00 
await11 !
leaveautoapprovals11" 4
.114 5
LeaveAutoApprovals115 G
(11G H
)11H I
;11I J
}22 
}33 
}44 
isFlag55 
=55 
true55 
;55 
}66 
}77 	
public99 
Task99 
	StopAsync99 
(99 
CancellationToken99 /
cancellationToken990 A
)99A B
{:: 	
throw;; 
new;; #
NotImplementedException;; -
(;;- .
);;. /
;;;/ 0
}<< 	
}@@ 
}AA ™%
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\HostedService\NotificationService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
HostedService +
{ 
public 

class 
NotificationService $
:% &
IHostedService' 5
{ 
bool 
enableGlobalTimer 
=  
false! &
;& '
PeriodicTimer 
timer 
; 
private 
readonly 
IMemoryCache %
memoryCache& 1
;1 2
private 
readonly 
IHubContext $
<$ %

SignalrHub% /
>/ 0
hub1 4
;4 5
private 
readonly $
INotificationApplication 1#
notificationApplication2 I
;I J
public 
NotificationService "
(" #
IMemoryCache# /
memoryCache0 ;
,; <
IHubContext= H
<H I

SignalrHubI S
>S T
hubU X
,X Y$
INotificationApplicationZ r$
notificationApplication	s ä
)
ä ã
{ 	
this 
. 
memoryCache 
= 
memoryCache *
;* +
this   
.   
hub   
=   
hub   
;   
this!! 
.!! #
notificationApplication!! (
=!!) *#
notificationApplication!!+ B
;!!B C
timer"" 
="" 
new"" 
PeriodicTimer"" %
(""% &
TimeSpan""& .
."". /
FromSeconds""/ :
("": ;
$num""; =
)""= >
)""> ?
;""? @
}## 	
public&& 
Task&& 

StartAsync&& 
(&& 
CancellationToken&& 0
cancellationToken&&1 B
)&&B C
{'' 	
GetNotifications(( 
((( 
)(( 
;(( 
enableGlobalTimer** 
=** 
true**  $
;**$ %
return++ 
Task++ 
.++ 
CompletedTask++ %
;++% &
},, 	
private.. 
async.. 
Task.. 
GetNotifications.. +
(..+ ,
).., -
{// 	
List00 
<00 
NotificationDetail00 #
>00# $
notifications00% 2
=003 4
new005 8
List009 =
<00= >
NotificationDetail00> P
>00P Q
(00Q R
)00R S
;00S T

Dictionary11 
<11 
string11 
,11 
string11 %
>11% &

hubClients11( 2
=113 4
memoryCache115 @
.11@ A
Get11A D
(11D E
$str11E Q
)11Q R
as11S U

Dictionary11V `
<11` a
string11a g
,11g h
string11i o
>11o p
;11p q
while33 
(33 
await33 
timer33 "
.33" # 
WaitForNextTickAsync33# 7
(337 8
)338 9
)339 :
{44 
if55 
(55 

hubClients55 
!=55 !
null55" &
)55& '
{66 
foreach77 
(77 
KeyValuePair77 )
<77) *
string77* 0
,770 1
string772 8
>778 9
item77: >
in77? A

hubClients77B L
)77L M
{88 
int99 
employeeSlno99 (
=99) *
item99+ /
.99/ 0
Value990 5
.995 6
ToInt32OrDefault996 F
(99F G
)99G H
;99H I
notifications:: %
=::& '
await::( -#
notificationApplication::. E
.::E F
GetNotifications::F V
(::V W
employeeSlno::W c
)::c d
;::d e
await;; 
hub;; !
.;;! "
Clients;;" )
.;;) *
Clients;;* 1
(;;1 2
item;;2 6
.;;6 7
Key;;7 :
);;: ;
.;;; <
	SendAsync;;< E
(;;E F
$str;;F Y
,;;Y Z
notifications;;[ h
);;h i
;;;i j
}<< 
}== 
}>> 
}AA 	
publicCC 
TaskCC 
	StopAsyncCC 
(CC 
CancellationTokenCC /
cancellationTokenCC0 A
)CCA B
{DD 	
returnFF 
TaskFF 
.FF 
CompletedTaskFF %
;FF% &
}GG 	
}HH 
}II ˜õ
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\HostedService\ResignedEmployeesService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
HostedService +
{ 
public 

class $
ResignedEmployeesService )
:* +
IHostedService, :
{ 
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly (
IResignedEmployeeApplication 5'
resignedEmployeeApplication6 Q
;Q R
private 
readonly 
Timer 

EmailTimer )
;) *
private   
bool   
isFlag   
=   
true   "
;  " #
TimeSpan## 
timeUntilMidnight## "
=### $
TimeSpan##% -
.##- .
FromDays##. 6
(##6 7
$num##7 8
)##8 9
-##: ;
(##< =
DateTime##= E
.##E F
Now##F I
-##J K
DateTime##L T
.##T U
Now##U X
.##X Y
Date##Y ]
)##] ^
;##^ _
public$$ $
ResignedEmployeesService$$ '
($$' (
ILoggerManager$$( 6
logger$$7 =
,$$= >(
IResignedEmployeeApplication$$? ['
resignedEmployeeApplication$$\ w
)$$w x
{%% 	
this&& 
.&& 
logger&& 
=&& 
logger&&  
;&&  !
this'' 
.'' '
resignedEmployeeApplication'' ,
=''- .'
resignedEmployeeApplication''/ J
;''J K

EmailTimer(( 
=(( 
new(( 
Timer(( "
(((" #!
SendResignedEmployees((# 8
,((8 9
null((: >
,((> ?
timeUntilMidnight((@ Q
,((Q R
TimeSpan((S [
.(([ \
FromDays((\ d
(((d e
$num((e f
)((f g
)((g h
;((h i
}** 	
public++ 
async++ 
Task++ 

StartAsync++ $
(++$ %
CancellationToken++% 6
cancellationToken++7 H
)++H I
{,, 	
logger-- 
.-- 
LogInfo-- 
(-- 
$str-- <
)--< =
;--= >
await// 
Task// 
.// 
CompletedTask// $
;//$ %
}00 	
public11 
async11 
Task11  
SendResignedEmployee11 .
(11. /
string11/ 5
fileName116 >
)11> ?
{22 	
try33 
{44 
if66 
(66 
JobSettings66 
.66  
Current66  '
.66' (!
SendResignedEmployees66( =
)66= >
{77 
logger88 
.88 
LogInfo88 "
(88" #
$str88# :
+88; <
fileName88= E
)88E F
;88F G
if99 
(99 
JobSettings99 #
.99# $
Current99$ +
.99+ ,
ResignedEmployeeJob99, ?
&&99@ B
fileName99C K
!=99L N
null99O S
&&99T V
ApplicationSettings99W j
.99j k
Current99k r
.99r s
Environment99s ~
.99~ 
ToUpper	99 Ü
(
99Ü á
)
99á à
==
99â ã
$str
99å í
)
99í ì
{:: 
List;; 
<;; 
string;; #
>;;# $
toEmailAddresses;;% 5
=;;6 7
null;;8 <
;;;< =
List<< 
<<< 
string<< #
><<# $
ccEmailAddresses<<% 5
=<<6 7
null<<8 <
;<<< =
StringBuilder== %
subject==& -
===. /
new==0 3
StringBuilder==4 A
(==A B
)==B C
;==C D
subject>> 
.>>  
AppendFormat>>  ,
(>>, -&
ResignedEmailConfiguration>>- G
.>>G H
Current>>H O
.>>O P
MailSubject>>P [
,>>[ \
DateTime>>] e
.>>e f
Now>>f i
.>>i j
ToString>>j r
(>>r s
$str	>>s Ñ
)
>>Ñ Ö
)
>>Ö Ü
;
>>Ü á
toEmailAddresses@@ (
=@@) *&
ResignedEmailConfiguration@@+ E
.@@E F
Current@@F M
.@@M N
ToEmailAddress@@N \
.@@\ ]
Split@@] b
(@@b c
$str@@c f
,@@f g
StringSplitOptions@@h z
.@@z {
RemoveEmptyEntries	@@{ ç
)
@@ç é
.
@@é è
ToList
@@è ï
(
@@ï ñ
)
@@ñ ó
;
@@ó ò
ccEmailAddressesAA (
=AA) *&
ResignedEmailConfigurationAA+ E
.AAE F
CurrentAAF M
.AAM N
CcEmailAddressAAN \
.AA\ ]
SplitAA] b
(AAb c
$strAAc f
,AAf g
StringSplitOptionsAAh z
.AAz {
RemoveEmptyEntries	AA{ ç
)
AAç é
.
AAé è
ToList
AAè ï
(
AAï ñ
)
AAñ ó
;
AAó ò
	SendEmailBB !
(BB! "
subjectBB" )
.BB) *
ToStringBB* 2
(BB2 3
)BB3 4
,BB4 5&
ResignedEmailConfigurationBB6 P
.BBP Q
CurrentBBQ X
.BBX Y
	EmailbodyBBY b
,BBb c
MailSettingsBBd p
.BBp q
CurrentBBq x
.BBx y
	FromEmail	BBy Ç
,
BBÇ É
toEmailAddresses
BBÑ î
.
BBî ï
ToArray
BBï ú
(
BBú ù
)
BBù û
,
BBû ü
ccEmailAddresses
BB† ∞
.
BB∞ ±
ToArray
BB± ∏
(
BB∏ π
)
BBπ ∫
,
BB∫ ª
fileName
BBº ƒ
)
BBƒ ≈
;
BB≈ ∆
}CC 
}DD 
isFlagEE 
=EE 
trueEE 
;EE 
}FF 
catchGG 
(GG 
	ExceptionGG 
exGG 
)GG  
{HH 
loggerII 
.II 
LogErrorII 
(II  
$strII  >
+II? @
exIIA C
.IIC D
MessageIID K
)IIK L
;IIL M
throwJJ 
;JJ 
}KK 
}LL 	
privateNN 
voidNN 
	SendEmailNN 
(NN 
stringNN %
mailSubjectNN& 1
,NN1 2
stringNN3 9
mailBodyNN: B
,NNB C
stringNND J
fromEmailAddressNNK [
,NN[ \
stringNN] c
[NNc d
]NNd e
toEmailAddressesNNf v
,NNv w
stringNNx ~
[NN~ 
]	NN Ä
ccEmailAddresses
NNÅ ë
,
NNë í
string
NNì ô
fileName
NNö ¢
)
NN¢ £
{OO 	
MailMessagePP 
messagePP 
=PP  !
newPP" %
MailMessagePP& 1
(PP1 2
)PP2 3
;PP3 4

AttachmentQQ 

attachmentQQ !
=QQ" #
newQQ$ '

AttachmentQQ( 2
(QQ2 3
fileNameQQ3 ;
)QQ; <
;QQ< =
ifSS 
(SS 
fromEmailAddressSS  
.SS  !
IsValidEmailSS! -
(SS- .
)SS. /
)SS/ 0
{TT 
messageUU 
.UU 
AttachmentsUU #
.UU# $
AddUU$ '
(UU' (

attachmentUU( 2
)UU2 3
;UU3 4
messageVV 
.VV 
FromVV 
=VV 
newVV "
MailAddressVV# .
(VV. /
fromEmailAddressVV/ ?
)VV? @
;VV@ A
foreachXX 
(XX 
varXX 
	toaddressXX &
inXX' )
fromXX* .
	toaddressXX/ 8
inXX9 ;
toEmailAddressesXX< L
whereYY* /
	toaddressYY0 9
.YY9 :
IsValidEmailYY: F
(YYF G
)YYG H
selectZZ* 0
	toaddressZZ1 :
)ZZ: ;
{[[ 
message\\ 
.\\ 
To\\ 
.\\ 
Add\\ "
(\\" #
new\\# &
MailAddress\\' 2
(\\2 3
	toaddress\\3 <
)\\< =
)\\= >
;\\> ?
}]] 
foreach__ 
(__ 
var__ 
	ccaddress__ &
in__' )
from__* .
	ccaddress__/ 8
in__9 ;
ccEmailAddresses__< L
where``* /
	ccaddress``0 9
.``9 :
IsValidEmail``: F
(``F G
)``G H
selectaa* 0
	ccaddressaa1 :
)aa: ;
{bb 
messagecc 
.cc 
CCcc 
.cc 
Addcc "
(cc" #
	ccaddresscc# ,
)cc, -
;cc- .
}dd 
usingmm 
(mm 
varmm 

smtpClientmm %
=mm& '
newmm( +

SmtpClientmm, 6
(mm6 7
AwsEmailSettingsmm7 G
.mmG H
CurrentmmH O
.mmO P
HostmmP T
,mmT U
AwsEmailSettingsmmV f
.mmf g
Currentmmg n
.mmn o
Portmmo s
)mms t
)mmt u
{nn 

smtpClientoo 
.oo 
Credentialsoo *
=oo+ ,
newoo- 0
NetworkCredentialoo1 B
(ooB C
AwsEmailSettingsooC S
.ooS T
CurrentooT [
.oo[ \
UserNameoo\ d
,ood e
AwsEmailSettingsoof v
.oov w
Currentoow ~
.oo~ 
Password	oo á
)
ooá à
;
ooà â
messagepp 
.pp 
Frompp  
=pp! "
newpp# &
MailAddresspp' 2
(pp2 3
fromEmailAddresspp3 C
)ppC D
;ppD E
messageqq 
.qq 
Subjectqq #
=qq$ %
mailSubjectqq& 1
;qq1 2
messagerr 
.rr 

IsBodyHtmlrr &
=rr' (
truerr) -
;rr- .
messagess 
.ss 
Bodyss  
=ss! "
mailBodyss# +
;ss+ ,

smtpClienttt 
.tt !
UseDefaultCredentialstt 4
=tt5 6
falsett7 <
;tt< =

smtpClientuu 
.uu 
	EnableSsluu (
=uu) *
trueuu+ /
;uu/ 0

smtpClientvv 
.vv 
DeliveryMethodvv -
=vv. /
SmtpDeliveryMethodvv0 B
.vvB C
NetworkvvC J
;vvJ K

smtpClientww 
.ww 
Sendww #
(ww# $
messageww$ +
)ww+ ,
;ww, -
}xx 
}yy 
}zz 	
private{{ 
async{{ 
void{{ !
SendResignedEmployees{{ 0
({{0 1
object{{1 7
state{{8 =
){{= >
{|| 	
logger}} 
.}} 
LogInfo}} 
(}} 
$str}} ;
)}}; <
;}}< =
if~~ 
(~~ 
isFlag~~ 
&&~~ 
JobSettings~~ %
.~~% &
Current~~& -
.~~- .
ResignedEmployeeJob~~. A
)~~A B
{ 
isFlag
ÄÄ 
=
ÄÄ 
false
ÄÄ 
;
ÄÄ 
string
ÅÅ 
directoryName
ÅÅ $
=
ÅÅ% &
new
ÅÅ' *
StringBuilder
ÅÅ+ 8
(
ÅÅ8 9
)
ÅÅ9 :
.
ÅÅ: ;
Append
ÅÅ; A
(
ÅÅA B
$"
ÅÅB D
{
ÅÅD E
DateTime
ÅÅE M
.
ÅÅM N
Now
ÅÅN Q
.
ÅÅQ R
ToString
ÅÅR Z
(
ÅÅZ [
$str
ÅÅ[ l
)
ÅÅl m
}
ÅÅm n
"
ÅÅn o
)
ÅÅo p
.
ÅÅp q
ToString
ÅÅq y
(
ÅÅy z
)
ÅÅz {
;
ÅÅ{ |
string
ÇÇ 
templateFile
ÇÇ #
=
ÇÇ$ %
Path
ÇÇ& *
.
ÇÇ* +
Combine
ÇÇ+ 2
(
ÇÇ2 3!
ApplicationSettings
ÇÇ3 F
.
ÇÇF G
Current
ÇÇG N
.
ÇÇN O
TemplateFilesPath
ÇÇO `
)
ÇÇ` a
;
ÇÇa b
string
ÉÉ 
directoryPath
ÉÉ $
=
ÉÉ% &
Path
ÉÉ' +
.
ÉÉ+ ,
Combine
ÉÉ, 3
(
ÉÉ3 4!
ApplicationSettings
ÉÉ4 G
.
ÉÉG H
Current
ÉÉH O
.
ÉÉO P!
DailyOutPutFilePath
ÉÉP c
,
ÉÉc d
directoryName
ÉÉe r
)
ÉÉr s
;
ÉÉs t
StringBuilder
ÑÑ 

sbFileName
ÑÑ (
=
ÑÑ) *
new
ÑÑ+ .
StringBuilder
ÑÑ/ <
(
ÑÑ< =
)
ÑÑ= >
;
ÑÑ> ?

sbFileName
ÖÖ 
.
ÖÖ 
AppendFormat
ÖÖ '
(
ÖÖ' (
$str
ÖÖ( D
,
ÖÖD E
DateTime
ÖÖF N
.
ÖÖN O
Now
ÖÖO R
.
ÖÖR S
ToString
ÖÖS [
(
ÖÖ[ \
$str
ÖÖ\ m
)
ÖÖm n
)
ÖÖn o
;
ÖÖo p
string
ÜÜ 
generatedFileName
ÜÜ (
=
ÜÜ) *

sbFileName
ÜÜ+ 5
.
ÜÜ5 6
ToString
ÜÜ6 >
(
ÜÜ> ?
)
ÜÜ? @
;
ÜÜ@ A
var
àà 
fileName
àà 
=
àà 
Path
àà #
.
àà# $
Combine
àà$ +
(
àà+ ,
directoryPath
àà, 9
,
àà9 :
generatedFileName
àà; L
)
ààL M
;
ààM N
List
ää 
<
ää 
ResignedEmployee
ää %
>
ää% &

reportData
ää' 1
=
ää2 3
await
ää4 9)
resignedEmployeeApplication
ää: U
.
ääU V"
GetResignedEmployees
ääV j
(
ääj k
)
ääk l
;
ääl m
if
ãã 
(
ãã 

reportData
ãã 
!=
ãã !
null
ãã" &
&&
ãã' )

reportData
ãã* 4
.
ãã4 5
Count
ãã5 :
>
ãã; <
$num
ãã= >
)
ãã> ?
{
åå 
logger
éé 
.
éé 
LogInfo
éé "
(
éé" #
$str
éé# G
)
ééG H
;
ééH I
var
êê 
response
êê 
=
êê  !
ExportToExcel
êê" /
(
êê/ 0

reportData
êê0 :
,
êê: ;
directoryPath
ëë" /
,
ëë/ 0
generatedFileName
íí" 3
,
íí3 4
templateFile
ìì" .
)
ìì. /
;
ìì/ 0
logger
îî 
.
îî 
LogInfo
îî "
(
îî" #
$str
îî# R
)
îîR S
;
îîS T
logger
ïï 
.
ïï 
LogInfo
ïï "
(
ïï" #
$str
ïï# \
)
ïï\ ]
;
ïï] ^
if
ññ 
(
ññ 
response
ññ  
)
ññ  !
{
óó 
logger
òò 
.
òò 
LogInfo
òò &
(
òò& '
generatedFileName
òò' 8
)
òò8 9
;
òò9 :"
SendResignedEmployee
ôô ,
(
ôô, -
fileName
ôô- 5
)
ôô5 6
;
ôô6 7
}
öö 
else
õõ 
{
úú 
logger
ùù 
.
ùù 
LogWarn
ùù &
(
ùù& '
$str
ùù' N
)
ùùN O
;
ùùO P
}
ûû 
}
üü 
else
†† 
{
°° 
logger
¢¢ 
.
¢¢ 
LogWarn
¢¢ "
(
¢¢" #
$str
¢¢# J
)
¢¢J K
;
¢¢K L
logger
££ 
.
££ 
LogWarn
££ "
(
££" #
$str
££# =
)
££= >
;
££> ?"
SendResignedEmployee
§§ (
(
§§( )
fileName
§§) 1
)
§§1 2
;
§§2 3
}
•• 
logger
¶¶ 
.
¶¶ 
LogInfo
¶¶ 
(
¶¶ 
$str
¶¶ b
)
¶¶b c
;
¶¶c d
}
ßß 
else
®® 
{
©© 
logger
™™ 
.
™™ 
LogWarn
™™ 
(
™™ 
$str
™™ g
)
™™g h
;
™™h i
}
¨¨ 
}
≠≠ 	
public
ØØ 
Task
ØØ 
	StopAsync
ØØ 
(
ØØ 
CancellationToken
ØØ /
cancellationToken
ØØ0 A
)
ØØA B
{
∞∞ 	
return
±± 
Task
±± 
.
±± 
CompletedTask
±± %
;
±±% &
}
≤≤ 	
public
¥¥ 
bool
¥¥ 
ExportToExcel
¥¥ !
(
¥¥! "
List
¥¥" &
<
¥¥& '
ResignedEmployee
¥¥' 7
>
¥¥7 8

reportData
¥¥9 C
,
¥¥C D
string
¥¥E K
directoryPath
¥¥L Y
,
¥¥Y Z
string
¥¥[ a
fileName
¥¥b j
,
¥¥j k
string
¥¥k q
templateFile
¥¥r ~
)
¥¥~ 
{
µµ 	
bool
∂∂ 
response
∂∂ 
=
∂∂ 
false
∂∂ !
;
∂∂! "
try
∑∑ 
{
∏∏ 
	Directory
ºº 
.
ºº 
CreateDirectory
ºº )
(
ºº) *
directoryPath
ºº* 7
)
ºº7 8
;
ºº8 9
fileName
ΩΩ 
=
ΩΩ 
Path
ΩΩ 
.
ΩΩ  
Combine
ΩΩ  '
(
ΩΩ' (
directoryPath
ΩΩ( 5
,
ΩΩ5 6
fileName
ΩΩ7 ?
)
ΩΩ? @
;
ΩΩ@ A
logger
ææ 
.
ææ 
LogInfo
ææ 
(
ææ 
fileName
ææ '
)
ææ' (
;
ææ( )
logger
øø 
.
øø 
LogInfo
øø 
(
øø 
templateFile
øø +
)
øø+ ,
;
øø, -
using
¡¡ 
(
¡¡ 

XLTemplate
¡¡ !
template
¡¡" *
=
¡¡+ ,
new
¡¡- 0

XLTemplate
¡¡1 ;
(
¡¡; <
templateFile
¡¡< H
)
¡¡H I
)
¡¡I J
{
¬¬ 
template
√√ 
.
√√ 
AddVariable
√√ (
(
√√( )
$str
√√) 7
,
√√7 8(
ResignedEmailConfiguration
√√9 S
.
√√S T
Current
√√T [
.
√√[ \
SentTo
√√\ b
)
√√b c
;
√√c d
template
ƒƒ 
.
ƒƒ 
AddVariable
ƒƒ (
(
ƒƒ( )
$str
ƒƒ) 5
,
ƒƒ5 6
DateTime
ƒƒ7 ?
.
ƒƒ? @
Now
ƒƒ@ C
.
ƒƒC D
ToString
ƒƒD L
(
ƒƒL M
$str
ƒƒM ^
)
ƒƒ^ _
)
ƒƒ_ `
;
ƒƒ` a
template
≈≈ 
.
≈≈ 
AddVariable
≈≈ (
(
≈≈( )
$str
≈≈) 3
,
≈≈3 4

reportData
≈≈5 ?
)
≈≈? @
;
≈≈@ A
template
«« 
.
«« 
Generate
«« %
(
««% &
)
««& '
;
««' (
template
»» 
.
»» 
SaveAs
»» #
(
»»# $
fileName
»»$ ,
)
»», -
;
»»- .
template
…… 
.
…… 
Dispose
…… $
(
……$ %
)
……% &
;
……& '
GC
   
.
   
Collect
   
(
   
)
    
;
    !
GC
ÀÀ 
.
ÀÀ &
WaitForPendingFinalizers
ÀÀ /
(
ÀÀ/ 0
)
ÀÀ0 1
;
ÀÀ1 2
GC
ÃÃ 
.
ÃÃ 
Collect
ÃÃ 
(
ÃÃ 
)
ÃÃ  
;
ÃÃ  !
response
ÕÕ 
=
ÕÕ 
true
ÕÕ #
;
ÕÕ# $
}
ŒŒ 
return
œœ 
response
œœ 
;
œœ  
}
–– 
catch
—— 
(
—— 
	Exception
—— 
ex
—— 
)
——  
{
““ 
logger
”” 
.
”” 
LogError
”” 
(
””  
$str
””  M
+
””N O
ex
””P R
.
””R S
Message
””S Z
)
””Z [
;
””[ \
throw
‘‘ 
;
‘‘ 
}
’’ 
}
÷÷ 	
}
ÿÿ 
}ŸŸ ˘
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\HostedService\VisitorCountService.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
HostedService +
{ 
public 

class 
VisitorCountService $
:% &
IHostedService' 5
{ 
PeriodicTimer 
timer 
; 
private 
readonly 
IHubContext $
<$ %

SignalrHub% /
>/ 0
hub1 4
;4 5
private 
readonly #
IVistorCountApplication 0#
visitorCountApplication1 H
;H I
public 
VisitorCountService "
(" #
IHubContext# .
<. /

SignalrHub/ 9
>9 :
hub; >
,> ?#
IVistorCountApplication@ W#
visitorCountApplicationX o
)o p
{   	
this!! 
.!! 
hub!! 
=!! 
hub!! 
;!! 
this"" 
."" #
visitorCountApplication"" (
="") *#
visitorCountApplication""+ B
;""B C
}## 	
public%% 
Task%% 

StartAsync%% 
(%% 
CancellationToken%% 0
cancellationToken%%1 B
)%%B C
{&& 	
timer'' 
='' 
new'' 
PeriodicTimer'' %
(''% &
TimeSpan''& .
.''. /
FromSeconds''/ :
('': ;
$num''; <
)''< =
)''= >
;''> ?
GetVisitorCount(( 
((( 
)(( 
;(( 
return++ 
Task++ 
.++ 
CompletedTask++ %
;++% &
},, 	
private.. 
async.. 
void.. 
GetVisitorCount.. *
(..* +
)..+ ,
{// 	
while00 
(00 
await00 
timer00 
.00  
WaitForNextTickAsync00 3
(003 4
)004 5
)005 6
{11 
int22 

usersCount22 
=22  
await22! &#
visitorCountApplication22' >
.22> ?
GetVisitorCount22? N
(22N O
)22O P
;22P Q
await33 
hub33 
.33 
Clients33 !
.33! "
All33" %
.33% &
	SendAsync33& /
(33/ 0
$str330 A
,33A B

usersCount33C M
)33M N
;33N O
}44 
}77 	
public99 
Task99 
	StopAsync99 
(99 
CancellationToken99 /
cancellationToken990 A
)99A B
{:: 	
timer;; 
.;; 
Dispose;; 
(;; 
);; 
;;; 
return<< 
Task<< 
.<< 
CompletedTask<< %
;<<% &
}== 	
}>> 
}?? ’
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Hubs\AutoApprovalHub.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Hubs "
{ 
public		 

class		 
AutoApprovalHub		  
:		  !
Hub		" %
<		% &
IAutoApproval		& 3
>		3 4
{

 
private 
HttpContext 
httpContext '
;' (
public 
IMemoryCache 
_memoryCache (
;( )
public 
AutoApprovalHub 
( 
IMemoryCache +
memoryCache, 7
)7 8
{ 	
_memoryCache 
= 
memoryCache &
;& '
} 	
public 
override 
Task 
OnConnectedAsync -
(- .
). /
{ 	
this 
. 
httpContext 
= 
this #
.# $
Context$ +
.+ ,
GetHttpContext, :
(: ;
); <
;< =
if 
( 
! 
_memoryCache 
. 
TryGetValue )
() *
Context* 1
.1 2
ConnectionId2 >
,> ?
out@ C
varD G
loggedInEmployeeIdH Z
)Z [
)[ \
{ 
var 
cacheExpiryOptions &
=' (
new) ,#
MemoryCacheEntryOptions- D
{ 
Priority 
= 
CacheItemPriority 0
.0 1
High1 5
,5 6
} 
; 
loggedInEmployeeId "
=# $
Context% ,
., -
GetHttpContext- ;
(; <
)< =
.= >
Request> E
.E F
QueryF K
[K L
$strL \
]\ ]
;] ^
_memoryCache 
. 
Set  
(  !
Context! (
.( )
ConnectionId) 5
,5 6
loggedInEmployeeId7 I
.I J
ToStringOrDefaultJ [
([ \
)\ ]
,] ^
cacheExpiryOptions_ q
)q r
;r s
} 
else   
{!! 
var"" 
k"" 
="" 
Context"" 
.""  
GetHttpContext""  .
("". /
)""/ 0
.""0 1
Request""1 8
.""8 9
Query""9 >
[""> ?
$str""? O
]""O P
;""P Q
}## 
return$$ 
base$$ 
.$$ 
OnConnectedAsync$$ (
($$( )
)$$) *
;$$* +
}%% 	
}&& 
}'' Œ
^F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Hubs\IAutoApproval.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Hubs "
{ 
public 

	interface 
IAutoApproval "
{		 
Task

 
DisplayMessage

 
(

 
string

 "
message

# *
)

* +
;

+ ,
Task 
UpdateProgressBar 
( 
int "

percentage# -
)- .
;. /
Task "
DisplayProgressMessage #
(# $
string$ *
message+ 2
)2 3
;3 4
Task 
ShowNotifications 
( 
List #
<# $
AutoApprovalDetails$ 7
>7 8
autoapprovals9 F
)F G
;G H
} 
} ƒ
^F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Hubs\ISendingEmail.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Hubs "
{ 
public 

	interface 
ISendingEmail "
{		 
Task

 
DisplayMessage

 
(

 
string

 "
message

# *
)

* +
;

+ ,
Task 
UpdateProgressBar 
( 
int "

percentage# -
)- .
;. /
Task "
DisplayProgressMessage #
(# $
string$ *
message+ 2
)2 3
;3 4
Task 
ShowNotifications 
( 
List #
<# $
EmailDetails$ 0
>0 1

sendemails2 <
)< =
;= >
} 
} •
\F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Hubs\ISignalrHub.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Hubs "
{ 
public 

	interface 
ISignalrHub  
{		 
Task

 
DisplayMessage

 
(

 
string

 "
message

# *
)

* +
;

+ ,
Task 
UpdateProgressBar 
( 
int "

percentage# -
)- .
;. /
Task "
DisplayProgressMessage #
(# $
string$ *
message+ 2
)2 3
;3 4
Task 
ShowNotifications 
( 
List #
<# $
NotificationDetail$ 6
>6 7
notifications8 E
)E F
;F G
Task 
GetVisitorCount 
( 
) 
; 
} 
} ’
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Hubs\SendingEmailHub.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Hubs "
{ 
public		 

class		 
sendingemailhub		  
:		! "
Hub		# &
<		& '
ISendingEmail		' 4
>		4 5
{

 
private 
HttpContext 
httpContext '
;' (
public 
IMemoryCache 
_memoryCache (
;( )
public 
sendingemailhub 
( 
IMemoryCache +
memoryCache, 7
)7 8
{ 	
_memoryCache 
= 
memoryCache &
;& '
} 	
public 
override 
Task 
OnConnectedAsync -
(- .
). /
{ 	
this 
. 
httpContext 
= 
this #
.# $
Context$ +
.+ ,
GetHttpContext, :
(: ;
); <
;< =
if 
( 
! 
_memoryCache 
. 
TryGetValue )
() *
Context* 1
.1 2
ConnectionId2 >
,> ?
out@ C
varD G
loggedInEmployeeIdH Z
)Z [
)[ \
{ 
var 
cacheExpiryOptions &
=' (
new) ,#
MemoryCacheEntryOptions- D
{ 
Priority 
= 
CacheItemPriority 0
.0 1
High1 5
,5 6
} 
; 
loggedInEmployeeId "
=# $
Context% ,
., -
GetHttpContext- ;
(; <
)< =
.= >
Request> E
.E F
QueryF K
[K L
$strL \
]\ ]
;] ^
_memoryCache 
. 
Set  
(  !
Context! (
.( )
ConnectionId) 5
,5 6
loggedInEmployeeId7 I
.I J
ToStringOrDefaultJ [
([ \
)\ ]
,] ^
cacheExpiryOptions_ q
)q r
;r s
}   
else!! 
{"" 
var## 
k## 
=## 
Context## 
.##  
GetHttpContext##  .
(##. /
)##/ 0
.##0 1
Request##1 8
.##8 9
Query##9 >
[##> ?
$str##? O
]##O P
;##P Q
}$$ 
return%% 
base%% 
.%% 
OnConnectedAsync%% (
(%%( )
)%%) *
;%%* +
}&& 	
}'' 
}(( ∆.
[F:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Hubs\SignalrHub.cs
	namespace 	
Phoenix
 
. 
Web 
. 
Service 
. 
Hubs "
{ 
public 

class 

SignalrHub 
: 
Hub !
<! "
ISignalrHub" -
>- .
{ 
private 
HttpContext 
httpContext '
;' (
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
private 

Dictionary 
< 
string !
,! "
string# )
>) *

hubClients+ 5
;5 6
private 
readonly #
MemoryCacheEntryOptions 0
cacheExpiryOptions1 C
;C D
public 

SignalrHub 
( 
IMemoryCache &
memoryCache' 2
)2 3
{ 	
_memoryCache 
= 
memoryCache &
;& '
cacheExpiryOptions 
=  
new! $#
MemoryCacheEntryOptions% <
{ 
Priority 
= 
CacheItemPriority ,
., -
High- 1
,1 2
} 
; 
} 	
public 
override 
Task 
OnConnectedAsync -
(- .
). /
{   	
string!! 
loggedInEmployeeId!! %
=!!& '
string!!( .
.!!. /
Empty!!/ 4
;!!4 5

hubClients## 
=## 
_memoryCache## %
.##% &
Get##& )
<##) *

Dictionary##* 4
<##4 5
string##5 ;
,##; <
string##= C
>##C D
>##D E
(##E F
$str##F R
)##R S
;##S T
if$$ 
($$ 

hubClients$$ 
==$$ 
null$$ "
)$$" #
{%% 

hubClients&& 
=&& 
new&&  

Dictionary&&! +
<&&+ ,
string&&, 2
,&&2 3
string&&4 :
>&&: ;
(&&; <
)&&< =
;&&= >
}'' 
this)) 
.)) 
httpContext)) 
=)) 
this)) #
.))# $
Context))$ +
.))+ ,
GetHttpContext)), :
()): ;
))); <
;))< =
if** 
(** 
!** 

hubClients** 
.** 
ContainsValue** )
(**) *
Context*** 1
.**1 2
ConnectionId**2 >
)**> ?
)**? @
{++ 
loggedInEmployeeId,, "
=,,# $
Context,,% ,
.,,, -
GetHttpContext,,- ;
(,,; <
),,< =
.,,= >
Request,,> E
.,,E F
Query,,F K
[,,K L
$str,,L \
],,\ ]
;,,] ^

hubClients-- 
.-- 
Add-- 
(-- 
Context-- &
.--& '
ConnectionId--' 3
,--3 4
loggedInEmployeeId--5 G
.--G H
ToStringOrDefault--H Y
(--Y Z
)--Z [
)--[ \
;--\ ]
_memoryCache.. 
... 
Set..  
(..  !
$str..! -
,..- .

hubClients../ 9
,..9 :
cacheExpiryOptions..; M
)..M N
;..N O
}// 
else00 
{11 
}33 
return44 
base44 
.44 
OnConnectedAsync44 (
(44( )
)44) *
;44* +
}55 	
public77 
void77 
Hello77 
(77 
)77 
{88 	
Clients99 
.99 
Caller99 
.99 
DisplayMessage99 )
(99) *
$str99* J
)99J K
;99K L
}:: 	
public<< 
void<< "
SimulateDataProcessing<< *
(<<* +
)<<+ ,
{== 	
var>> 
	stopwatch>> 
=>> 
new>> 
	Stopwatch>>  )
(>>) *
)>>* +
;>>+ ,
	stopwatch?? 
.?? 
Start?? 
(?? 
)?? 
;?? 
intAA 
progressPercentageAA "
=AA# $
$numAA% &
;AA& '
varBB 
randomBB 
=BB 
newBB 
RandomBB #
(BB# $
)BB$ %
;BB% &
forEE 
(EE 
intEE 
iEE 
=EE 
$numEE 
;EE 
iEE 
<EE 
$numEE  "
;EE" #
iEE$ %
++EE% '
)EE' (
{FF 
intGG  
waitTimeMillisecondsGG (
=GG) *
randomGG+ 1
.GG1 2
NextGG2 6
(GG6 7
$numGG7 :
,GG: ;
$numGG< @
)GG@ A
;GGA B
ThreadHH 
.HH 
SleepHH 
(HH  
waitTimeMillisecondsHH 1
)HH1 2
;HH2 3
ClientsKK 
.KK 
CallerKK 
.KK 
UpdateProgressBarKK 0
(KK0 1
progressPercentageKK1 C
+=KKD F
$numKKG I
)KKI J
;KKJ K
}LL 
	stopwatchNN 
.NN 
StopNN 
(NN 
)NN 
;NN 
ClientsPP 
.PP 
CallerPP 
.PP "
DisplayProgressMessagePP 1
(PP1 2
$"PP2 4
$strPP4 \
{PP\ ]
	stopwatchPP] f
.PPf g
ElapsedPPg n
.PPn o
TotalSecondsPPo {
:PP{ |
$strPP| 
}	PP Ä
$str
PPÄ â
"
PPâ ä
)
PPä ã
;
PPã å
}QQ 	
}RR 
}SS ∑	
SF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Program.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
{ 
public 

class 
Program 
{   
public%% 
static%% 
void%% 
Main%% 
(%%  
string%%  &
[%%& '
]%%' (
args%%) -
)%%- .
{&&  
CreateWebHostBuilder''  
(''  !
args''! %
)''% &
.''& '
Build''' ,
('', -
)''- .
.''. /
Run''/ 2
(''2 3
)''3 4
;''4 5
}(( 	
public// 
static// 
IWebHostBuilder// % 
CreateWebHostBuilder//& :
(//: ;
string//; A
[//A B
]//B C
args//D H
)//H I
=>//J L
WebHost00 
.00  
CreateDefaultBuilder00 (
(00( )
args00) -
)00- .
.11 

UseStartup11 
<11 
Startup11 #
>11# $
(11$ %
)11% &
;11& '
}22 
}33 òŒ
SF:\Work\Office\Projects\Nspira\Portal\HRMS_API\1-Web\Phoenix.Web.Service\Startup.cs
	namespace 	
Phonix
 
. 
Web 
. 
Service 
{   
public!! 

class!! 
Startup!! 
{"" 
private## 
readonly## 
IWebHostEnvironment## ,
environment##- 8
;##8 9
public%% 
Startup%% 
(%% 
IWebHostEnvironment%% *
environment%%+ 6
)%%6 7
{&& 	
var(( 
builder(( 
=(( 
new((  
ConfigurationBuilder(( 2
(((2 3
)((3 4
.)) 
SetBasePath)) 
()) 
environment)) (
.))( )
ContentRootPath))) 8
)))8 9
.** 
AddJsonFile** 
(** 
$str** /
,**/ 0
optional**1 9
:**9 :
false**; @
,**@ A
reloadOnChange**B P
:**P Q
true**R V
)**V W
... #
AddEnvironmentVariables.. (
(..( )
)..) *
;..* +
this// 
.// 
Configuration// 
=//  
builder//! (
.//( )
Build//) .
(//. /
)/// 0
;//0 1
this00 
.00 
environment00 
=00 
environment00 *
;00* +
}11 	
private33 
IConfiguration33 
Configuration33 ,
{33- .
get33/ 2
;332 3
}334 5
public55 
void55 
ConfigureServices55 %
(55% &
IServiceCollection55& 8
services559 A
)55A B
{66 	
IFileProvider77 
physicalProvider77 *
=77+ ,
new77- 0 
PhysicalFileProvider771 E
(77E F
	Directory77F O
.77O P
GetCurrentDirectory77P c
(77c d
)77d e
)77e f
;77f g
services88 
.88 
AddSingleton88 !
(88! "
physicalProvider88" 2
)882 3
;883 4
services:: 
.:: (
AddDependencyInjectionCustom:: 1
(::1 2
)::2 3
;::3 4
services;; 
.;; "
AddResponseCompression;; +
(;;+ ,
);;, -
;;;- .
services<< 
.<< 

AddSignalR<< 
(<<  
)<<  !
;<<! "
services== 
.== 
AddSignalRCore== #
(==# $
)==$ %
;==% &
services>> 
.>>  
AddDefaultAWSOptions>> )
(>>) *
Configuration>>* 7
.>>7 8
GetAWSOptions>>8 E
(>>E F
)>>F G
)>>G H
;>>H I
servicesBB 
.BB 
AddAuthenticationBB &
(BB& '
optBB' *
=>BB+ -
{CC 
optDD 
.DD %
DefaultAuthenticateSchemeDD -
=DD. /
JwtBearerDefaultsDD0 A
.DDA B 
AuthenticationSchemeDDB V
;DDV W
optEE 
.EE 
DefaultSchemeEE !
=EE" #
JwtBearerDefaultsEE$ 5
.EE5 6 
AuthenticationSchemeEE6 J
;EEJ K
optFF 
.FF "
DefaultChallengeSchemeFF *
=FF+ ,
JwtBearerDefaultsFF- >
.FF> ? 
AuthenticationSchemeFF? S
;FFS T
}GG 
)GG 
.GG 
AddJwtBearerGG 
(GG 
optionsGG #
=>GG$ &
{HH 
optionsII 
.II  
RequireHttpsMetadataII ,
=II- .
falseII/ 4
;II4 5
optionsJJ 
.JJ 
	SaveTokenJJ !
=JJ" #
trueJJ$ (
;JJ( )
optionsKK 
.KK %
TokenValidationParametersKK 1
=KK2 3
newKK4 7%
TokenValidationParametersKK8 Q
{LL 
ValidateIssuerMM "
=MM# $
trueMM% )
,MM) *
ValidIssuerNN 
=NN  !
thisNN" &
.NN& '
ConfigurationNN' 4
[NN4 5
$strNN5 O
]NNO P
,NNP Q$
ValidateIssuerSigningKeyOO ,
=OO- .
trueOO/ 3
,OO3 4
IssuerSigningKeyPP $
=PP% &
newPP' * 
SymmetricSecurityKeyPP+ ?
(PP? @
EncodingPP@ H
.PPH I
ASCIIPPI N
.PPN O
GetBytesPPO W
(PPW X
thisPPX \
.PP\ ]
ConfigurationPP] j
[PPj k
$str	PPk Ç
]
PPÇ É
)
PPÉ Ñ
)
PPÑ Ö
,
PPÖ Ü
ValidAudienceQQ !
=QQ" #
thisQQ$ (
.QQ( )
ConfigurationQQ) 6
[QQ6 7
$strQQ7 S
]QQS T
,QQT U
ValidateAudienceRR $
=RR% &
trueRR' +
,RR+ ,
ValidateLifetimeSS $
=SS% &
trueSS' +
,SS+ ,
	ClockSkewTT 
=TT 
TimeSpanTT  (
.TT( )
ZeroTT) -
,TT- .
}UU 
;UU 
optionsWW 
.WW 
EventsWW 
=WW  
newWW! $
JwtBearerEventsWW% 4
{XX "
OnAuthenticationFailedYY *
=YY+ ,
contextYY- 4
=>YY5 7
{ZZ 
context[[ 
.[[  
Response[[  (
.[[( )

StatusCode[[) 3
=[[4 5
StatusCodes[[6 A
.[[A B!
Status401Unauthorized[[B W
;[[W X
context\\ 
.\\  
Response\\  (
.\\( )
ContentType\\) 4
=\\5 6
$str\\7 I
;\\I J
if__ 
(__ 
context__ #
.__# $
	Exception__$ -
.__- .
GetType__. 5
(__5 6
)__6 7
==__8 :
typeof__; A
(__A B)
SecurityTokenExpiredException__B _
)___ `
)__` a
{`` 
contextaa #
.aa# $
Responseaa$ ,
.aa, -
Headersaa- 4
.aa4 5
Addaa5 8
(aa8 9
$straa9 J
,aaJ K
$straaL R
)aaR S
;aaS T
}bb 
returncc 
Taskcc #
.cc# $
CompletedTaskcc$ 1
;cc1 2
}dd 
,dd 
OnChallengeee 
=ee  !
contextee" )
=>ee* ,
{ff 
contextgg 
.gg  
HandleResponsegg  .
(gg. /
)gg/ 0
;gg0 1
contexthh 
.hh  
Responsehh  (
.hh( )

StatusCodehh) 3
=hh4 5
StatusCodeshh6 A
.hhA B!
Status401UnauthorizedhhB W
;hhW X
contextii 
.ii  
Responseii  (
.ii( )
ContentTypeii) 4
=ii5 6
$strii7 I
;iiI J
ifll 
(ll 
stringll "
.ll" #
IsNullOrEmptyll# 0
(ll0 1
contextll1 8
.ll8 9
Errorll9 >
)ll> ?
)ll? @
{mm 
contextnn #
.nn# $
Errornn$ )
=nn* +
$strnn, ;
;nn; <
}oo 
ifqq 
(qq 
stringqq "
.qq" #
IsNullOrEmptyqq# 0
(qq0 1
contextqq1 8
.qq8 9
ErrorDescriptionqq9 I
)qqI J
)qqJ K
{rr 
contextss #
.ss# $
ErrorDescriptionss$ 4
=ss5 6
$strss7 v
;ssv w
}tt 
ifww 
(ww 
contextww #
.ww# $
AuthenticateFailureww$ 7
!=ww8 :
nullww; ?
&&ww@ B
contextwwC J
.wwJ K
AuthenticateFailurewwK ^
.ww^ _
GetTypeww_ f
(wwf g
)wwg h
==wwi k
typeofwwl r
(wwr s*
SecurityTokenExpiredException	wws ê
)
wwê ë
)
wwë í
{xx 
varyy #
authenticationExceptionyy  7
=yy8 9
contextyy: A
.yyA B
AuthenticateFailureyyB U
asyyV X)
SecurityTokenExpiredExceptionyyY v
;yyv w
contextzz #
.zz# $
ErrorDescriptionzz$ 4
=zz5 6
$"zz7 9
$strzz9 N
{zzN O#
authenticationExceptionzzO f
.zzf g
Expireszzg n
.zzn o
ToStringzzo w
(zzw x
$strzzx {
)zz{ |
}zz| }
"zz} ~
;zz~ 
}{{ 
return}} 
context}} &
.}}& '
Response}}' /
.}}/ 0

WriteAsync}}0 :
(}}: ;
JsonSerializer}}; I
.}}I J
	Serialize}}J S
(}}S T
new}}T W
{~~ 
error !
=" #
context$ +
.+ ,
Error, 1
,1 2
error_description
ÄÄ -
=
ÄÄ. /
context
ÄÄ0 7
.
ÄÄ7 8
ErrorDescription
ÄÄ8 H
,
ÄÄH I
}
ÅÅ 
)
ÅÅ 
)
ÅÅ 
;
ÅÅ 
}
ÇÇ 
,
ÇÇ 
}
ÑÑ 
;
ÑÑ 
}
ÖÖ 
)
ÖÖ 
;
ÖÖ 
services
ÜÜ 
.
ÜÜ 
AddAuthorization
ÜÜ %
(
ÜÜ% &
o
ÜÜ& '
=>
ÜÜ( *
{
áá 
o
àà 
.
àà 
	AddPolicy
àà 
(
àà 
$str
àà 0
,
àà0 1
policy
àà2 8
=>
àà9 ;
policy
àà< B
.
ààB C
RequireClaim
ààC O
(
ààO P
$str
ààP d
)
ààd e
)
ààe f
;
ààf g
o
ââ 
.
ââ 
	AddPolicy
ââ 
(
ââ 
$str
ââ (
,
ââ( )
policy
ââ* 0
=>
ââ1 3
policy
ââ4 :
.
ââ: ;
RequireClaim
ââ; G
(
ââG H
$str
ââH T
)
ââT U
)
ââU V
;
ââV W
o
ää 
.
ää 
	AddPolicy
ää 
(
ää 
$str
ää $
,
ää$ %
policy
ää& ,
=>
ää- /
policy
ää0 6
.
ää6 7
RequireClaim
ää7 C
(
ääC D
$str
ääD L
)
ääL M
)
ääM N
;
ääN O
}
ãã 
)
ãã 
;
ãã 
string
åå 
corsurl
åå 
=
åå 
Configuration
åå *
.
åå* +
GetValue
åå+ 3
<
åå3 4
string
åå4 :
>
åå: ;
(
åå; <
$str
åå< Y
)
ååY Z
;
ååZ [
services
éé 
.
éé 
AddCors
éé 
(
éé 
options
éé $
=>
éé% '
{
èè 
options
êê 
.
êê 
	AddPolicy
êê !
(
êê! "
$str
êê" 2
,
êê2 3
builder
ëë 
=>
ëë 
{
íí 
builder
ìì 
.
îî 
WithOrigins
îî (
(
îî( )
corsurl
îî) 0
)
îî0 1
.
ïï 
AllowAnyHeader
ïï +
(
ïï+ ,
)
ïï, -
.
ññ 
AllowCredentials
ññ -
(
ññ- .
)
ññ. /
.
óó 9
+SetIsOriginAllowedToAllowWildcardSubdomains
óó H
(
óóH I
)
óóI J
.
òò 
AllowAnyMethod
òò +
(
òò+ ,
)
òò, -
;
òò- .
}
ôô 
)
ôô 
;
ôô 
}
¢¢ 
)
¢¢ 
;
¢¢ 
services
££ 
.
££  
AddResponseCaching
££ '
(
££' (
)
££( )
;
££) *
services
§§ 
.
§§ 
AddMemoryCache
§§ #
(
§§# $
)
§§$ %
;
§§% &
services
•• 
.
•• 

AddMvcJson
•• 
(
••  
)
••  !
;
••! "
services
¶¶ 
.
¶¶ 

AddOptions
¶¶ 
(
¶¶  
)
¶¶  !
;
¶¶! "
RegisterLogging
ßß 
(
ßß 
services
ßß $
)
ßß$ %
;
ßß% &
services
®® 
=
®® 
LoadAppSettings
®® &
(
®®& '
services
®®' /
)
®®/ 0
;
®®0 1
services
©© 
.
©© ,
AddSwaggerGenNewtonsoftSupport
©© 3
(
©©3 4
)
©©4 5
;
©©5 6
services
™™ 
.
™™ &
AddDistributedRedisCache
™™ -
(
™™- .
options
™™. 5
=>
™™6 8
{
´´ 
options
¨¨ 
.
¨¨ 
Configuration
¨¨ %
=
¨¨& '
Configuration
¨¨( 5
.
¨¨5 6!
GetConnectionString
¨¨6 I
(
¨¨I J
$str
¨¨J a
)
¨¨a b
;
¨¨b c
options
≠≠ 
.
≠≠ 
InstanceName
≠≠ $
=
≠≠% &
$str
≠≠' /
;
≠≠/ 0
}
ÆÆ 
)
ÆÆ 
;
ÆÆ 
services
ØØ 
.
ØØ 
AddSwaggerGen
ØØ "
(
ØØ" #
options
ØØ# *
=>
ØØ+ -
{
∞∞ 
options
±± 
.
±± 
CustomSchemaIds
±± '
(
±±' (
type
±±( ,
=>
±±- /
type
±±0 4
.
±±4 5
ToString
±±5 =
(
±±= >
)
±±> ?
)
±±? @
;
±±@ A
}
≤≤ 
)
≤≤ 
;
≤≤ 
if
≥≥ 
(
≥≥ !
ApplicationSettings
≥≥ #
.
≥≥# $
Current
≥≥$ +
.
≥≥+ ,
RunJobs
≥≥, 3
)
≥≥3 4
{
¥¥ !
InstantiateCronJobs
µµ #
(
µµ# $
services
µµ$ ,
)
µµ, -
;
µµ- .
}
∂∂ 
services
∑∑ 
.
∑∑ 
AddHostedService
∑∑ %
<
∑∑% &!
NotificationService
∑∑& 9
>
∑∑9 :
(
∑∑: ;
)
∑∑; <
;
∑∑< =
services
∏∏ 
.
∏∏ 
AddHostedService
∏∏ %
<
∏∏% &!
VisitorCountService
∏∏& 9
>
∏∏9 :
(
∏∏: ;
)
∏∏; <
;
∏∏< =
services
ππ 
.
ππ 
AddHostedService
ππ %
<
ππ% &&
EmailNotificationService
ππ& >
>
ππ> ?
(
ππ? @
)
ππ@ A
;
ππA B
services
ªª 
.
ªª 
AddHostedService
ªª %
<
ªª% &%
GenerateEmailOTPService
ªª& =
>
ªª= >
(
ªª> ?
)
ªª? @
;
ªª@ A
services
ΩΩ 
.
ΩΩ 
AddHostedService
ΩΩ %
<
ΩΩ% &'
AppointmentLettersService
ΩΩ& ?
>
ΩΩ? @
(
ΩΩ@ A
)
ΩΩA B
;
ΩΩB C
}
ææ 	
public
øø 
void
øø 
InitializeDapper
øø $
(
øø$ %
string
øø% +

@namespace
øø, 6
)
øø6 7
{
¿¿ 	
}
¬¬ 	
private
√√  
IServiceCollection
√√ "
LoadAppSettings
√√# 2
(
√√2 3 
IServiceCollection
√√3 E
services
√√F N
)
√√N O
{
ƒƒ 	
var
≈≈ 
	appConfig
≈≈ 
=
≈≈ 
new
≈≈ !
ApplicationSettings
≈≈  3
(
≈≈3 4
)
≈≈4 5
;
≈≈5 6
this
∆∆ 
.
∆∆ 
Configuration
∆∆ 
.
∆∆ 
Bind
∆∆ #
(
∆∆# $
$str
∆∆$ 9
,
∆∆9 :
	appConfig
∆∆; D
)
∆∆D E
;
∆∆E F
services
«« 
.
«« 
AddSingleton
«« !
(
««! "
	appConfig
««" +
)
««+ ,
;
««, -
var
…… 
nConnectSettings
……  
=
……! "
new
……# &
NConnectSettings
……' 7
(
……7 8
)
……8 9
;
……9 :
this
   
.
   
Configuration
   
.
   
Bind
   #
(
  # $
$str
  $ 6
,
  6 7
nConnectSettings
  8 H
)
  H I
;
  I J
services
ÀÀ 
.
ÀÀ 
AddSingleton
ÀÀ !
(
ÀÀ! "
nConnectSettings
ÀÀ" 2
)
ÀÀ2 3
;
ÀÀ3 4
List
ÕÕ 
<
ÕÕ 
OracleSettings
ÕÕ 
>
ÕÕ  
dbConfig
ÕÕ! )
=
ÕÕ* +
Configuration
ÕÕ, 9
.
ÕÕ9 :

GetSection
ÕÕ: D
(
ÕÕD E
$str
ÕÕE U
)
ÕÕU V
.
ÕÕV W
Get
ÕÕW Z
<
ÕÕZ [
List
ÕÕ[ _
<
ÕÕ_ `
OracleSettings
ÕÕ` n
>
ÕÕn o
>
ÕÕo p
(
ÕÕp q
)
ÕÕq r
;
ÕÕr s
OracleSettings
ŒŒ 
oracleSettings
ŒŒ )
=
ŒŒ* +
new
ŒŒ, /
OracleSettings
ŒŒ0 >
(
ŒŒ> ?
)
ŒŒ? @
;
ŒŒ@ A
foreach
œœ 
(
œœ 
var
œœ 
item
œœ 
in
œœ  
dbConfig
œœ! )
)
œœ) *
{
–– 
if
—— 
(
—— 
oracleSettings
—— !
.
——! "
Settings
——" *
==
——+ -
null
——/ 3
)
——3 4
{
““ 
oracleSettings
”” "
.
””" #
Settings
””# +
=
””+ ,
new
””, /
List
””0 4
<
””4 5
OracleSettings
””5 C
>
””C D
(
””D E
)
””E F
;
””F G
}
‘‘ 
oracleSettings
’’ 
.
’’ 
Settings
’’ '
.
’’' (
Add
’’( +
(
’’+ ,
item
’’, 0
)
’’0 1
;
’’1 2
}
÷÷ 
this
ÿÿ 
.
ÿÿ 
Configuration
ÿÿ 
.
ÿÿ 
Bind
ÿÿ #
(
ÿÿ# $
$str
ÿÿ$ 4
,
ÿÿ4 5
oracleSettings
ÿÿ6 D
)
ÿÿD E
;
ÿÿE F
services
ŸŸ 
.
ŸŸ 
AddSingleton
ŸŸ !
(
ŸŸ! "
dbConfig
ŸŸ" *
)
ŸŸ* +
;
ŸŸ+ ,
var
€€ 

mailConfig
€€ 
=
€€ 
new
€€  
MailSettings
€€! -
(
€€- .
)
€€. /
;
€€/ 0
this
‹‹ 
.
‹‹ 
Configuration
‹‹ 
.
‹‹ 
Bind
‹‹ #
(
‹‹# $
$str
‹‹$ 2
,
‹‹2 3

mailConfig
‹‹4 >
)
‹‹> ?
;
‹‹? @
services
›› 
.
›› 
AddSingleton
›› !
(
››! "

mailConfig
››" ,
)
››, -
;
››- .
var
ﬂﬂ  
emailConfiguration
ﬂﬂ "
=
ﬂﬂ# $
new
ﬂﬂ% ( 
EmailConfiguration
ﬂﬂ) ;
(
ﬂﬂ; <
)
ﬂﬂ< =
;
ﬂﬂ= >
this
‡‡ 
.
‡‡ 
Configuration
‡‡ 
.
‡‡ 
Bind
‡‡ #
(
‡‡# $
$str
‡‡$ 8
,
‡‡8 9 
emailConfiguration
‡‡: L
)
‡‡L M
;
‡‡M N
services
·· 
.
·· 
AddSingleton
·· !
(
··! " 
emailConfiguration
··" 4
)
··4 5
;
··5 6
var
„„ 
s3BucketSettings
„„  
=
„„! "
new
„„# &
S3BucketSettings
„„' 7
(
„„7 8
)
„„8 9
;
„„9 :
this
‰‰ 
.
‰‰ 
Configuration
‰‰ 
.
‰‰ 
Bind
‰‰ #
(
‰‰# $
$str
‰‰$ 6
,
‰‰6 7
s3BucketSettings
‰‰8 H
)
‰‰H I
;
‰‰I J
services
ÂÂ 
.
ÂÂ 
AddSingleton
ÂÂ !
(
ÂÂ! "
s3BucketSettings
ÂÂ" 2
)
ÂÂ2 3
;
ÂÂ3 4
var
ËË (
resignedEmailConfiguration
ËË *
=
ËË+ ,
new
ËË- 0(
ResignedEmailConfiguration
ËË1 K
(
ËËK L
)
ËËL M
;
ËËM N
this
ÈÈ 
.
ÈÈ 
Configuration
ÈÈ 
.
ÈÈ 
Bind
ÈÈ #
(
ÈÈ# $
$str
ÈÈ$ ?
,
ÈÈ? @(
resignedEmailConfiguration
ÈÈA [
)
ÈÈ[ \
;
ÈÈ\ ]
services
ÍÍ 
.
ÍÍ 
AddSingleton
ÍÍ !
(
ÍÍ! "(
resignedEmailConfiguration
ÍÍ" <
)
ÍÍ< =
;
ÍÍ= >
var
ÏÏ 
jwtTokenConfig
ÏÏ 
=
ÏÏ  
new
ÏÏ! $#
JwtTokenConfiguration
ÏÏ% :
(
ÏÏ: ;
)
ÏÏ; <
;
ÏÏ< =
this
ÌÌ 
.
ÌÌ 
Configuration
ÌÌ 
.
ÌÌ 
Bind
ÌÌ #
(
ÌÌ# $
$str
ÌÌ$ 4
,
ÌÌ4 5
jwtTokenConfig
ÌÌ6 D
)
ÌÌD E
;
ÌÌE F
services
ÓÓ 
.
ÓÓ 
AddSingleton
ÓÓ !
(
ÓÓ! "
jwtTokenConfig
ÓÓ" 0
)
ÓÓ0 1
;
ÓÓ1 2
var
 
awsEmailSettings
  
=
! "
new
# &
AwsEmailSettings
' 7
(
7 8
)
8 9
;
9 :
this
ÒÒ 
.
ÒÒ 
Configuration
ÒÒ 
.
ÒÒ 
Bind
ÒÒ #
(
ÒÒ# $
$str
ÒÒ$ 6
,
ÒÒ6 7
awsEmailSettings
ÒÒ8 H
)
ÒÒH I
;
ÒÒI J
services
ÚÚ 
.
ÚÚ 
AddSingleton
ÚÚ !
(
ÚÚ! "
awsEmailSettings
ÚÚ" 2
)
ÚÚ2 3
;
ÚÚ3 4
var
ÙÙ 
jobSettings
ÙÙ 
=
ÙÙ 
new
ÙÙ !
JobSettings
ÙÙ" -
(
ÙÙ- .
)
ÙÙ. /
;
ÙÙ/ 0
this
ıı 
.
ıı 
Configuration
ıı 
.
ıı 
Bind
ıı #
(
ıı# $
$str
ıı$ 1
,
ıı1 2
jobSettings
ıı3 >
)
ıı> ?
;
ıı? @
services
ˆˆ 
.
ˆˆ 
AddSingleton
ˆˆ !
(
ˆˆ! "
jobSettings
ˆˆ" -
)
ˆˆ- .
;
ˆˆ. /
var
¯¯ 
equalSettings
¯¯ 
=
¯¯ 
new
¯¯  #
EqualSettings
¯¯$ 1
(
¯¯1 2
)
¯¯2 3
;
¯¯3 4
this
˘˘ 
.
˘˘ 
Configuration
˘˘ 
.
˘˘ 
Bind
˘˘ #
(
˘˘# $
$str
˘˘$ 3
,
˘˘3 4
equalSettings
˘˘5 B
)
˘˘B C
;
˘˘C D
services
˙˙ 
.
˙˙ 
AddSingleton
˙˙ !
(
˙˙! "
equalSettings
˙˙" /
)
˙˙/ 0
;
˙˙0 1
return
˝˝ 
services
˝˝ 
;
˝˝ 
}
ˇˇ 	
public
ÄÄ 
void
ÄÄ 
	Configure
ÄÄ 
(
ÄÄ !
IApplicationBuilder
ÄÄ 1
application
ÄÄ2 =
,
ÄÄ= >!
IWebHostEnvironment
ÄÄ? R
environment
ÄÄS ^
,
ÄÄ^ _
ILoggerManager
ÄÄ` n
logger
ÄÄo u
)
ÄÄu v
{
ÅÅ 	
application
ÇÇ 
.
ÇÇ 

UseRouting
ÇÇ "
(
ÇÇ" #
)
ÇÇ# $
;
ÇÇ$ %
application
ÉÉ 
.
ÉÉ  
UseExceptionCustom
ÉÉ *
(
ÉÉ* +
)
ÉÉ+ ,
;
ÉÉ, -
application
ÑÑ 
.
ÑÑ 0
"ConfigureCustomExceptionMiddleware
ÑÑ :
(
ÑÑ: ;
)
ÑÑ; <
;
ÑÑ< =
application
ÖÖ 
.
ÖÖ $
UseResponseCompression
ÖÖ .
(
ÖÖ. /
)
ÖÖ/ 0
;
ÖÖ0 1
application
ÜÜ 
.
ÜÜ 
UseCors
ÜÜ 
(
ÜÜ  
$str
ÜÜ  0
)
ÜÜ0 1
;
ÜÜ1 2
application
áá 
.
áá 
UseAuthentication
áá )
(
áá) *
)
áá* +
;
áá+ ,
application
àà 
.
àà 
UseAuthorization
àà (
(
àà( )
)
àà) *
;
àà* +
application
ââ 
.
ââ 
UseHstsCustom
ââ %
(
ââ% &
)
ââ& '
;
ââ' (
application
ää 
.
ää !
UseHttpsRedirection
ää +
(
ää+ ,
)
ää, -
;
ää- .
application
ãã 
.
ãã 
UseStaticFiles
ãã &
(
ãã& '
)
ãã' (
;
ãã( )
application
åå 
.
åå  
UseResponseCaching
åå *
(
åå* +
)
åå+ ,
;
åå, -
application
éé 
.
éé 
UseEndpoints
éé $
(
éé$ %
routes
éé% +
=>
éé, .
{
èè 
routes
êê 
.
êê 
MapControllers
êê %
(
êê% &
)
êê& '
;
êê' (
routes
ëë 
.
ëë 
MapHub
ëë 
<
ëë 

SignalrHub
ëë (
>
ëë( )
(
ëë) *
$str
ëë* 7
)
ëë7 8
;
ëë8 9
}
íí 
)
íí 
;
íí 
application
ìì 
.
ìì 

UseSwagger
ìì "
(
ìì" #
)
ìì# $
.
îî 
UseSwaggerUI
îî %
(
îî% &
c
îî& '
=>
îî( *
{
ïï 
c
ññ 
.
ññ 
SwaggerEndpoint
ññ -
(
ññ- .
$str
ññ. H
,
ññH I
$str
ññJ V
)
ññV W
;
ññW X
c
óó 
.
óó 
ConfigObject
óó *
.
óó* +
AdditionalItems
óó+ :
.
óó: ;
Add
óó; >
(
óó> ?
$str
óó? P
,
óóP Q
false
óóR W
)
óóW X
;
óóX Y
c
òò 
.
òò 
ConfigObject
òò *
.
òò* +
AdditionalItems
òò+ :
.
òò: ;
Add
òò; >
(
òò> ?
$str
òò? F
,
òòF G
$str
òòH O
)
òòO P
;
òòP Q
}
ôô 
)
ôô 
;
ôô 
}
öö 	
private
õõ 
void
õõ 
RegisterLogging
õõ $
(
õõ$ % 
IServiceCollection
õõ% 7
services
õõ8 @
)
õõ@ A
{
úú 	
services
ùù 
.
ùù 
AddSingleton
ùù !
<
ùù! ""
IHttpContextAccessor
ùù" 6
,
ùù6 7!
HttpContextAccessor
ùù8 K
>
ùùK L
(
ùùL M
)
ùùM N
;
ùùN O
}
ûû 	
private
üü 
void
üü !
InstantiateCronJobs
üü (
(
üü( ) 
IServiceCollection
üü) ;
services
üü< D
)
üüD E
{
†† 	
}
∫∫ 	
}
⁄⁄ 
}€€ 