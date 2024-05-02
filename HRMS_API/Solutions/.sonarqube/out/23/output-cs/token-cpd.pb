Õ1
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Implementations\LeaveInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (
Implementations( 7
{ 
public 

class "
LeaveInformationDomain '
:( )

BaseDomain* 4
,4 5#
ILeaveInformationDomain5 L
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public "
LeaveInformationDomain %
(% &
IConfiguration& 4
configuration5 B
,B C
IDistributedCacheD U

redisCacheV `
)` a
:b c
based h
(h i
configurationi v
,v w

redisCache	x Ç
)
Ç É
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
async 
Task 
< 
List 
< 
LeaveInformation /
>/ 0
>0 1
GetLeaveInformation2 E
(E F
)F G
{ 	
List 
< 
LeaveInformation !
>! "
empLeaveStatusList# 5
=6 7
null8 <
;< =
using 
( &
LeaveInformationRepository -&
leaveInformationRepository. H
=I J
newK N
(N O
configurationO \
,\ ]

redisCache^ h
)h i
)i j
{ 
empLeaveStatusList "
=# $
await% *&
leaveInformationRepository+ E
.E F
GetLeaveInformationF Y
(Y Z
)Z [
;[ \
} 
return   
empLeaveStatusList   %
;  % &
}!! 	
public## 
async## 
Task## 
<## 
bool## 
>##  "
UpdateLeaveInformation##! 7
(##7 8#
LeaveInformationSaveReq##8 O
leaveInformation##P `
)##` a
{$$ 	
bool%% "
isLeavePolicyInfoSaved%% '
=%%( )
false%%* /
;%%/ 0
using&& 
(&& &
LeaveInformationRepository&& -&
leaveInformationRepository&&. H
=&&I J
new&&K N
(&&N O
configuration&&O \
,&&\ ]

redisCache&&^ h
)&&h i
)&&i j
{'' "
isLeavePolicyInfoSaved(( &
=((' (
await(() .&
leaveInformationRepository((/ I
.((I J"
UpdateLeaveInformation((J `
(((` a
leaveInformation((a q
)((q r
;((r s
})) 
return** "
isLeavePolicyInfoSaved** )
;**) *
}++ 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, !
SavedLeaveInformation,,  5
(,,5 6#
LeaveInformationSaveReq,,6 M
leaveInformation,,N ^
),,^ _
{-- 	
bool.. "
isLeavePolicyInfoSaved.. '
=..( )
false..* /
;../ 0
using// 
(// &
LeaveInformationRepository// -&
leaveInformationRepository//. H
=//I J
new//K N
(//N O
configuration//O \
,//\ ]

redisCache//^ h
)//h i
)//i j
{00 "
isLeavePolicyInfoSaved11 &
=11' (
await11) .&
leaveInformationRepository11/ I
.11I J!
SavedLeaveInformation11J _
(11_ `
leaveInformation11` p
)11p q
;11q r
}22 
return33 "
isLeavePolicyInfoSaved33 )
;33) *
}44 	
public55 
async55 
Task55 
<55 
bool55 
>55 "
DeleteLeaveInformation55  6
(556 7
int557 :
leaveInformationId55; M
)55M N
{66 	
bool77 "
isLeavePolicyInfoSaved77 '
=77( )
false77* /
;77/ 0
using88 
(88 &
LeaveInformationRepository88 -&
leaveInformationRepository88. H
=88I J
new88K N
(88N O
configuration88O \
,88\ ]

redisCache88^ h
)88h i
)88i j
{99 "
isLeavePolicyInfoSaved:: &
=::' (
await::) .&
leaveInformationRepository::/ I
.::I J"
DeleteLeaveInformation::J `
(::` a
leaveInformationId::a s
)::s t
;::t u
};; 
return<< "
isLeavePolicyInfoSaved<< )
;<<) *
}== 	
public>> 
async>> 
Task>> 
<>> 
List>> 
<>>  
LeaveTypeInformation>> 3
>>>3 4
>>>4 5$
GetLeaveInformationByOfc>>6 N
(>>N O
int>>O R
officeTypeSlno>>S a
,>>a b
int>>c f
?>>f g

branchSlno>>h r
)>>r s
{?? 	
List@@ 
<@@  
LeaveTypeInformation@@ %
>@@% & 
leaveTypeInformation@@' ;
=@@< =
null@@> B
;@@B C
usingAA 
(AA &
LeaveInformationRepositoryAA -&
leaveInformationRepositoryAA. H
=AAI J
newAAK N
(AAN O
configurationAAO \
,AA\ ]

redisCacheAA^ h
)AAh i
)AAi j
{BB  
leaveTypeInformationCC $
=CC% &
awaitCC' ,&
leaveInformationRepositoryCC- G
.CCG H$
GetLeaveInformationByOfcCCH `
(CC` a
officeTypeSlnoCCa o
,CCo p

branchSlnoCCp z
)CCz {
;CC{ |
}DD 
returnEE  
leaveTypeInformationEE '
;EE' (
}FF 	
}GG 
}HH Ø(
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Implementations\LeavePolicyInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (
Implementations( 7
{ 
public 

class (
LeavePolicyInformationDomain -
:- .)
ILeavePolicyInformationDomain0 M
{ 
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
LeavePolicyInformationDomain +
(+ ,
IConfiguration, :
configuration; H
,H I
IDistributedCacheJ [

redisCache\ f
)f g
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
async 
Task 
< 
List 
< "
LeavePolicyInformation 5
>5 6
>6 7%
GetLeavePolicyInformation8 Q
(Q R
)R S
{ 	
List 
< "
LeavePolicyInformation '
>' (
empLeavePolicyList) ;
=< =
null> B
;B C
using 
( .
"LeavePolicyInformationRepositorycs 5&
leaveInformationRepository6 P
=Q R
newS V
(V W
configurationW d
,d e

redisCachef p
)p q
)q r
{ 
empLeavePolicyList "
=# $
await% *&
leaveInformationRepository+ E
.E F%
GetLeavePolicyInformationF _
(_ `
)` a
;a b
} 
return 
empLeavePolicyList %
;% &
}   	
public## 
async## 
Task## 
<## 
bool## 
>## &
SaveLeavePolicyInformation##  :
(##: ;"
LeavePolicyInformation##; Q"
leavePolicyInformation##R h
)##h i
{$$ 	
bool%% "
isLeavePolicyInfoSaved%% '
=%%( )
false%%* /
;%%/ 0
using&& 
(&& .
"LeavePolicyInformationRepositorycs&& 5,
 leavePolicyInformationRepository&&6 V
=&&W X
new&&Y \
(&&\ ]
configuration&&] j
,&&j k

redisCache&&l v
)&&v w
)&&w x
{'' "
isLeavePolicyInfoSaved(( &
=((' (
await(() .,
 leavePolicyInformationRepository((/ O
.((O P&
SaveLeavePolicyInformation((P j
(((j k#
leavePolicyInformation	((k Å
)
((Å Ç
;
((Ç É
})) 
return** "
isLeavePolicyInfoSaved** )
;**) *
}++ 	
public-- 
async-- 
Task-- 
<-- 
bool-- 
>-- (
UpdateLeavePolicyInformation--  <
(--< =%
LeavePolicyInformationReq--= V"
leavePolicyInformation--W m
)--m n
{.. 	
bool// "
isLeavePolicyInfoSaved// '
=//( )
false//* /
;/// 0
using00 
(00 .
"LeavePolicyInformationRepositorycs00 5,
 leavePolicyInformationRepository006 V
=00W X
new00Y \
(00\ ]
configuration00] j
,00j k

redisCache00l v
)00v w
)00w x
{11 "
isLeavePolicyInfoSaved22 &
=22' (
await22) .,
 leavePolicyInformationRepository22/ O
.22O P(
UpdateLeavePolicyInformation22P l
(22l m#
leavePolicyInformation	22m É
)
22É Ñ
;
22Ñ Ö
}33 
return44 "
isLeavePolicyInfoSaved44 )
;44) *
}55 	
public66 
async66 
Task66 
<66 
bool66 
>66 (
DeleteLeavePolicyInformation66  <
(66< =
int66= @
policyID66A I
)66I J
{77 	
bool88 "
isLeavePolicyInfoSaved88 '
=88( )
false88* /
;88/ 0
using99 
(99 .
"LeavePolicyInformationRepositorycs99 5,
 leavePolicyInformationRepository996 V
=99W X
new99Y \
(99\ ]
configuration99] j
,99j k

redisCache99l v
)99v w
)99w x
{:: "
isLeavePolicyInfoSaved;; &
=;;' (
await;;) .,
 leavePolicyInformationRepository;;/ O
.;;O P(
DeleteLeavePolicyInformation;;P l
(;;l m
policyID;;m u
);;u v
;;;v w
}<< 
return== "
isLeavePolicyInfoSaved== )
;==) *
}>> 	
}AA 
}BB ª
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Implementations\ModuleInformationDomain.cs
	namespace 	
MyStore
 
. 
Domain 
. 
Domains  
.  !
Administration! /
./ 0
Implementations0 ?
{ 
public 

sealed 
class #
ModuleInformationDomain /
:0 1

BaseDomain2 <
,< =$
IModuleInformationDomain> V
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public #
ModuleInformationDomain &
(& '
IConfiguration' 5
configuration6 C
,C D
IDistributedCacheE V

redisCacheW a
)a b
:c d
basee i
(i j
configurationj w
,w x

redisCache	y É
)
É Ñ
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
async 
Task 
< 
List 
< 
SecurityModule -
>- .
>. /(
LoadActiveModuleInformations0 L
(L M
)M N
{ 	
List 
< 
SecurityModule 
>  
moduleInformations! 3
=4 5
null6 :
;: ;
using 
( '
ModuleInformationRepository .'
moduleInformationRepository/ J
=K L
newM P'
ModuleInformationRepositoryQ l
(l m
thism q
.q r
configurationr 
,	 Ä
this
Å Ö
.
Ö Ü

redisCache
Ü ê
)
ê ë
)
ë í
{ 
moduleInformations "
=# $
await% *'
moduleInformationRepository+ F
.F G(
LoadActiveModuleInformationsG c
(c d
)d e
;e f
}   
return"" 
moduleInformations"" %
;""% &
}## 	
}$$ 
}%% ¿D
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Implementations\RoleInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (
Implementations( 7
{ 
public 

class !
RoleInformationDomain &
:' (

BaseDomain) 3
,3 4"
IRoleInformationDomain5 K
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public !
RoleInformationDomain $
($ %
IConfiguration% 3
configuration4 A
,A B
IDistributedCacheC T

redisCacheU _
)` a
:b c
based h
(h i
configurationi v
,v w

redisCache	x Ç
)
Ç É
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
async 
Task 
< 
bool 
> 
ActivateRole  ,
(, -
long- 1
roleSlno2 :
): ;
{ 	
bool 
isRoleActivated  
=! "
false# (
;( )
using 
( %
RoleInformationRepository ,%
roleInformationRepository- F
=G H
newI L
(L M
configurationM Z
,Z [

redisCache\ f
)f g
)g h
{ 
isRoleActivated   
=    !
await  " '%
roleInformationRepository  ( A
.  A B
ActivateRole  B N
(  N O
roleSlno  O W
)  W X
;  X Y
}!! 
return"" 
isRoleActivated"" "
;""" #
}## 	
public%% 
async%% 
Task%% 
<%% 
bool%% 
>%% 
DeActivateRole%%  .
(%%. /
long%%/ 3
roleSlno%%4 <
)%%< =
{&& 	
bool'' 
isRoleDeActivated'' "
=''# $
false''% *
;''* +
using(( 
((( %
RoleInformationRepository(( ,%
roleInformationRepository((- F
=((G H
new((I L
(((L M
configuration((M Z
,((Z [

redisCache((\ f
)((f g
)((g h
{)) 
isRoleDeActivated** !
=**" #
await**$ )%
roleInformationRepository*** C
.**C D
DeActivateRole**D R
(**R S
roleSlno**S [
)**[ \
;**\ ]
}++ 
return,, 
isRoleDeActivated,, $
;,,$ %
}-- 	
public// 
async// 
Task// 
<// 
List// 
<// 
RoleInformation// .
>//. /
>/// 0
GetAllActiveRoles//1 B
(//B C
)//C D
{00 	
List11 
<11 
RoleInformation11  
>11  !
roleInformations11" 2
=113 4
null115 9
;119 :
using22 
(22 %
RoleInformationRepository22 ,%
roleInformationRepository22- F
=22G H
new22I L
(22L M
configuration22M Z
,22Z [

redisCache22\ f
)22f g
)22g h
{33 
roleInformations44  
=44! "
await44# (%
roleInformationRepository44) B
.44B C
GetAllActiveRoles44C T
(44T U
)44U V
;44V W
}55 
return66 
roleInformations66 #
;66# $
}77 	
public99 
async99 
Task99 
<99 
RoleInformation99 )
>99) *
GetRoleInformation99+ =
(99= >
long99> B
roleSlno99C K
)99K L
{:: 	
RoleInformation;; 
roleInformation;; +
=;;, -
null;;. 2
;;;2 3
using<< 
(<< %
RoleInformationRepository<< ,%
roleInformationRepository<<- F
=<<G H
new<<I L
(<<L M
configuration<<M Z
,<<Z [

redisCache<<\ f
)<<f g
)<<g h
{== 
roleInformation>> 
=>>  !
await>>" '%
roleInformationRepository>>( A
.>>A B
GetRoleInformation>>B T
(>>T U
roleSlno>>U ]
)>>] ^
;>>^ _
}?? 
return@@ 
roleInformation@@ "
;@@" #
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
ListCC 
<CC 
RoleInformationCC .
>CC. /
>CC/ 0
GetUserRolesCC1 =
(CC= >
longCC> B
employeeSlnoCCC O
)CCO P
{DD 	
ListEE 
<EE 
RoleInformationEE  
>EE  !
roleInformationsEE" 2
=EE3 4
nullEE5 9
;EE9 :
usingFF 
(FF %
RoleInformationRepositoryFF ,%
roleInformationRepositoryFF- F
=FFG H
newFFI L
(FFL M
configurationFFM Z
,FFZ [

redisCacheFF\ f
)FFf g
)FFg h
{GG 
roleInformationsHH  
=HH! "
awaitHH# (%
roleInformationRepositoryHH) B
.HHB C
GetUserRolesHHC O
(HHO P
employeeSlnoHHP \
)HH\ ]
;HH] ^
}II 
returnJJ 
roleInformationsJJ #
;JJ# $
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
boolMM 
>MM 
MapRolesToUserMM  .
(MM. /
)MM/ 0
{NN 	
boolOO 
isRolesMappedOO 
=OO  
falseOO! &
;OO& '
usingPP 
(PP %
RoleInformationRepositoryPP ,%
roleInformationRepositoryPP- F
=PPG H
newPPI L
(PPL M
configurationPPM Z
,PPZ [

redisCachePP\ f
)PPf g
)PPg h
{QQ 
isRolesMappedRR 
=RR 
awaitRR  %%
roleInformationRepositoryRR& ?
.RR? @
MapRolesToUserRR@ N
(RRN O
)RRO P
;RRP Q
}SS 
returnTT 
isRolesMappedTT  
;TT  !
}UU 	
publicWW 
asyncWW 
TaskWW 
<WW 
boolWW 
>WW 
SaveRoleInformationWW  3
(WW3 4
RoleInformationWW4 C
roleInformationWWD S
)WWS T
{XX 	
boolYY 
isRoleSavedYY 
=YY 
falseYY $
;YY$ %
usingZZ 
(ZZ %
RoleInformationRepositoryZZ ,%
roleInformationRepositoryZZ- F
=ZZG H
newZZI L
(ZZL M
configurationZZM Z
,ZZZ [

redisCacheZZ\ f
)ZZf g
)ZZg h
{[[ 
isRoleSaved\\ 
=\\ 
await\\ #%
roleInformationRepository\\$ =
.\\= >
SaveRoleInformation\\> Q
(\\Q R
roleInformation\\R a
)\\a b
;\\b c
}]] 
return^^ 
isRoleSaved^^ 
;^^ 
}__ 	
publicaa 
asyncaa 
Taskaa 
<aa 
Listaa 
<aa 
RoleInformationaa .
>aa. /
>aa/ 0
SearchRolesaa1 <
(aa< =)
RoleInformationSearchCriteriaaa= Z
searchCriteriaaa[ i
)aai j
{bb 	
Listcc 
<cc 
RoleInformationcc  
>cc  !
roleInformationscc" 2
=cc3 4
nullcc5 9
;cc9 :
usingdd 
(dd %
RoleInformationRepositorydd ,%
roleInformationRepositorydd- F
=ddG H
newddI L
(ddL M
configurationddM Z
,ddZ [

redisCachedd\ f
)ddf g
)ddg h
{ee 
roleInformationsff  
=ff! "
awaitff# (%
roleInformationRepositoryff) B
.ffB C
SearchRolesffC N
(ffN O
searchCriteriaffO ]
)ff] ^
;ff^ _
}gg 
returnhh 
roleInformationshh #
;hh# $
}ii 	
}jj 
}kk â 
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Implementations\SecurityModuleDomain.cs
	namespace 	
MyStore
 
. 
Domain 
. 
Domains  
.  !
Administration! /
./ 0
Implementations0 ?
{ 
public 

sealed 
class  
SecurityModuleDomain ,
:- .

BaseDomain/ 9
,9 :!
ISecurityModuleDomain; P
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public  
SecurityModuleDomain #
(# $
IConfiguration$ 2
configuration3 @
,@ A
IDistributedCacheB S

redisCacheT ^
)^ _
:` a
baseb f
(f g
configurationg t
,t u

redisCache	v Ä
)
Ä Å
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
async 
Task 
< 
List 
< 
SecurityModule -
>- .
>. /!
LoadMappedPermissions0 E
(E F
intF I
roleIdJ P
)P Q
{ 	
List 
< 
SecurityModule 
>  
securityModules! 0
=1 2
null3 7
;7 8
using 
( $
SecurityModuleRepository +$
securityModuleRepository, D
=E F
newG J$
SecurityModuleRepositoryK c
(c d
thisd h
.h i
configurationi v
,v w
thisx |
.| }

redisCache	} á
)
á à
)
à â
{ 
securityModules   
=    !
await  " '$
securityModuleRepository  ( @
.  @ A!
LoadMappedPermissions  A V
(  V W
roleId  W ]
)  ] ^
;  ^ _
}!! 
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
;''7 8
return,, 
securityModules,, "
;,," #
}-- 	
public// 
async// 
Task// 
<// 
bool// 
>// 
SavePermissions//  /
(/// 0
List//0 4
<//4 5
SecurityModule//5 C
>//C D
permissions//E P
,//P Q
int//R U
roleId//V \
)//\ ]
{00 	
bool11 
isSaved11 
=11 
false11  
;11  !
using22 
(22 $
SecurityModuleRepository22 +$
securityModuleRepository22, D
=22E F
new22G J$
SecurityModuleRepository22K c
(22c d
this22d h
.22h i
configuration22i v
,22v w
this22x |
.22| }

redisCache	22} á
)
22á à
)
22à â
{33 
isSaved44 
=44 
await44 $
securityModuleRepository44  8
.448 9
SavePermissions449 H
(44H I
permissions44I T
,44T U
roleId44V \
)44\ ]
;44] ^
}55 
return66 
isSaved66 
;66 
}77 	
}88 
}99 ´V
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Implementations\UserInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (
Implementations( 7
{ 
public 

class !
UserInformationDomain &
:' (

BaseDomain) 3
,3 4"
IUserInformationDomain5 K
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ICryptography &
cryptography' 3
;3 4
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
private 
readonly 
IJwtAuthManager (
jwtAuthManager) 7
;7 8
public !
UserInformationDomain $
($ %
IConfiguration% 3
configuration4 A
,A B
ICryptographyC P
cryptographyQ ]
,] ^
IDistributedCache_ p

redisCacheq {
,{ |
IJwtAuthManager	} å
jwtAuthManager
ç õ
)
õ ú
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
cryptography 
= 
cryptography  ,
;, -
this 
. 

redisCache 
= 

redisCache (
;( )
this 
. 
jwtAuthManager 
=  !
jwtAuthManager" 0
;0 1
}   	
public"" 
async"" 
Task"" 
<"" 
bool"" 
>"" 
ActivateUser""  ,
("", -
long""- 1
employeeSlno""2 >
)""> ?
{## 	
bool$$ 
isUserActivated$$  
=$$! "
false$$# (
;$$( )
using%% 
(%% %
UserInformationRepository%% ,
dashboardRepository%%- @
=%%A B
new%%C F
(%%F G
configuration%%G T
,%%T U
cryptography%%V b
,%%b c

redisCache%%d n
,%%n o
jwtAuthManager%%p ~
)%%~ 
)	%% Ä
{&& 
isUserActivated'' 
=''  !
await''" '
dashboardRepository''( ;
.''; <
ActivateUser''< H
(''H I
employeeSlno''I U
)''U V
;''V W
}(( 
return)) 
isUserActivated)) "
;))" #
}** 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, 
ChangePassword,,  .
(,,. /
UserInformation,,/ >
userInformation,,? N
),,N O
{-- 	
bool.. 
isPasswordChanged.. "
=..# $
false..% *
;..* +
using// 
(// %
UserInformationRepository// ,
dashboardRepository//- @
=//A B
new//C F
(//F G
configuration//G T
,//T U
cryptography//V b
,//b c

redisCache//d n
,//n o
jwtAuthManager//p ~
)//~ 
)	// Ä
{00 
isPasswordChanged11 !
=11" #
await11$ )
dashboardRepository11* =
.11= >
ChangePassword11> L
(11L M
userInformation11M \
)11\ ]
;11] ^
}22 
return33 
isPasswordChanged33 $
;33$ %
}44 	
public66 
async66 
Task66 
<66 
bool66 
>66 
DeActivateUser66  .
(66. /
long66/ 3
employeeSlno664 @
)66@ A
{77 	
bool88 
isUserDeActivated88 "
=88# $
false88% *
;88* +
using99 
(99 %
UserInformationRepository99 ,
dashboardRepository99- @
=99A B
new99C F
(99F G
configuration99G T
,99T U
cryptography99V b
,99b c

redisCache99d n
,99n o
jwtAuthManager99p ~
)99~ 
)	99 Ä
{:: 
isUserDeActivated;; !
=;;" #
await;;$ )
dashboardRepository;;* =
.;;= >
DeActivateUser;;> L
(;;L M
employeeSlno;;M Y
);;Y Z
;;;Z [
}<< 
return== 
isUserDeActivated== $
;==$ %
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
List@@ 
<@@ 
RoleInformation@@ .
>@@. /
>@@/ 0
GetMappedRoles@@1 ?
(@@? @
int@@@ C
employeeSlno@@D P
)@@P Q
{AA 	
ListBB 
<BB 
RoleInformationBB  
>BB  !
mappedRolesBB" -
=BB. /
nullBB0 4
;BB4 5
usingCC 
(CC %
UserInformationRepositoryCC ,
dashboardRepositoryCC- @
=CCA B
newCCC F
(CCF G
configurationCCG T
,CCT U
cryptographyCCV b
,CCb c

redisCacheCCd n
,CCn o
jwtAuthManagerCCp ~
)CC~ 
)	CC Ä
{DD 
mappedRolesEE 
=EE 
awaitEE #
dashboardRepositoryEE$ 7
.EE7 8
GetMappedRolesEE8 F
(EEF G
employeeSlnoEEG S
)EES T
;EET U
}FF 
returnGG 
mappedRolesGG 
;GG 
}HH 	
publicII 
asyncII 
TaskII 
<II 
ListII 
<II 
BranchInformationII 0
>II0 1
>II1 2#
GetUserBranchesFromNerpII3 J
(IIJ K
intIIK N
userSlnoIIO W
)IIW X
{JJ 	
ListKK 
<KK 
BranchInformationKK "
>KK" #
mappedRolesKK$ /
=KK0 1
nullKK2 6
;KK6 7
usingLL 
(LL %
UserInformationRepositoryLL ,
dashboardRepositoryLL- @
=LLA B
newLLC F
(LLF G
configurationLLG T
,LLT U
cryptographyLLV b
,LLb c

redisCacheLLd n
,LLn o
jwtAuthManagerLLp ~
)LL~ 
)	LL Ä
{MM 
mappedRolesNN 
=NN 
awaitNN #
dashboardRepositoryNN$ 7
.NN7 8#
GetUserBranchesFromNerpNN8 O
(NNO P
userSlnoNNP X
)NNX Y
;NNY Z
}OO 
returnPP 
mappedRolesPP 
;PP 
}QQ 	
publicTT 
asyncTT 
TaskTT 
<TT 
OtpDataTT !
>TT! "
GetOtpTT# )
(TT) *
stringTT* 0
userNameTT1 9
,TT9 :
boolTT: >
isSignUpTT? G
)TTG H
{UU 	
OtpDataVV 
isOtpGeneratedVV "
=VV# $
nullVV% )
;VV) *
usingWW 
(WW %
UserInformationRepositoryWW ,
dashboardRepositoryWW- @
=WWA B
newWWC F
(WWF G
configurationWWG T
,WWT U
cryptographyWWV b
,WWb c

redisCacheWWd n
,WWn o
jwtAuthManagerWWp ~
)WW~ 
)	WW Ä
{XX 
isOtpGeneratedYY 
=YY  
awaitYY! &
dashboardRepositoryYY' :
.YY: ;
GetOtpYY; A
(YYA B
userNameYYB J
,YYJ K
isSignUpYYK S
)YYS T
;YYT U
}ZZ 
return[[ 
isOtpGenerated[[ !
;[[! "
}\\ 	
public^^ 
async^^ 
Task^^ 
<^^ 
bool^^ 
>^^ 
SaveOrUpdateUser^^  0
(^^0 1
UserInformation^^1 @
userInformation^^A P
)^^P Q
{__ 	
bool`` 
isUserSaved`` 
=`` 
false`` $
;``$ %
usingaa 
(aa %
UserInformationRepositoryaa ,
dashboardRepositoryaa- @
=aaA B
newaaC F
(aaF G
configurationaaG T
,aaT U
cryptographyaaV b
,aab c

redisCacheaad n
,aan o
jwtAuthManageraap ~
)aa~ 
)	aa Ä
{bb 
isUserSavedcc 
=cc 
awaitcc #
dashboardRepositorycc$ 7
.cc7 8
SaveOrUpdateUsercc8 H
(ccH I
userInformationccI X
)ccX Y
;ccY Z
}dd 
returnee 
isUserSavedee 
;ee 
}ff 	
publichh 
asynchh 
Taskhh 
<hh 
OtpDatahh !
>hh! "
SignUphh# )
(hh) *
stringhh* 0
userNamehh1 9
)hh9 :
{ii 	
OtpDatajj 
isOtpGeneratedjj "
=jj# $
nulljj% )
;jj) *
usingkk 
(kk %
UserInformationRepositorykk ,
dashboardRepositorykk- @
=kkA B
newkkC F
(kkF G
configurationkkG T
,kkT U
cryptographykkV b
,kkb c

redisCachekkd n
,kkn o
jwtAuthManagerkkp ~
)kk~ 
)	kk Ä
{ll 
isOtpGeneratedmm 
=mm  
awaitmm! &
dashboardRepositorymm' :
.mm: ;
SignUpmm; A
(mmA B
userNamemmB J
)mmJ K
;mmK L
}nn 
returnoo 
isOtpGeneratedoo !
;oo! "
}pp 	
publicrr 
asyncrr 
Taskrr 
<rr 
boolrr 
>rr 
ValidateOtprr  +
(rr+ ,
stringrr, 2
userNamerr3 ;
,rr; <
stringrr= C
otpValuerrD L
)rrL M
{ss 	
booltt 
isOtpGeneratedtt 
=tt  !
falsett" '
;tt' (
usinguu 
(uu %
UserInformationRepositoryuu ,
dashboardRepositoryuu- @
=uuA B
newuuC F
(uuF G
configurationuuG T
,uuT U
cryptographyuuV b
,uub c

redisCacheuud n
,uun o
jwtAuthManageruup ~
)uu~ 
)	uu Ä
{vv 
isOtpGeneratedww 
=ww  
awaitww! &
dashboardRepositoryww' :
.ww: ;
ValidateOtpww; F
(wwF G
userNamewwG O
,wwO P
otpValuewwQ Y
)wwY Z
;wwZ [
}xx 
returnyy 
isOtpGeneratedyy !
;yy! "
}zz 	
}{{ 
}|| ô
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Interfaces\ILeaveInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (

Interfaces( 2
{ 
public		 

	interface		 #
ILeaveInformationDomain		 ,
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
Task	 
< 
bool 
> !
SavedLeaveInformation )
() *#
LeaveInformationSaveReq* A
leaveInformationB R
)R S
;S T
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
} 
} ¸	
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Interfaces\ILeavePolicyInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (

Interfaces( 2
{ 
public 

	interface )
ILeavePolicyInformationDomain 2
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
} í
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Interfaces\IModuleInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (

Interfaces( 2
{ 
public 

	interface $
IModuleInformationDomain -
:. /
IBaseDomain0 ;
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
} ˘
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Interfaces\IRoleInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (

Interfaces( 2
{		 
public

 

	interface

 "
IRoleInformationDomain

 +
:

, -
IBaseDomain

. 9
{ 
Task 
< 
List 
< 
RoleInformation !
>! "
>" #
GetUserRoles$ 0
(0 1
long1 5
employeeSlno6 B
)B C
;C D
Task 
< 
List 
< 
RoleInformation !
>! "
>" #
GetAllActiveRoles$ 5
(5 6
)6 7
;7 8
Task 
< 
bool 
> 
MapRolesToUser !
(! "
)" #
;# $
Task 
< 
List 
< 
RoleInformation !
>! "
>" #
SearchRoles$ /
(/ 0)
RoleInformationSearchCriteria0 M
searchCriteriaN \
)\ ]
;] ^
Task 
< 
bool 
> 
ActivateRole 
(  
long  $
roleSlno% -
)- .
;. /
Task 
< 
bool 
> 
DeActivateRole !
(! "
long" &
roleSlno' /
)/ 0
;0 1
Task 
< 
RoleInformation 
> 
GetRoleInformation 0
(0 1
long1 5
roleSlno6 >
)> ?
;? @
Task 
< 
bool 
> 
SaveRoleInformation &
(& '
RoleInformation' 6
roleInformation7 F
)F G
;G H
} 
} …	
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Interfaces\ISecurityModuleDomain.cs
	namespace 	
MyStore
 
. 
Domain 
. 
Domains  
.  !
Administration! /
./ 0

Interfaces0 :
{ 
public 

	interface !
ISecurityModuleDomain *
:+ ,
IBaseDomain- 8
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
} 
} û
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Administration\Interfaces\IUserInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Administration '
.' (

Interfaces( 2
{		 
public

 

	interface

 "
IUserInformationDomain

 +
:

, -
IBaseDomain

. 9
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
} 
} Õ>
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Authentication\Implementations\AuthenticationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Authentication '
.' (
Implementations( 7
{ 
public 

class  
AuthenticationDomain %
:& '

BaseDomain( 2
,2 3!
IAuthenticationDomain4 I
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ICryptography &
cryptography' 3
;3 4
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
private 
readonly 
IJwtAuthManager (
jwtAuthManager) 7
;7 8
public  
AuthenticationDomain #
(# $
IConfiguration$ 2
configuration3 @
,@ A
ICryptographyB O
cryptographyP \
,\ ]
IDistributedCache^ o

redisCachep z
,z {
IJwtAuthManager	| ã
jwtAuthManager
å ö
)
ö õ
: 
base 
( 
configuration  
,  !

redisCache" ,
), -
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
cryptography 
= 
cryptography  ,
;, -
this 
. 

redisCache 
= 

redisCache (
;( )
this 
. 
jwtAuthManager 
=  !
jwtAuthManager" 0
;0 1
} 	
public   
async   
Task   
<   
UserInformation   )
>  ) *
AuthenticateUser  + ;
(  ; <
LoginInformation  < L
loginInformation  M ]
)  ] ^
{!! 	
UserInformation"" 
userInformation"" +
="", -
null"". 2
;""2 3
using## 
(## %
UserInformationRepository## ,
dashboardRepository##- @
=##A B
new##C F
(##F G
configuration##G T
,##T U
cryptography##V b
,##b c

redisCache##d n
,##n o
jwtAuthManager##p ~
)##~ 
)	## Ä
{$$ 
userInformation%% 
=%%  !
await%%" '
dashboardRepository%%( ;
.%%; <
AuthenticateUser%%< L
(%%L M
loginInformation%%M ]
)%%] ^
;%%^ _
}&& 
return'' 
userInformation'' "
;''" #
}(( 	
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) )
FetchEqualVerificationDetials))  =
())= >
string))> D
token))E J
)))J K
{** 	
bool++ 
verified++ 
=++ 
false++ !
;++! "
using,, 
(,, %
UserInformationRepository,, ,
dashboardRepository,,- @
=,,A B
new,,C F
(,,F G
configuration,,G T
,,,T U
cryptography,,V b
,,,b c

redisCache,,d n
,,,n o
jwtAuthManager,,p ~
),,~ 
)	,, Ä
{-- 
verified.. 
=.. 
await..  
dashboardRepository..! 4
...4 5)
FetchEqualVerificationDetials..5 R
(..R S
token..S X
)..X Y
;..Y Z
}// 
return00 
verified00 
;00 
}11 	
public33 
async33 
Task33 
<33 
EmployeeProfile33 )
>33) *
GetEmployeeProfile33+ =
(33= >
int33> A
employeeSlno33B N
)33N O
{44 	
EmployeeProfile55 
employeeProfile55 +
=55, -
null55. 2
;552 3
using66 
(66 %
UserInformationRepository66 ,
dashboardRepository66- @
=66A B
new66C F
(66F G
configuration66G T
,66T U
cryptography66V b
,66b c

redisCache66d n
,66n o
jwtAuthManager66p ~
)66~ 
)	66 Ä
{
66å ç
employeeProfile77 
=77  !
await77" '
dashboardRepository77( ;
.77; <
GetEmployeeProfile77< N
(77N O
employeeSlno77O [
)77[ \
;77\ ]
}88 
return99 
employeeProfile99 "
;99" #
}:: 	
public<< 
async<< 
Task<< 
<<< 
UserInformation<< )
><<) *'
ValidateAndAuthenticateUser<<+ F
(<<F G
string<<G M
userName<<N V
)<<V W
{== 	
UserInformation>> 
userInformation>> +
=>>, -
null>>. 2
;>>2 3
using?? 
(?? %
UserInformationRepository?? ,
dashboardRepository??- @
=??A B
new??C F
(??F G
configuration??G T
,??T U
cryptography??V b
,??b c

redisCache??d n
,??n o
jwtAuthManager??p ~
)??~ 
)	?? Ä
{@@ 
userInformationAA 
=AA  !
awaitAA" '
dashboardRepositoryAA( ;
.AA; <'
ValidateAndAuthenticateUserAA< W
(AAW X
userNameAAX `
)AA` a
;AAa b
}BB 
returnCC 
userInformationCC "
;CC" #
}DD 	
publicEE 
asyncEE 
TaskEE 
<EE 
UserInformationEE )
>EE) *3
'RefreshTokenValidateAndAuthenticateUserEE+ R
(EER S
UserInformationEES b
userInformationreqEEc u
)EEu v
{FF 	
UserInformationGG 
userInformationGG +
=GG, -
nullGG. 2
;GG2 3
usingHH 
(HH %
UserInformationRepositoryHH ,
dashboardRepositoryHH- @
=HHA B
newHHC F
(HHF G
configurationHHG T
,HHT U
cryptographyHHV b
,HHb c

redisCacheHHd n
,HHn o
jwtAuthManagerHHp ~
)HH~ 
)	HH Ä
{II 
userInformationJJ 
=JJ  !
awaitJJ" '
dashboardRepositoryJJ( ;
.JJ; <3
'RefreshTokenValidateAndAuthenticateUserJJ< c
(JJc d
userInformationreqJJd v
)JJv w
;JJw x
}KK 
returnLL 
userInformationLL "
;LL" #
}MM 	
publicNN 
asyncNN 
TaskNN 
<NN 
UserInformationNN )
>NN) *#
AuthenticateUserForNerpNN+ B
(NNB C
LoginInformationNNC S
loginInformationNNT d
)NNd e
{OO 	
UserInformationPP 
userInformationPP +
=PP, -
nullPP. 2
;PP2 3
usingQQ 
(QQ %
UserInformationRepositoryQQ ,
dashboardRepositoryQQ- @
=QQA B
newQQC F
(QQF G
configurationQQG T
,QQT U
cryptographyQQV b
,QQb c

redisCacheQQd n
,QQn o
jwtAuthManagerQQp ~
)QQ~ 
)	QQ Ä
{RR 
userInformationSS 
=SS  !
awaitSS" '
dashboardRepositorySS( ;
.SS; <#
AuthenticateUserForNerpSS< S
(SSS T
loginInformationSST d
)SSd e
;SSe f
}TT 
returnUU 
userInformationUU "
;UU" #
}VV 	
}XX 
}YY ß
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Authentication\Interfaces\IAuthenticationDomain.cs
	namespace		 	
Phoenix		
 
.		 
Domain		 
.		 
Authentication		 '
.		' (

Interfaces		( 2
{

 
public 

	interface !
IAuthenticationDomain *
:+ ,
IBaseDomain- 8
{ 
Task 
< 
UserInformation 
> 
AuthenticateUser .
(. /
LoginInformation/ ?
loginInformation@ P
)P Q
;Q R
Task 
< 
bool 
> )
FetchEqualVerificationDetials 0
(0 1
string1 7
token8 =
)= >
;> ?
Task 
< 
EmployeeProfile 
> 
GetEmployeeProfile 0
(0 1
int1 4
employeeSlno5 A
)A B
;B C
Task 
< 
UserInformation 
> '
ValidateAndAuthenticateUser 9
(9 :
string: @
userNameA I
)I J
;J K
Task 
< 
UserInformation 
> 3
'RefreshTokenValidateAndAuthenticateUser E
(E F
UserInformationF U
userInformationreqV h
)h i
;i j
Task 
< 
UserInformation 
> #
AuthenticateUserForNerp 5
(5 6
LoginInformation6 F
loginInformationG W
)W X
;X Y
} 
} î
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\AutoApproval\Implementations\AutoApprovalDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
AutoApproval %
.% &
Implementations& 5
{ 
public 

class 
AutoApprovalDomain #
:# $
IAutoApprovalDomain% 8
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
public 
AutoApprovalDomain !
(! "
IConfiguration" 0
configuration1 >
,> ?
ILoggerManager@ N
loggerO U
)U V
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
logger 
= 
logger  
;  !
} 	
public 
async 
Task 
GetAutoApprovals *
(* +
)+ ,
{ 	
using 
( #
AutoApprovalRespository *#
autoApprovalRespository+ B
=C D
newE H
(H I
configurationI V
,V W
loggerX ^
)^ _
)_ `
{ 
await #
autoApprovalRespository .
.. /
GetAutoApprovals/ ?
(? @
)@ A
;A B
} 
} 	
}   
}!! Ê
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\AutoApproval\Interfaces\IAutoApprovalDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
AutoApproval %
.% &

Interfaces& 0
{ 
public 

	interface 
IAutoApprovalDomain (
{		 
Task

 
GetAutoApprovals

 
(

 
)

 
;

  
} 
} »
JF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Base\BaseDomain.cs
	namespace 	
Phonix
 
. 
Domain 
{ 
public 

abstract 
class 

BaseDomain $
:% &
IBaseDomain' 2
,2 3
IDisposable4 ?
{		 
private

 
bool

 
disposedValue

 "
=

# $
false

% *
;

* +
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
	protected 

BaseDomain 
( 
IConfiguration +
configuration, 9
,9 :
IDistributedCache; L

redisCacheM W
)W X
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
	protected 

BaseDomain 
( 
IDistributedCache .

redisCache/ 9
)9 :
{ 	
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
	protected 

BaseDomain 
( 
IConfiguration +
configuration, 9
)9 :
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{ 	
if 
( 
! 
this 
. 
disposedValue #
)# $
{ 
if   
(   
	disposing   
)   
{!! 
}## 
this'' 
.'' 
disposedValue'' "
=''# $
true''% )
;'') *
}(( 
})) 	
public** 
void** 
Dispose** 
(** 
)** 
{++ 	
this-- 
.-- 
Dispose-- 
(-- 
true-- 
)-- 
;-- 
}11 	
}22 
}33 ï
KF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Base\IBaseDomain.cs
	namespace 	
Phonix
 
. 
Domain 
{ 
public 

	interface 
IBaseDomain  
{ 
} 
} â6
bF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\CarLease\Implementations\CarLeaseDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
CarLease !
.! "
Implementations" 1
{		 
public

 

class

 
CarLeaseDomain

 
:

  
ICarLeaseDomain

! 0
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
CarLeaseDomain 
( 
IConfiguration ,
configuration- :
): ;
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
CarLeaseBillName /
>/ 0
>0 1 
GetCarLeaseBillNames2 F
(F G
)G H
{ 	
using 
( 
CarLeaseRepository %
carLeaseRepository& 8
=9 :
new; >
(> ?
configuration? L
)L M
)M N
{ 
return 
await 
carLeaseRepository /
./ 0 
GetCarLeaseBillNames0 D
(D E
)E F
;F G
} 
} 	
public 
async 
Task 
< 
List 
< &
CarLeaseMaintenanceBalance 9
>9 :
>: ;)
GetCarLeaseMaintenanceBalance< Y
(Y Z
intZ ]
empSLNo^ e
)e f
{ 	
List 
< &
CarLeaseMaintenanceBalance +
>+ ,&
carLeaseMaintenanceBalance- G
=H I
nullJ N
;N O
using 
( 
CarLeaseRepository %
carLeaseRepository& 8
=9 :
new; >
(> ?
configuration? L
)L M
)M N
{   &
carLeaseMaintenanceBalance!! *
=!!+ ,
await!!- 2
carLeaseRepository!!3 E
.!!E F)
GetCarLeaseMaintenanceBalance!!F c
(!!c d
empSLNo!!d k
)!!k l
;!!l m
decimal"" 
amount"" 
=""  
$num""! "
;""" #
foreach## 
(## 
var## 
item## !
in##" $&
carLeaseMaintenanceBalance##% ?
)##? @
{$$ 
amount%% 
=%% 
amount%% #
+%%$ %
item%%& *
.%%* +
Balance%%+ 2
;%%2 3
}&& 
if'' 
('' &
carLeaseMaintenanceBalance'' .
.''. /
Count''/ 4
>''5 6
$num''7 8
)''8 9
{(( &
carLeaseMaintenanceBalance)) .
[)). /
$num))/ 0
]))0 1
.))1 2
TotalAmount))2 =
=))> ?
amount))@ F
;))F G
}** 
},, 
return-- &
carLeaseMaintenanceBalance-- -
;--- .
}.. 	
public00 
async00 
Task00 
<00 
List00 
<00 +
CarLeaseMaintenancePendingBills00 >
>00> ?
>00? @.
"GetCarLeaseMaintenancePendingBills00A c
(00c d
int00d g
empSLNo00h o
)00o p
{11 	
using22 
(22 
CarLeaseRepository22 %
carLeaseRepository22& 8
=229 :
new22; >
(22> ?
configuration22? L
)22L M
)22M N
{33 
return44 
await44 
carLeaseRepository44 /
.44/ 0.
"GetCarLeaseMaintenancePendingBills440 R
(44R S
empSLNo44S Z
)44Z [
;44[ \
}55 
}66 	
public88 
async88 
Task88 
<88 
bool88 
>88 %
UploadCarLeaseMaintenance88  9
(889 :%
CarLeaseMaintenanceDetail88: S%
uploadCarLeaseMaintenance88T m
)88m n
{99 	
using:: 
(:: 
CarLeaseRepository:: %
carLeaseRepository::& 8
=::9 :
new::; >
(::> ?
configuration::? L
)::L M
)::M N
{;; 
return<< 
await<< 
carLeaseRepository<< /
.<</ 0%
UploadCarLeaseMaintenance<<0 I
(<<I J%
uploadCarLeaseMaintenance<<J c
)<<c d
;<<d e
}== 
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
List@@ 
<@@ "
CarLeaseAgreementBills@@ 5
>@@5 6
>@@6 7%
GetCarLeaseAgreementBills@@8 Q
(@@Q R
int@@R U
employeeSLNo@@V b
)@@b c
{AA 	
usingBB 
(BB 
CarLeaseRepositoryBB %
carLeaseRepositoryBB& 8
=BB9 :
newBB; >
(BB> ?
configurationBB? L
)BBL M
)BBM N
{CC 
returnDD 
awaitDD 
carLeaseRepositoryDD /
.DD/ 0%
GetCarLeaseAgreementBillsDD0 I
(DDI J
employeeSLNoDDJ V
)DDV W
;DDW X
}EE 
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
boolHH 
>HH '
UploadCarLeaseAgreementBillHH  ;
(HH; <
ListHH< @
<HH@ A"
CarLeaseAgreementBillsHHA W
>HHW X'
carLeaseAgreementBillUploadHHY t
)HHt u
{II 	
usingJJ 
(JJ 
CarLeaseRepositoryJJ %
carLeaseRepositoryJJ& 8
=JJ9 :
newJJ; >
(JJ> ?
configurationJJ? L
)JJL M
)JJM N
{KK 
returnLL 
awaitLL 
carLeaseRepositoryLL /
.LL/ 0'
UploadCarLeaseAgreementBillLL0 K
(LLK L'
carLeaseAgreementBillUploadLLL g
)LLg h
;LLh i
}MM 
}NN 	
publicPP 
asyncPP 
TaskPP 
<PP 
boolPP 
>PP !
DeleteMaintenenceBillPP  5
(PP5 6
intPP6 9
recordIdPP: B
)PPB C
{QQ 	
usingRR 
(RR 
CarLeaseRepositoryRR %
carLeaseRepositoryRR& 8
=RR9 :
newRR; >
(RR> ?
configurationRR? L
)RRL M
)RRM N
{SS 
returnTT 
awaitTT 
carLeaseRepositoryTT /
.TT/ 0!
DeleteMaintenenceBillTT0 E
(TTE F
recordIdTTF N
)TTN O
;TTO P
}UU 
}VV 	
}WW 
}XX ë
^F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\CarLease\Interfaces\ICarLeaseDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
CarLease !
.! "

Interfaces" ,
{ 
public 

	interface 
ICarLeaseDomain $
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
Task 
< 
bool 
> !
DeleteMaintenenceBill (
(( )
int) ,
recordId- 5
)5 6
;6 7
} 
} Ö
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Districts\Implementations\DistrictsDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
	Districts

 "
.

" #
Implementations

# 2
{ 
public 

class 
DistrictsDomain  
:  !
IDistrictsDomain" 2
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
DistrictsDomain 
( 
IConfiguration -
configuration. ;
); <
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
DistrictDetails .
>. /
>/ 0
GetDistrictDetails1 C
(C D
intD G
	stateSlNoH Q
)Q R
{ 	
using 
( 
DistrictsRepository &
districtsRepository' :
=; <
new= @
(@ A
configurationA N
)N O
)O P
{ 
return 
await 
districtsRepository 0
.0 1
GetDistrictDetails1 C
(C D
	stateSlNoD M
)M N
;N O
} 
} 	
} 
} Ô
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Districts\Interfaces\IDistrictsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
	Districts "
." #

Interfaces# -
{ 
public 

	interface 
IDistrictsDomain &
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
} Œ
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\EmployeeInformation\Implementations\AppointmentLetterDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
EmployeeInformation ,
., -
Implementations- <
{ 
public 

class #
AppointmentLetterDomain (
:) *

BaseDomain+ 5
,5 6$
IAppointmentLetterDomain7 O
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public #
AppointmentLetterDomain &
(& '
IConfiguration' 5
configuration6 C
,C D
IDistributedCacheE V

redisCacheW a
)a b
:c d
basee i
(i j
configurationj w
,w x

redisCache	y É
)
É Ñ
{ 	
this 
. 
configuration 
= 
configuration ,
;, -
this 
. 

redisCache 
= 

redisCache &
;& '
} 	
public 
async 
Task 
< 
List 
< 
AppointmentLetter 0
>0 1
>1 2'
GetPendingAppointmentLetter3 N
(N O
)O P
{ 	
List 
< 
AppointmentLetter "
>" #
holidays$ ,
=- .
null/ 3
;3 4
using 
( )
EmployeeInformationRepository 0

repository1 ;
=< =
new> A)
EmployeeInformationRepositoryB _
(_ `
this` d
.d e
configuratione r
,r s
thist x
.x y

redisCache	y É
)
É Ñ
)
Ñ Ö
{ 
holidays 
= 
await  

repository! +
.+ ,'
GetPendingAppointmentLetter, G
(G H
)H I
;I J
}   
return!! 
holidays!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ )
UpdateAppointmentLetterStatus$$ 7
($$7 8
int$$8 ;
employeeNumber$$< J
)$$J K
{%% 	
using&& 
(&& )
EmployeeInformationRepository&& 0

repository&&1 ;
=&&< =
new&&> A)
EmployeeInformationRepository&&B _
(&&_ `
this&&` d
.&&d e
configuration&&e r
,&&r s
this&&t x
.&&x y

redisCache	&&y É
)
&&É Ñ
)
&&Ñ Ö
{'' 
await(( 

repository((  
.((  !)
UpdateAppointmentLetterStatus((! >
(((> ?
employeeNumber((? M
)((M N
;((N O
})) 
}** 	
}++ 
},, çø
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\EmployeeInformation\Implementations\EmployeeInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
EmployeeInformation ,
., -
Implementations- <
{ 
public 

class %
EmployeeInformationDomain *
:+ ,

BaseDomain- 7
,7 8&
IEmployeeInformationDomain9 S
{ 
private 
readonly "
IUserInformationDomain /

userDomain0 :
;: ;
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '

logManager( 2
;2 3
private 
readonly 
ICryptography &
cryptography' 3
;3 4
private 
readonly 
ILoggerManager '
logger( .
;. /
public   %
EmployeeInformationDomain   (
(  ( )
IDistributedCache  ) :

redisCache  ; E
,  E F
IConfiguration  G U
configuration  V c
,  c d
ILoggerManager  e s
logger  t z
)  z {
:!! 
base!! 
(!! 
configuration!!  
,!!  !

redisCache!!" ,
)!!, -
{"" 	
this## 
.## 

redisCache## 
=## 

redisCache## (
;##( )
this$$ 
.$$ 
configuration$$ 
=$$  
configuration$$! .
;$$. /
this%% 
.%% 
logger%% 
=%% 
logger%%  
;%%  !
}'' 	
public(( 
async(( 
Task(( 
<(( 
EmployeeProfile(( )
>(() *"
GetEmployeeInformation((+ A
(((A B
int((B E
employeeSlno((F R
)((R S
{)) 	
EmployeeProfile** 
employeeProfile** +
=**, -
null**. 2
;**2 3
using++ 
(++ )
EmployeeInformationRepository++ 0

repository++1 ;
=++< =
new++> A)
EmployeeInformationRepository++B _
(++_ `
configuration++` m
,++m n

redisCache++o y
)++y z
)++z {
{,, 
employeeProfile-- 
=--  !
await--" '

repository--( 2
.--2 3
GetEmployeeProfile--3 E
(--E F
employeeSlno--F R
)--R S
;--S T
}.. 
return// 
employeeProfile// "
;//" #
}00 	
public22 
async22 
Task22 
<22 
List22 
<22 
	BioMetric22 (
>22( )
>22) * 
GetEmployeeTimeSheet22+ ?
(22? @
long22@ D

employeeId22E O
)22O P
{33 	
List44 
<44 
	BioMetric44 
>44 

attendance44 &
=44' (
null44) -
;44- .
using55 
(55 
BioMetricRepository55 &

repository55' 1
=552 3
new554 7
BioMetricRepository558 K
(55K L
this55L P
.55P Q
configuration55Q ^
,55^ _
this55` d
.55d e

redisCache55e o
,55o p
this55q u
.55u v
logger55v |
)55| }
)55} ~
{66 

attendance77 
=77 
await77 "

repository77# -
.77- . 
GetEmployeeTimeSheet77. B
(77B C

employeeId77C M
)77M N
;77N O
}88 
return99 

attendance99 
;99 
}:: 	
public<< 
async<< 
Task<< 
<<< 
List<< 
<<< 
HolidayInformation<< 1
><<1 2
><<2 3
GetEmployeeHolidays<<4 G
(<<G H
long<<H L

employeeId<<M W
)<<W X
{== 	
List>> 
<>> 
HolidayInformation>> #
>>># $
holidays>>% -
=>>. /
null>>0 4
;>>4 5
using?? 
(?? )
EmployeeInformationRepository?? 0

repository??1 ;
=??< =
new??> A)
EmployeeInformationRepository??B _
(??_ `
this??` d
.??d e
configuration??e r
,??r s
this??t x
.??x y

redisCache	??y É
)
??É Ñ
)
??Ñ Ö
{@@ 
holidaysAA 
=AA 
awaitAA  

repositoryAA! +
.AA+ ,
GetEmployeeHolidaysAA, ?
(AA? @

employeeIdAA@ J
)AAJ K
;AAK L
}BB 
returnCC 
holidaysCC 
;CC 
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
PagedResultSetFF (
<FF( )
EmployeeProfileFF) 8
>FF8 9
>FF9 :&
SearchEmployeeInformationsFF; U
(FFU V-
!EmployeeInformationSearchCriteriaFFV w
searchCriteria	FFx Ü
)
FFÜ á
{GG 	
PagedResultSetHH 
<HH 
EmployeeProfileHH *
>HH* +
holidaysHH, 4
=HH5 6
nullHH7 ;
;HH; <
usingII 
(II )
EmployeeInformationRepositoryII 0

repositoryII1 ;
=II< =
newII> A)
EmployeeInformationRepositoryIIB _
(II_ `
thisII` d
.IId e
configurationIIe r
,IIr s
thisIIt x
.IIx y

redisCache	IIy É
)
IIÉ Ñ
)
IIÑ Ö
{JJ 
holidaysKK 
=KK 
awaitKK  

repositoryKK! +
.KK+ ,&
SearchEmployeeInformationsKK, F
(KKF G
searchCriteriaKKG U
)KKU V
;KKV W
}LL 
returnMM 
holidaysMM 
;MM 
}NN 	
publicPP 
asyncPP 
TaskPP 
<PP 
EmployeeProfilePP )
>PP) *%
GetEmployeeMinimumProfilePP+ D
(PPD E
intPPE H
employeeSlnoPPI U
)PPU V
{QQ 	
EmployeeProfileRR 
holidaysRR $
=RR% &
nullRR' +
;RR+ ,
usingSS 
(SS )
EmployeeInformationRepositorySS 0

repositorySS1 ;
=SS< =
newSS> A)
EmployeeInformationRepositorySSB _
(SS_ `
thisSS` d
.SSd e
configurationSSe r
,SSr s
thisSSt x
.SSx y

redisCache	SSy É
)
SSÉ Ñ
)
SSÑ Ö
{TT 
holidaysUU 
=UU 
awaitUU  

repositoryUU! +
.UU+ ,%
GetEmployeeMinimumProfileUU, E
(UUE F
employeeSlnoUUF R
)UUR S
;UUS T
}VV 
returnWW 
holidaysWW 
;WW 
}XX 	
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
EmployeeProfileZZ )
>ZZ) *
GetEmployeeProfileZZ+ =
(ZZ= >
stringZZ> D

employeeIdZZE O
)ZZO P
{[[ 	
EmployeeProfile\\ 
holidays\\ $
=\\% &
null\\' +
;\\+ ,
using]] 
(]] )
EmployeeInformationRepository]] 0

repository]]1 ;
=]]< =
new]]> A)
EmployeeInformationRepository]]B _
(]]_ `
this]]` d
.]]d e
configuration]]e r
,]]r s
this]]t x
.]]x y

redisCache	]]y É
)
]]É Ñ
)
]]Ñ Ö
{^^ 
holidays__ 
=__ 
await__  

repository__! +
.__+ ,
GetEmployeeProfile__, >
(__> ?

employeeId__? I
)__I J
;__J K
}`` 
returnaa 
holidaysaa 
;aa 
}bb 	
publicee 
asyncee 
Taskee 
<ee 
Listee 
<ee 
BloodRelationee ,
>ee, -
>ee- .)
GetFamilyBloodRelationDetailsee/ L
(eeL M
)eeM N
{ff 	
usinggg 
(gg )
EmployeeInformationRepositorygg 0

repositorygg1 ;
=gg< =
newgg> A
(ggA B
thisggB F
.ggF G
configurationggG T
,ggT U
thisggV Z
.ggZ [

redisCachegg[ e
)gge f
)ggf g
{hh 
returnii 
awaitii 

repositoryii '
.ii' ()
GetFamilyBloodRelationDetailsii( E
(iiE F
)iiF G
;iiG H
}jj 
}kk 	
publicmm 
asyncmm 
Taskmm 
<mm 
Listmm 
<mm 
	Educationmm (
>mm( )
>mm) *
GetEducationDetailsmm+ >
(mm> ?
)mm? @
{nn 	
usingoo 
(oo )
EmployeeInformationRepositoryoo 0

repositoryoo1 ;
=oo< =
newoo> A
(ooA B
thisooB F
.ooF G
configurationooG T
,ooT U
thisooV Z
.ooZ [

redisCacheoo[ e
)ooe f
)oof g
{pp 
returnqq 
awaitqq 

repositoryqq '
.qq' (
GetEducationDetailsqq( ;
(qq; <
)qq< =
;qq= >
}rr 
}ss 	
publicuu 
asyncuu 
Taskuu 
<uu 
Listuu 
<uu 
	Educationuu (
>uu( )
>uu) *%
GetEducationCourseDetailsuu+ D
(uuD E
)uuE F
{vv 	
usingww 
(ww )
EmployeeInformationRepositoryww 0

repositoryww1 ;
=ww< =
newww> A
(wwA B
thiswwB F
.wwF G
configurationwwG T
,wwT U
thiswwV Z
.wwZ [

redisCacheww[ e
)wwe f
)wwf g
{xx 
returnyy 
awaityy 

repositoryyy '
.yy' (%
GetEducationCourseDetailsyy( A
(yyA B
)yyB C
;yyC D
}zz 
}{{ 	
public}} 
async}} 
Task}} 
<}} 
List}} 
<}} 

BloodGroup}} )
>}}) *
>}}* +
GetBloodGroup}}, 9
(}}9 :
)}}: ;
{~~ 	
using 
( )
EmployeeInformationRepository 0

repository1 ;
=< =
new> A
(A B
thisB F
.F G
configurationG T
,T U
thisV Z
.Z [

redisCache[ e
)e f
)f g
{
ÄÄ 
return
ÅÅ 
await
ÅÅ 

repository
ÅÅ '
.
ÅÅ' (
GetBloodGroup
ÅÅ( 5
(
ÅÅ5 6
)
ÅÅ6 7
;
ÅÅ7 8
}
ÇÇ 
}
ÉÉ 	
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
ÖÖ %
AdditionalQualification
ÖÖ 6
>
ÖÖ6 7
>
ÖÖ7 8(
GetAdditionalQualification
ÖÖ9 S
(
ÖÖS T
)
ÖÖT U
{
ÜÜ 	
List
áá 
<
áá %
AdditionalQualification
áá (
>
áá( )%
additionalQualification
áá* A
=
ááB C
null
ááD H
;
ááH I
using
àà 
(
àà +
EmployeeInformationRepository
àà 0

repository
àà1 ;
=
àà< =
new
àà> A+
EmployeeInformationRepository
ààB _
(
àà_ `
this
àà` d
.
ààd e
configuration
ààe r
,
ààr s
this
ààt x
.
ààx y

redisCacheàày É
)ààÉ Ñ
)ààÑ Ö
{
ââ %
additionalQualification
ää '
=
ää( )
await
ää* /

repository
ää0 :
.
ää: ;(
GetAdditionalQualification
ää; U
(
ääU V
)
ääV W
;
ääW X
}
ãã 
return
åå %
additionalQualification
åå *
;
åå* +
}
çç 	
public
éé 
async
éé 
Task
éé 
<
éé 
List
éé 
<
éé 
Courses
éé &
>
éé& '
>
éé' (
CourseFilter
éé) 5
(
éé5 6
int
éé6 9
slno
éé: >
)
éé> ?
{
èè 	
List
êê 
<
êê 
Courses
êê 
>
êê 
courses
êê !
=
êê" #
null
êê$ (
;
êê( )
using
ëë 
(
ëë +
EmployeeInformationRepository
ëë 0

repository
ëë1 ;
=
ëë< =
new
ëë> A+
EmployeeInformationRepository
ëëB _
(
ëë_ `
this
ëë` d
.
ëëd e
configuration
ëëe r
,
ëër s
this
ëët x
.
ëëx y

redisCacheëëy É
)ëëÉ Ñ
)ëëÑ Ö
{
íí 
courses
ìì 
=
ìì 
await
ìì 

repository
ìì  *
.
ìì* +
CourseFilter
ìì+ 7
(
ìì7 8
slno
ìì8 <
)
ìì< =
;
ìì= >
}
îî 
return
ïï 
courses
ïï 
;
ïï 
}
ññ 	
public
óó 
async
óó 
Task
óó 
<
óó 
bool
óó 
>
óó .
 GetUpdateEmployeeEmailAddressOtp
óó  @
(
óó@ A"
UpdadteEmployeeEmail
óóA U"
updadteEmployeeEmail
óóV j
)
óój k
{
òò 	
using
ôô 
(
ôô +
EmployeeInformationRepository
ôô 0

repository
ôô1 ;
=
ôô< =
new
ôô> A
(
ôôA B
this
ôôB F
.
ôôF G
configuration
ôôG T
,
ôôT U
this
ôôV Z
.
ôôZ [

redisCache
ôô[ e
)
ôôe f
)
ôôf g
{
öö 
return
õõ 
await
õõ 

repository
õõ '
.
õõ' (.
 GetUpdateEmployeeEmailAddressOtp
õõ( H
(
õõH I"
updadteEmployeeEmail
õõI ]
)
õõ] ^
;
õõ^ _
}
úú 
}
ùù 	
public
ûû 
async
ûû 
Task
ûû 
<
ûû 
bool
ûû 
>
ûû 1
#VerifyUpdateEmployeeEmailAddressOtp
ûû  C
(
ûûC D"
UpdadteEmployeeEmail
ûûD X"
updadteEmployeeEmail
ûûY m
)
ûûm n
{
üü 	
using
†† 
(
†† +
EmployeeInformationRepository
†† 0

repository
††1 ;
=
††< =
new
††> A
(
††A B
this
††B F
.
††F G
configuration
††G T
,
††T U
this
††V Z
.
††Z [

redisCache
††[ e
)
††e f
)
††f g
{
°° 
return
¢¢ 
await
¢¢ 

repository
¢¢ '
.
¢¢' (1
#VerifyUpdateEmployeeEmailAddressOtp
¢¢( K
(
¢¢K L"
updadteEmployeeEmail
¢¢L `
)
¢¢` a
;
¢¢a b
}
££ 
}
§§ 	
public
•• 
async
•• 
Task
•• 
<
•• 
bool
•• 
>
•• )
UpdateEmployeeFamilyDetails
••  ;
(
••; <
FamilyDetail
••< H
familyDetails
••I V
)
••V W
{
¶¶ 	
using
ßß 
(
ßß +
EmployeeInformationRepository
ßß 0

repository
ßß1 ;
=
ßß< =
new
ßß> A
(
ßßA B
this
ßßB F
.
ßßF G
configuration
ßßG T
,
ßßT U
this
ßßV Z
.
ßßZ [

redisCache
ßß[ e
)
ßße f
)
ßßf g
{
®® 
return
©© 
await
©© 

repository
©© '
.
©©' ()
UpdateEmployeeFamilyDetails
©©( C
(
©©C D
familyDetails
©©D Q
)
©©Q R
;
©©R S
}
™™ 
}
´´ 	
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
bool
ÆÆ 
>
ÆÆ ,
UpdateEmployeeEducationDetails
ÆÆ  >
(
ÆÆ> ?
EducationDetail
ÆÆ? N
educationDetail
ÆÆO ^
)
ÆÆ^ _
{
ØØ 	
using
∞∞ 
(
∞∞ +
EmployeeInformationRepository
∞∞ 0

repository
∞∞1 ;
=
∞∞< =
new
∞∞> A
(
∞∞A B
this
∞∞B F
.
∞∞F G
configuration
∞∞G T
,
∞∞T U
this
∞∞V Z
.
∞∞Z [

redisCache
∞∞[ e
)
∞∞e f
)
∞∞f g
{
±± 
return
≤≤ 
await
≤≤ 

repository
≤≤ '
.
≤≤' (,
UpdateEmployeeEducationDetails
≤≤( F
(
≤≤F G
educationDetail
≤≤G V
)
≤≤V W
;
≤≤W X
}
≥≥ 
}
¥¥ 	
public
∂∂ 
async
∂∂ 
Task
∂∂ 
<
∂∂ 
bool
∂∂ 
>
∂∂ -
UpdateEmployeeExperienceDetails
∂∂  ?
(
∂∂? @
ExperienceDetail
∂∂@ P
experienceDetail
∂∂Q a
)
∂∂a b
{
∑∑ 	
using
∏∏ 
(
∏∏ +
EmployeeInformationRepository
∏∏ 0

repository
∏∏1 ;
=
∏∏< =
new
∏∏> A
(
∏∏A B
this
∏∏B F
.
∏∏F G
configuration
∏∏G T
,
∏∏T U
this
∏∏V Z
.
∏∏Z [

redisCache
∏∏[ e
)
∏∏e f
)
∏∏f g
{
ππ 
return
∫∫ 
await
∫∫ 

repository
∫∫ '
.
∫∫' (-
UpdateEmployeeExperienceDetails
∫∫( G
(
∫∫G H
experienceDetail
∫∫H X
)
∫∫X Y
;
∫∫Y Z
}
ªª 
}
ºº 	
public
ææ 
async
ææ 
Task
ææ 
<
ææ 
bool
ææ 
>
ææ )
DeleteEmployeeFamilyDetails
ææ  ;
(
ææ; <
int
ææ< ?

empFamSlno
ææ@ J
)
ææJ K
{
øø 	
using
¿¿ 
(
¿¿ +
EmployeeInformationRepository
¿¿ 0

repository
¿¿1 ;
=
¿¿< =
new
¿¿> A
(
¿¿A B
this
¿¿B F
.
¿¿F G
configuration
¿¿G T
,
¿¿T U
this
¿¿V Z
.
¿¿Z [

redisCache
¿¿[ e
)
¿¿e f
)
¿¿f g
{
¡¡ 
return
¬¬ 
await
¬¬ 

repository
¬¬ '
.
¬¬' ()
DeleteEmployeeFamilyDetails
¬¬( C
(
¬¬C D

empFamSlno
¬¬D N
)
¬¬N O
;
¬¬O P
}
√√ 
}
ƒƒ 	
public
∆∆ 
async
∆∆ 
Task
∆∆ 
<
∆∆ 
bool
∆∆ 
>
∆∆ ,
DeleteEmployeeEducationDetails
∆∆  >
(
∆∆> ?
int
∆∆? B

empEduSlno
∆∆C M
)
∆∆M N
{
«« 	
using
»» 
(
»» +
EmployeeInformationRepository
»» 0

repository
»»1 ;
=
»»< =
new
»»> A
(
»»A B
this
»»B F
.
»»F G
configuration
»»G T
,
»»T U
this
»»V Z
.
»»Z [

redisCache
»»[ e
)
»»e f
)
»»f g
{
…… 
return
   
await
   

repository
   '
.
  ' (,
DeleteEmployeeEducationDetails
  ( F
(
  F G

empEduSlno
  G Q
)
  Q R
;
  R S
}
ÀÀ 
}
ÃÃ 	
public
ŒŒ 
async
ŒŒ 
Task
ŒŒ 
<
ŒŒ 
bool
ŒŒ 
>
ŒŒ -
DeleteEmployeeExperienceDetails
ŒŒ  ?
(
ŒŒ? @
int
ŒŒ@ C
	empExSlno
ŒŒD M
)
ŒŒM N
{
œœ 	
using
–– 
(
–– +
EmployeeInformationRepository
–– 0

repository
––1 ;
=
––< =
new
––> A
(
––A B
this
––B F
.
––F G
configuration
––G T
,
––T U
this
––V Z
.
––Z [

redisCache
––[ e
)
––e f
)
––f g
{
—— 
return
““ 
await
““ 

repository
““ '
.
““' (-
DeleteEmployeeExperienceDetails
““( G
(
““G H
	empExSlno
““H Q
)
““Q R
;
““R S
}
”” 
}
‘‘ 	
public
÷÷ 
async
÷÷ 
Task
÷÷ 
<
÷÷ 
PagedResultSet
÷÷ (
<
÷÷( )
EmployeeProfile
÷÷) 8
>
÷÷8 9
>
÷÷9 :
GetMyTeamMembers
÷÷; K
(
÷÷K L/
!EmployeeInformationSearchCriteria
÷÷L m
searchCriteria
÷÷n |
)
÷÷| }
{
◊◊ 	
PagedResultSet
ÿÿ 
<
ÿÿ 
EmployeeProfile
ÿÿ *
>
ÿÿ* +
holidays
ÿÿ, 4
=
ÿÿ5 6
null
ÿÿ7 ;
;
ÿÿ; <
using
ŸŸ 
(
ŸŸ +
EmployeeInformationRepository
ŸŸ 0

repository
ŸŸ1 ;
=
ŸŸ< =
new
ŸŸ> A+
EmployeeInformationRepository
ŸŸB _
(
ŸŸ_ `
this
ŸŸ` d
.
ŸŸd e
configuration
ŸŸe r
,
ŸŸr s
this
ŸŸt x
.
ŸŸx y

redisCacheŸŸy É
)ŸŸÉ Ñ
)ŸŸÑ Ö
{
⁄⁄ 
holidays
€€ 
=
€€ 
await
€€  

repository
€€! +
.
€€+ ,
GetMyTeamMembers
€€, <
(
€€< =
searchCriteria
€€= K
)
€€K L
;
€€L M
}
‹‹ 
return
›› 
holidays
›› 
;
›› 
}
ﬁﬁ 	
public
‡‡ 
async
‡‡ 
Task
‡‡ 
<
‡‡ 
List
‡‡ 
<
‡‡ 
	BioMetric
‡‡ (
>
‡‡( )
>
‡‡) *"
GetReporteeTimeSheet
‡‡+ ?
(
‡‡? @-
ReporteeTimeSheetSearchCriteria
‡‡@ _
searchCriteria
‡‡` n
)
‡‡n o
{
·· 	
List
‚‚ 
<
‚‚ 
	BioMetric
‚‚ 
>
‚‚ 

attendance
‚‚ &
=
‚‚' (
null
‚‚) -
;
‚‚- .
using
„„ 
(
„„ !
BioMetricRepository
„„ &

repository
„„' 1
=
„„2 3
new
„„4 7!
BioMetricRepository
„„8 K
(
„„K L
this
„„L P
.
„„P Q
configuration
„„Q ^
,
„„^ _
this
„„` d
.
„„d e

redisCache
„„e o
,
„„o p
this
„„q u
.
„„u v
logger
„„v |
)
„„| }
)
„„} ~
{
‰‰ 

attendance
ÂÂ 
=
ÂÂ 
await
ÂÂ "

repository
ÂÂ# -
.
ÂÂ- ."
GetReporteeTimeSheet
ÂÂ. B
(
ÂÂB C
searchCriteria
ÂÂC Q
)
ÂÂQ R
;
ÂÂR S
}
ÊÊ 
return
ÁÁ 

attendance
ÁÁ 
;
ÁÁ 
}
ËË 	
public
ÍÍ 
async
ÍÍ 
Task
ÍÍ 
<
ÍÍ 
List
ÍÍ 
<
ÍÍ 
EmployeeProfile
ÍÍ .
>
ÍÍ. /
>
ÍÍ/ 0
SearchEmployee
ÍÍ1 ?
(
ÍÍ? @
string
ÍÍ@ F
searchValue
ÍÍG R
)
ÍÍR S
{
ÎÎ 	
List
ÏÏ 
<
ÏÏ 
EmployeeProfile
ÏÏ  
>
ÏÏ  !
employeeProfiles
ÏÏ" 2
=
ÏÏ3 4
null
ÏÏ5 9
;
ÏÏ9 :
using
ÌÌ 
(
ÌÌ +
EmployeeInformationRepository
ÌÌ 0

repository
ÌÌ1 ;
=
ÌÌ< =
new
ÌÌ> A+
EmployeeInformationRepository
ÌÌB _
(
ÌÌ_ `
this
ÌÌ` d
.
ÌÌd e
configuration
ÌÌe r
,
ÌÌr s
this
ÌÌt x
.
ÌÌx y

redisCacheÌÌy É
)ÌÌÉ Ñ
)ÌÌÑ Ö
{
ÓÓ 
employeeProfiles
ÔÔ  
=
ÔÔ! "
await
ÔÔ# (

repository
ÔÔ) 3
.
ÔÔ3 4
SearchEmployee
ÔÔ4 B
(
ÔÔB C
searchValue
ÔÔC N
)
ÔÔN O
;
ÔÔO P
}
 
return
ÒÒ 
employeeProfiles
ÒÒ #
;
ÒÒ# $
}
ÚÚ 	
}
ÛÛ 
}ÙÙ ç
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\EmployeeInformation\Interfaces\IAppointmentLetterDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
EmployeeInformation ,
., -

Interfaces- 7
{		 
public

 

	interface

 $
IAppointmentLetterDomain

 -
{ 
Task 
< 
List 
< 
AppointmentLetter #
># $
>$ %'
GetPendingAppointmentLetter& A
(A B
)B C
;C D
Task )
UpdateAppointmentLetterStatus *
(* +
int+ .
employeeNumber/ =
)= >
;> ?
} 
} ∫+
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\EmployeeInformation\Interfaces\IEmployeeInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
EmployeeInformation ,
., -

Interfaces- 7
{ 
public 

	interface &
IEmployeeInformationDomain /
:0 1
IBaseDomain2 =
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
< 
BloodRelation 
>  
>  !)
GetFamilyBloodRelationDetails" ?
(? @
)@ A
;A B
Task 
< 
List 
< 
	Education 
> 
> 
GetEducationDetails 1
(1 2
)2 3
;3 4
Task 
< 
List 
< 
	Education 
> 
> %
GetEducationCourseDetails 7
(7 8
)8 9
;9 :
Task 
< 
List 
< 

BloodGroup 
> 
> 
GetBloodGroup ,
(, -
)- .
;. /
Task 
< 
bool 
> '
UpdateEmployeeFamilyDetails .
(. /
FamilyDetail/ ;
familyDetails< I
)I J
;J K
Task 
< 
bool 
> ,
 GetUpdateEmployeeEmailAddressOtp 3
(3 4 
UpdadteEmployeeEmail4 H 
updadteEmployeeEmailI ]
)] ^
;^ _
Task 
< 
bool 
> /
#VerifyUpdateEmployeeEmailAddressOtp 6
(6 7 
UpdadteEmployeeEmail7 K 
updadteEmployeeEmailL `
)` a
;a b
Task 
< 
bool 
> *
UpdateEmployeeEducationDetails 1
(1 2
EducationDetail2 A
educationDetailB Q
)Q R
;R S
Task 
< 
bool 
> +
UpdateEmployeeExperienceDetails 2
(2 3
ExperienceDetail3 C
experienceDetailD T
)T U
;U V
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
}'' ‘
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\EmployeeVerification\Implementations\EmployeeVerificationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
.  
EmployeeVerification -
.- .
Implementations. =
{ 
public 

class &
EmployeeVerificationDomain +
:, -'
IEmployeeVerificationDomain. I
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public &
EmployeeVerificationDomain )
() *
IConfiguration* 8
configuration9 F
)F G
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
bool 
> $
SaveEmployeeVerifiedData  8
(8 9
string9 ?
idempotencyId@ M
,M N
intO R
employeeSlnoS _
)_ `
{ 	
bool 

isVerified 
= 
false #
;# $
using 
( +
EmployeeVerificationRespository 2*
employeeVerificationRepository3 Q
=R S
newT W+
EmployeeVerificationRespositoryX w
(w x
configuration	x Ö
)
Ö Ü
)
Ü á
{ 

isVerified 
= 
await !*
employeeVerificationRepository" @
.@ A$
SaveEmployeeVerifiedDataA Y
(Y Z
idempotencyIdZ g
,g h
employeeSlnoi u
)u v
;v w
} 
return   

isVerified   
;   
}!! 	
public"" 
async"" 
Task"" 
<"" 
Root"" 
>""  
GetVerficationResult""  4
(""4 5
string""5 ;
idempotencyId""< I
,""I J
int""K N
employeeSlno""O [
)""[ \
{## 	
Root$$ 
verificationResult$$ #
=$$$ %
null$$& *
;$$* +
using&& 
(&& +
EmployeeVerificationRespository&& 2*
employeeVerificationRepository&&3 Q
=&&R S
new&&T W+
EmployeeVerificationRespository&&X w
(&&w x
configuration	&&x Ö
)
&&Ö Ü
)
&&Ü á
{'' 
verificationResult)) "
=))# $
await))% **
employeeVerificationRepository))+ I
.))I J 
GetVerficationResult))J ^
())^ _
idempotencyId))_ l
,))l m
employeeSlno))m y
)))y z
;))z {
}** 
return++ 
verificationResult++ %
;++% &
},, 	
public-- 
async-- 
Task-- 
<-- 
bool-- 
>-- ,
 UpdateEmployeeVerificationStatus--  @
(--@ A)
EmployeeVerificationStatusReq--A ^
req--_ b
)--b c
{.. 	
bool// 

isVerified// 
=// 
false// #
;//# $
using11 
(11 +
EmployeeVerificationRespository11 2*
employeeVerificationRepository113 Q
=11R S
new11T W+
EmployeeVerificationRespository11X w
(11w x
configuration	11x Ö
)
11Ö Ü
)
11Ü á
{22 

isVerified44 
=44 
await44 "*
employeeVerificationRepository44# A
.44A B,
 UpdateEmployeeVerificationStatus44B b
(44b c
req44c f
)44f g
;44g h
}55 
return66 

isVerified66 
;66 
}77 	
}88 
}99 ˙
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\EmployeeVerification\Interfaces\IEmployeeVerificationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
.  
EmployeeVerification -
.- .

Interfaces. 8
{ 
public		 

	interface		 '
IEmployeeVerificationDomain		 0
{

 
Task 
< 
bool 
> $
SaveEmployeeVerifiedData +
(+ ,
string, 2
idempotencyId3 @
,@ A
intB E
employeeSlnoF R
)R S
;S T
Task 
< 
Root 
>  
GetVerficationResult '
(' (
string( .
idempotencyId/ <
,< =
int> A
employeeSlnoB N
)N O
;O P
Task 
< 
bool 
> ,
 UpdateEmployeeVerificationStatus 3
(3 4)
EmployeeVerificationStatusReq4 Q
reqR U
)U V
;V W
} 
} É
^F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Form16\Implementations\Form16Domain.cs
	namespace		 	
Phoenix		
 
.		 
Domain		 
.		 
Form16		 
.		  
Implementations		  /
{

 
public 

class 
Form16Domain 
: 
IForm16Domain ,
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
Form16Domain 
( 
IConfiguration *
configuration+ 8
)8 9
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
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
{ 	
using 
( 
Form16Repository #
form16Repository$ 4
=5 6
new7 :
(: ;
configuration; H
)H I
)I J
{ 
return 
await 
form16Repository -
.- .
	GetForm16. 7
(7 8
panNo8 =
)= >
;> ?
} 
} 	
public 
async 
Task 
< 
byte 
[ 
]  
>  !
DownLoadForm16" 0
(0 1
YearWiseTaxDocument1 D
taxDocumentE P
)P Q
{ 	
using 
( 
Form16Repository #
form16Repository$ 4
=5 6
new7 :
(: ;
configuration; H
)H I
)I J
{ 
return 
await 
form16Repository -
.- .
DownLoadForm16. <
(< =
taxDocument= H
)H I
;I J
}   
}!! 	
}## 
}$$ π
ZF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Form16\Interfaces\IForm16Domain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Form16 
.  

Interfaces  *
{ 
public 

	interface 
IForm16Domain "
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
} £
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\HelpDocuments\Implementations\HelpDocumentsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
HelpDocuments &
.& '
Implementations' 6
{ 
public 

class 
HelpDocumentsDomain $
:% & 
IHelpDocumentsDomain' ;
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
HelpDocumentsDomain "
(" #
IConfiguration# 1
configuration2 ?
)? @
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
byte 
[ 
]  
>  !
DownloadDocument" 2
(2 3
HelpDocument3 ?
helpDocument@ L
)L M
{ 	
byte 
[ 
] 
documentData 
=  !
null" &
;& '
using 
( #
HelpDocumentsRepository *"
helpDocumentRepository+ A
=B C
newD G
(G H
configurationH U
)U V
)V W
{ 
documentData 
= 
await $"
helpDocumentRepository% ;
.; <
DownloadDocument< L
(L M
helpDocumentM Y
)Y Z
;Z [
} 
return 
documentData 
;  
} 	
public   
async   
Task   
<   
List   
<   
HelpDocument   +
>  + ,
>  , -
GetActiveHelpDocs  . ?
(  ? @
int  @ C
officeTypeSLNO  D R
)  R S
{!! 	
List"" 
<"" 
HelpDocument"" 
>"" 
helpDocuments"" ,
=""- .
null""/ 3
;""3 4
using## 
(## #
HelpDocumentsRepository## *"
helpDocumentRepository##+ A
=##B C
new##D G
(##G H
configuration##H U
)##U V
)##V W
{$$ 
helpDocuments%% 
=%% 
await%%  %"
helpDocumentRepository%%& <
.%%< =
GetActiveHelpDocs%%= N
(%%N O
officeTypeSLNO%%O ]
)%%] ^
;%%^ _
}&& 
foreach(( 
((( 
HelpDocument(( !
item((" &
in((' )
helpDocuments((* 7
)((7 8
{)) 
StringBuilder** 

imagesPath** (
=**) *
new**+ .
StringBuilder**/ <
(**< =
)**= >
;**> ?
string++ 
[++ 
]++ 
	imagePath++ "
=++# $
null++% )
;++) *
	imagePath-- 
=-- 
item--  
.--  !
FilePath--! )
.--) *
Split--* /
(--/ 0
$char--0 3
)--3 4
;--4 5

imagesPath.. 
... 
AppendFormat.. '
(..' (
$str..( 8
,..8 9
ApplicationSettings..: M
...M N
Current..N U
...U V
ProfilePath..V a
,..a b
	imagePath..c l
[..l m
$num..m n
]..n o
)..o p
;..p q
item// 
.// 
FilePath// 
=// 

imagesPath//  *
.//* +
ToString//+ 3
(//3 4
)//4 5
;//5 6
}00 
return22 
helpDocuments22  
;22  !
}33 	
}44 
}55 ﬂ
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\HelpDocuments\Interfaces\IHelpDocumentsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
HelpDocuments &
.& '

Interfaces' 1
{ 
public 

	interface  
IHelpDocumentsDomain )
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
} 
} ˆY
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\InvestmentProofs\Implementations\InvestmentProofsDomain.cs
	namespace		 	
Phoenix		
 
.		 
Domain		 
.		 

Investment		 #
.		# $
Implementations		$ 3
{

 
public 

class "
InvestmentProofsDomain '
:( )#
IInvestmentProofsDomain+ B
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public "
InvestmentProofsDomain %
(% &
IConfiguration& 4
configuration5 B
,B C
ILoggerManagerD R
loggerS Y
)Y Z
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
Chapter6FileDetails 2
>2 3
>3 4
GetChapter6Files5 E
(E F
intF I
chapter6DetailIdJ Z
)Z [
{ 	
List 
< 
Chapter6FileDetails $
>$ %
chapter6FileDetails& 9
=: ;
null< @
;@ A
using 
( &
InvestmentProofsRepository -&
investmentProofsRepository. H
=I J
newK N
(N O
configurationO \
)\ ]
)] ^
{ 
chapter6FileDetails #
=$ %
await& +&
investmentProofsRepository, F
.F G
GetChapter6FilesG W
(W X
chapter6DetailIdX h
)h i
;i j
} 
return 
chapter6FileDetails &
;& '
}   	
public"" 
async"" 
Task"" 
<"" 
List"" 
<"" "
HouseIncomeFileDetails"" 5
>""5 6
>""6 7
GetHouseIncomeFiles""8 K
(""K L
int""L O
houseIncomeDetailId""P c
)""c d
{## 	
List$$ 
<$$ "
HouseIncomeFileDetails$$ '
>$$' ("
houseIncomeFileDetails$$) ?
=$$@ A
null$$B F
;$$F G
using%% 
(%% &
InvestmentProofsRepository%% -&
investmentProofsRepository%%. H
=%%I J
new%%K N
(%%N O
configuration%%O \
)%%\ ]
)%%] ^
{&& "
houseIncomeFileDetails'' &
=''' (
await'') .&
investmentProofsRepository''/ I
.''I J
GetHouseIncomeFiles''J ]
(''] ^
houseIncomeDetailId''^ q
)''q r
;''r s
}(( 
return)) "
houseIncomeFileDetails)) )
;))) *
}** 	
public,, 
async,, 
Task,, 
<,, 
List,, 
<,, "
HouseRentAllowanceFile,, 5
>,,5 6
>,,6 7%
GetHouseRentAllowancFiles,,8 Q
(,,Q R
int,,R U
rentPaymentId,,V c
),,c d
{-- 	
List.. 
<.. "
HouseRentAllowanceFile.. '
>..' (#
houseRentAllowanceFiles..) @
=..A B
null..C G
;..G H
using// 
(// &
InvestmentProofsRepository// -&
investmentProofsRepository//. H
=//I J
new//K N
(//N O
configuration//O \
)//\ ]
)//] ^
{00 #
houseRentAllowanceFiles11 '
=11( )
await11* /&
investmentProofsRepository110 J
.11J K%
GetHouseRentAllowancFiles11K d
(11d e
rentPaymentId11e r
)11r s
;11s t
}22 
return33 #
houseRentAllowanceFiles33 *
;33* +
}44 	
public66 
async66 
Task66 
<66 
List66 
<66 "
OtherIncomeFileDetails66 5
>665 6
>666 7
GetOtherIncomeFiles668 K
(66K L
int66L O
otherIncomeDetailId66P c
)66c d
{77 	
List88 
<88 "
OtherIncomeFileDetails88 '
>88' ("
otherIncomeFileDetails88) ?
=88@ A
null88B F
;88F G
using99 
(99 &
InvestmentProofsRepository99 -&
investmentProofsRepository99. H
=99I J
new99K N
(99N O
configuration99O \
)99\ ]
)99] ^
{:: "
otherIncomeFileDetails;; &
=;;( )
await;;* /&
investmentProofsRepository;;0 J
.;;J K
GetOtherIncomeFiles;;K ^
(;;^ _
otherIncomeDetailId;;_ r
);;r s
;;;s t
}<< 
return== "
otherIncomeFileDetails== )
;==) *
}>> 	
publicBB 
asyncBB 
TaskBB 
<BB 
boolBB 
>BB  (
UploadHouseRentAllowanceFileBB! =
(BB= >"
HouseRentAllowanceFileBB> T"
houseRentAllowanceFileBBU k
)BBk l
{CC 	
usingDD 
(DD &
InvestmentProofsRepositoryDD -&
investmentProofsRepositoryDD. H
=DDI J
newDDK N
(DDN O
configurationDDO \
)DD\ ]
)DD] ^
{EE 
boolFF 
respFF 
=FF 
awaitFF !&
investmentProofsRepositoryFF" <
.FF< =(
UploadHouseRentAllowanceFileFF= Y
(FFY Z"
houseRentAllowanceFileFFZ p
)FFp q
;FFq r
returnGG 
respGG 
;GG 
}HH 
}II 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
boolJJ 
>JJ 
UploadChapter6FileJJ  2
(JJ2 3
Chapter6FileDetailsJJ3 F
chapter6FileDetailsJJG Z
)JJZ [
{KK 	
usingLL 
(LL &
InvestmentProofsRepositoryLL -&
investmentProofsRepositoryLL. H
=LLI J
newLLK N
(LLN O
configurationLLO \
)LL\ ]
)LL] ^
{MM 
boolNN 
respNN 
=NN 
awaitNN !&
investmentProofsRepositoryNN" <
.NN< =
UploadChapter6FileNN= O
(NNO P
chapter6FileDetailsNNP c
)NNc d
;NNd e
returnOO 
respOO 
;OO 
}PP 
}QQ 	
publicRR 
asyncRR 
TaskRR 
<RR 
boolRR 
>RR !
UploadHouseIncomeFileRR  5
(RR5 6"
HouseIncomeFileDetailsRR6 L"
houseIncomeFileDetailsRRM c
)RRc d
{SS 	
usingTT 
(TT &
InvestmentProofsRepositoryTT -&
investmentProofsRepositoryTT. H
=TTI J
newTTK N
(TTN O
configurationTTO \
)TT\ ]
)TT] ^
{UU 
boolVV 
respVV 
=VV 
awaitVV !&
investmentProofsRepositoryVV" <
.VV< =!
UploadHouseIncomeFileVV= R
(VVR S"
houseIncomeFileDetailsVVS i
)VVi j
;VVj k
returnWW 
respWW 
;WW 
}XX 
}YY 	
public[[ 
async[[ 
Task[[ 
<[[ 
bool[[ 
>[[ !
UploadOtherIncomeFile[[  5
([[5 6"
OtherIncomeFileDetails[[6 L"
otherIncomeFileDetails[[M c
)[[c d
{\\ 	
using]] 
(]] &
InvestmentProofsRepository]] -&
investmentProofsRepository]]. H
=]]I J
new]]K N
(]]N O
configuration]]O \
)]]\ ]
)]]] ^
{^^ 
bool__ 
resp__ 
=__ 
await__ !&
investmentProofsRepository__" <
.__< =!
UploadOtherIncomeFile__= R
(__R S"
otherIncomeFileDetails__S i
)__i j
;__j k
return`` 
resp`` 
;`` 
}aa 
}cc 	
publicgg 
asyncgg 
Taskgg 
<gg 
boolgg 
>gg (
RemoveHouseRentAllowanceFilegg  <
(gg< =
intgg= @
	hraFileIdggA J
)ggJ K
{hh 	
usingii 
(ii &
InvestmentProofsRepositoryii -&
investmentProofsRepositoryii. H
=iiI J
newiiK N
(iiN O
configurationiiO \
)ii\ ]
)ii] ^
{jj 
boolkk 
respkk 
=kk 
awaitkk !&
investmentProofsRepositorykk" <
.kk< =(
RemoveHouseRentAllowanceFilekk= Y
(kkY Z
	hraFileIdkkZ c
)kkc d
;kkd e
returnll 
respll 
;ll 
}mm 
}nn 	
publicoo 
asyncoo 
Taskoo 
<oo 
booloo 
>oo 
RemoveChapter6Fileoo  2
(oo2 3
intoo3 6
chapter6FileIdoo7 E
)ooE F
{pp 	
usingqq 
(qq &
InvestmentProofsRepositoryqq -&
investmentProofsRepositoryqq. H
=qqI J
newqqK N
(qqN O
configurationqqO \
)qq\ ]
)qq] ^
{rr 
boolss 
respss 
=ss 
awaitss !&
investmentProofsRepositoryss" <
.ss< =
RemoveChapter6Filess= O
(ssO P
chapter6FileIdssP ^
)ss^ _
;ss_ `
returntt 
resptt 
;tt 
}uu 
}vv 	
publicxx 
asyncxx 
Taskxx 
<xx 
boolxx 
>xx !
RemoveHouseIncomeFilexx  5
(xx5 6
intxx6 9
houseIncomeFileIdxx: K
)xxK L
{yy 	
usingzz 
(zz &
InvestmentProofsRepositoryzz -&
investmentProofsRepositoryzz. H
=zzI J
newzzK N
(zzN O
configurationzzO \
)zz\ ]
)zz] ^
{{{ 
bool|| 
resp|| 
=|| 
await|| !&
investmentProofsRepository||" <
.||< =!
RemoveHouseIncomeFile||= R
(||R S
houseIncomeFileId||S d
)||d e
;||e f
return}} 
resp}} 
;}} 
}~~ 
} 	
public
ÄÄ 
async
ÄÄ 
Task
ÄÄ 
<
ÄÄ 
bool
ÄÄ 
>
ÄÄ #
RemoveOtherIncomeFile
ÄÄ  5
(
ÄÄ5 6
int
ÄÄ6 9
otherIncomeFileId
ÄÄ: K
)
ÄÄK L
{
ÅÅ 	
using
ÇÇ 
(
ÇÇ (
InvestmentProofsRepository
ÇÇ -(
investmentProofsRepository
ÇÇ. H
=
ÇÇI J
new
ÇÇK N
(
ÇÇN O
configuration
ÇÇO \
)
ÇÇ\ ]
)
ÇÇ] ^
{
ÉÉ 
bool
ÑÑ 
resp
ÑÑ 
=
ÑÑ 
await
ÑÑ !(
investmentProofsRepository
ÑÑ" <
.
ÑÑ< =#
RemoveOtherIncomeFile
ÑÑ= R
(
ÑÑR S
otherIncomeFileId
ÑÑS d
)
ÑÑd e
;
ÑÑe f
return
ÖÖ 
resp
ÖÖ 
;
ÖÖ 
}
ÜÜ 
}
áá 	
}
ââ 
}ää Å
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\InvestmentProofs\Interfaces\IInvestmentProofsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 

Investment #
.# $

Interfaces$ .
{ 
public 

	interface #
IInvestmentProofsDomain ,
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
Task 
< 
bool 
> (
RemoveHouseRentAllowanceFile /
(/ 0
int0 3
	hraFileId4 =
)= >
;> ?
Task 
< 
bool 
> 
RemoveChapter6File %
(% &
int& )
chapter6FileId* 8
)8 9
;9 :
Task 
< 
bool 
> !
RemoveHouseIncomeFile (
(( )
int) ,
houseIncomeFileId- >
)> ?
;? @
Task 
< 
bool 
> !
RemoveOtherIncomeFile (
(( )
int) ,
otherIncomeFileId- >
)> ?
;? @
}   
}!! Ù&
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Investment\Implementations\InvestmentDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 

Investment

 #
.

# $
Implementations

$ 3
{ 
public 

class 
InvestmentDomain !
:" #
IInvestmentDomain% 6
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
public 
InvestmentDomain 
(  
IConfiguration  .
configuration/ <
,< =
ILoggerManager> L
loggerM S
)S T
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
logger 
= 
logger  
;  !
} 	
public 
async 
Task 
< !
InvestmentDeclaration /
>/ 0$
GetInvestmentDeclaration1 I
(I J
intJ M
finSLNoN U
,U V
intW Z
employeeSLNo[ g
)g h
{ 	
using 
(  
InvestmentRepository ' 
InvestmentRepository( <
== >
new? B
(B C
configurationC P
,P Q
thisR V
.V W
loggerW ]
)] ^
)^ _
{ 
return 
await  
InvestmentRepository 1
.1 2$
GetInvestmentDeclaration2 J
(J K
finSLNoK R
,R S
employeeSLNoT `
)` a
;a b
} 
}   	
public** 
async** 
Task** 
<** !
InvestmentDeclaration** /
>**/ 0&
SaveInvestmentDeclarations**1 K
(**K L!
InvestmentDeclaration**L a!
investmentDeclaration**b w
)**w x
{++ 	
using,, 
(,,  
InvestmentRepository,, ' 
InvestmentRepository,,( <
=,,= >
new,,? B
(,,B C
configuration,,C P
,,,P Q
this,,R V
.,,V W
logger,,W ]
),,] ^
),,^ _
{-- 
return.. 
await..  
InvestmentRepository.. 1
...1 2&
SaveInvestmentDeclarations..2 L
(..L M!
investmentDeclaration..M b
)..b c
;..c d
}// 
}00 	
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
{33 	
using44 
(44  
InvestmentRepository44 ' 
InvestmentRepository44( <
=44= >
new44? B
(44B C
configuration44C P
,44P Q
this44R V
.44V W
logger44W ]
)44] ^
)44^ _
{55 
return66 
await66  
InvestmentRepository66 1
.661 2"
GetAssesseeTypeDetails662 H
(66H I
)66I J
;66J K
}77 
}88 	
public:: 
async:: 
Task:: 
<:: 
List:: 
<:: 
HRALocations:: +
>::+ ,
>::, -
GetHRALocations::. =
(::= >
)::> ?
{;; 	
using<< 
(<<  
InvestmentRepository<< ' 
InvestmentRepository<<( <
=<<= >
new<<? B
(<<B C
configuration<<C P
,<<P Q
this<<R V
.<<V W
logger<<W ]
)<<] ^
)<<^ _
{== 
return>> 
await>>  
InvestmentRepository>> 1
.>>1 2
GetHRALocations>>2 A
(>>A B
)>>B C
;>>C D
}?? 
}@@ 	
publicAA 
asyncAA 
TaskAA 
<AA 
TaxDeductionDetailsAA -
>AA- .&
GetIncomeTaxPaymentDetailsAA/ I
(AAI J
intAAJ M
employeeSLNoAAN Z
)AAZ [
{BB 	
usingCC 
(CC  
InvestmentRepositoryCC ' 
InvestmentRepositoryCC( <
=CC= >
newCC? B
(CCB C
configurationCCC P
,CCP Q
thisCCR V
.CCV W
loggerCCW ]
)CC] ^
)CC^ _
{DD 
returnEE 
awaitEE  
InvestmentRepositoryEE 1
.EE1 2&
GetIncomeTaxPaymentDetailsEE2 L
(EEL M
employeeSLNoEEM Y
)EEY Z
;EEZ [
}FF 
}GG 	
}II 
}JJ ﬁ
bF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Investment\Interfaces\IInvestmentDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 

Investment #
.# $

Interfaces$ .
{ 
public 

	interface 
IInvestmentDomain &
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
} ∞1
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagementReports\Implementations\ReportsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. "
LeaveManagementReports /
./ 0
Implementations0 ?
{ 
public 

class 
ReportsDomain 
:  
IReportsDomain! /
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
public 
ReportsDomain 
( 
IConfiguration +
configuration, 9
,9 :
ILoggerManager; I
loggerJ P
)P Q
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
logger 
= 
logger  
;  !
} 	
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
>" #
leaveDetails$ 0
=1 2
null3 7
;7 8
using   
(   
ReportsRepository   $%
leaveManagementRepository  % >
=  ? @
new  A D
(  D E
configuration  E R
,  R S
logger  T Z
)  Z [
)  [ \
{!! 
leaveDetails"" 
="" 
await"" $%
leaveManagementRepository""% >
.""> ?
GetLeaveReport""? M
(""M N
getLeaveReportReq""N _
)""_ `
;""` a
}## 
return$$ 
leaveDetails$$ 
;$$  
}%% 	
public'' 
async'' 
Task'' 
<'' 
List'' 
<'' 
AutoApprovalReport'' 1
>''1 2
>''2 3!
GetAutoApprovalReport''4 I
(''I J
GetLeaveReportReq''J [
getLeaveReportReq''\ m
)''m n
{(( 	
List)) 
<)) 
AutoApprovalReport)) #
>))# $
empLeaveStatusList))% 7
=))8 9
null)): >
;))> ?
using** 
(** 
ReportsRepository** $%
leaveManagementRepository**% >
=**? @
new**A D
(**D E
configuration**E R
,**R S
logger**T Z
)**Z [
)**[ \
{++ 
empLeaveStatusList,, "
=,,# $
await,,% *%
leaveManagementRepository,,+ D
.,,D E!
GetAutoApprovalReport,,E Z
(,,Z [
getLeaveReportReq,,[ l
),,l m
;,,m n
}-- 
return.. 
empLeaveStatusList.. %
;..% &
}// 	
public00 
async00 
Task00 
<00 
List00 
<00 
LeaveDetailReport00 0
>000 1
>001 2 
GetLeaveTransactions003 G
(00G H"
GetLeaveTransactionReq00H ^"
getLeaveTransactionReq00_ u
)00u v
{11 	
List22 
<22 
LeaveDetailReport22 "
>22" #
leaveDetails22$ 0
=221 2
null223 7
;227 8
using33 
(33 
ReportsRepository33 $%
leaveManagementRepository33% >
=33? @
new33A D
(33D E
configuration33E R
,33R S
logger33T Z
)33Z [
)33[ \
{44 
leaveDetails55 
=55 
await55 $%
leaveManagementRepository55% >
.55> ? 
GetLeaveTransactions55? S
(55S T"
getLeaveTransactionReq55T j
)55j k
;55k l
}66 
return77 
leaveDetails77 
;77  
}88 	
public99 
async99 
Task99 
<99 
List99 
<99 ,
 EmployeeVerificationDetailReport99 ?
>99? @
>99@ A)
GetEmployeeVerificationReport99B _
(99_ `)
EmployeeVerificationReportReq99` }
	reportReq	99~ á
)
99á à
{:: 	
List;; 
<;; ,
 EmployeeVerificationDetailReport;; 1
>;;1 2
details;;3 :
=;;; <
null;;= A
;;;A B
using<< 
(<< 
ReportsRepository<< $%
leaveManagementRepository<<% >
=<<? @
new<<A D
(<<D E
configuration<<E R
,<<R S
logger<<T Z
)<<Z [
)<<[ \
{== 
details>> 
=>> 
await>> %
leaveManagementRepository>>  9
.>>9 :)
GetEmployeeVerificationReport>>: W
(>>W X
	reportReq>>X a
)>>a b
;>>b c
}?? 
return@@ 
details@@ 
;@@ 
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
ListCC 
<CC 
LeaveDetailReportCC 0
>CC0 1
>CC1 2
GetAllLeavesCC3 ?
(CC? @
GetLeaveReportReqCC@ Q
getLeaveReportReqCCR c
)CCc d
{DD 	
ListEE 
<EE 
LeaveDetailReportEE "
>EE" #
leaveDetailsEE$ 0
=EE1 2
nullEE3 7
;EE7 8
usingFF 
(FF 
ReportsRepositoryFF $%
leaveManagementRepositoryFF% >
=FF? @
newFFA D
(FFD E
configurationFFE R
,FFR S
loggerFFT Z
)FFZ [
)FF[ \
{GG 
leaveDetailsHH 
=HH 
awaitHH $%
leaveManagementRepositoryHH% >
.HH> ?
GetAllLeavesHH? K
(HHK L
getLeaveReportReqHHL ]
)HH] ^
;HH^ _
}II 
returnJJ 
leaveDetailsJJ 
;JJ  
}KK 	
}LL 
}MM È
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagementReports\Interfaces\IReportsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. "
LeaveManagementReports /
./ 0

Interfaces0 :
{		 
public

 

	interface

 
IReportsDomain

 #
{ 
Task 
< 
List 
< 
LeaveDetailReport #
># $
>$ %
GetLeaveReport& 4
(4 5
GetLeaveReportReq5 F
getLeaveReportReqG X
)X Y
;Y Z
Task 
< 
List 
< 
AutoApprovalReport $
>$ %
>% &!
GetAutoApprovalReport' <
(< =
GetLeaveReportReq= N
getLeaveReportReqO `
)` a
;a b
Task 
< 
List 
< 
LeaveDetailReport #
># $
>$ % 
GetLeaveTransactions& :
(: ;"
GetLeaveTransactionReq; Q"
getLeaveTransactionReqR h
)h i
;i j
Task 
< 
List 
< ,
 EmployeeVerificationDetailReport 2
>2 3
>3 4)
GetEmployeeVerificationReport5 R
(R S)
EmployeeVerificationReportReqS p
	reportReqq z
)z {
;{ |
Task 
< 
List 
< 
LeaveDetailReport #
># $
>$ %
GetAllLeaves& 2
(2 3
GetLeaveReportReq3 D
getLeaveReportReqE V
)V W
;W X
} 
} ›.
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagement\Implementations\LeaveEncashmentDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )
Implementations) 8
{ 
public 

class !
LeaveEncashmentDomain &
:' ("
ILeaveEncashmentDomain) ?
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public !
LeaveEncashmentDomain $
($ %
IConfiguration% 3
configuration4 A
)A B
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
LeaveEncashment .
>. /
>/ 0
GetLeaveEncashment1 C
(C D
intD G
employeeSlnoH T
)T U
{ 	
List 
< 
LeaveEncashment  
>  !
leaveEncashment" 1
=2 3
null4 8
;8 9
using 
( %
LeaveEncashmentRepository ,%
leaveEncashmentRepository- F
=G H
newI L
(L M
configurationM Z
)Z [
)[ \
{ 
leaveEncashment 
=  !
await" '%
leaveEncashmentRepository( A
.A B
GetLeaveEncashmentB T
(T U
employeeSlnoU a
)a b
;b c
} 
return 
leaveEncashment "
;" #
} 	
public 
async 
Task 
< 
bool 
> 
SaveLeaveEncashment  3
(3 4
LeaveEncashmentReq4 F&
employeeLeaveEncashmentReqG a
)a b
{   	
using!! 
(!! %
LeaveEncashmentRepository!! ,%
leaveEncashmentRepository!!- F
=!!G H
new!!I L
(!!L M
configuration!!M Z
)!!Z [
)!![ \
{"" 
return## 
await## %
leaveEncashmentRepository## 6
.##6 7
SaveLeaveEncashment##7 J
(##J K&
employeeLeaveEncashmentReq##K e
)##e f
;##f g
}$$ 
}%% 	
public&& 
async&& 
Task&& 
<&& 
bool&& 
>&& *
UpdateEmployeeEncashmentStatus&&  >
(&&> ?
UpdateEncashmentReq&&? R
leaveDetail&&S ^
)&&^ _
{'' 	
using(( 
((( %
LeaveEncashmentRepository(( ,%
leaveEncashmentRepository((- F
=((G H
new((I L
(((L M
configuration((M Z
)((Z [
)(([ \
{)) 
return** 
await** %
leaveEncashmentRepository** 6
.**6 7*
UpdateEmployeeEncashmentStatus**7 U
(**U V
leaveDetail**V a
)**a b
;**b c
}++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
bool.. 
>.. !
DeleteLeaveEncashment..  5
(..5 6
DeleteEncashmentReq..6 I
deleteEncashmentReq..J ]
)..] ^
{// 	
using00 
(00 %
LeaveEncashmentRepository00 ,%
leaveEncashmentRepository00- F
=00G H
new00I L
(00L M
configuration00M Z
)00Z [
)00[ \
{11 
return22 
await22 %
leaveEncashmentRepository22 6
.226 7!
DeleteLeaveEncashment227 L
(22L M
deleteEncashmentReq22M `
)22` a
;22a b
}33 
}44 	
public55 
async55 
Task55 
<55 
decimal55 !
>55! "'
GetEmployeeTDSAmountDetails55# >
(55> ?#
EmployeeTDSMountDetails55? V#
employeeTDSMountDetails55W n
)55n o
{66 	
decimal77 
	tdsAmount77 
=77 
$num77  !
;77! "
using88 
(88 %
LeaveEncashmentRepository88 ,%
leaveEncashmentRepository88- F
=88G H
new88I L
(88L M
configuration88M Z
)88Z [
)88[ \
{99 
	tdsAmount:: 
=:: 
await:: !%
leaveEncashmentRepository::" ;
.::; <'
GetEmployeeTDSAmountDetails::< W
(::W X#
employeeTDSMountDetails::X o
)::o p
;::p q
};; 
return<< 
	tdsAmount<< 
;<< 
}== 	
public>> 
async>> 
Task>> 
<>> 
List>> 
<>> +
LeaveEncashmentApprovalsDetails>> >
>>>> ?
>>>? @'
GetLeavesEncashmentApproval>>A \
(>>\ ]
int>>] `
employeeSlno>>a m
)>>m n
{?? 	
List@@ 
<@@ +
LeaveEncashmentApprovalsDetails@@ 0
>@@0 1$
leaveEncashmentApprovals@@2 J
=@@K L
null@@M Q
;@@Q R
usingAA 
(AA %
LeaveEncashmentRepositoryAA ,%
leaveEncashmentRepositoryAA- F
=AAG H
newAAI L
(AAL M
configurationAAM Z
)AAZ [
)AA[ \
{BB $
leaveEncashmentApprovalsCC (
=CC) *
awaitCC+ 0%
leaveEncashmentRepositoryCC1 J
.CCJ K'
GetLeavesEncashmentApprovalCCK f
(CCf g
employeeSlnoCCg s
)CCs t
;CCt u
}DD 
returnEE $
leaveEncashmentApprovalsEE +
;EE+ ,
}GG 	
}HH 
}II Ò 
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagement\Implementations\LeaveEntitlementDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )
Implementations) 8
{ 
public 

class "
LeaveEntitlementDomain '
:( )#
ILeaveEntitlementDomain* A
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public "
LeaveEntitlementDomain %
(% &
IConfiguration& 4
configuration5 B
)B C
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
LeaveEntitlement /
>/ 0
>0 1
GetLeaveEntitlement2 E
(E F*
GetEmployeeLeaveEntitlementReqF d(
employeeLeaveEntitlementReq	e Ä
)
Ä Å
{ 	
List 
< 
LeaveEntitlement !
>! "
leaveEntitlements# 4
=5 6
null7 ;
;; <
using 
( &
LeaveEntitlementRepository -&
leaveEntitlementRepository. H
=I J
newK N
(N O
configurationO \
)\ ]
)] ^
{ 
leaveEntitlements !
=" #
await$ )&
leaveEntitlementRepository* D
.D E
GetLeaveEntitlementE X
(X Y'
employeeLeaveEntitlementReqY t
)t u
;u v
} 
return 
leaveEntitlements $
;$ %
} 	
public 
async 
Task 
< 
bool 
> "
UpdateLeaveEntitlement  6
(6 7
List7 ;
<; <
LeaveEntitlement< L
>L M
leaveEntitlementsN _
)_ `
{   	
using!! 
(!! &
LeaveEntitlementRepository!! -&
leaveEntitlementRepository!!. H
=!!I J
new!!K N
(!!N O
configuration!!O \
)!!\ ]
)!!] ^
{"" 
return## 
await## &
leaveEntitlementRepository## 7
.##7 8"
UpdateLeaveEntitlement##8 N
(##N O
leaveEntitlements##O `
)##` a
;##a b
}$$ 
}%% 	
public&& 
async&& 
Task&& 
<&& 
bool&& 
>&&  
SaveLeaveEntitlement&&  4
(&&4 5
List&&5 9
<&&9 :
LeaveEntitlement&&: J
>&&J K
leaveEntitlements&&L ]
)&&] ^
{'' 	
using(( 
((( &
LeaveEntitlementRepository(( -&
leaveEntitlementRepository((. H
=((I J
new((K N
(((N O
configuration((O \
)((\ ]
)((] ^
{)) 
return** 
await** &
leaveEntitlementRepository** 7
.**7 8 
SaveLeaveEntitlement**8 L
(**L M
leaveEntitlements**M ^
)**^ _
;**_ `
}++ 
},, 	
public-- 
async-- 
Task-- 
<-- 
bool-- 
>-- "
DeleteLeaveEntitlement--  6
(--6 7-
!DeleteEmployeeLeaveEntitlementReq--7 X-
!deleteEmployeeLeaveEntitlementReq--Y z
)--z {
{.. 	
using// 
(// &
LeaveEntitlementRepository// -&
leaveEntitlementRepository//. H
=//I J
new//K N
(//N O
configuration//O \
)//\ ]
)//] ^
{00 
return11 
await11 &
leaveEntitlementRepository11 7
.117 8"
DeleteLeaveEntitlement118 N
(11N O-
!deleteEmployeeLeaveEntitlementReq11O p
)11p q
;11q r
}22 
}33 	
}44 
}55 én
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagement\Implementations\LeaveManagementDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )
Implementations) 8
{ 
public 

class !
LeaveManagementDomain &
:' ("
ILeaveManagementDomain) ?
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
public !
LeaveManagementDomain $
($ %
IConfiguration% 3
configuration4 A
,A B
ILoggerManagerC Q
loggerR X
)X Y
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
this 
. 
logger 
= 
logger  
;  !
} 	
public 
async 
Task 
< 
List 
< 
LeaveDetail *
>* +
>+ ,
GetEmployeeLeaves- >
(> ?
int? B
empSLNoC J
,J K
intL O
statusIdP X
)X Y
{ 	
List 
< 
LeaveDetail 
> 
empLeaveStatusList 0
=1 2
null3 7
;7 8
using 
( %
LeaveManagementRepository ,%
leaveManagementRepository- F
=G H
newI L
(L M
configurationM Z
,Z [
logger\ b
)b c
)c d
{ 
empLeaveStatusList   "
=  # $
await  % *%
leaveManagementRepository  + D
.  D E
GetEmployeeLeaves  E V
(  V W
empSLNo  W ^
,  ^ _
statusId  ` h
)  h i
;  i j
}!! 
return"" 
empLeaveStatusList"" %
;""% &
}## 	
public%% 
async%% 
Task%% 
<%% !
EmpLeavePolicyDetails%% /
>%%/ 0!
GetEmpLeavesbyLeaveId%%1 F
(%%F G
int%%G J
leaveId%%K R
)%%R S
{&& 	!
EmpLeavePolicyDetails'' !!
empLeavePolicyDetails''" 7
=''8 9
null'': >
;''> ?
using(( 
((( %
LeaveManagementRepository(( ,%
leaveManagementRepository((- F
=((G H
new((I L
(((L M
configuration((M Z
,((Z [
logger((\ b
)((b c
)((c d
{)) !
empLeavePolicyDetails** %
=**& '
await**( -%
leaveManagementRepository**. G
.**G H!
GetEmpLeavesbyLeaveId**H ]
(**] ^
leaveId**^ e
)**e f
;**f g
}++ 
return,, !
empLeavePolicyDetails,, (
;,,( )
}-- 	
public// 
async// 
Task// 
<// 
List// 
<// 
EmpLeaveBalance// .
>//. /
>/// 0#
GetEmployeeLeaveBalance//1 H
(//H I
int//I L
empSLNo//M T
)//T U
{00 	
List11 
<11 
EmpLeaveBalance11  
>11  !
empLeaveList11" .
=11/ 0
null111 5
;115 6
using22 
(22 %
LeaveManagementRepository22 ,%
leaveManagementRepository22- F
=22G H
new22I L
(22L M
configuration22M Z
,22Z [
logger22\ b
)22b c
)22c d
{33 
empLeaveList44 
=44 
await44 $%
leaveManagementRepository44% >
.44> ?#
GetEmployeeLeaveBalance44? V
(44V W
empSLNo44W ^
)44^ _
;44_ `
}55 
return66 
empLeaveList66 
;66  
}77 	
public99 
async99 
Task99 
<99 
bool99 
>99 %
UpdateEmployeeLeaveStatus99  9
(999 :
LeaveDetail99: E
empLeave99F N
)99N O
{:: 	
bool;; 
empLeaveStatus;; 
=;;  !
false;;" '
;;;' (
using<< 
(<< %
LeaveManagementRepository<< ,%
leaveManagementRepository<<- F
=<<G H
new<<I L
(<<L M
configuration<<M Z
,<<Z [
logger<<\ b
)<<b c
)<<c d
{== 
empLeaveStatus>> 
=>>  
await>>! &%
leaveManagementRepository>>' @
.>>@ A%
UpdateEmployeeLeaveStatus>>A Z
(>>Z [
empLeave>>[ c
)>>c d
;>>d e
}?? 
return@@ 
empLeaveStatus@@ !
;@@! "
}AA 	
publicBB 
asyncBB 
TaskBB 
<BB 
boolBB 
>BB -
!UpdateMultipleEmployeeLeaveStatusBB  A
(BBA B0
$UpdateMultipleEmployeeLeaveStatusReqBBB f
empLeaveDetailsBBg v
)BBv w
{CC 	
boolDD 
empLeaveStatusDD 
=DD  !
falseDD" '
;DD' (
usingEE 
(EE %
LeaveManagementRepositoryEE ,%
leaveManagementRepositoryEE- F
=EEG H
newEEI L
(EEL M
configurationEEM Z
,EEZ [
loggerEE\ b
)EEb c
)EEc d
{FF 
empLeaveStatusGG 
=GG  
awaitGG! &%
leaveManagementRepositoryGG' @
.GG@ A-
!UpdateMultipleEmployeeLeaveStatusGGA b
(GGb c
empLeaveDetailsGGc r
)GGr s
;GGs t
}HH 
returnII 
empLeaveStatusII !
;II! "
}JJ 	
publicKK 
asyncKK 
TaskKK 
<KK 
EmpLeaveResponseKK *
>KK* +
SaveEmployeeLeaveKK, =
(KK= >
EmployeeLeaveKK> K
empLeaveRequestKKL [
)KK[ \
{LL 	
EmpLeaveResponseMM 
empLeaveMM %
=MM& '
newMM( +
EmpLeaveResponseMM, <
(MM< =
)MM= >
;MM> ?
usingNN 
(NN %
LeaveManagementRepositoryNN ,%
leaveManagementRepositoryNN- F
=NNG H
newNNI L
(NNL M
configurationNNM Z
,NNZ [
loggerNN\ b
)NNb c
)NNc d
{OO 
empLeavePP 
=PP 
awaitPP  %
leaveManagementRepositoryPP! :
.PP: ;
SaveEmployeeLeavePP; L
(PPL M
empLeaveRequestPPM \
)PP\ ]
;PP] ^
}QQ 
returnRR 
empLeaveRR 
;RR 
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU 
ListUU 
<UU 
LeaveDetailUU *
>UU* +
>UU+ ,'
GetLeavesWaitingForApprovalUU- H
(UUH I
intUUI L
employeeSlnoUUM Y
)UUY Z
{VV 	
ListWW 
<WW 
LeaveDetailWW 
>WW 
employeeListWW *
=WW+ ,
nullWW- 1
;WW1 2
usingXX 
(XX %
LeaveManagementRepositoryXX ,%
leaveManagementRepositoryXX- F
=XXG H
newXXI L
(XXL M
configurationXXM Z
,XXZ [
loggerXX\ b
)XXb c
)XXc d
{YY 
employeeListZZ 
=ZZ 
awaitZZ $%
leaveManagementRepositoryZZ% >
.ZZ> ? 
GetLeavesForApprovalZZ? S
(ZZS T
employeeSlnoZZT `
)ZZ` a
;ZZa b
}[[ 
return\\ 
employeeList\\ 
;\\  
}]] 	
public__ 
async__ 
Task__ 
<__ 
List__ 
<__ 
GetTeamLeavesData__ 0
>__0 1
>__1 2
GetTeamLeaves__3 @
(__@ A
LeaveSearchCriteria__A T
searchCriteria__U c
)__c d
{`` 	
Listaa 
<aa 
GetTeamLeavesDataaa "
>aa" #
employeeListaa$ 0
=aa1 2
nullaa3 7
;aa7 8
usingbb 
(bb %
LeaveManagementRepositorybb ,%
leaveManagementRepositorybb- F
=bbG H
newbbI L
(bbL M
configurationbbM Z
,bbZ [
loggerbb\ b
)bbb c
)bbc d
{cc 
employeeListdd 
=dd 
awaitdd $%
leaveManagementRepositorydd% >
.dd> ?
GetMyTeamLeavesdd? N
(ddN O
searchCriteriaddO ]
)dd] ^
;dd^ _
}ee 
returnff 
employeeListff 
;ff  
}gg 	
publichh 
asynchh 
Taskhh 
<hh 
Listhh 
<hh  
GetTeamEmpLeavesDatahh 3
>hh3 4
>hh4 5#
GetMyTeamEmployeeLeaveshh6 M
(hhM N
LeaveSearchCriteriahhN a
searchCriteriahhb p
)hhp q
{ii 	
Listjj 
<jj  
GetTeamEmpLeavesDatajj %
>jj% &
	leaveListjj' 0
=jj1 2
nulljj3 7
;jj7 8
usingkk 
(kk %
LeaveManagementRepositorykk ,%
leaveManagementRepositorykk- F
=kkG H
newkkI L
(kkL M
configurationkkM Z
,kkZ [
loggerkk\ b
)kkb c
)kkc d
{ll 
	leaveListmm 
=mm 
awaitmm !%
leaveManagementRepositorymm" ;
.mm; <#
GetMyTeamEmployeeLeavesmm< S
(mmS T
searchCriteriammT b
)mmb c
;mmc d
}nn 
returnoo 
	leaveListoo 
;oo 
}pp 	
publicqq 
asyncqq 
Taskqq 
<qq 
Listqq 
<qq 
LeaveDetailqq *
>qq* +
>qq+ ,$
GetManagerApprovalLeavesqq- E
(qqE F
intqqF I
employeeSlnoqqJ V
)qqV W
{rr 	
Listss 
<ss 
LeaveDetailss 
>ss 
employeeListss *
=ss+ ,
nullss- 1
;ss1 2
usingtt 
(tt %
LeaveManagementRepositorytt ,%
leaveManagementRepositorytt- F
=ttG H
newttI L
(ttL M
configurationttM Z
,ttZ [
loggertt\ b
)ttb c
)ttc d
{uu 
employeeListvv 
=vv 
awaitvv $%
leaveManagementRepositoryvv% >
.vv> ?$
GetManagerApprovalLeavesvv? W
(vvW X
employeeSlnovvX d
)vvd e
;vve f
}ww 
returnxx 
employeeListxx 
;xx  
}yy 	
public{{ 
async{{ 
Task{{ 
<{{ 
int{{ 
>{{ 
GetUtilizedOnDuties{{ 2
({{2 3
int{{3 6
employeeSlno{{7 C
){{C D
{|| 	
int}} 
utilizedOnDuties}}  
;}}  !
using~~ 
(~~ %
LeaveManagementRepository~~ ,%
leaveManagementRepository~~- F
=~~G H
new~~I L
(~~L M
configuration~~M Z
,~~Z [
logger~~\ b
)~~b c
)~~c d
{ 
utilizedOnDuties
ÄÄ  
=
ÄÄ! "
await
ÄÄ# ('
leaveManagementRepository
ÄÄ) B
.
ÄÄB C!
GetUtilizedOnDuties
ÄÄC V
(
ÄÄV W
employeeSlno
ÄÄW c
)
ÄÄc d
;
ÄÄd e
}
ÅÅ 
return
ÇÇ 
utilizedOnDuties
ÇÇ #
;
ÇÇ# $
}
ÉÉ 	
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
áá !
EmpLeaveFileDetails
áá %
>
áá% &!
empLeaveFileDetails
áá& 9
=
áá: ;
null
áá< @
;
áá@ A
using
àà 
(
àà '
LeaveManagementRepository
àà ,'
leaveManagementRepository
àà- F
=
ààG H
new
ààI L
(
ààL M
configuration
ààM Z
,
ààZ [
logger
àà\ b
)
ààb c
)
ààc d
{
ââ !
empLeaveFileDetails
ää #
=
ää$ %
await
ää& +'
leaveManagementRepository
ää, E
.
ääE F
GetEmpLeaveFiles
ääF V
(
ääV W
leaveId
ääW ^
)
ää^ _
;
ää_ `
}
ãã 
return
åå !
empLeaveFileDetails
åå &
;
åå& '
}
çç 	
public
èè 
async
èè 
Task
èè 
<
èè 
bool
èè 
>
èè 
CancelLeave
èè  +
(
èè+ ,
int
èè, /
leaveId
èè0 7
)
èè7 8
{
êê 	
bool
ëë 
isLeaveCancelled
ëë !
;
ëë! "
using
íí 
(
íí '
LeaveManagementRepository
íí ,'
leaveManagementRepository
íí- F
=
ííG H
new
ííI L
(
ííL M
configuration
ííM Z
,
ííZ [
logger
íí\ b
)
ííb c
)
ííc d
{
ìì 
isLeaveCancelled
îî  
=
îî! "
await
îî# ('
leaveManagementRepository
îî) B
.
îîB C
CancelLeave
îîC N
(
îîN O
leaveId
îîO V
)
îîV W
;
îîW X
}
ïï 
return
ññ 
isLeaveCancelled
ññ #
;
ññ# $
}
óó 	
}
òò 
}ôô ˛
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagement\Interfaces\ILeaveEncashmentDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )

Interfaces) 3
{		 
public

 

	interface

 "
ILeaveEncashmentDomain

 +
{ 
Task 
< 
List 
< 
LeaveEncashment !
>! "
>" #
GetLeaveEncashment$ 6
(6 7
int7 :
employeeSlno; G
)G H
;H I
Task 
< 
bool 
> 
SaveLeaveEncashment &
(& '
LeaveEncashmentReq' 9&
employeeLeaveEncashmentReq: T
)T U
;U V
Task 
< 
bool 
> !
DeleteLeaveEncashment (
(( )
DeleteEncashmentReq) <
deleteEncashmentReq= P
)P Q
;Q R
Task 
< 
decimal 
> '
GetEmployeeTDSAmountDetails 1
(1 2#
EmployeeTDSMountDetails2 I#
employeeTDSMountDetailsJ a
)a b
;b c
Task 
< 
List 
< +
LeaveEncashmentApprovalsDetails 1
>1 2
>2 3'
GetLeavesEncashmentApproval4 O
(O P
intP S
employeeSlnoT `
)` a
;a b
Task 
< 
bool 
> *
UpdateEmployeeEncashmentStatus 1
(1 2
UpdateEncashmentReq2 E
leaveDetailF Q
)Q R
;R S
} 
} ß
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagement\Interfaces\ILeaveEntitlementDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )

Interfaces) 3
{		 
public

 

	interface

 #
ILeaveEntitlementDomain

 ,
{ 
Task 
< 
List 
< 
LeaveEntitlement "
>" #
># $
GetLeaveEntitlement% 8
(8 9*
GetEmployeeLeaveEntitlementReq9 W'
employeeLeaveEntitlementReqX s
)s t
;t u
Task 
< 
bool 
> "
UpdateLeaveEntitlement )
() *
List* .
<. /
LeaveEntitlement/ ?
>? @
leaveEntitlementsA R
)R S
;S T
Task 
< 
bool 
>  
SaveLeaveEntitlement '
(' (
List( ,
<, -
LeaveEntitlement- =
>= >
leaveEntitlements? P
)P Q
;Q R
Task 
< 
bool 
> "
DeleteLeaveEntitlement )
() *-
!DeleteEmployeeLeaveEntitlementReq* K-
!deleteEmployeeLeaveEntitlementReqL m
)m n
;n o
} 
} ÿ
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\LeaveManagement\Interfaces\ILeaveManagementDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )

Interfaces) 3
{ 
public		 

	interface		 "
ILeaveManagementDomain		 +
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
} ˆ
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Mandals\Implementations\MandalsDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
Mandals

  
.

  !
Implementations

! 0
{ 
public 

class 
MandalsDomain 
: 
IMandalsDomain  .
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
MandalsDomain 
( 
IConfiguration +
configuration, 9
)9 :
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
MandalDetails ,
>, -
>- .
GetMandalDetails/ ?
(? @
int@ C
districtSlNoD P
)P Q
{ 	
using 
( 
MandalsRespository %
mandalsRespository& 8
=9 :
new; >
(> ?
configuration? L
)L M
)M N
{ 
return 
await 
mandalsRespository /
./ 0
GetMandalDetails0 @
(@ A
districtSlNoA M
)M N
;N O
} 
} 	
} 
} Ê
\F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Mandals\Interfaces\IMandalsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Mandals  
.  !

Interfaces! +
{ 
public 

	interface 
IMandalsDomain #
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
} º
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Implementations\AttendanceReportTypeDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Masters  
.  !
Implementations! 0
{ 
public 

class &
AttendanceReportTypeDomain +
:, -'
IAttendanceReportTypeDomain. I
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public &
AttendanceReportTypeDomain )
() *
IConfiguration* 8
configuration9 F
)F G
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
<  
AttendanceReportType 3
>3 4
>4 5$
GetAttendanceReportTypes6 N
(N O
)O P
{ 	
List 
<  
AttendanceReportType %
>% &
reportTypes' 2
=3 4
null5 9
;9 :
using 
( *
AttendanceReportTypeRepository 1*
AttendanceReportTypeRepository2 P
=Q R
newS V*
AttendanceReportTypeRepositoryW u
(u v
configuration	v É
)
É Ñ
)
Ñ Ö
{ 
reportTypes 
= 
await #*
AttendanceReportTypeRepository$ B
.B C$
GetAttendanceReportTypesC [
([ \
)\ ]
;] ^
} 
return 
reportTypes 
; 
} 	
} 
}   ≤$
_F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Implementations\BranchDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Masters  
.  !
Implementations! 0
{ 
public 

class 
BranchDomain 
: 
IBranchDomain ,
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
BranchDomain 
( 
IConfiguration *
configuration+ 8
)8 9
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
Branch %
>% &
>& '
GetHRBranch( 3
(3 4
int4 7
employeeSlno8 D
)D E
{ 	
List 
< 
Branch 
> 
branchStatus %
=& '
null( ,
;, -
using 
( 
BranchRepository #
branchRepository$ 4
=5 6
new7 :
BranchRepository; K
(K L
configurationL Y
)Y Z
)Z [
{ 
branchStatus 
= 
await $
branchRepository% 5
.5 6
GetHRBranch6 A
(A B
employeeSlnoB N
)N O
;O P
} 
return 
branchStatus 
;  
} 	
public 
async 
Task 
< 
List 
< 
	BranchRMS (
>( )
>) *
GetHRBranchRMS+ 9
(9 :
int: =
employeeSlno> J
)J K
{ 	
List 
< 
	BranchRMS 
> 
branchStatus (
=) *
null+ /
;/ 0
using   
(   
BranchRepository   #
branchRepository  $ 4
=  5 6
new  7 :
BranchRepository  ; K
(  K L
configuration  L Y
)  Y Z
)  Z [
{!! 
branchStatus"" 
="" 
await"" $
branchRepository""% 5
.""5 6
GetHRBranchRMS""6 D
(""D E
employeeSlno""E Q
)""Q R
;""R S
}## 
return$$ 
branchStatus$$ 
;$$  
}%% 	
public&& 
async&& 
Task&& 
<&& 
List&& 
<&& 
Branch&& %
>&&% &
>&&& ' 
GetBranchesByOfcType&&( <
(&&< =
int&&= @
officeTypeSlno&&A O
,&&O P
int&&P S
employeeSlno&&T `
)&&` a
{'' 	
List(( 
<(( 
Branch(( 
>(( 
branchStatus(( %
=((& '
null((( ,
;((, -
using)) 
()) 
BranchRepository)) #
branchRepository))$ 4
=))5 6
new))7 :
BranchRepository)); K
())K L
configuration))L Y
)))Y Z
)))Z [
{** 
branchStatus++ 
=++ 
await++ $
branchRepository++% 5
.++5 6 
GetBranchesByOfcType++6 J
(++J K
officeTypeSlno++K Y
,++Y Z
employeeSlno++[ g
)++g h
;++h i
},, 
return-- 
branchStatus-- 
;--  
}.. 	
public// 
async// 
Task// 
<// 
List// 
<// 

OfficeType// )
>//) *
>//* +
GetOfficeType//, 9
(//9 :
)//: ;
{00 	
List11 
<11 

OfficeType11 
>11 

officeType11 '
=11( )
null11* .
;11. /
using22 
(22 
BranchRepository22 #
branchRepository22$ 4
=225 6
new227 :
BranchRepository22; K
(22K L
configuration22L Y
)22Y Z
)22Z [
{33 

officeType44 
=44 
await44 "
branchRepository44# 3
.443 4
GetOfficeType444 A
(44A B
)44B C
;44C D
}55 
return66 

officeType66 
;66 
}77 	
}88 
}99 ∂
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Implementations\LeaveDayTypeDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
Masters

  
.

  !
Implementations

! 0
{ 
public 

class 
LeaveDayTypeDomain #
:$ %
ILeaveDayTypeDomain& 9
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
LeaveDayTypeDomain !
(! "
IConfiguration" 0
configuration1 >
)> ?
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
LeaveDayType +
>+ ,
>, -
GetLeaveDayTypes. >
(> ?
)? @
{ 	
List 
< 
LeaveDayType 
> 
leaveDayType +
=, -
null. 2
;2 3
using 
( "
LeaveDayTypeRepository )"
leaveDayTypeRepository* @
=A B
newC F
(F G
configurationG T
)T U
)U V
{ 
leaveDayType 
= 
await $"
leaveDayTypeRepository% ;
.; <
GetLeaveDayTypes< L
(L M
)M N
;N O
} 
return 
leaveDayType 
;  
} 	
} 
} ¶
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Implementations\LeaveStatusDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
Masters

  
.

  !
Implementations

! 0
{ 
public 

class 
LeaveStatusDomain "
:# $
ILeaveStatusDomain% 7
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
LeaveStatusDomain  
(  !
IConfiguration! /
configuration0 =
)= >
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
LeaveStatus *
>* +
>+ ,
GetLeaveStatus- ;
(; <
)< =
{ 	
List 
< 
LeaveStatus 
> 
leaveStatus )
=* +
null, 0
;0 1
using 
( !
LeaveStatusRepository (!
leaveStatusRepository) >
=? @
newA D
(D E
configurationE R
)R S
)S T
{ 
leaveStatus 
= 
await #!
leaveStatusRepository$ 9
.9 :
GetLeaveStatus: H
(H I
)I J
;J K
} 
return 
leaveStatus 
; 
} 	
} 
} â
bF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Implementations\LeaveTypeDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
LeaveManagement

 (
.

( )
Implementations

) 8
{ 
public 

class 
LeaveTypeDomain  
:! "
ILeaveTypeDomain# 3
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
LeaveTypeDomain 
( 
IConfiguration -
configuration. ;
); <
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
	LeaveType (
>( )
>) *!
GetAssignedLeaveTypes+ @
(@ A
intA D
employeeSlnoE Q
)Q R
{ 	
List 
< 
	LeaveType 
> 

leaveTypes &
=' (
null) -
;- .
using 
( 
LeaveTypeRepository &
leaveTypeRepository' :
=; <
new= @
LeaveTypeRepositoryA T
(T U
configurationU b
)b c
)c d
{ 

leaveTypes 
= 
await "
leaveTypeRepository# 6
.6 7!
GetAssignedLeaveTypes7 L
(L M
employeeSlnoM Y
)Y Z
;Z [
} 
return 

leaveTypes 
; 
} 	
public 
async 
Task 
< 
List 
< 
	LeaveType (
>( )
>) *
GetLeaveTypes+ 8
(8 9
)9 :
{ 	
List   
<   
	LeaveType   
>   

leaveTypes   &
=  ' (
null  ) -
;  - .
using!! 
(!! 
LeaveTypeRepository!! &
leaveTypeRepository!!' :
=!!; <
new!!= @
LeaveTypeRepository!!A T
(!!T U
configuration!!U b
)!!b c
)!!c d
{"" 

leaveTypes## 
=## 
await## "
leaveTypeRepository### 6
.##6 7
GetLeaveTypes##7 D
(##D E
)##E F
;##F G
}$$ 
return%% 

leaveTypes%% 
;%% 
}&& 	
}'' 
}(( ‰
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Interfaces\IAttendanceReportTypeDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Masters  
.  !

Interfaces! +
{		 
public

 

	interface

 '
IAttendanceReportTypeDomain

 0
{ 
Task 
< 
List 
<  
AttendanceReportType &
>& '
>' ($
GetAttendanceReportTypes) A
(A B
)B C
;C D
} 
} ≠

[F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Interfaces\IBranchDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Masters  
.  !

Interfaces! +
{		 
public

 

	interface

 
IBranchDomain

 "
{ 
Task 
< 
List 
< 
Branch 
> 
> 
GetHRBranch &
(& '
int' *
employeeSlno+ 7
)7 8
;8 9
Task 
< 
List 
< 
	BranchRMS 
> 
> 
GetHRBranchRMS ,
(, -
int- 0
employeeSlno1 =
)= >
;> ?
Task 
< 
List 
< 
Branch 
> 
>  
GetBranchesByOfcType /
(/ 0
int0 3
officeTypeSlno4 B
,B C
intD G
employeeSlnoH T
)T U
;U V
Task 
< 
List 
< 

OfficeType 
> 
> 
GetOfficeType ,
(, -
)- .
;. /
} 
} …
aF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Interfaces\ILeaveDayTypeDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
leaveDayType %
.% &

Interfaces& 0
{ 
public 

	interface 
ILeaveDayTypeDomain (
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
} «
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Interfaces\ILeaveStatusDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )

Interfaces) 3
{ 
public 

	interface 
ILeaveStatusDomain '
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
} ≤
^F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Masters\Interfaces\ILeaveTypeDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
LeaveManagement (
.( )

Interfaces) 3
{ 
public 

	interface 
ILeaveTypeDomain %
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
 
	LeaveType

 
>

 
>

 !
GetAssignedLeaveTypes

 3
(

3 4
int

4 7
employeeSlno

8 D
)

D E
;

E F
Task 
< 
List 
< 
	LeaveType 
> 
> 
GetLeaveTypes +
(+ ,
), -
;- .
} 
} ®
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Notification\Implementations\NotificationDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
Notification

 %
.

% &
Implementations

& 5
{ 
public 

class 
NotificationDomain #
:# $
INotificationDomain% 8
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
NotificationDomain !
(! "
IConfiguration" 0
configuration1 >
)> ?
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
NotificationDetail 1
>1 2
>2 3
GetNotifications4 D
(D E
intE H
employeeSlnoI U
)U V
{ 	
using 
( #
NotificationRespository *#
NotificationRespository+ B
=C D
newE H
(H I
configurationI V
)V W
)W X
{ 
return 
await #
NotificationRespository 4
.4 5
GetNotifications5 E
(E F
employeeSlnoF R
)R S
;S T
} 
} 	
} 
} ‡
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Notification\Implementations\VistorCountDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Notification %
.% &
Implementations& 5
{ 
public 

class 
VistorCountDomain "
:" #
IVistorCountDomain$ 6
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
5 6
public 
VistorCountDomain  
(  !
IConfiguration! /
configuration0 =
)= >
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
int 
> 
GetVisitorCount .
(. /
)/ 0
{ 	
int 

usersCount 
= 
$num 
; 
using 
( "
VistorCountRespository )
dashboardRepository* =
=> ?
new@ C"
VistorCountRespositoryD Z
(Z [
configuration[ h
)h i
)i j
{ 

usersCount 
= 
await "
dashboardRepository# 6
.6 7
GetVisitorCount7 F
(F G
)G H
;H I
} 
return 

usersCount 
; 
} 	
} 
} ˇ
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Notification\Interfaces\INotificationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Notification %
.% &

Interfaces& 0
{ 
public 

	interface 
INotificationDomain (
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
districtSlNo

< H
)

H I
;

I J
} 
} í
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Notification\Interfaces\IVistorCountDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Notification %
.% &

Interfaces& 0
{ 
public 

	interface 
IVistorCountDomain '
{		 
Task

 
<

 
int

 
>

 
GetVisitorCount

 !
(

! "
)

" #
;

# $
} 
} Å
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\NSL\Implementations\NslEmployeeInformationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
NSL 
. 
Implementations ,
{ 
public 

class $
NslEmployeeProfileDomain )
:* +

BaseDomain, 6
,6 7%
INslEmployeeProfileDomain8 Q
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public $
NslEmployeeProfileDomain '
(' (
IConfiguration( 6
configuration7 D
)D E
: 
base 
( 
configuration  
)  !
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
PagedResultSet (
<( )
EmployeeProfileData) <
>< =
>= >"
GetAllEmployeeProfiles? U
(U V)
EmployeeProfileSearchCriteriaV s
searchCriteria	u É
)
É Ñ
{ 	
PagedResultSet 
< 
EmployeeProfileData .
>. /
employeeProfiles0 @
=A B
nullC G
;G H
using 
( %
EmployeeProfileRepository ,

repository- 7
=8 9
new: =%
EmployeeProfileRepository> W
(W X
configurationX e
)e f
)f g
{ 
employeeProfiles  
=! "
await# (

repository) 3
.3 4
GetEmployeeProfiles4 G
(G H
searchCriteriaH V
)V W
;W X
} 
return   
employeeProfiles   #
;  # $
}!! 	
public## 
async## 
Task## 
<## 
EmployeeProfileData## -
>##- .
GetEmployeeProfile##/ A
(##A B
string##B H

employeeId##I S
)##S T
{$$ 	
EmployeeProfileData%% 
employeeProfile%%  /
=%%0 1
null%%2 6
;%%6 7
using&& 
(&& %
EmployeeProfileRepository&& ,

repository&&- 7
=&&8 9
new&&: =%
EmployeeProfileRepository&&> W
(&&W X
configuration&&X e
)&&e f
)&&f g
{'' 
employeeProfile(( 
=((  !
await((" '

repository((( 2
.((2 3
GetEmployeeProfile((3 E
(((E F

employeeId((F P
)((P Q
;((Q R
})) 
return** 
employeeProfile** "
;**" #
}++ 	
},, 
}-- ù
gF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\NSL\Interfaces\INslEmployeeInformationDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
NSL

 
.

 

Interfaces

 '
{ 
public 

	interface %
INslEmployeeProfileDomain .
:/ 0
IBaseDomain1 <
{ 
Task 
< 
PagedResultSet 
< 
EmployeeProfileData /
>/ 0
>0 1"
GetAllEmployeeProfiles2 H
(H I)
EmployeeProfileSearchCriteriaI f
searchCriteriag u
)u v
;v w
Task 
< 
EmployeeProfileData  
>  !
GetEmployeeProfile" 4
(4 5
string5 ;
eEmployeeId< G
)G H
;H I
} 
} ™
bF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Payslips\Implementations\PayslipsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Payslips !
.! "
Implementations" 1
{		 
public 

class 
PayslipsDomain 
:  
IPayslipsDomain! 0
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
PayslipsDomain 
( 
IConfiguration ,
configuration- :
): ;
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
byte 
[ 
]  
>  !
DownloadPaySlip" 1
(1 2
int2 5
employeeSlno6 B
)B C
{ 	
using 
( 
PayslipsRepository %
payslipsRepository& 8
=9 :
new; >
(> ?
configuration? L
)L M
)M N
{ 
return 
await 
payslipsRepository /
./ 0
DownloadPaySlip0 ?
(? @
employeeSlno@ L
)L M
;M N
} 
}   	
public'' 
async'' 
Task'' 
<'' 
List'' 
<'' 
Payslip'' &
>''& '
>''' (
GetEmployeePayslip'') ;
(''; <
string''< B
employeeSlno''C O
)''O P
{(( 	
using)) 
()) 
PayslipsRepository)) %
payslipsRepository))& 8
=))9 :
new)); >
())> ?
configuration))? L
)))L M
)))M N
{** 
return++ 
await++ 
payslipsRepository++ /
.++/ 0
GetEmployeePayslip++0 B
(++B C
employeeSlno++C O
)++O P
;++P Q
},, 
}-- 	
}.. 
}// æ
^F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Payslips\Interfaces\IPayslipsDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Payslips !
.! "

Interfaces" ,
{ 
public

 

	interface

 
IPayslipsDomain

 $
{ 
Task 
< 
byte 
[ 
] 
> 
DownloadPaySlip $
($ %
int% (
employeeSlno) 5
)5 6
;6 7
Task 
< 
List 
< 
Payslip 
> 
> 
GetEmployeePayslip .
(. /
string/ 5
employeeSlno6 B
)B C
;C D
} 
} ¬"
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Reimbursement\Implementations\ReimbursementDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
Reimbursement

 &
.

& '
Implementations

' 6
{ 
public 

class 
ReimbursementDomain $
:% & 
IReimbursementDomain' ;
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
ReimbursementDomain "
(" #
IConfiguration# 1
configuration2 ?
)? @
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
bool 
> #
DeleteReimbursementBill  7
(7 8
int8 ;
reimbursementId< K
)K L
{ 	
bool 
	isDeleted 
= 
false "
;" #
using 
( #
ReimbursementRepository *#
reimbursementRepository+ B
=C D
newE H
(H I
configurationI V
)V W
)W X
{ 
	isDeleted 
= 
await !#
reimbursementRepository" 9
.9 :#
DeleteReimbursementBill: Q
(Q R
reimbursementIdR a
)a b
;b c
} 
return 
	isDeleted 
; 
} 	
public   
async   
Task   
<   
List   
<   !
ApprovedReimbursement   4
>  4 5
>  5 6
GetApprovedBills  7 G
(  G H
int  H K
employeeNumber  L Z
)  Z [
{!! 	
List"" 
<"" !
ApprovedReimbursement"" &
>""& '"
approvedReimbursements""( >
=""? @
null""A E
;""E F
using## 
(## #
ReimbursementRepository## *#
reimbursementRepository##+ B
=##C D
new##E H
(##H I
configuration##I V
)##V W
)##W X
{$$ "
approvedReimbursements%% &
=%%' (
await%%) .#
reimbursementRepository%%/ F
.%%F G
GetApprovedBills%%G W
(%%W X
employeeNumber%%X f
)%%f g
;%%g h
}&& 
return'' "
approvedReimbursements'' )
;'') *
}(( 	
public)) 
async)) 
Task)) 
<)) 
List)) 
<))  
PendingReimbursement)) 3
>))3 4
>))4 5
GetPendingBills))6 E
())E F
int))F I
employeeNumber))J X
)))X Y
{** 	
List++ 
<++  
PendingReimbursement++ %
>++% &
pendingBills++' 3
=++4 5
null++6 :
;++: ;
using,, 
(,, #
ReimbursementRepository,, *#
reimbursementRepository,,+ B
=,,C D
new,,E H
(,,H I
configuration,,I V
),,V W
),,W X
{-- 
pendingBills.. 
=.. 
await.. $#
reimbursementRepository..% <
...< =
GetPendingBills..= L
(..L M
employeeNumber..M [
)..[ \
;..\ ]
}// 
return00 
pendingBills00 
;00  
}11 	
public33 
async33 
Task33 
<33 
bool33 
>33 
UploadReimburesment33  3
(333 4%
UploadReimbursmentDetails334 M%
uploadReimbursmentDetails33N g
)33g h
{44 	
using55 
(55 #
ReimbursementRepository55 *#
reimbursementRepository55+ B
=55C D
new55E H
(55H I
configuration55I V
)55V W
)55W X
{66 
return77 
await77 #
reimbursementRepository77 4
.774 5
UploadReimburesment775 H
(77H I%
uploadReimbursmentDetails77I b
)77b c
;77c d
}88 
}99 	
}:: 
};; °

hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\Reimbursement\Interfaces\IReimbursementDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
Reimbursement &
.& '

Interfaces' 1
{ 
public 

	interface  
IReimbursementDomain )
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
 !
ApprovedReimbursement

 '
>

' (
>

( )
GetApprovedBills

* :
(

: ;
int

; >
employeeNumber

? M
)

M N
;

N O
Task 
< 
List 
<  
PendingReimbursement &
>& '
>' (
GetPendingBills) 8
(8 9
int9 <
employeeNumber= K
)K L
;L M
Task 
< 
bool 
> 
UploadReimburesment &
(& '%
UploadReimbursmentDetails' @%
uploadReimbursmentDetailsA Z
)Z [
;[ \
Task 
< 
bool 
> #
DeleteReimbursementBill *
(* +
int+ .
reimbursementId/ >
)> ?
;? @
} 
} î
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\SendEmailNotification\Implementations\ResignedEmployeeDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. !
SendEmailNotification .
.. /
Implementations/ >
{ 
public 

class "
ResignedEmployeeDomain '
:' (#
IResignedEmployeeDomain) @
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public "
ResignedEmployeeDomain %
(% &
IConfiguration& 4
configuration5 B
)B C
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
ResignedEmployee /
>/ 0
>0 1 
GetResignedEmployees2 F
(F G
)G H
{ 	
using 
( &
ResignedEmployeeRepository -&
resignedEmployeeRepository. H
=I J
newK N
(N O
configurationO \
)\ ]
)] ^
{ 
return 
await &
resignedEmployeeRepository 7
.7 8 
GetResignedEmployees8 L
(L M
)M N
;N O
} 
} 	
} 
} Ø%
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\SendEmailNotification\Implementations\SendEmailDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. !
SendEmailNotification .
.. /
Implementations/ >
{ 
public 

class 
SendEmailDomain  
:! "
ISendEmailDomain# 3
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
SendEmailDomain 
( 
IConfiguration -
configuration. ;
); <
{= >
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
EmailDetails +
>+ ,
>, -
GetPendingEmails. >
(> ?
)? @
{ 	
using 
( 
SendEmailRepository & 
sendEmailRespository' ;
=< =
new> A
(A B
configurationB O
)O P
)P Q
{ 
return 
await  
sendEmailRespository 1
.1 2
GetPendingEmails2 B
(B C
)C D
;D E
} 
} 	
public 
async 
Task 
< 
List 
< 
EmailDetails +
>+ ,
>, -
GetPendingEmails2. ?
(? @
)@ A
{ 	
using 
( 
SendEmailRepository & 
sendEmailRespository' ;
=< =
new> A
(A B
configurationB O
)O P
)P Q
{ 
return 
await  
sendEmailRespository 1
.1 2
GetPendingEmails22 C
(C D
)D E
;E F
}   
}!! 	
public## 
async## 
Task## 
<## 
List## 
<##  
EmailOtpVerification## 3
>##3 4
>##4 5
GetPendingOTPEmails##6 I
(##I J
)##J K
{$$ 	
using%% 
(%% 
SendEmailRepository%% & 
sendEmailRespository%%' ;
=%%< =
new%%> A
(%%A B
configuration%%B O
)%%O P
)%%P Q
{&& 
return'' 
await''  
sendEmailRespository'' 1
.''1 2
GetPendingOTPEmails''2 E
(''E F
)''F G
;''G H
}(( 
})) 	
public++ 
async++ 
Task++  
UpdateMailSentStatus++ .
(++. /
List++/ 3
<++3 4
int++4 7
>++7 8
seletedLeaveIds++9 H
)++H I
{,, 	
using-- 
(-- 
SendEmailRepository-- & 
sendEmailRespository--' ;
=--< =
new--> A
(--A B
configuration--B O
)--O P
)--P Q
{.. 
await//  
sendEmailRespository// *
.//* + 
UpdateMailSentStatus//+ ?
(//? @
seletedLeaveIds//@ O
)//O P
;//P Q
}00 
}11 	
public22 
async22 
Task22 !
UpdateSentMailStatus222 /
(22/ 0
List220 4
<224 5
int225 8
>228 9
seletedLeaveIds22: I
)22I J
{33 	
using44 
(44 
SendEmailRepository44 & 
sendEmailRespository44' ;
=44< =
new44> A
(44A B
configuration44B O
)44O P
)44P Q
{55 
await66  
sendEmailRespository66 *
.66* +!
UpdateSentMailStatus266+ @
(66@ A
seletedLeaveIds66A P
)66P Q
;66Q R
}77 
}88 	
public:: 
async:: 
Task:: #
UpdateOTPMailSentStatus:: 1
(::1 2
List::2 6
<::6 7
int::7 :
>::: ;
seletedMailId::< I
)::I J
{;; 	
using<< 
(<< 
SendEmailRepository<< & 
sendEmailRespository<<' ;
=<<< =
new<<> A
(<<A B
configuration<<B O
)<<O P
)<<P Q
{== 
await>>  
sendEmailRespository>> *
.>>* +#
UpdateOTPMailSentStatus>>+ B
(>>B C
seletedMailId>>C P
)>>P Q
;>>Q R
}?? 
}@@ 	
}AA 
}BB 
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\SendEmailNotification\Interfaces\IResignedEmployeeDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. !
SendEmailNotification .
.. /

Interfaces/ 9
{		 
public

 

	interface

 #
IResignedEmployeeDomain

 ,
{ 
Task 
< 
List 
< 
ResignedEmployee "
>" #
># $ 
GetResignedEmployees% 9
(9 :
): ;
;; <
} 
} Ø
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\SendEmailNotification\Interfaces\ISendEmailDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. !
SendEmailNotification .
.. /

Interfaces/ 9
{ 
public		 

	interface		 
ISendEmailDomain		 %
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
Task #
UpdateOTPMailSentStatus #
(# $
List$ (
<( )
int) ,
>, -
seletedMailId. ;
); <
;< =
} 
} ´
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\SiteNotification\Implementations\SiteNotificationDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
SiteNotification )
.) *
Implementations* 9
{ 
public 

class "
SiteNotificationDomain '
:( )#
ISiteNotificationDomain* A
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
public "
SiteNotificationDomain %
(% &
IConfiguration& 4
configuration5 B
)B C
{ 	
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
< #
SiteNotificationDetails 1
>1 2 
GetSiteNotifications3 G
(G H
intH K
officeTypeslnoL Z
)Z [
{ 	
using 
( '
SiteNotificationRespository .'
SiteNotificationRespository/ J
=K L
newM P
(P Q
configurationQ ^
,^ _
logger_ e
)e f
)f g
{ 
return   
await   '
SiteNotificationRespository   8
.  8 9 
GetSiteNotifications  9 M
(  M N
officeTypeslno  N \
)  \ ]
;  ] ^
}!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
EmpLeaveResponse$$ *
>$$* + 
SaveEmployeeFeedback$$, @
($$@ A#
EmployeeFeedbackDetails$$A X
empFeedbackRequest$$Y k
)$$k l
{%% 	
EmpLeaveResponse&& 
empFeedback&& (
=&&) *
new&&+ .
EmpLeaveResponse&&/ ?
(&&? @
)&&@ A
;&&A B
using'' 
('' '
SiteNotificationRespository'' .%
leaveManagementRepository''/ H
=''I J
new''K N
(''N O
configuration''O \
,''\ ]
logger''^ d
)''d e
)''e f
{(( 
empFeedback)) 
=)) 
await)) #%
leaveManagementRepository))$ =
.))= > 
SaveEmployeeFeedback))> R
())R S
empFeedbackRequest))S e
)))e f
;))f g
}** 
return++ 
empFeedback++ 
;++ 
},, 	
}-- 
}.. Ã
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\SiteNotification\Interfaces\ISiteNotificationDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
SiteNotification

 )
.

) *

Interfaces

* 4
{ 
public 

	interface #
ISiteNotificationDomain ,
{ 
Task 
< #
SiteNotificationDetails $
>$ % 
GetSiteNotifications& :
(: ;
int; >
officeTypeslno? M
)M N
;N O
Task 
< 
EmpLeaveResponse 
>  
SaveEmployeeFeedback 3
(3 4#
EmployeeFeedbackDetails4 K
empFeedbackRequestL ^
)^ _
;_ `
} 
} •
^F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\States\Implementations\StatesDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
States

 
.

  
Implementations

  /
{ 
public 

class 
StatesDomain 
: 
IStatesDomain +
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
StatesDomain 
( 
IConfiguration *
configuration+ 8
)8 9
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< 
StatesDetails ,
>, -
>- .
GetStatesDetails/ ?
(? @
)@ A
{ 	
using 
( 
StatesRepository #
statesRepository$ 4
=5 6
new7 :
(: ;
configuration; H
)H I
)I J
{ 
return 
await 
statesRepository -
.- .
GetStatesDetails. >
(> ?
)? @
;@ A
} 
} 	
} 
} ∑
ZF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\States\Interfaces\IStatesDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
States 
.  

Interfaces  *
{ 
public 

	interface 
IStatesDomain #
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
} 
} ë
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\TimeSheet\Implementations\TimeSheetDomain.cs
	namespace

 	
Phoenix


 
.

 
Domain

 
.

 
	TimeSheet

 "
.

" #
Implementations

# 2
{ 
public 

class 
TimeSheetDomain  
:  !
ITimeSheetDomain" 2
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
TimeSheetDomain 
( 
IConfiguration -
configuration. ;
); <
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
List 
< #
TimeSheetProjectDetails 6
>6 7
>7 8%
GetEmployeeProjectDetails9 R
(R S
intS V
empSLNoW ^
)^ _
{ 	
List 
< #
TimeSheetProjectDetails (
>( )
empProjectsList* 9
=: ;
null< @
;@ A
using 
( 
TimeSheetRepository &
timeSheetRepository' :
=; <
new= @
(@ A
configurationA N
)N O
)O P
{ 
empProjectsList 
=  !
await" '
timeSheetRepository( ;
.; <%
GetEmployeeProjectDetails< U
(U V
empSLNoV ]
)] ^
;^ _
} 
return 
empProjectsList "
;" #
} 	
} 
} ¸
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\3-Domain\TimeSheet\Interfaces\ITimeSheetDomain.cs
	namespace 	
Phoenix
 
. 
Domain 
. 
	TimeSheet "
." #

Interfaces# -
{ 
public 

	interface 
ITimeSheetDomain %
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