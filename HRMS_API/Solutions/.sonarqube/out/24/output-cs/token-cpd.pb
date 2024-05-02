Ô
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Implementations\LeaveInformationApplication.cs
	namespace		 	
Phoenix		
 
.		 
Application		 
.		 
Administration		 ,
.		, -
Implementations		- <
{

 
public 

class '
LeaveInformationApplication ,
:- .(
ILeaveInformationApplication/ K
{ 
private 
readonly #
ILeaveInformationDomain 0"
leaveInformationDomain1 G
;G H
public '
LeaveInformationApplication *
(* +#
ILeaveInformationDomain+ B"
leaveInformationDomainC Y
)Y Z
{ 	
this 
. "
leaveInformationDomain '
=( )"
leaveInformationDomain* @
;@ A
} 	
public 
async 
Task 
< 
List 
< 
LeaveInformation /
>/ 0
>0 1
GetLeaveInformation2 E
(E F
)F G
{ 	
List 
< 
LeaveInformation !
>! "#
leaveinformationdetails# :
=; <
await= B"
leaveInformationDomainC Y
.Y Z
GetLeaveInformationZ m
(m n
)n o
;o p
return #
leaveinformationdetails *
;* +
} 	
public 
async 
Task 
< 
bool 
> "
UpdateLeaveInformation  6
(6 7#
LeaveInformationSaveReq7 N
leaveInformationO _
)_ `
{ 	
bool 
isleaveinfoSaved !
=" #
await$ )"
leaveInformationDomain* @
.@ A"
UpdateLeaveInformationA W
(W X
leaveInformationX h
)h i
;i j
return 
isleaveinfoSaved #
;# $
} 	
public 
async 
Task 
< 
bool 
> !
SavedLeaveInformation  5
(5 6#
LeaveInformationSaveReq6 M
leaveInformationN ^
)^ _
{ 	
bool   
isleaveinfoSaved   !
=  " #
await  $ )"
leaveInformationDomain  * @
.  @ A!
SavedLeaveInformation  A V
(  V W
leaveInformation  W g
)  g h
;  h i
return!! 
isleaveinfoSaved!! #
;!!# $
}"" 	
public## 
async## 
Task## 
<## 
bool## 
>## "
DeleteLeaveInformation##  6
(##6 7
int##7 :
leaveInformationId##; M
)##M N
{$$ 	
bool%% 
isleaveinfoSaved%% !
=%%" #
await%%$ )"
leaveInformationDomain%%* @
.%%@ A"
DeleteLeaveInformation%%A W
(%%W X
leaveInformationId%%X j
)%%j k
;%%k l
return&& 
isleaveinfoSaved&& #
;&&# $
}'' 	
public(( 
async(( 
Task(( 
<(( 
List(( 
<((  
LeaveTypeInformation(( 3
>((3 4
>((4 5$
GetLeaveInformationByOfc((6 N
(((N O
int((O R
officeTypeSlno((S a
,((a b
int((c f
?((f g

branchSlno((h r
)((r s
{)) 	
List** 
<**  
LeaveTypeInformation** %
>**% & 
leaveTypeInformation**' ;
=**< =
await**> C"
leaveInformationDomain**D Z
.**Z [$
GetLeaveInformationByOfc**[ s
(**s t
officeTypeSlno	**t Ç
,
**Ç É

branchSlno
**Ñ é
)
**é è
;
**è ê
return++  
leaveTypeInformation++ '
;++' (
},, 	
}.. 
}// ‹
ÄF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Implementations\LeavePolicyInformationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Administration ,
., -
Implementations- <
{		 
public

 

class

 -
!LeavePolicyInformationApplication

 2
:

3 4.
"ILeavePolicyInformationApplication

5 W
{ 
private 
readonly )
ILeavePolicyInformationDomain 6(
leavePolicyInformationDomain7 S
;S T
public -
!LeavePolicyInformationApplication 0
(0 1)
ILeavePolicyInformationDomain1 N(
leavePolicyInformationDomainO k
)k l
{ 	
this 
. (
leavePolicyInformationDomain -
=. /(
leavePolicyInformationDomain0 L
;L M
} 	
public 
async 
Task 
< 
List 
< "
LeavePolicyInformation 5
>5 6
>6 7%
GetLeavePolicyInformation8 Q
(Q R
)R S
{ 	
List 
< "
LeavePolicyInformation '
>' (#
leaveinformationdetails) @
=A B
awaitC H(
leavePolicyInformationDomainI e
.e f%
GetLeavePolicyInformationf 
(	 Ä
)
Ä Å
;
Å Ç
return #
leaveinformationdetails *
;* +
} 	
public 
async 
Task 
< 
bool 
> &
SaveLeavePolicyInformation  :
(: ;"
LeavePolicyInformation; Q"
leavePolicyInformationR h
)h i
{ 	
bool 
isleaveinfoSaved !
=" #
await$ )(
leavePolicyInformationDomain* F
.F G&
SaveLeavePolicyInformationG a
(a b"
leavePolicyInformationb x
)x y
;y z
return 
isleaveinfoSaved #
;# $
} 	
public 
async 
Task 
< 
bool 
> (
UpdateLeavePolicyInformation  <
(< =%
LeavePolicyInformationReq= V"
leavePolicyInformationW m
)m n
{ 	
bool 
isleaveinfoSaved !
=" #
await$ )(
leavePolicyInformationDomain* F
.F G(
UpdateLeavePolicyInformationG c
(c d"
leavePolicyInformationd z
)z {
;{ |
return 
isleaveinfoSaved #
;# $
}   	
public!! 
async!! 
Task!! 
<!! 
bool!! 
>!! (
DeleteLeavePolicyInformation!!  <
(!!< =
int!!= @
policyID!!A I
)!!I J
{"" 	
bool## 
isleaveinfoSaved## !
=##" #
await##$ )(
leavePolicyInformationDomain##* F
.##F G(
DeleteLeavePolicyInformation##G c
(##c d
policyID##d l
)##l m
;##m n
return$$ 
isleaveinfoSaved$$ #
;$$# $
}%% 	
}'' 
}(( ”
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Implementations\ModuleInformationApplication.cs
	namespace 	
MyStore
 
. 
Application 
. 
Applications *
.* +
Administration+ 9
.9 :
Implementations: I
{ 
public 

sealed 
class (
ModuleInformationApplication 4
:5 6
BaseApplication7 F
,F G)
IModuleInformationApplicationH e
{ 
private 
readonly $
IModuleInformationDomain 1#
ModuleInformationDomain2 I
;I J
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public (
ModuleInformationApplication +
(+ ,$
IModuleInformationDomain, D#
ModuleInformationDomainE \
,\ ]
IConfiguration^ l
configurationm z
,z {
IDistributedCache	| ç

redisCache
é ò
)
ò ô
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
. #
ModuleInformationDomain (
=) *#
ModuleInformationDomain+ B
;B C
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
} 	
public 
async 
Task 
< 
List 
< 
SecurityModule -
>- .
>. /(
LoadActiveModuleInformations0 L
(L M
)M N
{   	
List!! 
<!! 
SecurityModule!! 
>!!  
moduleInformations!!! 3
=!!4 5
null!!6 :
;!!: ;
moduleInformations"" 
=""  
await""! &
this""' +
.""+ ,#
ModuleInformationDomain"", C
.""C D(
LoadActiveModuleInformations""D `
(""` a
)""a b
;""b c
return## 
moduleInformations## %
;##% &
}$$ 	
}%% 
}&& ∂.
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Implementations\RoleInformationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Administration ,
., -
Implementations- <
{ 
public 

class &
RoleInformationApplication +
:, -
BaseApplication. =
,= >'
IRoleInformationApplication? Z
{ 
private 
readonly "
IRoleInformationDomain /

roleDomain0 :
;: ;
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ICryptography &
cryptography' 3
;3 4
public &
RoleInformationApplication )
() *"
IRoleInformationDomain* @
	rolDomainA J
,J K
IConfigurationL Z
configuration[ h
,h i
IDistributedCachej {

redisCache	| Ü
)
Ü á
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	

roleDomain 
= 
	rolDomain "
;" #
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
bool 
> 
ActivateRole  ,
(, -
long- 1
roleSlno2 :
): ;
{ 	
bool 
isRoleActivated  
=! "
await# (

roleDomain) 3
.3 4
ActivateRole4 @
(@ A
roleSlnoA I
)I J
;J K
return 
isRoleActivated "
;" #
}   	
public"" 
async"" 
Task"" 
<"" 
bool"" 
>"" 
DeActivateRole""  .
("". /
long""/ 3
roleSlno""4 <
)""< =
{## 	
bool$$ 
isRolesDeActivated$$ #
=$$$ %
await$$& +

roleDomain$$, 6
.$$6 7
DeActivateRole$$7 E
($$E F
roleSlno$$F N
)$$N O
;$$O P
return%% 
isRolesDeActivated%% %
;%%% &
}&& 	
public(( 
async(( 
Task(( 
<(( 
List(( 
<(( 
RoleInformation(( .
>((. /
>((/ 0
GetAllActiveRoles((1 B
(((B C
)((C D
{)) 	
List** 
<** 
RoleInformation**  
>**  !
roleInformations**" 2
=**3 4
await**5 :

roleDomain**; E
.**E F
GetAllActiveRoles**F W
(**W X
)**X Y
;**Y Z
return++ 
roleInformations++ #
;++# $
},, 	
public.. 
async.. 
Task.. 
<.. 
RoleInformation.. )
>..) *
GetRoleInformation..+ =
(..= >
long..> B
roleSlno..C K
)..K L
{// 	
RoleInformation00 
roleInformation00 +
=00, -
await00. 3

roleDomain004 >
.00> ?
GetRoleInformation00? Q
(00Q R
roleSlno00R Z
)00Z [
;00[ \
return11 
roleInformation11 "
;11" #
}22 	
public44 
async44 
Task44 
<44 
List44 
<44 
RoleInformation44 .
>44. /
>44/ 0
GetUserRoles441 =
(44= >
long44> B
employeeSlno44C O
)44O P
{55 	
List66 
<66 
RoleInformation66  
>66  !
roleInformations66" 2
=663 4
await665 :

roleDomain66; E
.66E F
GetUserRoles66F R
(66R S
employeeSlno66S _
)66_ `
;66` a
return77 
roleInformations77 #
;77# $
}88 	
public:: 
async:: 
Task:: 
<:: 
bool:: 
>:: 
MapRolesToUser::  .
(::. /
)::/ 0
{;; 	
bool<< 
isRolesMapped<< 
=<<  
await<<! &

roleDomain<<' 1
.<<1 2
MapRolesToUser<<2 @
(<<@ A
)<<A B
;<<B C
return== 
isRolesMapped==  
;==  !
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
bool@@ 
>@@ 
SaveRoleInformation@@  3
(@@3 4
RoleInformation@@4 C
roleInformation@@D S
)@@S T
{AA 	
boolBB 
isRoleSavedBB 
=BB 
awaitBB $

roleDomainBB% /
.BB/ 0
SaveRoleInformationBB0 C
(BBC D
roleInformationBBD S
)BBS T
;BBT U
returnCC 
isRoleSavedCC 
;CC 
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
ListFF 
<FF 
RoleInformationFF .
>FF. /
>FF/ 0
SearchRolesFF1 <
(FF< =)
RoleInformationSearchCriteriaFF= Z
searchCriteriaFF[ i
)FFi j
{GG 	
ListHH 
<HH 
RoleInformationHH  
>HH  !
roleInformationsHH" 2
=HH3 4
awaitHH5 :

roleDomainHH; E
.HHE F
SearchRolesHHF Q
(HHQ R
searchCriteriaHHR `
)HH` a
;HHa b
returnII 
roleInformationsII #
;II# $
}JJ 	
}KK 
}LL í
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Implementations\SecurityModuleApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Administration ,
., -
Implementations- <
{ 
public 

sealed 
class %
SecurityModuleApplication 1
:2 3
BaseApplication4 C
,C D&
ISecurityModuleApplicationE _
{ 
private 
readonly !
ISecurityModuleDomain . 
SecurityModuleDomain/ C
;C D
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public %
SecurityModuleApplication (
(( )!
ISecurityModuleDomain) > 
SecurityModuleDomain? S
,S T
IConfigurationU c
configurationd q
,q r
IDistributedCache	s Ñ

redisCache
Ö è
)
è ê
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
.  
SecurityModuleDomain %
=& ' 
SecurityModuleDomain( <
;< =
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
async 
Task 
< 
List 
< 
SecurityModule -
>- .
>. /!
LoadMappedPermissions0 E
(E F
intF I
roleIdJ P
)P Q
{ 	
List   
<   
SecurityModule   
>    
securityModules  ! 0
=  1 2
null  3 7
;  7 8
securityModules!! 
=!! 
await!! # 
SecurityModuleDomain!!$ 8
.!!8 9!
LoadMappedPermissions!!9 N
(!!N O
roleId!!O U
)!!U V
;!!V W
return"" 
securityModules"" "
;""" #
}## 	
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% 
SecurityModule%% -
>%%- .
>%%. /+
LoadRoleLevelAccessPermisssions%%0 O
(%%O P
)%%P Q
{&& 	
List'' 
<'' 
SecurityModule'' 
>''  
securityModules''! 0
=''1 2
null''3 7
;''7 8
securityModules(( 
=(( 
await(( # 
SecurityModuleDomain(($ 8
.((8 9+
LoadRoleLevelAccessPermisssions((9 X
(((X Y
)((Y Z
;((Z [
return)) 
securityModules)) "
;))" #
}** 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, 
SavePermissions,,  /
(,,/ 0
List,,0 4
<,,4 5
SecurityModule,,5 C
>,,C D
permissions,,E P
,,,P Q
int,,R U
roleId,,V \
),,\ ]
{-- 	
bool.. 
isSaved.. 
=.. 
false..  
;..  !
isSaved// 
=// 
await//  
SecurityModuleDomain// 0
.//0 1
SavePermissions//1 @
(//@ A
permissions//A L
,//L M
roleId//N T
)//T U
;//U V
return00 
isSaved00 
;00 
}11 	
}22 
}33 Û<
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Implementations\UserInformationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Administration ,
., -
Implementations- <
{ 
public 

class &
UserInformationApplication +
:, -

BaseDomain. 8
,8 9'
IUserInformationApplication: U
{ 
private 
readonly "
IUserInformationDomain /!
userInformationDomain0 E
;E F
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ICryptography &
cryptography' 3
;3 4
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
private 
readonly 
IJwtAuthManager (
tokenService) 5
;5 6
public &
UserInformationApplication )
() *"
IUserInformationDomain* @!
userInformationDomainA V
,V W
IConfigurationX f
configurationg t
,t u
ICryptography	v É
cryptography
Ñ ê
,
ê ë
IDistributedCache
í £

redisCache
§ Æ
,
Æ Ø
IJwtAuthManager
∞ ø
tokenService
¿ Ã
)
Ã Õ
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
. !
userInformationDomain &
=' (!
userInformationDomain) >
;> ?
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
cryptography 
= 
cryptography  ,
;, -
this   
.   

redisCache   
=   

redisCache   (
;  ( )
this!! 
.!! 
tokenService!! 
=!! 
tokenService!!  ,
;!!, -
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
bool$$ 
>$$ 
ActivateUser$$  ,
($$, -
long$$- 1
employeeSlno$$2 >
)$$> ?
{%% 	
bool&& 
isUserActivated&&  
=&&! "
await&&# (!
userInformationDomain&&) >
.&&> ?
ActivateUser&&? K
(&&K L
employeeSlno&&L X
)&&X Y
;&&Y Z
return'' 
isUserActivated'' "
;''" #
}(( 	
public** 
async** 
Task** 
<** 
bool** 
>** 
ChangePassword**  .
(**. /
UserInformation**/ >
userInformation**? N
)**N O
{++ 	
bool,, 
isPasswordChanged,, "
=,,# $
false,,% *
;,,* +
isPasswordChanged-- 
=-- 
await--  %!
userInformationDomain--& ;
.--; <
ChangePassword--< J
(--J K
userInformation--K Z
)--Z [
;--[ \
return.. 
isPasswordChanged.. $
;..$ %
}// 	
public11 
async11 
Task11 
<11 
bool11 
>11 
DeActivateUser11  .
(11. /
long11/ 3
employeeSlno114 @
)11@ A
{22 	
bool33 
isUserDeactivated33 "
=33# $
await33% *!
userInformationDomain33+ @
.33@ A
DeActivateUser33A O
(33O P
employeeSlno33P \
)33\ ]
;33] ^
return44 
isUserDeactivated44 $
;44$ %
}55 	
public77 
async77 
Task77 
<77 
List77 
<77 
RoleInformation77 .
>77. /
>77/ 0
GetMappedRoles771 ?
(77? @
int77@ C
employeeSlno77D P
)77P Q
{88 	
List99 
<99 
RoleInformation99  
>99  !
mappedRoles99" -
=99. /
await990 5!
userInformationDomain996 K
.99K L
GetMappedRoles99L Z
(99Z [
employeeSlno99[ g
)99g h
;99h i
return:: 
mappedRoles:: 
;:: 
};; 	
public<< 
async<< 
Task<< 
<<< 
List<< 
<<< 
BranchInformation<< 0
><<0 1
><<1 2#
GetUserBranchesFromNerp<<3 J
(<<J K
int<<K N
userSlno<<O W
)<<W X
{== 	
List>> 
<>> 
BranchInformation>> "
>>>" #
mappedBranches>>$ 2
=>>3 4
await>>5 :!
userInformationDomain>>; P
.>>P Q#
GetUserBranchesFromNerp>>Q h
(>>h i
userSlno>>i q
)>>q r
;>>r s
return?? 
mappedBranches?? !
;??! "
}@@ 	
publicAA 
asyncAA 
TaskAA 
<AA 
OtpDataAA !
>AA! "
GetOtpAA# )
(AA) *
stringAA* 0
userNameAA1 9
,AA9 :
boolAA; ?
isSignUpAA@ H
)AAH I
{BB 	
OtpDataCC 
isOtpGeneratedCC "
=CC# $
nullCC% )
;CC) *
isOtpGeneratedDD 
=DD 
awaitDD "!
userInformationDomainDD# 8
.DD8 9
GetOtpDD9 ?
(DD? @
userNameDD@ H
,DDH I
isSignUpDDJ R
)DDR S
;DDS T
returnEE 
isOtpGeneratedEE !
;EE! "
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
boolHH 
>HH 
SaveOrUpdateUserHH  0
(HH0 1
UserInformationHH1 @
userInformationHHA P
)HHP Q
{II 	
boolJJ 
isSavedJJ 
=JJ 
awaitJJ  !
userInformationDomainJJ! 6
.JJ6 7
SaveOrUpdateUserJJ7 G
(JJG H
userInformationJJH W
)JJW X
;JJX Y
returnKK 
isSavedKK 
;KK 
}LL 	
publicNN 
asyncNN 
TaskNN 
<NN 
OtpDataNN !
>NN! "
SignUpNN# )
(NN) *
stringNN* 0
userNameNN1 9
)NN9 :
{OO 	
OtpDataPP 
isOtpGeneratedPP "
=PP# $
nullPP% )
;PP) *
isOtpGeneratedQQ 
=QQ 
awaitQQ "!
userInformationDomainQQ# 8
.QQ8 9
SignUpQQ9 ?
(QQ? @
userNameQQ@ H
)QQH I
;QQI J
returnRR 
isOtpGeneratedRR !
;RR! "
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU 
boolUU 
>UU 
ValidateOtpUU  +
(UU+ ,
stringUU, 2
userNameUU3 ;
,UU; <
stringUU= C
otpValueUUD L
)UUL M
{VV 	
boolWW 
isOtpGeneratedWW 
=WW  !
falseWW" '
;WW' (
isOtpGeneratedXX 
=XX 
awaitXX "!
userInformationDomainXX# 8
.XX8 9
ValidateOtpXX9 D
(XXD E
userNameXXE M
,XXM N
otpValueXXO W
)XXW X
;XXX Y
returnYY 
isOtpGeneratedYY !
;YY! "
}ZZ 	
}[[ 
}\\ ≠
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Interfaces\ILeaveInformationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Administration ,
., -

Interfaces- 7
{ 
public		 

	interface		 (
ILeaveInformationApplication		 1
{

 
Task 
< 
List 
< 
LeaveInformation "
>" #
># $
GetLeaveInformation% 8
(8 9
)9 :
;: ;
Task 
< 
bool 
> "
UpdateLeaveInformation )
() *#
LeaveInformationSaveReq* A
leaveInformationB R
)R S
;S T
Task 
< 
bool 
> !
SavedLeaveInformation (
(( )#
LeaveInformationSaveReq) @
leaveInformationA Q
)Q R
;R S
Task 
< 
bool 
> "
DeleteLeaveInformation )
() *
int* -
leaveInformationId. @
)@ A
;A B
Task 
< 
List 
<  
LeaveTypeInformation &
>& '
>' ($
GetLeaveInformationByOfc) A
(A B
intB E
officeTypeSlnoF T
,T U
intV Y
?Y Z

branchSlno[ e
)e f
;f g
} 
} ê

|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Interfaces\ILeavePolicyInformationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Administration ,
., -

Interfaces- 7
{ 
public 

	interface .
"ILeavePolicyInformationApplication 7
{		 
Task

 
<

 
List

 
<

 "
LeavePolicyInformation

 (
>

( )
>

) *%
GetLeavePolicyInformation

+ D
(

D E
)

E F
;

F G
Task 
< 
bool 
> &
SaveLeavePolicyInformation -
(- ."
LeavePolicyInformation. D"
leavePolicyInformationE [
)[ \
;\ ]
Task 
< 
bool 
> (
UpdateLeavePolicyInformation /
(/ 0%
LeavePolicyInformationReq0 I"
leavePolicyInformationJ `
)` a
;a b
Task 
< 
bool 
> (
DeleteLeavePolicyInformation /
(/ 0
int0 3
policyID4 <
)< =
;= >
} 
} ‘
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Interfaces\IModuleInformationApplication.cs
	namespace 	
MyStore
 
. 
Application 
. 
Applications *
.* +
Administration+ 9
.9 :

Interfaces: D
{ 
public 

	interface )
IModuleInformationApplication 2
:3 4
IBaseApplication5 E
{		 
Task

 
<

 
List

 
<

 
SecurityModule

  
>

  !
>

! "(
LoadActiveModuleInformations

# ?
(

? @
)

@ A
;

A B
} 
} ë
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Interfaces\IRoleInformationApplication.cs
	namespace 	
Phonix
 
. 
Application 
. 
Authentication +
.+ ,

Interfaces, 6
{ 
public		 

	interface		 '
IRoleInformationApplication		 0
:		1 2
IBaseApplication		3 C
{

 
Task 
< 
List 
< 
RoleInformation !
>! "
>" #
GetUserRoles$ 0
(0 1
long1 5
employeeSlno6 B
)B C
;C D
Task 
< 
List 
< 
RoleInformation !
>! "
>" #
GetAllActiveRoles$ 5
(5 6
)6 7
;7 8
Task 
< 
bool 
> 
MapRolesToUser !
(! "
)" #
;# $
Task 
< 
bool 
> 
ActivateRole 
(  
long  $
roleSlno% -
)- .
;. /
Task 
< 
bool 
> 
DeActivateRole !
(! "
long" &
roleSlno' /
)/ 0
;0 1
Task 
< 
List 
< 
RoleInformation !
>! "
>" #
SearchRoles$ /
(/ 0)
RoleInformationSearchCriteria0 M
searchCriteriaN \
)\ ]
;] ^
Task 
< 
RoleInformation 
> 
GetRoleInformation 0
(0 1
long1 5
roleSlno6 >
)> ?
;? @
Task 
< 
bool 
> 
SaveRoleInformation &
(& '
RoleInformation' 6
roleInformation7 F
)F G
;G H
} 
} Á	
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Interfaces\ISecurityModuleApplication.cs
	namespace 	
MyStore
 
. 
Application 
. 
Applications *
.* +
Administration+ 9
.9 :

Interfaces: D
{ 
public 

	interface &
ISecurityModuleApplication /
:0 1
IBaseApplication2 B
{		 
Task

 
<

 
List

 
<

 
SecurityModule

  
>

  !
>

! "+
LoadRoleLevelAccessPermisssions

# B
(

B C
)

C D
;

D E
Task 
< 
List 
< 
SecurityModule  
>  !
>! "!
LoadMappedPermissions# 8
(8 9
int9 <
roleId= C
)C D
;D E
Task 
< 
bool 
> 
SavePermissions "
(" #
List# '
<' (
SecurityModule( 6
>6 7
permissions8 C
,C D
intE H
roleIdI O
)O P
;P Q
} 
} ≤
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Administration\Interfaces\IUserInformationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Administration ,
., -

Interfaces- 7
{		 
public

 

	interface

 '
IUserInformationApplication

 0
:

1 2
IBaseDomain

3 >
{ 
Task 
< 
bool 
> 
ChangePassword !
(! "
UserInformation" 1
userInformation2 A
)A B
;B C
Task 
< 
OtpData 
> 
GetOtp 
( 
string #
userName$ ,
,, -
bool- 1
isSignUp2 :
): ;
;; <
Task 
< 
bool 
> 
ValidateOtp 
( 
string %
userName& .
,. /
string0 6
otpValue7 ?
)? @
;@ A
Task 
< 
OtpData 
> 
SignUp 
( 
string #
userName$ ,
), -
;- .
Task 
< 
bool 
> 
ActivateUser 
(  
long  $
employeeSlno% 1
)1 2
;2 3
Task 
< 
bool 
> 
DeActivateUser !
(! "
long" &
employeeSlno' 3
)3 4
;4 5
Task 
< 
bool 
> 
SaveOrUpdateUser #
(# $
UserInformation$ 3
userInformation4 C
)C D
;D E
Task 
< 
List 
< 
RoleInformation !
>! "
>" #
GetMappedRoles$ 2
(2 3
int3 6
employeeSlno7 C
)C D
;D E
Task 
< 
List 
< 
BranchInformation #
># $
>$ %#
GetUserBranchesFromNerp& =
(= >
int> A
userSlnoB J
)J K
;K L
} 
} Ú(
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Authentication\Implementations\AuthenticationApplication.cs
	namespace 	
Phonix
 
. 
Application 
. 
Authentication +
.+ ,
Implementations, ;
{ 
public 

class %
AuthenticationApplication *
:+ ,
BaseApplication- <
,< =&
IAuthenticationApplication> X
{ 
private 
readonly !
IAuthenticationDomain . 
authenticationDomain/ C
;C D
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ICryptography &
cryptography' 3
;3 4
public %
AuthenticationApplication (
(( )!
IAuthenticationDomain) > 
authenticationDomain? S
,S T
IDistributedCacheU f

redisCacheg q
,q r
IConfiguration	s Å
configuration
Ç è
,
è ê
ICryptography
ë û
cryptography
ü ´
)
´ ¨
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
.  
authenticationDomain %
=& ' 
authenticationDomain( <
;< =
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
cryptography 
= 
cryptography  ,
;, -
} 	
public 
async 
Task 
< 
UserInformation )
>) *
AuthenticateUser+ ;
(; <
LoginInformation< L
loginInformationM ]
)] ^
{ 	
UserInformation 
userInformation +
=, -
await. 3 
authenticationDomain4 H
.H I
AuthenticateUserI Y
(Y Z
loginInformationZ j
)j k
;k l
return 
userInformation "
;" #
} 	
public   
async   
Task   
<   
bool   
>   )
FetchEqualVerificationDetials    =
(  = >
string  > D
token  E J
)  J K
{!! 	
bool"" 
verified"" 
="" 
await"" ! 
authenticationDomain""" 6
.""6 7)
FetchEqualVerificationDetials""7 T
(""T U
token""U Z
)""Z [
;""[ \
return## 
verified## 
;## 
}$$ 	
public%% 
async%% 
Task%% 
<%% 
UserInformation%% )
>%%) *#
AuthenticateUserForNerp%%+ B
(%%B C
LoginInformation%%C S
loginInformation%%T d
)%%d e
{&& 	
UserInformation'' 
userInformation'' +
='', -
await''. 3 
authenticationDomain''4 H
.''H I#
AuthenticateUserForNerp''I `
(''` a
loginInformation''a q
)''q r
;''r s
return(( 
userInformation(( "
;((" #
})) 	
public** 
async** 
Task** 
<** 
EmployeeProfile** )
>**) *
GetEmployeeProfile**+ =
(**= >
int**> A
employeeSlno**B N
)**N O
{++ 	
EmployeeProfile,, 
employeeProfile,, +
=,,, -
await,,. 3 
authenticationDomain,,4 H
.,,H I
GetEmployeeProfile,,I [
(,,[ \
employeeSlno,,\ h
),,h i
;,,i j
return-- 
employeeProfile-- "
;--" #
}.. 	
public00 
async00 
Task00 
<00 
UserInformation00 )
>00) *'
ValidateAndAuthenticateUser00+ F
(00F G
string00G M
userName00N V
)00V W
{11 	
UserInformation22 
userInformation22 +
=22, -
await22. 3 
authenticationDomain224 H
.22H I'
ValidateAndAuthenticateUser22I d
(22d e
userName22e m
)22m n
;22n o
return33 
userInformation33 "
;33" #
}44 	
public55 
async55 
Task55 
<55 
UserInformation55 )
>55) *3
'RefreshTokenValidateAndAuthenticateUser55+ R
(55R S
UserInformation55S b
userInformationreq55c u
)55u v
{66 	
UserInformation77 
userInformation77 +
=77, -
await77. 3 
authenticationDomain774 H
.77H I3
'RefreshTokenValidateAndAuthenticateUser77I p
(77p q
userInformationreq	77q É
)
77É Ñ
;
77Ñ Ö
return88 
userInformation88 "
;88" #
}99 	
}:: 
};; ø
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Authentication\Interfaces\IAuthenticationApplication.cs
	namespace 	
Phonix
 
. 
Application 
. 
Authentication +
.+ ,

Interfaces, 6
{ 
public 

	interface &
IAuthenticationApplication /
:0 1
IBaseApplication2 B
{		 
Task

 
<

 
UserInformation

 
>

 
AuthenticateUser

 .
(

. /
LoginInformation

/ ?
loginInformation

@ P
)

P Q
;

Q R
Task 
< 
bool 
> )
FetchEqualVerificationDetials 0
(0 1
string1 7
token8 =
)= >
;> ?
Task 
< 
EmployeeProfile 
> 
GetEmployeeProfile 0
(0 1
int1 4
employeeSlno5 A
)A B
;B C
Task 
< 
UserInformation 
> '
ValidateAndAuthenticateUser 9
(9 :
string: @
userNameA I
)I J
;J K
Task 
< 
UserInformation 
> 3
'RefreshTokenValidateAndAuthenticateUser E
(E F
UserInformationF U
userInformationreqV h
)h i
;i j
Task 
< 
UserInformation 
> #
AuthenticateUserForNerp 5
(5 6
LoginInformation6 F
loginInformationG W
)W X
;X Y
} 
} ‚
TF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Base\BaseApplication.cs
	namespace 	
Phonix
 
. 
Application 
{ 
public		 

abstract		 
class		 
BaseApplication		 )
:		* +
IBaseApplication		, <
,		< =
IDisposable		> I
{

 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '

logManager( 2
;2 3
public 
BaseApplication 
( 
IConfiguration -
configuration. ;
); <
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
BaseApplication 
( 
IConfiguration -
configuration. ;
,; <
IDistributedCache= N

redisCacheO Y
)Y Z
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
private 
bool 
disposedValue "
=# $
false% *
;* +
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{ 	
if 
( 
! 
this 
. 
disposedValue #
)# $
{ 
if 
( 
	disposing 
) 
{ 
} 
this   
.   
disposedValue   "
=  # $
true  % )
;  ) *
}!! 
}"" 	
public$$ 
void$$ 
Dispose$$ 
($$ 
)$$ 
{%% 	
this&& 
.&& 
Dispose&& 
(&& 
true&& 
)&& 
;&& 
}'' 	
}(( 
})) —
UF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Base\IBaseApplication.cs
	namespace 	
Phonix
 
. 
Application 
{ 
public 

	interface 
IBaseApplication %
:& '
IDisposable( 3
{ 
} 
} ü(
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\CarLease\Implementations\CarLeaseApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
CarLease &
.& '
Implementations' 6
{ 
public		 

class		 
CarLeaseApplication		 $
:		% & 
ICarLeaseApplication		' ;
{

 
private 
readonly 
ICarLeaseDomain (
carLeaseDomain) 7
;7 8
public 
CarLeaseApplication "
(" #
ICarLeaseDomain# 2
carLeaseDomain3 A
)A B
{ 	
this 
. 
carLeaseDomain 
=  !
carLeaseDomain" 0
;0 1
} 	
public 
async 
Task 
< 
List 
< 
CarLeaseBillName /
>/ 0
>0 1 
GetCarLeaseBillNames2 F
(F G
)G H
{ 	
List 
< 
CarLeaseBillName !
>! "
resp# '
=( )
await* /
carLeaseDomain0 >
.> ? 
GetCarLeaseBillNames? S
(S T
)T U
;U V
return 
resp 
; 
} 	
public 
async 
Task 
< 
List 
< &
CarLeaseMaintenanceBalance 9
>9 :
>: ;)
GetCarLeaseMaintenanceBalance< Y
(Y Z
intZ ]
empSLNo^ e
)e f
{ 	
List 
< &
CarLeaseMaintenanceBalance +
>+ ,
resp- 1
=2 3
await4 9
carLeaseDomain: H
.H I)
GetCarLeaseMaintenanceBalanceI f
(f g
empSLNog n
)n o
;o p
return 
resp 
; 
} 	
public 
async 
Task 
< 
List 
< +
CarLeaseMaintenancePendingBills >
>> ?
>? @.
"GetCarLeaseMaintenancePendingBillsA c
(c d
intd g
empSLNoh o
)o p
{ 	
List   
<   +
CarLeaseMaintenancePendingBills   0
>  0 1
resp  2 6
=  7 8
await  9 >
carLeaseDomain  ? M
.  M N.
"GetCarLeaseMaintenancePendingBills  N p
(  p q
empSLNo  q x
)  x y
;  y z
return!! 
resp!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
bool$$ 
>$$ %
UploadCarLeaseMaintenance$$  9
($$9 :%
CarLeaseMaintenanceDetail$$: S%
uploadCarLeaseMaintenance$$T m
)$$m n
{%% 	
bool&& 
resp&& 
=&& 
await&& 
carLeaseDomain&& ,
.&&, -%
UploadCarLeaseMaintenance&&- F
(&&F G%
uploadCarLeaseMaintenance&&G `
)&&` a
;&&a b
return'' 
resp'' 
;'' 
}(( 	
public)) 
async)) 
Task)) 
<)) 
List)) 
<)) "
CarLeaseAgreementBills)) 5
>))5 6
>))6 7%
GetCarLeaseAgreementBills))8 Q
())Q R
int))R U
employeeSLNo))V b
)))b c
{** 	
List++ 
<++ "
CarLeaseAgreementBills++ '
>++' (
resp++) -
=++. /
await++0 5
carLeaseDomain++6 D
.++D E%
GetCarLeaseAgreementBills++E ^
(++^ _
employeeSLNo++_ k
)++k l
;++l m
return,, 
resp,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
bool// 
>// '
UploadCarLeaseAgreementBill//  ;
(//; <
List//< @
<//@ A"
CarLeaseAgreementBills//A W
>//W X'
carLeaseAgreementBillUpload//Y t
)//t u
{00 	
bool11 !
carLeaseAgreementBill11 &
=11' (
await11) .
carLeaseDomain11/ =
.11= >'
UploadCarLeaseAgreementBill11> Y
(11Y Z'
carLeaseAgreementBillUpload11Z u
)11u v
;11v w
return22 !
carLeaseAgreementBill22 (
;22( )
}33 	
public44 
async44 
Task44 
<44 
bool44 
>44 !
DeleteMaintenenceBill44  5
(445 6
int446 9
recordId44: B
)44B C
{55 	
bool66 
resp66 
=66 
await66 
carLeaseDomain66 +
.66+ ,!
DeleteMaintenenceBill66, A
(66A B
recordId66B J
)66J K
;66K L
return77 
resp77 
;77 
}88 	
}99 
}:: •
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\CarLease\Interfaces\ICarLeaseApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
CarLease &
.& '

Interfaces' 1
{ 
public 

	interface  
ICarLeaseApplication )
{ 
Task		 
<		 
List		 
<		 
CarLeaseBillName		 "
>		" #
>		# $ 
GetCarLeaseBillNames		% 9
(		9 :
)		: ;
;		; <
Task

 
<

 
List

 
<

 &
CarLeaseMaintenanceBalance

 ,
>

, -
>

- .)
GetCarLeaseMaintenanceBalance

/ L
(

L M
int

M P
empSLNo

Q X
)

X Y
;

Y Z
Task 
< 
List 
< +
CarLeaseMaintenancePendingBills 1
>1 2
>2 3.
"GetCarLeaseMaintenancePendingBills4 V
(V W
intW Z
empSLNo[ b
)b c
;c d
Task 
< 
bool 
> %
UploadCarLeaseMaintenance ,
(, -%
CarLeaseMaintenanceDetail- F%
uploadCarLeaseMaintenanceG `
)` a
;a b
Task 
< 
List 
< "
CarLeaseAgreementBills (
>( )
>) *%
GetCarLeaseAgreementBills+ D
(D E
intE H
employeeSLNoI U
)U V
;V W
Task 
< 
bool 
> '
UploadCarLeaseAgreementBill .
(. /
List/ 3
<3 4"
CarLeaseAgreementBills4 J
>J K'
carLeaseAgreementBillUploadL g
)g h
;h i
Task 
< 
bool 
> !
DeleteMaintenenceBill (
(( )
int) ,
recordId- 5
)5 6
;6 7
} 
} Ê
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Districts\Implementations\DistrictsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
	Districts '
.' (
Implementations( 7
{		 
public

 

class

  
DistrictsApplication

 %
:

% &!
IDistrictsApplication

' <
{ 
private 
readonly 
IDistrictsDomain )
districtsDomain* 9
;9 :
public  
DistrictsApplication #
(# $
IDistrictsDomain$ 4
districtsDomain5 D
)D E
{ 	
this 
. 
districtsDomain  
=! "
districtsDomain# 2
;2 3
} 	
public 
async 
Task 
< 
List 
< 
DistrictDetails .
>. /
>/ 0
GetDistrictDetails1 C
(C D
intD G
	stateSlNoH Q
)Q R
{ 	
List 
< 
DistrictDetails  
>  !
districtDetails" 1
=2 3
await4 9
districtsDomain: I
.I J
GetDistrictDetailsJ \
(\ ]
	stateSlNo] f
)f g
;g h
return 
districtDetails "
;" #
} 	
} 
} É
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Districts\Interfaces\IDistrictsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
	Districts '
.' (

Interfaces( 2
{ 
public 

	interface !
IDistrictsApplication *
{		 
Task

 
<

 
List

 
<

 
DistrictDetails

 !
>

! "
>

" #
GetDistrictDetails

$ 6
(

6 7
int

7 :
	stateSlNo

; D
)

D E
;

E F
} 
} ∏
ÄF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\EmployeeInformation\Implementations\AppointmentLetterApplication.cs
	namespace

 	
Phoenix


 
.

 
Application

 
.

 
EmployeeInformation

 1
.

1 2
Implementations

2 A
{ 
public 

class (
AppointmentLetterApplication -
:. /
BaseApplication0 ?
,? @)
IAppointmentLetterApplicationA ^
{ 
private 
readonly $
IAppointmentLetterDomain 1#
appointmentLetterDomain2 I
;I J
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public (
AppointmentLetterApplication +
(+ ,$
IAppointmentLetterDomain, D#
appointmentLetterDomainE \
,\ ]
IConfiguration^ l
configurationm z
,z {
IDistributedCache	| ç

redisCache
é ò
)
ò ô
:
ö õ
base
ú †
(
† °
configuration
° Æ
,
Æ Ø

redisCache
∞ ∫
)
∫ ª
{ 	
this 
. #
appointmentLetterDomain (
=( )#
appointmentLetterDomain) @
;@ A
this 
. 
configuration 
= 
configuration ,
;, -
this 
. 

redisCache 
= 

redisCache &
;& '
} 	
public 
async 
Task 
< 
List 
< 
AppointmentLetter 0
>0 1
>1 2'
GetPendingAppointmentLetter3 N
(N O
)O P
{ 	
List 
< 
AppointmentLetter "
>" #
	attedance$ -
=. /
await0 5#
appointmentLetterDomain6 M
.M N'
GetPendingAppointmentLetterN i
(i j
)j k
;k l
return 
	attedance 
; 
} 	
public 
async 
Task )
UpdateAppointmentLetterStatus 7
(7 8
int8 ;
employeeNumber< J
)J K
{   	
await!! #
appointmentLetterDomain!! )
.!!) *)
UpdateAppointmentLetterStatus!!* G
(!!G H
employeeNumber!!H V
)!!V W
;!!W X
}"" 	
}## 
}$$ ˘}
ÇF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\EmployeeInformation\Implementations\EmployeeInformationApplication.cs
	namespace 	
Phonix
 
. 
Application 
. 
Authentication +
.+ ,
Implementations, ;
{ 
public 

class *
EmployeeInformationApplication /
:0 1
BaseApplication2 A
,A B+
IEmployeeInformationApplicationC b
{ 
private 
readonly &
IEmployeeInformationDomain 3%
employeeInformationDomain4 M
;M N
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '

logManager( 2
;2 3
public *
EmployeeInformationApplication -
(- .&
IEmployeeInformationDomain. H%
employeeInformationDomainI b
,b c
IConfigurationd r
configuration	s Ä
)
Ä Å
: 
base 
( 
configuration  
)  !
{ 	
this 
. %
employeeInformationDomain *
=+ ,%
employeeInformationDomain- F
;F G
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
EmployeeProfile )
>) *"
GetEmployeeInformation+ A
(A B
intB E
employeeSlnoF R
)R S
{ 	
EmployeeProfile   
employeeProfile   +
=  , -
null  . 2
;  2 3
employeeProfile!! 
=!! 
await!! #%
employeeInformationDomain!!$ =
.!!= >"
GetEmployeeInformation!!> T
(!!T U
employeeSlno!!U a
)!!a b
;!!b c
return"" 
employeeProfile"" "
;""" #
}## 	
public$$ 
async$$ 
Task$$ 
<$$ 
List$$ 
<$$ 
	BioMetric$$ (
>$$( )
>$$) * 
GetEmployeeTimeSheet$$+ ?
($$? @
long$$@ D

employeeId$$E O
)$$O P
{%% 	
List&& 
<&& 
	BioMetric&& 
>&& 
	attedance&& %
=&&& '
await&&( -%
employeeInformationDomain&&. G
.&&G H 
GetEmployeeTimeSheet&&H \
(&&\ ]

employeeId&&] g
)&&g h
;&&h i
return'' 
	attedance'' 
;'' 
}(( 	
public)) 
async)) 
Task)) 
<)) 
List)) 
<)) 
HolidayInformation)) 1
>))1 2
>))2 3
GetEmployeeHolidays))4 G
())G H
long))H L

employeeId))M W
)))W X
{** 	
List++ 
<++ 
HolidayInformation++ #
>++# $
	attedance++% .
=++/ 0
await++1 6%
employeeInformationDomain++7 P
.++P Q
GetEmployeeHolidays++Q d
(++d e

employeeId++e o
)++o p
;++p q
return,, 
	attedance,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
PagedResultSet// (
<//( )
EmployeeProfile//) 8
>//8 9
>//9 :&
SearchEmployeeInformations//; U
(//U V-
!EmployeeInformationSearchCriteria//V w
searchCriteria	//x Ü
)
//Ü á
{00 	
PagedResultSet11 
<11 
EmployeeProfile11 *
>11* +
	attedance11, 5
=116 7
await118 =%
employeeInformationDomain11> W
.11W X&
SearchEmployeeInformations11X r
(11r s
searchCriteria	11s Å
)
11Å Ç
;
11Ç É
return22 
	attedance22 
;22 
}33 	
public55 
async55 
Task55 
<55 
EmployeeProfile55 )
>55) *%
GetEmployeeMinimumProfile55+ D
(55D E
int55E H
employeeSlno55I U
)55U V
{66 	
EmployeeProfile77 
employeeProfile77 +
=77, -
await77. 3%
employeeInformationDomain774 M
.77M N%
GetEmployeeMinimumProfile77N g
(77g h
employeeSlno77h t
)77t u
;77u v
return88 
employeeProfile88 "
;88" #
}99 	
public;; 
async;; 
Task;; 
<;; 
EmployeeProfile;; )
>;;) *
GetEmployeeProfile;;+ =
(;;= >
string;;> D

employeeId;;E O
);;O P
{<< 	
EmployeeProfile== 
employeeProfile== +
===, -
await==. 3%
employeeInformationDomain==4 M
.==M N
GetEmployeeProfile==N `
(==` a

employeeId==a k
)==k l
;==l m
return>> 
employeeProfile>> "
;>>" #
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
ListAA 
<AA 
BloodRelationAA ,
>AA, -
>AA- .)
GetFamilyBloodRelationDetailsAA/ L
(AAL M
)AAM N
{BB 	
ListCC 
<CC 
BloodRelationCC 
>CC  
familyBloodRelationsCC  4
=CC5 6
awaitCC7 <%
employeeInformationDomainCC= V
.CCV W)
GetFamilyBloodRelationDetailsCCW t
(CCt u
)CCu v
;CCv w
returnDD  
familyBloodRelationsDD '
;DD' (
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 
ListGG 
<GG 
	EducationGG (
>GG( )
>GG) *
GetEducationDetailsGG+ >
(GG> ?
)GG? @
{HH 	
ListII 
<II 
	EducationII 
>II 
educationDetailsII ,
=II- .
awaitII/ 4%
employeeInformationDomainII5 N
.IIN O
GetEducationDetailsIIO b
(IIb c
)IIc d
;IId e
returnJJ 
educationDetailsJJ #
;JJ# $
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
ListMM 
<MM 
	EducationMM (
>MM( )
>MM) *%
GetEducationCourseDetailsMM+ D
(MMD E
)MME F
{NN 	
ListOO 
<OO 
	EducationOO 
>OO 
educationDetailsOO ,
=OO- .
awaitOO/ 4%
employeeInformationDomainOO5 N
.OON O%
GetEducationCourseDetailsOOO h
(OOh i
)OOi j
;OOj k
returnPP 
educationDetailsPP #
;PP# $
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS 
ListSS 
<SS 

BloodGroupSS )
>SS) *
>SS* +
GetBloodGroupSS, 9
(SS9 :
)SS: ;
{TT 	
ListUU 
<UU 

BloodGroupUU 
>UU 

bloodGroupUU '
=UU( )
awaitUU* /%
employeeInformationDomainUU0 I
.UUI J
GetBloodGroupUUJ W
(UUW X
)UUX Y
;UUY Z
returnVV 

bloodGroupVV 
;VV 
}WW 	
publicYY 
asyncYY 
TaskYY 
<YY 
ListYY 
<YY #
AdditionalQualificationYY 6
>YY6 7
>YY7 8&
GetAdditionalQualificationYY9 S
(YYS T
)YYT U
{ZZ 	
List[[ 
<[[ #
AdditionalQualification[[ (
>[[( )#
additionalQualification[[* A
=[[B C
await[[D I%
employeeInformationDomain[[J c
.[[c d&
GetAdditionalQualification[[d ~
([[~ 
)	[[ Ä
;
[[Ä Å
return\\ #
additionalQualification\\ *
;\\* +
}]] 	
public__ 
async__ 
Task__ 
<__ 
List__ 
<__ 
Courses__ &
>__& '
>__' (
CourseFilter__) 5
(__5 6
int__6 9
slno__: >
)__> ?
{`` 	
Listaa 
<aa 
Coursesaa 
>aa 
coursesaa !
=aa" #
awaitaa$ )%
employeeInformationDomainaa* C
.aaC D
CourseFilteraaD P
(aaP Q
slnoaaQ U
)aaU V
;aaV W
returnbb 
coursesbb 
;bb 
}cc 	
publicdd 
asyncdd 
Taskdd 
<dd 
booldd 
>dd ,
 GetUpdateEmployeeEmailAddressOtpdd  @
(dd@ A 
UpdadteEmployeeEmailddA U 
updadteEmployeeEmailddV j
)ddj k
{ee 	
boolff 
	isUpdatedff 
=ff 
awaitff "%
employeeInformationDomainff# <
.ff< =,
 GetUpdateEmployeeEmailAddressOtpff= ]
(ff] ^ 
updadteEmployeeEmailff^ r
)ffr s
;ffs t
returngg 
	isUpdatedgg 
;gg 
}hh 	
publicii 
asyncii 
Taskii 
<ii 
boolii 
>ii /
#VerifyUpdateEmployeeEmailAddressOtpii  C
(iiC D 
UpdadteEmployeeEmailiiD X 
updadteEmployeeEmailiiY m
)iim n
{jj 	
boolkk 
	isUpdatedkk 
=kk 
awaitkk "%
employeeInformationDomainkk# <
.kk< =/
#VerifyUpdateEmployeeEmailAddressOtpkk= `
(kk` a 
updadteEmployeeEmailkka u
)kku v
;kkv w
returnll 
	isUpdatedll 
;ll 
}mm 	
publicnn 
asyncnn 
Tasknn 
<nn 
boolnn 
>nn '
UpdateEmployeeFamilyDetailsnn  ;
(nn; <
FamilyDetailnn< H
familyDetailsnnI V
)nnV W
{oo 	
boolpp 
	isUpdatedpp 
=pp 
awaitpp "%
employeeInformationDomainpp# <
.pp< ='
UpdateEmployeeFamilyDetailspp= X
(ppX Y
familyDetailsppY f
)ppf g
;ppg h
returnqq 
	isUpdatedqq 
;qq 
}rr 	
publicss 
asyncss 
Taskss 
<ss 
boolss 
>ss *
UpdateEmployeeEducationDetailsss  >
(ss> ?
EducationDetailss? N
educationDetailssO ^
)ss^ _
{tt 	
booluu 
	isUpdateduu 
=uu 
awaituu "%
employeeInformationDomainuu# <
.uu< =*
UpdateEmployeeEducationDetailsuu= [
(uu[ \
educationDetailuu\ k
)uuk l
;uul m
returnvv 
	isUpdatedvv 
;vv 
}ww 	
publicxx 
asyncxx 
Taskxx 
<xx 
boolxx 
>xx +
UpdateEmployeeExperienceDetailsxx  ?
(xx? @
ExperienceDetailxx@ P
experienceDetailxxQ a
)xxa b
{yy 	
boolzz 
	isUpdatedzz "
=zz# $
awaitzz% *%
employeeInformationDomainzz+ D
.zzD E+
UpdateEmployeeExperienceDetailszzE d
(zzd e
experienceDetailzze u
)zzu v
;zzv w
return{{ 
	isUpdated{{ 
;{{ 
}|| 	
public~~ 
async~~ 
Task~~ 
<~~ 
bool~~ 
>~~ '
DeleteEmployeeFamilyDetails~~  ;
(~~; <
int~~< ?

empFamSlno~~@ J
)~~J K
{ 	
bool
ÄÄ 
	isDeleted
ÄÄ 
=
ÄÄ 
await
ÄÄ "'
employeeInformationDomain
ÄÄ# <
.
ÄÄ< =)
DeleteEmployeeFamilyDetails
ÄÄ= X
(
ÄÄX Y

empFamSlno
ÄÄY c
)
ÄÄc d
;
ÄÄd e
return
ÅÅ 
	isDeleted
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
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
ÉÉ ,
DeleteEmployeeEducationDetails
ÉÉ  >
(
ÉÉ> ?
int
ÉÉ? B

empEduSlno
ÉÉC M
)
ÉÉM N
{
ÑÑ 	
bool
ÖÖ 
	isDeleted
ÖÖ 
=
ÖÖ 
await
ÖÖ "'
employeeInformationDomain
ÖÖ# <
.
ÖÖ< =,
DeleteEmployeeEducationDetails
ÖÖ= [
(
ÖÖ[ \

empEduSlno
ÖÖ\ f
)
ÖÖf g
;
ÖÖg h
return
ÜÜ 
	isDeleted
ÜÜ 
;
ÜÜ 
}
áá 	
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
àà -
DeleteEmployeeExperienceDetails
àà  ?
(
àà? @
int
àà@ C
	empExSlno
ààD M
)
ààM N
{
ââ 	
bool
ää 
	isDeleted
ää 
=
ää 
await
ää "'
employeeInformationDomain
ää# <
.
ää< =-
DeleteEmployeeExperienceDetails
ää= \
(
ää\ ]
	empExSlno
ää] f
)
ääf g
;
ääg h
return
ãã 
	isDeleted
ãã 
;
ãã 
}
åå 	
public
éé 
async
éé 
Task
éé 
<
éé 
PagedResultSet
éé (
<
éé( )
EmployeeProfile
éé) 8
>
éé8 9
>
éé9 :
GetMyTeamMembers
éé; K
(
ééK L/
!EmployeeInformationSearchCriteria
ééL m
searchCriteria
één |
)
éé| }
{
èè 	
PagedResultSet
êê 
<
êê 
EmployeeProfile
êê *
>
êê* +
	attedance
êê, 5
=
êê6 7
await
êê8 ='
employeeInformationDomain
êê> W
.
êêW X
GetMyTeamMembers
êêX h
(
êêh i
searchCriteria
êêi w
)
êêw x
;
êêx y
return
ëë 
	attedance
ëë 
;
ëë 
}
íí 	
public
îî 
async
îî 
Task
îî 
<
îî 
List
îî 
<
îî 
	BioMetric
îî (
>
îî( )
>
îî) *"
GetReporteeTimeSheet
îî+ ?
(
îî? @-
ReporteeTimeSheetSearchCriteria
îî@ _
searchCriteria
îî` n
)
îîn o
{
ïï 	
List
ññ 
<
ññ 
	BioMetric
ññ 
>
ññ 
	attedance
ññ %
=
ññ& '
await
ññ( -'
employeeInformationDomain
ññ. G
.
ññG H"
GetReporteeTimeSheet
ññH \
(
ññ\ ]
searchCriteria
ññ] k
)
ññk l
;
ññl m
return
óó 
	attedance
óó 
;
óó 
}
òò 	
public
öö 
async
öö 
Task
öö 
<
öö 
List
öö 
<
öö 
EmployeeProfile
öö .
>
öö. /
>
öö/ 0
SearchEmployee
öö1 ?
(
öö? @
string
öö@ F
searchValue
ööG R
)
ööR S
{
õõ 	
List
úú 
<
úú 
EmployeeProfile
úú  
>
úú  !
employeeProfiles
úú" 2
=
úú3 4
null
úú5 9
;
úú9 :
if
ûû 
(
ûû 
searchValue
ûû 
.
ûû 
IsNotNullOrEmpty
ûû +
(
ûû+ ,
)
ûû, -
)
ûû- .
{
üü 
employeeProfiles
††  
=
††! "
await
††# ('
employeeInformationDomain
††) B
.
††B C
SearchEmployee
††C Q
(
††Q R
searchValue
††R ]
)
††] ^
;
††^ _
}
°° 
return
¢¢ 
employeeProfiles
¢¢ #
;
¢¢# $
}
££ 	
}
§§ 
}•• °
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\EmployeeInformation\Interfaces\IAppointmentLetterApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
EmployeeInformation 1
.1 2

Interfaces2 <
{ 
public 

	interface )
IAppointmentLetterApplication 2
{ 
Task		 
<		 
List		 
<		 
AppointmentLetter		 #
>		# $
>		$ %'
GetPendingAppointmentLetter		& A
(		A B
)		B C
;		C D
Task

 )
UpdateAppointmentLetterStatus

 *
(

* +
int

+ .
employeeNumber

/ =
)

= >
;

> ?
} 
} Õ+
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\EmployeeInformation\Interfaces\IEmployeeInformationApplication.cs
	namespace 	
Phonix
 
. 
Application 
. 
Authentication +
.+ ,

Interfaces, 6
{ 
public 

	interface +
IEmployeeInformationApplication 4
:5 6
IBaseApplication7 G
{ 
Task 
< 
EmployeeProfile 
> "
GetEmployeeInformation 4
(4 5
int5 8
employeeSlno9 E
)E F
;F G
Task 
< 
List 
< 
	BioMetric 
> 
>  
GetEmployeeTimeSheet 2
(2 3
long3 7

employeeId8 B
)B C
;C D
Task 
< 
List 
< 
HolidayInformation $
>$ %
>% &
GetEmployeeHolidays' :
(: ;
long; ?

employeeId@ J
)J K
;K L
Task 
< 
PagedResultSet 
< 
EmployeeProfile +
>+ ,
>, -&
SearchEmployeeInformations. H
(H I-
!EmployeeInformationSearchCriteriaI j
searchCriteriak y
)y z
;z {
Task 
< 
EmployeeProfile 
> %
GetEmployeeMinimumProfile 7
(7 8
int8 ;
employeeSlno< H
)H I
;I J
Task 
< 
List 
< 
	Education 
> 
> 
GetEducationDetails 1
(1 2
)2 3
;3 4
Task 
< 
List 
< 
	Education 
> 
> %
GetEducationCourseDetails 7
(7 8
)8 9
;9 :
Task 
< 
List 
< 

BloodGroup 
> 
> 
GetBloodGroup ,
(, -
)- .
;. /
Task 
< 
bool 
> ,
 GetUpdateEmployeeEmailAddressOtp 3
(3 4 
UpdadteEmployeeEmail4 H 
updadteEmployeeEmailI ]
)] ^
;^ _
Task 
< 
bool 
> /
#VerifyUpdateEmployeeEmailAddressOtp 6
(6 7 
UpdadteEmployeeEmail7 K 
updadteEmployeeEmailL `
)` a
;a b
Task 
< 
bool 
> '
UpdateEmployeeFamilyDetails .
(. /
FamilyDetail/ ;
familyDetails< I
)I J
;J K
Task 
< 
bool 
> *
UpdateEmployeeEducationDetails 1
(1 2
EducationDetail2 A
educationDetailB Q
)Q R
;R S
Task 
< 
bool 
> +
UpdateEmployeeExperienceDetails 2
(2 3
ExperienceDetail3 C
experienceDetailD T
)T U
;U V
Task 
< 
List 
< 
BloodRelation 
>  
>  !)
GetFamilyBloodRelationDetails" ?
(? @
)@ A
;A B
Task 
< 
bool 
> '
DeleteEmployeeFamilyDetails .
(. /
int/ 2

empFamSlno3 =
)= >
;> ?
Task 
< 
bool 
> *
DeleteEmployeeEducationDetails 1
(1 2
int2 5

empEduSlno6 @
)@ A
;A B
Task 
< 
bool 
> +
DeleteEmployeeExperienceDetails 2
(2 3
int3 6
	empExSlno7 @
)@ A
;A B
Task   
<   
List   
<   #
AdditionalQualification   )
>  ) *
>  * +&
GetAdditionalQualification  , F
(  F G
)  G H
;  H I
Task!! 
<!! 
List!! 
<!! 
Courses!! 
>!! 
>!! 
CourseFilter!! (
(!!( )
int!!) ,
slno!!- 1
)!!1 2
;!!2 3
Task"" 
<"" 
PagedResultSet"" 
<"" 
EmployeeProfile"" +
>""+ ,
>"", -
GetMyTeamMembers"". >
(""> ?-
!EmployeeInformationSearchCriteria""? `
searchCriteria""a o
)""o p
;""p q
Task## 
<## 
EmployeeProfile## 
>## 
GetEmployeeProfile## 0
(##0 1
string##1 7

employeeId##8 B
)##B C
;##C D
Task$$ 
<$$ 
List$$ 
<$$ 
	BioMetric$$ 
>$$ 
>$$  
GetReporteeTimeSheet$$ 2
($$2 3+
ReporteeTimeSheetSearchCriteria$$3 R
searchCriteria$$S a
)$$a b
;$$b c
Task%% 
<%% 
List%% 
<%% 
EmployeeProfile%% !
>%%! "
>%%" #
SearchEmployee%%$ 2
(%%2 3
string%%3 9
searchValue%%: E
)%%E F
;%%F G
}&& 
}'' ú
ÑF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\EmployeeVerification\Implementations\EmployeeVerificationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
.  
EmployeeVerification 2
.2 3
Implementations3 B
{ 
public 

class +
EmployeeVerificationApplication 0
:1 2,
 IEmployeeVerificationApplication3 S
{		 
private

 
readonly

 '
IEmployeeVerificationDomain

 4&
employeeVerificationDomain

5 O
;

O P
public +
EmployeeVerificationApplication .
(. /'
IEmployeeVerificationDomain/ J&
employeeVerificationDomainK e
)e f
{ 	
this 
. &
employeeVerificationDomain +
=, -&
employeeVerificationDomain. H
;H I
} 	
public 
async 
Task 
< 
bool 
> $
SaveEmployeeVerifiedData  8
(8 9
string9 ?
idempotencyId@ M
,M N
intO R
employeeSlnoS _
)_ `
{ 	
bool 

isVerified 
= 
false #
;# $

isVerified
 
= 
await &
employeeVerificationDomain 8
.8 9$
SaveEmployeeVerifiedData9 Q
(Q R
idempotencyIdR _
,_ `
employeeSlnoa m
)m n
;n o
return 

isVerified 
; 
} 	
public 
async 
Task 
< 
Root 
>  
GetVerficationResult  4
(4 5
string5 ;
idempotencyId< I
,I J
intK N
employeeSlnoO [
)[ \
{ 	
Root 
verificationResult #
=$ %
null& *
;* +
verificationResult 
=  
await! &&
employeeVerificationDomain' A
.A B 
GetVerficationResultB V
(V W
idempotencyIdW d
,d e
employeeSlnof r
)r s
;s t
return 
verificationResult %
;% &
} 	
public 
async 
Task 
< 
bool 
> ,
 UpdateEmployeeVerificationStatus  @
(@ A)
EmployeeVerificationStatusReqA ^
req_ b
)b c
{ 	
bool   

isVerified   
=   
false   #
;  # $

isVerified"" 
="" 
await"" &
employeeVerificationDomain"" 9
.""9 :,
 UpdateEmployeeVerificationStatus"": Z
(""Z [
req""[ ^
)""^ _
;""_ `
return## 

isVerified## 
;## 
}$$ 	
}%% 
}&& è	
ÄF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\EmployeeVerification\Interfaces\IEmployeeVerificationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
.  
EmployeeVerification 2
.2 3

Interfaces3 =
{ 
public 

	interface ,
 IEmployeeVerificationApplication 5
{ 
Task 
< 
bool 
> $
SaveEmployeeVerifiedData +
(+ ,
string, 2
idempotencyId3 @
,@ A
intB E
employeeSlnoF R
)R S
;S T
Task		 
<		 
Root		 
>		  
GetVerficationResult		 '
(		' (
string		( .
idempotencyId		/ <
,		< =
int		> A
employeeSlno		B N
)		N O
;		O P
Task

 
<

 
bool

 
>

 ,
 UpdateEmployeeVerificationStatus

 3
(

3 4)
EmployeeVerificationStatusReq

4 Q
req

R U
)

U V
;

V W
} 
} —
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Form16\Implementations\Form16Application.cs
	namespace		 	
Phoenix		
 
.		 
Application		 
.		 
Form16		 $
.		$ %
Implementations		% 4
{

 
public 

class 
Form16Application "
:" #
IForm16Application$ 6
{ 
private 
readonly 
IForm16Domain &
form16Domain' 3
;3 4
public 
Form16Application  
(  !
IForm16Domain! .
form16Domain/ ;
); <
{ 	
this 
. 
form16Domain 
= 
form16Domain  ,
;, -
} 	
public 
async 
Task 
< 
List 
< 
TaxDocuments +
>+ ,
>, -
	GetForm16. 7
(7 8
string8 >
panNo? D
)D E
{ 	
List 
< 
TaxDocuments 
> 
form16 %
=& '
await( -
form16Domain. :
.: ;
	GetForm16; D
(D E
panNoE J
)J K
;K L
return 
form16 
; 
} 	
public 
async 
Task 
< 
byte 
[ 
]  
>  !
DownLoadForm16" 0
(0 1
YearWiseTaxDocument1 D
taxDocumentE P
)P Q
{ 	
byte 
[ 
] 
form16 
= 
await !
form16Domain" .
.. /
DownLoadForm16/ =
(= >
taxDocument> I
)I J
;J K
return 
form16 
; 
} 	
} 
} Õ
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Form16\Interfaces\IForm16Application.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Form16 $
.$ %

Interfaces% /
{ 
public 

	interface 
IForm16Application '
{		 
Task

 
<

 
List

 
<

 
TaxDocuments

 
>

 
>

  
	GetForm16

! *
(

* +
string

+ 1
panNo

2 7
)

7 8
;

8 9
Task 
< 
byte 
[ 
] 
> 
DownLoadForm16 #
(# $
YearWiseTaxDocument$ 7
taxDocument8 C
)C D
;D E
} 
} Î
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\HelpDocuments\Implementations\HelpDocumentsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
HelpDocuments +
.+ ,
Implementations, ;
{ 
public		 

class		 $
HelpDocumentsApplication		 )
:		) *%
IHelpDocumentsApplication		+ D
{

 
private 
readonly  
IHelpDocumentsDomain -
helpDocumentsDomain. A
;A B
public $
HelpDocumentsApplication '
(' ( 
IHelpDocumentsDomain( <
helpDocumentsDomain= P
)P Q
{ 	
this 
. 
helpDocumentsDomain $
=% &
helpDocumentsDomain' :
;: ;
} 	
public 
async 
Task 
< 
byte 
[ 
]  
>  !
DownloadDocument" 2
(2 3
HelpDocument3 ?
helpDocument@ L
)L M
{ 	
byte 
[ 
] 
documentData 
=  !
await" '
helpDocumentsDomain( ;
.; <
DownloadDocument< L
(L M
helpDocumentM Y
)Y Z
;Z [
return 
documentData 
;  
} 	
public 
async 
Task 
< 
List 
< 
HelpDocument +
>+ ,
>, -
GetActiveHelpDocs. ?
(? @
int@ C
officeTypeSLNOD R
)R S
{ 	
List 
< 
HelpDocument 
> 
helpDocuments ,
=- .
await/ 4
helpDocumentsDomain5 H
.H I
GetActiveHelpDocsI Z
(Z [
officeTypeSLNO[ i
)i j
;j k
return 
helpDocuments  
;  !
} 	
} 
} Û
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\HelpDocuments\Interfaces\IHelpDocumentsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
HelpDocuments +
.+ ,

Interfaces, 6
{ 
public 

	interface %
IHelpDocumentsApplication .
{ 
Task		 
<		 
List		 
<		 
HelpDocument		 
>		 
>		  
GetActiveHelpDocs		! 2
(		2 3
int		3 6
officeTypeSLNO		7 E
)		E F
;		F G
Task

 
<

 
byte

 
[

 
]

 
>

 
DownloadDocument

 %
(

% &
HelpDocument

& 2
helpDocument

3 ?
)

? @
;

@ A
} 
} ∞?
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\InvestmentProofs\Implementations\InvestmentProofsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
InvestmentProofs .
.. /
Implementations/ >
{ 
public		 

class		 '
InvestmentProofsApplication		 ,
:		, -(
IInvestmentProofsApplication		. J
{

 
private 
readonly #
IInvestmentProofsDomain 0"
investmentProofsDomain1 G
;G H
public '
InvestmentProofsApplication *
(* +#
IInvestmentProofsDomain+ B"
investmentProofsDomainC Y
)Y Z
{ 	
this 
. "
investmentProofsDomain '
=( )"
investmentProofsDomain* @
;@ A
} 	
public 
async 
Task 
< 
List 
< "
HouseRentAllowanceFile 5
>5 6
>6 7%
GetHouseRentAllowancFiles8 Q
(Q R
intR U
rentPaymentIdV c
)c d
{ 	
List 
< "
HouseRentAllowanceFile '
>' (#
houseRentAllowanceFiles) @
=A B
awaitC H"
investmentProofsDomainI _
._ `%
GetHouseRentAllowancFiles` y
(y z
rentPaymentId	z á
)
á à
;
à â
return #
houseRentAllowanceFiles *
;* +
} 	
public 
async 
Task 
< 
List 
< 
Chapter6FileDetails 2
>2 3
>3 4
GetChapter6Files5 E
(E F
intF I
chapter6DetailIdJ Z
)Z [
{ 	
List 
< 
Chapter6FileDetails $
>$ %
chapter6FileDetails& 9
=: ;
await< A"
investmentProofsDomainB X
.X Y
GetChapter6FilesY i
(i j
chapter6DetailIdj z
)z {
;{ |
return 
chapter6FileDetails &
;& '
} 	
public 
async 
Task 
< 
List 
< "
HouseIncomeFileDetails 5
>5 6
>6 7
GetHouseIncomeFiles8 K
(K L
intL O
houseIncomeDetailIdP c
)c d
{ 	
List 
< "
HouseIncomeFileDetails '
>' ("
houseIncomeFileDetails) ?
=@ A
awaitB G"
investmentProofsDomainH ^
.^ _
GetHouseIncomeFiles_ r
(r s 
houseIncomeDetailId	s Ü
)
Ü á
;
á à
return   "
houseIncomeFileDetails   )
;  ) *
}!! 	
public## 
async## 
Task## 
<## 
List## 
<## "
OtherIncomeFileDetails## 5
>##5 6
>##6 7
GetOtherIncomeFiles##8 K
(##K L
int##L O
otherIncomeDetailId##P c
)##c d
{$$ 	
List%% 
<%% "
OtherIncomeFileDetails%% '
>%%' ("
otherIncomeFileDetails%%) ?
=%%@ A
await%%B G"
investmentProofsDomain%%H ^
.%%^ _
GetOtherIncomeFiles%%_ r
(%%r s 
otherIncomeDetailId	%%s Ü
)
%%Ü á
;
%%á à
return&& "
otherIncomeFileDetails&& )
;&&) *
}'' 	
public++ 
async++ 
Task++ 
<++ 
bool++ 
>++ (
UploadHouseRentAllowanceFile++  <
(++< ="
HouseRentAllowanceFile++= S"
houseRentAllowanceFile++T j
)++j k
{,, 	
bool-- 
resp-- 
=-- 
await-- "
investmentProofsDomain-- 4
.--4 5(
UploadHouseRentAllowanceFile--5 Q
(--Q R"
houseRentAllowanceFile--R h
)--h i
;--i j
return.. 
resp.. 
;.. 
}// 	
public00 
async00 
Task00 
<00 
bool00 
>00 
UploadChapter6File00  2
(002 3
Chapter6FileDetails003 F
chapter6FileDetails00G Z
)00Z [
{11 	
bool22 
resp22 
=22 
await22 "
investmentProofsDomain22 4
.224 5
UploadChapter6File225 G
(22G H
chapter6FileDetails22H [
)22[ \
;22\ ]
return33 
resp33 
;33 
}44 	
public55 
async55 
Task55 
<55 
bool55 
>55 !
UploadHouseIncomeFile55  5
(555 6"
HouseIncomeFileDetails556 L"
houseIncomeFileDetails55M c
)55c d
{66 	
bool77 
resp77 
=77 
await77 "
investmentProofsDomain77 4
.774 5!
UploadHouseIncomeFile775 J
(77J K"
houseIncomeFileDetails77K a
)77a b
;77b c
return88 
resp88 
;88 
}:: 	
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; !
UploadOtherIncomeFile;;  5
(;;5 6"
OtherIncomeFileDetails;;6 L"
otherIncomeFileDetails;;M c
);;c d
{<< 	
bool== 
resp== 
=== 
await== "
investmentProofsDomain== 4
.==4 5!
UploadOtherIncomeFile==5 J
(==J K"
otherIncomeFileDetails==K a
)==a b
;==b c
return>> 
resp>> 
;>> 
}?? 	
publicDD 
asyncDD 
TaskDD 
<DD 
boolDD 
>DD (
RemoveHouseRentAllowanceFileDD  <
(DD< =
intDD= @
	hraFileIdDDA J
)DDJ K
{EE 	
boolFF 
respFF 
=FF 
awaitFF "
investmentProofsDomainFF 4
.FF4 5(
RemoveHouseRentAllowanceFileFF5 Q
(FFQ R
	hraFileIdFFR [
)FF[ \
;FF\ ]
returnGG 
respGG 
;GG 
}HH 	
publicII 
asyncII 
TaskII 
<II 
boolII 
>II 
RemoveChapter6FileII  2
(II2 3
intII3 6
chapter6FileIdII7 E
)IIE F
{JJ 	
boolKK 
respKK 
=KK 
awaitKK "
investmentProofsDomainKK 4
.KK4 5
RemoveChapter6FileKK5 G
(KKG H
chapter6FileIdKKH V
)KKV W
;KKW X
returnLL 
respLL 
;LL 
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
boolOO 
>OO !
RemoveHouseIncomeFileOO  5
(OO5 6
intOO6 9
houseIncomeFileIdOO: K
)OOK L
{PP 	
boolQQ 
respQQ 
=QQ 
awaitQQ "
investmentProofsDomainQQ 4
.QQ4 5!
RemoveHouseIncomeFileQQ5 J
(QQJ K
houseIncomeFileIdQQK \
)QQ\ ]
;QQ] ^
returnRR 
respRR 
;RR 
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU 
boolUU 
>UU !
RemoveOtherIncomeFileUU  5
(UU5 6
intUU6 9
otherIncomeFileIdUU: K
)UUK L
{VV 	
boolWW 
respWW 
=WW 
awaitWW "
investmentProofsDomainWW 4
.WW4 5!
RemoveOtherIncomeFileWW5 J
(WWJ K
otherIncomeFileIdWWK \
)WW\ ]
;WW] ^
returnXX 
respXX 
;XX 
}YY 	
}[[ 
}\\ õ
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\InvestmentProofs\Interfaces\IInvestmentProofsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
InvestmentProofs .
.. /

Interfaces/ 9
{ 
public 

	interface (
IInvestmentProofsApplication 1
{		 
Task 
< 
List 
< "
HouseRentAllowanceFile (
>( )
>) *%
GetHouseRentAllowancFiles+ D
(D E
intE H
rentPaymentIdI V
)V W
;W X
Task 
< 
List 
< 
Chapter6FileDetails %
>% &
>& '
GetChapter6Files( 8
(8 9
int9 <
chapter6DetailId= M
)M N
;N O
Task 
< 
List 
< "
HouseIncomeFileDetails (
>( )
>) *
GetHouseIncomeFiles+ >
(> ?
int? B
houseIncomeDetailIdC V
)V W
;W X
Task 
< 
List 
< "
OtherIncomeFileDetails (
>( )
>) *
GetOtherIncomeFiles+ >
(> ?
int? B
otherIncomeDetailIdC V
)V W
;W X
Task 
< 
bool 
> (
UploadHouseRentAllowanceFile /
(/ 0"
HouseRentAllowanceFile0 F"
houseRentAllowanceFileG ]
)] ^
;^ _
Task 
< 
bool 
> 
UploadChapter6File %
(% &
Chapter6FileDetails& 9
chapter6FileDetails: M
)M N
;N O
Task 
< 
bool 
> !
UploadHouseIncomeFile (
(( )"
HouseIncomeFileDetails) ?"
houseIncomeFileDetails@ V
)V W
;W X
Task 
< 
bool 
> !
UploadOtherIncomeFile (
(( )"
OtherIncomeFileDetails) ?"
otherIncomeFileDetails@ V
)V W
;W X
Task 
< 
bool 
> (
RemoveHouseRentAllowanceFile /
(/ 0
int0 3
	hraFileId4 =
)= >
;> ?
Task 
< 
bool 
> 
RemoveChapter6File %
(% &
int& )
chapter6FileId* 8
)8 9
;9 :
Task 
< 
bool 
> !
RemoveHouseIncomeFile (
(( )
int) ,
houseIncomeFileId- >
)> ?
;? @
Task 
< 
bool 
> !
RemoveOtherIncomeFile (
(( )
int) ,
otherIncomeFileId- >
)> ?
;? @
}   
}!! Ô 
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Investment\Implementations\InvestmentApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 

Investment (
.( )
Implementations) 8
{		 
public

 

class

 !
InvestmentApplication

 &
:

' ("
IInvestmentApplication

* @
{ 
private 
readonly 
IInvestmentDomain *
investmentDomain+ ;
;; <
private 
readonly 
ILoggerManager '
logger( .
;. /
public !
InvestmentApplication $
($ %
IInvestmentDomain% 6
investmentDomain7 G
,G H
ILoggerManagerI W
loggerX ^
)^ _
{ 	
this 
. 
investmentDomain !
=" #
investmentDomain$ 4
;4 5
this 
. 
logger 
= 
logger  
;  !
} 	
public 
async 
Task 
< !
InvestmentDeclaration /
>/ 0$
GetInvestmentDeclaration1 I
(I J
intJ M
finSLNoN U
,U V
intW Z
employeeSLNo[ g
)g h
{ 	!
InvestmentDeclaration !!
tdsEmployeeHRADetails" 7
=8 9
await: ?
investmentDomain@ P
.P Q$
GetInvestmentDeclarationQ i
(i j
finSLNoj q
,q r
employeeSLNos 
)	 Ä
;
Ä Å
return !
tdsEmployeeHRADetails (
;( )
} 	
public 
async 
Task 
< !
InvestmentDeclaration /
>/ 0&
SaveInvestmentDeclarations1 K
(K L!
InvestmentDeclarationL a!
investmentDeclarationb w
)w x
{ 	!
InvestmentDeclaration !

investment" ,
=- .
await/ 4
investmentDomain5 E
.E F&
SaveInvestmentDeclarationsF `
(` a!
investmentDeclarationa v
)v w
;w x
return 

investment 
; 
} 	
public   
async   
Task   
<   
List   
<   !
AssessmentTypeDetails   4
>  4 5
>  5 6"
GetAssesseeTypeDetails  7 M
(  M N
)  N O
{!! 	
List"" 
<"" !
AssessmentTypeDetails"" '
>""' (!
assessmentTypeDetails"") >
=""? @
await""A F
investmentDomain""G W
.""W X"
GetAssesseeTypeDetails""X n
(""n o
)""o p
;""p q
return## !
assessmentTypeDetails## (
;##( )
}$$ 	
public&& 
async&& 
Task&& 
<&& 
List&& 
<&& 
HRALocations&& +
>&&+ ,
>&&, -
GetHRALocations&&. =
(&&= >
)&&> ?
{'' 	
List(( 
<(( 
HRALocations(( 
>(( 
hRALocations(( +
=((, -
await((. 3
investmentDomain((4 D
.((D E
GetHRALocations((E T
(((T U
)((U V
;((V W
return)) 
hRALocations)) 
;))  
}** 	
public++ 
async++ 
Task++ 
<++ 
TaxDeductionDetails++ -
>++- .&
GetIncomeTaxPaymentDetails++/ I
(++I J
int++J M
employeeSLNo++N Z
)++Z [
{,, 	
TaxDeductionDetails-- 
taxDeductionDetails--  3
=--4 5
await--6 ;
investmentDomain--< L
.--L M&
GetIncomeTaxPaymentDetails--M g
(--g h
employeeSLNo--h t
)--t u
;--u v
return.. 
taxDeductionDetails.. &
;..& '
}// 	
}00 
}11 Ú
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Investment\Interfaces\IInvestmentApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 

Investment (
.( )

Interfaces) 3
{ 
public 

	interface "
IInvestmentApplication ,
{		 
Task

 
<

 !
InvestmentDeclaration

 "
>

" #$
GetInvestmentDeclaration

$ <
(

< =
int

= @
finSLNo

A H
,

H I
int

J M
employeeSLNo

N Z
)

Z [
;

[ \
Task 
< !
InvestmentDeclaration "
>" #&
SaveInvestmentDeclarations$ >
(> ?!
InvestmentDeclaration? T!
investmentDeclarationU j
)j k
;k l
Task 
< 
List 
< !
AssessmentTypeDetails '
>' (
>( )"
GetAssesseeTypeDetails* @
(@ A
)A B
;B C
Task 
< 
List 
< 
HRALocations 
> 
>  
GetHRALocations! 0
(0 1
)1 2
;2 3
Task 
< 
TaxDeductionDetails  
>  !&
GetIncomeTaxPaymentDetails" <
(< =
int= @
employeeSLNoA M
)M N
;N O
} 
} º	
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveAutoApproval\Implementations\LeaveAutoApprovalApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveAutoApproval /
./ 0
Implementations0 ?
{ 
public 

class #
AutoApprovalApplication (
:) *)
ILeaveAutoApprovalApplication+ H
{ 
private		 
readonly		 
IAutoApprovalDomain		 ,
AutoApprovalDomain		- ?
;		? @
public

 #
AutoApprovalApplication

 &
(

& '
IAutoApprovalDomain

' :
AutoApprovalDomain

; M
)

M N
{ 	
this 
. 
AutoApprovalDomain #
=$ %
AutoApprovalDomain& 8
;8 9
} 	
public 
async 
Task 
LeaveAutoApprovals ,
(, -
)- .
{ 	
await 
AutoApprovalDomain $
.$ %
GetAutoApprovals% 5
(5 6
)6 7
;7 8
} 	
} 
} ê
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveAutoApproval\Interfaces\ILeaveAutoApprovalApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveAutoApproval /
./ 0

Interfaces0 :
{ 
public 

	interface )
ILeaveAutoApprovalApplication 2
{ 
Task 
LeaveAutoApprovals 
(  
)  !
;! "
}		 
}

 ä"
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagementReports\Implementations\ReportsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. "
LeaveManagementReports 4
.4 5
Implementations5 D
{ 
public		 

class		 
ReportsApplication		 #
:		$ %
IReportsApplication		& 9
{

 
private 
readonly 
IReportsDomain '!
leaveManagementDomain( =
;= >
public 
ReportsApplication !
(! "
IReportsDomain" 0!
leaveManagementDomain1 F
)F G
{ 	
this 
. !
leaveManagementDomain &
=' (!
leaveManagementDomain) >
;> ?
} 	
public 
async 
Task 
< 
List 
< 
LeaveDetailReport 0
>0 1
>1 2
GetLeaveReport3 A
(A B
GetLeaveReportReqB S
getLeaveReportReqT e
)e f
{ 	
List 
< 
LeaveDetailReport "
>" #
leaveDetails$ 0
=1 2
await3 8!
leaveManagementDomain9 N
.N O
GetLeaveReportO ]
(] ^
getLeaveReportReq^ o
)o p
;p q
return 
leaveDetails 
;  
} 	
public 
async 
Task 
< 
List 
< 
AutoApprovalReport 1
>1 2
>2 3!
GetAutoApprovalReport4 I
(I J
GetLeaveReportReqJ [
getLeaveReportReq\ m
)m n
{ 	
List 
< 
AutoApprovalReport #
># $
employeeLeaveStatus% 8
=9 :
await; @!
leaveManagementDomainA V
.V W!
GetAutoApprovalReportW l
(l m
getLeaveReportReqm ~
)~ 
;	 Ä
return 
employeeLeaveStatus &
;& '
} 	
public 
async 
Task 
< 
List 
< 
LeaveDetailReport 0
>0 1
>1 2 
GetLeaveTransactions3 G
(G H"
GetLeaveTransactionReqH ^"
getLeaveTransactionReq_ u
)u v
{ 	
List 
< 
LeaveDetailReport "
>" #
leaveDetails$ 0
=1 2
await3 8!
leaveManagementDomain9 N
.N O 
GetLeaveTransactionsO c
(c d"
getLeaveTransactionReqd z
)z {
;{ |
return 
leaveDetails 
;  
} 	
public 
async 
Task 
< 
List 
< ,
 EmployeeVerificationDetailReport ?
>? @
>@ A)
GetEmployeeVerificationReportB _
(_ `)
EmployeeVerificationReportReq` }
	reportReq	~ á
)
á à
{   	
List!! 
<!! ,
 EmployeeVerificationDetailReport!! 1
>!!1 2
details!!3 :
=!!; <
await!!= B!
leaveManagementDomain!!C X
.!!X Y)
GetEmployeeVerificationReport!!Y v
(!!v w
	reportReq	!!w Ä
)
!!Ä Å
;
!!Å Ç
return"" 
details"" 
;"" 
}## 	
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% 
LeaveDetailReport%% 0
>%%0 1
>%%1 2
GetAllLeaves%%3 ?
(%%? @
GetLeaveReportReq%%@ Q
getLeaveReportReq%%R c
)%%c d
{&& 	
List'' 
<'' 
LeaveDetailReport'' "
>''" #
leaveDetails''$ 0
=''1 2
await''3 8!
leaveManagementDomain''9 N
.''N O
GetAllLeaves''O [
(''[ \
getLeaveReportReq''\ m
)''m n
;''n o
return(( 
leaveDetails(( 
;((  
})) 	
}** 
}++ ˝
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagementReports\Interfaces\IReportsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. "
LeaveManagementReports 4
.4 5

Interfaces5 ?
{ 
public 

	interface 
IReportsApplication (
{ 
Task		 
<		 
List		 
<		 
LeaveDetailReport		 #
>		# $
>		$ %
GetLeaveReport		& 4
(		4 5
GetLeaveReportReq		5 F
getLeaveReportReq		G X
)		X Y
;		Y Z
Task

 
<

 
List

 
<

 
AutoApprovalReport

 $
>

$ %
>

% &!
GetAutoApprovalReport

' <
(

< =
GetLeaveReportReq

= N
getLeaveReportReq

O `
)

` a
;

a b
Task 
< 
List 
< 
LeaveDetailReport #
># $
>$ % 
GetLeaveTransactions& :
(: ;"
GetLeaveTransactionReq; Q"
getLeaveTransactionReqR h
)h i
;i j
Task 
< 
List 
< ,
 EmployeeVerificationDetailReport 2
>2 3
>3 4)
GetEmployeeVerificationReport5 R
(R S)
EmployeeVerificationReportReqS p
	reportReqq z
)z {
;{ |
Task 
< 
List 
< 
LeaveDetailReport #
># $
>$ %
GetAllLeaves& 2
(2 3
GetLeaveReportReq3 D
getLeaveReportReqE V
)V W
;W X
} 
} Ü$
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagement\Implementations\LeaveEncashmentApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .
Implementations. =
{ 
public		 

class		 &
LeaveEncashmentApplication		 +
:		, -'
ILeaveEncashmentApplication		. I
{

 
private 
readonly "
ILeaveEncashmentDomain /!
leaveEncashmentDomain0 E
;E F
public &
LeaveEncashmentApplication )
() *"
ILeaveEncashmentDomain* @!
leaveEncashmentDomainA V
)V W
{ 	
this 
. !
leaveEncashmentDomain &
=' (!
leaveEncashmentDomain) >
;> ?
} 	
public 
async 
Task 
< 
List 
< 
LeaveEncashment .
>. /
>/ 0
GetLeaveEncashment1 C
(C D
intD G
employeeSlnoH T
)T U
{ 	
List 
< 
LeaveEncashment  
>  !
leaveEncashment" 1
=2 3
await4 9!
leaveEncashmentDomain: O
.O P
GetLeaveEncashmentP b
(b c
employeeSlnoc o
)o p
;p q
return 
leaveEncashment "
;" #
} 	
public 
async 
Task 
< 
bool 
> 
SaveLeaveEncashment  3
(3 4
LeaveEncashmentReq4 F&
employeeLeaveEncashmentReqG a
)a b
{ 	
bool 
	isUpdated 
= 
await "!
leaveEncashmentDomain# 8
.8 9
SaveLeaveEncashment9 L
(L M&
employeeLeaveEncashmentReqM g
)g h
;h i
return 
	isUpdated 
; 
} 	
public 
async 
Task 
< 
bool 
> *
UpdateEmployeeEncashmentStatus  >
(> ?
UpdateEncashmentReq? R
leaveDetailS ^
)^ _
{ 	
bool 
	isUpdated 
= 
await "!
leaveEncashmentDomain# 8
.8 9*
UpdateEmployeeEncashmentStatus9 W
(W X
leaveDetailX c
)c d
;d e
return   
	isUpdated   
;   
}!! 	
public"" 
async"" 
Task"" 
<"" 
bool"" 
>"" !
DeleteLeaveEncashment""  5
(""5 6
DeleteEncashmentReq""6 I
deleteEncashmentReq""J ]
)""] ^
{## 	
bool$$ 
	isUpdated$$ 
=$$ 
await$$ "!
leaveEncashmentDomain$$# 8
.$$8 9!
DeleteLeaveEncashment$$9 N
($$N O
deleteEncashmentReq$$O b
)$$b c
;$$c d
return%% 
	isUpdated%% 
;%% 
}&& 	
public'' 
async'' 
Task'' 
<'' 
decimal'' !
>''! "'
GetEmployeeTDSAmountDetails''# >
(''> ?#
EmployeeTDSMountDetails''? V#
employeeTDSMountDetails''W n
)''n o
{(( 	
decimal)) 
	tdsAmount)) 
=)) 
await))  %!
leaveEncashmentDomain))& ;
.)); <'
GetEmployeeTDSAmountDetails))< W
())W X#
employeeTDSMountDetails))X o
)))o p
;))p q
return** 
	tdsAmount** 
;** 
}++ 	
public,, 
async,, 
Task,, 
<,, 
List,, 
<,, +
LeaveEncashmentApprovalsDetails,, >
>,,> ?
>,,? @'
GetLeavesEncashmentApproval,,A \
(,,\ ]
int,,] `
employeeSlno,,a m
),,m n
{-- 	
List.. 
<.. +
LeaveEncashmentApprovalsDetails.. 0
>..0 1#
leaveEncashmentApproval..2 I
=..J K
await..L Q!
leaveEncashmentDomain..R g
...g h(
GetLeavesEncashmentApproval	..h É
(
..É Ñ
employeeSlno
..Ñ ê
)
..ê ë
;
..ë í
return// #
leaveEncashmentApproval// *
;//* +
}00 	
}22 
}33 ±
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagement\Implementations\LeaveEntitlementApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .
Implementations. =
{ 
public		 

class		 '
LeaveEntitlementApplication		 ,
:		- .(
ILeaveEntitlementApplication		/ K
{

 
private 
readonly #
ILeaveEntitlementDomain 0"
leaveEntitlementDomain1 G
;G H
public '
LeaveEntitlementApplication *
(* +#
ILeaveEntitlementDomain+ B"
leaveEntitlementDomainC Y
)Y Z
{ 	
this 
. "
leaveEntitlementDomain '
=( )"
leaveEntitlementDomain* @
;@ A
} 	
public 
async 
Task 
< 
List 
< 
LeaveEntitlement /
>/ 0
>0 1
GetLeaveEntitlement2 E
(E F*
GetEmployeeLeaveEntitlementReqF d(
employeeLeaveEntitlementReq	e Ä
)
Ä Å
{ 	
List 
< 
LeaveEntitlement !
>! "#
leaveEntitlementdetails# :
=; <
await= B"
leaveEntitlementDomainC Y
.Y Z
GetLeaveEntitlementZ m
(m n(
employeeLeaveEntitlementReq	n â
)
â ä
;
ä ã
return #
leaveEntitlementdetails *
;* +
} 	
public 
async 
Task 
< 
bool 
> "
UpdateLeaveEntitlement  6
(6 7
List7 ;
<; <
LeaveEntitlement< L
>L M
leaveEntitlementsN _
)_ `
{ 	
bool 
	isUpdated 
= 
await ""
leaveEntitlementDomain# 9
.9 :"
UpdateLeaveEntitlement: P
(P Q
leaveEntitlementsQ b
)b c
;c d
return 
	isUpdated 
; 
} 	
public 
async 
Task 
< 
bool 
>  
SaveLeaveEntitlement  4
(4 5
List5 9
<9 :
LeaveEntitlement: J
>J K
leaveEntitlementsL ]
)] ^
{ 	
bool 
	isUpdated 
= 
await ""
leaveEntitlementDomain# 9
.9 : 
SaveLeaveEntitlement: N
(N O
leaveEntitlementsO `
)` a
;a b
return 
	isUpdated 
; 
} 	
public   
async   
Task   
<   
bool   
>   "
DeleteLeaveEntitlement    6
(  6 7-
!DeleteEmployeeLeaveEntitlementReq  7 X-
!deleteEmployeeLeaveEntitlementReq  Y z
)  z {
{!! 	
bool"" 
	isUpdated"" 
="" 
await"" ""
leaveEntitlementDomain""# 9
.""9 :"
DeleteLeaveEntitlement"": P
(""P Q-
!deleteEmployeeLeaveEntitlementReq""Q r
)""r s
;""s t
return## 
	isUpdated## 
;## 
}$$ 	
}%% 
}&& ‘F
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagement\Implementations\LeaveManagementApplication.cs
	namespace		 	
Phoenix		
 
.		 
Application		 
.		 
LeaveManagement		 -
.		- .
Implementations		. =
{

 
public 

class &
LeaveManagementApplication +
:+ ,'
ILeaveManagementApplication- H
{ 
private 
readonly "
ILeaveManagementDomain /!
leaveManagementDomain0 E
;E F
public &
LeaveManagementApplication )
() *"
ILeaveManagementDomain* @!
leaveManagementDomainA V
)V W
{ 	
this 
. !
leaveManagementDomain &
=' (!
leaveManagementDomain) >
;> ?
} 	
public 
async 
Task 
< 
List 
< 
LeaveDetail *
>* +
>+ ,
GetEmployeeLeaves- >
(> ?
int? B
empSLNoC J
,J K
intK N
statusIdO W
)W X
{ 	
List 
< 
LeaveDetail 
> 
employeeLeaveStatus 1
=2 3
await4 9!
leaveManagementDomain: O
.O P
GetEmployeeLeavesP a
(a b
empSLNob i
,i j
statusIdk s
)s t
;t u
return 
employeeLeaveStatus &
;& '
} 	
public 
async 
Task 
< !
EmpLeavePolicyDetails /
>/ 0!
GetEmpLeavesbyLeaveId1 F
(F G
intG J
leaveIdK R
)R S
{ 	!
EmpLeavePolicyDetails !!
empLeavePolicyDetails" 7
=8 9
await: ?!
leaveManagementDomain@ U
.U V!
GetEmpLeavesbyLeaveIdV k
(k l
leaveIdl s
)s t
;t u
return !
empLeavePolicyDetails (
;( )
} 	
public 
async 
Task 
< 
List 
< 
EmpLeaveBalance .
>. /
>/ 0#
GetEmployeeLeaveBalance1 H
(H I
intI L
empSLNoM T
)T U
{ 	
List 
< 
EmpLeaveBalance  
>  !
employeeLeaves" 0
=1 2
await3 8!
leaveManagementDomain9 N
.N O#
GetEmployeeLeaveBalanceO f
(f g
empSLNog n
)n o
;o p
return   
employeeLeaves   !
;  ! "
}!! 	
public"" 
async"" 
Task"" 
<"" 
bool"" 
>"" %
UpdateEmployeeLeaveStatus""  9
(""9 :
LeaveDetail"": E
empLeave""F N
)""N O
{## 	
bool$$ %
updateEmployeeLeaveStatus$$ )
=$$* +
await$$, 1!
leaveManagementDomain$$2 G
.$$G H%
UpdateEmployeeLeaveStatus$$H a
($$a b
empLeave$$b j
)$$j k
;$$k l
return%% %
updateEmployeeLeaveStatus%% ,
;%%, -
}&& 	
public'' 
async'' 
Task'' 
<'' 
bool'' 
>'' -
!UpdateMultipleEmployeeLeaveStatus''  A
(''A B0
$UpdateMultipleEmployeeLeaveStatusReq''B f
empLeaveDetails''g v
)''v w
{(( 	
bool)) %
updateEmployeeLeaveStatus)) *
=))+ ,
await))- 2!
leaveManagementDomain))3 H
.))H I-
!UpdateMultipleEmployeeLeaveStatus))I j
())j k
empLeaveDetails))k z
)))z {
;)){ |
return** %
updateEmployeeLeaveStatus** ,
;**, -
}++ 	
public,, 
async,, 
Task,, 
<,, 
EmpLeaveResponse,, *
>,,* +
SaveEmployeeLeave,,, =
(,,= >
EmployeeLeave,,> K
empLeaveRequest,,L [
),,[ \
{-- 	
EmpLeaveResponse.. 
SaveEmployeeLeave.. .
=../ 0
await..1 6!
leaveManagementDomain..7 L
...L M
SaveEmployeeLeave..M ^
(..^ _
empLeaveRequest.._ n
)..n o
;..o p
return// 
SaveEmployeeLeave// $
;//$ %
}00 	
public11 
async11 
Task11 
<11 
List11 
<11 
LeaveDetail11 *
>11* +
>11+ ,'
GetLeavesWaitingForApproval11- H
(11H I
int11I L
employeeSlno11M Y
)11Y Z
{22 	
List33 
<33 
LeaveDetail33 
>33 
empList33 %
=33& '
await33( -!
leaveManagementDomain33. C
.33C D'
GetLeavesWaitingForApproval33D _
(33_ `
employeeSlno33` l
)33l m
;33m n
return44 
empList44 
;44 
}55 	
public77 
async77 
Task77 
<77 
List77 
<77 
GetTeamLeavesData77 0
>770 1
>771 2
GetTeamLeaves773 @
(77@ A
LeaveSearchCriteria77A T
searchCriteria77U c
)77c d
{88 	
List99 
<99 
GetTeamLeavesData99 "
>99" #
empList99$ +
=99, -
await99. 3!
leaveManagementDomain994 I
.99I J
GetTeamLeaves99J W
(99W X
searchCriteria99X f
)99f g
;99g h
return:: 
empList:: 
;:: 
};; 	
public<< 
async<< 
Task<< 
<<< 
List<< 
<<<  
GetTeamEmpLeavesData<< 3
><<3 4
><<4 5#
GetMyTeamEmployeeLeaves<<6 M
(<<M N
LeaveSearchCriteria<<N a
searchCriteria<<b p
)<<p q
{== 	
List>> 
<>>  
GetTeamEmpLeavesData>> %
>>>% &
	leaveList>>' 0
=>>1 2
await>>3 8!
leaveManagementDomain>>9 N
.>>N O#
GetMyTeamEmployeeLeaves>>O f
(>>f g
searchCriteria>>g u
)>>u v
;>>v w
return?? 
	leaveList?? 
;?? 
}@@ 	
publicAA 
asyncAA 
TaskAA 
<AA 
ListAA 
<AA 
LeaveDetailAA *
>AA* +
>AA+ ,$
GetManagerApprovalLeavesAA- E
(AAE F
intAAF I
employeeSlnoAAJ V
)AAV W
{BB 	
ListCC 
<CC 
LeaveDetailCC 
>CC 
empListCC %
=CC& '
awaitCC( -!
leaveManagementDomainCC. C
.CCC D$
GetManagerApprovalLeavesCCD \
(CC\ ]
employeeSlnoCC] i
)CCi j
;CCj k
returnDD 
empListDD 
;DD 
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 
intGG 
>GG 
GetUtilizedOnDutiesGG 2
(GG2 3
intGG3 6
employeeSlnoGG7 C
)GGC D
{HH 	
intII 
utilizedOnDutiesII  
=II! "
awaitII# (!
leaveManagementDomainII) >
.II> ?
GetUtilizedOnDutiesII? R
(IIR S
employeeSlnoIIS _
)II_ `
;II` a
returnJJ 
utilizedOnDutiesJJ #
;JJ# $
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
ListMM 
<MM 
EmpLeaveFileDetailsMM 2
>MM2 3
>MM3 4
GetEmpLeaveFilesMM5 E
(MME F
intMMF I
leaveIdMMJ Q
)MMQ R
{NN 	
ListOO 
<OO 
EmpLeaveFileDetailsOO %
>OO% &
leaveFileDetailsOO& 6
=OO7 8
awaitOO9 >!
leaveManagementDomainOO? T
.OOT U
GetEmpLeaveFilesOOU e
(OOe f
leaveIdOOf m
)OOm n
;OOn o
returnPP 
leaveFileDetailsPP #
;PP# $
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS 
boolSS 
>SS 
CancelLeaveSS  +
(SS+ ,
intSS, /
leaveIdSS0 7
)SS7 8
{TT 	
boolUU %
updateEmployeeLeaveStatusUU *
=UU+ ,
awaitUU- 2!
leaveManagementDomainUU3 H
.UUH I
CancelLeaveUUI T
(UUT U
leaveIdUUU \
)UU\ ]
;UU] ^
returnVV %
updateEmployeeLeaveStatusVV ,
;VV, -
}WW 	
}XX 
}YY í
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagement\Interfaces\ILeaveEncashmentApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .

Interfaces. 8
{ 
public 

	interface '
ILeaveEncashmentApplication 0
{ 
Task		 
<		 
List		 
<		 
LeaveEncashment		 !
>		! "
>		" #
GetLeaveEncashment		$ 6
(		6 7
int		7 :
employeeSlno		; G
)		G H
;		H I
Task

 
<

 
bool

 
>

 
SaveLeaveEncashment

 &
(

& '
LeaveEncashmentReq

' 9&
employeeLeaveEncashmentReq

: T
)

T U
;

U V
Task 
< 
bool 
> !
DeleteLeaveEncashment (
(( )
DeleteEncashmentReq) <
deleteEncashmentReq= P
)P Q
;Q R
Task 
< 
decimal 
> '
GetEmployeeTDSAmountDetails 1
(1 2#
EmployeeTDSMountDetails2 I#
employeeTDSMountDetailsJ a
)a b
;b c
Task 
< 
List 
< +
LeaveEncashmentApprovalsDetails 1
>1 2
>2 3'
GetLeavesEncashmentApproval4 O
(O P
intP S
employeeSlnoT `
)` a
;a b
Task 
< 
bool 
> *
UpdateEmployeeEncashmentStatus 1
(1 2
UpdateEncashmentReq2 E
leaveDetailF Q
)Q R
;R S
} 
} ª
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagement\Interfaces\ILeaveEntitlementApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .

Interfaces. 8
{ 
public 

	interface (
ILeaveEntitlementApplication 1
{ 
Task		 
<		 
List		 
<		 
LeaveEntitlement		 "
>		" #
>		# $
GetLeaveEntitlement		% 8
(		8 9*
GetEmployeeLeaveEntitlementReq		9 W'
employeeLeaveEntitlementReq		X s
)		s t
;		t u
Task

 
<

 
bool

 
>

 "
UpdateLeaveEntitlement

 )
(

) *
List

* .
<

. /
LeaveEntitlement

/ ?
>

? @
leaveEntitlements

A R
)

R S
;

S T
Task 
< 
bool 
>  
SaveLeaveEntitlement '
(' (
List( ,
<, -
LeaveEntitlement- =
>= >
leaveEntitlements? P
)P Q
;Q R
Task 
< 
bool 
> "
DeleteLeaveEntitlement )
() *-
!DeleteEmployeeLeaveEntitlementReq* K-
!deleteEmployeeLeaveEntitlementReqL m
)m n
;n o
} 
} Ï
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\LeaveManagement\Interfaces\ILeaveManagementApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .

Interfaces. 8
{ 
public		 

	interface		 '
ILeaveManagementApplication		 0
{

 
Task 
< 
List 
< 
LeaveDetail 
> 
> 
GetEmployeeLeaves  1
(1 2
int2 5
empSLNo6 =
,= >
int? B
statusIdC K
)K L
;L M
Task 
< !
EmpLeavePolicyDetails "
>" #!
GetEmpLeavesbyLeaveId$ 9
(9 :
int: =
leaveId> E
)E F
;F G
Task 
< 
List 
< 
EmpLeaveBalance !
>! "
>" ##
GetEmployeeLeaveBalance$ ;
(; <
int< ?
empSLNo@ G
)G H
;H I
Task 
< 
bool 
> %
UpdateEmployeeLeaveStatus ,
(, -
LeaveDetail- 8
empLeave9 A
)A B
;B C
Task 
< 
bool 
> -
!UpdateMultipleEmployeeLeaveStatus 4
(4 50
$UpdateMultipleEmployeeLeaveStatusReq5 Y
empLeaveDetailsZ i
)i j
;j k
Task 
< 
EmpLeaveResponse 
> 
SaveEmployeeLeave 0
(0 1
EmployeeLeave1 >
empLeaveRequest? N
)N O
;O P
Task 
< 
List 
< 
LeaveDetail 
> 
> '
GetLeavesWaitingForApproval  ;
(; <
int< ?
employeeSlno@ L
)L M
;M N
Task 
< 
List 
< 
GetTeamLeavesData #
># $
>$ %
GetTeamLeaves& 3
(3 4
LeaveSearchCriteria4 G
searchCriteriaH V
)V W
;W X
Task 
< 
List 
<  
GetTeamEmpLeavesData &
>& '
>' (#
GetMyTeamEmployeeLeaves) @
(@ A
LeaveSearchCriteriaA T
searchCriteriaU c
)c d
;d e
Task 
< 
List 
< 
LeaveDetail 
> 
> $
GetManagerApprovalLeaves  8
(8 9
int9 <
employeeSlno= I
)I J
;J K
Task 
< 
int 
> 
GetUtilizedOnDuties %
(% &
int& )
employeeSlno* 6
)6 7
;7 8
Task 
< 
List 
< 
EmpLeaveFileDetails %
>% &
>& '
GetEmpLeaveFiles( 8
(8 9
int9 <
leaveId= D
)D E
;E F
Task 
< 
bool 
> 
CancelLeave 
( 
int "
leaveId# *
)* +
;+ ,
} 
} ∆
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Mandals\Implementations\MandalsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Mandals %
.% &
Implementations& 5
{		 
public

 

class

 
MandalsApplication

 #
:

$ %
IMandalsApplication

& 9
{ 
private 
readonly 
IMandalsDomain '
mandalsDomain( 5
;5 6
public 
MandalsApplication !
(! "
IMandalsDomain" 0
mandalsDomain1 >
)> ?
{ 	
this 
. 
mandalsDomain 
=  
mandalsDomain! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
MandalDetails ,
>, -
>- .
GetMandalDetails/ ?
(? @
int@ C
districtSlNoD P
)P Q
{ 	
List 
< 
MandalDetails 
> 
mandalDetails  -
=. /
await0 5
mandalsDomain6 C
.C D
GetMandalDetailsD T
(T U
districtSlNoU a
)a b
;b c
return 
mandalDetails  
;  !
} 	
} 
} ˙
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Mandals\Interfaces\IMandalsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Mandals %
.% &

Interfaces& 0
{ 
public 

	interface 
IMandalsApplication (
{		 
Task

 
<

 
List

 
<

 
MandalDetails

 
>

  
>

  !
GetMandalDetails

" 2
(

2 3
int

3 6
districtSlNo

7 C
)

C D
;

D E
} 
} ™
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Implementations\AttendanceReportTypeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Masters %
.% &
Implementations& 5
{ 
public		 

class		 +
AttendanceReportTypeApplication		 0
:		1 2,
 IAttendanceReportTypeApplication		3 S
{

 
private 
readonly '
IAttendanceReportTypeDomain 4&
attendanceReportTypeDomain5 O
;O P
public +
AttendanceReportTypeApplication .
(. /'
IAttendanceReportTypeDomain/ J&
attendanceReportTypeDomainK e
)e f
{ 	
this 
. &
attendanceReportTypeDomain +
=, -&
attendanceReportTypeDomain. H
;H I
} 	
public 
async 
Task 
< 
List 
<  
AttendanceReportType 3
>3 4
>4 5$
GetAttendanceReportTypes6 N
(N O
)O P
{ 	
List 
<  
AttendanceReportType %
>% &
reportTypes' 2
=3 4
await5 :&
attendanceReportTypeDomain; U
.U V$
GetAttendanceReportTypesV n
(n o
)o p
;p q
return 
reportTypes 
; 
} 	
} 
} Ë
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Implementations\BranchApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Masters %
.% &
Implementations& 5
{		 
public

 

class

 
BranchApplication

 "
:

# $
IBranchApplication

% 7
{ 
private 
readonly 
IBranchDomain &
branchDomain' 3
;3 4
public 
BranchApplication  
(  !
IBranchDomain! .
branchDomain/ ;
); <
{ 	
this 
. 
branchDomain 
= 
branchDomain  ,
;, -
} 	
public 
async 
Task 
< 
List 
< 
Branch %
>% &
>& '
GetHRBranch( 3
(3 4
int4 7
employeeSlno8 D
)D E
{ 	
List 
< 
Branch 
> 
branch 
=  !
await" '
branchDomain( 4
.4 5
GetHRBranch5 @
(@ A
employeeSlnoA M
)M N
;N O
return 
branch 
; 
} 	
public 
async 
Task 
< 
List 
< 
	BranchRMS (
>( )
>) *
GetHRBranchRMS+ 9
(9 :
int: =
employeeSlno> J
)J K
{ 	
List 
< 
	BranchRMS 
> 
branch "
=# $
await% *
branchDomain+ 7
.7 8
GetHRBranchRMS8 F
(F G
employeeSlnoG S
)S T
;T U
return 
branch 
; 
} 	
public 
async 
Task 
< 
List 
< 
Branch %
>% &
>& ' 
GetBranchesByOfcType( <
(< =
int= @
officeTypeSlnoA O
,O P
intP S
employeeSlnoT `
)` a
{ 	
List 
< 
Branch 
> 
branch 
=  !
await" '
branchDomain( 4
.4 5 
GetBranchesByOfcType5 I
(I J
officeTypeSlnoJ X
,X Y
employeeSlnoZ f
)f g
;g h
return 
branch 
; 
} 	
public   
async   
Task   
<   
List   
<   

OfficeType   )
>  ) *
>  * +
GetOfficeType  , 9
(  9 :
)  : ;
{!! 	
List"" 
<"" 

OfficeType"" 
>"" 

officeType"" '
=""( )
await""* /
branchDomain""0 <
.""< =
GetOfficeType""= J
(""J K
)""K L
;""L M
return## 

officeType## 
;## 
}$$ 	
}%% 
}&& º
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Implementations\LeaveDayTypeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .
Implementations. =
{		 
public

 

class

 #
LeaveDayTypeApplication

 (
:

) *$
ILeaveDayTypeApplication

+ C
{ 
private 
readonly 
ILeaveDayTypeDomain ,
leaveDayTypeDomain- ?
;? @
public #
LeaveDayTypeApplication &
(& '
ILeaveDayTypeDomain' :
leaveDayTypeDomain; M
)M N
{ 	
this 
. 
leaveDayTypeDomain #
=$ %
leaveDayTypeDomain& 8
;8 9
} 	
public 
async 
Task 
< 
List 
< 
LeaveDayType +
>+ ,
>, -
GetLeaveDayTypes. >
(> ?
)? @
{ 	
List 
< 
LeaveDayType 
> 
leaveDayType +
=, -
await. 3
leaveDayTypeDomain4 F
.F G
GetLeaveDayTypesG W
(W X
)X Y
;Y Z
return 
leaveDayType 
;  
} 	
} 
} ©
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Implementations\LeaveStatusApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .
Implementations. =
{		 
public

 

class

 "
LeaveStatusApplication

 '
:

( )#
ILeaveStatusApplication

* A
{ 
private 
readonly 
ILeaveStatusDomain +
leaveStatusDomain, =
;= >
public "
LeaveStatusApplication %
(% &
ILeaveStatusDomain& 8
leaveStatusDomain9 J
)J K
{ 	
this 
. 
leaveStatusDomain "
=# $
leaveStatusDomain% 6
;6 7
} 	
public 
async 
Task 
< 
List 
< 
LeaveStatus *
>* +
>+ ,
GetLeaveStatus- ;
(; <
)< =
{ 	
List 
< 
LeaveStatus 
> 
leaveStatus )
=* +
await, 1
leaveStatusDomain2 C
.C D
GetLeaveStatusD R
(R S
)S T
;T U
return 
leaveStatus 
; 
} 	
} 
} Ö
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Implementations\LeaveTypeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .
Implementations. =
{		 
public

 

class

  
LeaveTypeApplication

 %
:

& '!
ILeaveTypeApplication

( =
{ 
private 
readonly 
ILeaveTypeDomain )
leaveTypeDomain* 9
;9 :
public  
LeaveTypeApplication #
(# $
ILeaveTypeDomain$ 4
leaveTypeDomain5 D
)D E
{ 	
this 
. 
leaveTypeDomain  
=! "
leaveTypeDomain# 2
;2 3
} 	
public 
async 
Task 
< 
List 
< 
	LeaveType (
>( )
>) *!
GetAssignedLeaveTypes+ @
(@ A
intA D
employeeSlnoE Q
)Q R
{ 	
List 
< 
	LeaveType 
> 

leaveTypes &
=' (
await) .
leaveTypeDomain/ >
.> ?!
GetAssignedLeaveTypes? T
(T U
employeeSlnoU a
)a b
;b c
return 

leaveTypes 
; 
} 	
public 
async 
Task 
< 
List 
< 
	LeaveType (
>( )
>) *
GetLeaveTypes+ 8
(8 9
)9 :
{ 	
List 
< 
	LeaveType 
> 

leaveTypes &
=' (
await) .
leaveTypeDomain/ >
.> ?
GetLeaveTypes? L
(L M
)M N
;N O
return 

leaveTypes 
; 
} 	
} 
} ¯
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Interfaces\IAttendanceReportTypeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Masters %
.% &

Interfaces& 0
{ 
public 

	interface ,
 IAttendanceReportTypeApplication 5
{ 
Task		 
<		 
List		 
<		  
AttendanceReportType		 &
>		& '
>		' ($
GetAttendanceReportTypes		) A
(		A B
)		B C
;		C D
} 
} ¡

eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Interfaces\IBranchApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Masters %
.% &

Interfaces& 0
{ 
public 

	interface 
IBranchApplication '
{ 
Task		 
<		 
List		 
<		 
Branch		 
>		 
>		 
GetHRBranch		 &
(		& '
int		' *
employeeSlno		+ 7
)		7 8
;		8 9
Task

 
<

 
List

 
<

 
	BranchRMS

 
>

 
>

 
GetHRBranchRMS

 ,
(

, -
int

- 0
employeeSlno

1 =
)

= >
;

> ?
Task 
< 
List 
< 
Branch 
> 
>  
GetBranchesByOfcType /
(/ 0
int0 3
officeTypeSlno4 B
,B C
intD G
employeeSlnoH T
)T U
;U V
Task 
< 
List 
< 

OfficeType 
> 
> 
GetOfficeType ,
(, -
)- .
;. /
} 
} ‡
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Interfaces\ILeaveDayTypeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .

Interfaces. 8
{ 
public 

	interface $
ILeaveDayTypeApplication -
{		 
Task

 
<

 
List

 
<

 
LeaveDayType

 
>

 
>

  
GetLeaveDayTypes

! 1
(

1 2
)

2 3
;

3 4
} 
} €
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Interfaces\ILeaveStatusApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .

Interfaces. 8
{ 
public 

	interface #
ILeaveStatusApplication ,
{		 
Task

 
<

 
List

 
<

 
LeaveStatus

 
>

 
>

 
GetLeaveStatus

  .
(

. /
)

/ 0
;

0 1
} 
} ∆
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Masters\Interfaces\ILeaveTypeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
LeaveManagement -
.- .

Interfaces. 8
{ 
public 

	interface !
ILeaveTypeApplication *
{ 
Task		 
<		 
List		 
<		 
	LeaveType		 
>		 
>		 !
GetAssignedLeaveTypes		 3
(		3 4
int		4 7
employeeSlno		8 D
)		D E
;		E F
Task

 
<

 
List

 
<

 
	LeaveType

 
>

 
>

 
GetLeaveTypes

 +
(

+ ,
)

, -
;

- .
} 
} ù
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Notification\Implementations\NotificationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Notification *
.* +
Implementations+ :
{		 
public

 

class

 #
NotificationApplication

 (
:

) *$
INotificationApplication

+ C
{ 
private 
readonly 
INotificationDomain ,
NotificationDomain- ?
;? @
public #
NotificationApplication &
(& '
INotificationDomain' :
NotificationDomain; M
)M N
{ 	
this 
. 
NotificationDomain #
=$ %
NotificationDomain& 8
;8 9
} 	
public 
async 
Task 
< 
List 
< 
NotificationDetail 1
>1 2
>2 3
GetNotifications4 D
(D E
intE H
employeeSlnoI U
)U V
{ 	
List 
< 
NotificationDetail #
># $
NotificationDetails% 8
=9 :
await; @
NotificationDomainA S
.S T
GetNotificationsT d
(d e
employeeSlnoe q
)q r
;r s
return 
NotificationDetails &
;& '
} 	
} 
} à
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Notification\Implementations\VistorCountApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Notification *
.* +
Implementations+ :
{ 
public 

class "
VistorCountApplication '
:( )#
IVistorCountApplication* A
{ 
private		 
readonly		 
IVistorCountDomain		 +
notificationDomain		, >
;		> ?
public

 "
VistorCountApplication

 %
(

% &
IVistorCountDomain

& 8
notificationDomain

9 K
)

K L
{ 	
this 
. 
notificationDomain #
=$ %
notificationDomain& 8
;8 9
} 	
public 
async 
Task 
< 
int 
> 
GetVisitorCount .
(. /
)/ 0
{ 	
int 

usersCount 
= 
$num 
; 

usersCount 
= 
await 
notificationDomain 1
.1 2
GetVisitorCount2 A
(A B
)B C
;C D
return 

usersCount 
; 
} 	
} 
} ì
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Notification\Interfaces\INotificationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Notification *
.* +

Interfaces+ 5
{ 
public 

	interface $
INotificationApplication -
{		 
Task

 
<

 
List

 
<

 
NotificationDetail

 $
>

$ %
>

% &
GetNotifications

' 7
(

7 8
int

8 ;
employeeSlno

< H
)

H I
;

I J
} 
} ¶
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Notification\Interfaces\IVistorCountApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Notification *
.* +

Interfaces+ 5
{ 
public 

	interface #
IVistorCountApplication ,
{ 
Task 
< 
int 
> 
GetVisitorCount !
(! "
)" #
;# $
} 
}		 è
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\NSL\Implementations\NslEmployeeInformationApplication.cs
	namespace

 	
Phoenix


 
.

 
Application

 
.

 
NSL

 !
.

! "
Implementations

" 1
{ 
public 

class )
NslEmployeeProfileApplication .
:/ 0*
INslEmployeeProfileApplication1 O
{ 
private 
readonly %
INslEmployeeProfileDomain 2$
NslEmployeeProfileDomain3 K
;K L
public )
NslEmployeeProfileApplication ,
(, -%
INslEmployeeProfileDomain- F$
NslEmployeeProfileDomainG _
)_ `
{ 	
this 
. $
NslEmployeeProfileDomain )
=* +$
NslEmployeeProfileDomain, D
;D E
} 	
public 
async 
Task 
< 
PagedResultSet (
<( )
EmployeeProfileData) <
>< =
>= >"
GetAllEmployeeProfiles? U
(U V)
EmployeeProfileSearchCriteriaV s
searchCriteria	t Ç
)
Ç É
{ 	
PagedResultSet 
< 
EmployeeProfileData .
>. /
employeeProfiles0 @
=A B
awaitC H
thisI M
.M N$
NslEmployeeProfileDomainN f
.f g"
GetAllEmployeeProfilesg }
(} ~
searchCriteria	~ å
)
å ç
;
ç é
return 
employeeProfiles #
;# $
} 	
public 
async 
Task 
< 
EmployeeProfileData -
>- .
GetEmployeeProfile/ A
(A B
stringB H

employeeIdI S
)S T
{ 	
EmployeeProfileData 
employeeProfile  /
=0 1
await2 7
this8 <
.< =$
NslEmployeeProfileDomain= U
.U V
GetEmployeeProfileV h
(h i

employeeIdi s
)s t
;t u
return 
employeeProfile "
;" #
} 	
} 
}   à
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\NSL\Interfaces\INslEmployeeInformationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
NSL !
.! "

Interfaces" ,
{		 
public

 

	interface

 *
INslEmployeeProfileApplication

 3
{ 
Task 
< 
PagedResultSet 
< 
EmployeeProfileData /
>/ 0
>0 1"
GetAllEmployeeProfiles2 H
(H I)
EmployeeProfileSearchCriteriaI f
searchCriteriag u
)u v
;v w
Task 
< 
EmployeeProfileData  
>  !
GetEmployeeProfile" 4
(4 5
string5 ;

employeeId< F
)F G
;G H
} 
} ˇ
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Payslips\Implementations\PayslipsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Payslips &
.& '
Implementations' 6
{ 
public 

class 
PayslipsApplication $
:$ % 
IPayslipsApplication& :
{ 
private 
readonly 
IPayslipsDomain (
payslipsDomain) 7
;7 8
public 
PayslipsApplication "
(" #
IPayslipsDomain# 2
payslipsDomain3 A
)A B
{ 	
this 
. 
payslipsDomain 
=  !
payslipsDomain" 0
;0 1
} 	
public 
async 
Task 
< 
byte 
[ 
]  
>  !
DownloadPaySlip" 1
(1 2
int2 5
employeeSlno6 B
)B C
{ 	
byte 
[ 
] 
payslips 
= 
await #
payslipsDomain$ 2
.2 3
DownloadPaySlip3 B
(B C
employeeSlnoC O
)O P
;P Q
return 
payslips 
; 
} 	
public$$ 
async$$ 
Task$$ 
<$$ 
List$$ 
<$$ 
Payslip$$ &
>$$& '
>$$' (
GetEmployeePayslip$$) ;
($$; <
string$$< B
employeeSlno$$C O
)$$O P
{%% 	
List&& 
<&& 
Payslip&& 
>&& 
payslips&& "
=&&# $
await&&% *
payslipsDomain&&+ 9
.&&9 :
GetEmployeePayslip&&: L
(&&L M
employeeSlno&&M Y
)&&Y Z
;&&Z [
return'' 
payslips'' 
;'' 
}(( 	
})) 
}** “
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Payslips\Interfaces\IPayslipsApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Payslips &
.& '

Interfaces' 1
{ 
public 

	interface  
IPayslipsApplication )
{ 
Task		 
<		 
byte		 
[		 
]		 
>		 
DownloadPaySlip		 $
(		$ %
int		% (
employeeSlno		) 5
)		5 6
;		6 7
Task

 
<

 
List

 
<

 
Payslip

 
>

 
>

 
GetEmployeePayslip

 .
(

. /
string

/ 5
employeeSlno

6 B
)

B C
;

C D
} 
} ë
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Reimbursement\Implementations\ReimbursementApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Reimbursement +
.+ ,
Implementations, ;
{ 
public		 

class		 $
ReimbursementApplication		 )
:		* +%
IReimbursementApplication		, E
{

 
private 
readonly  
IReimbursementDomain -
reimbursementDomain. A
;A B
public $
ReimbursementApplication '
(' ( 
IReimbursementDomain( <
reimbursementDomain= P
)P Q
{ 	
this 
. 
reimbursementDomain $
=% &
reimbursementDomain' :
;: ;
} 	
public 
async 
Task 
< 
bool 
> #
DeleteReimbursementBill  7
(7 8
int8 ;
reimbursementId< K
)K L
{ 	
bool 
resp 
= 
await 
reimbursementDomain 1
.1 2#
DeleteReimbursementBill2 I
(I J
reimbursementIdJ Y
)Y Z
;Z [
return 
resp 
; 
} 	
public 
async 
Task 
< 
List 
< !
ApprovedReimbursement 4
>4 5
>5 6
GetApprovedBills7 G
(G H
intH K
employeeNumberL Z
)Z [
{ 	
List 
< !
ApprovedReimbursement &
>& '
approvedBills( 5
=6 7
await8 =
reimbursementDomain> Q
.Q R
GetApprovedBillsR b
(b c
employeeNumberc q
)q r
;r s
return 
approvedBills  
;  !
} 	
public 
async 
Task 
< 
List 
<  
PendingReimbursement 3
>3 4
>4 5
GetPendingBills6 E
(E F
intF I
employeeNumberJ X
)X Y
{ 	
List 
<  
PendingReimbursement %
>% &!
pendingReimbursements' <
== >
await? D
reimbursementDomainE X
.X Y
GetPendingBillsY h
(h i
employeeNumberi w
)w x
;x y
return   !
pendingReimbursements   (
;  ( )
}!! 	
public## 
async## 
Task## 
<## 
bool## 
>##  
UploadReimburesement##  4
(##4 5%
UploadReimbursmentDetails##5 N%
uploadReimbursmentDetails##O h
)##h i
{$$ 	
bool%% 
resp%% 
=%% 
await%% 
reimbursementDomain%% 1
.%%1 2
UploadReimburesment%%2 E
(%%E F%
uploadReimbursmentDetails%%F _
)%%_ `
;%%` a
return&& 
resp&& 
;&& 
}'' 	
}(( 
})) ∂

rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\Reimbursement\Interfaces\IReimbursementApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
Reimbursement +
.+ ,

Interfaces, 6
{ 
public 

	interface %
IReimbursementApplication .
{ 
Task		 
<		 
List		 
<		 !
ApprovedReimbursement		 '
>		' (
>		( )
GetApprovedBills		* :
(		: ;
int		; >
employeeNumber		? M
)		M N
;		N O
Task

 
<

 
List

 
<

  
PendingReimbursement

 &
>

& '
>

' (
GetPendingBills

) 8
(

8 9
int

9 <
employeeNumber

= K
)

K L
;

L M
Task 
< 
bool 
>  
UploadReimburesement '
(' (%
UploadReimbursmentDetails( A%
uploadReimbursmentDetailsB [
)[ \
;\ ]
Task 
< 
bool 
> #
DeleteReimbursementBill *
(* +
int+ .
reimbursementId/ >
)> ?
;? @
} 
} è
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\SendEmailNotification\Implementations\ResignedEmployeeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. !
SendEmailNotification 3
.3 4
Implementations4 C
{		 
public

 

class

 '
ResignedEmployeeApplication

 ,
:

, -(
IResignedEmployeeApplication

. J
{ 
private 
readonly #
IResignedEmployeeDomain 0"
resignedEmployeeDomain1 G
;G H
public '
ResignedEmployeeApplication *
(* +#
IResignedEmployeeDomain+ B"
resignedEmployeeDomainC Y
)Y Z
{ 	
this 
. "
resignedEmployeeDomain '
=( )"
resignedEmployeeDomain* @
;@ A
} 	
public 
async 
Task 
< 
List 
< 
ResignedEmployee /
>/ 0
>0 1 
GetResignedEmployees2 F
(F G
)G H
{ 	
Console 
. 
	WriteLine 
( 
$str 2
)2 3
;3 4
List 
< 
ResignedEmployee !
>! "
sendemailDetails# 3
=4 5
await6 ;"
resignedEmployeeDomain< R
.R S 
GetResignedEmployeesS g
(g h
)h i
;i j
return 
sendemailDetails #
;# $
} 	
} 
} ≠
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\SendEmailNotification\Implementations\SendEmailApplication.cs
	namespace		 	
Phoenix		
 
.		 
Application		 
.		 !
SendEmailNotification		 3
.		3 4
Implementations		4 C
{

 
public 

class  
SendEmailApplication %
:% &!
ISendEmailApplication' <
{ 
private 
readonly 
ISendEmailDomain )
sendemailDomain* 9
;9 :
public  
SendEmailApplication #
(# $
ISendEmailDomain$ 4
sendemailDomain5 D
)D E
{ 	
this 
. 
sendemailDomain  
=! "
sendemailDomain# 2
;2 3
} 	
public 
async 
Task 
< 
List 
< 
EmailDetails +
>+ ,
>, -
GetPendingEmails. >
(> ?
)? @
{ 	
List 
< 
EmailDetails 
> 
sendemailDetails /
=0 1
await2 7
sendemailDomain8 G
.G H
GetPendingEmailsH X
(X Y
)Y Z
;Z [
return 
sendemailDetails #
;# $
} 	
public 
async 
Task 
< 
List 
< 
EmailDetails +
>+ ,
>, -
GetPendingEmails2. ?
(? @
)@ A
{ 	
List 
< 
EmailDetails 
> 
sendemailDetails /
=0 1
await2 7
sendemailDomain8 G
.G H
GetPendingEmails2H Y
(Y Z
)Z [
;[ \
return 
sendemailDetails #
;# $
} 	
public 
async 
Task 
< 
List 
<  
EmailOtpVerification 3
>3 4
>4 5
GetPendingOTPEmails6 I
(I J
)J K
{ 	
List   
<    
EmailOtpVerification   %
>  % &
sendemailDetails  ' 7
=  8 9
await  : ?
sendemailDomain  @ O
.  O P
GetPendingOTPEmails  P c
(  c d
)  d e
;  e f
return!! 
sendemailDetails!! #
;!!# $
}"" 	
public$$ 
async$$ 
Task$$  
UpdateMailSentStatus$$ .
($$. /
List$$/ 3
<$$3 4
int$$4 7
>$$7 8
seletedLeaveIds$$9 H
)$$H I
{%% 	
await&& 
sendemailDomain&& !
.&&! " 
UpdateMailSentStatus&&" 6
(&&6 7
seletedLeaveIds&&7 F
)&&F G
;&&G H
}'' 	
public(( 
async(( 
Task(( !
UpdateSentMailStatus2(( /
(((/ 0
List((0 4
<((4 5
int((5 8
>((8 9
seletedLeaveIds((: I
)((I J
{)) 	
await** 
sendemailDomain** !
.**! "!
UpdateSentMailStatus2**" 7
(**7 8
seletedLeaveIds**8 G
)**G H
;**H I
}++ 	
public,, 
async,, 
Task,, #
UpdateOTPMailSentStatus,, 1
(,,1 2
List,,2 6
<,,6 7
int,,7 :
>,,: ;
seletedMailId,,< I
),,I J
{-- 	
await.. 
sendemailDomain.. !
...! "#
UpdateOTPMailSentStatus.." 9
(..9 :
seletedMailId..: G
)..G H
;..H I
}// 	
}22 
}33 Ñ
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\SendEmailNotification\Interfaces\IResignedEmployeeApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. !
SendEmailNotification 3
.3 4

Interfaces4 >
{ 
public 

	interface (
IResignedEmployeeApplication 1
{ 
Task		 
<		 
List		 
<		 
ResignedEmployee		 "
>		" #
>		# $ 
GetResignedEmployees		% 9
(		9 :
)		: ;
;		; <
} 
} √
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\SendEmailNotification\Interfaces\ISendEmailApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. !
SendEmailNotification 3
.3 4

Interfaces4 >
{ 
public		 

	interface		 !
ISendEmailApplication		 *
{

 
Task 
< 
List 
< 
EmailDetails 
> 
>  
GetPendingEmails! 1
(1 2
)2 3
;3 4
Task 
< 
List 
< 
EmailDetails 
> 
>  
GetPendingEmails2! 2
(2 3
)3 4
;4 5
Task 
< 
List 
<  
EmailOtpVerification &
>& '
>' (
GetPendingOTPEmails) <
(< =
)= >
;> ?
Task  
UpdateMailSentStatus !
(! "
List" &
<& '
int' *
>* +
seletedLeaveIds, ;
); <
;< =
Task !
UpdateSentMailStatus2 "
(" #
List# '
<' (
int( +
>+ ,
seletedLeaveIds- <
)< =
;= >
Task #
UpdateOTPMailSentStatus $
($ %
List% )
<) *
int* -
>- .
seletedMailId/ <
)< =
;= >
} 
} Ò
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\SiteNotification\Implementations\SiteNotificationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
SiteNotification .
.. /
Implementations/ >
{ 
public		 

class		 '
SiteNotificationApplication		 ,
:		, -(
ISiteNotificationApplication		- I
{

 
private 
readonly #
ISiteNotificationDomain 0"
SiteNotificationDomain1 G
;G H
public '
SiteNotificationApplication *
(* +#
ISiteNotificationDomain+ B"
SiteNotificationDomainC Y
)Y Z
{ 	
this 
. "
SiteNotificationDomain '
=( )"
SiteNotificationDomain* @
;@ A
} 	
public 
async 
Task 
< #
SiteNotificationDetails 1
>1 2 
GetSiteNotifications3 G
(G H
intH K
officeTypeslnoL Z
)Z [
{ 	#
SiteNotificationDetails ##
SiteNotificationDetails$ ;
=< =
await> C"
SiteNotificationDomainD Z
.Z [ 
GetSiteNotifications[ o
(o p
officeTypeslnop ~
)~ 
;	 Ä
return #
SiteNotificationDetails *
;* +
} 	
public 
async 
Task 
< 
EmpLeaveResponse *
>* + 
SaveEmployeeFeedback, @
(@ A#
EmployeeFeedbackDetailsA X
empFeedbackRequestY k
)k l
{ 	
EmpLeaveResponse  
SaveEmployeeFeedback 1
=2 3
await4 9"
SiteNotificationDomain: P
.P Q 
SaveEmployeeFeedbackQ e
(e f
empFeedbackRequestf x
)x y
;y z
return  
SaveEmployeeFeedback '
;' (
} 	
} 
} ‡
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\SiteNotification\Interfaces\ISiteNotificationApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
SiteNotification .
.. /

Interfaces/ 9
{ 
public 

	interface (
ISiteNotificationApplication 1
{ 
Task		 
<		 #
SiteNotificationDetails		 $
>		$ % 
GetSiteNotifications		& :
(		: ;
int		; >
officeTypeslno		? M
)		M N
;		N O
Task 
< 
EmpLeaveResponse 
>  
SaveEmployeeFeedback 3
(3 4#
EmployeeFeedbackDetails4 K
empFeedbackRequestL ^
)^ _
;_ `
} 
} Ù

hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\States\Implementations\StatesApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
States $
.$ %
Implementations% 4
{		 
public

 

class

 
StatesApplication

 "
:

" #
IStatesApplication

$ 6
{ 
private 
readonly 
IStatesDomain &
statesDomain' 3
;3 4
public 
StatesApplication  
(  !
IStatesDomain! .
statesDomain/ ;
); <
{ 	
this 
. 
statesDomain 
= 
statesDomain  ,
;, -
} 	
public 
async 
Task 
< 
List 
< 
StatesDetails ,
>, -
>- .
GetStatesDetails/ ?
(? @
)@ A
{ 	
List 
< 
StatesDetails 
> 
statesDetails  -
=. /
await0 5
statesDomain6 B
.B C
GetStatesDetailsC S
(S T
)T U
;U V
return 
statesDetails  
;  !
} 	
} 
} À
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\States\Interfaces\IStatesApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
States $
.$ %

Interfaces% /
{ 
public 

	interface 
IStatesApplication '
{		 
Task

 
<

 
List

 
<

 
StatesDetails

 
>

  
>

  !
GetStatesDetails

" 2
(

2 3
)

3 4
;

4 5
} 
} ê
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\TimeSheet\Implementations\TimeSheetApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
	TimeSheet '
.' (
Implementations( 7
{		 
public

 

class

  
TimeSheetApplication

 %
:

& '!
ITimeSheetApplication

( =
{ 
private 
readonly 
ITimeSheetDomain )
timeSheetDomain* 9
;9 :
public  
TimeSheetApplication #
(# $
ITimeSheetDomain$ 4
timeSheetDomain5 D
)D E
{F G
this 
. 
timeSheetDomain  
=! "
timeSheetDomain# 2
;2 3
} 	
public 
async 
Task 
< 
List 
< #
TimeSheetProjectDetails 6
>6 7
>7 8%
GetEmployeeProjectDetails9 R
(R S
intS V
empSLNoW ^
)^ _
{ 	
List 
< #
TimeSheetProjectDetails (
>( )#
timeSheetProjectDetails* A
=B C
awaitD I
timeSheetDomainJ Y
.Y Z%
GetEmployeeProjectDetailsZ s
(s t
empSLNot {
){ |
;| }
return #
timeSheetProjectDetails *
;* +
} 	
} 
} ê
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\2-Application\TimeSheet\Interfaces\ITimeSheetApplication.cs
	namespace 	
Phoenix
 
. 
Application 
. 
	TimeSheet '
.' (

Interfaces( 2
{ 
public 

	interface !
ITimeSheetApplication *
{		 
Task

 
<

 
List

 
<

 #
TimeSheetProjectDetails

 )
>

) *
>

* +%
GetEmployeeProjectDetails

, E
(

E F
int

F I
empSLNo

J Q
)

Q R
;

R S
} 
} 