��
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\LeaveInformationRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Administration& 4
{ 
public 

class &
LeaveInformationRepository +
:, -
BaseRepository. <
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public &
LeaveInformationRepository )
() *
IConfiguration* 8

,F G
IDistributedCacheH Y

redisCacheZ d
)d e
:f g
baseh l
(l m

)z {
{ 	
this 
. 

=  

;. /
} 	
public 
async 
Task 
< 
List 
< 
LeaveInformation /
>/ 0
>0 1
GetLeaveInformation2 E
(E F
)F G
{   	
List!! 
<!! 
LeaveInformation!! !
>!!! "

leavesInfo!!# -
=!!. /
null!!0 4
;!!4 5
using"" 
("" 
var"" 

connection"" !
=""" #
await""$ )
base""* .
."". /
CreateConnection""/ ?
(""? @
DbSchema""@ H
.""H I
PORTAL""I O
)""O P
)""P Q
{## 
OracleDynamicParameters$$ '

parameters$$( 2
=$$3 4
new$$5 8#
OracleDynamicParameters$$9 P
($$P Q
)$$Q R
;$$R S

parameters%% 
.%% 
Add%% 
(%% 
name%% #
:%%# $
$str%%% .
,%%. /
dbType%%0 6
:%%6 7
OracleMappingType%%8 I
.%%I J
	RefCursor%%J S
,%%S T
	direction%%U ^
:%%^ _
ParameterDirection%%` r
.%%r s
Output%%s y
)%%y z
;%%z {

leavesInfo&& 
=&& 
(&& 
await&& #

connection&&$ .
.&&. /

QueryAsync&&/ 9
<&&9 :
LeaveInformation&&: J
>&&J K
(&&K L
DatabaseProcedures&&L ^
.&&^ _!
GET_LEAVE_INFORMATION&&_ t
,&&t u

parameters	&&v �
,
&&� �
commandType
&&� �
:
&&� �
CommandType
&&� �
.
&&� �
StoredProcedure
&&� �
)
&&� �
)
&&� �
.
&&� �
ToList
&&� �
(
&&� �
)
&&� �
;
&&� �

leavesInfo'' 
='' 

leavesInfo'' '
.''' (
OrderByDescending''( 9
(''9 :
x'': ;
=>''< >
x''? @
.''@ A 
LeaveInformationName''A U
)''U V
.''V W
ToList''W ]
(''] ^
)''^ _
;''_ `
}(( 
return)) 

leavesInfo)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, "
UpdateLeaveInformation,,  6
(,,6 7#
LeaveInformationSaveReq,,7 N
leaveInformation,,O _
),,_ `
{-- 	
bool.. 
isSaved.. 
=.. 
false..  
;..  !#
OracleDynamicParameters// #

parameters//$ .
=/// 0
null//1 5
;//5 6
int00 
rowsUpdated00 
=00 
$num00 
;00  
using11 
(11 


connection11! +
=11, -
await11. 3
base114 8
.118 9
CreateConnection119 I
(11I J
DbSchema11J R
.11R S
PORTAL11S Y
)11Y Z
)11Z [
{22 

parameters44 
=44 
new44  #
OracleDynamicParameters44! 8
(448 9
)449 :
;44: ;

parameters55 
.55 
Add55 
(55 
name55 #
:55# $
$str55% <
,55< =
leaveInformation55> N
.55N O
LeaveInformationID55O a
,55a b
dbType55c i
:55i j
OracleMappingType55k |
.55| }
Int32	55} �
,
55� �
	direction
55� �
:
55� � 
ParameterDirection
55� �
.
55� �
Input
55� �
)
55� �
;
55� �

parameters66 
.66 
Add66 
(66 
name66 #
:66# $
$str66% >
,66> ?
leaveInformation66@ P
.66P Q 
LeaveInformationName66Q e
,66e f
dbType66g m
:66m n
OracleMappingType	66o �
.
66� �
Varchar2
66� �
,
66� �
	direction
66� �
:
66� � 
ParameterDirection
66� �
.
66� �
Input
66� �
)
66� �
;
66� �

parameters77 
.77 
Add77 
(77 
name77 #
:77# $
$str77% 5
,775 6
leaveInformation777 G
.77G H
LeaveTypeID77H S
,77S T
dbType77U [
:77[ \
OracleMappingType77] n
.77n o
Int3277o t
,77t u
	direction77v 
:	77 � 
ParameterDirection
77� �
.
77� �
Input
77� �
)
77� �
;
77� �

parameters88 
.88 
Add88 
(88 
name88 #
:88# $
$str88% 7
,887 8
leaveInformation889 I
.88I J

,88W X
dbType88Y _
:88_ `
OracleMappingType88a r
.88r s
Int3288s x
,88x y
	direction	88z �
:
88� � 
ParameterDirection
88� �
.
88� �
Input
88� �
)
88� �
;
88� �

parameters99 
.99 
Add99 
(99 
name99 #
:99# $
$str99% 8
,998 9
leaveInformation99: J
.99J K
OfficeTypeSlno99K Y
,99Y Z
dbType99[ a
:99a b
OracleMappingType99c t
.99t u
Int3299u z
,99z {
	direction	99| �
:
99� � 
ParameterDirection
99� �
.
99� �
Input
99� �
)
99� �
;
99� �

parameters:: 
.:: 
Add:: 
(:: 
name:: #
:::# $
$str::% 3
,::3 4
leaveInformation::5 E
.::E F

BranchSlno::F P
,::P Q
dbType::R X
:::X Y
OracleMappingType::Z k
.::k l
Int32::l q
,::q r
	direction::s |
:::| }
ParameterDirection	::~ �
.
::� �
Input
::� �
)
::� �
;
::� �

parameters;; 
.;; 
Add;; 
(;; 
name;; #
:;;# $
$str;;% 1
,;;1 2
leaveInformation;;3 C
.;;C D
StatusID;;D L
,;;L M
dbType;;N T
:;;T U
OracleMappingType;;V g
.;;g h
Int16;;h m
,;;m n
	direction;;o x
:;;x y
ParameterDirection	;;z �
.
;;� �
Input
;;� �
)
;;� �
;
;;� �
rowsUpdated<< 
=<< 
await<< #

connection<<$ .
.<<. /
ExecuteAsync<</ ;
(<<; <
DatabaseProcedures<<< N
.<<N O&
SP_UPDATE_LEAVE_INFOMATION<<O i
,<<i j

parameters<<k u
,<<u v
commandType	<<w �
:
<<� �
CommandType
<<� �
.
<<� �
StoredProcedure
<<� �
)
<<� �
;
<<� �
}== 
isSaved>> 
=>> 
(>> 
rowsUpdated>> "
*>># $
->>% &
$num>>& '
)>>' (
>>>) *
$num>>+ ,
;>>, -
return?? 
isSaved?? 
;?? 
}@@ 	
privateAA 
DateTimeAA 
CreatedDateAA $
=AA% &
DateTimeAA' /
.AA/ 0
NowAA0 3
;AA3 4
publicBB 
asyncBB 
TaskBB 
<BB 
boolBB 
>BB !
SavedLeaveInformationBB  5
(BB5 6#
LeaveInformationSaveReqBB6 M
leaveInformationBBN ^
)BB^ _
{CC 	
boolEE 
isSavedEE 
=EE 
falseEE "
;EE" ##
OracleDynamicParametersFF #

parametersFF$ .
=FF/ 0
nullFF1 5
;FF5 6
intGG 
rowsInsertedGG 
=GG 
$numGG  
;GG  !
usingII 
(II 


connectionII! +
=II, -
awaitII. 3
baseII4 8
.II8 9
CreateConnectionII9 I
(III J
DbSchemaIIJ R
.IIR S
PORTALIIS Y
)IIY Z
)IIZ [
{JJ 

parametersKK 
=KK 
newKK  #
OracleDynamicParametersKK! 8
(KK8 9
)KK9 :
;KK: ;

parametersLL 
.LL 
AddLL 
(LL 
nameLL #
:LL# $
$strLL% >
,LL> ?
leaveInformationLL@ P
.LLP Q 
LeaveInformationNameLLQ e
,LLe f
dbTypeLLg m
:LLm n
OracleMappingType	LLo �
.
LL� �
Varchar2
LL� �
,
LL� �
	direction
LL� �
:
LL� � 
ParameterDirection
LL� �
.
LL� �
Input
LL� �
)
LL� �
;
LL� �

parametersMM 
.MM 
AddMM 
(MM 
nameMM #
:MM# $
$strMM% 5
,MM5 6
leaveInformationMM7 G
.MMG H
LeaveTypeIDMMH S
,MMS T
dbTypeMMU [
:MM[ \
OracleMappingTypeMM] n
.MMn o
Int32MMo t
,MMt u
	directionMMv 
:	MM � 
ParameterDirection
MM� �
.
MM� �
Input
MM� �
)
MM� �
;
MM� �

parametersNN 
.NN 
AddNN 
(NN 
nameNN #
:NN# $
$strNN% 7
,NN7 8
leaveInformationNN9 I
.NNI J

,NNW X
dbTypeNNY _
:NN_ `
OracleMappingTypeNNa r
.NNr s
Int32NNs x
,NNx y
	direction	NNz �
:
NN� � 
ParameterDirection
NN� �
.
NN� �
Input
NN� �
)
NN� �
;
NN� �

parametersOO 
.OO 
AddOO 
(OO 
nameOO #
:OO# $
$strOO% 8
,OO8 9
leaveInformationOO: J
.OOJ K
OfficeTypeSlnoOOK Y
,OOY Z
dbTypeOO[ a
:OOa b
OracleMappingTypeOOc t
.OOt u
Int32OOu z
,OOz {
	direction	OO| �
:
OO� � 
ParameterDirection
OO� �
.
OO� �
Input
OO� �
)
OO� �
;
OO� �

parametersPP 
.PP 
AddPP 
(PP 
namePP #
:PP# $
$strPP% 3
,PP3 4
leaveInformationPP5 E
.PPE F

BranchSlnoPPF P
,PPP Q
dbTypePPR X
:PPX Y
OracleMappingTypePPZ k
.PPk l
Int32PPl q
,PPq r
	directionPPs |
:PP| }
ParameterDirection	PP~ �
.
PP� �
Input
PP� �
)
PP� �
;
PP� �

parametersQQ 
.QQ 
AddQQ 
(QQ 
nameQQ #
:QQ# $
$strQQ% 1
,QQ1 2
leaveInformationQQ3 C
.QQC D
StatusIDQQD L
,QQL M
dbTypeQQN T
:QQT U
OracleMappingTypeQQV g
.QQg h
Int16QQh m
,QQm n
	directionQQo x
:QQx y
ParameterDirection	QQz �
.
QQ� �
Input
QQ� �
)
QQ� �
;
QQ� �
rowsInsertedRR 
=RR 
awaitRR $

connectionRR% /
.RR/ 0
ExecuteAsyncRR0 <
(RR< =
DatabaseProceduresRR= O
.RRO P&
SP_INSERT_LEAVE_INFOMATIONRRP j
,RRj k

parametersRRl v
,RRv w
commandType	RRx �
:
RR� �
CommandType
RR� �
.
RR� �
StoredProcedure
RR� �
)
RR� �
;
RR� �
}SS 
isSavedTT 
=TT 
(TT 
rowsInsertedTT #
*TT$ %
-TT& '
$numTT' (
)TT( )
>TT* +
$numTT, -
;TT- .
returnUU 
isSavedUU 
;UU 
}VV 	
publicWW 
asyncWW 
TaskWW 
<WW 
boolWW 
>WW "
DeleteLeaveInformationWW  6
(WW6 7
intWW7 :
leaveInformationIdWW; M
)WWM N
{XX 	
boolYY 
isSavedYY 
=YY 
falseYY  
;YY  !#
OracleDynamicParametersZZ #

parametersZZ$ .
=ZZ/ 0
nullZZ1 5
;ZZ5 6
int[[ 
rowsDeleted[[ 
=[[ 
$num[[ 
;[[  
using\\ 
(\\ 


connection\\! +
=\\, -
await\\. 3
base\\4 8
.\\8 9
CreateConnection\\9 I
(\\I J
DbSchema\\J R
.\\R S
PORTAL\\S Y
)\\Y Z
)\\Z [
{]] 

parameters__ 
=__ 
new__  #
OracleDynamicParameters__! 8
(__8 9
)__9 :
;__: ;

parameters`` 
.`` 
Add`` 
(`` 
name`` #
:``# $
$str``% <
,``< =
leaveInformationId``> P
,``P Q
dbType``R X
:``X Y
OracleMappingType``Z k
.``k l
Int32``l q
,``q r
	direction``s |
:``| }
ParameterDirection	``~ �
.
``� �
Input
``� �
)
``� �
;
``� �
rowsDeletedaa 
=aa 
awaitaa #

connectionaa$ .
.aa. /
ExecuteAsyncaa/ ;
(aa; <
DatabaseProceduresaa< N
.aaN O&
SP_DELETE_LEAVE_INFOMATIONaaO i
,aai j

parametersaak u
,aau v
commandType	aaw �
:
aa� �
CommandType
aa� �
.
aa� �
StoredProcedure
aa� �
)
aa� �
;
aa� �
}bb 
isSavedcc 
=cc 
(cc 
rowsDeletedcc "
*cc# $
-cc% &
$numcc& '
)cc' (
>cc) *
$numcc+ ,
;cc, -
returndd 
isSaveddd 
;dd 
}ee 	
publicff 
asyncff 
Taskff 
<ff 
Listff 
<ff  
LeaveTypeInformationff 3
>ff3 4
>ff4 5$
GetLeaveInformationByOfcff6 N
(ffN O
intffO R
officeTypeSlnoffS a
,ffa b
intffc f
?fff g

branchSlnoffh r
)ffr s
{gg 	
Listhh 
<hh  
LeaveTypeInformationhh %
>hh% &

leavesInfohh' 1
=hh2 3
nullhh4 8
;hh8 9
usingii 
(ii 
varii 

connectionii !
=ii" #
awaitii$ )
baseii* .
.ii. /
CreateConnectionii/ ?
(ii? @
DbSchemaii@ H
.iiH I
PORTALiiI O
)iiO P
)iiP Q
{jj 
OracleDynamicParameterskk '

parameterskk( 2
=kk3 4
newkk5 8#
OracleDynamicParameterskk9 P
(kkP Q
)kkQ R
;kkR S

parametersll 
.ll 
Addll 
(ll 
namell #
:ll# $
$strll% 6
,ll6 7
officeTypeSlnoll8 F
,llF G
dbTypellH N
:llN O
OracleMappingTypellP a
.lla b
Int32llb g
,llg h
	directionlli r
:llr s
ParameterDirection	llt �
.
ll� �
Input
ll� �
)
ll� �
;
ll� �

parametersmm 
.mm 
Addmm 
(mm 
namemm #
:mm# $
$strmm% 2
,mm2 3

branchSlnomm4 >
,mm> ?
dbTypemm@ F
:mmF G
OracleMappingTypemmH Y
.mmY Z
Int32mmZ _
,mm_ `
	directionmma j
:mmj k
ParameterDirectionmml ~
.mm~ 
Input	mm �
)
mm� �
;
mm� �

parametersnn 
.nn 
Addnn 
(nn 
namenn #
:nn# $
$strnn% .
,nn. /
dbTypenn0 6
:nn6 7
OracleMappingTypenn8 I
.nnI J
	RefCursornnJ S
,nnS T
	directionnnU ^
:nn^ _
ParameterDirectionnn` r
.nnr s
Outputnns y
)nny z
;nnz {

leavesInfooo 
=oo 
(oo 
awaitoo #

connectionoo$ .
.oo. /

QueryAsyncoo/ 9
<oo9 : 
LeaveTypeInformationoo: N
>ooN O
(ooO P
DatabaseProceduresooP b
.oob c%
SP_GET_LEAVE_TYPES_BY_OFCooc |
,oo| }

parameters	oo~ �
,
oo� �
commandType
oo� �
:
oo� �
CommandType
oo� �
.
oo� �
StoredProcedure
oo� �
)
oo� �
)
oo� �
.
oo� �
ToList
oo� �
(
oo� �
)
oo� �
;
oo� �

leavesInfopp 
=pp 

leavesInfopp '
.pp' (
OrderByDescendingpp( 9
(pp9 :
xpp: ;
=>pp< >
xpp? @
.pp@ A
LeaveInformationIdppA S
)ppS T
.ppT U
ToListppU [
(pp[ \
)pp\ ]
;pp] ^
}qq 
returnrr 

leavesInforr 
;rr 
}ss 	
}tt 
}uu ��
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\LeavePolicyInformationRepositorycs.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Administration& 4
{ 
public 

class .
"LeavePolicyInformationRepositorycs 3
:4 5
BaseRepository6 D
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public .
"LeavePolicyInformationRepositorycs 1
(1 2
IConfiguration2 @

,N O
IDistributedCacheP a

redisCacheb l
)l m
: 
base 
( 

)  !
{ 	
this 
. 

=  

;. /
this 
. 

redisCache 
= 

redisCache (
;( )
}   	
public"" 
async"" 
Task"" 
<"" 
List"" 
<"" "
LeavePolicyInformation"" 5
>""5 6
>""6 7%
GetLeavePolicyInformation""8 Q
(""Q R
)""R S
{## 	
List$$ 
<$$ "
LeavePolicyInformation$$ '
>$$' (
	empLeaves$$) 2
=$$3 4
null$$5 9
;$$9 :
using%% 
(%% 
var%% 

connection%% !
=%%" #
await%%$ )
base%%* .
.%%. /
CreateConnection%%/ ?
(%%? @
DbSchema%%@ H
.%%H I
PORTAL%%I O
)%%O P
)%%P Q
{&& 
OracleDynamicParameters'' '

parameters''( 2
=''3 4
new''5 8#
OracleDynamicParameters''9 P
(''P Q
)''Q R
;''R S

parameters(( 
.(( 
Add(( 
((( 
name(( #
:((# $
$str((% .
,((. /
dbType((0 6
:((6 7
OracleMappingType((8 I
.((I J
	RefCursor((J S
,((S T
	direction((U ^
:((^ _
ParameterDirection((` r
.((r s
Output((s y
)((y z
;((z {
	empLeaves)) 
=)) 
()) 
await)) "

connection))# -
.))- .

QueryAsync)). 8
<))8 9"
LeavePolicyInformation))9 O
>))O P
())P Q
DatabaseProcedures))Q c
.))c d)
GET_LEAVE_POLICY_INFORMATION	))d �
,
))� �

parameters
))� �
,
))� �
commandType
))� �
:
))� �
CommandType
))� �
.
))� �
StoredProcedure
))� �
)
))� �
)
))� �
.
))� �
ToList
))� �
(
))� �
)
))� �
;
))� �
	empLeaves** 
=** 
	empLeaves** %
.**% &
OrderByDescending**& 7
(**7 8
x**8 9
=>**: <
x**= >
.**> ?

PolicyName**? I
)**I J
.**J K
ToList**K Q
(**Q R
)**R S
;**S T
}++ 
return,, 
	empLeaves,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
bool// 
>// &
SaveLeavePolicyInformation//  :
(//: ;"
LeavePolicyInformation//; Q)
leavePolicyInformationDetails//R o
)//o p
{00 	
bool11 
isSaved11 
=11 
false11  
;11  !#
OracleDynamicParameters33 #

parameters33$ .
=33/ 0
null331 5
;335 6
int44 
rowInserted44 
=44 
$num44 
;44  
using55 
(55 


connection55! +
=55, -
await55. 3
base554 8
.558 9
CreateConnection559 I
(55I J
DbSchema55J R
.55R S
PORTAL55S Y
)55Y Z
)55Z [
{66 

parameters77 
=77 
new77  #
OracleDynamicParameters77! 8
(778 9
)779 :
;77: ;

parameters88 
.88 
Add88 
(88 
name88 #
:88# $
$str88% 3
,883 4)
leavePolicyInformationDetails885 R
.88R S

PolicyName88S ]
,88] ^
dbType88_ e
:88e f
OracleMappingType88g x
.88x y
Varchar2	88y �
,
88� �
	direction
88� �
:
88� � 
ParameterDirection
88� �
.
88� �
Input
88� �
)
88� �
;
88� �

parameters99 
.99 
Add99 
(99 
name99 #
:99# $
$str99% 3
,993 4)
leavePolicyInformationDetails995 R
.99R S

LowerBound99S ]
,99] ^
dbType99_ e
:99e f
OracleMappingType99g x
.99x y
Int3299y ~
,99~ 
	direction
99� �
:
99� � 
ParameterDirection
99� �
.
99� �
Input
99� �
)
99� �
;
99� �

parameters:: 
.:: 
Add:: 
(:: 
name:: #
:::# $
$str::% 3
,::3 4)
leavePolicyInformationDetails::5 R
.::R S

UpperBound::S ]
,::] ^
dbType::_ e
:::e f
OracleMappingType::g x
.::x y
Int32::y ~
,::~ 
	direction
::� �
:
::� � 
ParameterDirection
::� �
.
::� �
Input
::� �
)
::� �
;
::� �

parameters;; 
.;; 
Add;; 
(;; 
name;; #
:;;# $
$str;;% 9
,;;9 :)
leavePolicyInformationDetails;;; X
.;;X Y
ApplyBeForeDays;;Y h
,;;h i
dbType;;j p
:;;p q
OracleMappingType	;;r �
.
;;� �
Int32
;;� �
,
;;� �
	direction
;;� �
:
;;� � 
ParameterDirection
;;� �
.
;;� �
Input
;;� �
)
;;� �
;
;;� �

parameters<< 
.<< 
Add<< 
(<< 
name<< #
:<<# $
$str<<% <
,<<< =)
leavePolicyInformationDetails<<> [
.<<[ \
MaxConcecutiveDays<<\ n
,<<n o
dbType<<p v
:<<v w
OracleMappingType	<<x �
.
<<� �
Int32
<<� �
,
<<� �
	direction
<<� �
:
<<� � 
ParameterDirection
<<� �
.
<<� �
Input
<<� �
)
<<� �
;
<<� �

parameters== 
.== 
Add== 
(== 
name== #
:==# $
$str==% C
,==C D)
leavePolicyInformationDetails==E b
.==b c%
AllowAfter_MaxConcecutive==c |
,==| }
dbType	==~ �
:
==� �
OracleMappingType
==� �
.
==� �
Int32
==� �
,
==� �
	direction
==� �
:
==� � 
ParameterDirection
==� �
.
==� �
Input
==� �
)
==� �
;
==� �

parameters>> 
.>> 
Add>> 
(>> 
name>> #
:>># $
$str>>% 4
,>>4 5)
leavePolicyInformationDetails>>6 S
.>>S T
AccrualRate>>T _
,>>_ `
dbType>>a g
:>>g h
OracleMappingType>>i z
.>>z {
Int32	>>{ �
,
>>� �
	direction
>>� �
:
>>� � 
ParameterDirection
>>� �
.
>>� �
Input
>>� �
)
>>� �
;
>>� �

parameters?? 
.?? 
Add?? 
(?? 
name?? #
:??# $
$str??% 8
,??8 9)
leavePolicyInformationDetails??: W
.??W X
NeedCertificate??X g
,??g h
dbType??i o
:??o p
OracleMappingType	??q �
.
??� �
Int32
??� �
,
??� �
	direction
??� �
:
??� � 
ParameterDirection
??� �
.
??� �
Input
??� �
)
??� �
;
??� �

parameters@@ 
.@@ 
Add@@ 
(@@ 
name@@ #
:@@# $
$str@@% B
,@@B C)
leavePolicyInformationDetails@@D a
.@@a b$
ConsiderWeekendsHolidays@@b z
,@@z {
dbType	@@| �
:
@@� �
OracleMappingType
@@� �
.
@@� �
Int32
@@� �
,
@@� �
	direction
@@� �
:
@@� � 
ParameterDirection
@@� �
.
@@� �
Input
@@� �
)
@@� �
;
@@� �

parametersAA 
.AA 
AddAA 
(AA 
nameAA #
:AA# $
$strAA% 5
,AA5 6)
leavePolicyInformationDetailsAA7 T
.AAT U
MaximumUsageAAU a
,AAa b
dbTypeAAc i
:AAi j
OracleMappingTypeAAk |
.AA| }
Int32	AA} �
,
AA� �
	direction
AA� �
:
AA� � 
ParameterDirection
AA� �
.
AA� �
Input
AA� �
)
AA� �
;
AA� �

parametersBB 
.BB 
AddBB 
(BB 
nameBB #
:BB# $
$strBB% @
,BB@ A)
leavePolicyInformationDetailsBBB _
.BB_ ` 
CanBeMergedWithOtherBB` t
,BBt u
dbTypeBBv |
:BB| }
OracleMappingType	BB~ �
.
BB� �
Int32
BB� �
,
BB� �
	direction
BB� �
:
BB� � 
ParameterDirection
BB� �
.
BB� �
Input
BB� �
)
BB� �
;
BB� �

parametersCC 
.CC 
AddCC 
(CC 
nameCC #
:CC# $
$strCC% 5
,CC5 6)
leavePolicyInformationDetailsCC7 T
.CCT U
ApplicableToCCU a
,CCa b
dbTypeCCc i
:CCi j
OracleMappingTypeCCk |
.CC| }
Int32	CC} �
,
CC� �
	direction
CC� �
:
CC� � 
ParameterDirection
CC� �
.
CC� �
Input
CC� �
)
CC� �
;
CC� �

parametersDD 
.DD 
AddDD 
(DD 
nameDD #
:DD# $
$strDD% :
,DD: ;)
leavePolicyInformationDetailsDD< Y
.DDY Z
CanApplyHalfDayDDZ i
,DDi j
dbTypeDDk q
:DDq r
OracleMappingType	DDs �
.
DD� �
Int32
DD� �
,
DD� �
	direction
DD� �
:
DD� � 
ParameterDirection
DD� �
.
DD� �
Input
DD� �
)
DD� �
;
DD� �

parametersEE 
.EE 
AddEE 
(EE 
nameEE #
:EE# $
$strEE% 1
,EE1 2)
leavePolicyInformationDetailsEE3 P
.EEP Q
StatusIDEEQ Y
,EEY Z
dbTypeEE[ a
:EEa b
OracleMappingTypeEEc t
.EEt u
Int32EEu z
,EEz {
	direction	EE| �
:
EE� � 
ParameterDirection
EE� �
.
EE� �
Input
EE� �
)
EE� �
;
EE� �

parametersFF 
.FF 
AddFF 
(FF 
nameFF #
:FF# $
$strFF% /
,FF/ 0)
leavePolicyInformationDetailsFF1 N
.FFN O

RowversionFFO Y
,FFY Z
dbTypeFF[ a
:FFa b
OracleMappingTypeFFc t
.FFt u
Int32FFu z
,FFz {
	direction	FF| �
:
FF� � 
ParameterDirection
FF� �
.
FF� �
Input
FF� �
)
FF� �
;
FF� �
rowInsertedGG 
=GG 
awaitGG #

connectionGG$ .
.GG. /
ExecuteAsyncGG/ ;
(GG; <
DatabaseProceduresGG< N
.GGN O'
SP_INSERT_POLICY_INFOMATIONGGO j
,GGj k

parametersGGl v
,GGv w
commandType	GGx �
:
GG� �
CommandType
GG� �
.
GG� �
StoredProcedure
GG� �
)
GG� �
;
GG� �
}HH 
isSavedII 
=II 
(II 
rowInsertedII "
*II# $
-II% &
$numII& '
)II' (
>II) *
$numII+ ,
;II, -
returnJJ 
isSavedJJ 
;JJ 
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
boolMM 
>MM (
UpdateLeavePolicyInformationMM  <
(MM< =%
LeavePolicyInformationReqMM= V)
leavePolicyInformationDetailsMMW t
)MMt u
{NN 	
boolOO 
isSavedOO 
=OO 
falseOO  
;OO  !#
OracleDynamicParametersPP #

parametersPP$ .
=PP/ 0
nullPP1 5
;PP5 6
intQQ 
rowsUpdatedQQ 
=QQ 
$numQQ 
;QQ  
usingRR 
(RR 


connectionRR! +
=RR, -
awaitRR. 3
baseRR4 8
.RR8 9
CreateConnectionRR9 I
(RRI J
DbSchemaRRJ R
.RRR S
PORTALRRS Y
)RRY Z
)RRZ [
{SS 

parametersUU 
=UU 
newUU  #
OracleDynamicParametersUU! 8
(UU8 9
)UU9 :
;UU: ;

parametersVV 
.VV 
AddVV 
(VV 
nameVV #
:VV# $
$strVV% 1
,VV1 2)
leavePolicyInformationDetailsVV3 P
.VVP Q
PolicyIDVVQ Y
,VVY Z
dbTypeVV[ a
:VVa b
OracleMappingTypeVVc t
.VVt u
Int32VVu z
,VVz {
	direction	VV| �
:
VV� � 
ParameterDirection
VV� �
.
VV� �
Input
VV� �
)
VV� �
;
VV� �

parametersWW 
.WW 
AddWW 
(WW 
nameWW #
:WW# $
$strWW% 3
,WW3 4)
leavePolicyInformationDetailsWW5 R
.WWR S

PolicyNameWWS ]
,WW] ^
dbTypeWW_ e
:WWe f
OracleMappingTypeWWg x
.WWx y
Varchar2	WWy �
,
WW� �
	direction
WW� �
:
WW� � 
ParameterDirection
WW� �
.
WW� �
Input
WW� �
)
WW� �
;
WW� �

parametersXX 
.XX 
AddXX 
(XX 
nameXX #
:XX# $
$strXX% 3
,XX3 4)
leavePolicyInformationDetailsXX5 R
.XXR S

LowerBoundXXS ]
,XX] ^
dbTypeXX_ e
:XXe f
OracleMappingTypeXXg x
.XXx y
Int32XXy ~
,XX~ 
	direction
XX� �
:
XX� � 
ParameterDirection
XX� �
.
XX� �
Input
XX� �
)
XX� �
;
XX� �

parametersYY 
.YY 
AddYY 
(YY 
nameYY #
:YY# $
$strYY% 3
,YY3 4)
leavePolicyInformationDetailsYY5 R
.YYR S

UpperBoundYYS ]
,YY] ^
dbTypeYY_ e
:YYe f
OracleMappingTypeYYg x
.YYx y
Int32YYy ~
,YY~ 
	direction
YY� �
:
YY� � 
ParameterDirection
YY� �
.
YY� �
Input
YY� �
)
YY� �
;
YY� �

parametersZZ 
.ZZ 
AddZZ 
(ZZ 
nameZZ #
:ZZ# $
$strZZ% 9
,ZZ9 :)
leavePolicyInformationDetailsZZ; X
.ZZX Y
ApplyBeForeDaysZZY h
,ZZh i
dbTypeZZj p
:ZZp q
OracleMappingType	ZZr �
.
ZZ� �
Int32
ZZ� �
,
ZZ� �
	direction
ZZ� �
:
ZZ� � 
ParameterDirection
ZZ� �
.
ZZ� �
Input
ZZ� �
)
ZZ� �
;
ZZ� �

parameters[[ 
.[[ 
Add[[ 
([[ 
name[[ #
:[[# $
$str[[% <
,[[< =)
leavePolicyInformationDetails[[> [
.[[[ \
MaxConcecutiveDays[[\ n
,[[n o
dbType[[p v
:[[v w
OracleMappingType	[[x �
.
[[� �
Int32
[[� �
,
[[� �
	direction
[[� �
:
[[� � 
ParameterDirection
[[� �
.
[[� �
Input
[[� �
)
[[� �
;
[[� �

parameters\\ 
.\\ 
Add\\ 
(\\ 
name\\ #
:\\# $
$str\\% C
,\\C D)
leavePolicyInformationDetails\\E b
.\\b c%
AllowAfter_MaxConcecutive\\c |
,\\| }
dbType	\\~ �
:
\\� �
OracleMappingType
\\� �
.
\\� �
Int32
\\� �
,
\\� �
	direction
\\� �
:
\\� � 
ParameterDirection
\\� �
.
\\� �
Input
\\� �
)
\\� �
;
\\� �

parameters]] 
.]] 
Add]] 
(]] 
name]] #
:]]# $
$str]]% 4
,]]4 5)
leavePolicyInformationDetails]]6 S
.]]S T
AccrualRate]]T _
,]]_ `
dbType]]a g
:]]g h
OracleMappingType]]i z
.]]z {
Int32	]]{ �
,
]]� �
	direction
]]� �
:
]]� � 
ParameterDirection
]]� �
.
]]� �
Input
]]� �
)
]]� �
;
]]� �

parameters^^ 
.^^ 
Add^^ 
(^^ 
name^^ #
:^^# $
$str^^% 8
,^^8 9)
leavePolicyInformationDetails^^: W
.^^W X
NeedCertificate^^X g
,^^g h
dbType^^i o
:^^o p
OracleMappingType	^^q �
.
^^� �
Int32
^^� �
,
^^� �
	direction
^^� �
:
^^� � 
ParameterDirection
^^� �
.
^^� �
Input
^^� �
)
^^� �
;
^^� �

parameters__ 
.__ 
Add__ 
(__ 
name__ #
:__# $
$str__% B
,__B C)
leavePolicyInformationDetails__D a
.__a b$
ConsiderWeekendsHolidays__b z
,__z {
dbType	__| �
:
__� �
OracleMappingType
__� �
.
__� �
Int32
__� �
,
__� �
	direction
__� �
:
__� � 
ParameterDirection
__� �
.
__� �
Input
__� �
)
__� �
;
__� �

parameters`` 
.`` 
Add`` 
(`` 
name`` #
:``# $
$str``% @
,``@ A)
leavePolicyInformationDetails``B _
.``_ ` 
CanBeMergedWithOther``` t
,``t u
dbType``v |
:``| }
OracleMappingType	``~ �
.
``� �
Int32
``� �
,
``� �
	direction
``� �
:
``� � 
ParameterDirection
``� �
.
``� �
Input
``� �
)
``� �
;
``� �

parametersaa 
.aa 
Addaa 
(aa 
nameaa #
:aa# $
$straa% 5
,aa5 6)
leavePolicyInformationDetailsaa7 T
.aaT U
MaximumUsageaaU a
,aaa b
dbTypeaac i
:aai j
OracleMappingTypeaak |
.aa| }
Int32	aa} �
,
aa� �
	direction
aa� �
:
aa� � 
ParameterDirection
aa� �
.
aa� �
Input
aa� �
)
aa� �
;
aa� �

parametersbb 
.bb 
Addbb 
(bb 
namebb #
:bb# $
$strbb% 5
,bb5 6)
leavePolicyInformationDetailsbb7 T
.bbT U
ApplicableTobbU a
,bba b
dbTypebbc i
:bbi j
OracleMappingTypebbk |
.bb| }
Int32	bb} �
,
bb� �
	direction
bb� �
:
bb� � 
ParameterDirection
bb� �
.
bb� �
Input
bb� �
)
bb� �
;
bb� �

parameterscc 
.cc 
Addcc 
(cc 
namecc #
:cc# $
$strcc% :
,cc: ;)
leavePolicyInformationDetailscc< Y
.ccY Z
CanApplyHalfDayccZ i
,cci j
dbTypecck q
:ccq r
OracleMappingType	ccs �
.
cc� �
Int32
cc� �
,
cc� �
	direction
cc� �
:
cc� � 
ParameterDirection
cc� �
.
cc� �
Input
cc� �
)
cc� �
;
cc� �

parametersdd 
.dd 
Adddd 
(dd 
namedd #
:dd# $
$strdd% 1
,dd1 2)
leavePolicyInformationDetailsdd3 P
.ddP Q
StatusIDddQ Y
,ddY Z
dbTypedd[ a
:dda b
OracleMappingTypeddc t
.ddt u
Int32ddu z
,ddz {
	direction	dd| �
:
dd� � 
ParameterDirection
dd� �
.
dd� �
Input
dd� �
)
dd� �
;
dd� �

parametersee 
.ee 
Addee 
(ee 
nameee #
:ee# $
$stree% /
,ee/ 0)
leavePolicyInformationDetailsee1 N
.eeN O

RowversioneeO Y
,eeY Z
dbTypeee[ a
:eea b
OracleMappingTypeeec t
.eet u
Int32eeu z
,eez {
	direction	ee| �
:
ee� � 
ParameterDirection
ee� �
.
ee� �
Input
ee� �
)
ee� �
;
ee� �
rowsUpdatedgg 
=gg 
awaitgg #

connectiongg$ .
.gg. /
ExecuteAsyncgg/ ;
(gg; <
DatabaseProceduresgg< N
.ggN O'
SP_UPDATE_POLICY_INFOMATIONggO j
,ggj k

parametersggl v
,ggv w
commandType	ggx �
:
gg� �
CommandType
gg� �
.
gg� �
StoredProcedure
gg� �
)
gg� �
;
gg� �
}ii 
isSavedjj 
=jj 
(jj 
rowsUpdatedjj "
*jj# $
-jj% &
$numjj& '
)jj' (
>jj) *
$numjj+ ,
;jj, -
returnkk 
isSavedkk 
;kk 
}ll 	
publicmm 
asyncmm 
Taskmm 
<mm 
boolmm 
>mm (
DeleteLeavePolicyInformationmm  <
(mm< =
intmm= @
policyIDmmA I
)mmI J
{nn 	
booloo 
isSavedoo 
=oo 
falseoo  
;oo  !#
OracleDynamicParameterspp #

parameterspp$ .
=pp/ 0
nullpp1 5
;pp5 6
intqq 
rowsDeletedqq 
=qq 
$numqq 
;qq  
usingrr 
(rr 


connectionrr! +
=rr, -
awaitrr. 3
baserr4 8
.rr8 9
CreateConnectionrr9 I
(rrI J
DbSchemarrJ R
.rrR S
PORTALrrS Y
)rrY Z
)rrZ [
{ss 

parametersuu 
=uu 
newuu  #
OracleDynamicParametersuu! 8
(uu8 9
)uu9 :
;uu: ;

parametersvv 
.vv 
Addvv 
(vv 
namevv #
:vv# $
$strvv% 1
,vv1 2
policyIDvv3 ;
,vv; <
dbTypevv= C
:vvC D
OracleMappingTypevvE V
.vvV W
Int32vvW \
,vv\ ]
	directionvv^ g
:vvg h
ParameterDirectionvvi {
.vv{ |
Input	vv| �
)
vv� �
;
vv� �
rowsDeletedww 
=ww 
awaitww #

connectionww$ .
.ww. /
ExecuteAsyncww/ ;
(ww; <
DatabaseProceduresww< N
.wwN O'
SP_DELETE_POLICY_INFOMATIONwwO j
,wwj k

parameterswwl v
,wwv w
commandType	wwx �
:
ww� �
CommandType
ww� �
.
ww� �
StoredProcedure
ww� �
)
ww� �
;
ww� �
}xx 
isSavedyy 
=yy 
(yy 
rowsDeletedyy "
*yy# $
-yy% &
$numyy& '
)yy' (
>yy) *
$numyy+ ,
;yy, -
returnzz 
isSavedzz 
;zz 
}{{ 	
}~~ 
} �7
gF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\ModuleInformationRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Administration& 4
{ 
public 

class '
ModuleInformationRepository ,
:- .
BaseRepository/ =
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public '
ModuleInformationRepository *
(* +
IConfiguration+ 9

,G H
IDistributedCacheI Z

redisCache[ e
)e f
: 
base 
( 

)  !
{ 	
this 
. 

=  

;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
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
>!!  
modules!!! (
=!!) *
new!!+ .
List!!/ 3
<!!3 4
SecurityModule!!4 B
>!!B C
(!!C D
)!!D E
;!!E F
List"" 
<"" 
ScreenInformation"" "
>""" #
screenInformations""$ 6
=""7 8
null""9 =
;""= >
using## 
(## 
var## 

connection## !
=##" #
await##$ )
CreateConnection##* :
(##: ;
DbSchema##; C
.##C D
PORTAL##D J
)##J K
)##K L
{$$ 
OracleDynamicParameters%% '
	parmeters%%( 1
=%%2 3
new%%4 7#
OracleDynamicParameters%%8 O
(%%O P
)%%P Q
;%%Q R
	parmeters&& 
.&& 
Add&& 
(&& 
name&& "
:&&" #
$str&&$ -
,&&- .
dbType&&/ 5
:&&5 6
OracleMappingType&&7 H
.&&H I
	RefCursor&&I R
,&&R S
	direction&&T ]
:&&] ^
ParameterDirection&&_ q
.&&q r
Output&&r x
)&&x y
;&&y z
screenInformations'' "
=''# $
(''% &
await''& +

connection'', 6
.''6 7

QueryAsync''7 A
<''A B
ScreenInformation''B S
>''S T
(''T U
DatabaseProcedures''U g
.''g h!
SP_GET_ACTIVE_SCREENS''h }
,''} ~
	parmeters	'' �
,
''� �
commandType
''� �
:
''� �
CommandType
''� �
.
''� �
StoredProcedure
''� �
)
''� �
)
''� �
.
''� �
ToList
''� �
(
''� �
)
''� �
;
''� �
}(( 
modules)) 
=)) 
()) 
from)) 
moduleInformation)) -
in)). 0
screenInformations))1 C
select** 
new** !
SecurityModule**" 0
{++ 
Id-- 
=-- 
moduleInformation--  1
.--1 2
ScreenId--2 :
,--: ;
Name.. 
=..  !
moduleInformation.." 3
...3 4

ScreenName..4 >
,..> ?
StatusId// #
=//$ %
moduleInformation//& 7
.//7 8
StatusId//8 @
,//@ A
ParentId00 #
=00$ %
moduleInformation00& 7
.007 8
ParentScreenId008 F
,00F G
	NodeLevel11 $
=11% &
	NodeLevel11' 0
.110 1
Module111 7
,117 8
NodeType22 #
=22$ %
NodeType22& .
.22. /
Module22/ 5
.225 6
ToString226 >
(22> ?
)22? @
,22@ A
Items33  
=33! "&
LoadActivePageInformations33# =
(33= >
screenInformations33> P
.33P Q
Where33Q V
(33V W
x33W X
=>33Y [
x33\ ]
.33] ^
ParentScreenId33^ l
==33m o
moduleInformation	33p �
.
33� �
ScreenId
33� �
)
33� �
.
33� �
ToList
33� �
(
33� �
)
33� �
)
33� �
,
33� �
}44 
)44 
.44 
ToList44  
(44  !
)44! "
;44" #
return55 
modules55 
;55 
}66 	
private77 
List77 
<77 
SecurityModule77 #
>77# $&
LoadActivePageInformations77% ?
(77? @
List77@ D
<77D E
ScreenInformation77E V
>77V W
screenInformations77X j
)77j k
{88 	
List99 
<99 
SecurityModule99 
>99  
pages99! &
=99' (
null99) -
;99- .
pages:: 
=:: 
(:: 
from:: 
moduleInformation:: +
in::, .
screenInformations::/ A
select;; 
new;; 
SecurityModule;;  .
{<< 
Id== 
=== 
moduleInformation== /
.==/ 0
ScreenId==0 8
,==8 9
Name>> 
=>> 
moduleInformation>>  1
.>>1 2

ScreenName>>2 <
,>>< =
StatusId?? !
=??" #
moduleInformation??$ 5
.??5 6
StatusId??6 >
,??> ?
ParentId@@ !
=@@" #
moduleInformation@@$ 5
.@@5 6
ParentScreenId@@6 D
,@@D E
	NodeLevelAA "
=AA# $
	NodeLevelAA% .
.AA. /
PageAA/ 3
,AA3 4
NodeTypeBB !
=BB" #
NodeTypeBB$ ,
.BB, -
PageBB- 1
.BB1 2
ToStringBB2 :
(BB: ;
)BB; <
,BB< =
ItemsCC 
=CC  &
LoadActivePageInformationsCC! ;
(CC; <
screenInformationsCC< N
.CCN O
WhereCCO T
(CCT U
xCCU V
=>CCW Y
xCCZ [
.CC[ \
ParentScreenIdCC\ j
==CCk m
moduleInformationCCn 
.	CC �
ScreenId
CC� �
)
CC� �
.
CC� �
ToList
CC� �
(
CC� �
)
CC� �
)
CC� �
,
CC� �
}DD 
)DD 
.DD 
ToListDD 
(DD 
)DD  
;DD  !
returnEE 
pagesEE 
;EE 
}FF 	
}GG 
}HH �	
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\PageInformationRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Administration& 4
{ 
public 

class %
PageInformationRepository *
:+ ,
BaseRepository- ;
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


( 5
;

5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public
PageInformationRepository
(
IConfiguration

,
IDistributedCache

redisCache
)
: 
base 
( 

)  !
{ 	
this 
. 

=  

;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
} 
} �	
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\PermissionInformationRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Administration& 4
{ 
public 

class +
PermissionInformationRepository 0
:1 2
BaseRepository3 A
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


( 5
;

5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public
PermissionInformationRepository
(
IConfiguration

,
IDistributedCache

redisCache
)
: 
base 
( 

)  !
{ 	
this 
. 

=  

;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
} 
} ��
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\RoleInformationRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Administration& 4
{ 
public 

class %
RoleInformationRepository *
:+ ,
BaseRepository- ;
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public %
RoleInformationRepository (
(( )
IConfiguration) 7

,E F
IDistributedCacheG X

redisCacheY c
)c d
:e f
baseg k
(k l

)y z
{ 	
this 
. 

=  

;. /
this 
. 

redisCache 
= 

redisCache (
;( )
}   	
public"" 
async"" 
Task"" 
<"" 
List"" 
<"" 
RoleInformation"" .
>"". /
>""/ 0
GetUserRoles""1 =
(""= >
long""> B
employeeSlno""C O
)""O P
{## 	
List$$ 
<$$ 
RoleInformation$$  
>$$  !
	userRoles$$" +
=$$, -
null$$. 2
;$$2 3
using&& 
(&& 
var&& 

connection&& !
=&&" #
await&&$ )
CreateConnection&&* :
(&&: ;
DbSchema&&; C
.&&C D
PORTAL&&D J
)&&J K
)&&K L
{'' 
OracleDynamicParameters(( '
	parmeters((( 1
=((2 3
new((4 7#
OracleDynamicParameters((8 O
(((O P
)((P Q
;((Q R
	parmeters)) 
.)) 
Add)) 
()) 
name)) "
:))" #
$str))$ 3
,))3 4
employeeSlno))5 A
,))A B
dbType))C I
:))I J
OracleMappingType))K \
.))\ ]
Int32))] b
,))b c
	direction))d m
:))m n
ParameterDirection	))o �
.
))� �
Input
))� �
)
))� �
;
))� �
	parmeters** 
.** 
Add** 
(** 
name** "
:**" #
$str**$ -
,**- .
dbType**/ 5
:**5 6
OracleMappingType**7 H
.**H I
	RefCursor**I R
,**R S
	direction**T ]
:**] ^
ParameterDirection**_ q
.**q r
Output**r x
)**x y
;**y z
	userRoles++ 
=++ 
(++ 
await++ "

connection++# -
.++- .

QueryAsync++. 8
<++8 9
RoleInformation++9 H
>++H I
(++I J
DatabaseProcedures++J \
.++\ ]
GET_EMPLOYEE_ROLES++] o
,++o p
	parmeters++q z
,++z {
commandType	++| �
:
++� �
CommandType
++� �
.
++� �
StoredProcedure
++� �
)
++� �
)
++� �
.
++� �
ToList
++� �
(
++� �
)
++� �
;
++� �
},, 
return-- 
	userRoles-- 
;-- 
}.. 	
public00 
Task00 
<00 
bool00 
>00 
DeActivateRole00 (
(00( )
long00) -
roleSlno00. 6
)006 7
{11 	
throw22 
new22 #
NotImplementedException22 -
(22- .
)22. /
;22/ 0
}33 	
public55 
Task55 
<55 
bool55 
>55 
ActivateRole55 &
(55& '
long55' +
roleSlno55, 4
)554 5
{66 	
throw77 
new77 #
NotImplementedException77 -
(77- .
)77. /
;77/ 0
}88 	
public:: 
async:: 
Task:: 
<:: 
List:: 
<:: 
RoleInformation:: .
>::. /
>::/ 0
GetAllActiveRoles::1 B
(::B C
)::C D
{;; 	
List<< 
<<< 
RoleInformation<<  
><<  !
	userRoles<<" +
=<<, -
null<<. 2
;<<2 3
using>> 
(>> 
var>> 

connection>> !
=>>" #
await>>$ )
CreateConnection>>* :
(>>: ;
DbSchema>>; C
.>>C D
PORTAL>>D J
)>>J K
)>>K L
{?? 
OracleDynamicParameters@@ '
	parmeters@@( 1
=@@2 3
new@@4 7#
OracleDynamicParameters@@8 O
(@@O P
)@@P Q
;@@Q R
	parmetersAA 
.AA 
AddAA 
(AA 
nameAA "
:AA" #
$strAA$ -
,AA- .
dbTypeAA/ 5
:AA5 6
OracleMappingTypeAA7 H
.AAH I
	RefCursorAAI R
,AAR S
	directionAAT ]
:AA] ^
ParameterDirectionAA_ q
.AAq r
OutputAAr x
)AAx y
;AAy z
	userRolesBB 
=BB 
(BB 
awaitBB "

connectionBB# -
.BB- .

QueryAsyncBB. 8
<BB8 9
RoleInformationBB9 H
>BBH I
(BBI J
DatabaseProceduresBBJ \
.BB\ ]
GET_ACTIVE_ROLESBB] m
,BBm n
	parmetersBBo x
,BBx y
commandType	BBz �
:
BB� �
CommandType
BB� �
.
BB� �
StoredProcedure
BB� �
)
BB� �
)
BB� �
.
BB� �
ToList
BB� �
(
BB� �
)
BB� �
;
BB� �
}CC 
returnDD 
	userRolesDD 
;DD 
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 
RoleInformationGG )
>GG) *
GetRoleInformationGG+ =
(GG= >
longGG> B
roleSlnoGGC K
)GGK L
{HH 	
RoleInformationII 
roleInformationII +
=II, -
nullII. 2
;II2 3
usingJJ 
(JJ 
varJJ 

connectionJJ !
=JJ" #
awaitJJ$ )
CreateConnectionJJ* :
(JJ: ;
DbSchemaJJ; C
.JJC D
PORTALJJD J
)JJJ K
)JJK L
{KK 
OracleDynamicParametersLL '
	parmetersLL( 1
=LL2 3
newLL4 7#
OracleDynamicParametersLL8 O
(LLO P
)LLP Q
;LLQ R
	parmetersMM 
.MM 
AddMM 
(MM 
nameMM "
:MM" #
$strMM$ /
,MM/ 0
roleSlnoMM1 9
,MM9 :
dbTypeMM; A
:MMA B
OracleMappingTypeMMC T
.MMT U
Int32MMU Z
,MMZ [
	directionMM\ e
:MMe f
ParameterDirectionMMg y
.MMy z
InputMMz 
)	MM �
;
MM� �
	parmetersNN 
.NN 
AddNN 
(NN 
nameNN "
:NN" #
$strNN$ -
,NN- .
dbTypeNN/ 5
:NN5 6
OracleMappingTypeNN7 H
.NNH I
	RefCursorNNI R
,NNR S
	directionNNT ]
:NN] ^
ParameterDirectionNN_ q
.NNq r
OutputNNr x
)NNx y
;NNy z
roleInformationOO 
=OO  !

connectionOO" ,
.OO, -

QueryFirstOO- 7
<OO7 8
RoleInformationOO8 G
>OOG H
(OOH I
DatabaseProceduresOOI [
.OO[ \"
P_GET_ROLE_INFORMATIONOO\ r
,OOr s
	parmetersOOt }
,OO} ~
commandType	OO �
:
OO� �
CommandType
OO� �
.
OO� �
StoredProcedure
OO� �
)
OO� �
;
OO� �
}PP 
returnQQ 
roleInformationQQ "
;QQ" #
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
boolTT 
>TT 
MapRolesToUserTT  .
(TT. /
)TT/ 0
{UU 	
boolVV 

=VV  
falseVV! &
;VV& '
usingWW 
(WW 
varWW 

connectionWW !
=WW" #
awaitWW$ )
CreateConnectionWW* :
(WW: ;
DbSchemaWW; C
.WWC D
PORTALWWD J
)WWJ K
)WWK L
{XX 
}\\ 
return]] 

;]]  !
}^^ 	
public`` 
async`` 
Task`` 
<`` 
bool`` 
>`` 
SaveRoleInformation``  3
(``3 4
RoleInformation``4 C
roleInformation``D S
)``S T
{aa 	
boolbb 
isRoleSavedbb 
=bb 
falsebb $
;bb$ %
intcc 
updatedRecordscc 
=cc  
$numcc! "
;cc" #
usingdd 
(dd 
vardd 

connectiondd !
=dd" #
awaitdd$ )
CreateConnectiondd* :
(dd: ;
DbSchemadd; C
.ddC D
PORTALddD J
)ddJ K
)ddK L
{ee 
OracleDynamicParametersff '
	parmetersff( 1
=ff2 3
newff4 7#
OracleDynamicParametersff8 O
(ffO P
)ffP Q
;ffQ R
	parmetersgg 
.gg 
Addgg 
(gg 
namegg "
:gg" #
$strgg$ /
,gg/ 0
roleInformationgg1 @
.gg@ A
RoleIdggA G
,ggG H
dbTypeggI O
:ggO P
OracleMappingTypeggQ b
.ggb c
Int32ggc h
,ggh i
	directionggj s
:ggs t
ParameterDirection	ggu �
.
gg� �
Input
gg� �
)
gg� �
;
gg� �
	parmetershh 
.hh 
Addhh 
(hh 
namehh "
:hh" #
$strhh$ 0
,hh0 1
roleInformationhh2 A
.hhA B
RoleNamehhB J
,hhJ K
dbTypehhL R
:hhR S
OracleMappingTypehhT e
.hhe f
Varchar2hhf n
,hhn o
	directionhhp y
:hhy z
ParameterDirection	hh{ �
.
hh� �
Input
hh� �
)
hh� �
;
hh� �
	parmetersii 
.ii 
Addii 
(ii 
nameii "
:ii" #
$strii$ 2
,ii2 3
roleInformationii4 C
.iiC D
DescriptioniiD O
,iiO P
dbTypeiiQ W
:iiW X
OracleMappingTypeiiY j
.iij k
Varchar2iik s
,iis t
	directioniiu ~
:ii~  
ParameterDirection
ii� �
.
ii� �
Input
ii� �
)
ii� �
;
ii� �
	parmetersjj 
.jj 
Addjj 
(jj 
namejj "
:jj" #
$strjj$ .
,jj. /
roleInformationjj0 ?
.jj? @
IsAdminjj@ G
,jjG H
dbTypejjI O
:jjO P
OracleMappingTypejjQ b
.jjb c
Int32jjc h
,jjh i
	directionjjj s
:jjs t
ParameterDirection	jju �
.
jj� �
Input
jj� �
)
jj� �
;
jj� �
	parmeterskk 
.kk 
Addkk 
(kk 
namekk "
:kk" #
$strkk$ 0
,kk0 1
$numkk2 3
,kk3 4
dbTypekk5 ;
:kk; <
OracleMappingTypekk= N
.kkN O
Int32kkO T
,kkT U
	directionkkV _
:kk_ `
ParameterDirectionkka s
.kks t
Inputkkt y
)kky z
;kkz {
updatedRecordsll 
=ll  
awaitll! &

connectionll' 1
.ll1 2
ExecuteAsyncll2 >
(ll> ?
DatabaseProceduresll? Q
.llQ R#
P_SAVE_ROLE_INFORMATIONllR i
,lli j
	parmetersllk t
,llt u
commandType	llv �
:
ll� �
CommandType
ll� �
.
ll� �
StoredProcedure
ll� �
)
ll� �
;
ll� �
}mm 
returnnn 
(nn 
updatedRecordsnn "
*nn# $
-nn% &
$numnn& '
)nn' (
>nn) *
$numnn+ ,
;nn, -
}oo 	
internalqq 
asyncqq 
Taskqq 
<qq 
Listqq  
<qq  !
RoleInformationqq! 0
>qq0 1
>qq1 2
GetMappedRolesqq3 A
(qqA B
intqqB E
employeeSlnoqqF R
)qqR S
{rr 	
Listss 
<ss 
RoleInformationss  
>ss  !
mappedRolesss" -
=ss. /
nullss0 4
;ss4 5
usinguu 
(uu 
varuu 

connectionuu !
=uu" #
awaituu$ )
CreateConnectionuu* :
(uu: ;
DbSchemauu; C
.uuC D
PORTALuuD J
)uuJ K
)uuK L
{vv 
OracleDynamicParametersww '
	parmetersww( 1
=ww2 3
newww4 7#
OracleDynamicParametersww8 O
(wwO P
)wwP Q
;wwQ R
	parmetersxx 
.xx 
Addxx 
(xx 
namexx "
:xx" #
$strxx$ 3
,xx3 4
employeeSlnoxx5 A
,xxA B
dbTypexxC I
:xxI J
OracleMappingTypexxK \
.xx\ ]
Int32xx] b
,xxb c
	directionxxd m
:xxm n
ParameterDirection	xxo �
.
xx� �
Input
xx� �
)
xx� �
;
xx� �
	parmetersyy 
.yy 
Addyy 
(yy 
nameyy "
:yy" #
$stryy$ -
,yy- .
dbTypeyy/ 5
:yy5 6
OracleMappingTypeyy7 H
.yyH I
	RefCursoryyI R
,yyR S
	directionyyT ]
:yy] ^
ParameterDirectionyy_ q
.yyq r
Outputyyr x
)yyx y
;yyy z
mappedRoleszz 
=zz 
(zz 
awaitzz $

connectionzz% /
.zz/ 0

QueryAsynczz0 :
<zz: ;
RoleInformationzz; J
>zzJ K
(zzK L
DatabaseProcedureszzL ^
.zz^ _!
SP_GET_EMPLOYEE_ROLESzz_ t
,zzt u
	parmeterszzv 
,	zz �
commandType
zz� �
:
zz� �
CommandType
zz� �
.
zz� �
StoredProcedure
zz� �
)
zz� �
)
zz� �
.
zz� �
ToList
zz� �
(
zz� �
)
zz� �
;
zz� �
}{{ 
return|| 
mappedRoles|| 
;|| 
}}} 	
public 
async 
Task 
< 
List 
< 
RoleInformation .
>. /
>/ 0
SearchRoles1 <
(< =)
RoleInformationSearchCriteria= Z
searchCriteria[ i
)i j
{
�� 	
List
�� 
<
�� 
RoleInformation
��  
>
��  !
	userRoles
��" +
=
��, -
null
��. 2
;
��2 3
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
CreateConnection
��* :
(
��: ;
DbSchema
��; C
.
��C D
PORTAL
��D J
)
��J K
)
��K L
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
	userRoles
�� 
=
�� 
(
�� 
await
�� "

connection
��# -
.
��- .

QueryAsync
��. 8
<
��8 9
RoleInformation
��9 H
>
��H I
(
��I J 
DatabaseProcedures
��J \
.
��\ ]'
P_SEARCH_ROLE_INFORMATION
��] v
,
��v w
	parmeters��x �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
	userRoles
�� 
;
�� 
}
�� 	
}
�� 
}�� �
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\RolePermissionRepository.cs
	namespace		 	
Phoenix		
 
.		 
Database		 
.		 

Repository		 %
.		% &
Administration		& 4
{

 
public 

class $
RolePermissionRepository )
:* +
BaseRepository, :
{ 
private
readonly
IConfiguration

;
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public $
RolePermissionRepository '
(' (
IConfiguration( 6

,D E
IDistributedCacheF W

redisCacheX b
)b c
: 
base 
( 

)  !
{ 	
this 
. 

=  

;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public 
List 
< !
PermissionInformation )
>) *!
LoadMappedPermissions+ @
(@ A
intA D
roleIdE K
)K L
{ 	
List 
< !
PermissionInformation &
>& '
permissions( 3
=4 5
null6 :
;: ;
return 
permissions 
; 
} 	
public 
bool 
SavePermissions #
(# $
List$ (
<( )
SecurityModule) 7
>7 8
permissions9 D
,D E
intF I
roleIdJ P
)P Q
{ 	
List   
<   
RolePermission   
>    
rolePermissions  ! 0
=  1 2
null  3 7
;  7 8
List!! 
<!! 
RolePermission!! 
>!!  &
toBeDeletedRolePermissions!!! ;
=!!< =
null!!> B
;!!B C
rolePermissions"" 
="" 
new"" !
List""" &
<""& '
RolePermission""' 5
>""5 6
(""6 7
)""7 8
;""8 9
return22 
true22 
;22 
}33 	
private55 
RoleInformation55 #
PopulateRoleInformation55  7
(557 8
int558 ;
roleId55< B
)55B C
{66 	
RoleInformation77 
roleInformation77 +
=77, -
null77. 2
;772 3
using88 
(88 %
RoleInformationRepository88 ,
roleRepository88- ;
=88< =
new88> A%
RoleInformationRepository88B [
(88[ \

,88i j

redisCache88k u
)88u v
)88v w
{99 
};; 
return== 
roleInformation== "
;==" #
}>> 	
private@@ !
PermissionInformation@@ %)
PopulatePermisisonInformation@@& C
(@@C D
int@@D G
permissionId@@H T
)@@T U
{AA 	!
PermissionInformationBB !!
permissionInformationBB" 7
=BB8 9
nullBB: >
;BB> ?
usingCC 
(CC +
PermissionInformationRepositoryCC 2
roleRepositoryCC3 A
=CCB C
newCCD G+
PermissionInformationRepositoryCCH g
(CCg h

,CCu v

redisCache	CCw �
)
CC� �
)
CC� �
{DD 
}FF 
returnHH !
permissionInformationHH (
;HH( )
}II 	
}JJ 
}KK �v
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\SecurityModuleRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Administration& 4
{ 
public 

class $
SecurityModuleRepository )
:* +
BaseRepository, :
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public $
SecurityModuleRepository '
(' (
IConfiguration( 6

,D E
IDistributedCacheF W

redisCacheX b
)b c
:d e
basef j
(j k

)x y
{ 	
this 
. 

=  

;. /
this 
. 

redisCache 
= 

redisCache (
;( )
} 	
public   
async   
Task   
<   
List   
<   
SecurityModule   -
>  - .
>  . /!
LoadMappedPermissions  0 E
(  E F
int  F I
roleId  J P
)  P Q
{!! 	
List"" 
<"" 
SecurityModule"" 
>""  
securityModules""! 0
=""1 2
null""3 7
;""7 8
List## 
<## 
SecurityModule## 
>##  
mappedPermissions##! 2
=##3 4
null##5 9
;##9 :
List$$ 
<$$ 
SecurityModule$$ 
>$$  
modules$$! (
=$$) *
null$$+ /
;$$/ 0
securityModules%% 
=%% 
new%% !
List%%" &
<%%& '
SecurityModule%%' 5
>%%5 6
(%%6 7
)%%7 8
;%%8 9
modules'' 
='' 
await'' (
LoadActiveModuleInformations'' 8
(''8 9
)''9 :
;'': ;
mappedPermissions(( 
=(( 
await((  %!
LoadRoleMappedScreens((& ;
(((; <
roleId((< B
)((B C
;((C D
foreach)) 
()) 
SecurityModule)) #
mainPermission))$ 2
in))3 5
modules))6 =
)))= >
{** 
SecurityModule++ 

permission++ )
=++* +
mappedPermissions++, =
.++= >
Where++> C
(++C D
x++D E
=>++F H
x++I J
.++J K
Id++K M
==++N P
mainPermission++Q _
.++_ `
Id++` b
)++b c
.++c d
FirstOrDefault++d r
(++r s
)++s t
;++t u
if,, 
(,, 

permission,, 
!=,, !
null,," &
),,& '
{-- 
mainPermission.. "
..." #
RolePermission..# 1
=..2 3
true..4 8
;..8 9
}// 
}00 
securityModules11 
.11 
AddRange11 $
(11$ %
modules11% ,
)11, -
;11- .
return22 
securityModules22 "
;22" #
}33 	
private55 
async55 
Task55 
<55 
List55 
<55  
SecurityModule55  .
>55. /
>55/ 0(
LoadActiveModuleInformations551 M
(55M N
)55N O
{66 	
List77 
<77 
SecurityModule77 
>77  $
activeModuleInformations77! 9
=77: ;
null77< @
;77@ A
using88 
(88 '
ModuleInformationRepository88 .

repository88/ 9
=88: ;
new88< ?'
ModuleInformationRepository88@ [
(88[ \
this88\ `
.88` a

,88n o
this88p t
.88t u

redisCache88u 
)	88 �
)
88� �
{99 
activeModuleInformations:: (
=::) *
await::+ 0

repository::1 ;
.::; <(
LoadActiveModuleInformations::< X
(::X Y
)::Y Z
;::Z [
};; 
return<< $
activeModuleInformations<< +
;<<+ ,
}== 	
public?? 
async?? 
Task?? 
<?? 
bool?? 
>?? 
SavePermissions??  /
(??/ 0
List??0 4
<??4 5
SecurityModule??5 C
>??C D
permissions??E P
,??P Q
int??R U
roleId??V \
)??\ ]
{@@ 	
boolAA 
isSavedAA 
=AA 
falseAA  
;AA  !
ListBB 
<BB 
intBB 
>BB 
selectedPermissionsBB )
=BB* +
permissionsBB, 7
.BB7 8
SelectBB8 >
(BB> ?
xBB? @
=>BBA C
xBBD E
.BBE F
IdBBF H
)BBH I
.BBI J
ToListBBJ P
(BBP Q
)BBQ R
;BBR S
intCC 
updatedRecordsCC 
=CC  
$numCC! "
;CC" #
intDD 
rowsUpdatedDD 
=DD 
$numDD 
;DD  
usingEE 
(EE 
varEE 

connectionEE !
=EE" #
awaitEE$ )
CreateConnectionEE* :
(EE: ;
DbSchemaEE; C
.EEC D
PORTALEED J
)EEJ K
)EEK L
{FF 
OracleDynamicParametersGG '
	parmetersGG( 1
=GG2 3
newGG4 7#
OracleDynamicParametersGG8 O
(GGO P
)GGP Q
;GGQ R
	parmetersHH 
.HH 
AddHH 
(HH 
nameHH "
:HH" #
$strHH$ 2
,HH2 3
selectedPermissionsHH4 G
.HHG H
ToArrayHHH O
(HHO P
)HHP Q
,HHQ R
dbTypeHHS Y
:HHY Z
OracleMappingTypeHH[ l
.HHl m
Int32HHm r
,HHr s
	directionHHt }
:HH} ~
ParameterDirection	HH �
.
HH� �
Input
HH� �
,
HH� �!
selectedPermissions
HH� �
.
HH� �
Count
HH� �
,
HH� �
collectionTypeII "
:II" #'
OracleMappingCollectionTypeII$ ?
.II? @!
PLSQLAssociativeArrayII@ U
)IIU V
;IIV W
	parmetersJJ 
.JJ 
AddJJ 
(JJ 
nameJJ "
:JJ" #
$strJJ$ /
,JJ/ 0
roleIdJJ1 7
,JJ7 8
dbTypeJJ9 ?
:JJ? @
OracleMappingTypeJJA R
.JJR S
Int32JJS X
,JJX Y
	directionJJZ c
:JJc d
ParameterDirectionJJe w
.JJw x
InputJJx }
)JJ} ~
;JJ~ 
	parmetersKK 
.KK 
AddKK 
(KK 
nameKK "
:KK" #
$strKK$ 5
,KK5 6
$numKK7 <
,KK< =
dbTypeKK> D
:KKD E
OracleMappingTypeKKF W
.KKW X
Int32KKX ]
,KK] ^
	directionKK_ h
:KKh i
ParameterDirectionKKj |
.KK| }
Input	KK} �
)
KK� �
;
KK� �
	parmetersLL 
.LL 
AddLL 
(LL 
nameLL "
:LL" #
$strLL$ 6
,LL6 7
dbTypeLL8 >
:LL> ?
OracleMappingTypeLL@ Q
.LLQ R
Int32LLR W
,LLW X
	directionLLY b
:LLb c
ParameterDirectionLLd v
.LLv w
OutputLLw }
)LL} ~
;LL~ 
updatedRecordsMM 
=MM  
awaitMM! &

connectionMM' 1
.MM1 2
ExecuteAsyncMM2 >
(MM> ?
DatabaseProceduresMM? Q
.MMQ R
SP_SAVE_PERMISSIONSMMR e
,MMe f
	parmetersMMg p
,MMp q
commandTypeMMr }
:MM} ~
CommandType	MM �
.
MM� �
StoredProcedure
MM� �
)
MM� �
;
MM� �
rowsUpdatedNN 
=NN 
	parmetersNN '
.NN' (
GetNN( +
<NN+ ,
intNN, /
>NN/ 0
(NN0 1
$strNN1 C
)NNC D
;NND E
}OO 
isSavedQQ 
=QQ 
rowsUpdatedQQ !
>QQ" #
$numQQ$ %
;QQ% &
returnRR 
isSavedRR 
;RR 
}SS 	
privateUU 
asyncUU 
TaskUU 
<UU 
ListUU 
<UU  
SecurityModuleUU  .
>UU. /
>UU/ 0!
LoadRoleMappedScreensUU1 F
(UUF G
intUUG J
roleIdUUK Q
)UUQ R
{VV 	
ListWW 
<WW 
SecurityModuleWW 
>WW  
modulesWW! (
=WW) *
newWW+ .
ListWW/ 3
<WW3 4
SecurityModuleWW4 B
>WWB C
(WWC D
)WWD E
;WWE F
ListXX 
<XX 
ScreenInformationXX "
>XX" #
screenInformationsXX$ 6
=XX7 8
nullXX9 =
;XX= >
usingYY 
(YY 
varYY 

connectionYY !
=YY" #
awaitYY$ )
CreateConnectionYY* :
(YY: ;
DbSchemaYY; C
.YYC D
PORTALYYD J
)YYJ K
)YYK L
{ZZ 
OracleDynamicParameters[[ '
	parmeters[[( 1
=[[2 3
new[[4 7#
OracleDynamicParameters[[8 O
([[O P
)[[P Q
;[[Q R
	parmeters\\ 
.\\ 
Add\\ 
(\\ 
name\\ "
:\\" #
$str\\$ /
,\\/ 0
roleId\\1 7
,\\7 8
dbType\\9 ?
:\\? @
OracleMappingType\\A R
.\\R S
Int32\\S X
,\\X Y
	direction\\Z c
:\\c d
ParameterDirection\\e w
.\\w x
Input\\x }
)\\} ~
;\\~ 
	parmeters]] 
.]] 
Add]] 
(]] 
name]] "
:]]" #
$str]]$ -
,]]- .
dbType]]/ 5
:]]5 6
OracleMappingType]]7 H
.]]H I
	RefCursor]]I R
,]]R S
	direction]]T ]
:]]] ^
ParameterDirection]]_ q
.]]q r
Output]]r x
)]]x y
;]]y z
screenInformations^^ "
=^^# $
(^^% &
await^^& +

connection^^, 6
.^^6 7

QueryAsync^^7 A
<^^A B
ScreenInformation^^B S
>^^S T
(^^T U
DatabaseProcedures^^U g
.^^g h
SP_GET_ROLE_SCREENS^^h {
,^^{ |
	parmeters	^^} �
,
^^� �
commandType
^^� �
:
^^� �
CommandType
^^� �
.
^^� �
StoredProcedure
^^� �
)
^^� �
)
^^� �
.
^^� �
ToList
^^� �
(
^^� �
)
^^� �
;
^^� �
}__ 
modules`` 
=`` 
(`` 
from`` 
moduleInformation`` -
in``. 0
screenInformations``1 C
selectaa 
newaa !
SecurityModuleaa" 0
{bb 
Iddd 
=dd 
moduleInformationdd  1
.dd1 2
ScreenIddd2 :
,dd: ;
Nameee 
=ee  !
moduleInformationee" 3
.ee3 4

ScreenNameee4 >
,ee> ?
StatusIdff #
=ff$ %
moduleInformationff& 7
.ff7 8
StatusIdff8 @
,ff@ A
ParentIdgg #
=gg$ %
moduleInformationgg& 7
.gg7 8
ParentScreenIdgg8 F
,ggF G
	NodeLevelhh $
=hh% &
Enumerationshh' 3
.hh3 4
	NodeLevelhh4 =
.hh= >
Modulehh> D
,hhD E
NodeTypeii #
=ii$ %
Enumerationsii& 2
.ii2 3
NodeTypeii3 ;
.ii; <
Moduleii< B
.iiB C
ToStringiiC K
(iiK L
)iiL M
,iiM N
Itemsjj  
=jj! " 
LoadPageInformationsjj# 7
(jj7 8
screenInformationsjj8 J
.jjJ K
WherejjK P
(jjP Q
xjjQ R
=>jjS U
xjjV W
.jjW X
ParentScreenIdjjX f
==jjg i
moduleInformationjjj {
.jj{ |
ScreenId	jj| �
)
jj� �
.
jj� �
ToList
jj� �
(
jj� �
)
jj� �
)
jj� �
,
jj� �
}kk 
)kk 
.kk 
ToListkk  
(kk  !
)kk! "
;kk" #
returnll 
modulesll 
;ll 
}mm 	
privateoo 
Listoo 
<oo 
SecurityModuleoo #
>oo# $ 
LoadPageInformationsoo% 9
(oo9 :
Listoo: >
<oo> ?
ScreenInformationoo? P
>ooP Q
screenInformationsooR d
)ood e
{pp 	
Listqq 
<qq 
SecurityModuleqq 
>qq  
modulesqq! (
=qq) *
nullqq+ /
;qq/ 0
modulesrr 
=rr 
(rr 
fromrr 
moduleInformationrr -
inrr. 0
screenInformationsrr1 C
selectss 
newss !
SecurityModuless" 0
{tt 
Idvv 
=vv 
moduleInformationvv  1
.vv1 2
ScreenIdvv2 :
,vv: ;
Nameww 
=ww  !
moduleInformationww" 3
.ww3 4

ScreenNameww4 >
,ww> ?
StatusIdxx #
=xx$ %
moduleInformationxx& 7
.xx7 8
StatusIdxx8 @
,xx@ A
ParentIdyy #
=yy$ %
moduleInformationyy& 7
.yy7 8
ParentScreenIdyy8 F
,yyF G
	NodeLevelzz $
=zz% &
Enumerationszz' 3
.zz3 4
	NodeLevelzz4 =
.zz= >
Modulezz> D
,zzD E
NodeType{{ #
={{$ %
Enumerations{{& 2
.{{2 3
NodeType{{3 ;
.{{; <
Module{{< B
.{{B C
ToString{{C K
({{K L
){{L M
,{{M N
Items||  
=||! " 
LoadPageInformations||# 7
(||7 8
screenInformations||8 J
.||J K
Where||K P
(||P Q
x||Q R
=>||S U
x||V W
.||W X
ParentScreenId||X f
==||g i
moduleInformation||j {
.||{ |
ScreenId	||| �
)
||� �
.
||� �
ToList
||� �
(
||� �
)
||� �
)
||� �
,
||� �
}}} 
)}} 
.}} 
ToList}}  
(}}  !
)}}! "
;}}" #
return~~ 
modules~~ 
;~~ 
} 	
}
�� 
}�� ��
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Administration\UserInformationRepository.cs
	namespace   	
Phoenix  
 
.   
Database   
.   

Repository   %
.  % &
Administration  & 4
{!! 
public"" 

class"" %
UserInformationRepository"" *
:""+ ,
BaseRepository""- ;
{## 
private$$ 
readonly$$ 
IConfiguration$$ '

;$$5 6
private%% 
readonly%% 

cryptography%%' 3
;%%3 4
private&& 
readonly&& 
IDistributedCache&& *

redisCache&&+ 5
;&&5 6
private'' 
readonly'' 
IJwtAuthManager'' (
jwtAuthManager'') 7
;''7 8
public(( %
UserInformationRepository(( (
(((( )
IConfiguration(() 7

,((E F

cryptography((U a
,((a b
IDistributedCache((c t

redisCache((u 
,	(( �
IJwtAuthManager
((� �
jwtAuthManager
((� �
)
((� �
:
((� �
base
((� �
(
((� �

((� �
)
((� �
{)) 	
this** 
.** 

=**  

;**. /
this++ 
.++ 
cryptography++ 
=++ 
cryptography++  ,
;++, -
this,, 
.,, 

redisCache,, 
=,, 

redisCache,, (
;,,( )
this-- 
.-- 
jwtAuthManager-- 
=--  !
jwtAuthManager--" 0
;--0 1
}// 	
public11 
async11 
Task11 
<11 
bool11 
>11 
ActivateUser11  ,
(11, -
long11- 1
employeeSlno112 >
)11> ?
{22 	
int33 
updatedRecords33 
=33  
$num33! "
;33" #
string44 

loginQuery44 
=44 
$str44  _
;44_ `
using55 
(55 


connection55! +
=55, -
await55. 3
CreateConnection554 D
(55D E
DbSchema55E M
.55M N
PORTAL55N T
)55T U
)55U V
{66 
string77 
query77 
=77 
string77 %
.77% &
Format77& ,
(77, -

loginQuery77- 7
,777 8
employeeSlno779 E
)77E F
;77F G
updatedRecords88 
=88  
await88! &

connection88' 1
.881 2
ExecuteAsync882 >
(88> ?
query88? D
)88D E
;88E F
}99 
return;; 
updatedRecords;; !
>;;" #
$num;;$ %
;;;% &
}== 	
private@@ 
async@@ 
Task@@ 
<@@ 
string@@ !
>@@! "

(@@0 1
string@@1 7
customizedId@@8 D
,@@D E
EmployeeProfile@@F U
profile@@V ]
)@@] ^
{AA 	
RestClientOptionsCC 
optionsCC %
=CC& '
newCC( +
RestClientOptionsCC, =
(CC= >

.CCK L
CurrentCCL S
.CCS T
EqualInitGateWayUrlCCT g
)CCg h
{DD 
TimeoutEE 
=EE 
-EE 
$numEE 
}FF 
;FF
stringHH 

=HH! "

.HH0 1
CurrentHH1 8
.HH8 9
ExperiencedPersonHH9 J
;HHJ K
InitiateRequestJJ 
requestJJ #
=JJ$ %
newJJ& )
InitiateRequestJJ* 9
(JJ9 :
)JJ: ;
{KK 
idempotency_idLL 
=LL  
customizedIdLL! -
,LL- .
gateway_instance_idNN #
=NN$ %
profileNN& -
.NN- .
EqualGateWayNN. :
,NN: ;
keysOO 
=OO 
newOO 
ListOO 
<OO  
KeyOO  #
>OO# $
(OO$ %
)OO% &
}PP 
;PP
varZZ 
clientZZ 
=ZZ 
newZZ 

RestClientZZ '
(ZZ' (
optionsZZ( /
)ZZ/ 0
;ZZ0 1
var[[ 
restRequest[[ 
=[[ 
new[[ !
RestRequest[[" -
([[- .

.[[; <
Current[[< C
.[[C D!
InitializeTransaction[[D Y
,[[Y Z
Method[[[ a
.[[a b
Post[[b f
)[[f g
;[[g h
client\\ 
.\\ 

=\\! "
new\\# &"
HttpBasicAuthenticator\\' =
(\\= >

.\\K L
Current\\L S
.\\S T
ClientId\\T \
,\\\ ]

.\\k l
Current\\l s
.\\s t
ClientSecret	\\t �
)
\\� �
;
\\� �
restRequest]] 
.]] 
	AddHeader]] !
(]]! "
$str]]" 0
,]]0 1
$str]]2 D
)]]D E
;]]E F
var^^ 
body^^ 
=^^ 
JsonConvert^^ "
.^^" #
SerializeObject^^# 2
(^^2 3
request^^3 :
)^^: ;
;^^; <
restRequest__ 
.__ 

(__% &
body__& *
,__* +

DataFormat__, 6
.__6 7
Json__7 ;
)__; <
;__< =
RestResponse`` 
response`` !
=``" #
await``$ )
client``* 0
.``0 1
ExecuteAsync``1 =
(``= >
restRequest``> I
)``I J
;``J K


=bb( )
JsonConvertbb* 5
.bb5 6
DeserializeObjectbb6 G
<bbG H

>bbU V
(bbV W
responsebbW _
.bb_ `
Contentbb` g
)bbg h
;bbh i
returncc 

.cc  !
tokencc! &
;cc& '
}dd 	
publicee 
asyncee 
Taskee 
<ee 
boolee 
>ee )
FetchEqualVerificationDetialsee  =
(ee= >
stringee> D
tokeneeE J
)eeJ K
{ff 	
RestClientOptionsgg 
optionsgg %
=gg& '
newgg( +
RestClientOptionsgg, =
(gg= >

.ggK L
CurrentggL S
.ggS T
EqualGateWayUrlggT c
)ggc d
{hh 
Timeoutii 
=ii 
-ii 
$numii 
}jj 
;jj
varll 
clientll 
=ll 
newll 

RestClientll '
(ll' (
optionsll( /
)ll/ 0
;ll0 1
varmm 
requestmm 
=mm 
newmm 
RestRequestmm )
(mm) *

.mm7 8
Currentmm8 ?
.mm? @
	FetchDatamm@ I
,mmI J
MethodmmK Q
.mmQ R
PostmmR V
)mmV W
;mmW X
clientnn 
.nn 

=nn! "
newnn# &"
HttpBasicAuthenticatornn' =
(nn= >

.nnK L
CurrentnnL S
.nnS T
ClientIdnnT \
,nn\ ]

.nnk l
Currentnnl s
.nns t
ClientSecret	nnt �
)
nn� �
;
nn� �
requestoo 
.oo 
	AddHeaderoo 
(oo 
$stroo ,
,oo, -
$stroo. @
)oo@ A
;ooA B
requestpp 
.pp 
	AddHeaderpp 
(pp 
$strpp &
,pp& '
$strpp( :
)pp: ;
;pp; <
stringrr 
bodyrr 
=rr 
stringrr  
.rr  !
Formatrr! '
(rr' (
$strrr( 1
,rr1 2
tokenrr3 8
)rr8 9
;rr9 :
requestss 
.ss 

(ss! "
bodyss" &
,ss& '

DataFormatss( 2
.ss2 3
Jsonss3 7
)ss7 8
;ss8 9
RestResponsett 
responsett !
=tt" #
awaittt$ )
clienttt* 0
.tt0 1
ExecuteAsynctt1 =
(tt= >
requesttt> E
)ttE F
;ttF G


=uu( )
JsonConvertuu* 5
.uu5 6
DeserializeObjectuu6 G
<uuG H

>uuU V
(uuV W
responseuuW _
.uu_ `
Contentuu` g
)uug h
;uuh i
returnww 

.ww  !
statusww! '
==ww( *
$strww+ 4
;ww4 5
}xx 	
publicyy 
asyncyy 
Taskyy 
<yy 
UserInformationyy )
>yy) *
AuthenticateUseryy+ ;
(yy; <
LoginInformationyy< L
loginInformationyyM ]
)yy] ^
{zz 	
UserInformation{{ 
userInformation{{ +
={{, -
null{{. 2
;{{2 3
string|| 
password|| 
=|| 
string|| $
.||$ %
Empty||% *
;||* +
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
loginInformation
��0 @
.
��@ A
UserName
��A I
,
��I J
dbType
��K Q
:
��Q R
OracleMappingType
��S d
.
��d e
Varchar2
��e m
,
��m n
	direction
��o x
:
��x y!
ParameterDirection��z �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
userInformation
�� 
=
��  !

connection
��" ,
.
��, -!
QueryFirstOrDefault
��- @
<
��@ A
UserInformation
��A P
>
��P Q
(
��Q R 
DatabaseProcedures
��R d
.
��d e

��e r
,
��r s

parameters
��t ~
,
��~ 
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
userInformation
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
string
�� 
	plianText
��  
=
��! "
string
��# )
.
��) *
Empty
��* /
;
��/ 0
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� )
(
��) *
userInformation
��* 9
.
��9 :
PasswordSalt
��: F
)
��F G
)
��G H
{
�� 
password
�� 
=
�� 
cryptography
�� +
.
��+ ,
Encrypt
��, 3
(
��3 4
loginInformation
��4 D
.
��D E
Password
��E M
,
��M N
userInformation
��O ^
.
��^ _
PasswordSalt
��_ k
)
��k l
;
��l m
	plianText
�� 
=
�� 
cryptography
��  ,
.
��, -
Decrypt
��- 4
(
��4 5
userInformation
��5 D
.
��D E
Password
��E M
,
��M N
userInformation
��O ^
.
��^ _
PasswordSalt
��_ k
)
��k l
;
��l m
}
�� 
if
�� 
(
�� 
userInformation
�� #
.
��# $
Password
��$ ,
==
��- /
password
��0 8
)
��8 9
{
�� 

�� !
token
��" '
=
��( )
jwtAuthManager
��* 8
.
��8 9

��9 F
(
��F G
userInformation
��G V
)
��V W
;
��W X
userInformation
�� #
.
��# $
Token
��$ )
=
��* +
token
��, 1
.
��1 2
AccessToken
��2 =
;
��= >
userInformation
�� #
.
��# $
RefreshToken
��$ 0
=
��1 2
token
��3 8
.
��8 9
RefreshToken
��9 E
;
��E F
userInformation
�� #
.
��# $

��$ 1
=
��2 3
await
��4 9
GetMappedScreens
��: J
(
��J K
userInformation
��K Z
.
��Z [
EmployeeSlno
��[ g
)
��g h
;
��h i
await
�� 
SaveLoginTries
�� (
(
��( )
userInformation
��) 8
.
��8 9
EmployeeSlno
��9 E
)
��E F
;
��F G
EmployeeProfile
�� #
profile
��$ +
=
��, -
await
��. 3'
GetEmployeeMinimalProfile
��4 M
(
��M N
userInformation
��N ]
.
��] ^
EmployeeSlno
��^ j
)
��j k
;
��k l
if
�� 
(
�� !
ApplicationSettings
�� +
.
��+ ,
Current
��, 3
.
��3 4'
AllowEmployeeVerification
��4 M
)
��M N
{
�� 
if
�� 
(
�� 
!
�� 
userInformation
�� ,
.
��, -

IsVerified
��- 7
&&
��8 :
profile
��; B
.
��B C$
IsVerificationRequired
��C Y
)
��Y Z
{
�� 
userInformation
�� +
.
��+ ,

��, 9
=
��: ;
await
��< A
GetIdempotencyId
��B R
(
��R S
userInformation
��S b
.
��b c
EmployeeSlno
��c o
,
��o p
userInformation��q �
.��� �
CustomizedId��� �
)��� �
;��� �
string
�� "

equalToken
��# -
=
��. /
await
��0 5

��6 C
(
��C D
userInformation
��D S
.
��S T

��T a
,
��a b
profile
��c j
)
��j k
;
��k l
userInformation
�� +
.
��+ ,

EqualToken
��, 6
=
��7 8

equalToken
��9 C
;
��C D
userInformation
�� +
.
��+ ,
ClientId
��, 4
=
��5 6

��7 D
.
��D E
Current
��E L
.
��L M
ClientId
��M U
;
��U V
}
�� 
}
�� 
else
�� 
{
�� 
userInformation
�� '
.
��' (

IsVerified
��( 2
=
��3 4
true
��5 9
;
��9 :
}
�� 
}
�� 
else
�� 
{
�� 
userInformation
�� #
=
��$ %
null
��& *
;
��* +
}
�� 
}
�� 
return
�� 
userInformation
�� "
;
��" #
}
�� 	
private
�� 
async
�� 
Task
�� &
SaveEmployeeVerification
�� 3
(
��3 4
int
��4 7
employeeslno
��8 D
,
��D E
string
��F L

��M Z
)
��Z [
{
�� 	
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
CreateConnection
��* :
(
��: ;
DbSchema
��; C
.
��C D
PORTAL
��D J
)
��J K
)
��K L
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeslno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 5
,
��5 6

��7 D
,
��D E
dbType
��F L
:
��L M
OracleMappingType
��N _
.
��_ `
Varchar2
��` h
,
��h i
	direction
��j s
:
��s t!
ParameterDirection��u �
.��� �
Input��� �
)��� �
;��� �
await
�� 

connection
��  
.
��  !
ExecuteAsync
��! -
(
��- . 
DatabaseProcedures
��. @
.
��@ A&
SP_SAVE_EMP_VERIFICATION
��A Y
,
��Y Z
	parmeters
��[ d
,
��d e
commandType
��f q
:
��q r
CommandType
��s ~
.
��~ 
StoredProcedure�� �
)��� �
;��� �
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
string
�� !
>
��! "
GetIdempotencyId
��# 3
(
��3 4
int
��4 7
employeeSlno
��8 D
,
��D E
string
��F L
customizedId
��M Y
)
��Y Z
{
�� 	
string
�� 

��  
=
��! "
string
��# )
.
��) *
Empty
��* /
;
��/ 0
UserInformation
�� 
	firstData
�� %
=
��& '
null
��( ,
;
��, -
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
customizedId
��0 <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Varchar2
��X `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
var
�� "
dbScreenInformations
�� (
=
��) *
await
��+ 0

connection
��1 ;
.
��; <

QueryAsync
��< F
<
��F G
UserInformation
��G V
>
��V W
(
��W X 
DatabaseProcedures
��X j
.
��j k 
GET_IDEMPOTENCY_ID
��k }
,
��} ~

parameters�� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
if
�� 
(
�� "
dbScreenInformations
�� (
!=
��) +
null
��, 0
)
��0 1
{
�� 
	firstData
�� 
=
�� "
dbScreenInformations
��  4
.
��4 5
FirstOrDefault
��5 C
(
��C D
)
��D E
;
��E F
}
�� 
}
�� 
if
�� 
(
�� 
	firstData
�� 
!=
�� 
null
��  
)
��  !
{
�� 

�� 
=
�� 
	firstData
��  )
.
��) *

��* 7
;
��7 8
}
�� 
else
�� 
{
�� 

�� 
=
�� 
Guid
��  $
.
��$ %
NewGuid
��% ,
(
��, -
)
��- .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
;
��9 :
await
�� &
SaveEmployeeVerification
�� .
(
��. /
employeeSlno
��/ ;
,
��; <

��= J
)
��J K
;
��K L
}
�� 
return
�� 

��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
UserInformation
�� )
>
��) *%
AuthenticateUserForNerp
��+ B
(
��B C
LoginInformation
��C S
loginInformation
��T d
)
��d e
{
�� 	
UserInformation
�� 
userInformation
�� +
=
��, -
null
��. 2
;
��2 3
string
�� 
password
�� 
=
�� 
string
�� $
.
��$ %
Empty
��% *
;
��* +
string
�� 
encryptedPassword
�� $
=
��% &
PasswordEncrypt
��' 6
.
��6 7
PasswordEncrypt
��7 F
.
��F G
EncriptText
��G R
(
��R S
loginInformation
��S c
.
��c d
Password
��d l
)
��l m
;
��m n
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
loginInformation
��0 @
.
��@ A
UserName
��A I
,
��I J
dbType
��K Q
:
��Q R
OracleMappingType
��S d
.
��d e
Varchar2
��e m
,
��m n
	direction
��o x
:
��x y!
ParameterDirection��z �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
encryptedPassword
��2 C
,
��C D
dbType
��E K
:
��K L
OracleMappingType
��M ^
.
��^ _
Varchar2
��_ g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
dbType
��1 7
:
��7 8
OracleMappingType
��9 J
.
��J K
	RefCursor
��K T
,
��T U
	direction
��V _
:
��_ ` 
ParameterDirection
��a s
.
��s t
Output
��t z
)
��z {
;
��{ |
userInformation
�� 
=
��  !

connection
��" ,
.
��, -!
QueryFirstOrDefault
��- @
<
��@ A
UserInformation
��A P
>
��P Q
(
��Q R 
DatabaseProcedures
��R d
.
��d e"
P_WEB_HS_USER_SELECT
��e y
,
��y z

parameters��{ �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
userInformation
�� 
!=
��  "
null
��# '
&&
��( *
userInformation
��+ :
.
��: ;
UserId
��; A
>
��B C
$num
��D E
)
��E F
{
�� 
userInformation
�� 
.
��  
CustomizedId
��  ,
=
��- .
loginInformation
��/ ?
.
��? @
UserName
��@ H
;
��H I

�� 
token
�� #
=
��$ %
jwtAuthManager
��& 4
.
��4 5

��5 B
(
��B C
userInformation
��C R
)
��R S
;
��S T
userInformation
�� 
.
��  
Token
��  %
=
��& '
token
��( -
.
��- .
AccessToken
��. 9
;
��9 :
userInformation
�� 
.
��  
RefreshToken
��  ,
=
��- .
token
��/ 4
.
��4 5
RefreshToken
��5 A
;
��A B
}
�� 
return
�� 
userInformation
�� "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
BranchInformation
�� 0
>
��0 1
>
��1 2%
GetUserBranchesFromNerp
��3 J
(
��J K
int
��K N
userSlno
��O W
)
��W X
{
�� 	
List
�� 
<
�� 
BranchInformation
�� "
>
��" #
mappedBranches
��$ 2
=
��3 4
null
��5 9
;
��9 :
List
�� 
<
�� !
DbBranchInformation
�� $
>
��$ %

dbBranches
��& 0
=
��1 2
null
��3 7
;
��7 8
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
userSlno
��2 :
,
��: ;
dbType
��< B
:
��B C
OracleMappingType
��D U
.
��U V
Int32
��V [
,
��[ \
	direction
��] f
:
��f g 
ParameterDirection
��h z
.
��z {
Input��{ �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
dbType
��1 7
:
��7 8
OracleMappingType
��9 J
.
��J K
	RefCursor
��K T
,
��T U
	direction
��V _
:
��_ ` 
ParameterDirection
��a s
.
��s t
Output
��t z
)
��z {
;
��{ |
var
�� 
x
�� 
=
�� 
await
�� 

connection
�� (
.
��( )

QueryAsync
��) 3
<
��3 4!
DbBranchInformation
��4 G
>
��G H
(
��H I 
DatabaseProcedures
��I [
.
��[ \%
P_WEB_HS_BRA_BLD_SELECT
��\ s
,
��s t

parameters
��u 
,�� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �

dbBranches
�� 
=
�� 
x
�� 
.
�� 
ToList
�� %
(
��% &
)
��& '
;
��' (
}
�� 
if
�� 
(
�� 

dbBranches
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
mappedBranches
�� 
=
��  

dbBranches
��! +
.
��+ ,
GroupBy
��, 3
(
��3 4
x
��4 5
=>
��6 8
new
��9 <
{
��= >
x
��? @
.
��@ A

BranchSlno
��A K
,
��K L
x
��M N
.
��N O
Branch_Name
��O Z
,
��Z [
x
��\ ]
.
��] ^
	Apex_Name
��^ g
}
��h i
)
��i j
.
��j k
Select
��k q
(
��q r
x
��r s
=>
��t v
new
�� 
BranchInformation
�� %
(
��% &
)
��& '
{
�� 

BranchName
�� 
=
��  
x
��! "
.
��" #
Key
��# &
.
��& '
Branch_Name
��' 2
,
��2 3
ApexName
�� 
=
�� 
x
��  
.
��  !
Key
��! $
.
��$ %
	Apex_Name
��% .
,
��. /

BranchSlno
�� 
=
��  
x
��! "
.
��" #
Key
��# &
.
��& '

BranchSlno
��' 1
,
��1 2
	Buildings
�� 
=
�� 
x
��  !
.
��! "
Select
��" (
(
��( )
y
��) *
=>
��+ -
new
��. 1!
BuildingInformation
��2 E
(
��E F
)
��F G
{
��H I
BuildingSlno
��J V
=
��W X
y
��Y Z
.
��Z [
BuildingSlno
��[ g
,
��g h
BuildingName
��i u
=
��v w
y
��x y
.
��y z
BuildingName��z �
}��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
}
�� 
return
�� 
mappedBranches
�� !
;
��! "
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
UserInformation
�� )
>
��) *)
ValidateAndAuthenticateUser
��+ F
(
��F G
string
��G M
userName
��N V
)
��V W
{
�� 	
UserInformation
�� 
userInformation
�� +
=
��, -
null
��. 2
;
��2 3
string
�� 

loginQuery
�� 
=
�� 
$str
��  f
;
��f g
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
string
�� 
query
�� 
=
�� 
string
�� %
.
��% &
Format
��& ,
(
��, -

loginQuery
��- 7
,
��7 8
userName
��9 A
)
��A B
;
��B C
userInformation
�� 
=
��  !
await
��" '

connection
��( 2
.
��2 3&
QueryFirstOrDefaultAsync
��3 K
<
��K L
UserInformation
��L [
>
��[ \
(
��\ ]
query
��] b
)
��b c
;
��c d
userInformation
�� 
.
��  
UserName
��  (
=
��) *
userName
��+ 3
;
��3 4
}
�� 
if
�� 
(
�� 
userInformation
�� 
!=
��  "
null
��# '
)
��' (
{
�� 

�� 
token
�� #
=
��$ %
jwtAuthManager
��& 4
.
��4 5

��5 B
(
��B C
userInformation
��C R
)
��R S
;
��S T
userInformation
�� 
.
��  
Token
��  %
=
��& '
token
��( -
.
��- .
AccessToken
��. 9
;
��9 :
userInformation
�� 
.
��  
RefreshToken
��  ,
=
��- .
token
��/ 4
.
��4 5
RefreshToken
��5 A
;
��A B
userInformation
�� 
.
��  

��  -
=
��. /
await
��0 5
GetMappedScreens
��6 F
(
��F G
userInformation
��G V
.
��V W
EmployeeSlno
��W c
)
��c d
;
��d e
await
�� 
SaveLoginTries
�� $
(
��$ %
userInformation
��% 4
.
��4 5
EmployeeSlno
��5 A
)
��A B
;
��B C
}
�� 
return
�� 
userInformation
�� "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
UserInformation
�� )
>
��) *5
'RefreshTokenValidateAndAuthenticateUser
��+ R
(
��R S
UserInformation
��S b
userInformation
��c r
)
��r s
{
�� 	
if
�� 
(
�� 
userInformation
�� 
!=
��  "
null
��# '
)
��' (
{
�� 

�� 
token
�� #
=
��$ %
jwtAuthManager
��& 4
.
��4 5
Refresh
��5 <
(
��< =
userInformation
��= L
)
��L M
;
��M N
userInformation
�� 
.
��  
Token
��  %
=
��& '
token
��( -
.
��- .
AccessToken
��. 9
;
��9 :
userInformation
�� 
.
��  
RefreshToken
��  ,
=
��- .
token
��/ 4
.
��4 5
RefreshToken
��5 A
;
��A B
userInformation
�� 
.
��  

��  -
=
��. /
await
��0 5
GetMappedScreens
��6 F
(
��F G
userInformation
��G V
.
��V W
EmployeeSlno
��W c
)
��c d
;
��d e
await
�� 
SaveLoginTries
�� $
(
��$ %
userInformation
��% 4
.
��4 5
EmployeeSlno
��5 A
)
��A B
;
��B C
}
�� 
return
�� 
userInformation
�� "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
SaveLoginTries
�� (
(
��( )
long
��) -
employeeSlno
��. :
)
��: ;
{
�� 	
bool
�� 
isSaved
�� 
=
�� 
false
��  
;
��  !
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
CreateConnection
��* :
(
��: ;
DbSchema
��; C
.
��C D
PORTAL
��D J
)
��J K
)
��K L
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
$num
��5 6
,
��6 7
dbType
��8 >
:
��> ?
OracleMappingType
��@ Q
.
��Q R
Int32
��R W
,
��W X
	direction
��Y b
:
��b c 
ParameterDirection
��d v
.
��v w
Input
��w |
)
��| }
;
��} ~
await
�� 

connection
��  
.
��  !
ExecuteAsync
��! -
(
��- . 
DatabaseProcedures
��. @
.
��@ A#
SP_INSERT_LOGIN_TRIES
��A V
,
��V W
	parmeters
��X a
,
��a b
commandType
��c n
:
��n o
CommandType
��p {
.
��{ |
StoredProcedure��| �
)��� �
;��� �
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
RoleInformation
�� .
>
��. /
>
��/ 0
GetMappedRoles
��1 ?
(
��? @
int
��@ C
employeeSlno
��D P
)
��P Q
{
�� 	
List
�� 
<
�� 
RoleInformation
��  
>
��  !
mappedRoles
��" -
=
��. /
null
��0 4
;
��4 5
using
�� 
(
�� '
RoleInformationRepository
�� ,!
dashboardRepository
��- @
=
��A B
new
��C F
(
��F G

��G T
,
��T U

redisCache
��V `
)
��` a
)
��a b
{
�� 
mappedRoles
�� 
=
�� 
await
�� #!
dashboardRepository
��$ 7
.
��7 8
GetMappedRoles
��8 F
(
��F G
employeeSlno
��G S
)
��S T
;
��T U
}
�� 
return
�� 
mappedRoles
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
SaveOrUpdateUser
��  0
(
��0 1
UserInformation
��1 @
userInformation
��A P
)
��P Q
{
�� 	
bool
�� 
isSaved
�� 
=
�� 
false
��  
;
��  !
List
�� 
<
�� 
int
�� 
>
�� 

�� #
=
��$ %
userInformation
��& 5
.
��5 6
	UserRoles
��6 ?
.
��? @
Select
��@ F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
RoleId
��N T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
int
�� 
rowsUpdated
�� 
=
�� 
$num
�� 
;
��  
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
CreateConnection
��* :
(
��: ;
DbSchema
��; C
.
��C D
PORTAL
��D J
)
��J K
)
��K L
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ ,
,
��, -

��. ;
.
��; <
ToArray
��< C
(
��C D
)
��D E
,
��E F
dbType
��G M
:
��M N
OracleMappingType
��O `
.
��` a
Int32
��a f
,
��f g
	direction
��h q
:
��q r!
ParameterDirection��s �
.��� �
Input��� �
,��� �

.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
userInformation
��5 D
.
��D E
EmployeeSlno
��E Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Int32
��m r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 5
,
��5 6
userInformation
��7 F
.
��F G
UserId
��G M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Int32
��i n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 6
,
��6 7
dbType
��8 >
:
��> ?
OracleMappingType
��@ Q
.
��Q R
Int32
��R W
,
��W X
	direction
��Y b
:
��b c 
ParameterDirection
��d v
.
��v w
Output
��w }
)
��} ~
;
��~ 
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R 
SP_SAVE_USER_ROLES
��R d
,
��d e
	parmeters
��f o
,
��o p
commandType
��q |
:
��| }
CommandType��~ �
.��� �
StoredProcedure��� �
)��� �
;��� �
rowsUpdated
�� 
=
�� 
	parmeters
�� '
.
��' (
Get
��( +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
$str
��1 C
)
��C D
;
��D E
}
�� 
isSaved
�� 
=
�� 
rowsUpdated
�� !
>
��" #
$num
��$ %
;
��% &
return
�� 
isSaved
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
DeActivateUser
��  .
(
��. /
long
��/ 3
employeeSlno
��4 @
)
��@ A
{
�� 	
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
string
�� 

loginQuery
�� 
=
�� 
$str
��  _
;
��_ `
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
string
�� 
query
�� 
=
�� 
string
�� %
.
��% &
Format
��& ,
(
��, -

loginQuery
��- 7
,
��7 8
employeeSlno
��9 E
)
��E F
;
��F G
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ?
query
��? D
)
��D E
;
��E F
}
�� 
return
�� 
updatedRecords
�� !
>
��" #
$num
��$ %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
EmployeeProfile
�� )
>
��) * 
GetEmployeeProfile
��+ =
(
��= >
int
��> A
employeeSlno
��B N
)
��N O
{
�� 	
return
�� 
await
�� '
GetEmployeeMinimalProfile
�� 2
(
��2 3
employeeSlno
��3 ?
)
��? @
;
��@ A
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
ScreenInformation
��  1
>
��1 2
>
��2 3
GetMappedScreens
��4 D
(
��D E
int
��E H
employeeSlno
��I U
)
��U V
{
�� 	
List
�� 
<
�� 
ScreenInformation
�� "
>
��" #

��$ 1
=
��2 3
null
��4 8
;
��8 9
List
�� 
<
�� 
ScreenInformation
�� "
>
��" #
	menuItems
��$ -
=
��. /
null
��0 4
;
��4 5
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
var
�� "
dbScreenInformations
�� (
=
��) *
await
��+ 0

connection
��1 ;
.
��; <

QueryAsync
��< F
<
��F G
ScreenInformation
��G X
>
��X Y
(
��Y Z 
DatabaseProcedures
��Z l
.
��l m%
P_GET_EMPLOYEE_SCREENS��m �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �

�� 
=
�� "
dbScreenInformations
��  4
.
��4 5
ToList
��5 ;
(
��; <
)
��< =
;
��= >
}
�� 
	menuItems
�� 
=
�� 
GetMenuItems
�� $
(
��$ %

��% 2
)
��2 3
;
��3 4
return
�� 
	menuItems
�� 
;
�� 
}
�� 	
private
�� 
List
�� 
<
�� 
ScreenInformation
�� &
>
��& '
GetMenuItems
��( 4
(
��4 5
List
��5 9
<
��9 :
ScreenInformation
��: K
>
��K L

��M Z
)
��Z [
{
�� 	

�� 
=
�� 

�� )
.
��) *

DistinctBy
��* 4
(
��4 5
x
��5 6
=>
��7 9
x
��: ;
.
��; <
ScreenId
��< D
)
��D E
.
��E F
ToList
��F L
(
��L M
)
��M N
;
��N O
List
�� 
<
�� 
ScreenInformation
�� "
>
��" #
	menuItems
��$ -
=
��. /

��0 =
.
��= >
Where
��> C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
ParentScreenId
��K Y
==
��Z \
null
��] a
)
��a b
.
��b c
OrderBy
��c j
(
��j k
x
��k l
=>
��m o
x
��p q
.
��q r
DisplayOrder
��r ~
)
��~ 
.�� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
item
�� 
in
��  
	menuItems
��! *
)
��* +
{
�� 
item
�� 
.
�� 
SubItems
�� 
=
�� 
GetSubMenuItems
��  /
(
��/ 0

��0 =
,
��= >
item
��? C
.
��C D
ScreenId
��D L
)
��L M
;
��M N
}
�� 
return
�� 
	menuItems
�� 
;
�� 
}
�� 	
private
�� 
List
�� 
<
�� 
ScreenInformation
�� &
>
��& '
GetSubMenuItems
��( 7
(
��7 8
List
��8 <
<
��< =
ScreenInformation
��= N
>
��N O

��P ]
,
��] ^
int
��_ b
screenId
��c k
)
��k l
{
�� 	
List
�� 
<
�� 
ScreenInformation
�� "
>
��" #
	menuItems
��$ -
=
��. /

��0 =
.
��= >
Where
��> C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
ParentScreenId
��K Y
==
��Z \
screenId
��] e
)
��e f
.
��f g
OrderBy
��g n
(
��n o
x
��o p
=>
��q s
x
��t u
.
��u v
DisplayOrder��v �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
item
�� 
in
��  
	menuItems
��! *
)
��* +
{
�� 
item
�� 
.
�� 
SubItems
�� 
=
�� 
GetSubMenuItems
��  /
(
��/ 0

��0 =
,
��= >
item
��? C
.
��C D
ScreenId
��D L
)
��L M
;
��M N
}
�� 
return
�� 
	menuItems
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
OtpData
�� !
>
��! "
GetOtp
��# )
(
��) *
string
��* 0
userName
��1 9
,
��9 :
bool
��; ?
isSignUp
��@ H
)
��H I
{
�� 	
UserInformation
�� 
dbUserInformation
�� -
=
��. /
null
��0 4
;
��4 5
bool
�� 
result
�� 
=
�� 
false
�� 
;
��  
string
�� 
otpValue
�� 
=
�� 
string
�� $
.
��$ %
Empty
��% *
;
��* +
string
�� 

otpMessage
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
;
��, -
OtpData
�� 
otpData
�� 
=
�� 
null
�� "
;
��" #
string
�� 

loginQuery
�� 
=
�� 
$str
��  g
;
��g h
string
�� 
insertQuery
�� 
=
��  
$str��! �
;��� �
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
dbUserInformation
�� !
=
��" #
await
��$ )

connection
��* 4
.
��4 5&
QueryFirstOrDefaultAsync
��5 M
<
��M N
UserInformation
��N ]
>
��] ^
(
��^ _
new
��_ b

��c p
(
��p q
)
��q r
.
��r s
AppendFormat
��s 
(�� �

loginQuery��� �
,��� �
userName��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
dbUserInformation
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
otpData
�� 
=
�� 
new
�� !
OtpData
��" )
(
��) *
)
��* +
;
��+ ,
EmployeeProfile
�� #
employeeProfile
��$ 3
=
��4 5
await
��6 ;'
GetEmployeeMinimalProfile
��< U
(
��U V
dbUserInformation
��V g
.
��g h
EmployeeSlno
��h t
)
��t u
;
��u v
otpValue
�� 
=
�� 
GenerateOtp
�� *
(
��* +
)
��+ ,
;
��, -
insertQuery
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
insertQuery
��0 ;
,
��; <
dbUserInformation
��= N
.
��N O
EmployeeSlno
��O [
,
��[ \
otpValue
��] e
,
��e f
dbUserInformation
��g x
.
��x y
CustomizedId��y �
,��� �
Convert��� �
.��� �
ToInt32��� �
(��� �
isSignUp��� �
)��� �
)��� �
;��� �
await
�� 

connection
�� $
.
��$ %
ExecuteAsync
��% 1
(
��1 2
insertQuery
��2 =
)
��= >
;
��> ?
string
�� 

OTPMessage
�� %
=
��& '!
ApplicationSettings
��( ;
.
��; <
Current
��< C
.
��C D

OTPMessage
��D N
;
��N O

otpMessage
�� 
=
��  
string
��! '
.
��' (
Format
��( .
(
��. /

OTPMessage
��/ 9
,
��9 :
Environment
��; F
.
��F G
NewLine
��G N
,
��N O
otpValue
��P X
,
��X Y
Environment
��Z e
.
��e f
NewLine
��f m
,
��m n"
ApplicationSettings��o �
.��� �
Current��� �
.��� �

OtpTimeOut��� �
,��� �
Environment��� �
.��� �
NewLine��� �
)��� �
;��� �%
OracleDynamicParameters
�� +
	parmeters
��, 5
=
��6 7
new
��8 ;%
OracleDynamicParameters
��< S
(
��S T
)
��T U
;
��U V
string
�� 

templateid
�� %
=
��& '!
ApplicationSettings
��( ;
.
��; <
Current
��< C
.
��C D
HrmsOtpTemplate
��D S
;
��S T
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 7
,
��7 8
employeeProfile
��9 H
.
��H I
Mobile
��I O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Int64
��k p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 2
,
��2 3
string
��4 :
.
��: ;
Format
��; A
(
��A B

otpMessage
��B L
,
��L M
dbUserInformation
��N _
.
��_ `
UserName
��` h
,
��h i
otpValue
��j r
)
��r s
,
��s t
dbType
��u {
:
��{ | 
OracleMappingType��} �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( <
,
��< =
$num
��> ?
,
��? @
dbType
��A G
:
��G H
OracleMappingType
��I Z
.
��Z [
Int32
��[ `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 9
,
��9 :
$num
��; <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Int32
��X ]
,
��] ^
	direction
��_ h
:
��h i 
ParameterDirection
��j |
.
��| }
Input��} �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 1
,
��1 2
$str
��3 ;
,
��; <
dbType
��= C
:
��C D
OracleMappingType
��E V
.
��V W
Varchar2
��W _
,
��_ `
	direction
��a j
:
��j k 
ParameterDirection
��l ~
.
��~ 
Input�� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 9
,
��9 :

templateid
��; E
,
��E F
dbType
��G M
:
��M N
OracleMappingType
��O `
.
��` a
Varchar2
��a i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �
await
�� 

connection
�� $
.
��$ %
ExecuteAsync
��% 1
(
��1 2 
DatabaseProcedures
��2 D
.
��D E
SEND_SMS
��E M
,
��M N
	parmeters
��O X
,
��X Y
commandType
��Z e
:
��e f
CommandType
��g r
.
��r s
StoredProcedure��s �
)��� �
;��� �
otpData
�� 
.
�� 
MobileNumber
�� (
=
��) *
Regex
��+ 0
.
��0 1
Replace
��1 8
(
��8 9
employeeProfile
��9 H
.
��H I
Mobile
��I O
.
��O P
ToString
��P X
(
��X Y
)
��Y Z
,
��Z [
$str
��\ m
,
��m n
$str
��o r
)
��r s
;
��s t
otpData
�� 
.
�� 
	IsOtpSent
�� %
=
��& '
true
��( ,
;
��, -
}
�� 
}
�� 
return
�� 
otpData
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
ValidateOtp
��  +
(
��+ ,
string
��, 2
userName
��3 ;
,
��; <
string
��= C
otpValue
��D L
)
��L M
{
�� 	
UserInformation
�� 
dbUserInformation
�� -
=
��. /
null
��0 4
;
��4 5
int
�� 
updatedRows
�� 
=
�� 
$num
�� 
;
��  
bool
�� 
isOtpVerfied
�� 
=
�� 
false
��  %
;
��% &
isOtpVerfied
�� 
=
�� 
ValidateOtp
�� &
(
��& '
otpValue
��' /
)
��/ 0
;
��0 1
string
�� 

loginQuery
�� 
=
�� 
$str��  �
;��� �
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
string
�� 

dbOtpValue
�� !
=
��" #
await
��$ )

connection
��* 4
.
��4 5 
ExecuteScalarAsync
��5 G
<
��G H
string
��H N
>
��N O
(
��O P
new
��P S

��T a
(
��a b
)
��b c
.
��c d
AppendFormat
��d p
(
��p q

loginQuery
��q {
,
��{ |
userName��} �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 

dbOtpValue
�� 
==
�� !
otpValue
��" *
)
��* +
{
�� 
string
�� 
updateQuery
�� &
=
��' (
string
��) /
.
��/ 0
Format
��0 6
(
��6 7
$str��7 �
,��� �
userName��� �
,��� �

dbOtpValue��� �
)��� �
;��� �
updatedRows
�� 
=
��  !
await
��" '

connection
��( 2
.
��2 3
ExecuteAsync
��3 ?
(
��? @
updateQuery
��@ K
)
��K L
;
��L M
}
�� 
}
�� 
return
�� 
updatedRows
�� 
>
��  
$num
��! "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
OtpData
�� !
>
��! "
SignUp
��# )
(
��) *
string
��* 0
userName
��1 9
)
��9 :
{
�� 	
OtpData
�� 
otpData
�� 
=
�� 
null
�� "
;
��" #
UserInformation
�� 
userInformation
�� +
=
��, -
null
��. 2
;
��2 3
string
�� 

loginQuery
�� 
=
�� 
$str
��  {
;
��{ |
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
string
�� 
query
�� 
=
�� 
string
�� %
.
��% &
Format
��& ,
(
��, -

loginQuery
��- 7
,
��7 8
userName
��9 A
)
��A B
;
��B C
userInformation
�� 
=
��  !
await
��" '

connection
��( 2
.
��2 3&
QueryFirstOrDefaultAsync
��3 K
<
��K L
UserInformation
��L [
>
��[ \
(
��\ ]
query
��] b
)
��b c
;
��c d
}
�� 
if
�� 
(
�� 
userInformation
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
otpData
�� 
=
�� 
await
�� 
GetOtp
��  &
(
��& '
userName
��' /
,
��/ 0
true
��1 5
)
��5 6
;
��6 7
}
�� 
return
�� 
otpData
�� 
;
�� 
}
�� 	
private
�� 
string
�� 
GenerateOtp
�� "
(
��" #
)
��# $
{
�� 	
string
�� 
	secretKey
�� 
=
�� 
$str
�� a
;
��a b
Totp
�� 
otpCalc
�� 
=
�� 
new
�� 
Totp
�� #
(
��# $
Encoding
��$ ,
.
��, -
UTF8
��- 1
.
��1 2
GetBytes
��2 :
(
��: ;
	secretKey
��; D
)
��D E
,
��E F
$num
��G I
,
��I J
OtpHashMode
��K V
.
��V W
Sha512
��W ]
,
��] ^
$num
��_ `
)
��` a
;
��a b
string
�� 
otp
�� 
=
�� 
otpCalc
��  
.
��  !
ComputeTotp
��! ,
(
��, -
DateTime
��- 5
.
��5 6
UtcNow
��6 <
)
��< =
;
��= >
return
�� 
otp
�� 
;
�� 
}
�� 	
private
�� 
bool
�� 
ValidateOtp
��  
(
��  !
string
��! '
otpValue
��( 0
)
��0 1
{
�� 	
long
�� 

�� 
=
��  
$num
��! "
;
��" #
string
�� 
	secretKey
�� 
=
�� 
$str
�� a
;
��a b
Totp
�� 
otpCalc
�� 
=
�� 
new
�� 
Totp
�� #
(
��# $
Encoding
��$ ,
.
��, -
UTF8
��- 1
.
��1 2
GetBytes
��2 :
(
��: ;
	secretKey
��; D
)
��D E
)
��E F
;
��F G
bool
�� 

�� 
=
��  
otpCalc
��! (
.
��( )

VerifyTotp
��) 3
(
��3 4
otpValue
��4 <
,
��< =
out
��> A

��B O
,
��O P
null
��Q U
)
��U V
;
��V W
return
�� 

��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
ChangePassword
��  .
(
��. /
UserInformation
��/ >
userInformation
��? N
)
��N O
{
�� 	
UserInformation
�� 
dbUserInformation
�� -
=
��. /
null
��0 4
;
��4 5
int
�� 
updatedRows
�� 
=
�� 
$num
�� 
;
��  
bool
�� 
isPasswordChanged
�� "
=
��# $
false
��% *
;
��* +
string
�� 

loginQuery
�� 
=
�� 
$str
��  g
;
��g h
string
�� 
updateQuery
�� 
=
��  
$str��! �
;��� �
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
dbUserInformation
�� !
=
��" #
await
��$ )

connection
��* 4
.
��4 5&
QueryFirstOrDefaultAsync
��5 M
<
��M N
UserInformation
��N ]
>
��] ^
(
��^ _
new
��_ b

��c p
(
��p q
)
��q r
.
��r s
AppendFormat
��s 
(�� �

loginQuery��� �
,��� �
userInformation��� �
.��� �
CustomizedId��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
dbUserInformation
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
string
�� 
passwordSalt
�� #
=
��$ %
Guid
��& *
.
��* +
NewGuid
��+ 2
(
��2 3
)
��3 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
.
��? @
Replace
��@ G
(
��G H
$str
��H K
,
��K L
$str
��M O
)
��O P
.
��P Q
ToUpper
��Q X
(
��X Y
)
��Y Z
;
��Z [
string
�� 
password
�� 
=
��  !
cryptography
��" .
.
��. /
Encrypt
��/ 6
(
��6 7
userInformation
��7 F
.
��F G
Password
��G O
,
��O P
passwordSalt
��Q ]
)
��] ^
;
��^ _
string
�� 
encryptedPassword
�� (
=
��) *
cryptography
��+ 7
.
��7 8
Encrypt
��8 ?
(
��? @
password
��@ H
,
��H I
passwordSalt
��J V
)
��V W
;
��W X
using
�� 
(
�� 

�� $

connection
��% /
=
��0 1
await
��2 7
CreateConnection
��8 H
(
��H I
DbSchema
��I Q
.
��Q R
PORTAL
��R X
)
��X Y
)
��Y Z
{
�� 
updatedRows
�� 
=
��  !
await
��" '

connection
��( 2
.
��2 3
ExecuteAsync
��3 ?
(
��? @
new
��@ C

��D Q
(
��Q R
)
��R S
.
��S T
AppendFormat
��T `
(
��` a
updateQuery
��a l
,
��l m
password
��n v
,
��v w
passwordSalt��x �
,��� �!
dbUserInformation��� �
.��� �
CustomizedId��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
isPasswordChanged
�� %
=
��& '
updatedRows
��( 3
>
��4 5
$num
��6 7
;
��7 8
}
�� 
}
�� 
return
�� 
isPasswordChanged
�� $
;
��$ %
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmployeeProfile
�� *
>
��* +'
GetEmployeeMinimalProfile
��, E
(
��E F
int
��F I
employeeSlno
��J V
)
��V W
{
�� 	
EmployeeProfile
�� 
employeeProfile
�� +
=
��, -
null
��. 2
;
��2 3
using
�� 
(
�� +
EmployeeInformationRepository
�� 0
profileRepository
��1 B
=
��C D
new
��E H+
EmployeeInformationRepository
��I f
(
��f g

��g t
,
��t u
this
��v z
.
��z {

redisCache��{ �
)��� �
)��� �
{
�� 
employeeProfile
�� 
=
��  !
await
��" '
profileRepository
��( 9
.
��9 :'
GetEmployeeMinimumProfile
��: S
(
��S T
employeeSlno
��T `
)
��` a
;
��a b
}
�� 
return
�� 
employeeProfile
�� "
;
��" #
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  

��! .
(
��. /
long
��/ 3
employeeSlno
��4 @
)
��@ A
{
�� 	
int
�� 
updatedRows
�� 
=
�� 
$num
�� 
;
��  
bool
�� 
	isUpdated
�� 
=
�� 
false
�� "
;
��" #
string
�� 

loginQuery
�� 
=
�� 
$str
��  j
;
��j k
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
updatedRows
�� 
=
�� 
await
�� #

connection
��$ .
.
��. /
ExecuteAsync
��/ ;
(
��; <
new
��< ?

��@ M
(
��M N
)
��N O
.
��O P
AppendFormat
��P \
(
��\ ]

loginQuery
��] g
,
��g h
DateTime
��i q
.
��q r
Now
��r u
.
��u v
ToString
��v ~
(
��~ 
$str�� �
)��� �
,��� �
employeeSlno��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
}
�� 
	isUpdated
�� 
=
�� 
updatedRows
�� #
>
��$ %
$num
��& '
;
��' (
return
�� 
	isUpdated
�� 
;
�� 
}
�� 	
}
�� 
}�� ػ
[F:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Attendance\BioMetricRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &

Attendance& 0
{ 
public   

class   
BioMetricRepository   $
:  % &
BaseRepository  ' 5
{!! 
private"" 
readonly"" 
IConfiguration"" '

;""5 6
private## 
readonly## 
IDistributedCache## *

redisCache##+ 5
;##5 6
private$$ 
readonly$$ 
ILoggerManager$$ '
logger$$( .
;$$. /
private%% 
readonly%% 

Dictionary%% #
<%%# $
string%%$ *
,%%* +
DateTime%%, 4
>%%4 5
payrollDates%%6 B
=%%C D
null%%E I
;%%I J
public&& 
BioMetricRepository&& "
(&&" #
IConfiguration&&# 1

,&&? @
IDistributedCache&&A R

redisCache&&S ]
,&&] ^
ILoggerManager&&_ m
logger&&n t
)&&t u
:&&v w
base&&x |
(&&| }

)
&&� �
{'' 	
this(( 
.(( 

=((  

;((. /
this)) 
.)) 

redisCache)) 
=)) 

redisCache)) (
;))( )
this** 
.** 
logger** 
=** 
logger**  
;**  !
payrollDates++ 
=++ 
GetPayrollDates++ *
(++* +
DateTime+++ 3
.++3 4
Now++4 7
)++7 8
.++8 9
Result++9 ?
;++? @
}-- 	
public// 
async// 
Task// 
<// 
List// 
<// 
	BioMetric// (
>//( )
>//) * 
GetEmployeeTimeSheet//+ ?
(//? @
long//@ D

employeeId//E O
)//O P
{00 	
List11 
<11 
	BioMetric11 
>11 

attendance11 &
=11' (
null11) -
;11- .
IEnumerable22 
<22 
	BioMetric22 !
>22! "
dbAttendance22# /
=220 1
null222 6
;226 7
int33 
recordCount33 
=33 
$num33 
;33  
using66 
(66 


connection66! +
=66, -
await66. 3
CreateConnection664 D
(66D E
DbSchema66E M
.66M N
PORTAL66N T
)66T U
)66U V
{77 
OracleDynamicParameters88 '
	parmeters88( 1
=882 3
new884 7#
OracleDynamicParameters888 O
(88O P
)88P Q
;88Q R
	parmeters99 
.99 
Add99 
(99 
name99 "
:99" #
$str99$ ,
,99, -
null99. 2
,992 3
dbType994 :
:99: ;
OracleMappingType99< M
.99M N
Int3299N S
,99S T
	direction99U ^
:99^ _
ParameterDirection99` r
.99r s
Input99s x
)99x y
;99y z
	parmeters:: 
.:: 
Add:: 
(:: 
name:: "
:::" #
$str::$ 3
,::3 4

employeeId::5 ?
,::? @
dbType::A G
:::G H
OracleMappingType::I Z
.::Z [
Int64::[ `
,::` a
	direction::b k
:::k l
ParameterDirection::m 
.	:: �
Input
::� �
)
::� �
;
::� �
	parmeters;; 
.;; 
Add;; 
(;; 
name;; "
:;;" #
$str;;$ -
,;;- .
dbType;;/ 5
:;;5 6
OracleMappingType;;7 H
.;;H I
	RefCursor;;I R
,;;R S
	direction;;T ]
:;;] ^
ParameterDirection;;_ q
.;;q r
Output;;r x
);;x y
;;;y z
dbAttendance<< 
=<< 
(<<  
await<<  %

connection<<& 0
.<<0 1

QueryAsync<<1 ;
<<<; <
	BioMetric<<< E
><<E F
(<<F G
DatabaseProcedures<<G Y
.<<Y Z#
GET_EMPLOYEE_TIME_SHEET<<Z q
,<<q r
	parmeters<<s |
,<<| }
commandType	<<~ �
:
<<� �
CommandType
<<� �
.
<<� �
StoredProcedure
<<� �
)
<<� �
)
<<� �
.
<<� �
ToList
<<� �
(
<<� �
)
<<� �
;
<<� �
recordCount== 
=== 
await== #

connection==$ .
.==. /
ExecuteScalarAsync==/ A
<==A B
int==B E
>==E F
(==F G
string==G M
.==M N
Format==N T
(==T U
DatabaseProcedures==U g
.==g h*
P_G_EMPLOYEE_TIME_SHEET_COUNT	==h �
,
==� �

employeeId
==� �
)
==� �
,
==� �
commandType
==� �
:
==� �
CommandType
==� �
.
==� �
Text
==� �
)
==� �
;
==� �

attendance?? 
=?? 
await?? "+
MapOnDutiesAndRegularAttendance??# B
(??B C
dbAttendance??C O
.??O P
ToList??P V
(??V W
)??W X
,??X Y

employeeId??Z d
.??d e
ToInt32OrDefault??e u
(??u v
)??v w
)??w x
;??x y
}@@ 
returnAA 

attendanceAA 
;AA 
}BB 	
publicDD 
asyncDD 
TaskDD 
<DD 
ListDD 
<DD 
	BioMetricDD (
>DD( )
>DD) * 
GetReporteeTimeSheetDD+ ?
(DD? @+
ReporteeTimeSheetSearchCriteriaDD@ _
searchCriteriaDD` n
)DDn o
{EE 	
ListFF 
<FF 
	BioMetricFF 
>FF 

attendanceFF &
=FF' (
nullFF) -
;FF- .
IEnumerableGG 
<GG 
	BioMetricGG !
>GG! "
dbAttendanceGG# /
=GG0 1
nullGG2 6
;GG6 7
intHH 
recordCountHH 
=HH 
$numHH 
;HH  
usingKK 
(KK 


connectionKK! +
=KK, -
awaitKK. 3
CreateConnectionKK4 D
(KKD E
DbSchemaKKE M
.KKM N
PORTALKKN T
)KKT U
)KKU V
{LL 
OracleDynamicParametersMM '
	parmetersMM( 1
=MM2 3
newMM4 7#
OracleDynamicParametersMM8 O
(MMO P
)MMP Q
;MMQ R
	parmetersNN 
.NN 
AddNN 
(NN 
nameNN "
:NN" #
$strNN$ .
,NN. /
searchCriteriaNN0 >
.NN> ?
	ReportForNN? H
,NNH I
dbTypeNNJ P
:NNP Q
OracleMappingTypeNNR c
.NNc d
Int32NNd i
,NNi j
	directionNNk t
:NNt u
ParameterDirection	NNv �
.
NN� �
Input
NN� �
)
NN� �
;
NN� �
	parmetersOO 
.OO 
AddOO 
(OO 
nameOO "
:OO" #
$strOO$ 3
,OO3 4
searchCriteriaOO5 C
.OOC D 
ReportingManagerSlnoOOD X
,OOX Y
dbTypeOOZ `
:OO` a
OracleMappingTypeOOb s
.OOs t
Int64OOt y
,OOy z
	direction	OO{ �
:
OO� � 
ParameterDirection
OO� �
.
OO� �
Input
OO� �
)
OO� �
;
OO� �
	parmetersPP 
.PP 
AddPP 
(PP 
namePP "
:PP" #
$strPP$ /
,PP/ 0
searchCriteriaPP1 ?
.PP? @
	StartDatePP@ I
,PPI J
dbTypePPK Q
:PPQ R
OracleMappingTypePPS d
.PPd e
DatePPe i
,PPi j
	directionPPk t
:PPt u
ParameterDirection	PPv �
.
PP� �
Input
PP� �
)
PP� �
;
PP� �
	parmetersQQ 
.QQ 
AddQQ 
(QQ 
nameQQ "
:QQ" #
$strQQ$ -
,QQ- .
searchCriteriaQQ/ =
.QQ= >
EndDateQQ> E
,QQE F
dbTypeQQG M
:QQM N
OracleMappingTypeQQO `
.QQ` a
DateQQa e
,QQe f
	directionQQg p
:QQp q
ParameterDirection	QQr �
.
QQ� �
Input
QQ� �
)
QQ� �
;
QQ� �
	parmetersRR 
.RR 
AddRR 
(RR 
nameRR "
:RR" #
$strRR$ -
,RR- .
dbTypeRR/ 5
:RR5 6
OracleMappingTypeRR7 H
.RRH I
	RefCursorRRI R
,RRR S
	directionRRT ]
:RR] ^
ParameterDirectionRR_ q
.RRq r
OutputRRr x
)RRx y
;RRy z
dbAttendanceSS 
=SS 
(SS  
awaitSS  %

connectionSS& 0
.SS0 1

QueryAsyncSS1 ;
<SS; <
	BioMetricSS< E
>SSE F
(SSF G
DatabaseProceduresSSG Y
.SSY Z%
P_GET_REPORTEE_TIME_SHEETSSZ s
,SSs t
	parmetersSSu ~
,SS~ 
commandType
SS� �
:
SS� �
CommandType
SS� �
.
SS� �
StoredProcedure
SS� �
)
SS� �
)
SS� �
.
SS� �
ToList
SS� �
(
SS� �
)
SS� �
;
SS� �

attendanceUU 
=UU 
awaitUU "+
MapOnDutiesAndRegularAttendanceUU# B
(UUB C
dbAttendanceUUC O
.UUO P
ToListUUP V
(UUV W
)UUW X
,UUX Y
searchCriteriaUUZ h
.UUh i 
ReportingManagerSlnoUUi }
)UU} ~
;UU~ 
}VV 
returnWW 

attendanceWW 
;WW 
}XX 	
privateZZ 
asyncZZ 
TaskZZ 
<ZZ 
ListZZ 
<ZZ  
	BioMetricZZ  )
>ZZ) *
>ZZ* ++
MapOnDutiesAndRegularAttendanceZZ, K
(ZZK L
ListZZL P
<ZZP Q
	BioMetricZZQ Z
>ZZZ [

attendanceZZ\ f
,ZZf g
intZZh k
employeeSlnoZZl x
)ZZx y
{[[ 	
List\\ 
<\\ 
HolidayInformation\\ #
>\\# $
holidays\\% -
=\\. /
await\\0 5'
CheckCompOffEmployeeHoliday\\6 Q
(\\Q R
employeeSlno\\R ^
)\\^ _
;\\_ `
List]] 
<]] 
LeaveDetail]] 
>]] 
leaves]] $
=]]% &
await]]' ,%
CheckCompOffEmployeLeaves]]- F
(]]F G
employeeSlno]]G S
)]]S T
;]]T U
List^^ 
<^^ 
LeaveDetail^^ 
>^^ 
earlyLeaves^^ )
=^^* +
await^^, 1)
CheckEarlyLogoutEmployeLeaves^^2 O
(^^O P
employeeSlno^^P \
)^^\ ]
;^^] ^
varaa 
startaa 
=aa 
payrollDatesaa $
[aa$ %
$straa% 0
]aa0 1
;aa1 2
varbb 
endbb 
=bb 
payrollDatesbb "
[bb" #
$strbb# ,
]bb, -
;bb- .
ifcc 
(cc 

attendancecc 
.cc 
Countcc  
>cc! "
$numcc# $
)cc$ %
{dd 

attendanceee 
.ee 
ForEachee "
(ee" #
(ee# $
itemee$ (
)ee( )
=>ee* ,
{ff 
itemgg 
.gg 
CanApplyOnDutygg '
=gg( )
itemgg* .
.gg. /
Holiday_Typegg/ ;
==gg< >
$numgg? @
?ggA B
falseggC H
:ggI J
trueggK O
;ggO P
ifhh 
(hh 
(hh 
itemhh 
.hh 

First_Halfhh (
==hh) +
$strhh, 4
&&hh5 7
itemhh8 <
.hh< =
Second_Halfhh= H
==hhI K
$strhhL U
)hhU V
||hhW Y
(ii 
itemii 
.ii 

First_Halfii (
==ii) +
$strii, 5
&&ii6 8
itemii9 =
.ii= >
Second_Halfii> I
==iiJ L
$striiM U
)iiU V
)iiV W
{jj 
itemkk 
.kk 

=kk+ ,
truekk- 1
;kk1 2
}ll 
ifmm 
(mm 
itemmm 
.mm 

First_Halfmm '
==mm( *
$strmm+ 4
&&mm5 7
itemmm8 <
.mm< =
Second_Halfmm= H
==mmI K
$strmmL U
&&mmV X
itemmmY ]
.mm] ^

TotalHoursmm^ h
<=mmi k
$nummml m
)mmm n
{nn 
itemoo 
.oo 
CanApplyOnDutyoo +
=oo, -
trueoo. 2
;oo2 3
}pp 
ifrr 
(rr 
itemrr 
.rr 

First_Halfrr '
==rr( *
$strrr+ 4
&&rr5 7
itemrr8 <
.rr< =
Second_Halfrr= H
==rrI K
$strrrL U
&&rrV X
itemrrY ]
.rr] ^

TotalHoursrr^ h
>=rri k
$numrrl m
&&rrn p
itemrrq u
.rru v
AttendanceDate	rrv �
>=
rr� �
DateTime
rr� �
.
rr� �
Now
rr� �
.
rr� �
AddDays
rr� �
(
rr� �
-
rr� �
$num
rr� �
)
rr� �
&&
rr� �
start
rr� �
<
rr� �
DateTime
rr� �
.
rr� �
Now
rr� �
&&
rr� �
end
rr� �
>
rr� �
DateTime
rr� �
.
rr� �
Now
rr� �
)
rr� �
{ss 
holidaystt  
=tt! "
holidaystt# +
.tt+ ,
Wherett, 1
(tt1 2
itt2 3
=>tt4 6
itt7 8
.tt8 9
HolidayDatett9 D
==ttE G
itemttH L
.ttL M
AttendanceDatettM [
)tt[ \
.tt\ ]
ToListtt] c
(ttc d
)ttd e
;tte f
varuu 
comOffsuu #
=uu$ %
leavesuu& ,
.uu, -
Whereuu- 2
(uu2 3
iuu3 4
=>uu5 7
iuu8 9
.uu9 :
CompOffDateuu: E
==uuF H
itemuuI M
.uuM N
AttendanceDateuuN \
)uu\ ]
.uu] ^
ToListuu^ d
(uud e
)uue f
;uuf g
ifvv 
(vv 
(vv 
itemvv !
.vv! "
WeekDayvv" )
==vv* ,
$strvv- 2
||vv3 5
holidaysvv6 >
.vv> ?
Countvv? D
>vvE F
$numvvG H
)vvH I
&&vvJ L
comOffsvvM T
.vvT U
CountvvU Z
<=vv[ ]
$numvv^ _
)vv_ `
{ww 
itemxx  
.xx  !
CanApplyCompOffxx! 0
=xx1 2
truexx3 7
;xx7 8
}yy 
}zz 
if{{ 
({{ 
({{ 
item{{ 
.{{ 

First_Half{{ (
=={{) +
$str{{, 5
&&{{6 8
item{{9 =
.{{= >
Second_Half{{> I
=={{J L
$str{{M V
){{V W
||{{X Z
({{[ \
item{{\ `
.{{` a

First_Half{{a k
=={{l n
$str{{o x
&&{{y {
item	{{| �
.
{{� �
Second_Half
{{� �
==
{{� �
$str
{{� �
)
{{� �
)
{{� �
{|| 
item}} 
.}} &
CanNotApplyEarlyLogOutTime}} 7
=}}8 9
true}}: >
;}}> ?
} 
var
�� 
earlyLogoutData
�� '
=
��( )
earlyLeaves
��* 5
.
��5 6
Where
��6 ;
(
��; <
i
��< =
=>
��> @
i
��A B
.
��B C
	LeaveFrom
��C L
==
��M O
item
��P T
.
��T U
AttendanceDate
��U c
)
��c d
.
��d e
ToList
��e k
(
��k l
)
��l m
;
��m n
if
�� 
(
�� 
earlyLogoutData
�� '
.
��' (
Count
��( -
>
��. /
$num
��0 1
||
��2 4
item
��5 9
.
��9 :
AttendanceDate
��: H
<
��I J
start
��K P
)
��P Q
{
�� 
item
�� 
.
�� (
CanNotApplyEarlyLogOutTime
�� 7
=
��8 9
true
��: >
;
��> ?
}
�� 
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 

attendance
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��   
HolidayInformation
��  2
>
��2 3
>
��3 4)
CheckCompOffEmployeeHoliday
��5 P
(
��P Q
int
��Q T
employeeSlno
��U a
)
��a b
{
�� 	
List
�� 
<
��  
HolidayInformation
�� #
>
��# $
holidays
��% -
=
��. /
null
��0 4
;
��4 5
using
�� 
(
�� 
HolidayRepository
�� $

repository
��% /
=
��0 1
new
��2 5
HolidayRepository
��6 G
(
��G H
this
��H L
.
��L M

��M Z
,
��Z [
this
��\ `
.
��` a

redisCache
��a k
)
��k l
)
��l m
{
�� 
holidays
�� 
=
�� 
await
��  

repository
��! +
.
��+ ,!
GetEmployeeHolidays
��, ?
(
��? @
employeeSlno
��@ L
)
��L M
;
��M N
}
�� 
return
�� 
holidays
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
LeaveDetail
��  +
>
��+ ,
>
��, -'
CheckCompOffEmployeLeaves
��. G
(
��G H
int
��H K
employeeSlno
��L X
)
��X Y
{
�� 	
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
leaves
�� $
=
��% &
null
��' +
;
��+ ,
using
�� 
(
�� '
LeaveManagementRepository
�� ,

repository
��- 7
=
��8 9
new
��: ='
LeaveManagementRepository
��> W
(
��W X
this
��X \
.
��\ ]

��] j
,
��j k
this
��l p
.
��p q
logger
��q w
)
��w x
)
��x y
{
�� 
var
�� 
start
�� 
=
�� 
payrollDates
�� (
[
��( )
$str
��) 4
]
��4 5
;
��5 6
var
�� 
end
�� 
=
�� 
payrollDates
�� &
[
��& '
$str
��' 0
]
��0 1
;
��1 2
leaves
�� 
=
�� 
await
�� 

repository
�� )
.
��) **
GetEmployeeLeavesByLeaveType
��* F
(
��F G
employeeSlno
��G S
,
��S T
start
��U Z
,
��Z [
end
��\ _
,
��_ `
LeaveTypeNames
��a o
.
��o p
COMPENSATORY_OFF��p �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
}
�� 
return
�� 
leaves
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
LeaveDetail
��  +
>
��+ ,
>
��, -+
CheckEarlyLogoutEmployeLeaves
��. K
(
��K L
int
��L O
employeeSlno
��P \
)
��\ ]
{
�� 	
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
leaves
�� $
=
��% &
null
��' +
;
��+ ,
using
�� 
(
�� '
LeaveManagementRepository
�� ,

repository
��- 7
=
��8 9
new
��: ='
LeaveManagementRepository
��> W
(
��W X
this
��X \
.
��\ ]

��] j
,
��j k
this
��l p
.
��p q
logger
��q w
)
��w x
)
��x y
{
�� 
var
�� 
start
�� 
=
�� 
payrollDates
�� (
[
��( )
$str
��) 4
]
��4 5
;
��5 6
var
�� 
end
�� 
=
�� 
payrollDates
�� &
[
��& '
$str
��' 0
]
��0 1
;
��1 2
leaves
�� 
=
�� 
await
�� 

repository
�� )
.
��) **
GetEmployeeLeavesByLeaveType
��* F
(
��F G
employeeSlno
��G S
,
��S T
start
��U Z
,
��Z [
end
��\ _
,
��_ `
LeaveTypeNames
��a o
.
��o p 
EARLY_LOGOUT_TIME��p �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
}
�� 
return
�� 
leaves
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 

Dictionary
�� %
<
��% &
string
��& ,
,
��, -
DateTime
��. 6
>
��6 7
>
��7 8
GetPayrollDates
��9 H
(
��H I
DateTime
��I Q
fromDate
��R Z
)
��Z [
{
�� 	

�� 

�� '
=
��( )
null
��* .
;
��. /

Dictionary
�� 
<
�� 
string
�� 
,
�� 
DateTime
�� '
>
��' (
payrollDates
��) 5
=
��6 7
new
��8 ;

Dictionary
��< F
<
��F G
string
��G M
,
��M N
DateTime
��O W
>
��W X
(
��X Y
)
��Y Z
;
��Z [
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '%
PayrollPeriodRepository
��( ?
(
��? @
this
��@ D
.
��D E

��E R
)
��R S
)
��S T
{
�� 
payrollDates
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
GetPayrollDates
��0 ?
(
��? @
fromDate
��@ H
)
��H I
;
��I J
if
�� 
(
�� 

�� !
!=
��" $
null
��% )
)
��) *
{
�� 
payrollDates
��  
.
��  !
Add
��! $
(
��$ %
$str
��% 0
,
��0 1

��2 ?
.
��? @
FromDate
��@ H
)
��H I
;
��I J
payrollDates
��  
.
��  !
Add
��! $
(
��$ %
$str
��% .
,
��. /

��0 =
.
��= >
ToDate
��> D
)
��D E
;
��E F
}
�� 
}
�� 
return
�� 
payrollDates
�� 
;
��  
}
�� 	
}
�� 
}�� �
YF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Attendance\HolidayRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &

Attendance& 0
{ 
public 

class 
HolidayRepository "
:# $
BaseRepository% 3
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public 
HolidayRepository  
(  !
IConfiguration! /

,= >
IDistributedCache? P

redisCacheQ [
)[ \
:] ^
base_ c
(c d

)q r
{ 	
this 
. 

=  

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
< 
HolidayInformation 1
>1 2
>2 3
GetEmployeeHolidays4 G
(G H
longH L

employeeIdM W
)W X
{ 	
List   
<   
HolidayInformation   #
>  # $

attendance  % /
=  0 1
null  2 6
;  6 7
using!! 
(!! 


connection!!! +
=!!, -
await!!. 3
CreateConnection!!4 D
(!!D E
DbSchema!!E M
.!!M N
PORTAL!!N T
)!!T U
)!!U V
{"" 
OracleDynamicParameters## '
	parmeters##( 1
=##2 3
new##4 7#
OracleDynamicParameters##8 O
(##O P
)##P Q
;##Q R
	parmeters$$ 
.$$ 
Add$$ 
($$ 
name$$ "
:$$" #
$str$$$ 3
,$$3 4

employeeId$$5 ?
,$$? @
dbType$$A G
:$$G H
OracleMappingType$$I Z
.$$Z [
Int64$$[ `
,$$` a
	direction$$b k
:$$k l
ParameterDirection$$m 
.	$$ �
Input
$$� �
)
$$� �
;
$$� �
	parmeters%% 
.%% 
Add%% 
(%% 
name%% "
:%%" #
$str%%$ -
,%%- .
dbType%%/ 5
:%%5 6
OracleMappingType%%7 H
.%%H I
	RefCursor%%I R
,%%R S
	direction%%T ]
:%%] ^
ParameterDirection%%_ q
.%%q r
Output%%r x
)%%x y
;%%y z
IEnumerable&& 
<&& 
HolidayInformation&& .
>&&. /
dbAttendance&&0 <
=&&= >
(&&? @
await&&@ E

connection&&F P
.&&P Q

QueryAsync&&Q [
<&&[ \
HolidayInformation&&\ n
>&&n o
(&&o p
DatabaseProcedures	&&p �
.
&&� �#
P_GET_PORTAL_HOLIDAYS
&&� �
,
&&� �
	parmeters
&&� �
,
&&� �
commandType
&&� �
:
&&� �
CommandType
&&� �
.
&&� �
StoredProcedure
&&� �
)
&&� �
)
&&� �
.
&&� �
ToList
&&� �
(
&&� �
)
&&� �
;
&&� �

attendance'' 
='' 
dbAttendance'' )
.'') *
ToList''* 0
(''0 1
)''1 2
;''2 3
}(( 
return)) 

attendance)) 
;)) 
}** 	
}++ 
},, �*
aF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\AutoApproval\AutoApprovalRespository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
AutoApproval& 2
{ 
public 

class #
AutoApprovalRespository (
:) *
BaseRepository+ 9
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
public #
AutoApprovalRespository &
(& '
IConfiguration' 5

,C D
ILoggerManagerE S
loggerT Z
)Z [
:\ ]
base^ b
(b c

)p q
{ 	
this   
.   

=    

;  . /
this!! 
.!! 
logger!! 
=!! 
logger!!  
;!!  !
}"" 	
public$$ 
async$$ 
Task$$ 
GetAutoApprovals$$ *
($$* +
)$$+ ,
{%% 	
List&& 
<&& 
AutoApprovalDetails&& $
>&&$ %

=&&4 5
null&&6 :
;&&: ;
using'' 
('' 
var'' 

connection'' !
=''" #
await''$ )
CreateConnection''* :
('': ;
DbSchema''; C
.''C D
PORTAL''D J
)''J K
)''K L
{(( 
OracleDynamicParameters)) '
	parmeters))( 1
=))2 3
new))4 7#
OracleDynamicParameters))8 O
())O P
)))P Q
;))Q R
	parmeters** 
.** 
Add** 
(** 
name** "
:**" #
$str**$ -
,**- .
dbType**/ 5
:**5 6
OracleMappingType**7 H
.**H I
	RefCursor**I R
,**R S
	direction**T ]
:**] ^
ParameterDirection**_ q
.**q r
Output**r x
)**x y
;**y z

=++ 
(++  !
await++! &

connection++' 1
.++1 2

QueryAsync++2 <
<++< =
AutoApprovalDetails++= P
>++P Q
(++Q R
DatabaseProcedures++R d
.++d e
GET_AUTO_APPROVALS++e w
,++w x
	parmeters	++y �
,
++� �
commandType
++� �
:
++� �
CommandType
++� �
.
++� �
StoredProcedure
++� �
)
++� �
)
++� �
.
++� �
ToList
++� �
(
++� �
)
++� �
;
++� �
},, 
foreach-- 
(-- 
var-- 
item-- 
in--  

)--. /
{.. 
LeaveDetail// 
leaveDetail// '
=//( )
new//* -
LeaveDetail//. 9
(//9 :
)//: ;
;//; <
bool00 
empLeaveStatus00 #
=00$ %
false00& +
;00+ ,
using11 
(11 %
LeaveManagementRepository11 0%
leaveManagementRepository111 J
=11K L
new11M P
(11P Q

,11^ _
logger11` f
)11f g
)11g h
{22 
leaveDetail33 
.33  
LeaveId33  '
=33( )
item33* .
.33. /
LeaveId33/ 6
;336 7
leaveDetail44 
.44  
WorkFlowTypeId44  .
=44/ 0
item441 5
.445 6
WorkflowTypeId446 D
;44D E
leaveDetail55 
.55  

StepTypeId55  *
=55+ ,
item55- 1
.551 2

StepTypeId552 <
;55< =
leaveDetail66 
.66  
StepMasterId66  ,
=66- .
item66/ 3
.663 4
StepMasterId664 @
;66@ A
leaveDetail77 
.77  

=77. /
LeaveStatusNames770 @
.77@ A
Approved77A I
.77I J
ToInt32OrDefault77J Z
(77Z [
)77[ \
;77\ ]
leaveDetail88 
.88  
EmployeeSlno88  ,
=88- .
item88/ 3
.883 4
EmployeeSno884 ?
;88? @
leaveDetail99 
.99  
ApprovedRemarks99  /
=990 1
$str992 L
;99L M
leaveDetail;; 
.;;  
LeaveTo;;  '
=;;( )
item;;* .
.;;. /
LeaveTo;;/ 6
;;;6 7
leaveDetail<< 
.<<  
	LeaveFrom<<  )
=<<* +
item<<, 0
.<<0 1
	LeaveFrom<<1 :
;<<: ;
leaveDetail== 
.==  
LeaveTypeId==  +
===, -
item==. 2
.==2 3
LeaveTypeId==3 >
;==> ?
empLeaveStatus>> "
=>># $
await>>% *%
leaveManagementRepository>>+ D
.>>D E%
UpdateEmployeeLeaveStatus>>E ^
(>>^ _
leaveDetail>>_ j
)>>j k
;>>k l
}?? 
}AA 
}BB 	
}CC 
}DD ��
XF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\CarLease\CarLeaseRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
CarLease& .
{ 
public 

class 
CarLeaseRepository #
:$ %
BaseRepository& 4
{ 
private 
readonly 
IConfiguration '

;5 6
public 
CarLeaseRepository !
(! "
IConfiguration" 0

)> ?
:@ A
baseB F
(F G

)T U
{ 	
this 
. 

=  

;. /
} 	
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
carLeaseBillName# 3
=4 5
null6 :
;: ;
string 
sqlQuery 
= 
$str ^
;^ _
using   
(   
var   

connection   !
=  " #
await  $ )
base  * .
.  . /
CreateConnection  / ?
(  ? @
DbSchema  @ H
.  H I
PORTAL  I O
)  O P
)  P Q
{!! 
OracleDynamicParameters"" '
	parmeters""( 1
=""2 3
new""4 7#
OracleDynamicParameters""8 O
(""O P
)""P Q
;""Q R
sqlQuery## 
=## 
string## !
.##! "
Format##" (
(##( )
sqlQuery##) 1
,##1 2
$str##3 6
)##6 7
;##7 8
carLeaseBillName$$  
=$$! "
($$# $
await$$$ )

connection$$* 4
.$$4 5

QueryAsync$$5 ?
<$$? @
CarLeaseBillName$$@ P
>$$P Q
($$Q R
sqlQuery$$R Z
,$$Z [
commandType$$\ g
:$$g h
CommandType$$i t
.$$t u
Text$$u y
)$$y z
)$$z {
.$${ |
ToList	$$| �
(
$$� �
)
$$� �
;
$$� �
}%% 
return&& 
carLeaseBillName&& #
;&&# $
}'' 	
public)) 
async)) 
Task)) 
<)) 
List)) 
<)) &
CarLeaseMaintenanceBalance)) 9
>))9 :
>)): ;)
GetCarLeaseMaintenanceBalance))< Y
())Y Z
int))Z ]
empSLNo))^ e
)))e f
{** 	
PagedResultSet++ 
<++ &
CarLeaseMaintenanceBalance++ 5
>++5 6
pagedResultSet++7 E
=++F G
null++H L
;++L M
List,, 
<,, &
CarLeaseMaintenanceBalance,, +
>,,+ ,*
CarLeaseMaintenanceBalanceList,,- K
=,,L M
null,,N R
;,,R S
using-- 
(-- 
var-- 

connection-- !
=--" #
await--$ )
base--* .
.--. /
CreateConnection--/ ?
(--? @
DbSchema--@ H
.--H I
PORTAL--I O
)--O P
)--P Q
{.. 
OracleDynamicParameters// '
	parmeters//( 1
=//2 3
new//4 7#
OracleDynamicParameters//8 O
(//O P
)//P Q
;//Q R
	parmeters00 
.00 
Add00 
(00 
name00 "
:00" #
$str00$ 3
,003 4
empSLNo005 <
,00< =
dbType00> D
:00D E
OracleMappingType00F W
.00W X
Int3200X ]
,00] ^
	direction00_ h
:00h i
ParameterDirection00j |
.00| }
Input	00} �
)
00� �
;
00� �
	parmeters11 
.11 
Add11 
(11 
name11 "
:11" #
$str11$ -
,11- .
dbType11/ 5
:115 6
OracleMappingType117 H
.11H I
	RefCursor11I R
,11R S
	direction11T ]
:11] ^
ParameterDirection11_ q
.11q r
Output11r x
)11x y
;11y z*
CarLeaseMaintenanceBalanceList22 .
=22/ 0
(221 2
await222 7

connection228 B
.22B C

QueryAsync22C M
<22M N&
CarLeaseMaintenanceBalance22N h
>22h i
(22i j
DatabaseProcedures22j |
.22| }'
P_GET_EMP_CL_MAINTE_SELECT	22} �
,
22� �
	parmeters
22� �
,
22� �
commandType
22� �
:
22� �
CommandType
22� �
.
22� �
StoredProcedure
22� �
)
22� �
)
22� �
.
22� �
ToList
22� �
(
22� �
)
22� �
;
22� �
}33 
return44 *
CarLeaseMaintenanceBalanceList44 1
;441 2
}55 	
public66 
async66 
Task66 
<66 
List66 
<66 +
CarLeaseMaintenancePendingBills66 >
>66> ?
>66? @.
"GetCarLeaseMaintenancePendingBills66A c
(66c d
int66d g
empSLNo66h o
)66o p
{77 	
PagedResultSet88 
<88 +
CarLeaseMaintenancePendingBills88 :
>88: ;
pagedResultSet88< J
=88K L
null88M Q
;88Q R
List99 
<99 +
CarLeaseMaintenancePendingBills99 0
>990 1*
CarLeaseMaintenanceBalanceList992 P
=99Q R
null99S W
;99W X
using:: 
(:: 
var:: 

connection:: !
=::" #
await::$ )
base::* .
.::. /
CreateConnection::/ ?
(::? @
DbSchema::@ H
.::H I
PORTAL::I O
)::O P
)::P Q
{;; 
OracleDynamicParameters<< '
	parmeters<<( 1
=<<2 3
new<<4 7#
OracleDynamicParameters<<8 O
(<<O P
)<<P Q
;<<Q R
	parmeters== 
.== 
Add== 
(== 
name== "
:==" #
$str==$ 3
,==3 4
empSLNo==5 <
,==< =
dbType==> D
:==D E
OracleMappingType==F W
.==W X
Int32==X ]
,==] ^
	direction==_ h
:==h i
ParameterDirection==j |
.==| }
Input	==} �
)
==� �
;
==� �
	parmeters>> 
.>> 
Add>> 
(>> 
name>> "
:>>" #
$str>>$ -
,>>- .
dbType>>/ 5
:>>5 6
OracleMappingType>>7 H
.>>H I
	RefCursor>>I R
,>>R S
	direction>>T ]
:>>] ^
ParameterDirection>>_ q
.>>q r
Output>>r x
)>>x y
;>>y z*
CarLeaseMaintenanceBalanceList@@ .
=@@/ 0
(@@1 2
await@@2 7

connection@@8 B
.@@B C

QueryAsync@@C M
<@@M N+
CarLeaseMaintenancePendingBills@@N m
>@@m n
(@@n o
DatabaseProcedures	@@o �
.
@@� �*
P_GET_EMP_CL_MAINBILL_SELECT
@@� �
,
@@� �
	parmeters
@@� �
,
@@� �
commandType
@@� �
:
@@� �
CommandType
@@� �
.
@@� �
StoredProcedure
@@� �
)
@@� �
)
@@� �
.
@@� �
ToList
@@� �
(
@@� �
)
@@� �
;
@@� �
}AA 
returnBB *
CarLeaseMaintenanceBalanceListBB 1
;BB1 2
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
boolEE 
>EE %
UploadCarLeaseMaintenanceEE  9
(EE9 :%
CarLeaseMaintenanceDetailEE: S%
uploadCarLeaseMaintenanceEET m
)EEm n
{FF 	#
OracleDynamicParametersGG #
	parmetersGG$ -
=GG. /
newGG0 3
(GG3 4
)GG4 5
;GG5 6
boolHH 
respHH 
=HH 
falseHH 
;HH 
intII  
updatedParentRecordsII $
=II% &
$numII' (
;II( )
intJJ 
updatedChildRecordsJJ #
=JJ$ %
$numJJ& '
;JJ' (
usingLL 
(LL 
varLL 

connectionLL !
=LL" #
awaitLL$ )
baseLL* .
.LL. /
CreateConnectionLL/ ?
(LL? @
DbSchemaLL@ H
.LLH I
PORTALLLI O
)LLO P
)LLP Q
{MM 
boolNN 
filsUploadStatusNN %
=NN& '
awaitNN( -+
MainteneceUploadFileToDirectoryNN. M
(NNM N%
uploadCarLeaseMaintenanceNNN g
)NNg h
;NNh i
ifOO 
(OO 
filsUploadStatusOO $
)OO$ %
{PP #
OracleDynamicParametersQQ +
paramQQ, 1
=QQ2 3
newQQ4 7
(QQ7 8
)QQ8 9
;QQ9 :
paramRR 
.RR 
AddRR 
(RR 
nameRR "
:RR" #
$strRR$ 2
,RR2 3%
uploadCarLeaseMaintenanceRR4 M
.RRM N
PBranchSLNoRRN Y
,RRY Z
dbTypeRR[ a
:RRa b
OracleMappingTypeRRc t
.RRt u
Int32RRu z
,RRz {
	direction	RR| �
:
RR� � 
ParameterDirection
RR� �
.
RR� �
Input
RR� �
)
RR� �
;
RR� �
paramSS 
.SS 
AddSS 
(SS 
nameSS "
:SS" #
$strSS$ .
,SS. /%
uploadCarLeaseMaintenanceSS0 I
.SSI J
EmpSLNoSSJ Q
,SSQ R
dbTypeSSS Y
:SSY Z
OracleMappingTypeSS[ l
.SSl m
Int32SSm r
,SSr s
	directionSSt }
:SS} ~
ParameterDirection	SS �
.
SS� �
Input
SS� �
)
SS� �
;
SS� �
paramTT 
.TT 
AddTT 
(TT 
nameTT "
:TT" #
$strTT$ /
,TT/ 0%
uploadCarLeaseMaintenanceTT1 J
.TTJ K
UniqueNoTTK S
,TTS T
dbTypeTTU [
:TT[ \
OracleMappingTypeTT] n
.TTn o
Int32TTo t
,TTt u
	directionTTv 
:	TT � 
ParameterDirection
TT� �
.
TT� �
Input
TT� �
)
TT� �
;
TT� �
paramUU 
.UU 
AddUU 
(UU 
nameUU "
:UU" #
$strUU$ /
,UU/ 0%
uploadCarLeaseMaintenanceUU1 J
.UUJ K
UserSLNoUUK S
,UUS T
dbTypeUUU [
:UU[ \
OracleMappingTypeUU] n
.UUn o
Int32UUo t
,UUt u
	directionUUv 
:	UU � 
ParameterDirection
UU� �
.
UU� �
Input
UU� �
)
UU� �
;
UU� �
paramVV 
.VV 
AddVV 
(VV 
nameVV "
:VV" #
$strVV$ /
,VV/ 0
dbTypeVV1 7
:VV7 8
OracleMappingTypeVV9 J
.VVJ K
Int32VVK P
,VVP Q
	directionVVR [
:VV[ \
ParameterDirectionVV] o
.VVo p
OutputVVp v
)VVv w
;VVw x 
updatedParentRecordsWW (
=WW) *
awaitWW+ 0

connectionWW1 ;
.WW; <
ExecuteAsyncWW< H
(WWH I
DatabaseProceduresWWI [
.WW[ \!
SP_EMP_UPLD_CAR_LEASEWW\ q
,WWq r
paramWWs x
,WWx y
commandType	WWz �
:
WW� �
CommandType
WW� �
.
WW� �
StoredProcedure
WW� �
)
WW� �
;
WW� �
varXX 
parentIdXX  
=XX! "
paramXX# (
.XX( )
GetXX) ,
<XX, -
intXX- 0
>XX0 1
(XX1 2
$strXX2 =
)XX= >
;XX> ?
ifZZ 
(ZZ %
uploadCarLeaseMaintenanceZZ 4
.ZZ4 5
FileZZ5 9
!=ZZ9 ;
nullZZ; ?
)ZZ? @
{[[ #
OracleDynamicParameters\\ 3
parm\\4 8
=\\9 :
new\\; >
(\\> ?
)\\? @
;\\@ A
parm]]  
.]]  !
Add]]! $
(]]$ %
name]]% )
:]]) *
$str]]+ 6
,]]6 7
parentId]]8 @
,]]@ A
dbType]]B H
:]]H I
OracleMappingType]]J [
.]][ \
Int32]]\ a
,]]a b
	direction]]c l
:]]l m
ParameterDirection	]]n �
.
]]� �
Input
]]� �
)
]]� �
;
]]� �
parm^^  
.^^  !
Add^^! $
(^^$ %
name^^% )
:^^) *
$str^^+ 4
,^^4 5%
uploadCarLeaseMaintenance^^6 O
.^^O P
Amount^^P V
,^^V W
dbType^^X ^
:^^^ _
OracleMappingType^^` q
.^^q r
Int32^^r w
,^^w x
	direction	^^y �
:
^^� � 
ParameterDirection
^^� �
.
^^� �
Input
^^� �
)
^^� �
;
^^� �
parm__  
.__  !
Add__! $
(__$ %
name__% )
:__) *
$str__+ 6
,__6 7%
uploadCarLeaseMaintenance__8 Q
.__Q R
File__R V
.__V W
FileName__W _
,___ `
dbType__a g
:__g h
OracleMappingType__i z
.__z {
Varchar2	__{ �
,
__� �
	direction
__� �
:
__� � 
ParameterDirection
__� �
.
__� �
Input
__� �
)
__� �
;
__� �
parm``  
.``  !
Add``! $
(``$ %
name``% )
:``) *
$str``+ 6
,``6 7%
uploadCarLeaseMaintenance``8 Q
.``Q R
FilePath``R Z
,``Z [
dbType``\ b
:``b c
OracleMappingType``d u
.``u v
Varchar2``v ~
,``~ 
	direction
``� �
:
``� � 
ParameterDirection
``� �
.
``� �
Input
``� �
)
``� �
;
``� �
parmaa  
.aa  !
Addaa! $
(aa$ %
nameaa% )
:aa) *
$straa+ 6
,aa6 7%
uploadCarLeaseMaintenanceaa8 Q
.aaQ R
CarLeaseSLnoaaR ^
,aa^ _
dbTypeaa` f
:aaf g
OracleMappingTypeaah y
.aay z
Int32aaz 
,	aa �
	direction
aa� �
:
aa� � 
ParameterDirection
aa� �
.
aa� �
Input
aa� �
)
aa� �
;
aa� �
parmbb  
.bb  !
Addbb! $
(bb$ %
namebb% )
:bb) *
$strbb+ 6
,bb6 7%
uploadCarLeaseMaintenancebb8 Q
.bbQ R
BillDatebbR Z
,bbZ [
dbTypebb\ b
:bbb c
OracleMappingTypebbd u
.bbu v
Datebbv z
,bbz {
	direction	bb| �
:
bb� � 
ParameterDirection
bb� �
.
bb� �
Input
bb� �
)
bb� �
;
bb� �
parmcc  
.cc  !
Addcc! $
(cc$ %
namecc% )
:cc) *
$strcc+ 4
,cc4 5%
uploadCarLeaseMaintenancecc6 O
.ccO P
BillNoccP V
,ccV W
dbTypeccX ^
:cc^ _
OracleMappingTypecc` q
.ccq r
Varchar2ccr z
,ccz {
	direction	cc| �
:
cc� � 
ParameterDirection
cc� �
.
cc� �
Input
cc� �
)
cc� �
;
cc� �
updatedChildRecordsdd .
=dd/ 0
awaitdd1 6

connectiondd7 A
.ddA B
ExecuteAsyncddB N
(ddN O
DatabaseProceduresddO a
.dda b%
SP_EMP_UPLD_CAR_LEASE_DDTddb {
,dd{ |
parm	dd} �
,
dd� �
commandType
dd� �
:
dd� �
CommandType
dd� �
.
dd� �
StoredProcedure
dd� �
)
dd� �
;
dd� �
}ee 
}ff 
resphh 
=hh 
(hh  
updatedParentRecordshh ,
*hh- .
-hh/ 0
$numhh0 1
)hh1 2
>hh3 4
$numhh5 6
&&hh7 9
(hh: ;
updatedChildRecordshh; N
*hhO P
-hhQ R
$numhhR S
)hhS T
>hhU V
$numhhW X
;hhX Y
}ii 
returnjj 
respjj 
;jj 
}kk 	
publicmm 
asyncmm 
Taskmm 
<mm 
boolmm 
>mm !
DeleteMaintenenceBillmm  5
(mm5 6
intmm6 9
recordIdmm: B
)mmB C
{nn 	
usingoo 
(oo 
varoo 

connectionoo !
=oo" #
awaitoo$ )
baseoo* .
.oo. /
CreateConnectionoo/ ?
(oo? @
DbSchemaoo@ H
.ooH I
PORTALooI O
)ooO P
)ooP Q
{pp 
OracleDynamicParametersqq '
	parmetersqq( 1
=qq2 3
newqq4 7#
OracleDynamicParametersqq8 O
(qqO P
)qqP Q
;qqQ R
	parmetersrr 
.rr 
Addrr 
(rr 
namerr "
:rr" #
$strrr$ /
,rr/ 0
recordIdrr1 9
,rr9 :
dbTyperr; A
:rrA B
OracleMappingTyperrC T
.rrT U
Int32rrU Z
,rrZ [
	directionrr\ e
:rre f
ParameterDirectionrrg y
.rry z
Inputrrz 
)	rr �
;
rr� �
varss 
responsess 
=ss 
awaitss "

connectionss# -
.ss- .

QueryAsyncss. 8
<ss8 9
boolss9 =
>ss= >
(ss> ?
DatabaseProceduresss? Q
.ssQ R$
P_DELETE_EMP_CL_MAINBILLssR j
,ssj k
	parmetersssl u
,ssu v
commandType	ssw �
:
ss� �
CommandType
ss� �
.
ss� �
StoredProcedure
ss� �
)
ss� �
;
ss� �
}tt 
returnuu 
trueuu 
;uu 
}vv 	
publiczz 
asynczz 
Taskzz 
<zz 
Listzz 
<zz "
CarLeaseAgreementBillszz 5
>zz5 6
>zz6 7%
GetCarLeaseAgreementBillszz8 Q
(zzQ R
intzzR U
employeeSLNozzV b
)zzb c
{{{ 	
List|| 
<|| "
CarLeaseAgreementBills|| '
>||' (*
CarLeaseMaintenanceBalanceList||) G
=||H I
null||J N
;||N O
using}} 
(}} 
var}} 

connection}} !
=}}" #
await}}$ )
base}}* .
.}}. /
CreateConnection}}/ ?
(}}? @
DbSchema}}@ H
.}}H I
PORTAL}}I O
)}}O P
)}}P Q
{~~ 
OracleDynamicParameters '
	parmeters( 1
=2 3
new4 7#
OracleDynamicParameters8 O
(O P
)P Q
;Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSLNo
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z,
CarLeaseMaintenanceBalanceList
�� .
=
��/ 0
(
��1 2
await
��2 7

connection
��8 B
.
��B C

QueryAsync
��C M
<
��M N$
CarLeaseAgreementBills
��N d
>
��d e
(
��e f 
DatabaseProcedures
��f x
.
��x y(
P_GET_EMP_CL_AGREE_SELECT��y �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� ,
CarLeaseMaintenanceBalanceList
�� 1
;
��1 2
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� )
UploadCarLeaseAgreementBill
��  ;
(
��; <
List
��< @
<
��@ A$
CarLeaseAgreementBills
��A W
>
��W X)
carLeaseAgreementBillUpload
��Y t
)
��t u
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; <
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
bool
�� 
filsUploadStatus
�� %
=
��& '
await
��( -0
"AgreementBillUploadFileToDirectory
��. P
(
��P Q)
carLeaseAgreementBillUpload
��Q l
)
��l m
;
��m n
if
�� 
(
�� 
filsUploadStatus
�� $
)
��$ %
{
�� )
carLeaseAgreementBillUpload
�� /
.
��/ 0
ForEach
��0 7
(
��7 8
	agreement
��8 A
=>
��B D
{
�� %
OracleDynamicParameters
�� /
param
��0 5
=
��6 7
new
��8 ;
(
��; <
)
��< =
;
��= >
param
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( =
,
��= >
	agreement
��? H
.
��H I 
EmpCarLeasedDTSLNo
��I [
,
��[ \
dbType
��] c
:
��c d
OracleMappingType
��e v
.
��v w
Int32
��w |
,
��| }
	direction��~ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 3
,
��3 4
	agreement
��5 >
.
��> ?
FileData
��? G
.
��G H
FileName
��H P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 3
,
��3 4
	agreement
��5 >
.
��> ?
FilePath
��? G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Varchar2
��c k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 1
,
��1 2
	agreement
��3 <
.
��< =
BillNo
��= C
,
��C D
dbType
��E K
:
��K L
OracleMappingType
��M ^
.
��^ _
Varchar2
��_ g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 3
,
��3 4
	agreement
��5 >
.
��> ?
BillDate
��? G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Date
��c g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 2
,
��2 3
	agreement
��4 =
.
��= >
Remarks
��> E
,
��E F
dbType
��G M
:
��M N
OracleMappingType
��O `
.
��` a
Varchar2
��a i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� !
.
��! "
Add
��" %
(
��% &
param
��& +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
await
�� 

connection
�� $
.
��$ %
ExecuteAsync
��% 1
(
��1 2 
DatabaseProcedures
��2 D
.
��D E)
SP_EMP_CL_AGRE_BILLS_UPLOAD
��E `
,
��` a
	parmeters
��b k
,
��k l
commandType
��m x
:
��x y
CommandType��z �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
true
�� 
;
�� 
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  0
"AgreementBillUploadFileToDirectory
��! C
(
��C D
List
��D H
<
��H I$
CarLeaseAgreementBills
��I _
>
��_ `$
carLeaseAgreementBills
��a w
)
��w x
{
�� 	
if
�� 
(
�� $
carLeaseAgreementBills
�� &
!=
��' )
null
��* .
&&
��/ 1$
carLeaseAgreementBills
��2 H
.
��H I
Count
��I N
>
��O P
$num
��Q R
)
��R S
{
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $$
carLeaseAgreementBills
��% ;
)
��; <
{
�� 
string
�� 
filePath
�� #
=
��$ %
Path
��& *
.
��* +
Combine
��+ 2
(
��2 3!
ApplicationSettings
��3 F
.
��F G
Current
��G N
.
��N O$
CarLeaseAgreementsPath
��O e
,
��e f
item
��g k
.
��k l
	MonthSlNo
��l u
.
��u v 
ToStringOrDefault��v �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
!
�� 
	Directory
�� "
.
��" #
Exists
��# )
(
��) *
filePath
��* 2
)
��2 3
)
��3 4
{
�� 
	Directory
�� !
.
��! "
CreateDirectory
��" 1
(
��1 2
filePath
��2 :
)
��: ;
;
��; <
}
�� 
string
�� 
fileType
�� #
=
��$ %
Path
��& *
.
��* +
GetExtension
��+ 7
(
��7 8
item
��8 <
.
��< =
FileData
��= E
.
��E F
FileName
��F N
)
��N O
.
��O P
ToString
��P X
(
��X Y
)
��Y Z
.
��Z [
ToLower
��[ b
(
��b c
)
��c d
;
��d e
string
�� 
fileName
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
$str
��4 E
,
��E F
item
��G K
.
��K L
EmployeeSlno
��L X
,
��X Y
item
��Z ^
.
��^ _
BillNo
��_ e
,
��e f
DateTime
��g o
.
��o p
Now
��p s
.
��s t
Ticks
��t y
,
��y z
fileType��{ �
,��� �
item��� �
.��� �
EmployeeSlno��� �
)��� �
;��� �
filePath
�� 
=
�� 
Path
�� #
.
��# $
Combine
��$ +
(
��+ ,
filePath
��, 4
,
��4 5
fileName
��6 >
)
��> ?
;
��? @
if
�� 
(
�� 
!
�� 
File
�� 
.
�� 
Exists
�� $
(
��$ %
filePath
��% -
)
��- .
)
��. /
{
�� 
string
�� 
base64String
�� +
=
��, -
item
��. 2
.
��2 3
	FileImage
��3 <
.
��< =
	Substring
��= F
(
��F G
item
��G K
.
��K L
	FileImage
��L U
.
��U V
IndexOf
��V ]
(
��] ^
$char
��^ a
)
��a b
+
��c d
$num
��e f
)
��f g
;
��g h
byte
�� 
[
�� 
]
�� 

imageBytes
�� )
=
��* +
Convert
��, 3
.
��3 4
FromBase64String
��4 D
(
��D E
base64String
��E Q
)
��Q R
;
��R S
File
�� 
.
�� 

�� *
(
��* +
filePath
��+ 3
,
��3 4

imageBytes
��5 ?
)
��? @
;
��@ A
item
�� 
.
�� 
FilePath
�� %
=
��& '
filePath
��( 0
;
��0 1
item
�� 
.
�� 
FileData
�� %
.
��% &
FileName
��& .
=
��/ 0
fileName
��1 9
;
��9 :
}
�� 
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  -
MainteneceUploadFileToDirectory
��! @
(
��@ A'
CarLeaseMaintenanceDetail
��A Z'
uploadCarLeaseMaintenance
��[ t
)
��t u
{
�� 	
if
�� 
(
�� '
uploadCarLeaseMaintenance
�� )
!=
��) +
null
��+ /
)
��/ 0
{
�� 
string
�� 
filePath
�� #
=
��$ %
Path
��& *
.
��* +
Combine
��+ 2
(
��2 3!
ApplicationSettings
��3 F
.
��F G
Current
��G N
.
��N O%
CarLeaseMaintenancePath
��O f
)
��f g
;
��g h
if
�� 
(
�� 
!
�� 
	Directory
�� "
.
��" #
Exists
��# )
(
��) *
filePath
��* 2
)
��2 3
)
��3 4
{
�� 
	Directory
�� !
.
��! "
CreateDirectory
��" 1
(
��1 2
filePath
��2 :
)
��: ;
;
��; <
}
�� 
string
�� 
fileType
�� #
=
��$ %
Path
��& *
.
��* +
GetExtension
��+ 7
(
��7 8'
uploadCarLeaseMaintenance
��8 Q
.
��Q R
File
��R V
.
��V W
FileName
��W _
)
��_ `
.
��` a
ToString
��a i
(
��i j
)
��j k
.
��k l
ToLower
��l s
(
��s t
)
��t u
;
��u v
string
�� 
fileName
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
$str
��4 H
,
��H I'
uploadCarLeaseMaintenance
��J c
.
��c d
EmpSLNo
��d k
,
��k l(
uploadCarLeaseMaintenance��l �
.��� �
UniqueNo��� �
,��� �)
uploadCarLeaseMaintenance��� �
.��� �
BillNo��� �
,��� �
DateTime��� �
.��� �
Now��� �
.��� �
Ticks��� �
,��� �)
uploadCarLeaseMaintenance��� �
.��� �
EmpSLNo��� �
,��� �
fileType��� �
)��� �
;��� �
filePath
�� 
=
�� 
Path
�� #
.
��# $
Combine
��$ +
(
��+ ,
filePath
��, 4
,
��4 5
fileName
��6 >
)
��> ?
;
��? @
if
�� 
(
�� 
!
�� 
File
�� 
.
�� 
Exists
�� $
(
��$ %
filePath
��% -
)
��- .
)
��. /
{
�� 
string
�� 
base64String
�� +
=
��, -'
uploadCarLeaseMaintenance
��. G
.
��G H
File
��H L
.
��L M
FileAsBase64
��M Y
.
��Y Z
	Substring
��Z c
(
��c d'
uploadCarLeaseMaintenance
��d }
.
��} ~
File��~ �
.��� �
FileAsBase64��� �
.��� �
IndexOf��� �
(��� �
$char��� �
)��� �
+��� �
$num��� �
)��� �
;��� �
byte
�� 
[
�� 
]
�� 

imageBytes
�� )
=
��* +
Convert
��, 3
.
��3 4
FromBase64String
��4 D
(
��D E
base64String
��E Q
)
��Q R
;
��R S
File
�� 
.
�� 

�� *
(
��* +
filePath
��+ 3
,
��3 4

imageBytes
��5 ?
)
��? @
;
��@ A'
uploadCarLeaseMaintenance
�� -
.
��- .
FilePath
��. 6
=
��7 8
filePath
��9 A
;
��A B'
uploadCarLeaseMaintenance
�� -
.
��- .
File
��. 2
.
��2 3
FileName
��3 ;
=
��< =
fileName
��> F
;
��F G
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
}
�� 
}�� �
ZF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Districts\DistrictsRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
	Districts& /
{ 
public 

class 
DistrictsRepository $
:$ %
BaseRepository& 4
{ 
private 
readonly 
IConfiguration '

;5 6
public 
DistrictsRepository "
(" #
IConfiguration# 1

)? @
:A B
baseC G
(G H

)U V
{ 	
this 
. 

=  

;. /
} 	
public 
async 
Task 
< 
List 
< 
DistrictDetails .
>. /
>/ 0
GetDistrictDetails1 C
(C D
intD G
	stateSlNoH Q
)Q R
{ 	
List 
< 
DistrictDetails  
>  !
districtDetails" 1
=2 3
null4 8
;8 9
using 
( 
var 

connection !
=" #
await$ )
base* .
.. /
CreateConnection/ ?
(? @
DbSchema@ H
.H I
PORTALI O
)O P
)P Q
{ 
OracleDynamicParameters   '
	parmeters  ( 1
=  2 3
new  4 7#
OracleDynamicParameters  8 O
(  O P
)  P Q
;  Q R
	parmeters!! 
.!! 
Add!! 
(!! 
name!! "
:!!" #
$str!!$ 0
,!!0 1
	stateSlNo!!2 ;
,!!; <
dbType!!= C
:!!C D
OracleMappingType!!E V
.!!V W
Int32!!W \
,!!\ ]
	direction!!^ g
:!!g h
ParameterDirection!!i {
.!!{ |
Input	!!| �
)
!!� �
;
!!� �
	parmeters"" 
."" 
Add"" 
("" 
name"" "
:""" #
$str""$ -
,""- .
dbType""/ 5
:""5 6
OracleMappingType""7 H
.""H I
	RefCursor""I R
,""R S
	direction""T ]
:""] ^
ParameterDirection""_ q
.""q r
Output""r x
)""x y
;""y z
districtDetails## 
=##  !
(##" #
await### (

connection##) 3
.##3 4

QueryAsync##4 >
<##> ?
DistrictDetails##? N
>##N O
(##O P
DatabaseProcedures##P b
.##b c
DISTRICT_DETAILS##c s
,##s t
	parmeters##u ~
,##~ 
commandType
##� �
:
##� �
CommandType
##� �
.
##� �
StoredProcedure
##� �
)
##� �
)
##� �
.
##� �
ToList
##� �
(
##� �
)
##� �
;
##� �
}$$ 
return%% 
districtDetails%% "
;%%" #
}&& 	
}'' 
}(( ��
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\EmployeeVerification\EmployeeVerificationRespository.cs
	namespace%% 	
Phoenix%%
 
.%% 
Database%% 
.%% 

Repository%% %
.%%% & 
EmployeeVerification%%& :
{&& 
public'' 

class'' +
EmployeeVerificationRespository'' 0
:''1 2
BaseRepository''3 A
{(( 
private)) 
readonly)) 
IConfiguration)) '

;))5 6
public** +
EmployeeVerificationRespository** .
(**. /
IConfiguration**/ =

)**K L
:**M N
base**O S
(**S T

)**a b
{++ 	
this,, 
.,, 

=,,  

;,,. /
}-- 	
public// 
async// 
Task// 
<// 
Root// 
>//  
GetVerficationResult//  4
(//4 5
string//5 ;

,//I J
int//K N
?//N O
EmployeeSlno//P \
=//] ^
null//_ c
)//c d
{00 	
RestClientOptions11 
options11 %
=11& '
new11( +
RestClientOptions11, =
(11= >

.11K L
Current11L S
.11S T
EqualGateWayUrl11T c
)11c d
{22 
Timeout33 
=33 
-33 
$num33 
}44 
;44

RestClient66 
client66 
=66 
new66  #

RestClient66$ .
(66. /
options66/ 6
)666 7
;667 8
RestRequest77 
request77 
=77  !
new77" %
RestRequest77& 1
(771 2

.77? @
Current77@ G
.77G H
	FetchData77H Q
,77Q R
Method77S Y
.77Y Z
Post77Z ^
)77^ _
;77_ `
client88 
.88 

=88! "
new88# &"
HttpBasicAuthenticator88' =
(88= >

.88K L
Current88L S
.88S T
ClientId88T \
,88\ ]

.88k l
Current88l s
.88s t
ClientSecret	88t �
)
88� �
;
88� �
request99 
.99 
	AddHeader99 
(99 
$str99 ,
,99, -
$str99. @
)99@ A
;99A B
request:: 
.:: 
	AddHeader:: 
(:: 
$str:: &
,::& '
$str::( :
)::: ;
;::; <
string;; 
body;; 
=;; 
string;;  
.;;  !
Format;;! '
(;;' (
$str;;( 1
,;;1 2

);;@ A
;;;A B
request<< 
.<< 

(<<! "
body<<" &
,<<& '

DataFormat<<( 2
.<<2 3
Json<<3 7
)<<7 8
;<<8 9
RestResponse== 
response== !
===" #
await==$ )
client==* 0
.==0 1
ExecuteAsync==1 =
(=== >
request==> E
)==E F
;==F G
Root>> 
verificationResult>> #
=>>$ %
JsonConvert>>& 1
.>>1 2
DeserializeObject>>2 C
<>>C D
Root>>D H
>>>H I
(>>I J
response>>J R
.>>R S
Content>>S Z
)>>Z [
;>>[ \
if?? 
(?? 
verificationResult?? !
.??! "
data??" &
!=??' )
null??* .
&&??/ 1
EmployeeSlno??2 >
!=??? A
null??B F
)??F G
{@@ 
verificationResultAA "
.AA" #

AadharPathAA# -
=AA. /
awaitAA0 5!
GetEmployeeAadharPathAA6 K
(AAK L
EmployeeSlnoAAL X
)AAX Y
;AAY Z
}BB 
returnCC 
verificationResultCC %
;CC% &
}DD 	
privateHH 
stringHH 
GetPanHashCodeHH %
(HH% &
PANHH& )

panDetailsHH* 4
,HH4 5
stringHH6 <

,HHJ K
intHHL O
employeeSlnoHHP \
)HH\ ]
{II 	
intJJ 
resultJJ 
=JJ 
$numJJ 
;JJ 
resultLL 
=LL 
(LL 
resultLL 
*LL 
$numLL "
)LL" #
^LL$ %
employeeSlnoLL& 2
.LL2 3
GetHashCodeLL3 >
(LL> ?
)LL? @
;LL@ A
resultMM 
=MM 
(MM 
resultMM 
*MM 
$numMM "
)MM" #
^MM$ %

.MM3 4
GetHashCodeMM4 ?
(MM? @
)MM@ A
;MMA B
resultNN 
=NN 
(NN 
resultNN 
*NN 
$numNN "
)NN" #
^NN$ %

panDetailsNN& 0
.NN0 1
key_nameNN1 9
.NN9 :
GetHashCodeNN: E
(NNE F
)NNF G
;NNG H
resultOO 
=OO 
(OO 
resultOO 
*OO 
$numOO "
)OO" #
^OO$ %

panDetailsOO& 0
.OO0 1

key_statusOO1 ;
.OO; <
GetHashCodeOO< G
(OOG H
)OOH I
;OOI J
resultPP 
=PP 
(PP 
resultPP 
*PP 
$numPP "
)PP" #
^PP$ %

panDetailsPP& 0
.PP0 1
key_dataPP1 9
[PP9 :
$numPP: ;
]PP; <
.PP< =
genderPP= C
.PPC D
GetHashCodePPD O
(PPO P
)PPP Q
;PPQ R
resultQQ 
=QQ 
(QQ 
resultQQ 
*QQ 
$numQQ "
)QQ" #
^QQ$ %

panDetailsQQ& 0
.QQ0 1
key_dataQQ1 9
[QQ9 :
$numQQ: ;
]QQ; <
.QQ< =
key_idQQ= C
.QQC D
GetHashCodeQQD O
(QQO P
)QQP Q
;QQQ R
resultRR 
=RR 
(RR 
resultRR 
*RR 
$numRR "
)RR" #
^RR$ %

panDetailsRR& 0
.RR0 1
key_dataRR1 9
[RR9 :
$numRR: ;
]RR; <
.RR< =
dobRR= @
.RR@ A
GetHashCodeRRA L
(RRL M
)RRM N
;RRN O
resultSS 
=SS 
(SS 
resultSS 
*SS 
$numSS "
)SS" #
^SS$ %

panDetailsSS& 0
.SS0 1
key_dataSS1 9
[SS9 :
$numSS: ;
]SS; <
.SS< =
nameSS= A
.SSA B
GetHashCodeSSB M
(SSM N
)SSN O
;SSO P
resultTT 
=TT 
(TT 
resultTT 
*TT 
$numTT "
)TT" #
^TT$ %

panDetailsTT& 0
.TT0 1
key_dataTT1 9
[TT9 :
$numTT: ;
]TT; <
.TT< =
key_fetched_atTT= K
.TTK L
GetHashCodeTTL W
(TTW X
)TTX Y
;TTY Z
returnUU 
resultUU 
.UU 
ToStringUU "
(UU" #
)UU# $
;UU$ %
}VV 	
privateYY 
stringYY 
GetAadharHashCodeYY (
(YY( )
AADHAARYY) 0

,YY> ?
stringYY@ F

,YYT U
intYYV Y
employeeSlnoYYZ f
)YYf g
{ZZ 	
int[[ 
result[[ 
=[[ 
$num[[ 
;[[ 
result]] 
=]] 
(]] 
result]] 
*]] 
$num]] "
)]]" #
^]]$ %
employeeSlno]]& 2
.]]2 3
GetHashCode]]3 >
(]]> ?
)]]? @
;]]@ A
result^^ 
=^^ 
(^^ 
result^^ 
*^^ 
$num^^ "
)^^" #
^^^$ %

.^^3 4
GetHashCode^^4 ?
(^^? @
)^^@ A
;^^A B
result__ 
=__ 
(__ 
result__ 
*__ 
$num__ "
)__" #
^__$ %

.__3 4
key_name__4 <
.__< =
GetHashCode__= H
(__H I
)__I J
;__J K
result`` 
=`` 
(`` 
result`` 
*`` 
$num`` "
)``" #
^``$ %

.``3 4

key_status``4 >
.``> ?
GetHashCode``? J
(``J K
)``K L
;``L M
resultaa 
=aa 
(aa 
resultaa 
*aa 
$numaa "
)aa" #
^aa$ %

.aa3 4
key_dataaa4 <
[aa< =
$numaa= >
]aa> ?
.aa? @
genderaa@ F
.aaF G
GetHashCodeaaG R
(aaR S
)aaS T
;aaT U
resultbb 
=bb 
(bb 
resultbb 
*bb 
$numbb "
)bb" #
^bb$ %

.bb3 4
key_databb4 <
[bb< =
$numbb= >
]bb> ?
.bb? @
key_idbb@ F
.bbF G
GetHashCodebbG R
(bbR S
)bbS T
;bbT U
resultcc 
=cc 
(cc 
resultcc 
*cc 
$numcc "
)cc" #
^cc$ %

.cc3 4
key_datacc4 <
[cc< =
$numcc= >
]cc> ?
.cc? @
dobcc@ C
.ccC D
GetHashCodeccD O
(ccO P
)ccP Q
;ccQ R
resultdd 
=dd 
(dd 
resultdd 
*dd 
$numdd "
)dd" #
^dd$ %

.dd3 4
key_datadd4 <
[dd< =
$numdd= >
]dd> ?
.dd? @
namedd@ D
.ddD E
GetHashCodeddE P
(ddP Q
)ddQ R
;ddR S
resultee 
=ee 
(ee 
resultee 
*ee 
$numee "
)ee" #
^ee$ %

.ee3 4
key_dataee4 <
[ee< =
$numee= >
]ee> ?
.ee? @
key_fetched_atee@ N
.eeN O
GetHashCodeeeO Z
(eeZ [
)ee[ \
;ee\ ]
returnff 
resultff 
.ff 
ToStringff "
(ff" #
)ff# $
;ff$ %
}gg 	
privatehh 
stringhh 
GetBankHashCodehh &
(hh& '
BANKACCOUNThh' 2
bankDetailshh3 >
,hh> ?
stringhh@ F

,hhT U
inthhV Y
employeeSlnohhZ f
)hhf g
{ii 	
intjj 
resultjj 
=jj 
$numjj 
;jj 
resultll 
=ll 
(ll 
resultll 
*ll 
$numll "
)ll" #
^ll$ %
employeeSlnoll& 2
.ll2 3
GetHashCodell3 >
(ll> ?
)ll? @
;ll@ A
resultmm 
=mm 
(mm 
resultmm 
*mm 
$nummm "
)mm" #
^mm$ %

.mm3 4
GetHashCodemm4 ?
(mm? @
)mm@ A
;mmA B
resultnn 
=nn 
(nn 
resultnn 
*nn 
$numnn "
)nn" #
^nn$ %
bankDetailsnn& 1
.nn1 2
key_namenn2 :
.nn: ;
GetHashCodenn; F
(nnF G
)nnG H
;nnH I
resultoo 
=oo 
(oo 
resultoo 
*oo 
$numoo "
)oo" #
^oo$ %
bankDetailsoo& 1
.oo1 2

key_statusoo2 <
.oo< =
GetHashCodeoo= H
(ooH I
)ooI J
;ooJ K
resultpp 
=pp 
(pp 
resultpp 
*pp 
$numpp "
)pp" #
^pp$ %
bankDetailspp& 1
.pp1 2
key_datapp2 :
[pp: ;
$numpp; <
]pp< =
.pp= >
account_numberpp> L
.ppL M
GetHashCodeppM X
(ppX Y
)ppY Z
;ppZ [
resultqq 
=qq 
(qq 
resultqq 
*qq 
$numqq "
)qq" #
^qq$ %
bankDetailsqq& 1
.qq1 2
key_dataqq2 :
[qq: ;
$numqq; <
]qq< =
.qq= >
	bank_nameqq> G
.qqG H
GetHashCodeqqH S
(qqS T
)qqT U
;qqU V
resultrr 
=rr 
(rr 
resultrr 
*rr 
$numrr "
)rr" #
^rr$ %
bankDetailsrr& 1
.rr1 2
key_datarr2 :
[rr: ;
$numrr; <
]rr< =
.rr= >
branch_namerr> I
.rrI J
GetHashCoderrJ U
(rrU V
)rrV W
;rrW X
resultss 
=ss 
(ss 
resultss 
*ss 
$numss "
)ss" #
^ss$ %
bankDetailsss& 1
.ss1 2
key_datass2 :
[ss: ;
$numss; <
]ss< =
.ss= >
ifscss> B
.ssB C
GetHashCodessC N
(ssN O
)ssO P
;ssP Q
resulttt 
=tt 
(tt 
resulttt 
*tt 
$numtt "
)tt" #
^tt$ %
bankDetailstt& 1
.tt1 2
key_datatt2 :
[tt: ;
$numtt; <
]tt< =
.tt= >
key_fetched_attt> L
.ttL M
GetHashCodettM X
(ttX Y
)ttY Z
;ttZ [
returnuu 
resultuu 
.uu 
ToStringuu "
(uu" #
)uu# $
;uu$ %
}vv 	
publicww 
asyncww 
Taskww 
<ww 
boolww 
>ww $
SaveEmployeeVerifiedDataww  8
(ww8 9
stringww9 ?

,wwM N
intwwO R
employeeSlnowwS _
)ww_ `
{xx 	
intyy 
panRowsSavedyy 
=yy 
$numyy  
;yy  !
intzz 
aadharRowsSavedzz 
=zz  !
$numzz" #
;zz# $
int{{ 

={{ 
$num{{  !
;{{! "
int|| 
isEmployeeUpdated|| !
=||" #
$num||$ %
;||% &
bool}} 
isSucess}} 
=}} 
false}} !
;}}! "
Root~~ 
verificationResult~~ #
=~~$ %
await~~& + 
GetVerficationResult~~, @
(~~@ A

)~~N O
;~~O P
if
�� 
(
��  
verificationResult
�� "
!=
��# %
null
��& *
&&
��+ - 
verificationResult
��. @
.
��@ A
status
��A G
.
��G H
ToUpper
��H O
(
��O P
)
��P Q
==
��R T
$str
��U ^
)
��^ _
{
�� 
PAN
�� 

panDetails
�� 
=
��   
verificationResult
��! 3
.
��3 4
data
��4 8
.
��8 9
key_details
��9 D
.
��D E
PAN
��E H
;
��H I
AADHAAR
�� 
aADHAAR
�� 
=
��  ! 
verificationResult
��" 4
.
��4 5
data
��5 9
.
��9 :
key_details
��: E
.
��E F
AADHAAR
��F M
;
��M N
BANKACCOUNT
�� 
bankAccount
�� '
=
��( ) 
verificationResult
��* <
.
��< =
data
��= A
.
��A B
key_details
��B M
.
��M N
BANK_ACCOUNT
��N Z
;
��Z [
DRIVINGLICENCE
�� 
drivingLicence
�� -
=
��. / 
verificationResult
��0 B
.
��B C
data
��C G
.
��G H
key_details
��H S
.
��S T
DRIVING_LICENCE
��T c
;
��c d
if
�� 
(
�� 

panDetails
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
using
�� 
(
�� 
var
�� 

connection
�� )
=
��* +
await
��, 1
base
��2 6
.
��6 7
CreateConnection
��7 G
(
��G H
DbSchema
��H P
.
��P Q
PORTAL
��Q W
)
��W X
)
��X Y
{
�� %
OracleDynamicParameters
�� /

parameters
��0 :
=
��; <
new
��= @%
OracleDynamicParameters
��A X
(
��X Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?

��@ M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
employeeSlno
��> J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Varchar2
��f n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 8
,
��8 9

panDetails
��: D
.
��D E
key_name
��E M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;

panDetails
��< F
.
��F G

key_status
��G Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Varchar2
��m u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 6
,
��6 7

panDetails
��8 B
.
��B C
key_data
��C K
[
��K L
$num
��L M
]
��M N
.
��N O
gender
��O U
,
��U V
dbType
��W ]
:
��] ^
OracleMappingType
��_ p
.
��p q
Varchar2
��q y
,
��y z
	direction��{ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 6
,
��6 7

panDetails
��8 B
.
��B C
key_data
��C K
[
��K L
$num
��L M
]
��M N
.
��N O
key_id
��O U
,
��U V
dbType
��W ]
:
��] ^
OracleMappingType
��_ p
.
��p q
Varchar2
��q y
,
��y z
	direction��{ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 3
,
��3 4

panDetails
��5 ?
.
��? @
key_data
��@ H
[
��H I
$num
��I J
]
��J K
.
��K L
dob
��L O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Varchar2
��k s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 4
,
��4 5

panDetails
��6 @
.
��@ A
key_data
��A I
[
��I J
$num
��J K
]
��K L
.
��L M
name
��M Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Varchar2
��m u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;

panDetails
��< F
.
��F G
key_data
��G O
[
��O P
$num
��P Q
]
��Q R
.
��R S

key_report
��S ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Varchar2��y �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 8
,
��8 9

panDetails
��: D
.
��D E
key_data
��E M
[
��M N
$num
��N O
]
��O P
.
��P Q
key_buid
��Q Y
,
��Y Z
dbType
��[ a
:
��a b
OracleMappingType
��c t
.
��t u
Varchar2
��u }
,
��} ~
	direction�� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =

panDetails
��> H
.
��H I
key_data
��I Q
[
��Q R
$num
��R S
]
��S T
.
��T U
key_provider
��U a
,
��a b
dbType
��c i
:
��i j
OracleMappingType
��k |
.
��| }
Varchar2��} �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?

panDetails
��@ J
.
��J K
key_data
��K S
[
��S T
$num
��T U
]
��U V
.
��V W
key_global_uid
��W e
,
��e f
dbType
��g m
:
��m n 
OracleMappingType��o �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;

panDetails
��< F
.
��F G
key_data
��G O
[
��O P
$num
��P Q
]
��Q R
.
��R S

key_source
��S ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Varchar2��y �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?

panDetails
��@ J
.
��J K
key_data
��K S
[
��S T
$num
��T U
]
��U V
.
��V W
key_fetched_at
��W e
,
��e f
dbType
��g m
:
��m n 
OracleMappingType��o �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
GetPanHashCode
��? M
(
��M N

panDetails
��N X
,
��X Y

��Z g
,
��g h
employeeSlno
��i u
)
��u v
,
��v w
dbType
��x ~
:
��~ !
OracleMappingType��� �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
panRowsSaved
�� $
=
��% &
await
��' ,

connection
��- 7
.
��7 8
ExecuteAsync
��8 D
(
��D E 
DatabaseProcedures
��E W
.
��W X"
SP_SAVE_EMPLOYEE_PAN
��X l
,
��l m

parameters
��n x
,
��x y
commandType��z �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
}
�� 
if
�� 
(
�� 
aADHAAR
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
using
�� 
(
�� 
var
�� 

connection
�� )
=
��* +
await
��, 1
base
��2 6
.
��6 7
CreateConnection
��7 G
(
��G H
DbSchema
��H P
.
��P Q
PORTAL
��Q W
)
��W X
)
��X Y
{
�� %
OracleDynamicParameters
�� /

parameters
��0 :
=
��; <
new
��= @%
OracleDynamicParameters
��A X
(
��X Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?

��@ M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
employeeSlno
��> J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 8
,
��8 9
aADHAAR
��: A
.
��A B
key_name
��B J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Varchar2
��f n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;
aADHAAR
��< C
.
��C D

key_status
��D N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Varchar2
��j r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
aADHAAR
��> E
.
��E F
key_data
��F N
[
��N O
$num
��O P
]
��P Q
.
��Q R
address_area
��R ^
,
��^ _
dbType
��` f
:
��f g
OracleMappingType
��h y
.
��y z
Varchar2��z �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 8
,
��8 9
aADHAAR
��: A
.
��A B
key_data
��B J
[
��J K
$num
��K L
]
��L M
.
��M N
equal_artefact
��N \
,
��\ ]
dbType
��^ d
:
��d e
OracleMappingType
��f w
.
��w x
Varchar2��x �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 7
,
��7 8
aADHAAR
��9 @
.
��@ A
key_data
��A I
[
��I J
$num
��J K
]
��K L
.
��L M
address
��M T
,
��T U
dbType
��V \
:
��\ ]
OracleMappingType
��^ o
.
��o p
Varchar2
��p x
,
��x y
	direction��z �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 6
,
��6 7
aADHAAR
��8 ?
.
��? @
key_data
��@ H
[
��H I
$num
��I J
]
��J K
.
��K L
gender
��L R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Varchar2
��n v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
aADHAAR
��? F
.
��F G
key_data
��G O
[
��O P
$num
��P Q
]
��Q R
.
��R S

��S `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Varchar2��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 6
,
��6 7
aADHAAR
��8 ?
.
��? @
key_data
��@ H
[
��H I
$num
��I J
]
��J K
.
��K L
key_id
��L R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Varchar2
��n v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ?
,
��? @
aADHAAR
��A H
.
��H I
key_data
��I Q
[
��Q R
$num
��R S
]
��S T
.
��T U
address_country
��U d
,
��d e
dbType
��f l
:
��l m
OracleMappingType
��n 
.�� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
aADHAAR
��? F
.
��F G
key_data
��G O
[
��O P
$num
��P Q
]
��Q R
.
��R S

��S `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Varchar2��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 5
,
��5 6
aADHAAR
��7 >
.
��> ?
key_data
��? G
[
��G H
$num
��H I
]
��I J
.
��J K
photo
��K P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- A
,
��A B
aADHAAR
��C J
.
��J K
key_data
��K S
[
��S T
$num
��T U
]
��U V
.
��V W
verification_type
��W h
,
��h i
dbType
��j p
:
��p q 
OracleMappingType��r �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
aADHAAR
��> E
.
��E F
key_data
��F N
[
��N O
$num
��O P
]
��P Q
.
��Q R
key_provider
��R ^
,
��^ _
dbType
��` f
:
��f g
OracleMappingType
��h y
.
��y z
Varchar2��z �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 2
,
��2 3
aADHAAR
��4 ;
.
��; <
key_data
��< D
[
��D E
$num
��E F
]
��F G
.
��G H
co
��H J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Varchar2
��f n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ?
,
��? @
aADHAAR
��A H
.
��H I
key_data
��I Q
[
��Q R
$num
��R S
]
��S T
.
��T U
address_pincode
��U d
,
��d e
dbType
��f l
:
��l m
OracleMappingType
��n 
.�� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ;
,
��; <
aADHAAR
��= D
.
��D E
key_data
��E M
[
��M N
$num
��N O
]
��O P
.
��P Q
issuer_name
��Q \
,
��\ ]
dbType
��^ d
:
��d e
OracleMappingType
��f w
.
��w x
Varchar2��x �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- @
,
��@ A
aADHAAR
��B I
.
��I J
key_data
��J R
[
��R S
$num
��S T
]
��T U
.
��U V
address_landmark
��V f
,
��f g
dbType
��h n
:
��n o 
OracleMappingType��p �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 3
,
��3 4
aADHAAR
��5 <
.
��< =
key_data
��= E
[
��E F
$num
��F G
]
��G H
.
��H I
dob
��I L
,
��L M
dbType
��N T
:
��T U
OracleMappingType
��V g
.
��g h
Varchar2
��h p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
aADHAAR
��@ G
.
��G H
key_data
��H P
[
��P Q
$num
��Q R
]
��R S
.
��S T
address_street
��T b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 4
,
��4 5
aADHAAR
��6 =
.
��= >
key_data
��> F
[
��F G
$num
��G H
]
��H I
.
��I J
name
��J N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Varchar2
��j r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 8
,
��8 9
aADHAAR
��: A
.
��A B
key_data
��B J
[
��J K
$num
��K L
]
��L M
.
��M N
key_buid
��N V
,
��V W
dbType
��X ^
:
��^ _
OracleMappingType
��` q
.
��q r
Varchar2
��r z
,
��z {
	direction��| �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
aADHAAR
��@ G
.
��G H
key_data
��H P
[
��P Q
$num
��Q R
]
��R S
.
��S T
key_global_uid
��T b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;
aADHAAR
��< C
.
��C D
key_data
��D L
[
��L M
$num
��M N
]
��N O
.
��O P

key_source
��P Z
,
��Z [
dbType
��\ b
:
��b c
OracleMappingType
��d u
.
��u v
Varchar2
��v ~
,
��~ 
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- @
,
��@ A
aADHAAR
��B I
.
��I J
key_data
��J R
[
��R S
$num
��S T
]
��T U
.
��U V
address_district
��V f
,
��f g
dbType
��h n
:
��n o 
OracleMappingType��p �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
GetAadharHashCode
��? P
(
��P Q
aADHAAR
��Q X
,
��X Y

��Z g
,
��g h
employeeSlno
��i u
)
��u v
,
��v w
dbType
��x ~
:
��~ !
OracleMappingType��� �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
aADHAAR
��@ G
.
��G H
key_data
��H P
[
��P Q
$num
��Q R
]
��R S
.
��S T
key_fetched_at
��T b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
aadharRowsSaved
�� '
=
��( )
await
��* /

connection
��0 :
.
��: ;
ExecuteAsync
��; G
(
��G H 
DatabaseProcedures
��H Z
.
��Z [&
SP_SAVE_EMPLOYEE_AADHAAR
��[ s
,
��s t

parameters
��u 
,�� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
}
�� 
if
�� 
(
�� 
bankAccount
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
using
�� 
(
�� 
var
�� 

connection
�� )
=
��* +
await
��, 1
base
��2 6
.
��6 7
CreateConnection
��7 G
(
��G H
DbSchema
��H P
.
��P Q
PORTAL
��Q W
)
��W X
)
��X Y
{
�� %
OracleDynamicParameters
�� /

parameters
��0 :
=
��; <
new
��= @%
OracleDynamicParameters
��A X
(
��X Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?

��@ M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
employeeSlno
��> J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;
bankAccount
��< G
.
��G H

key_status
��H R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Varchar2
��n v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
bankAccount
��@ K
.
��K L
key_data
��L T
[
��T U
$num
��U V
]
��V W
.
��W X
account_number
��X f
,
��f g
dbType
��h n
:
��n o 
OracleMappingType��p �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 6
,
��6 7
bankAccount
��8 C
.
��C D
key_data
��D L
[
��L M
$num
��M N
]
��N O
.
��O P
key_id
��P V
,
��V W
dbType
��X ^
:
��^ _
OracleMappingType
��` q
.
��q r
Varchar2
��r z
,
��z {
	direction��| �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
bankAccount
��> I
.
��I J
key_data
��J R
[
��R S
$num
��S T
]
��T U
.
��U V
key_provider
��V b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ;
,
��; <
bankAccount
��= H
.
��H I
key_data
��I Q
[
��Q R
$num
��R S
]
��S T
.
��T U
issuer_name
��U `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Varchar2��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 8
,
��8 9
bankAccount
��: E
.
��E F
key_data
��F N
[
��N O
$num
��O P
]
��P Q
.
��Q R
key_name
��R Z
,
��Z [
dbType
��\ b
:
��b c
OracleMappingType
��d u
.
��u v
Varchar2
��v ~
,
��~ 
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ;
,
��; <
bankAccount
��= H
.
��H I
key_data
��I Q
[
��Q R
$num
��R S
]
��S T
.
��T U
branch_name
��U `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Varchar2��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 9
,
��9 :
bankAccount
��; F
.
��F G
key_data
��G O
[
��O P
$num
��P Q
]
��Q R
.
��R S
	bank_name
��S \
,
��\ ]
dbType
��^ d
:
��d e
OracleMappingType
��f w
.
��w x
Varchar2��x �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 4
,
��4 5
bankAccount
��6 A
.
��A B
key_data
��B J
[
��J K
$num
��K L
]
��L M
.
��M N
name
��N R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Varchar2
��n v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 8
,
��8 9
bankAccount
��: E
.
��E F
key_data
��F N
[
��N O
$num
��O P
]
��P Q
.
��Q R
key_buid
��R Z
,
��Z [
dbType
��\ b
:
��b c
OracleMappingType
��d u
.
��u v
Varchar2
��v ~
,
��~ 
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
bankAccount
��@ K
.
��K L
key_data
��L T
[
��T U
$num
��U V
]
��V W
.
��W X
key_global_uid
��X f
,
��f g
dbType
��h n
:
��n o 
OracleMappingType��p �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;
bankAccount
��< G
.
��G H
key_data
��H P
[
��P Q
$num
��Q R
]
��R S
.
��S T

key_source
��T ^
,
��^ _
dbType
��` f
:
��f g
OracleMappingType
��h y
.
��y z
Varchar2��z �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 4
,
��4 5
bankAccount
��6 A
.
��A B
key_data
��B J
[
��J K
$num
��K L
]
��L M
.
��M N
ifsc
��N R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Varchar2
��n v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
GetBankHashCode
��? N
(
��N O
bankAccount
��O Z
,
��Z [

��\ i
,
��i j
employeeSlno
��k w
)
��w x
,
��x y
dbType��z �
:��� �!
OracleMappingType��� �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
bankAccount
��@ K
.
��K L
key_data
��L T
[
��T U
$num
��U V
]
��V W
.
��W X
key_fetched_at
��X f
,
��f g
dbType
��h n
:
��n o 
OracleMappingType��p �
.��� �
Varchar2��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

�� %
=
��& '
await
��( -

connection
��. 8
.
��8 9
ExecuteAsync
��9 E
(
��E F 
DatabaseProcedures
��F X
.
��X Y+
SP_SAVE_EMPLOYEE_BANK_ACCOUNT
��Y v
,
��v w

parameters��x �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
}
�� 
if
�� 
(
�� 
drivingLicence
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
}
�� 
using
�� 
(
�� 
var
�� 

connection
�� %
=
��& '
await
��( -
base
��. 2
.
��2 3
CreateConnection
��3 C
(
��C D
DbSchema
��D L
.
��L M
PORTAL
��M S
)
��S T
)
��T U
{
�� 
}
�� 
if
�� 
(
�� 
(
�� 
panRowsSaved
�� !
*
��" #
-
��$ %
$num
��% &
)
��& '
>
��( )
$num
��* +
||
��, .
(
��/ 0
aadharRowsSaved
��0 ?
*
��@ A
-
��B C
$num
��C D
)
��D E
>
��F G
$num
��H I
||
��J L
(
��M N

��N [
*
��\ ]
-
��^ _
$num
��_ `
)
��` a
>
��b c
$num
��d e
)
��e f
{
�� 
using
�� 
(
�� 
var
�� 

connection
�� )
=
��* +
await
��, 1
base
��2 6
.
��6 7
CreateConnection
��7 G
(
��G H
DbSchema
��H P
.
��P Q
PORTAL
��Q W
)
��W X
)
��X Y
{
�� %
OracleDynamicParameters
�� /

parameters
��0 :
=
��; <
new
��= @%
OracleDynamicParameters
��A X
(
��X Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
employeeSlno
��> J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >

��? L
,
��L M
dbType
��N T
:
��T U
OracleMappingType
��V g
.
��g h
Varchar2
��h p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �
isEmployeeUpdated
�� )
=
��* +
await
��, 1

connection
��2 <
.
��< =
ExecuteAsync
��= I
(
��I J 
DatabaseProcedures
��J \
.
��\ ])
SP_UPDATE_EMP_VERIFY_STATUS
��] x
,
��x y

parameters��z �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
isSucess
�� 
=
�� 
(
��  
isEmployeeUpdated
��  1
*
��2 3
-
��4 5
$num
��5 6
)
��6 7
>
��8 9
$num
��: ;
;
��; <
}
�� 
}
�� 
return
�� 
isSucess
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� .
 UpdateEmployeeVerificationStatus
��  @
(
��@ A+
EmployeeVerificationStatusReq
��A ^
req
��_ b
)
��b c
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  +
,
��+ ,
req
��- 0
.
��0 1
StatusId
��1 9
,
��9 :
dbType
��; A
:
��A B
OracleMappingType
��C T
.
��T U
Int32
��U Z
,
��Z [
	direction
��\ e
:
��e f 
ParameterDirection
��g y
.
��y z
Input
��z 
)�� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
req
��1 4
.
��4 5
EmployeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  0
,
��0 1
req
��2 5
.
��5 6

��6 C
,
��C D
dbType
��E K
:
��K L
OracleMappingType
��M ^
.
��^ _
Varchar2
��_ g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  .
,
��. /
req
��0 3
.
��3 4

ApprovedBy
��4 >
,
��> ?
dbType
��@ F
:
��F G
OracleMappingType
��H Y
.
��Y Z
Int32
��Z _
,
��_ `
	direction
��a j
:
��j k 
ParameterDirection
��l ~
.
��~ 
Input�� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  3
,
��3 4
req
��5 8
.
��8 9
ApprovedRemarks
��9 H
,
��H I
dbType
��J P
:
��P Q
OracleMappingType
��R c
.
��c d
Varchar2
��d l
,
��l m
	direction
��n w
:
��w x!
ParameterDirection��y �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  4
,
��4 5
req
��6 9
.
��9 :
LockBankDetails
��: I
.
��I J
ToInt32OrDefault
��J Z
(
��Z [
)
��[ \
,
��\ ]
dbType
��^ d
:
��d e
OracleMappingType
��f w
.
��w x
Int32
��x }
,
��} ~
	direction�� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R,
SP_UPDATE_EMP_HR_VERIFY_STATUS
��R p
,
��p q
param
��r w
,
��w x
commandType��y �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
resp
�� 
=
�� 
(
�� 
updatedRecords
�� &
*
��' (
-
��) *
$num
��* +
)
��+ ,
>
��- .
$num
��/ 0
;
��0 1
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
string
��  
>
��  !#
GetEmployeeAadharPath
��" 7
(
��7 8
int
��8 ;
?
��; <
EmployeeSlno
��= I
)
��I J
{
�� 	
string
��  
employeeAadharPath
�� %
=
��& '
null
��( ,
;
��, -

�� 

imagesPath
�� $
=
��% &
new
��' *

��+ 8
(
��8 9
)
��9 :
;
��: ;
string
�� 
[
�� 
]
�� 
	imagePath
�� 
=
��  
null
��! %
;
��% &
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
EmployeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Varchar2
��^ f
,
��f g
	direction
��h q
:
��q r!
ParameterDirection��s �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
var
�� "
dbScreenInformations
�� (
=
��) *
await
��+ 0

connection
��1 ;
.
��; <

QueryAsync
��< F
<
��F G
string
��G M
>
��M N
(
��N O 
DatabaseProcedures
��O a
.
��a b!
GET_EMP_AADHAR_PATH
��b u
,
��u v

parameters��w �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
if
�� 
(
�� "
dbScreenInformations
�� (
!=
��) +
null
��, 0
)
��0 1
{
��  
employeeAadharPath
�� &
=
��' ("
dbScreenInformations
��) =
.
��= >
FirstOrDefault
��> L
(
��L M
)
��M N
;
��N O

imagesPath
�� 
.
�� 
Clear
�� $
(
��$ %
)
��% &
;
��& '
	imagePath
�� 
=
��  
employeeAadharPath
��  2
.
��2 3
Split
��3 8
(
��8 9
$char
��9 <
)
��< =
;
��= >
string
�� 
path
�� 
=
��  !
	imagePath
��" +
.
��+ ,
Where
��, 1
(
��1 2
x
��2 3
=>
��4 6
!
��7 8
x
��8 9
.
��9 :
IsNotNullOrEmpty
��: J
(
��J K
)
��K L
)
��L M
.
��M N
FirstOrDefault
��N \
(
��\ ]
)
��] ^
;
��^ _

imagesPath
�� 
.
�� 
AppendFormat
�� +
(
��+ ,
$str
��, <
,
��< =!
ApplicationSettings
��> Q
.
��Q R
Current
��R Y
.
��Y Z
ProfilePath
��Z e
,
��e f
	imagePath
��g p
[
��p q
$num
��q r
]
��r s
)
��s t
;
��t u 
employeeAadharPath
�� &
=
��' (

imagesPath
��) 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
;
��> ?
}
�� 
}
�� 
return
��  
employeeAadharPath
�� %
;
��% &
}
�� 	
}
�� 
}�� ��
cF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Employee\EmployeeInformationRepository.cs
	namespace)) 	
Phoenix))
 
.)) 
Database)) 
.)) 

Repository)) %
.))% &
Employee))& .
{** 
public++ 

class++ )
EmployeeInformationRepository++ .
:++/ 0
BaseRepository++1 ?
{,, 
private-- 
readonly-- 
IConfiguration-- '

;--5 6
private.. 
readonly.. 

cryptography..' 3
;..3 4
private// 
readonly// 
IDistributedCache// *

redisCache//+ 5
;//5 6
public11 )
EmployeeInformationRepository11 ,
(11, -
IConfiguration11- ;

,11I J
IDistributedCache11K \

redisCache11] g
)11g h
:11i j
base11k o
(11o p

)11} ~
{22 	
this33 
.33 

=33  

;33. /
this44 
.44 
cryptography44 
=44 
cryptography44  ,
;44, -
this55 
.55 

redisCache55 
=55 

redisCache55 (
;55( )
}66 	
public88 
async88 
Task88 
<88 
EmployeeProfile88 )
>88) *
GetEmployeeProfile88+ =
(88= >
int88> A
employeeSlno88B N
)88N O
{99 	
EmployeeProfile:: 
employee:: $
=::% &
null::' +
;::+ ,


imagesPath;; $
=;;% &
new;;' *

(;;8 9
);;9 :
;;;: ;
string<< 
[<< 
]<< 
	imagePath<< 
=<<  
null<<! %
;<<% &
using== 
(== 
var== 

connection== !
===" #
await==$ )
base==* .
.==. /
CreateConnection==/ ?
(==? @
DbSchema==@ H
.==H I
PORTAL==I O
)==O P
)==P Q
{>> 
OracleDynamicParameters?? '
	parmeters??( 1
=??2 3
new??4 7#
OracleDynamicParameters??8 O
(??O P
)??P Q
;??Q R
	parmeters@@ 
.@@ 
Add@@ 
(@@ 
name@@ "
:@@" #
$str@@$ 3
,@@3 4
employeeSlno@@5 A
,@@A B
dbType@@C I
:@@I J
OracleMappingType@@K \
.@@\ ]
Int32@@] b
,@@b c
	direction@@d m
:@@m n
ParameterDirection	@@o �
.
@@� �
Input
@@� �
)
@@� �
;
@@� �
	parmetersAA 
.AA 
AddAA 
(AA 
nameAA "
:AA" #
$strAA$ -
,AA- .
Employee_DetailsAA/ ?
.AA? @
EMPLOYEEAA@ H
.AAH I
ToInt32OrDefaultAAI Y
(AAY Z
)AAZ [
,AA[ \
dbTypeAA] c
:AAc d
OracleMappingTypeAAe v
.AAv w
Varchar2AAw 
,	AA �
	direction
AA� �
:
AA� � 
ParameterDirection
AA� �
.
AA� �
Input
AA� �
)
AA� �
;
AA� �
	parmetersBB 
.BB 
AddBB 
(BB 
nameBB "
:BB" #
$strBB$ -
,BB- .
dbTypeBB/ 5
:BB5 6
OracleMappingTypeBB7 H
.BBH I
	RefCursorBBI R
,BBR S
	directionBBT ]
:BB] ^
ParameterDirectionBB_ q
.BBq r
OutputBBr x
)BBx y
;BBy z
employeeCC 
=CC 
awaitCC  

connectionCC! +
.CC+ ,
QueryFirstAsyncCC, ;
<CC; <
EmployeeProfileCC< K
>CCK L
(CCL M
DatabaseProceduresCCM _
.CC_ ` 
GET_EMP_PROFILE_DATACC` t
,CCt u
	parmetersCCv 
,	CC �
commandType
CC� �
:
CC� �
CommandType
CC� �
.
CC� �
StoredProcedure
CC� �
)
CC� �
.
CC� �
ConfigureAwait
CC� �
(
CC� �
false
CC� �
)
CC� �
;
CC� �
}DD 
ifEE 
(EE 
employeeEE 
!=EE 
nullEE  
)EE  !
{FF 

imagesPathGG 
.GG 
ClearGG  
(GG  !
)GG! "
;GG" #
	imagePathHH 
=HH 
employeeHH $
.HH$ %
	PhotoPathHH% .
.HH. /
SplitHH/ 4
(HH4 5
$charHH5 8
)HH8 9
;HH9 :

imagesPathII 
.II 
AppendFormatII '
(II' (
$strII( 8
,II8 9
ApplicationSettingsII: M
.IIM N
CurrentIIN U
.IIU V
ProfilePathIIV a
,IIa b
	imagePathIIc l
[IIl m
$numIIm n
]IIn o
)IIo p
;IIp q
employeeJJ 
.JJ 
	PhotoPathJJ "
=JJ# $

imagesPathJJ% /
.JJ/ 0
ToStringJJ0 8
(JJ8 9
)JJ9 :
;JJ: ;
employeeKK 
.KK 
PhotoBinaryKK $
=KK% &
stringKK' -
.KK- .
FormatKK. 4
(KK4 5
$strKK5 >
,KK> ?
$strKK@ W
,KKW X

(KKf g

imagesPathKKg q
.KKq r
ToStringKKr z
(KKz {
)KK{ |
)KK| }
)KK} ~
;KK~ 

imagesPathMM 
.MM 
ClearMM  
(MM  !
)MM! "
;MM" #
	imagePathNN 
=NN 
employeeNN $
.NN$ %
BankInfoPathNN% 1
.NN1 2
SplitNN2 7
(NN7 8
$charNN8 ;
)NN; <
;NN< =

imagesPathOO 
.OO 
AppendFormatOO '
(OO' (
$strOO( 6
,OO6 7
ApplicationSettingsOO8 K
.OOK L
CurrentOOL S
.OOS T
ProfilePathOOT _
,OO_ `
	imagePathOOa j
[OOj k
$numOOk l
]OOl m
)OOm n
;OOn o
employeePP 
.PP 
BankInfoPathPP %
=PP& '

imagesPathPP( 2
.PP2 3
ToStringPP3 ;
(PP; <
)PP< =
;PP= >

imagesPathSS 
.SS 
ClearSS  
(SS  !
)SS! "
;SS" #
	imagePathTT 
=TT 
employeeTT $
.TT$ %

AadharPathTT% /
.TT/ 0
SplitTT0 5
(TT5 6
$charTT6 9
)TT9 :
;TT: ;

imagesPathUU 
.UU 
AppendFormatUU '
(UU' (
$strUU( 8
,UU8 9
ApplicationSettingsUU: M
.UUM N
CurrentUUN U
.UUU V
ProfilePathUUV a
,UUa b
	imagePathUUc l
[UUl m
$numUUm n
]UUn o
)UUo p
;UUp q
employeeVV 
.VV 

AadharPathVV #
=VV$ %

imagesPathVV& 0
.VV0 1
ToStringVV1 9
(VV9 :
)VV: ;
;VV; <
employeeYY 
.YY 
FinSLNoYY  
=YY! "
ApplicationSettingsYY# 6
.YY6 7
CurrentYY7 >
.YY> ?
FinancialYearIdYY? N
;YYN O
employeeZZ 
.ZZ $
EmployeeEducationDetailsZZ 1
=ZZ2 3
awaitZZ4 9'
GetEmployeeEducationDetailsZZ: U
(ZZU V
employeeSlnoZZV b
)ZZb c
;ZZc d
employee[[ 
.[[ !
EmployeeFamilyDetails[[ .
=[[/ 0
await[[1 6$
GetEmployeeFamilyDetails[[7 O
([[O P
employeeSlno[[P \
)[[\ ]
;[[] ^
employee\\ 
.\\ %
EmployeeExperienceDetails\\ 2
=\\3 4
await\\5 :(
GetEmployeeExperienceDetails\\; W
(\\W X
employeeSlno\\X d
)\\d e
;\\e f
employee]] 
.]] "
EmployeeAddressDetails]] /
=]]0 1
await]]2 7%
GetEmployeeAddressDetails]]8 Q
(]]Q R
employeeSlno]]R ^
)]]^ _
;]]_ `
employee^^ 
.^^  
EmployeeAssetDetails^^ -
=^^. /
await^^0 5#
GetEmployeeAssetDetails^^6 M
(^^M N
employeeSlno^^N Z
)^^Z [
;^^[ \
}__ 
return`` 
employee`` 
;`` 
}aa 	
privatecc 
asynccc 
Taskcc 
<cc 
Listcc 
<cc  
ReportingStructurecc  2
>cc2 3
>cc3 4)
GetEmployeeReportingStructurecc5 R
(ccR S
intccS V
employeeSlnoccW c
)ccc d
{dd 	
Listee 
<ee 
ReportingStructureee #
>ee# $
reportingStructureee% 7
=ee8 9
nullee: >
;ee> ?
usingff 
(ff 


connectionff! +
=ff, -
awaitff. 3
CreateConnectionff4 D
(ffD E
DbSchemaffE M
.ffM N
PORTALffN T
)ffT U
)ffU V
{gg 
OracleDynamicParametershh '

parametershh( 2
=hh3 4
newhh5 8#
OracleDynamicParametershh9 P
(hhP Q
)hhQ R
;hhR S
stringii 

templateidii !
=ii" #
ApplicationSettingsii$ 7
.ii7 8
Currentii8 ?
.ii? @
HrmsOtpTemplateii@ O
;iiO P

parametersjj 
.jj 
Addjj 
(jj 
namejj #
:jj# $
$strjj% 4
,jj4 5
employeeSlnojj6 B
,jjB C
dbTypejjD J
:jjJ K
OracleMappingTypejjL ]
.jj] ^
Int32jj^ c
,jjc d
	directionjje n
:jjn o
ParameterDirection	jjp �
.
jj� �
Input
jj� �
)
jj� �
;
jj� �

parameterskk 
.kk 
Addkk 
(kk 
namekk #
:kk# $
$strkk% .
,kk. /
dbTypekk0 6
:kk6 7
OracleMappingTypekk8 I
.kkI J
	RefCursorkkJ S
,kkS T
	directionkkU ^
:kk^ _
ParameterDirectionkk` r
.kkr s
Outputkks y
)kky z
;kkz {
varll  
dbScreenInformationsll (
=ll) *
awaitll+ 0

connectionll1 ;
.ll; <

QueryAsyncll< F
<llF G
ReportingStructurellG Y
>llY Z
(llZ [
DatabaseProceduresll[ m
.llm n*
SP_GET_EMP_REPORTING_MANAGERS	lln �
,
ll� �

parameters
ll� �
,
ll� �
commandType
ll� �
:
ll� �
CommandType
ll� �
.
ll� �
StoredProcedure
ll� �
)
ll� �
;
ll� �
reportingStructuremm "
=mm# $ 
dbScreenInformationsmm% 9
.mm9 :
ToListmm: @
(mm@ A
)mmA B
;mmB C
}nn 
returnoo 
reportingStructureoo %
;oo% &
}pp 	
publicqq 
asyncqq 
Taskqq 
<qq 
Listqq 
<qq 
HolidayInformationqq 1
>qq1 2
>qq2 3
GetEmployeeHolidaysqq4 G
(qqG H
longqqH L

employeeIdqqM W
)qqW X
{rr 	
Listss 
<ss 
HolidayInformationss #
>ss# $
holidaysss% -
=ss. /
nullss0 4
;ss4 5
usingtt 
(tt 
HolidayRepositorytt $

repositorytt% /
=tt0 1
newtt2 5
HolidayRepositorytt6 G
(ttG H
thisttH L
.ttL M

,ttZ [
thistt\ `
.tt` a

redisCachetta k
)ttk l
)ttl m
{uu 
holidaysvv 
=vv 
awaitvv  

repositoryvv! +
.vv+ ,
GetEmployeeHolidaysvv, ?
(vv? @

employeeIdvv@ J
)vvJ K
;vvK L
foreachww 
(ww 
varww 
itemww !
inww" $
holidaysww% -
)ww- .
{xx 
itemyy 
.yy 
	MonthNameyy "
=yy# $
itemyy% )
.yy) *
HolidayDateyy* 5
.yy5 6
ToStringyy6 >
(yy> ?
$stryy? D
)yyD E
;yyE F
itemzz 
.zz 
Dayzz 
=zz 
itemzz #
.zz# $
HolidayDatezz$ /
.zz/ 0
ToStringzz0 8
(zz8 9
$strzz9 =
)zz= >
;zz> ?
}{{ 
holidays}} 
=}} 
holidays}} #
.}}# $
OrderBy}}$ +
(}}+ ,
i}}, -
=>}}. 0
i}}1 2
.}}2 3
HolidayDate}}3 >
)}}> ?
.}}? @
ToList}}@ F
(}}F G
)}}G H
;}}H I
}~~ 
return 
holidays 
; 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
EmployeeProfile
�� )
>
��) *'
GetEmployeeMinimumProfile
��+ D
(
��D E
int
��E H
employeeSlno
��I U
)
��U V
{
�� 	
EmployeeProfile
�� 
employee
�� $
=
��% &
null
��' +
;
��+ ,

�� 

imagesPath
�� $
=
��% &
new
��' *

��+ 8
(
��8 9
)
��9 :
;
��: ;
bool
�� 
flag
�� 
=
�� 
await
�� )
GetEmployeeEligibleForLeave
�� 9
(
��9 :
employeeSlno
��: F
)
��F G
;
��G H
string
�� 
[
�� 
]
�� 
	imagePath
�� 
=
��  
null
��! %
;
��% &
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
Employee_Details
��/ ?
.
��? @
EMPLOYEE
��@ H
.
��H I
ToInt32OrDefault
��I Y
(
��Y Z
)
��Z [
,
��[ \
dbType
��] c
:
��c d
OracleMappingType
��e v
.
��v w
Varchar2
��w 
,�� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
employee
�� 
=
�� 
await
��  

connection
��! +
.
��+ ,
QueryFirstAsync
��, ;
<
��; <
EmployeeProfile
��< K
>
��K L
(
��L M 
DatabaseProcedures
��M _
.
��_ `"
GET_EMP_PROFILE_DATA
��` t
,
��t u
	parmeters
��v 
,�� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
employee
�� 
!=
�� 
null
��  
)
��  !
{
�� 

imagesPath
�� 
.
�� 
Clear
��  
(
��  !
)
��! "
;
��" #
	imagePath
�� 
=
�� 
employee
�� $
.
��$ %
	PhotoPath
��% .
.
��. /
Split
��/ 4
(
��4 5
$char
��5 8
)
��8 9
;
��9 :

imagesPath
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( 8
,
��8 9!
ApplicationSettings
��: M
.
��M N
Current
��N U
.
��U V
ProfilePath
��V a
,
��a b
	imagePath
��c l
[
��l m
$num
��m n
]
��n o
)
��o p
;
��p q
employee
�� 
.
�� 
	PhotoPath
�� "
=
��# $

imagesPath
��% /
.
��/ 0
ToString
��0 8
(
��8 9
)
��9 :
;
��: ;

imagesPath
�� 
.
�� 
Clear
��  
(
��  !
)
��! "
;
��" #
	imagePath
�� 
=
�� 
employee
�� $
.
��$ %
BankInfoPath
��% 1
.
��1 2
Split
��2 7
(
��7 8
$char
��8 ;
)
��; <
;
��< =

imagesPath
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( 6
,
��6 7!
ApplicationSettings
��8 K
.
��K L
Current
��L S
.
��S T
ProfilePath
��T _
,
��_ `
	imagePath
��a j
[
��j k
$num
��k l
]
��l m
)
��m n
;
��n o
employee
�� 
.
�� 
BankInfoPath
�� %
=
��& '

imagesPath
��( 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
;
��= >

imagesPath
�� 
.
�� 
Clear
��  
(
��  !
)
��! "
;
��" #

imagesPath
��$ .
.
��. /
Clear
��/ 4
(
��4 5
)
��5 6
;
��6 7
	imagePath
�� 
=
�� 
employee
�� $
.
��$ %

AadharPath
��% /
.
��/ 0
Split
��0 5
(
��5 6
$char
��6 9
)
��9 :
;
��: ;

imagesPath
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( 8
,
��8 9!
ApplicationSettings
��: M
.
��M N
Current
��N U
.
��U V
ProfilePath
��V a
,
��a b
	imagePath
��c l
[
��l m
$num
��m n
]
��n o
)
��o p
;
��p q
employee
�� 
.
�� 

AadharPath
�� #
=
��$ %

imagesPath
��& 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
;
��; <
employee
�� 
.
�� 
FinSLNo
��  
=
��! "!
ApplicationSettings
��# 6
.
��6 7
Current
��7 >
.
��> ?
FinancialYearId
��? N
;
��N O

Dictionary
�� 
<
�� 
string
�� !
,
��! "
DateTime
��# +
>
��+ ,
payrollDates
��- 9
=
��: ;
await
��< A
GetPayrollDates
��B Q
(
��Q R
DateTime
��R Z
.
��Z [
Now
��[ ^
)
��^ _
;
��_ `
employee
�� 
.
�� 
PayrollMonthFrom
�� )
=
��* +
payrollDates
��, 8
[
��8 9
$str
��9 D
]
��D E
;
��E F
employee
�� 
.
�� 
PayrollMonthTo
�� '
=
��( )
payrollDates
��* 6
[
��6 7
$str
��7 @
]
��@ A
;
��A B
employee
�� 
.
��  
ReportingStructure
�� +
=
��, -
await
��. 3+
GetEmployeeReportingStructure
��4 Q
(
��Q R
employeeSlno
��R ^
)
��^ _
;
��_ `
if
�� 
(
�� 
employee
�� 
.
��  
ReportingStructure
�� /
!=
��0 2
null
��3 7
&&
��8 :
employee
��; C
.
��C D 
ReportingStructure
��D V
.
��V W
Count
��W \
>
��] ^
$num
��_ `
)
��` a
{
�� 
employee
�� 
.
�� 

LevelCount
�� '
=
��( )
employee
��* 2
.
��2 3 
ReportingStructure
��3 E
[
��E F
$num
��F G
]
��G H
.
��H I

LevelCount
��I S
;
��S T
employee
�� 
.
��  
ReportingManagerId
�� /
=
��0 1
employee
��2 :
.
��: ; 
ReportingStructure
��; M
[
��M N
$num
��N O
]
��O P
.
��P Q#
ReportingEmployeeSlno
��Q f
;
��f g
employee
�� 
.
�� "
ReportingManagerName
�� 1
=
��2 3
employee
��4 <
.
��< = 
ReportingStructure
��= O
[
��O P
$num
��P Q
]
��Q R
.
��R S#
ReportingEmployeeName
��S h
;
��h i
int
�� '
inValidReportingEmployees
�� 1
=
��2 3
employee
��4 <
.
��< = 
ReportingStructure
��= O
.
��O P
Where
��P U
(
��U V
x
��V W
=>
��X Z
x
��[ \
.
��\ ]#
ReportingEmployeeSlno
��] r
==
��s u
$num
��v w
)
��w x
.
��x y
ToList
��y 
(�� �
)��� �
.��� �
Count��� �
;��� �
employee
�� 
.
�� 

�� *
=
��+ ,'
inValidReportingEmployees
��- F
==
��G I
$num
��J K
;
��K L
}
�� 
employee
�� 
.
�� 
	HrDetails
�� "
=
��# $
await
��% *"
GetEmployeeHRDetails
��+ ?
(
��? @
employeeSlno
��@ L
)
��L M
;
��M N
employee
�� 
.
�� 
IsApplicable
�� %
=
��& '
flag
��( ,
;
��, -
}
�� 
return
�� 
employee
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 

Dictionary
�� %
<
��% &
string
��& ,
,
��, -
DateTime
��. 6
>
��6 7
>
��7 8
GetPayrollDates
��9 H
(
��H I
DateTime
��I Q
fromDate
��R Z
)
��Z [
{
�� 	

�� 

�� '
=
��( )
null
��* .
;
��. /

Dictionary
�� 
<
�� 
string
�� 
,
�� 
DateTime
�� '
>
��' (
payrollDates
��) 5
=
��6 7
new
��8 ;

Dictionary
��< F
<
��F G
string
��G M
,
��M N
DateTime
��O W
>
��W X
(
��X Y
)
��Y Z
;
��Z [
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '%
PayrollPeriodRepository
��( ?
(
��? @
this
��@ D
.
��D E

��E R
)
��R S
)
��S T
{
�� 
payrollDates
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
GetPayrollDates
��0 ?
(
��? @
fromDate
��@ H
)
��H I
;
��I J
if
�� 
(
�� 

�� !
!=
��" $
null
��% )
)
��) *
{
�� 
payrollDates
��  
.
��  !
Add
��! $
(
��$ %
$str
��% 0
,
��0 1

��2 ?
.
��? @
FromDate
��@ H
)
��H I
;
��I J
payrollDates
��  
.
��  !
Add
��! $
(
��$ %
$str
��% .
,
��. /

��0 =
.
��= >
ToDate
��> D
)
��D E
;
��E F
}
�� 
}
�� 
return
�� 
payrollDates
�� 
;
��  
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
EmployeeProfile
�� )
>
��) * 
GetEmployeeProfile
��+ =
(
��= >
string
��> D

employeeId
��E O
)
��O P
{
�� 	
EmployeeProfile
�� 
employee
�� $
=
��% &
null
��' +
;
��+ ,

�� 

imagesPath
�� $
=
��% &
new
��' *

��+ 8
(
��8 9
)
��9 :
;
��: ;
string
�� 
[
�� 
]
�� 
	imagePath
�� 
=
��  
null
��! %
;
��% &
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 1
,
��1 2

employeeId
��3 =
,
��= >
dbType
��? E
:
��E F
OracleMappingType
��G X
.
��X Y
Varchar2
��Y a
,
��a b
	direction
��c l
:
��l m!
ParameterDirection��n �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
employee
�� 
=
�� 
await
��  

connection
��! +
.
��+ ,
QueryFirstAsync
��, ;
<
��; <
EmployeeProfile
��< K
>
��K L
(
��L M 
DatabaseProcedures
��M _
.
��_ `%
SP_GET_EMPLOYEE_PROFILE
��` w
,
��w x
	parmeters��y �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
employee
�� 
!=
�� 
null
��  
)
��  !
{
�� 
employee
�� 
.
�� 
FinSLNo
��  
=
��! "!
ApplicationSettings
��# 6
.
��6 7
Current
��7 >
.
��> ?
FinancialYearId
��? N
;
��N O
}
�� 
return
�� 
employee
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmployeeProfile
�� *
>
��* +"
GetEmployeeHRDetails
��, @
(
��@ A
int
��A D
employeeSlno
��E Q
)
��Q R
{
�� 	
EmployeeProfile
�� 
hrInfo
�� "
=
��# $
null
��% )
;
��) *
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
hrInfo
�� 
=
�� 
await
�� 

connection
�� )
.
��) *&
QueryFirstOrDefaultAsync
��* B
<
��B C
EmployeeProfile
��C R
>
��R S
(
��S T 
DatabaseProcedures
��T f
.
��f g)
SP_GET_EMPLOYEE_HR_DETAILS��g �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
return
�� 
hrInfo
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� )
GetEmployeeEligibleForLeave
��  ;
(
��; <
int
��< ?
employeeSlno
��@ L
)
��L M
{
�� 	
bool
�� 

isEligible
�� 
=
�� 
false
�� #
;
��# $
List
�� 
<
�� 
WorkFlowFlag
�� 
>
�� 

employeeWF
�� )
=
��* +
null
��, 0
;
��0 1
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z

employeeWF
�� 
=
�� 
(
�� 
await
�� #

connection
��$ .
.
��. /

QueryAsync
��/ 9
<
��9 :
WorkFlowFlag
��: F
>
��F G
(
��G H 
DatabaseProcedures
��H Z
.
��Z [!
GET_EMPLOYEE_LEVELS
��[ n
,
��n o
	parmeters
��p y
,
��y z
commandType��{ �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 

employeeWF
�� 
.
�� 
Count
�� $
>
��% &
$num
��' (
)
��( )
{
�� 
if
�� 
(
�� 

employeeWF
�� "
.
��" #
Count
��# (
==
��) +

employeeWF
��, 6
[
��6 7
$num
��7 8
]
��8 9
.
��9 :

��: G
)
��G H
{
�� 

isEligible
�� "
=
��# $
true
��% )
;
��) *
}
�� 
else
�� 
{
�� 

isEligible
�� "
=
��# $
false
��% *
;
��* +
}
�� 
}
�� 
else
�� 
{
�� 

isEligible
�� 
=
��  
false
��! &
;
��& '
}
�� 
}
�� 
return
�� 

isEligible
�� 
;
�� 
}
�� 	
private
�� 
string
�� 

�� $
(
��$ %
string
��% +
url
��, /
)
��/ 0
{
�� 	
string
�� !
encodedFileAsBase64
�� &
=
��' (
string
��) /
.
��/ 0
Empty
��0 5
;
��5 6
string
�� 

encodedUrl
�� 
=
�� 
Convert
��  '
.
��' (
ToBase64String
��( 6
(
��6 7
Encoding
��7 ?
.
��? @
Default
��@ G
.
��G H
GetBytes
��H P
(
��P Q
url
��Q T
)
��T U
)
��U V
;
��V W
try
�� 
{
�� 
using
�� 
(
�� 
var
�� 
client
�� !
=
��" #
new
��$ '
	WebClient
��( 1
(
��1 2
)
��2 3
)
��3 4
{
�� 
byte
�� 
[
�� 
]
�� 
	dataBytes
�� $
=
��% &
client
��' -
.
��- .
DownloadData
��. :
(
��: ;
new
��; >
Uri
��? B
(
��B C
url
��C F
)
��F G
)
��G H
;
��H I!
encodedFileAsBase64
�� '
=
��( )
Convert
��* 1
.
��1 2
ToBase64String
��2 @
(
��@ A
	dataBytes
��A J
)
��J K
;
��K L
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
encodedFileAsBase64
�� #
=
��$ %
GetNoPhotoData
��& 4
(
��4 5!
ApplicationSettings
��5 H
.
��H I
Current
��I P
.
��P Q
NoPhoto
��Q X
)
��X Y
;
��Y Z
}
�� 
return
�� !
encodedFileAsBase64
�� &
;
��& '
}
�� 	
private
�� 
string
�� 
GetNoPhotoData
�� %
(
��% &
string
��& ,
url
��- 0
)
��0 1
{
�� 	
string
�� !
encodedFileAsBase64
�� &
=
��' (
string
��) /
.
��/ 0
Empty
��0 5
;
��5 6
string
�� 

encodedUrl
�� 
=
�� 
Convert
��  '
.
��' (
ToBase64String
��( 6
(
��6 7
Encoding
��7 ?
.
��? @
Default
��@ G
.
��G H
GetBytes
��H P
(
��P Q
url
��Q T
)
��T U
)
��U V
;
��V W
try
�� 
{
�� 
using
�� 
(
�� 
var
�� 
client
�� !
=
��" #
new
��$ '
	WebClient
��( 1
(
��1 2
)
��2 3
)
��3 4
{
�� 
byte
�� 
[
�� 
]
�� 
	dataBytes
�� $
=
��% &
client
��' -
.
��- .
DownloadData
��. :
(
��: ;
new
��; >
Uri
��? B
(
��B C
url
��C F
)
��F G
)
��G H
;
��H I!
encodedFileAsBase64
�� '
=
��( )
Convert
��* 1
.
��1 2
ToBase64String
��2 @
(
��@ A
	dataBytes
��A J
)
��J K
;
��K L
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
encodedFileAsBase64
�� #
=
��$ %
String
��& ,
.
��, -
Empty
��- 2
;
��2 3
}
�� 
return
�� !
encodedFileAsBase64
�� &
;
��& '
}
�� 	
private
�� 
string
�� 

�� $
(
��$ %
string
��% +
url
��, /
,
��/ 0
string
��1 7
fileType
��8 @
)
��@ A
{
�� 	
string
�� !
encodedFileAsBase64
�� &
=
��' (
string
��) /
.
��/ 0
Empty
��0 5
;
��5 6

RestClient
�� 
client
�� 
=
�� 
new
��  #

RestClient
��$ .
(
��. /
)
��/ 0
;
��0 1
RestRequest
�� 
request
�� 
=
��  !
new
��" %
RestRequest
��& 1
(
��1 2
url
��2 5
,
��5 6
Method
��7 =
.
��= >
Get
��> A
)
��A B
;
��B C
request
�� 
.
�� 
	AddHeader
�� 
(
�� 
$str
�� -
,
��- .
$str
��/ 9
)
��9 :
;
��: ;
request
�� 
.
�� 
	AddHeader
�� 
(
�� 
$str
�� -
,
��- .
$str
��/ E
)
��E F
;
��F G
RestResponse
�� 
handle
�� 
=
��  !
client
��" (
.
��( )
ExecuteAsync
��) 5
<
��5 6
RestResponse
��6 B
>
��B C
(
��C D
request
��D K
)
��K L
.
��L M
Result
��M S
;
��S T!
encodedFileAsBase64
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str
��0 L
,
��L M
fileType
��N V
,
��V W
Convert
��X _
.
��_ `
ToBase64String
��` n
(
��n o
handle
��o u
.
��u v
RawBytes
��v ~
)
��~ 
)�� �
;��� �
return
�� !
encodedFileAsBase64
�� &
;
��& '
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
EducationDetail
��  /
>
��/ 0
>
��0 1)
GetEmployeeEducationDetails
��2 M
(
��M N
int
��N Q
employeeSlno
��R ^
)
��^ _
{
�� 	
List
�� 
<
�� 
EducationDetail
��  
>
��  !
educationDetails
��" 2
=
��3 4
null
��5 9
;
��9 :
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
Employee_Details
��/ ?
.
��? @

��@ M
.
��M N
ToInt32OrDefault
��N ^
(
��^ _
)
��_ `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Varchar2��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
educationDetails
��  
=
��! "
(
��# $
await
��$ )

connection
��* 4
.
��4 5

QueryAsync
��5 ?
<
��? @
EducationDetail
��@ O
>
��O P
(
��P Q 
DatabaseProcedures
��Q c
.
��c d"
GET_EMP_PROFILE_DATA
��d x
,
��x y
	parmeters��z �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
educationDetails
�� #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
FamilyDetail
�� +
>
��+ ,
>
��, -&
GetEmployeeFamilyDetails
��. F
(
��F G
int
��G J
employeeSlno
��K W
)
��W X
{
�� 	
List
�� 
<
�� 
FamilyDetail
�� 
>
�� 

�� ,
=
��- .
null
��/ 3
;
��3 4
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
Employee_Details
��/ ?
.
��? @

FAMILYDTLS
��@ J
.
��J K
ToInt32OrDefault
��K [
(
��[ \
)
��\ ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Varchar2��y �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z

�� 
=
�� 
(
��  !
await
��! &

connection
��' 1
.
��1 2

QueryAsync
��2 <
<
��< =
FamilyDetail
��= I
>
��I J
(
��J K 
DatabaseProcedures
��K ]
.
��] ^"
GET_EMP_PROFILE_DATA
��^ r
,
��r s
	parmeters
��t }
,
��} ~
commandType�� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 

��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
ExperienceDetail
�� /
>
��/ 0
>
��0 1*
GetEmployeeExperienceDetails
��2 N
(
��N O
int
��O R
employeeSlno
��S _
)
��_ `
{
�� 	
List
�� 
<
�� 
ExperienceDetail
�� !
>
��! "
experienceDetails
��# 4
=
��5 6
null
��7 ;
;
��; <
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
Employee_Details
��/ ?
.
��? @
EXPERIENACEDTLS
��@ O
.
��O P
ToInt32OrDefault
��P `
(
��` a
)
��a b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
experienceDetails
�� !
=
��" #
(
��$ %
await
��% *

connection
��+ 5
.
��5 6

QueryAsync
��6 @
<
��@ A
ExperienceDetail
��A Q
>
��Q R
(
��R S 
DatabaseProcedures
��S e
.
��e f"
GET_EMP_PROFILE_DATA
��f z
,
��z {
	parmeters��| �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
experienceDetails
�� $
;
��$ %
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 

�� ,
>
��, -
>
��- .'
GetEmployeeAddressDetails
��/ H
(
��H I
int
��I L
employeeSlno
��M Y
)
��Y Z
{
�� 	
List
�� 
<
�� 

�� 
>
�� 
addressDetails
��  .
=
��/ 0
new
��1 4
List
��5 9
<
��9 :

��: G
>
��G H
(
��H I
)
��I J
;
��J K
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
Employee_Details
��/ ?
.
��? @
ADDRESSDTLS
��@ K
.
��K L
ToInt32OrDefault
��L \
(
��\ ]
)
��] ^
,
��^ _
dbType
��` f
:
��f g
OracleMappingType
��h y
.
��y z
Varchar2��z �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
addressDetails
�� 
=
��  
(
��! "
await
��" '

connection
��( 2
.
��2 3

QueryAsync
��3 =
<
��= >

��> K
>
��K L
(
��L M 
DatabaseProcedures
��M _
.
��_ `"
GET_EMP_PROFILE_DATA
��` t
,
��t u
	parmeters
��v 
,�� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
addressDetails
�� !
;
��! "
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
AssetDetail
�� *
>
��* +
>
��+ ,%
GetEmployeeAssetDetails
��- D
(
��D E
int
��E H
employeeSlno
��I U
)
��U V
{
�� 	
List
�� 
<
�� 
AssetDetail
�� 
>
�� 
assetDetails
�� *
=
��+ ,
null
��- 1
;
��1 2
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSlno
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
Employee_Details
��/ ?
.
��? @
ASSET
��@ E
.
��E F
ToInt32OrDefault
��F V
(
��V W
)
��W X
,
��X Y
dbType
��Z `
:
��` a
OracleMappingType
��b s
.
��s t
Varchar2
��t |
,
��| }
	direction��~ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
assetDetails
�� 
=
�� 
(
��  
await
��  %

connection
��& 0
.
��0 1

QueryAsync
��1 ;
<
��; <
AssetDetail
��< G
>
��G H
(
��H I 
DatabaseProcedures
��I [
.
��[ \"
GET_EMP_PROFILE_DATA
��\ p
,
��p q
	parmeters
��r {
,
��{ |
commandType��} �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
assetDetails
�� 
;
��  
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
PagedResultSet
�� (
<
��( )
EmployeeProfile
��) 8
>
��8 9
>
��9 :(
SearchEmployeeInformations
��; U
(
��U V/
!EmployeeInformationSearchCriteria
��V w
searchCriteria��x �
)��� �
{
�� 	
List
�� 
<
�� 
EmployeeProfile
��  
>
��  !

��" /
=
��0 1
null
��2 6
;
��6 7
PagedResultSet
�� 
<
�� 
EmployeeProfile
�� *
>
��* +
	menuItems
��, 5
=
��6 7
null
��8 <
;
��< =
int
�� 
totalRecords
�� 
=
�� 
$num
��  
;
��  !
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
searchCriteria
��5 C
.
��C D
SearchValue
��D O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Varchar2
��k s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
searchCriteria
��5 C
.
��C D

StartIndex
��D N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
searchCriteria
��3 A
.
��A B
EndIndex
��B J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
dbType
��7 =
:
��= >
OracleMappingType
��? P
.
��P Q
Int32
��Q V
,
��V W
	direction
��X a
:
��a b 
ParameterDirection
��c u
.
��u v
Output
��v |
)
��| }
;
��} ~

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
var
�� "
dbScreenInformations
�� (
=
��) *
await
��+ 0

connection
��1 ;
.
��; <

QueryAsync
��< F
<
��F G
EmployeeProfile
��G V
>
��V W
(
��W X 
DatabaseProcedures
��X j
.
��j k'
P_SEARCH_EMPLOYEE_PORTAL��k �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
totalRecords
�� 
=
�� 

parameters
�� )
.
��) *
Get
��* -
<
��- .
int
��. 1
>
��1 2
(
��2 3
$str
��3 D
)
��D E
.
��E F
ToInt32OrDefault
��F V
(
��V W
)
��W X
;
��X Y

�� 
=
�� "
dbScreenInformations
��  4
.
��4 5
ToList
��5 ;
(
��; <
)
��< =
;
��= >
}
�� 
	menuItems
�� 
=
�� 
new
�� 
PagedResultSet
�� *
<
��* +
EmployeeProfile
��+ :
>
��: ;
(
��; <
)
��< =
{
�� 
Items
�� 
=
�� 

�� %
,
��% &
	PageIndex
�� 
=
�� 
searchCriteria
�� *
.
��* +

StartIndex
��+ 5
,
��5 6
PageSize
�� 
=
�� 
searchCriteria
�� )
.
��) *
EndIndex
��* 2
,
��2 3

TotalItems
�� 
=
�� 
totalRecords
�� )
,
��) *
}
�� 
;
��
return
�� 
	menuItems
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 

�� ,
>
��, -
>
��- .+
GetFamilyBloodRelationDetails
��/ L
(
��L M
)
��M N
{
�� 	
List
�� 
<
�� 

�� 
>
�� "
familyBloodRelations
��  4
=
��5 6
new
��7 :
List
��; ?
<
��? @

��@ M
>
��M N
(
��N O
)
��O P
;
��P Q
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z"
familyBloodRelations
�� $
=
��% &
(
��' (
await
��( -

connection
��. 8
.
��8 9

QueryAsync
��9 C
<
��C D

��D Q
>
��Q R
(
��R S 
DatabaseProcedures
��S e
.
��e f#
SP_M_BLOODRELATION_MT
��f {
,
��{ |
	parmeters��} �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� "
familyBloodRelations
�� '
;
��' (
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
	Education
�� (
>
��( )
>
��) *!
GetEducationDetails
��+ >
(
��> ?
)
��? @
{
�� 	
List
�� 
<
�� 
	Education
�� 
>
�� 
educationDetails
�� ,
=
��- .
new
��/ 2
List
��3 7
<
��7 8
	Education
��8 A
>
��A B
(
��B C
)
��C D
;
��D E
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
educationDetails
��  
=
��! "
(
��# $
await
��$ )

connection
��* 4
.
��4 5

QueryAsync
��5 ?
<
��? @
	Education
��@ I
>
��I J
(
��J K 
DatabaseProcedures
��K ]
.
��] ^
SP_M_EDUCATION_MT
��^ o
,
��o p
	parmeters
��q z
,
��z {
commandType��| �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
educationDetails
�� #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
	Education
�� (
>
��( )
>
��) *'
GetEducationCourseDetails
��+ D
(
��D E
)
��E F
{
�� 	
List
�� 
<
�� 
	Education
�� 
>
�� 

�� )
=
��* +
new
��, /
List
��0 4
<
��4 5
	Education
��5 >
>
��> ?
(
��? @
)
��@ A
;
��A B
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z

�� 
=
�� 
(
��  !
await
��! &

connection
��' 1
.
��1 2

QueryAsync
��2 <
<
��< =
	Education
��= F
>
��F G
(
��G H 
DatabaseProcedures
��H Z
.
��Z [$
SP_EDUCATION_COURCE_MT
��[ q
,
��q r
	parmeters
��s |
,
��| }
commandType��~ �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 

��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 

BloodGroup
�� )
>
��) *
>
��* +

��, 9
(
��9 :
)
��: ;
{
�� 	
List
�� 
<
�� 

BloodGroup
�� 
>
�� 

bloodGroup
�� '
=
��( )
new
��* -
List
��. 2
<
��2 3

BloodGroup
��3 =
>
��= >
(
��> ?
)
��? @
;
��@ A
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z

bloodGroup
�� 
=
�� 
(
�� 
await
�� #

connection
��$ .
.
��. /

QueryAsync
��/ 9
<
��9 :

BloodGroup
��: D
>
��D E
(
��E F 
DatabaseProcedures
��F X
.
��X Y#
SP_EMP_BLOOD_GROUP_MT
��Y n
,
��n o
	parmeters
��p y
,
��y z
commandType��{ �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 

bloodGroup
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� %
AdditionalQualification
�� 6
>
��6 7
>
��7 8(
GetAdditionalQualification
��9 S
(
��S T
)
��T U
{
�� 	
List
�� 
<
�� %
AdditionalQualification
�� (
>
��( )%
additionalQualification
��* A
=
��B C
new
��D G
List
��H L
<
��L M%
AdditionalQualification
��M d
>
��d e
(
��e f
)
��f g
;
��g h
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z%
additionalQualification
�� '
=
��( )
(
��* +
await
��+ 0

connection
��1 ;
.
��; <

QueryAsync
��< F
<
��F G%
AdditionalQualification
��G ^
>
��^ _
(
��_ ` 
DatabaseProcedures
��` r
.
��r s)
SP_GET_ADDQUALIFICATION_MT��s �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� %
additionalQualification
�� *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
Courses
�� &
>
��& '
>
��' (
CourseFilter
��) 5
(
��5 6
int
��6 9
slno
��: >
)
��> ?
{
�� 	
List
�� 
<
�� 
Courses
�� 
>
�� 
courses
�� !
=
��" #
new
��$ '
List
��( ,
<
��, -
Courses
��- 4
>
��4 5
(
��5 6
)
��6 7
;
��7 8
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 4
,
��4 5
slno
��6 :
,
��: ;
dbType
��< B
:
��B C
OracleMappingType
��D U
.
��U V
Int32
��V [
,
��[ \
	direction
��] f
:
��f g 
ParameterDirection
��h z
.
��z {
Input��{ �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
courses
�� 
=
�� 
(
�� 
await
��  

connection
��! +
.
��+ ,

QueryAsync
��, 6
<
��6 7
Courses
��7 >
>
��> ?
(
��? @ 
DatabaseProcedures
��@ R
.
��R S#
SP_FILTEREDUCOURSE_MT
��S h
,
��h i
	parmeters
��j s
,
��s t
commandType��u �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
courses
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� .
 GetUpdateEmployeeEmailAddressOtp
��  @
(
��@ A"
UpdadteEmployeeEmail
��A U"
updadteEmployeeEmail
��V j
)
��j k
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
OtpData
�� 
otpData
�� 
=
�� 
null
�� "
;
��" #
string
�� 
otpValue
�� 
=
�� 
string
�� $
.
��$ %
Empty
��% *
;
��* +
string
�� 

otpMessage
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
;
��, -
int
�� 
EmailsavedRecords
�� !
=
��" #
$num
��$ %
;
��% &
var
�� 
Subject
�� 
=
�� !
ApplicationSettings
�� -
.
��- .
Current
��. 5
.
��5 6
OTPMailSubject
��6 D
;
��D E
string
�� 
email
�� 
=
�� "
updadteEmployeeEmail
�� /
.
��/ 0

��0 =
.
��= >

��> K
(
��K L
)
��L M
?
��N O"
updadteEmployeeEmail
��P d
.
��d e
	WorkEmail
��e n
:
��o p#
updadteEmployeeEmail��q �
.��� �

;��� �
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
using
�� 
(
�� 
var
�� 
tran
�� 
=
��  !

connection
��" ,
.
��, -
BeginTransaction
��- =
(
��= >
)
��> ?
)
��? @
{
�� %
OracleDynamicParameters
�� +

parameters
��, 6
=
��7 8
new
��9 <%
OracleDynamicParameters
��= T
(
��T U
)
��U V
;
��V W
otpValue
�� 
=
�� 
GenerateOtp
�� *
(
��* +
)
��+ ,
;
��, -
string
�� 

OTPMessage
�� %
=
��& '!
ApplicationSettings
��( ;
.
��; <
Current
��< C
.
��C D

OTPMessage
��D N
;
��N O

otpMessage
�� 
=
��  
string
��! '
.
��' (
Format
��( .
(
��. /

OTPMessage
��/ 9
,
��9 :
Environment
��; F
.
��F G
NewLine
��G N
,
��N O
otpValue
��P X
,
��X Y!
ApplicationSettings
��Z m
.
��m n
Current
��n u
.
��u v

OtpTimeOut��v �
,��� �
Environment��� �
.��� �
NewLine��� �
)��� �
;��� �
var
�� 
message
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0

otpMessage
��0 :
,
��: ;
email
��< A
,
��A B
otpValue
��C K
)
��K L
;
��L M
string
�� 

templateid
�� %
=
��& '!
ApplicationSettings
��( ;
.
��; <
Current
��< C
.
��C D
OTPMailTemplateId
��D U
;
��U V

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 8
,
��8 9"
updadteEmployeeEmail
��: N
.
��N O
EmployeeSlno
��O [
,
��[ \
dbType
��] c
:
��c d
OracleMappingType
��e v
.
��v w
Int32
��w |
,
��| }
	direction��~ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) >
,
��> ?
MailSettings
��@ L
.
��L M
Current
��M T
.
��T U
	FromEmail
��U ^
,
��^ _
dbType
��` f
:
��f g
OracleMappingType
��h y
.
��y z
Varchar2��z �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) <
,
��< =
email
��> C
,
��C D
dbType
��E K
:
��K L
OracleMappingType
��M ^
.
��^ _
Varchar2
��_ g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 3
,
��3 4
Subject
��5 <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Varchar2
��X `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 3
,
��3 4
message
��5 <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Varchar2
��X `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 6
,
��6 7

templateid
��8 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Varchar2
��^ f
,
��f g
	direction
��h q
:
��q r!
ParameterDirection��s �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 8
,
��8 9
otpValue
��: B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Varchar2
��^ f
,
��f g
	direction
��h q
:
��q r!
ParameterDirection��s �
.��� �
Input��� �
)��� �
;��� �
EmailsavedRecords
�� %
=
��& '
await
��( -

connection
��. 8
.
��8 9
ExecuteAsync
��9 E
(
��E F 
DatabaseProcedures
��F X
.
��X Y
SEND_OTP_EMAIL
��Y g
,
��g h

parameters
��i s
,
��s t
commandType��u �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
tran
�� 
.
�� 
Commit
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 
resp
�� 
=
�� 
(
�� 
EmailsavedRecords
�� %
*
��& '
-
��( )
$num
��) *
)
��* +
>
��, -
$num
��. /
;
��/ 0
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 1
#VerifyUpdateEmployeeEmailAddressOtp
��  C
(
��C D"
UpdadteEmployeeEmail
��D X"
updadteEmployeeEmail
��Y m
)
��m n
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� "
EmailOtpVerification
��  !
verificationDetails
��! 4
=
��5 6
null
��7 ;
;
��; <
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
string
�� 
email
�� 
=
�� "
updadteEmployeeEmail
�� /
.
��/ 0

��0 =
.
��= >

��> K
(
��K L
)
��L M
?
��N O"
updadteEmployeeEmail
��P d
.
��d e
	WorkEmail
��e n
:
��o p#
updadteEmployeeEmail��q �
.��� �

;��� �
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5"
updadteEmployeeEmail
��6 J
.
��J K
GeneratedOtp
��K W
,
��W X
dbType
��Y _
:
��_ `
OracleMappingType
��a r
.
��r s
Varchar2
��s {
,
��{ |
	direction��} �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
email
��7 <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Varchar2
��X `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {!
verificationDetails
�� #
=
��$ %
(
��& '
await
��' ,

connection
��- 7
.
��7 8

QueryAsync
��8 B
<
��B C"
EmailOtpVerification
��C W
>
��W X
(
��X Y 
DatabaseProcedures
��Y k
.
��k l+
SP_GET_EMAILOTP_VERIFICATION��l �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
if
�� 
(
�� !
verificationDetails
�� '
!=
��( *
null
��+ /
&&
��0 2!
verificationDetails
��3 F
.
��F G
GeneratedOtp
��G S
==
��T V"
updadteEmployeeEmail
��W k
.
��k l
GeneratedOtp
��l x
)
��x y
{
�� 
DateTime
�� 
d1
�� 
=
��  !!
verificationDetails
��" 5
.
��5 6

��6 C
;
��C D
DateTime
�� 
d2
�� 
=
��  !
d1
��" $
.
��$ %

AddMinutes
��% /
(
��/ 0!
ApplicationSettings
��0 C
.
��C D
Current
��D K
.
��K L

OtpTimeOut
��L V
)
��V W
;
��W X
int
�� 
result
�� 
=
��  
DateTime
��! )
.
��) *
Compare
��* 1
(
��1 2
d2
��2 4
,
��4 5
DateTime
��6 >
.
��> ?
Now
��? B
)
��B C
;
��C D
if
�� 
(
�� 
result
�� 
>=
�� !
$num
��" #
)
��# $
{
�� 
using
�� 
(
�� 
var
�� "
tran
��# '
=
��( )

connection
��* 4
.
��4 5
BeginTransaction
��5 E
(
��E F
)
��F G
)
��G H
{
�� %
OracleDynamicParameters
�� 3
emailparameters
��4 C
=
��D E
new
��F I%
OracleDynamicParameters
��J a
(
��a b
)
��b c
;
��c d
emailparameters
�� +
.
��+ ,
Add
��, /
(
��/ 0
name
��0 4
:
��4 5
$str
��6 E
,
��E F"
updadteEmployeeEmail
��G [
.
��[ \
EmployeeSlno
��\ h
,
��h i
dbType
��j p
:
��p q 
OracleMappingType��r �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
emailparameters
�� +
.
��+ ,
Add
��, /
(
��/ 0
name
��0 4
:
��4 5
$str
��6 >
,
��> ?"
updadteEmployeeEmail
��@ T
.
��T U

��U b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
emailparameters
�� +
.
��+ ,
Add
��, /
(
��/ 0
name
��0 4
:
��4 5
$str
��6 B
,
��B C"
updadteEmployeeEmail
��D X
.
��X Y
	WorkEmail
��Y b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� *
=
��+ ,
await
��- 2

connection
��3 =
.
��= >
ExecuteAsync
��> J
(
��J K 
DatabaseProcedures
��K ]
.
��] ^!
SP_POR_UPDATE_EMAIL
��^ q
,
��q r
emailparameters��s �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
tran
��  
.
��  !
Commit
��! '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 
}
�� 
}
�� 
resp
�� 
=
�� 
(
�� 
updatedRecords
�� "
*
��# $
-
��% &
$num
��& '
)
��' (
>
��) *
$num
��+ ,
;
��, -
return
�� 
resp
�� 
;
�� 
}
�� 	
private
�� 
string
�� 
GenerateOtp
�� "
(
��" #
)
��# $
{
�� 	
string
�� 
	secretKey
�� 
=
�� 
$str
�� a
;
��a b
Totp
�� 
otpCalc
�� 
=
�� 
new
�� 
Totp
�� #
(
��# $
Encoding
��$ ,
.
��, -
UTF8
��- 1
.
��1 2
GetBytes
��2 :
(
��: ;
	secretKey
��; D
)
��D E
,
��E F
$num
��G I
,
��I J
OtpHashMode
��K V
.
��V W
Sha512
��W ]
,
��] ^
$num
��_ `
)
��` a
;
��a b
string
�� 
otp
�� 
=
�� 
otpCalc
��  
.
��  !
ComputeTotp
��! ,
(
��, -
DateTime
��- 5
.
��5 6
UtcNow
��6 <
)
��< =
;
��= >
return
�� 
otp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� )
UpdateEmployeeFamilyDetails
��  ;
(
��; <
FamilyDetail
��< H

��I V
)
��V W
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
int
�� 
age
�� 
=
�� 
$num
�� 
;
�� 

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3

��4 A
.
��A B

EmpFamSlno
��B L
,
��L M
dbType
��N T
:
��T U
OracleMappingType
��V g
.
��g h
Int32
��h m
,
��m n
	direction
��o x
:
��x y!
ParameterDirection��z �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0

��1 >
.
��> ?
EmployeeSlno
��? K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Int32
��g l
,
��l m
	direction
��n w
:
��w x!
ParameterDirection��y �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1

��2 ?
.
��? @
Uniqueno
��@ H
,
��H I
dbType
��J P
:
��P Q
OracleMappingType
��R c
.
��c d
Int32
��d i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1

��2 ?
.
��? @
BrelSlno
��@ H
,
��H I
dbType
��J P
:
��P Q
OracleMappingType
��R c
.
��c d
Int32
��d i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% ,
,
��, -

��. ;
.
��; <
RelationName
��< H
,
��H I
dbType
��J P
:
��P Q
OracleMappingType
��R c
.
��c d
Varchar2
��d l
,
��l m
	direction
��n w
:
��w x!
ParameterDirection��y �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% +
,
��+ ,
age
��- 0
,
��0 1
dbType
��2 8
:
��8 9
OracleMappingType
��: K
.
��K L
Int32
��L Q
,
��Q R
	direction
��S \
:
��\ ] 
ParameterDirection
��^ p
.
��p q
Input
��q v
)
��v w
;
��w x

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
$num
��5 6
,
��6 7
dbType
��8 >
:
��> ?
OracleMappingType
��@ Q
.
��Q R
Int32
��R W
,
��W X
	direction
��Y b
:
��b c 
ParameterDirection
��d v
.
��v w
Input
��w |
)
��| }
;
��} ~

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4

��5 B
.
��B C
Description
��C N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Varchar2
��j r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1

��2 ?
.
��? @
Userslno
��@ H
,
��H I
dbType
��J P
:
��P Q
OracleMappingType
��R c
.
��c d
Int32
��d i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
$str
��3 5
,
��5 6
dbType
��7 =
:
��= >
OracleMappingType
��? P
.
��P Q
Varchar2
��Q Y
,
��Y Z
	direction
��[ d
:
��d e 
ParameterDirection
��f x
.
��x y
Input
��y ~
)
��~ 
;�� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% +
,
��+ ,

��- :
.
��: ;
RelationDOB
��; F
!=
��G I
null
��J N
?
��O P

��Q ^
.
��^ _
RelationDOB
��_ j
.
��j k
Value
��k p
.
��p q
ToOracleDate
��q }
(
��} ~
)
��~ 
:��� �
null��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Date��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R%
SP_UPDATE_FAMILYDETAILS
��R i
,
��i j

parameters
��k u
,
��u v
commandType��w �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
updatedRecords
�� "
*
��# $
-
��% &
$num
��& '
)
��' (
>
��) *
$num
��+ ,
;
��, -
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� ,
UpdateEmployeeEducationDetails
��  >
(
��> ?
EducationDetail
��? N
educationDetail
��O ^
)
��^ _
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
educationDetail
��4 C
.
��C D

Empeduslno
��D N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
educationDetail
��1 @
.
��@ A
EmployeeSlno
��A M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Int32
��i n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
educationDetail
��2 A
.
��A B
Uniqueno
��B J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
educationDetail
��7 F
.
��F G

��G T
,
��T U
dbType
��V \
:
��\ ]
OracleMappingType
��^ o
.
��o p
Int32
��p u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
educationDetail
��7 F
.
��F G

��G T
,
��T U
dbType
��V \
:
��\ ]
OracleMappingType
��^ o
.
��o p
Int32
��p u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
educationDetail
��4 C
.
��C D

Addquaslno
��D N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% ,
,
��, -
educationDetail
��. =
.
��= >
HtNo
��> B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Varchar2
��^ f
,
��f g
	direction
��h q
:
��q r!
ParameterDirection��s �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 6
,
��6 7
educationDetail
��8 G
.
��G H
Specialization
��H V
,
��V W
dbType
��X ^
:
��^ _
OracleMappingType
��` q
.
��q r
Varchar2
��r z
,
��z {
	direction��| �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
educationDetail
��5 D
.
��D E
CollegeName
��E P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 7
,
��7 8
educationDetail
��9 H
.
��H I
UniversityBoard
��I X
,
��X Y
dbType
��Z `
:
��` a
OracleMappingType
��b s
.
��s t
Int32
��t y
,
��y z
	direction��{ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% ;
,
��; <
educationDetail
��= L
.
��L M!
UniversityBoardName
��M `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Varchar2��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
educationDetail
��7 F
.
��F G

��G T
,
��T U
dbType
��V \
:
��\ ]
OracleMappingType
��^ o
.
��o p
Int32
��p u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
educationDetail
��5 D
.
��D E

Percentage
��E O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Decimal
��k r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
educationDetail
��7 F
.
��F G

��G T
,
��T U
dbType
��V \
:
��\ ]
OracleMappingType
��^ o
.
��o p
Int32
��p u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
educationDetail
��6 E
.
��E F
Reasonforgap
��F R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Varchar2
��n v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 7
,
��7 8
educationDetail
��9 H
.
��H I
ExtraActivities
��I X
,
��X Y
dbType
��Z `
:
��` a
OracleMappingType
��b s
.
��s t
Varchar2
��t |
,
��| }
	direction��~ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
educationDetail
��2 A
.
��A B
UserSlno
��B J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
$str
��3 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Varchar2
��^ f
,
��f g
	direction
��h q
:
��q r!
ParameterDirection��s �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R(
SP_UPDATE_EDUCATIONDETAILS
��R l
,
��l m

parameters
��n x
,
��x y
commandType��z �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
updatedRecords
�� "
*
��# $
-
��% &
$num
��& '
)
��' (
>
��) *
$num
��+ ,
;
��, -
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� -
UpdateEmployeeExperienceDetails
��  ?
(
��? @
ExperienceDetail
��@ P
experienceDetail
��Q a
)
��a b
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
experienceDetail
��2 B
.
��B C
Oldempno
��C K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Varchar2
��g o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% -
,
��- .
experienceDetail
��/ ?
.
��? @
Place
��@ E
,
��E F
dbType
��G M
:
��M N
OracleMappingType
��O `
.
��` a
Varchar2
��a i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
experienceDetail
��1 A
.
��A B
RefName
��B I
,
��I J
dbType
��K Q
:
��Q R
OracleMappingType
��S d
.
��d e
Varchar2
��e m
,
��m n
	direction
��o x
:
��x y!
ParameterDirection��z �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
experienceDetail
��4 D
.
��D E

Refphoneno
��E O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Varchar2
��k s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
experienceDetail
��2 B
.
��B C
Refemail
��C K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Varchar2
��g o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
experienceDetail
��5 E
.
��E F
Description
��F Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Varchar2
��m u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
$str
��3 5
,
��5 6
dbType
��7 =
:
��= >
OracleMappingType
��? P
.
��P Q
Varchar2
��Q Y
,
��Y Z
	direction
��[ d
:
��d e 
ParameterDirection
��f x
.
��x y
Input
��y ~
)
��~ 
;�� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
experienceDetail
��2 B
.
��B C
Uniqueno
��C K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Int32
��g l
,
��l m
	direction
��n w
:
��w x!
ParameterDirection��y �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
experienceDetail
��0 @
.
��@ A
Salary
��A G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Int32
��c h
,
��h i
	direction
��j s
:
��s t!
ParameterDirection��u �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
experienceDetail
��4 D
.
��D E

SalaryUnit
��E O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Int32
��k p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
experienceDetail
��5 E
.
��E F
Refmobileno
��F Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Int64
��m r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
experienceDetail
��2 B
.
��B C
Userslno
��C K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Int32
��g l
,
��l m
	direction
��n w
:
��w x!
ParameterDirection��y �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
experienceDetail
��3 C
.
��C D
	EmpExSlno
��D M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Int32
��i n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
experienceDetail
��1 A
.
��A B
EmployeeSlno
��B N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
experienceDetail
��6 F
.
��F G
Organisation
��G S
,
��S T
dbType
��U [
:
��[ \
OracleMappingType
��] n
.
��n o
Varchar2
��o w
,
��w x
	direction��y �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
experienceDetail
��5 E
.
��E F
Designation
��F Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Varchar2
��m u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
experienceDetail
��2 B
.
��B C
FromDate
��C K
!=
��L N
null
��O S
?
��T U
experienceDetail
��V f
.
��f g
FromDate
��g o
.
��o p
Value
��p u
.
��u v
ToOracleDate��v �
(��� �
)��� �
:��� �
null��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Date��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
experienceDetail
��0 @
.
��@ A
ToDate
��A G
!=
��H J
null
��K O
?
��P Q
experienceDetail
��R b
.
��b c
ToDate
��c i
.
��i j
Value
��j o
.
��o p
ToOracleDate
��p |
(
��| }
)
��} ~
:�� �
null��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Date��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
experienceDetail
��7 G
.
��G H

��H U
,
��U V
dbType
��W ]
:
��] ^
OracleMappingType
��_ p
.
��p q
Int32
��q v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R)
SP_UPDATE_EXPERIENCEDETAILS
��R m
,
��m n

parameters
��o y
,
��y z
commandType��{ �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
updatedRecords
�� "
*
��# $
-
��% &
$num
��& '
)
��' (
>
��) *
$num
��+ ,
;
��, -
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� )
DeleteEmployeeFamilyDetails
��  ;
(
��; <
int
��< ?

empFamSlno
��@ J
)
��J K
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
deletedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3

empFamSlno
��4 >
,
��> ?
dbType
��@ F
:
��F G
OracleMappingType
��H Y
.
��Y Z
Int32
��Z _
,
��_ `
	direction
��a j
:
��j k 
ParameterDirection
��l ~
.
��~ 
Input�� �
)��� �
;��� �
deletedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R$
SP_DELETE_EMPFAMILY_DT
��R h
,
��h i

parameters
��j t
,
��t u
commandType��v �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
deletedRecords
�� "
*
��# $
-
��% &
$num
��& '
)
��' (
>
��) *
$num
��+ ,
;
��, -
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� ,
DeleteEmployeeEducationDetails
��  >
(
��> ?
int
��? B

empEduSlno
��C M
)
��M N
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
deletedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3

empEduSlno
��4 >
,
��> ?
dbType
��@ F
:
��F G
OracleMappingType
��H Y
.
��Y Z
Int32
��Z _
,
��_ `
	direction
��a j
:
��j k 
ParameterDirection
��l ~
.
��~ 
Input�� �
)��� �
;��� �
deletedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R'
SP_DELETE_EMPEDUCATION_DT
��R k
,
��k l

parameters
��m w
,
��w x
commandType��y �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
deletedRecords
�� "
*
��# $
-
��% &
$num
��& '
)
��' (
>
��) *
$num
��+ ,
;
��, -
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� -
DeleteEmployeeExperienceDetails
��  ?
(
��? @
int
��@ C
	empExSlno
��D M
)
��M N
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
deletedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
	empExSlno
��3 <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Int32
��X ]
,
��] ^
	direction
��_ h
:
��h i 
ParameterDirection
��j |
.
��| }
Input��} �
)��� �
;��� �
deletedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R(
SP_DELETE_EMPEXPERIENCE_DT
��R l
,
��l m

parameters
��n x
,
��x y
commandType��z �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
deletedRecords
�� "
*
��# $
-
��% &
$num
��& '
)
��' (
>
��) *
$num
��+ ,
;
��, -
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
PagedResultSet
�� (
<
��( )
EmployeeProfile
��) 8
>
��8 9
>
��9 :
GetMyTeamMembers
��; K
(
��K L/
!EmployeeInformationSearchCriteria
��L m
searchCriteria
��n |
)
��| }
{
�� 	
List
�� 
<
�� 
EmployeeProfile
��  
>
��  !

��" /
=
��0 1
null
��2 6
;
��6 7
PagedResultSet
�� 
<
�� 
EmployeeProfile
�� *
>
��* +
	menuItems
��, 5
=
��6 7
null
��8 <
;
��< =
int
�� 
totalRecords
�� 
=
�� 
$num
��  
;
��  !
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
searchCriteria
��4 B
.
��B C
	ManagerId
��C L
,
��L M
dbType
��N T
:
��T U
OracleMappingType
��V g
.
��g h
Int32
��h m
,
��m n
	direction
��o x
:
��x y!
ParameterDirection��z �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
searchCriteria
��6 D
.
��D E
IncludeSelf
��E P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Int32
��l q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
dbType
��7 =
:
��= >
OracleMappingType
��? P
.
��P Q
Int32
��Q V
,
��V W
	direction
��X a
:
��a b 
ParameterDirection
��c u
.
��u v
Output
��v |
)
��| }
;
��} ~

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
var
�� "
dbScreenInformations
�� (
=
��) *
await
��+ 0

connection
��1 ;
.
��; <

QueryAsync
��< F
<
��F G
EmployeeProfile
��G V
>
��V W
(
��W X 
DatabaseProcedures
��X j
.
��j k!
SP_GET_TEAM_MEMBERS
��k ~
,
��~ 

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
totalRecords
�� 
=
�� 

parameters
�� )
.
��) *
Get
��* -
<
��- .
int
��. 1
>
��1 2
(
��2 3
$str
��3 D
)
��D E
.
��E F
ToInt32OrDefault
��F V
(
��V W
)
��W X
;
��X Y

�� 
=
�� "
dbScreenInformations
��  4
.
��4 5
ToList
��5 ;
(
��; <
)
��< =
;
��= >
}
�� 
	menuItems
�� 
=
�� 
new
�� 
PagedResultSet
�� *
<
��* +
EmployeeProfile
��+ :
>
��: ;
(
��; <
)
��< =
{
�� 
Items
�� 
=
�� 

�� %
,
��% &
	PageIndex
�� 
=
�� 
searchCriteria
�� *
.
��* +

StartIndex
��+ 5
,
��5 6
PageSize
�� 
=
�� 
searchCriteria
�� )
.
��) *
EndIndex
��* 2
,
��2 3

TotalItems
�� 
=
�� 
totalRecords
�� )
,
��) *
}
�� 
;
��
return
�� 
	menuItems
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
AppointmentLetter
�� 0
>
��0 1
>
��1 2)
GetPendingAppointmentLetter
��3 N
(
��N O
)
��O P
{
�� 	
List
�� 
<
�� 
AppointmentLetter
�� "
>
��" # 
appointmentLetters
��$ 6
=
��7 8
null
��9 =
;
��= >
IEnumerable
�� 
<
�� 
AppointmentLetter
�� )
>
��) *'
pendingAppointmentLetters
��+ D
=
��E F
null
��G K
;
��K L
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {'
pendingAppointmentLetters
�� )
=
��* +
await
��, 1

connection
��2 <
.
��< =

QueryAsync
��= G
<
��G H
AppointmentLetter
��H Y
>
��Y Z
(
��Z [ 
DatabaseProcedures
��[ m
.
��m n&
GET_APPOINTMENT_LETTERS��n �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� '
pendingAppointmentLetters
�� )
!=
��* ,
null
��- 1
)
��1 2
{
�� 
appointmentLetters
�� "
=
��# $'
pendingAppointmentLetters
��% >
.
��> ?
ToList
��? E
(
��E F
)
��F G
;
��G H
}
�� 
else
�� 
{
�� 
appointmentLetters
�� "
=
��# $
new
��% (
List
��) -
<
��- .
AppointmentLetter
��. ?
>
��? @
(
��@ A
)
��A B
;
��B C
}
�� 
return
��  
appointmentLetters
�� %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� +
UpdateAppointmentLetterStatus
�� 7
(
��7 8
int
��8 ;
employeeNumber
��< J
)
��J K
{
�� 	
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S
string
�� 

templateid
�� !
=
��" #!
ApplicationSettings
��$ 7
.
��7 8
Current
��8 ?
.
��? @
HrmsOtpTemplate
��@ O
;
��O P

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeNumber
��6 D
,
��D E
dbType
��F L
:
��L M
OracleMappingType
��N _
.
��_ `
Int32
��` e
,
��e f
	direction
��g p
:
��p q!
ParameterDirection��r �
.��� �
Input��� �
)��� �
;��� �
await
�� 

connection
��  
.
��  !
ExecuteAsync
��! -
(
��- . 
DatabaseProcedures
��. @
.
��@ A'
UPDATE_APPT_LETTER_STATUS
��A Z
,
��Z [

parameters
��\ f
,
��f g
commandType
��h s
:
��s t
CommandType��u �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
EmployeeProfile
�� .
>
��. /
>
��/ 0
SearchEmployee
��1 ?
(
��? @
string
��@ F
searchValue
��G R
)
��R S
{
�� 	
List
�� 
<
�� 
EmployeeProfile
��  
>
��  !
employeeProfiles
��" 2
=
��3 4
null
��5 9
;
��9 :
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
$str
�� &
,
��& '
searchValue
��( 3
,
��3 4
OracleMappingType
��5 F
.
��F G
Varchar2
��G O
,
��O P 
ParameterDirection
��Q c
.
��c d
Input
��d i
)
��i j
;
��j k

parameters
�� 
.
�� 
Add
�� 
(
�� 
$str
�� (
,
��( )
null
��* .
,
��. /
OracleMappingType
��0 A
.
��A B
	RefCursor
��B K
,
��K L 
ParameterDirection
��M _
.
��_ `
Output
��` f
)
��f g
;
��g h
var
�� 
dbEmployees
�� 
=
��  !
await
��" '

connection
��( 2
.
��2 3

QueryAsync
��3 =
<
��= >
EmployeeProfile
��> M
>
��M N
(
��N O 
DatabaseProcedures
��O a
.
��a b"
P_GETEMPDATA_FOR_API
��b v
,
��v w

parameters��x �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
employeeProfiles
��  
=
��! "
dbEmployees
��# .
.
��. /
ToList
��/ 5
(
��5 6
)
��6 7
;
��7 8
}
�� 
return
�� 
employeeProfiles
�� #
;
��# $
}
�� 	
}
�� 
}�� �;
TF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Form16\Form16Repository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
Form16& ,
{ 
public 

class 
Form16Repository !
:! "
BaseRepository# 1
{ 
private 
readonly 
IConfiguration '

;5 6
public 
Form16Repository 
(  
IConfiguration  .

)< =
:> ?
base@ D
(D E

)R S
{ 	
this 
. 

=  

;. /
} 	
public 
async 
Task 
< 
List 
< 
TaxDocuments +
>+ ,
>, -
	GetForm16. 7
(7 8
string8 >
panNo? D
)D E
{ 	
string 
	imagePath 
= 
string %
.% &
Empty& +
;+ ,
List 
< 
YearWiseTaxDocument $
>$ %
form16Documents& 5
=6 7
null8 <
;< =
List 
< 
TaxDocuments 
> 
taxDouments *
=+ ,
null- 1
;1 2
using   
(   
var   

connection   !
=  " #
await  $ )
base  * .
.  . /
CreateConnection  / ?
(  ? @
DbSchema  @ H
.  H I
PORTAL  I O
)  O P
)  P Q
{!! 
OracleDynamicParameters"" '
	parmeters""( 1
=""2 3
new""4 7#
OracleDynamicParameters""8 O
(""O P
)""P Q
;""Q R
	parmeters## 
.## 
Add## 
(## 
name## "
:##" #
$str##$ ,
,##, -
panNo##. 3
,##3 4
dbType##5 ;
:##; <
OracleMappingType##= N
.##N O
Varchar2##O W
,##W X
	direction##Y b
:##b c
ParameterDirection##d v
.##v w
Input##w |
)##| }
;##} ~
	parmeters$$ 
.$$ 
Add$$ 
($$ 
name$$ "
:$$" #
$str$$$ -
,$$- .
dbType$$/ 5
:$$5 6
OracleMappingType$$7 H
.$$H I
	RefCursor$$I R
,$$R S
	direction$$T ]
:$$] ^
ParameterDirection$$_ q
.$$q r
Output$$r x
)$$x y
;$$y z
form16Documents&& 
=&&  !
(&&" #
await&&# (

connection&&) 3
.&&3 4

QueryAsync&&4 >
<&&> ?
YearWiseTaxDocument&&? R
>&&R S
(&&S T
DatabaseProcedures&&T f
.&&f g
FORM_16_DOWNLOAD&&g w
,&&w x
	parmeters	&&y �
,
&&� �
commandType
&&� �
:
&&� �
CommandType
&&� �
.
&&� �
StoredProcedure
&&� �
)
&&� �
)
&&� �
.
&&� �
ToList
&&� �
(
&&� �
)
&&� �
;
&&� �
}'' 
	imagePath)) 
=)) 
ApplicationSettings)) +
.))+ ,
Current)), 3
.))3 4
	ImagePath))4 =
.))= >
ToString))> F
())F G
)))G H
;))H I
if++ 
(++ 
form16Documents++ 
.++  
Any++  #
(++# $
)++$ %
)++% &
{,, 
taxDouments-- 
=-- 
new-- !
List--" &
<--& '
TaxDocuments--' 3
>--3 4
(--4 5
)--5 6
;--6 7
var// 
results// 
=// 
from// "
p//# $
in//% '
form16Documents//( 7
group00 #
p00$ %
by00& (
p00) *
.00* +
FinYear00+ 2
into003 7
g008 9
select11 $
new11% (
{11) *
Year11+ /
=110 1
g112 3
.113 4
Key114 7
,117 8
TaxDocuments119 E
=11F G
g11H I
.11I J
ToList11J P
(11P Q
)11Q R
}11S T
;11T U
foreach33 
(33 
var33 
item33 !
in33" $
results33% ,
)33, -
{44 
TaxDocuments55  
taxDocument55! ,
=55- .
new55/ 2
TaxDocuments553 ?
(55? @
)55@ A
;55A B
taxDocument66 
.66  
FinYear66  '
=66( )
item66* .
.66. /
Year66/ 3
;663 4
taxDocument77 
.77   
YearWiseTaxDocuments77  4
=775 6
item777 ;
.77; <
TaxDocuments77< H
;77H I
taxDouments88 
.88  
Add88  #
(88# $
taxDocument88$ /
)88/ 0
;880 1
}99 
}:: 
return;; 
taxDouments;; 
;;; 
}<< 	
public>> 
async>> 
Task>> 
<>> 
byte>> 
[>> 
]>>  
>>>  !
DownLoadForm16>>" 0
(>>0 1
YearWiseTaxDocument>>1 D
taxDocument>>E P
)>>P Q
{?? 	
string@@ 
	imagePath@@ 
=@@ 
ApplicationSettings@@ 2
.@@2 3
Current@@3 :
.@@: ;
ProfilePath@@; F
.@@F G
ToString@@G O
(@@O P
)@@P Q
;@@Q R
stringAA 
[AA 
]AA 
fileDataAA 
=AA 
taxDocumentAA  +
.AA+ ,
FilePathAA, 4
.AA4 5
SplitAA5 :
(AA: ;
$charAA; ?
)AA? @
;AA@ A
ifBB 
(BB 
fileDataBB 
!=BB 
nullBB 
&&BB  "
fileDataBB# +
.BB+ ,
LengthBB, 2
>BB3 4
$numBB5 6
)BB6 7
{CC 
fileDataDD 
[DD 
$numDD 
]DD 
=DD 
	imagePathDD '
;DD' (
}EE 
stringFF 
filePathFF 
=FF 
stringFF $
.FF$ %
JoinFF% )
(FF) *
$charFF* -
,FF- .
fileDataFF/ 7
)FF7 8
;FF8 9


strBuilderGG $
=GG% &
newGG' *

(GG8 9
)GG9 :
;GG: ;

strBuilderHH 
.HH 
AppendHH 
(HH 
filePathHH &
)HH& '
;HH' (
UriII 
uriII 
=II 
newII 
UriII 
(II 

strBuilderII (
.II( )
ToStringII) 1
(II1 2
)II2 3
)II3 4
;II4 5
byteJJ 
[JJ 
]JJ 
responseJJ 
=JJ 
newJJ !
	WebClientJJ" +
(JJ+ ,
)JJ, -
.JJ- .
DownloadDataJJ. :
(JJ: ;
uriJJ; >
.JJ> ?
AbsoluteUriJJ? J
)JJJ K
;JJK L
returnKK 
responseKK 
;KK 
}LL 	
}MM 
}NN �A
bF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\HelpDocuments\HelpDocumentsRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &

{ 
public 

class #
HelpDocumentsRepository (
:) *
BaseRepository+ 9
{ 
private 
readonly 
IConfiguration '

;5 6
public #
HelpDocumentsRepository &
(& '
IConfiguration' 5

)C D
:E F
baseG K
(K L

)Y Z
{ 	
this 
. 

=  

;. /
} 	
public 
async 
Task 
< 
List 
< 
HelpDocument +
>+ ,
>, -
GetActiveHelpDocs. ?
(? @
int@ C
officeTypeSLNOD R
)R S
{ 	
List 
< 
HelpDocument 
> 

=- .
null/ 3
;3 4
using 
( 
var 

connection !
=" #
await$ )
base* .
.. /
CreateConnection/ ?
(? @
DbSchema@ H
.H I
PORTALI O
)O P
)P Q
{   
OracleDynamicParameters!! '

parameters!!( 2
=!!3 4
new!!5 8#
OracleDynamicParameters!!9 P
(!!P Q
)!!Q R
;!!R S

parameters"" 
."" 
Add"" 
("" 
name"" #
:""# $
$str""% 6
,""6 7
officeTypeSLNO""8 F
,""F G
dbType""H N
:""N O
OracleMappingType""P a
.""a b
Int32""b g
,""g h
	direction""i r
:""r s
ParameterDirection	""t �
.
""� �
Input
""� �
)
""� �
;
""� �

parameters## 
.## 
Add## 
(## 
name## #
:### $
$str##% .
,##. /
dbType##0 6
:##6 7
OracleMappingType##8 I
.##I J
	RefCursor##J S
,##S T
	direction##U ^
:##^ _
ParameterDirection##` r
.##r s
Output##s y
)##y z
;##z {

=$$ 
($$  !
await$$! &

connection$$' 1
.$$1 2

QueryAsync$$2 <
<$$< =
HelpDocument$$= I
>$$I J
($$J K
DatabaseProcedures$$K ]
.$$] ^!
SP_GET_HELP_DOCUMENTS$$^ s
,$$s t

parameters$$u 
,	$$ �
commandType
$$� �
:
$$� �
CommandType
$$� �
.
$$� �
StoredProcedure
$$� �
)
$$� �
)
$$� �
.
$$� �
ToList
$$� �
(
$$� �
)
$$� �
;
$$� �

=%% 

.%%- .
OrderByDescending%%. ?
(%%? @
x%%@ A
=>%%B D
x%%E F
.%%F G
HelpDocumentSlno%%G W
)%%W X
.%%X Y
ToList%%Y _
(%%_ `
)%%` a
;%%a b
}&& 
return'' 

;''  !
}(( 	
public** 
async** 
Task** 
<** 
bool** 
>** 
SaveHelpDocHistory**  2
(**2 3
HelpDocument**3 ?
helpDocument**@ L
)**L M
{++ 	
int,, 
EmailsavedRecords,, !
=,," #
$num,,$ %
;,,% &#
OracleDynamicParameters-- #

parameters--$ .
=--/ 0
null--1 5
;--5 6
using.. 
(.. 


connection..! +
=.., -
await... 3
base..4 8
...8 9
CreateConnection..9 I
(..I J
DbSchema..J R
...R S
PORTAL..S Y
)..Y Z
)..Z [
{// 
using00 
(00 
var00 
tran00 
=00  !

connection00" ,
.00, -
BeginTransaction00- =
(00= >
)00> ?
)00? @
{11 

parameters22 
=22  
new22! $#
OracleDynamicParameters22% <
(22< =
)22= >
;22> ?

parameters33 
.33 
Add33 "
(33" #
name33# '
:33' (
$str33) 8
,338 9
helpDocument33: F
.33F G
EmployeeSlno33G S
,33S T
dbType33U [
:33[ \
OracleMappingType33] n
.33n o
Int3233o t
,33t u
	direction33v 
:	33 � 
ParameterDirection
33� �
.
33� �
Input
33� �
)
33� �
;
33� �

parameters44 
.44 
Add44 "
(44" #
name44# '
:44' (
$str44) 7
,447 8
helpDocument449 E
.44E F
HelpDocumentSlno44F V
,44V W
dbType44X ^
:44^ _
OracleMappingType44` q
.44q r
Int3244r w
,44w x
	direction	44y �
:
44� � 
ParameterDirection
44� �
.
44� �
Input
44� �
)
44� �
;
44� �

parameters55 
.55 
Add55 "
(55" #
name55# '
:55' (
$str55) 9
,559 :
DateTime55; C
.55C D
Now55D G
,55G H
dbType55I O
:55O P
OracleMappingType55Q b
.55b c
Date55c g
,55g h
	direction55i r
:55r s
ParameterDirection	55t �
.
55� �
Input
55� �
)
55� �
;
55� �
EmailsavedRecords77 %
=77& '
await77( -

connection77. 8
.778 9
ExecuteAsync779 E
(77E F
DatabaseProcedures77F X
.77X Y#
INSERT_DOWNLOAD_HISTORY77Y p
,77p q

parameters77r |
,77| }
commandType	77~ �
:
77� �
CommandType
77� �
.
77� �
StoredProcedure
77� �
)
77� �
;
77� �
tran99 
.99 
Commit99 
(99  
)99  !
;99! "
}:: 
};; 
return== 
true== 
;== 
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
byte@@ 
[@@ 
]@@  
>@@  !
DownloadDocument@@" 2
(@@2 3
HelpDocument@@3 ?
helpDocument@@@ L
)@@L M
{AA 	
byteBB 
[BB 
]BB 
responseBB 
=BB 
nullBB "
;BB" #
ifCC 
(CC 
helpDocumentCC 
!=CC 
nullCC  $
)CC$ %
{DD 
awaitEE 
SaveHelpDocHistoryEE (
(EE( )
helpDocumentEE) 5
)EE5 6
;EE6 7
stringFF 
filenameFF 
=FF  !
stringFF" (
.FF( )
FormatFF) /
(FF/ 0
$strFF0 :
,FF: ;
helpDocumentFF< H
.FFH I
FilePathFFI Q
)FFQ R
;FFR S
UriGG 
uriGG 
=GG 
newGG 
UriGG !
(GG! "
filenameGG" *
)GG* +
;GG+ ,
usingHH 
(HH 

HttpClientHH !
clientHH" (
=HH) *
newHH+ .

HttpClientHH/ 9
(HH9 :
)HH: ;
)HH; <
{II 
responseJJ 
=JJ 
awaitJJ $
clientJJ% +
.JJ+ ,
GetByteArrayAsyncJJ, =
(JJ= >
uriJJ> A
.JJA B
AbsoluteUriJJB M
)JJM N
;JJN O
}KK 
}LL 
returnMM 
responseMM 
;MM 
}NN 	
}RR 
}SS ��
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\InvestmentProofs\InvestmentProofsRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
InvestmentProofs& 6
{ 
public 

class &
InvestmentProofsRepository +
:, -
BaseRepository. <
{ 
private 
readonly 
IConfiguration '

;5 6
public &
InvestmentProofsRepository )
() *
IConfiguration* 8

)F G
:H I
baseJ N
(N O

)\ ]
{ 	
this   
.   

=    

;  . /
}!! 	
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% "
HouseRentAllowanceFile%% 5
>%%5 6
>%%6 7%
GetHouseRentAllowancFiles%%8 Q
(%%Q R
int%%R U

)%%c d
{&& 	
List'' 
<'' "
HouseRentAllowanceFile'' '
>''' (!
tdsEmployeeHRADetails'') >
=''? @
null''A E
;''E F
using(( 
((( 
var(( 

connection(( !
=((" #
await(($ )
base((* .
.((. /
CreateConnection((/ ?
(((? @
DbSchema((@ H
.((H I
PORTAL((I O
)((O P
)((P Q
{)) 
OracleDynamicParameters** '
	parmeters**( 1
=**2 3
new**4 7#
OracleDynamicParameters**8 O
(**O P
)**P Q
;**Q R
	parmeters++ 
.++ 
Add++ 
(++ 
name++ "
:++" #
$str++$ 1
,++1 2

,++@ A
dbType++B H
:++H I
OracleMappingType++J [
.++[ \
Int32++\ a
,++a b
	direction++c l
:++l m
ParameterDirection	++n �
.
++� �
Input
++� �
)
++� �
;
++� �
	parmeters,, 
.,, 
Add,, 
(,, 
name,, "
:,," #
$str,,$ -
,,,- .
dbType,,/ 5
:,,5 6
OracleMappingType,,7 H
.,,H I
	RefCursor,,I R
,,,R S
	direction,,T ]
:,,] ^
ParameterDirection,,_ q
.,,q r
Output,,r x
),,x y
;,,y z!
tdsEmployeeHRADetails-- %
=--& '
(--( )
await--) .

connection--/ 9
.--9 :

QueryAsync--: D
<--D E"
HouseRentAllowanceFile--E [
>--[ \
(--\ ]
DatabaseProcedures--] o
.--o p'
P_TDS_EMP_HRA_FILE_DETAILS	--p �
,
--� �
	parmeters
--� �
,
--� �
commandType
--� �
:
--� �
CommandType
--� �
.
--� �
StoredProcedure
--� �
)
--� �
)
--� �
.
--� �
ToList
--� �
(
--� �
)
--� �
;
--� �
}.. 
foreach// 
(// 
var// 
item// 
in//  !
tdsEmployeeHRADetails//! 6
)//6 7
{00 


imagesPath11 (
=11) *
new11+ .

(11< =
)11= >
;11> ?

imagesPath22 
.22 
Clear22  
(22  !
)22! "
;22" #
string44 
[44 
]44 
	imagePath44 "
=44# $
item44% )
.44) *
FilePath44* 2
.442 3
Split443 8
(448 9
$char449 =
)44= >
;44> ?

imagesPath55 
.55 
AppendFormat55 '
(55' (
$str55( G
,55G H
ApplicationSettings55I \
.55\ ]
Current55] d
.55d e
ProfilePath55e p
,55p q
	imagePath55r {
[55{ | 
ApplicationSettings	55| �
.
55� �
Current
55� �
.
55� �
Environment
55� �
==
55� �
$str
55� �
?
55� �
$num
55� �
:
55� �
$num
55� �
]
55� �
)
55� �
;
55� �
item66 
.66 
FilePath66 
=66 

imagesPath66  *
.66* +
ToString66+ 3
(663 4
)664 5
;665 6
}77 
return88 !
tdsEmployeeHRADetails88 (
;88( )
}99 	
public;; 
async;; 
Task;; 
<;; 
List;; 
<;; 
Chapter6FileDetails;; 2
>;;2 3
>;;3 4
GetChapter6Files;;5 E
(;;E F
int;;F I
chapter6DetailId;;J Z
);;Z [
{<< 	
List== 
<== 
Chapter6FileDetails== $
>==$ %
chapter6FileDetails==& 9
===: ;
null==< @
;==@ A
using>> 
(>> 
var>> 

connection>> !
=>>" #
await>>$ )
base>>* .
.>>. /
CreateConnection>>/ ?
(>>? @
DbSchema>>@ H
.>>H I
PORTAL>>I O
)>>O P
)>>P Q
{?? 
OracleDynamicParameters@@ '
	parmeters@@( 1
=@@2 3
new@@4 7#
OracleDynamicParameters@@8 O
(@@O P
)@@P Q
;@@Q R
	parmetersAA 
.AA 
AddAA 
(AA 
nameAA "
:AA" #
$strAA$ 3
,AA3 4
chapter6DetailIdAA5 E
,AAE F
dbTypeAAG M
:AAM N
OracleMappingTypeAAO `
.AA` a
Int32AAa f
,AAf g
	directionAAh q
:AAq r
ParameterDirection	AAs �
.
AA� �
Input
AA� �
)
AA� �
;
AA� �
	parmetersBB 
.BB 
AddBB 
(BB 
nameBB "
:BB" #
$strBB$ -
,BB- .
dbTypeBB/ 5
:BB5 6
OracleMappingTypeBB7 H
.BBH I
	RefCursorBBI R
,BBR S
	directionBBT ]
:BB] ^
ParameterDirectionBB_ q
.BBq r
OutputBBr x
)BBx y
;BBy z
chapter6FileDetailsCC #
=CC$ %
(CC& '
awaitCC' ,

connectionCC- 7
.CC7 8

QueryAsyncCC8 B
<CCB C
Chapter6FileDetailsCCC V
>CCV W
(CCW X
DatabaseProceduresCCX j
.CCj k+
P_EMP_TDS_SUBHEAD_FILE_DETAILS	CCk �
,
CC� �
	parmeters
CC� �
,
CC� �
commandType
CC� �
:
CC� �
CommandType
CC� �
.
CC� �
StoredProcedure
CC� �
)
CC� �
)
CC� �
.
CC� �
ToList
CC� �
(
CC� �
)
CC� �
;
CC� �
}DD 
foreachEE 
(EE 
varEE 
itemEE 
inEE  
chapter6FileDetailsEE! 4
)EE4 5
{FF 


imagesPathGG (
=GG) *
newGG+ .

(GG< =
)GG= >
;GG> ?

imagesPathHH 
.HH 
ClearHH  
(HH  !
)HH! "
;HH" #
stringJJ 
[JJ 
]JJ 
	imagePathJJ "
=JJ# $
itemJJ% )
.JJ) *
FilePathJJ* 2
.JJ2 3
SplitJJ3 8
(JJ8 9
$charJJ9 =
)JJ= >
;JJ> ?

imagesPathKK 
.KK 
AppendFormatKK '
(KK' (
$strKK( M
,KKM N
ApplicationSettingsKKO b
.KKb c
CurrentKKc j
.KKj k
ProfilePathKKk v
,KKv w
	imagePath	KKx �
[
KK� �!
ApplicationSettings
KK� �
.
KK� �
Current
KK� �
.
KK� �
Environment
KK� �
==
KK� �
$str
KK� �
?
KK� �
$num
KK� �
:
KK� �
$num
KK� �
]
KK� �
)
KK� �
;
KK� �
itemLL 
.LL 
FilePathLL 
=LL 

imagesPathLL  *
.LL* +
ToStringLL+ 3
(LL3 4
)LL4 5
;LL5 6
}MM 
returnOO 
chapter6FileDetailsOO &
;OO& '
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
ListRR 
<RR "
HouseIncomeFileDetailsRR 5
>RR5 6
>RR6 7
GetHouseIncomeFilesRR8 K
(RRK L
intRRL O
houseIncomeDetailIdRRP c
)RRc d
{SS 	
ListTT 
<TT "
HouseIncomeFileDetailsTT '
>TT' ("
houseIncomeFileDetailsTT) ?
=TT@ A
nullTTB F
;TTF G
usingUU 
(UU 
varUU 

connectionUU !
=UU" #
awaitUU$ )
baseUU* .
.UU. /
CreateConnectionUU/ ?
(UU? @
DbSchemaUU@ H
.UUH I
PORTALUUI O
)UUO P
)UUP Q
{VV 
OracleDynamicParametersWW '
	parmetersWW( 1
=WW2 3
newWW4 7#
OracleDynamicParametersWW8 O
(WWO P
)WWP Q
;WWQ R
	parmetersXX 
.XX 
AddXX 
(XX 
nameXX "
:XX" #
$strXX$ 3
,XX3 4
houseIncomeDetailIdXX5 H
,XXH I
dbTypeXXJ P
:XXP Q
OracleMappingTypeXXR c
.XXc d
Int32XXd i
,XXi j
	directionXXk t
:XXt u
ParameterDirection	XXv �
.
XX� �
Input
XX� �
)
XX� �
;
XX� �
	parmetersYY 
.YY 
AddYY 
(YY 
nameYY "
:YY" #
$strYY$ -
,YY- .
dbTypeYY/ 5
:YY5 6
OracleMappingTypeYY7 H
.YYH I
	RefCursorYYI R
,YYR S
	directionYYT ]
:YY] ^
ParameterDirectionYY_ q
.YYq r
OutputYYr x
)YYx y
;YYy z"
houseIncomeFileDetailsZZ &
=ZZ' (
(ZZ) *
awaitZZ* /

connectionZZ0 :
.ZZ: ;

QueryAsyncZZ; E
<ZZE F"
HouseIncomeFileDetailsZZF \
>ZZ\ ]
(ZZ] ^
DatabaseProceduresZZ^ p
.ZZp q+
P_EMP_HOUSEINCOME_FILE_DETAILS	ZZq �
,
ZZ� �
	parmeters
ZZ� �
,
ZZ� �
commandType
ZZ� �
:
ZZ� �
CommandType
ZZ� �
.
ZZ� �
StoredProcedure
ZZ� �
)
ZZ� �
)
ZZ� �
.
ZZ� �
ToList
ZZ� �
(
ZZ� �
)
ZZ� �
;
ZZ� �
}[[ 
foreach\\ 
(\\ 
var\\ 
item\\ 
in\\  "
houseIncomeFileDetails\\! 7
)\\7 8
{]] 


imagesPath^^ (
=^^) *
new^^+ .

(^^< =
)^^= >
;^^> ?

imagesPath__ 
.__ 
Clear__  
(__  !
)__! "
;__" #
stringaa 
[aa 
]aa 
	imagePathaa "
=aa# $
itemaa% )
.aa) *
FilePathaa* 2
.aa2 3
Splitaa3 8
(aa8 9
$charaa9 =
)aa= >
;aa> ?

imagesPathbb 
.bb 
AppendFormatbb '
(bb' (
$strbb( O
,bbO P
ApplicationSettingsbbQ d
.bbd e
Currentbbe l
.bbl m
ProfilePathbbm x
,bbx y
	imagePath	bbz �
[
bb� �!
ApplicationSettings
bb� �
.
bb� �
Current
bb� �
.
bb� �
Environment
bb� �
==
bb� �
$str
bb� �
?
bb� �
$num
bb� �
:
bb� �
$num
bb� �
]
bb� �
)
bb� �
;
bb� �
itemcc 
.cc 
FilePathcc 
=cc 

imagesPathcc  *
.cc* +
ToStringcc+ 3
(cc3 4
)cc4 5
;cc5 6
}dd 
returnff "
houseIncomeFileDetailsff )
;ff) *
}gg 	
publicii 
asyncii 
Taskii 
<ii 
Listii 
<ii "
OtherIncomeFileDetailsii 5
>ii5 6
>ii6 7
GetOtherIncomeFilesii8 K
(iiK L
intiiL O
otherIncomeDetailIdiiP c
)iic d
{jj 	
Listkk 
<kk "
OtherIncomeFileDetailskk '
>kk' ("
otherIncomeFileDetailskk) ?
=kk@ A
nullkkB F
;kkF G
usingll 
(ll 
varll 

connectionll !
=ll" #
awaitll$ )
basell* .
.ll. /
CreateConnectionll/ ?
(ll? @
DbSchemall@ H
.llH I
PORTALllI O
)llO P
)llP Q
{mm 
OracleDynamicParametersnn '
	parmetersnn( 1
=nn2 3
newnn4 7#
OracleDynamicParametersnn8 O
(nnO P
)nnP Q
;nnQ R
	parmetersoo 
.oo 
Addoo 
(oo 
nameoo "
:oo" #
$stroo$ 3
,oo3 4
otherIncomeDetailIdoo5 H
,ooH I
dbTypeooJ P
:ooP Q
OracleMappingTypeooR c
.ooc d
Int32ood i
,ooi j
	directionook t
:oot u
ParameterDirection	oov �
.
oo� �
Input
oo� �
)
oo� �
;
oo� �
	parmeterspp 
.pp 
Addpp 
(pp 
namepp "
:pp" #
$strpp$ -
,pp- .
dbTypepp/ 5
:pp5 6
OracleMappingTypepp7 H
.ppH I
	RefCursorppI R
,ppR S
	directionppT ]
:pp] ^
ParameterDirectionpp_ q
.ppq r
Outputppr x
)ppx y
;ppy z"
otherIncomeFileDetailsqq &
=qq' (
(qq) *
awaitqq* /

connectionqq0 :
.qq: ;

QueryAsyncqq; E
<qqE F"
OtherIncomeFileDetailsqqF \
>qq\ ]
(qq] ^
DatabaseProceduresqq^ p
.qqp q+
P_EMP_OTHERINCOME_FILE_DETAILS	qqq �
,
qq� �
	parmeters
qq� �
,
qq� �
commandType
qq� �
:
qq� �
CommandType
qq� �
.
qq� �
StoredProcedure
qq� �
)
qq� �
)
qq� �
.
qq� �
ToList
qq� �
(
qq� �
)
qq� �
;
qq� �
}rr 
foreachss 
(ss 
varss 
itemss 
inss  "
otherIncomeFileDetailsss! 7
)ss7 8
{tt 


imagesPathuu (
=uu) *
newuu+ .

(uu< =
)uu= >
;uu> ?

imagesPathvv 
.vv 
Clearvv  
(vv  !
)vv! "
;vv" #
stringxx 
[xx 
]xx 
	imagePathxx "
=xx# $
itemxx% )
.xx) *
FilePathxx* 2
.xx2 3
Splitxx3 8
(xx8 9
$charxx9 =
)xx= >
;xx> ?

imagesPathyy 
.yy 
AppendFormatyy '
(yy' (
$stryy( O
,yyO P
ApplicationSettingsyyQ d
.yyd e
Currentyye l
.yyl m
ProfilePathyym x
,yyx y
	imagePath	yyz �
[
yy� �!
ApplicationSettings
yy� �
.
yy� �
Current
yy� �
.
yy� �
Environment
yy� �
==
yy� �
$str
yy� �
?
yy� �
$num
yy� �
:
yy� �
$num
yy� �
]
yy� �
)
yy� �
;
yy� �
itemzz 
.zz 
FilePathzz 
=zz 

imagesPathzz  *
.zz* +
ToStringzz+ 3
(zz3 4
)zz4 5
;zz5 6
}{{ 
return|| "
otherIncomeFileDetails|| )
;||) *
}}} 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� *
UploadHouseRentAllowanceFile
��  <
(
��< =$
HouseRentAllowanceFile
��= S$
houseRentAllowanceFile
��T j
)
��j k
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
recordsUpdated
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
bool
�� 
filsUploadStatus
�� %
=
��& '
await
��( -&
UploadHRAFileToDirectory
��. F
(
��F G$
houseRentAllowanceFile
��G ]
)
��] ^
;
��^ _
if
�� 
(
�� 
filsUploadStatus
�� $
)
��$ %
{
�� %
OracleDynamicParameters
�� +
param
��, 1
=
��2 3
new
��4 7
(
��7 8
)
��8 9
;
��9 :
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 1
,
��1 2$
houseRentAllowanceFile
��3 I
.
��I J

TdsHRASLNo
��J T
,
��T U
dbType
��V \
:
��\ ]
OracleMappingType
��^ o
.
��o p
Int32
��p u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0$
houseRentAllowanceFile
��1 G
.
��G H
FileName
��H P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 8
,
��8 9$
houseRentAllowanceFile
��: P
.
��P Q
FileName_Original
��Q b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0$
houseRentAllowanceFile
��1 G
.
��G H
FilePath
��H P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
recordsUpdated
�� "
=
��# $
await
��% *

connection
��+ 5
.
��5 6
ExecuteAsync
��6 B
(
��B C 
DatabaseProcedures
��C U
.
��U V&
SP_TDS_EMP_HRAFILEUPLOAD
��V n
,
��n o
param
��p u
,
��u v
commandType��w �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
recordsUpdated
�� &
*
��' (
-
��) *
$num
��* +
)
��+ ,
>
��- .
$num
��/ 0
;
��0 1
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
UploadChapter6File
��  2
(
��2 3!
Chapter6FileDetails
��3 F!
chapter6FileDetails
��G Z
)
��Z [
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
recordsUpdated
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
bool
�� 
filsUploadStatus
�� %
=
��& '
await
��( -+
UploadChapter6FileToDirectory
��. K
(
��K L!
chapter6FileDetails
��L _
)
��_ `
;
��` a
if
�� 
(
�� 
filsUploadStatus
�� $
)
��$ %
{
�� %
OracleDynamicParameters
�� +
param
��, 1
=
��2 3
new
��4 7
(
��7 8
)
��8 9
;
��9 :
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4!
chapter6FileDetails
��5 H
.
��H I
TdsEmpSHSLNo
��I U
,
��U V
dbType
��W ]
:
��] ^
OracleMappingType
��_ p
.
��p q
Int32
��q v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0!
chapter6FileDetails
��1 D
.
��D E
FileName
��E M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 8
,
��8 9!
chapter6FileDetails
��: M
.
��M N
FileName_Original
��N _
,
��_ `
dbType
��a g
:
��g h
OracleMappingType
��i z
.
��z {
Varchar2��{ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0!
chapter6FileDetails
��1 D
.
��D E
FilePath
��E M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
recordsUpdated
�� "
=
��# $
await
��% *

connection
��+ 5
.
��5 6
ExecuteAsync
��6 B
(
��B C 
DatabaseProcedures
��C U
.
��U V,
SP_TDS_EMP_CHAPTER6_FILEUPLOAD
��V t
,
��t u
param
��v {
,
��{ |
commandType��} �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
recordsUpdated
�� &
*
��' (
-
��) *
$num
��* +
)
��+ ,
>
��- .
$num
��/ 0
;
��0 1
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� #
UploadHouseIncomeFile
��  5
(
��5 6$
HouseIncomeFileDetails
��6 L$
houseIncomeFileDetails
��M c
)
��c d
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
recordsUpdated
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
bool
�� 
filsUploadStatus
�� %
=
��& '
await
��( -.
 UploadHouseIncomeFileToDirectory
��. N
(
��N O$
houseIncomeFileDetails
��O e
)
��e f
;
��f g
if
�� 
(
�� 
filsUploadStatus
�� $
)
��$ %
{
�� %
OracleDynamicParameters
�� +
param
��, 1
=
��2 3
new
��4 7
(
��7 8
)
��8 9
;
��9 :
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4$
houseIncomeFileDetails
��5 K
.
��K L
TdsEmpHISLNo
��L X
,
��X Y
dbType
��Z `
:
��` a
OracleMappingType
��b s
.
��s t
Int32
��t y
,
��y z
	direction��{ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0$
houseIncomeFileDetails
��1 G
.
��G H
FileName
��H P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 8
,
��8 9$
houseIncomeFileDetails
��: P
.
��P Q
FileName_Original
��Q b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0$
houseIncomeFileDetails
��1 G
.
��G H
FilePath
��H P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
recordsUpdated
�� "
=
��# $
await
��% *

connection
��+ 5
.
��5 6
ExecuteAsync
��6 B
(
��B C 
DatabaseProcedures
��C U
.
��U V+
SP_TDS_EMP_HINCOME_FILEUPLOAD
��V s
,
��s t
param
��u z
,
��z {
commandType��| �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
recordsUpdated
�� &
*
��' (
-
��) *
$num
��* +
)
��+ ,
>
��- .
$num
��/ 0
;
��0 1
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� #
UploadOtherIncomeFile
��  5
(
��5 6$
OtherIncomeFileDetails
��6 L$
otherIncomeFileDetails
��M c
)
��c d
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
recordsUpdated
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
bool
�� 
filsUploadStatus
�� %
=
��& '
await
��( -.
 UploadOtherIncomeFileToDirectory
��. N
(
��N O$
otherIncomeFileDetails
��O e
)
��e f
;
��f g
if
�� 
(
�� 
filsUploadStatus
�� $
)
��$ %
{
�� %
OracleDynamicParameters
�� +
param
��, 1
=
��2 3
new
��4 7
(
��7 8
)
��8 9
;
��9 :
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4$
otherIncomeFileDetails
��5 K
.
��K L
TdsEmpOISLNo
��L X
,
��X Y
dbType
��Z `
:
��` a
OracleMappingType
��b s
.
��s t
Int32
��t y
,
��y z
	direction��{ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0$
otherIncomeFileDetails
��1 G
.
��G H
FileName
��H P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 8
,
��8 9$
otherIncomeFileDetails
��: P
.
��P Q
FileName_Original
��Q b
,
��b c
dbType
��d j
:
��j k
OracleMappingType
��l }
.
��} ~
Varchar2��~ �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ /
,
��/ 0$
otherIncomeFileDetails
��1 G
.
��G H
FilePath
��H P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
recordsUpdated
�� "
=
��# $
await
��% *

connection
��+ 5
.
��5 6
ExecuteAsync
��6 B
(
��B C 
DatabaseProcedures
��C U
.
��U V+
SP_TDS_EMP_OINCOME_FILEUPLOAD
��V s
,
��s t
param
��u z
,
��z {
commandType��| �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
(
�� 
recordsUpdated
�� &
*
��' (
-
��) *
$num
��* +
)
��+ ,
>
��- .
$num
��/ 0
;
��0 1
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  &
UploadHRAFileToDirectory
��! 9
(
��9 :$
HouseRentAllowanceFile
��: P$
houseRentAllowanceFile
��Q g
)
��g h
{
�� 	
if
�� 
(
�� $
houseRentAllowanceFile
�� &
!=
��' )
null
��* .
)
��. /
{
�� 
string
�� 
filePath
�� 
=
��  !
Path
��" &
.
��& '
Combine
��' .
(
��. /!
ApplicationSettings
��/ B
.
��B C
Current
��C J
.
��J K%
HRAInvestmentProofsPath
��K b
)
��b c
;
��c d
if
�� 
(
�� 
!
�� 
	Directory
�� 
.
�� 
Exists
�� %
(
��% &
filePath
��& .
)
��. /
)
��/ 0
{
�� 
	Directory
�� 
.
�� 
CreateDirectory
�� -
(
��- .
filePath
��. 6
)
��6 7
;
��7 8
}
�� 
string
�� 
fileType
�� 
=
��  !
Path
��" &
.
��& '
GetExtension
��' 3
(
��3 4$
houseRentAllowanceFile
��4 J
.
��J K
FileToUpload
��K W
.
��W X
FileName
��X `
)
��` a
.
��a b
ToString
��b j
(
��j k
)
��k l
.
��l m
ToLower
��m t
(
��t u
)
��u v
;
��v w
string
�� 
fileName
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str
��0 ;
,
��; <$
houseRentAllowanceFile
��= S
.
��S T

TdsHRASLNo
��T ^
,
��^ _
DateTime
��` h
.
��h i
Now
��i l
.
��l m
Ticks
��m r
,
��r s
fileType
��t |
)
��| }
;
��} ~
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
filePath
��( 0
,
��0 1
fileName
��2 :
)
��: ;
;
��; <
if
�� 
(
�� 
!
�� 
File
�� 
.
�� 
Exists
��  
(
��  !
filePath
��! )
)
��) *
)
��* +
{
�� 
string
�� 
base64String
�� '
=
��( )$
houseRentAllowanceFile
��* @
.
��@ A
FileToUpload
��A M
.
��M N
FileAsBase64
��N Z
.
��Z [
	Substring
��[ d
(
��d e$
houseRentAllowanceFile
��e {
.
��{ |
FileToUpload��| �
.��� �
FileAsBase64��� �
.��� �
IndexOf��� �
(��� �
$char��� �
)��� �
+��� �
$num��� �
)��� �
;��� �
byte
�� 
[
�� 
]
�� 

imageBytes
�� %
=
��& '
Convert
��( /
.
��/ 0
FromBase64String
��0 @
(
��@ A
base64String
��A M
)
��M N
;
��N O
File
�� 
.
�� 

�� &
(
��& '
filePath
��' /
,
��/ 0

imageBytes
��1 ;
)
��; <
;
��< =$
houseRentAllowanceFile
�� *
.
��* +
FilePath
��+ 3
=
��4 5
filePath
��6 >
;
��> ?$
houseRentAllowanceFile
�� *
.
��* +
FileName
��+ 3
=
��4 5
fileName
��6 >
;
��> ?
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  +
UploadChapter6FileToDirectory
��! >
(
��> ?!
Chapter6FileDetails
��? R!
chapter6FileDetails
��S f
)
��f g
{
�� 	
if
�� 
(
�� !
chapter6FileDetails
�� #
!=
��$ &
null
��' +
)
��+ ,
{
�� 
string
�� 
filePath
�� 
=
��  !
Path
��" &
.
��& '
Combine
��' .
(
��. /!
ApplicationSettings
��/ B
.
��B C
Current
��C J
.
��J K*
Chapter6InvestmentProofsPath
��K g
)
��g h
;
��h i
if
�� 
(
�� 
!
�� 
	Directory
�� 
.
�� 
Exists
�� %
(
��% &
filePath
��& .
)
��. /
)
��/ 0
{
�� 
	Directory
�� 
.
�� 
CreateDirectory
�� -
(
��- .
filePath
��. 6
)
��6 7
;
��7 8
}
�� 
string
�� 
fileType
�� 
=
��  !
Path
��" &
.
��& '
GetExtension
��' 3
(
��3 4!
chapter6FileDetails
��4 G
.
��G H
FileToUpload
��H T
.
��T U
FileName
��U ]
)
��] ^
.
��^ _
ToString
��_ g
(
��g h
)
��h i
.
��i j
ToLower
��j q
(
��q r
)
��r s
;
��s t
string
�� 
fileName
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str
��0 ;
,
��; <!
chapter6FileDetails
��= P
.
��P Q
TdsEmpSHSLNo
��Q ]
,
��] ^
DateTime
��_ g
.
��g h
Now
��h k
.
��k l
Ticks
��l q
,
��q r
fileType
��s {
)
��{ |
;
��| }
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
filePath
��( 0
,
��0 1
fileName
��2 :
)
��: ;
;
��; <
if
�� 
(
�� 
!
�� 
File
�� 
.
�� 
Exists
��  
(
��  !
filePath
��! )
)
��) *
)
��* +
{
�� 
string
�� 
base64String
�� '
=
��( )!
chapter6FileDetails
��* =
.
��= >
FileToUpload
��> J
.
��J K
FileAsBase64
��K W
.
��W X
	Substring
��X a
(
��a b!
chapter6FileDetails
��b u
.
��u v
FileToUpload��v �
.��� �
FileAsBase64��� �
.��� �
IndexOf��� �
(��� �
$char��� �
)��� �
+��� �
$num��� �
)��� �
;��� �
byte
�� 
[
�� 
]
�� 

imageBytes
�� %
=
��& '
Convert
��( /
.
��/ 0
FromBase64String
��0 @
(
��@ A
base64String
��A M
)
��M N
;
��N O
File
�� 
.
�� 

�� &
(
��& '
filePath
��' /
,
��/ 0

imageBytes
��1 ;
)
��; <
;
��< =!
chapter6FileDetails
�� '
.
��' (
FilePath
��( 0
=
��1 2
filePath
��3 ;
;
��; <!
chapter6FileDetails
�� '
.
��' (
FileName
��( 0
=
��1 2
fileName
��3 ;
;
��; <
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  .
 UploadHouseIncomeFileToDirectory
��! A
(
��A B$
HouseIncomeFileDetails
��B X$
houseIncomeFileDetails
��Y o
)
��o p
{
�� 	
if
�� 
(
�� $
houseIncomeFileDetails
�� &
!=
��' )
null
��* .
)
��. /
{
�� 
string
�� 
filePath
�� 
=
��  !
Path
��" &
.
��& '
Combine
��' .
(
��. /!
ApplicationSettings
��/ B
.
��B C
Current
��C J
.
��J K.
 HouseIncomeInvestmentProofsfPath
��K k
)
��k l
;
��l m
if
�� 
(
�� 
!
�� 
	Directory
�� 
.
�� 
Exists
�� %
(
��% &
filePath
��& .
)
��. /
)
��/ 0
{
�� 
	Directory
�� 
.
�� 
CreateDirectory
�� -
(
��- .
filePath
��. 6
)
��6 7
;
��7 8
}
�� 
string
�� 
fileType
�� 
=
��  !
Path
��" &
.
��& '
GetExtension
��' 3
(
��3 4$
houseIncomeFileDetails
��4 J
.
��J K
FileToUpload
��K W
.
��W X
FileName
��X `
)
��` a
.
��a b
ToString
��b j
(
��j k
)
��k l
.
��l m
ToLower
��m t
(
��t u
)
��u v
;
��v w
string
�� 
fileName
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str
��0 ;
,
��; <$
houseIncomeFileDetails
��= S
.
��S T
TdsEmpHISLNo
��T `
,
��` a
DateTime
��b j
.
��j k
Now
��k n
.
��n o
Ticks
��o t
,
��t u
fileType
��v ~
)
��~ 
;�� �
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
filePath
��( 0
,
��0 1
fileName
��2 :
)
��: ;
;
��; <
if
�� 
(
�� 
!
�� 
File
�� 
.
�� 
Exists
��  
(
��  !
filePath
��! )
)
��) *
)
��* +
{
�� 
string
�� 
base64String
�� '
=
��( )$
houseIncomeFileDetails
��* @
.
��@ A
FileToUpload
��A M
.
��M N
FileAsBase64
��N Z
.
��Z [
	Substring
��[ d
(
��d e$
houseIncomeFileDetails
��e {
.
��{ |
FileToUpload��| �
.��� �
FileAsBase64��� �
.��� �
IndexOf��� �
(��� �
$char��� �
)��� �
+��� �
$num��� �
)��� �
;��� �
byte
�� 
[
�� 
]
�� 

imageBytes
�� %
=
��& '
Convert
��( /
.
��/ 0
FromBase64String
��0 @
(
��@ A
base64String
��A M
)
��M N
;
��N O
File
�� 
.
�� 

�� &
(
��& '
filePath
��' /
,
��/ 0

imageBytes
��1 ;
)
��; <
;
��< =$
houseIncomeFileDetails
�� *
.
��* +
FilePath
��+ 3
=
��4 5
filePath
��6 >
;
��> ?$
houseIncomeFileDetails
�� *
.
��* +
FileName
��+ 3
=
��4 5
fileName
��6 >
;
��> ?
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
Task
�� 
<
�� 
bool
�� 
>
�� .
 UploadOtherIncomeFileToDirectory
�� ;
(
��; <$
OtherIncomeFileDetails
��< R$
otherIncomeFileDetails
��S i
)
��i j
{
�� 	
if
�� 
(
�� $
otherIncomeFileDetails
�� &
!=
��' )
null
��* .
)
��. /
{
�� 
string
�� 
filePath
�� 
=
��  !
Path
��" &
.
��& '
Combine
��' .
(
��. /!
ApplicationSettings
��/ B
.
��B C
Current
��C J
.
��J K-
OtherIncomeInvestmentProofsPath
��K j
)
��j k
;
��k l
if
�� 
(
�� 
!
�� 
	Directory
�� 
.
�� 
Exists
�� %
(
��% &
filePath
��& .
)
��. /
)
��/ 0
{
�� 
	Directory
�� 
.
�� 
CreateDirectory
�� -
(
��- .
filePath
��. 6
)
��6 7
;
��7 8
}
�� 
string
�� 
fileType
�� 
=
��  !
Path
��" &
.
��& '
GetExtension
��' 3
(
��3 4$
otherIncomeFileDetails
��4 J
.
��J K
FileToUpload
��K W
.
��W X
FileName
��X `
)
��` a
.
��a b
ToString
��b j
(
��j k
)
��k l
.
��l m
ToLower
��m t
(
��t u
)
��u v
;
��v w
string
�� 
fileName
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str
��0 ;
,
��; <$
otherIncomeFileDetails
��= S
.
��S T
TdsEmpOISLNo
��T `
,
��` a
DateTime
��b j
.
��j k
Now
��k n
.
��n o
Ticks
��o t
,
��t u
fileType
��v ~
)
��~ 
;�� �
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
filePath
��( 0
,
��0 1
fileName
��2 :
)
��: ;
;
��; <
if
�� 
(
�� 
!
�� 
File
�� 
.
�� 
Exists
��  
(
��  !
filePath
��! )
)
��) *
)
��* +
{
�� 
string
�� 
base64String
�� '
=
��( )$
otherIncomeFileDetails
��* @
.
��@ A
FileToUpload
��A M
.
��M N
FileAsBase64
��N Z
.
��Z [
	Substring
��[ d
(
��d e$
otherIncomeFileDetails
��e {
.
��{ |
FileToUpload��| �
.��� �
FileAsBase64��� �
.��� �
IndexOf��� �
(��� �
$char��� �
)��� �
+��� �
$num��� �
)��� �
;��� �
byte
�� 
[
�� 
]
�� 

imageBytes
�� %
=
��& '
Convert
��( /
.
��/ 0
FromBase64String
��0 @
(
��@ A
base64String
��A M
)
��M N
;
��N O
File
�� 
.
�� 

�� &
(
��& '
filePath
��' /
,
��/ 0

imageBytes
��1 ;
)
��; <
;
��< =$
otherIncomeFileDetails
�� *
.
��* +
FilePath
��+ 3
=
��4 5
filePath
��6 >
;
��> ?$
otherIncomeFileDetails
�� *
.
��* +
FileName
��+ 3
=
��4 5
fileName
��6 >
;
��> ?
}
�� 
}
�� 
return
�� 
Task
�� 
.
�� 

FromResult
�� "
(
��" #
true
��# '
)
��' (
;
��( )
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� *
RemoveHouseRentAllowanceFile
��  <
(
��< =
int
��= @
	hraFileId
��A J
)
��J K
{
�� 	
bool
�� 
	isDeleted
�� 
=
�� 
false
�� "
;
��" #
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 5
,
��5 6
	hraFileId
��7 @
,
��@ A
dbType
��B H
:
��H I
OracleMappingType
��J [
.
��[ \
Int32
��\ a
,
��a b
	direction
��c l
:
��l m!
ParameterDirection��n �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R'
SP_TDS_EMP_DELETE_HRAFILE
��R k
,
��k l
	parmeters
��m v
,
��v w
commandType��x �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
	isDeleted
�� 
=
�� 
(
�� 
updatedRecords
�� '
*
��( )
-
��* +
$num
��+ ,
)
��, -
>
��. /
$num
��0 1
;
��1 2
return
�� 
	isDeleted
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
RemoveChapter6File
��  2
(
��2 3
int
��3 6
chapter6FileId
��7 E
)
��E F
{
�� 	
bool
�� 
	isDeleted
�� 
=
�� 
false
�� "
;
��" #
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 7
,
��7 8
chapter6FileId
��9 G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Int32
��c h
,
��h i
	direction
��j s
:
��s t!
ParameterDirection��u �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R,
SP_TDS_EMP_DELETE_CHAPTER6FILE
��R p
,
��p q
	parmeters
��r {
,
��{ |
commandType��} �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
	isDeleted
�� 
=
�� 
(
�� 
updatedRecords
�� '
*
��( )
-
��* +
$num
��+ ,
)
��, -
>
��. /
$num
��0 1
;
��1 2
return
�� 
	isDeleted
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� #
RemoveHouseIncomeFile
��  5
(
��5 6
int
��6 9
houseIncomeFileId
��: K
)
��K L
{
�� 	
bool
�� 
	isDeleted
�� 
=
�� 
false
�� "
;
��" #
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 7
,
��7 8
houseIncomeFileId
��9 J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R+
SP_TDS_EMP_DELETE_HINCOMEFILE
��R o
,
��o p
	parmeters
��q z
,
��z {
commandType��| �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
	isDeleted
�� 
=
�� 
(
�� 
updatedRecords
�� '
*
��( )
-
��* +
$num
��+ ,
)
��, -
>
��. /
$num
��0 1
;
��1 2
return
�� 
	isDeleted
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� #
RemoveOtherIncomeFile
��  5
(
��5 6
int
��6 9
otherIncomeFileId
��: K
)
��K L
{
�� 	
bool
�� 
	isDeleted
�� 
=
�� 
false
�� "
;
��" #
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 7
,
��7 8
otherIncomeFileId
��9 J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R+
SP_TDS_EMP_DELETE_OINCOMEFILE
��R o
,
��o p
	parmeters
��q z
,
��z {
commandType��| �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
	isDeleted
�� 
=
�� 
(
�� 
updatedRecords
�� '
*
��( )
-
��* +
$num
��+ ,
)
��, -
>
��. /
$num
��0 1
;
��1 2
return
�� 
	isDeleted
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
\F:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\Investment\InvestmentRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &

Investment& 0
{ 
public 

class  
InvestmentRepository %
:& '
BaseRepository( 6
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
private   
readonly   
IDistributedCache   *

redisCache  + 5
;  5 6
public!!  
InvestmentRepository!! #
(!!# $
IConfiguration!!$ 2

,!!@ A
ILoggerManager!!B P
logger!!Q W
)!!W X
:!!Y Z
base!![ _
(!!_ `

)!!m n
{"" 	
this## 
.## 

=##  

;##. /
this$$ 
.$$ 
logger$$ 
=$$ 
logger$$  
;$$  !
}%% 	
public(( 
async(( 
Task(( 
<(( !
InvestmentDeclaration(( /
>((/ 0$
GetInvestmentDeclaration((1 I
(((I J
int((J M
finSLNo((N U
,((U V
int((W Z
employeeSLNo(([ g
)((g h
{)) 	!
InvestmentDeclaration** !!
investmentDeclaration**" 7
=**8 9
new**: =!
InvestmentDeclaration**> S
(**S T
)**T U
;**U V
var++ 
employeeDetails++ 
=++  !
await++" '
GetTDSEmpDetails++( 8
(++8 9
finSLNo++9 @
,++@ A
employeeSLNo++B N
)++N O
;++O P
var,, !
tdsEmployeeHRADetails,, %
=,,& '
await,,( -
GetTDSEmpHRADetails,,. A
(,,A B
finSLNo,,B I
,,,I J
employeeSLNo,,K W
),,W X
;,,X Y
var-- (
tdsEmployeeSubHeadingDetails-- ,
=--- .
await--/ 4#
GetTDSEmpSubHeadDetails--5 L
(--L M
finSLNo--M T
,--T U
employeeSLNo--V b
)--b c
;--c d
var.. )
tdsEmployeeHouseIncomeDetails.. -
=... /
await..0 5$
GetEmpHouseIncomeDetails..6 N
(..N O
finSLNo..O V
,..V W
employeeSLNo..X d
)..d e
;..e f
var// &
employeeOtherIncomeDetails// *
=//+ ,
await//- 2$
GetEmpOtherIncomeDetails//3 K
(//K L
finSLNo//L S
,//S T
employeeSLNo//U a
)//a b
;//b c
if00 
(00 
employeeDetails00 
!=00  "
null00# '
)00' (
{11 
investmentDeclaration22 %
=22& '
new22( +!
InvestmentDeclaration22, A
{33 

=44" #
employeeDetails44$ 3
.443 4

TDSEmpSLNo444 >
,44> ?

EmployeeId55 
=55  
employeeDetails55! 0
.550 1
EmployeeSLNo551 =
,55= >
FinancialYearId66 #
=66$ %
employeeDetails66& 5
.665 6
FinSLNo666 =
,66= >
UniqueNumber77  
=77! "
employeeDetails77# 2
.772 3
UniqueNo773 ;
,77; <
InvestmentDetail88 $
=88% & 
MapInvestmentDetails88' ;
(88; <
employeeDetails88< K
)88K L
,88L M
Chapter6Detail99 "
=99# $
MapChapter6Details99% 7
(997 8(
tdsEmployeeSubHeadingDetails998 T
)99T U
,99U V
HouseRentAllowance:: &
=::' (!
MapHouseRentAllowence::) >
(::> ?
employeeDetails::? N
,::N O!
tdsEmployeeHRADetails::P e
)::e f
,::f g
HouseIncomeDetail;; %
=;;& '!
MapHouseIncomeDetails;;( =
(;;= >)
tdsEmployeeHouseIncomeDetails;;> [
);;[ \
,;;\ ]
OtherIncomeDetail<< %
=<<& '!
MapOtherIncomedetails<<( =
(<<= >&
employeeOtherIncomeDetails<<> X
)<<X Y
}== 
;== 
}>> 
return?? !
investmentDeclaration?? (
;??( )
}@@ 	
privateBB 
ListBB 
<BB 
OtherIncomeDetailBB &
>BB& '!
MapOtherIncomedetailsBB( =
(BB= >
ListBB> B
<BBB C%
EmployeeOtherIncomeDetailBBC \
>BB\ ]&
employeeOtherIncomeDetailsBB^ x
)BBx y
{CC 	
ListDD 
<DD 
OtherIncomeDetailDD "
>DD" #
OtherIncomeDetailsDD$ 6
=DD7 8
nullDD9 =
;DD= >
ifEE 
(EE &
employeeOtherIncomeDetailsEE *
!=EE+ -
nullEE. 2
)EE2 3
{FF 
OtherIncomeDetailsGG "
=GG# $
newGG% (
ListGG) -
<GG- .
OtherIncomeDetailGG. ?
>GG? @
(GG@ A
)GGA B
;GGB C
foreachHH 
(HH 
varHH 
itemHH !
inHH" $&
employeeOtherIncomeDetailsHH% ?
)HH? @
{II 
OtherIncomeDetailJJ %
houseIncomeJJ& 1
=JJ2 3
newJJ4 7
OtherIncomeDetailJJ8 I
{KK 
OtherIncomeDetailIdLL +
=LL, -
itemLL. 2
.LL2 3
TdsEmpOISlNoLL3 ?
,LL? @
AmountMM 
=MM  
itemMM! %
.MM% &
AmountMM& ,
,MM, -
DescriptionNN #
=NN$ %
itemNN& *
.NN* +
DescriptionNN+ 6
,NN6 7
OthIncomeHeadIdOO '
=OO( )
itemOO* .
.OO. /
OthIncomeHeadSlNoOO/ @
,OO@ A
	TdsAmountPP !
=PP" #
itemPP$ (
.PP( )
Tds_AmtPP) 0
,PP0 1
VerifiedAmountQQ &
=QQ' (
itemQQ) -
.QQ- .
VerifiedAmountQQ. <
,QQ< =
VerifiedRemarksRR '
=RR( )
itemRR* .
.RR. /
VerifiedRemarksRR/ >
,RR> ?
	FileCountSS !
=SS" #
itemSS$ (
.SS( )
	FileCountSS) 2
,SS2 3
VerifiedUserSlNoTT (
=TT) *
itemTT+ /
.TT/ 0
VerifiedUserSlNoTT0 @
}UU 
;UU 
OtherIncomeDetailsVV &
.VV& '
AddVV' *
(VV* +
houseIncomeVV+ 6
)VV6 7
;VV7 8
}WW 
}XX 
returnYY 
OtherIncomeDetailsYY %
;YY% &
}ZZ 	
privaterr 
Listrr 
<rr %
HousePropertyIncomeDetailrr .
>rr. /!
MapHouseIncomeDetailsrr0 E
(rrE F
ListrrF J
<rrJ K%
EmployeeHouseIncomeDetailrrK d
>rrd e'
employeeHouseIncomeDetails	rrf �
)
rr� �
{ss 	
Listtt 
<tt %
HousePropertyIncomeDetailtt *
>tt* +&
HousePropertyIncomeDetailstt, F
=ttG H
nullttI M
;ttM N
ifuu 
(uu &
employeeHouseIncomeDetailsuu *
!=uu+ -
nulluu. 2
)uu2 3
{vv 
HousePropertyIncomeDetailsww *
=ww+ ,
newww- 0
Listww1 5
<ww5 6%
HousePropertyIncomeDetailww6 O
>wwO P
(wwP Q
)wwQ R
;wwR S
foreachxx 
(xx 
varxx 
itemxx !
inxx" $&
employeeHouseIncomeDetailsxx% ?
)xx? @
{yy %
HousePropertyIncomeDetailzz -
houseIncomezz. 9
=zz: ;
newzz< ?%
HousePropertyIncomeDetailzz@ Y
{{{ 
HouseIncomeDetailId|| +
=||, -
item||. 2
.||2 3
TdsEmpHISlNo||3 ?
,||? @
Amount}} 
=}}  
item}}! %
.}}% &
Amount}}& ,
,}}, -
Description~~ #
=~~$ %
item~~& *
.~~* +
Description~~+ 6
,~~6 7
HouseIncomeHeadId )
=* +
item, 0
.0 1
HouseIncomeHeadSlNo1 D
,D E
	PanNumber
�� !
=
��" #
item
��$ (
.
��( )!
HouseIncomeHeadSlNo
��) <
==
��= ?
$num
��@ A
?
��B C
(
��D E
item
��E I
.
��I J

BANK_PANNO
��J T
.
��T U

��U b
(
��b c
)
��c d
?
��e f
$str
��g p
:
��q r
item
��s w
.
��w x

BANK_PANNO��x �
)��� �
:��� �
$str��� �
,��� �
VerifiedAmount
�� &
=
��' (
item
��) -
.
��- .
VerifiedAmount
��. <
,
��< =
VerifiedRemarks
�� '
=
��( )
item
��* .
.
��. /
VerifiedRemarks
��/ >
,
��> ?
	FileCount
�� !
=
��" #
item
��$ (
.
��( )
	FileCount
��) 2
,
��2 3
VerifiedUserSlNo
�� (
=
��) *
item
��+ /
.
��/ 0
VerifiedUserSlNo
��0 @
}
�� 
;
�� (
HousePropertyIncomeDetails
�� .
.
��. /
Add
��/ 2
(
��2 3
houseIncome
��3 >
)
��> ?
;
��? @
}
�� 
}
�� 
return
�� (
HousePropertyIncomeDetails
�� -
;
��- .
}
�� 	
private
��  
HouseRentAllowance
�� "#
MapHouseRentAllowence
��# 8
(
��8 9
EmployeeDetails
��9 H
employeeDetails
��I X
,
��X Y
List
��Z ^
<
��^ _#
TdsEmployeeHRADetails
��_ t
>
��t u$
tdsEmployeeHRADetails��v �
)��� �
{
�� 	 
HouseRentAllowance
��  
houseRentAllowance
�� 1
=
��2 3
new
��4 7 
HouseRentAllowance
��8 J
{
�� 

LocationId
�� 
=
�� 
employeeDetails
�� ,
.
��, -
HRALocationSLNo
��- <
,
��< =
IsRentHouse
�� 
=
�� 
employeeDetails
�� -
.
��- .
IsRentHouse
��. 9
,
��9 :

StreetName
�� 
=
�� 
employeeDetails
�� ,
.
��, -
Street_Vill
��- 8
,
��8 9
HouseNumber
�� 
=
�� 
employeeDetails
�� -
.
��- .
Hno
��. 1
,
��1 2
MandalId
�� 
=
�� 
employeeDetails
�� *
.
��* +

MandalSLNo
��+ 5
,
��5 6

DistrictId
�� 
=
�� 
employeeDetails
�� ,
.
��, -
DistrictSLNo
��- 9
,
��9 :
StateId
�� 
=
�� 
employeeDetails
�� )
.
��) *
	StateSLNo
��* 3
,
��3 4
PhoneNumber
�� 
=
�� 
employeeDetails
�� -
.
��- .
PhoneNo
��. 5
,
��5 6
Pincode
�� 
=
�� 
employeeDetails
�� )
.
��) *
Pin
��* -
}
�� 
;
��
foreach
�� 
(
�� 
var
�� 
item
�� 
in
��  #
tdsEmployeeHRADetails
��! 6
)
��6 7
{
�� 
RentPayment
�� 
rentPayment
�� '
=
��( )
new
��* -
RentPayment
��. 9
{
�� 

�� !
=
��" #
item
��$ (
.
��( )

TdsHraSLNo
��) 3
,
��3 4
	OwnerName
�� 
=
�� 
item
��  $
.
��$ %
	OwnerName
��% .
,
��. /
OwnerPan
�� 
=
�� 
item
�� #
.
��# $
OwnerPan
��$ ,
,
��, -

NoOfMonths
�� 
=
��  
item
��! %
.
��% &

NoOfMonths
��& 0
,
��0 1
Amount
�� 
=
�� 
item
�� !
.
��! "
Amount
��" (
,
��( )
VerifiedAmount
�� "
=
��# $
item
��% )
.
��) *
VerifiedAmount
��* 8
,
��8 9
VerifiedRemarks
�� #
=
��$ %
item
��& *
.
��* +
VerifiedRemarks
��+ :
,
��: ;
	FileCount
�� 
=
�� 
item
��  $
.
��$ %
	FileCount
��% .
}
�� 
;
��  
houseRentAllowance
�� "
.
��" # 
RentPaymentDetails
��# 5
.
��5 6
Add
��6 9
(
��9 :
rentPayment
��: E
)
��E F
;
��F G
}
�� 
return
��  
houseRentAllowance
�� %
;
��% &
}
�� 	
private
�� 
List
�� 
<
�� $
EmployeeChapter6Detail
�� +
>
��+ , 
MapChapter6Details
��- ?
(
��? @
List
��@ D
<
��D E'
TdsEmployeeSubHeadDetails
��E ^
>
��^ _*
tdsEmployeeSubHeadingDetails
��` |
)
��| }
{
�� 	
List
�� 
<
�� $
EmployeeChapter6Detail
�� '
>
��' (
chapter6Details
��) 8
=
��9 :
null
��; ?
;
��? @
if
�� 
(
�� *
tdsEmployeeSubHeadingDetails
�� ,
!=
��- /
null
��0 4
)
��4 5
{
�� 
chapter6Details
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
EmployeeChapter6Detail
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $*
tdsEmployeeSubHeadingDetails
��% A
)
��A B
{
�� 
var
�� 

itemDetail
�� "
=
��# $
new
��% ($
EmployeeChapter6Detail
��) ?
{
�� 
SectionName
�� #
=
��$ %
item
��& *
.
��* +
Section1
��+ 3
,
��3 4
Chapter6DetailId
�� (
=
��) *
item
��+ /
.
��/ 0
TdsEmpSHSLNo
��0 <
,
��< =
	SubHeadId
�� !
=
��" #
item
��$ (
.
��( )
SubHeadSLNo
��) 4
,
��4 5
Particulars
�� #
=
��$ %
item
��& *
.
��* +
PARTICULARS
��+ 6
,
��6 7
Amount
�� 
=
��  
item
��! %
.
��% &
Amount
��& ,
,
��, -
VerifiedAmount
�� &
=
��' (
item
��) -
.
��- .
VerifiedAmount
��. <
,
��< =
VerifiedRemarks
�� '
=
��( )
item
��* .
.
��. /
VerifiedRemarks
��/ >
,
��> ?
VerifiedUserSlNo
�� (
=
��) *
item
��+ /
.
��/ 0
VerifiedUserSlNo
��0 @
,
��@ A
	FileCount
�� !
=
��" #
item
��$ (
.
��( )
	FileCount
��) 2
}
�� 
;
�� 
chapter6Details
�� #
.
��# $
Add
��$ '
(
��' (

itemDetail
��( 2
)
��2 3
;
��3 4
}
�� 
}
�� 
return
�� 
chapter6Details
�� "
;
��" #
}
�� 	
private
�� 
InvestmentDetail
��  "
MapInvestmentDetails
��! 5
(
��5 6
EmployeeDetails
��6 E
employeeDetails
��F U
)
��U V
{
�� 	
InvestmentDetail
�� 
investmentDetail
�� -
=
��. /
new
��0 3
InvestmentDetail
��4 D
{
�� 
AssesseeTypeId
�� 
=
��  
employeeDetails
��! 0
.
��0 1
AssesseeTypeSLNo
��1 A
,
��A B
Is_NewRegime
�� 
=
�� 
employeeDetails
�� .
.
��. /
Is_NewRegime
��/ ;
,
��; <
Is_Senior_Citizen
�� !
=
��" #
employeeDetails
��$ 3
.
��3 4
Is_Senior_Citizen
��4 E
}
�� 
;
��
return
�� 
investmentDetail
�� #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� #
InvestmentDeclaration
�� /
>
��/ 0(
SaveInvestmentDeclarations
��1 K
(
��K L#
InvestmentDeclaration
��L a#
investmentDeclaration
��b w
)
��w x
{
�� 	
bool
�� 
allDataSaved
�� 
=
�� 
false
��  %
;
��% &#
InvestmentDeclaration
�� !(
savedInvestmentDeclaration
��" <
=
��= >
null
��? C
;
��C D
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
using
�� 
(
�� 
var
�� 
tran
�� 
=
��  !

connection
��" ,
.
��, -
BeginTransaction
��- =
(
��= >
)
��> ?
)
��? @
{
�� 
if
�� 
(
�� #
investmentDeclaration
�� -
!=
��. 0
null
��1 5
&&
��6 8#
investmentDeclaration
��9 N
.
��N O

IsVerified
��O Y
)
��Y Z
{
�� 
bool
��  
isRentPaymentSaved
�� /
=
��0 1
await
��2 7 
VerifyRentPayments
��8 J
(
��J K

connection
��K U
,
��U V#
investmentDeclaration
��W l
,
��l m$
investmentDeclaration��n �
.��� �"
HouseRentAllowance��� �
.��� �"
RentPaymentDetails��� �
)��� �
;��� �
bool
�� $
isChapter6DetailsSaved
�� 3
=
��4 5
await
��6 ;#
VerifyChapter6Details
��< Q
(
��Q R

connection
��R \
,
��\ ]#
investmentDeclaration
��^ s
,
��s t$
investmentDeclaration��u �
.��� �
Chapter6Detail��� �
)��� �
;��� �
bool
�� '
isHouseIncomeDetailsSaved
�� 6
=
��7 8
await
��9 >&
VerifyHouseIncomeDetails
��? W
(
��W X

connection
��X b
,
��b c#
investmentDeclaration
��d y
,
��y z$
investmentDeclaration��{ �
.��� �!
HouseIncomeDetail��� �
)��� �
;��� �
bool
�� '
isOtherIncomeDetailsSaved
�� 6
=
��7 8
await
��9 >&
VerifyOtherIncomeDetails
��? W
(
��W X

connection
��X b
,
��b c#
investmentDeclaration
��d y
,
��y z$
investmentDeclaration��{ �
.��� �!
OtherIncomeDetail��� �
)��� �
;��� �
allDataSaved
�� $
=
��% & 
isRentPaymentSaved
��' 9
&&
��: <$
isChapter6DetailsSaved
��= S
&&
��T V'
isHouseIncomeDetailsSaved
��W p
&&
��q s(
isOtherIncomeDetailsSaved��t �
;��� �
if
�� 
(
�� 
allDataSaved
�� (
)
��( )
{
�� 
tran
��  
.
��  !
Commit
��! '
(
��' (
)
��( )
;
��) *
await
�� !%
VerifyProofsSendMessage
��" 9
(
��9 :#
investmentDeclaration
��: O
.
��O P

EmployeeId
��P Z
)
��Z [
;
��[ \
}
�� 
}
�� 
else
�� 
{
�� 
bool
�� &
isInvestmentDetailsSaved
�� 5
=
��6 7
await
��8 =#
SaveInvestmentDetails
��> S
(
��S T

connection
��T ^
,
��^ _#
investmentDeclaration
��` u
,
��u v$
investmentDeclaration��w �
.��� � 
InvestmentDetail��� �
,��� �%
investmentDeclaration��� �
.��� �"
HouseRentAllowance��� �
)��� �
;��� �
bool
��  
isRentPaymentSaved
�� /
=
��0 1
await
��2 7
SaveRentPayments
��8 H
(
��H I

connection
��I S
,
��S T#
investmentDeclaration
��U j
,
��j k$
investmentDeclaration��l �
.��� �"
HouseRentAllowance��� �
.��� �"
RentPaymentDetails��� �
)��� �
;��� �
bool
�� $
isChapter6DetailsSaved
�� 3
=
��4 5
await
��6 ;!
SaveChapter6Details
��< O
(
��O P

connection
��P Z
,
��Z [#
investmentDeclaration
��\ q
.
��q r
Chapter6Detail��r �
)��� �
;��� �
bool
�� '
isHouseIncomeDetailsSaved
�� 6
=
��7 8
await
��9 >$
SaveHouseIncomeDetails
��? U
(
��U V

connection
��V `
,
��` a#
investmentDeclaration
��b w
.
��w x 
HouseIncomeDetail��x �
)��� �
;��� �
bool
�� '
isOtherIncomeDetailsSaved
�� 6
=
��7 8
await
��9 >$
SaveOtherIncomeDetails
��? U
(
��U V

connection
��V `
,
��` a#
investmentDeclaration
��b w
.
��w x 
OtherIncomeDetail��x �
)��� �
;��� �
allDataSaved
�� $
=
��% &&
isInvestmentDetailsSaved
��' ?
&&
��@ B 
isRentPaymentSaved
��C U
&&
��V X$
isChapter6DetailsSaved
��Y o
&&
��p r(
isHouseIncomeDetailsSaved��s �
&&��� �)
isOtherIncomeDetailsSaved��� �
;��� �
if
�� 
(
�� 
allDataSaved
�� (
)
��( )
{
�� 
tran
��  
.
��  !
Commit
��! '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 
}
�� 
}
�� 
if
�� 
(
�� 
allDataSaved
�� 
)
�� 
{
�� 
savedInvestmentDeclaration
�� *
=
��+ ,
await
��- 2&
GetInvestmentDeclaration
��3 K
(
��K L#
investmentDeclaration
��L a
.
��a b
FinancialYearId
��b q
.
��q r
ToInt32OrDefault��r �
(��� �
)��� �
,��� �%
investmentDeclaration��� �
.��� �

EmployeeId��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
}
�� 
return
�� (
savedInvestmentDeclaration
�� -
;
��- .
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  $
SaveOtherIncomeDetails
��! 7
(
��7 8

��8 E

connection
��F P
,
��P Q
List
��R V
<
��V W
OtherIncomeDetail
��W h
>
��h i 
otherIncomeDetails
��j |
)
��| }
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; < 
otherIncomeDetails
�� 
.
�� 
ForEach
�� &
(
��& '
otherIncome
��' 2
=>
��3 5
{
�� 
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  4
,
��4 5
otherIncome
��6 A
.
��A B
OthIncomeHeadId
��B Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Int32
��m r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  )
,
��) *
otherIncome
��+ 6
.
��6 7
Amount
��7 =
.
��= >
ToInt64OrDefault
��> N
(
��N O
)
��O P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Int32
��l q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  ,
,
��, -
otherIncome
��. 9
.
��9 :
	TdsAmount
��: C
.
��C D
ToInt64OrDefault
��D T
(
��T U
)
��U V
,
��V W
dbType
��X ^
:
��^ _
OracleMappingType
��` q
.
��q r
Int32
��r w
,
��w x
	direction��y �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
otherIncome
��1 <
.
��< =!
OtherIncomeDetailId
��= P
.
��P Q
ToInt64OrDefault
��Q a
(
��a b
)
��b c
,
��c d
dbType
��e k
:
��k l
OracleMappingType
��m ~
.
��~ 
Int32�� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
param
�� #
)
��# $
;
��$ %
}
�� 
)
��
;
�� 
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= [
,
��[ \
	parmeters
��] f
,
��f g
commandType
��h s
:
��s t
CommandType��u �
.��� �
StoredProcedure��� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  &
VerifyOtherIncomeDetails
��! 9
(
��9 :

��: G

connection
��H R
,
��R S#
InvestmentDeclaration
��T i#
investmentDeclaration
��j 
,�� �
List��� �
<��� �!
OtherIncomeDetail��� �
>��� �"
otherIncomeDetails��� �
)��� �
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; < 
otherIncomeDetails
�� 
.
�� 
ForEach
�� &
(
��& '
otherIncome
��' 2
=>
��3 5
{
�� 
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  1
,
��1 2
otherIncome
��3 >
.
��> ?
VerifiedAmount
��? M
.
��M N
ToInt64OrDefault
��N ^
(
��^ _
)
��_ `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Int32��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  2
,
��2 3
otherIncome
��4 ?
.
��? @
VerifiedRemarks
��@ O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Varchar2
��k s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  3
,
��3 4#
investmentDeclaration
��5 J
.
��J K&
VerificationEmployeeSlno
��K c
.
��c d
ToInt64OrDefault
��d t
(
��t u
)
��u v
,
��v w
dbType
��x ~
:
��~ !
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
otherIncome
��1 <
.
��< =!
OtherIncomeDetailId
��= P
.
��P Q
ToInt64OrDefault
��Q a
(
��a b
)
��b c
,
��c d
dbType
��e k
:
��k l
OracleMappingType
��m ~
.
��~ 
Int32�� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
param
�� #
)
��# $
;
��$ %
}
�� 
)
��
;
�� 
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= Y
,
��Y Z
	parmeters
��[ d
,
��d e
commandType
��f q
:
��q r
CommandType
��s ~
.
��~ 
StoredProcedure�� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  $
SaveHouseIncomeDetails
��! 7
(
��7 8

��8 E

connection
��F P
,
��P Q
List
��R V
<
��V W'
HousePropertyIncomeDetail
��W p
>
��p q!
houseIncomeDetails��r �
)��� �
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; < 
houseIncomeDetails
�� 
.
�� 
ForEach
�� &
(
��& '
houseIncome
��' 2
=>
��3 5
{
�� 
ConvertToUpparCase
�� "
.
��" #
StringToUpparCase
��# 4
(
��4 5
houseIncome
��5 @
)
��@ A
;
��A B%
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  )
,
��) *
houseIncome
��+ 6
.
��6 7
Amount
��7 =
.
��= >
ToInt64OrDefault
��> N
(
��N O
)
��O P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Int32
��l q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  6
,
��6 7
houseIncome
��8 C
.
��C D
HouseIncomeHeadId
��D U
,
��U V
dbType
��W ]
:
��] ^
OracleMappingType
��_ p
.
��p q
Int32
��q v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  -
,
��- .
houseIncome
��/ :
.
��: ;
	PanNumber
��; D
,
��D E
dbType
��F L
:
��L M
OracleMappingType
��N _
.
��_ `
Varchar2
��` h
,
��h i
	direction
��j s
:
��s t!
ParameterDirection��u �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
houseIncome
��1 <
.
��< =!
HouseIncomeDetailId
��= P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Int32
��l q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
param
�� #
)
��# $
;
��$ %
}
�� 
)
��
;
�� 
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= [
,
��[ \
	parmeters
��] f
,
��f g
commandType
��h s
:
��s t
CommandType��u �
.��� �
StoredProcedure��� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  &
VerifyHouseIncomeDetails
��! 9
(
��9 :

��: G

connection
��H R
,
��R S#
InvestmentDeclaration
��T i#
investmentDeclaration
��j 
,�� �
List��� �
<��� �)
HousePropertyIncomeDetail��� �
>��� �"
houseIncomeDetails��� �
)��� �
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; < 
houseIncomeDetails
�� 
.
�� 
ForEach
�� &
(
��& '
houseIncome
��' 2
=>
��3 5
{
�� 
ConvertToUpparCase
�� "
.
��" #
StringToUpparCase
��# 4
(
��4 5
houseIncome
��5 @
)
��@ A
;
��A B%
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  1
,
��1 2
houseIncome
��3 >
.
��> ?
VerifiedAmount
��? M
.
��M N
ToInt64OrDefault
��N ^
(
��^ _
)
��_ `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Int32��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  2
,
��2 3
houseIncome
��4 ?
.
��? @
VerifiedRemarks
��@ O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Varchar2
��k s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  3
,
��3 4#
investmentDeclaration
��5 J
.
��J K&
VerificationEmployeeSlno
��K c
.
��c d
ToInt64OrDefault
��d t
(
��t u
)
��u v
,
��v w
dbType
��x ~
:
��~ !
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
houseIncome
��1 <
.
��< =!
HouseIncomeDetailId
��= P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Int32
��l q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
param
�� #
)
��# $
;
��$ %
}
�� 
)
��
;
�� 
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= Y
,
��Y Z
	parmeters
��[ d
,
��d e
commandType
��f q
:
��q r
CommandType
��s ~
.
��~ 
StoredProcedure�� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  !
SaveChapter6Details
��! 4
(
��4 5

��5 B

connection
��C M
,
��M N
List
��O S
<
��S T$
EmployeeChapter6Detail
��T j
>
��j k
chapter6Details
��l {
)
��{ |
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; <
chapter6Details
�� 
.
�� 
ForEach
�� #
(
��# $
sections
��$ ,
=>
��- /
{
�� 
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  )
,
��) *
sections
��+ 3
.
��3 4
Amount
��4 :
.
��: ;
ToInt64OrDefault
��; K
(
��K L
)
��L M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Int64
��i n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  .
,
��. /
sections
��0 8
.
��8 9
	SubHeadId
��9 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int64
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
sections
��1 9
.
��9 :
Chapter6DetailId
��: J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int64
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
param
�� #
)
��# $
;
��$ %
}
�� 
)
��
;
�� 
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= [
,
��[ \
	parmeters
��] f
,
��f g
commandType
��h s
:
��s t
CommandType��u �
.��� �
StoredProcedure��� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  #
VerifyChapter6Details
��! 6
(
��6 7

��7 D

connection
��E O
,
��O P#
InvestmentDeclaration
��Q f#
investmentDeclaration
��g |
,
��| }
List��~ �
<��� �&
EmployeeChapter6Detail��� �
>��� �
chapter6Details��� �
)��� �
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; <
chapter6Details
�� 
.
�� 
ForEach
�� #
(
��# $
sections
��$ ,
=>
��- /
{
�� 
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  1
,
��1 2
sections
��3 ;
.
��; <
VerifiedAmount
��< J
.
��J K
ToInt64OrDefault
��K [
(
��[ \
)
��\ ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Int32
��y ~
,
��~ 
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  2
,
��2 3
sections
��4 <
.
��< =
VerifiedRemarks
��= L
,
��L M
dbType
��N T
:
��T U
OracleMappingType
��V g
.
��g h
Varchar2
��h p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  3
,
��3 4#
investmentDeclaration
��5 J
.
��J K&
VerificationEmployeeSlno
��K c
.
��c d
ToInt64OrDefault
��d t
(
��t u
)
��u v
,
��v w
dbType
��x ~
:
��~ !
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
sections
��1 9
.
��9 :
Chapter6DetailId
��: J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int64
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
param
�� #
)
��# $
;
��$ %
}
�� 
)
��
;
�� 
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= [
,
��[ \
	parmeters
��] f
,
��f g
commandType
��h s
:
��s t
CommandType��u �
.��� �
StoredProcedure��� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
SaveRentPayments
��! 1
(
��1 2

��2 ?

connection
��@ J
,
��J K#
InvestmentDeclaration
��L a#
investmentDeclaration
��b w
,
��w x
List
��y }
<
��} ~
RentPayment��~ �
>��� �"
rentPaymentDetails��� �
)��� �
{
�� 	
List
�� 
<
�� %
OracleDynamicParameters
�� (
>
��( )
	parmeters
��* 3
=
��4 5
new
��6 9
(
��9 :
)
��: ;
;
��; < 
rentPaymentDetails
�� 
.
�� 
ForEach
�� &
(
��& '
hr
��' )
=>
��* ,
{
�� 
ConvertToUpparCase
�� "
.
��" #
StringToUpparCase
��# 4
(
��4 5
hr
��5 7
)
��7 8
;
��8 9%
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  ,
,
��, -
hr
��. 0
.
��0 1
	OwnerName
��1 :
,
��: ;
dbType
��< B
:
��B C
OracleMappingType
��D U
.
��U V
Varchar2
��V ^
,
��^ _
	direction
��` i
:
��i j 
ParameterDirection
��k }
.
��} ~
Input��~ �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  +
,
��+ ,
hr
��- /
.
��/ 0
OwnerPan
��0 8
,
��8 9
dbType
��: @
:
��@ A
OracleMappingType
��B S
.
��S T
Varchar2
��T \
,
��\ ]
	direction
��^ g
:
��g h 
ParameterDirection
��i {
.
��{ |
Input��| �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  )
,
��) *
hr
��+ -
.
��- .
Amount
��. 4
.
��4 5
ToInt64OrDefault
��5 E
(
��E F
)
��F G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Int32
��c h
,
��h i
	direction
��j s
:
��s t!
ParameterDirection��u �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  -
,
��- .
hr
��/ 1
.
��1 2

NoOfMonths
��2 <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Int32
��X ]
,
��] ^
	direction
��_ h
:
��h i 
ParameterDirection
��j |
.
��| }
Input��} �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  +
,
��+ ,#
investmentDeclaration
��- B
.
��B C

EmployeeId
��C M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  -
,
��- .
hr
��/ 1
.
��1 2

��2 ?
,
��? @
dbType
��A G
:
��G H
OracleMappingType
��I Z
.
��Z [
Int32
��[ `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
param
�� #
)
��# $
;
��$ %
}
�� 
)
��
;
�� 
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= Z
,
��Z [
	parmeters
��\ e
,
��e f
commandType
��g r
:
��r s
CommandType
��t 
.�� �
StoredProcedure��� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��   
VerifyRentPayments
��! 3
(
��3 4

��4 A

connection
��B L
,
��L M#
InvestmentDeclaration
��N c#
investmentDeclaration
��d y
,
��y z
List
��{ 
<�� �
RentPayment��� �
>��� �"
rentPaymentDetails��� �
)��� �
{
�� 	
try
�� 
{
�� 
List
�� 
<
�� %
OracleDynamicParameters
�� ,
>
��, -
	parmeters
��. 7
=
��8 9
new
��: =
(
��= >
)
��> ?
;
��? @ 
rentPaymentDetails
�� "
.
��" #
ForEach
��# *
(
��* +
hr
��+ -
=>
��. 0
{
��  
ConvertToUpparCase
�� &
.
��& '
StringToUpparCase
��' 8
(
��8 9
hr
��9 ;
)
��; <
;
��< =%
OracleDynamicParameters
�� +
param
��, 1
=
��2 3
new
��4 7
(
��7 8
)
��8 9
;
��9 :
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 5
,
��5 6
hr
��7 9
.
��9 :
VerifiedAmount
��: H
.
��H I
ToInt64OrDefault
��I Y
(
��Y Z
)
��Z [
,
��[ \
dbType
��] c
:
��c d
OracleMappingType
��e v
.
��v w
Int32
��w |
,
��| }
	direction��~ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 6
,
��6 7
hr
��8 :
.
��: ;
VerifiedRemarks
��; J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Varchar2
��f n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 7
,
��7 8#
investmentDeclaration
��9 N
.
��N O&
VerificationEmployeeSlno
��O g
.
��g h
ToInt64OrDefault
��h x
(
��x y
)
��y z
,
��z {
dbType��| �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 1
,
��1 2
hr
��3 5
.
��5 6

��6 C
,
��C D
dbType
��E K
:
��K L
OracleMappingType
��M ^
.
��^ _
Int32
��_ d
,
��d e
	direction
��f o
:
��o p!
ParameterDirection��q �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
param
��" '
)
��' (
;
��( )
}
�� 
)
�� 
;
�� 
int
�� 
savedRecords
��  
=
��! "
await
��# (

connection
��) 3
.
��3 4
ExecuteAsync
��4 @
(
��@ A
$str
��A _
,
��_ `
	parmeters
��a j
,
��j k
commandType
��l w
:
��w x
CommandType��y �
.��� �
StoredProcedure��� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
�� $
*
��% &
-
��' (
$num
��( )
)
��) *
>
��+ ,
$num
��- .
;
��. /
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  #
SaveInvestmentDetails
��! 6
(
��6 7

��7 D

connection
��E O
,
��O P#
InvestmentDeclaration
��Q f#
investmentDeclaration
��g |
,
��| }
InvestmentDetail��~ � 
investmentDetail��� �
,��� �"
HouseRentAllowance��� �"
houseRentAllowance��� �
)��� �
{
�� 	 
ConvertToUpparCase
�� 
.
�� 
StringToUpparCase
�� 0
(
��0 1 
houseRentAllowance
��1 C
)
��C D
;
��D E%
OracleDynamicParameters
�� #
	parmeters
��$ -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  3
,
��3 4
investmentDetail
��5 E
.
��E F
AssesseeTypeId
��F T
,
��T U
dbType
��V \
:
��\ ]
OracleMappingType
��^ o
.
��o p
Int32
��p u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
investmentDetail
��1 A
.
��A B
Is_NewRegime
��B N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  4
,
��4 5
investmentDetail
��6 F
.
��F G
Is_Senior_Citizen
��G X
,
��X Y
dbType
��Z `
:
��` a
OracleMappingType
��b s
.
��s t
Int32
��t y
,
��y z
	direction��{ �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  .
,
��. / 
houseRentAllowance
��0 B
.
��B C
IsRentHouse
��C N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  2
,
��2 3 
houseRentAllowance
��4 F
.
��F G

LocationId
��G Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Int32
��m r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  &
,
��& ' 
houseRentAllowance
��( :
.
��: ;
HouseNumber
��; F
,
��F G
dbType
��H N
:
��N O
OracleMappingType
��P a
.
��a b
Varchar2
��b j
,
��j k
	direction
��l u
:
��u v!
ParameterDirection��w �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  .
,
��. / 
houseRentAllowance
��0 B
.
��B C

StreetName
��C M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  -
,
��- . 
houseRentAllowance
��/ A
.
��A B
MandalId
��B J
==
��K M
$num
��N O
?
��P Q
null
��R V
:
��W X 
houseRentAllowance
��Y k
.
��k l
MandalId
��l t
.
��t u'
ToNullableInt32OrDefault��u �
(��� �
)��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0 
houseRentAllowance
��1 C
.
��C D

DistrictId
��D N
==
��O Q
$num
��R S
?
��T U
null
��V Z
:
��[ \ 
houseRentAllowance
��] o
.
��o p

DistrictId
��p z
.
��z {'
ToNullableInt32OrDefault��{ �
(��� �
)��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  ,
,
��, - 
houseRentAllowance
��. @
.
��@ A
StateId
��A H
==
��I K
$num
��L M
?
��N O
null
��P T
:
��U V 
houseRentAllowance
��W i
.
��i j
StateId
��j q
.
��q r'
ToNullableInt32OrDefault��r �
(��� �
)��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  &
,
��& ' 
houseRentAllowance
��( :
.
��: ;
Pincode
��; B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Varchar2
��^ f
,
��f g
	direction
��h q
:
��q r!
ParameterDirection��s �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  *
,
��* + 
houseRentAllowance
��, >
.
��> ?
PhoneNumber
��? J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Varchar2
��f n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  -
,
��- .#
investmentDeclaration
��/ D
.
��D E

��E R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Int32
��n s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
int
�� 
savedRecords
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
ExecuteAsync
��0 <
(
��< =
$str
��= Z
,
��Z [
	parmeters
��\ e
,
��e f
commandType
��g r
:
��r s
CommandType
��t 
.�� �
StoredProcedure��� �
)��� �
;��� �
return
�� 
(
�� 
savedRecords
��  
*
��! "
-
��# $
$num
��$ %
)
��% &
>
��' (
$num
��) *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� !
TaxDeductionDetails
�� -
>
��- .(
GetIncomeTaxPaymentDetails
��/ I
(
��I J
int
��J M
employeeSLNo
��N Z
)
��Z [
{
�� 	!
TaxDeductionDetails
�� !
taxDeductionDetails
��  3
=
��4 5
null
��6 :
;
��: ;
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
string
�� 
query
�� 
=
�� 
$"
�� !
$str
��! A
{
��A B
employeeSLNo
��B N
}
��N O
$str
��O Z
"
��Z [
;
��[ \
string
�� 
response
�� 
=
��  !
await
��" '

connection
��( 2
.
��2 3 
ExecuteScalarAsync
��3 E
<
��E F
dynamic
��F M
>
��M N
(
��N O
query
��O T
)
��T U
;
��U V
if
�� 
(
�� 
response
�� 
!=
�� 
null
��  $
&&
��% '
response
��( 0
!=
��1 3
String
��4 :
.
��: ;
Empty
��; @
)
��@ A
{
�� 
string
�� 
[
�� 
]
�� 

�� *
=
��+ ,
response
��- 5
.
��5 6
Split
��6 ;
(
��; <
new
��< ?
Char
��@ D
[
��D E
]
��E F
{
��G H
$char
��I L
}
��M N
)
��N O
;
��O P
if
�� 
(
�� 

�� %
.
��% &
Length
��& ,
>
��- .
$num
��/ 0
)
��0 1
{
�� !
taxDeductionDetails
�� +
=
��, -
new
��. 1!
TaxDeductionDetails
��2 E
(
��E F
)
��F G
;
��G H!
taxDeductionDetails
�� +
.
��+ ,

��, 9
=
��: ;

��< I
[
��I J
$num
��J K
]
��K L
;
��L M!
taxDeductionDetails
�� +
.
��+ , 
TdsDeductedTillNow
��, >
=
��? @

��A N
[
��N O
$num
��O P
]
��P Q
;
��Q R!
taxDeductionDetails
�� +
.
��+ ,

BalanceTds
��, 6
=
��7 8

��9 F
[
��F G
$num
��G H
]
��H I
;
��I J!
taxDeductionDetails
�� +
.
��+ , 
BalanceTdsPerMonth
��, >
=
��? @

��A N
[
��N O
$num
��O P
]
��P Q
;
��Q R
}
�� 
}
�� 
}
�� 
return
�� !
taxDeductionDetails
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� #
AssessmentTypeDetails
�� 4
>
��4 5
>
��5 6$
GetAssesseeTypeDetails
��7 M
(
��M N
)
��N O
{
�� 	
List
�� 
<
�� #
AssessmentTypeDetails
�� &
>
��& '#
assessmentTypeDetails
��( =
=
��> ?
null
��@ D
;
��D E
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z#
assessmentTypeDetails
�� %
=
��& '
(
��( )
await
��) .

connection
��/ 9
.
��9 :

QueryAsync
��: D
<
��D E#
AssessmentTypeDetails
��E Z
>
��Z [
(
��[ \ 
DatabaseProcedures
��\ n
.
��n o$
ASSESSEE_TYPE_DETAILS��o �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� #
assessmentTypeDetails
�� (
;
��( )
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
HRALocations
�� +
>
��+ ,
>
��, -
GetHRALocations
��. =
(
��= >
)
��> ?
{
�� 	
List
�� 
<
�� 
HRALocations
�� 
>
�� 
hRALocations
�� +
=
��, -
null
��. 2
;
��2 3
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
hRALocations
�� 
=
�� 
(
��  
await
��  %

connection
��& 0
.
��0 1

QueryAsync
��1 ;
<
��; <
HRALocations
��< H
>
��H I
(
��I J 
DatabaseProcedures
��J \
.
��\ ]"
HRA_LOCATION_DETAILS
��] q
,
��q r
	parmeters
��s |
,
��| }
commandType��~ �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
hRALocations
�� 
;
��  
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmployeeDetails
�� *
>
��* +
GetTDSEmpDetails
��, <
(
��< =
int
��= @
finSLNo
��A H
,
��H I
int
��J M
employeeSLNo
��N Z
)
��Z [
{
�� 	
EmployeeDetails
��  
tdsEmployeeDetails
�� .
=
��/ 0
null
��1 5
;
��5 6
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSLNo
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
finSLNo
��0 7
,
��7 8
dbType
��9 ?
:
��? @
OracleMappingType
��A R
.
��R S
Int32
��S X
,
��X Y
	direction
��Z c
:
��c d 
ParameterDirection
��e w
.
��w x
Input
��x }
)
��} ~
;
��~ 
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z 
tdsEmployeeDetails
�� "
=
��# $
(
��% &
await
��& +

connection
��, 6
.
��6 7

QueryAsync
��7 A
<
��A B
EmployeeDetails
��B Q
>
��Q R
(
��R S 
DatabaseProcedures
��S e
.
��e f
TDS_EMP_DETAILS
��f u
,
��u v
	parmeters��w �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
}
�� 
return
��  
tdsEmployeeDetails
�� %
;
��% &
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  #
TdsEmployeeHRADetails
��  5
>
��5 6
>
��6 7!
GetTDSEmpHRADetails
��8 K
(
��K L
int
��L O
finSLNo
��P W
,
��W X
int
��Y \
employeeSLNo
��] i
)
��i j
{
�� 	
List
�� 
<
�� #
TdsEmployeeHRADetails
�� &
>
��& '#
tdsEmployeeHRADetails
��( =
=
��> ?
null
��@ D
;
��D E
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSLNo
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
finSLNo
��0 7
,
��7 8
dbType
��9 ?
:
��? @
OracleMappingType
��A R
.
��R S
Int32
��S X
,
��X Y
	direction
��Z c
:
��c d 
ParameterDirection
��e w
.
��w x
Input
��x }
)
��} ~
;
��~ 
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z#
tdsEmployeeHRADetails
�� %
=
��& '
(
��( )
await
��) .

connection
��/ 9
.
��9 :

QueryAsync
��: D
<
��D E#
TdsEmployeeHRADetails
��E Z
>
��Z [
(
��[ \ 
DatabaseProcedures
��\ n
.
��n o"
TDS_EMP_HRA_DETAILS��o �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� #
tdsEmployeeHRADetails
�� (
;
��( )
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
TdsSectionDetails
��  1
>
��1 2
>
��2 3"
GetTdsSectionDetails
��4 H
(
��H I
)
��I J
{
�� 	
List
�� 
<
�� 
TdsSectionDetails
�� "
>
��" #
tdsSectionDetails
��$ 5
=
��6 7
null
��8 <
;
��< =
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
tdsSectionDetails
�� !
=
��" #
(
��$ %
await
��% *

connection
��+ 5
.
��5 6

QueryAsync
��6 @
<
��@ A
TdsSectionDetails
��A R
>
��R S
(
��S T 
DatabaseProcedures
��T f
.
��f g!
TDS_SECTION_DETAILS
��g z
,
��z {
	parmeters��| �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
OrderBy��� �
(��� �
item��� �
=>��� �
item��� �
.��� �
SectionSlNo��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
tdsSectionDetails
�� $
;
��$ %
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  "
TdsSubHeadingDetails
��  4
>
��4 5
>
��5 6"
GetTDSSubHeadDetails
��7 K
(
��K L
int
��L O
finSLNo
��P W
)
��W X
{
�� 	
List
�� 
<
�� "
TdsSubHeadingDetails
�� %
>
��% &"
tdsSubHeadingDetails
��' ;
=
��< =
null
��> B
;
��B C
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
finSLNo
��0 7
,
��7 8
dbType
��9 ?
:
��? @
OracleMappingType
��A R
.
��R S
Int32
��S X
,
��X Y
	direction
��Z c
:
��c d 
ParameterDirection
��e w
.
��w x
Input
��x }
)
��} ~
;
��~ 
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z"
tdsSubHeadingDetails
�� $
=
��% &
(
��' (
await
��( -

connection
��. 8
.
��8 9

QueryAsync
��9 C
<
��C D"
TdsSubHeadingDetails
��D X
>
��X Y
(
��Y Z 
DatabaseProcedures
��Z l
.
��l m"
TDS_SUBHEAD_DETAILS��m �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� "
tdsSubHeadingDetails
�� '
;
��' (
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  '
TdsEmployeeSubHeadDetails
��  9
>
��9 :
>
��: ;%
GetTDSEmpSubHeadDetails
��< S
(
��S T
int
��T W
finSLNo
��X _
,
��_ `
int
��a d
employeeSLNo
��e q
)
��q r
{
�� 	
List
�� 
<
�� '
TdsEmployeeSubHeadDetails
�� *
>
��* +#
tdsEmployeeHRADetails
��, A
=
��B C
null
��D H
;
��H I
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSLNo
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
finSLNo
��0 7
,
��7 8
dbType
��9 ?
:
��? @
OracleMappingType
��A R
.
��R S
Int32
��S X
,
��X Y
	direction
��Z c
:
��c d 
ParameterDirection
��e w
.
��w x
Input
��x }
)
��} ~
;
��~ 
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z#
tdsEmployeeHRADetails
�� %
=
��& '
(
��( )
await
��) .

connection
��/ 9
.
��9 :

QueryAsync
��: D
<
��D E'
TdsEmployeeSubHeadDetails
��E ^
>
��^ _
(
��_ ` 
DatabaseProcedures
��` r
.
��r s&
EMP_TDS_SUBHEAD_DETAILS��s �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� #
tdsEmployeeHRADetails
�� (
;
��( )
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��   
HouseIncomeDetails
��  2
>
��2 3
>
��3 4#
GetHouseIncomeDetails
��5 J
(
��J K
)
��K L
{
�� 	
List
�� 
<
��  
HouseIncomeDetails
�� #
>
��# $ 
houseIncomeDetails
��% 7
=
��8 9
null
��: >
;
��> ?
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z 
houseIncomeDetails
�� "
=
��# $
(
��% &
await
��& +

connection
��, 6
.
��6 7

QueryAsync
��7 A
<
��A B 
HouseIncomeDetails
��B T
>
��T U
(
��U V 
DatabaseProcedures
��V h
.
��h i"
HOUSE_INCOME_DETAILS
��i }
,
��} ~
	parmeters�� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
��  
houseIncomeDetails
�� %
;
��% &
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  '
EmployeeHouseIncomeDetail
��  9
>
��9 :
>
��: ;&
GetEmpHouseIncomeDetails
��< T
(
��T U
int
��U X
finSLNo
��Y `
,
��` a
int
��b e
employeeSLNo
��f r
)
��r s
{
�� 	
List
�� 
<
�� '
EmployeeHouseIncomeDetail
�� *
>
��* ++
tdsEmployeeHouseIncomeDetails
��, I
=
��J K
null
��L P
;
��P Q
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSLNo
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
finSLNo
��0 7
,
��7 8
dbType
��9 ?
:
��? @
OracleMappingType
��A R
.
��R S
Int32
��S X
,
��X Y
	direction
��Z c
:
��c d 
ParameterDirection
��e w
.
��w x
Input
��x }
)
��} ~
;
��~ 
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z+
tdsEmployeeHouseIncomeDetails
�� -
=
��. /
(
��0 1
await
��1 6

connection
��7 A
.
��A B

QueryAsync
��B L
<
��L M'
EmployeeHouseIncomeDetail
��M f
>
��f g
(
��g h 
DatabaseProcedures
��h z
.
��z {'
EMP_HOUSE_INCOME_DETAILS��{ �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� +
tdsEmployeeHouseIncomeDetails
�� 0
;
��0 1
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��   
OtherIncomeDetails
��  2
>
��2 3
>
��3 4#
GetOtherIncomeDetails
��5 J
(
��J K
)
��K L
{
�� 	
List
�� 
<
��  
OtherIncomeDetails
�� #
>
��# $ 
otherIncomeDetails
��% 7
=
��8 9
null
��: >
;
��> ?
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z 
otherIncomeDetails
�� "
=
��# $
(
��% &
await
��& +

connection
��, 6
.
��6 7

QueryAsync
��7 A
<
��A B 
OtherIncomeDetails
��B T
>
��T U
(
��U V 
DatabaseProcedures
��V h
.
��h i"
OTHER_INCOME_DETAILS
��i }
,
��} ~
	parmeters�� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
��  
otherIncomeDetails
�� %
;
��% &
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  '
EmployeeOtherIncomeDetail
��  9
>
��9 :
>
��: ;&
GetEmpOtherIncomeDetails
��< T
(
��T U
int
��U X
finSLNo
��Y `
,
��` a
int
��b e
employeeSLNo
��f r
)
��r s
{
�� 	
List
�� 
<
�� '
EmployeeOtherIncomeDetail
�� *
>
��* +#
empOtherIncomeDetails
��, A
=
��B C
null
��D H
;
��H I
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
	parmeters
��( 1
=
��2 3
new
��4 7%
OracleDynamicParameters
��8 O
(
��O P
)
��P Q
;
��Q R
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
employeeSLNo
��5 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
finSLNo
��0 7
,
��7 8
dbType
��9 ?
:
��? @
OracleMappingType
��A R
.
��R S
Int32
��S X
,
��X Y
	direction
��Z c
:
��c d 
ParameterDirection
��e w
.
��w x
Input
��x }
)
��} ~
;
��~ 
	parmeters
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ -
,
��- .
dbType
��/ 5
:
��5 6
OracleMappingType
��7 H
.
��H I
	RefCursor
��I R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z#
empOtherIncomeDetails
�� %
=
��& '
(
��( )
await
��) .

connection
��/ 9
.
��9 :

QueryAsync
��: D
<
��D E'
EmployeeOtherIncomeDetail
��E ^
>
��^ _
(
��_ ` 
DatabaseProcedures
��` r
.
��r s'
EMP_OTHER_INCOME_DETAILS��s �
,��� �
	parmeters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� #
empOtherIncomeDetails
�� (
;
��( )
}
�� 	
public
�� 
async
�� 
Task
�� %
VerifyProofsSendMessage
�� 1
(
��1 2
long
��2 6
EmployeeLSNO
��7 C
)
��C D
{
�� 	
string
�� 

��  
=
��! "
string
��# )
.
��) *
Empty
��* /
;
��/ 0
string
�� 
VerifyProofsValue
�� $
=
��% &
string
��' -
.
��- .
Empty
��. 3
;
��3 4
string
�� !
VerifyProofsMessage
�� &
=
��' (!
ApplicationSettings
��) <
.
��< =
Current
��= D
.
��D E!
VerifyProofsMessage
��E X
;
��X Y
string
�� 

templateid
�� 
=
�� !
ApplicationSettings
��  3
.
��3 4
Current
��4 ;
.
��; <"
VerifyProofsTemplate
��< P
;
��P Q
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� %
(
��% &!
VerifyProofsMessage
��& 9
)
��9 :
)
��: ;
{
�� 
using
�� 
(
�� 

�� $

connection
��% /
=
��0 1
await
��2 7
CreateConnection
��8 H
(
��H I
DbSchema
��I Q
.
��Q R
PORTAL
��R X
)
��X Y
)
��Y Z
{
�� 
EmployeeProfile
�� #
employeeProfile
��$ 3
=
��4 5
await
��6 ;'
GetEmployeeMinimalProfile
��< U
(
��U V
EmployeeLSNO
��V b
.
��b c
ToInt32
��c j
(
��j k
)
��k l
)
��l m
;
��m n
this
�� 
.
�� 
logger
�� 
.
��  
LogInfo
��  '
(
��' (!
VerifyProofsMessage
��( ;
)
��; <
;
��< =
this
�� 
.
�� 
logger
�� 
.
��  
LogInfo
��  '
(
��' (

templateid
��( 2
)
��2 3
;
��3 4
this
�� 
.
�� 
logger
�� 
.
��  
LogInfo
��  '
(
��' (
employeeProfile
��( 7
.
��7 8
EmployeeName
��8 D
)
��D E
;
��E F
if
�� 
(
�� 
employeeProfile
�� '
.
��' (
EmployeeName
��( 4
.
��4 5
Length
��5 ;
>
��< =
$num
��> @
)
��@ A
{
�� 

�� %
=
��& '
string
��( .
.
��. /
Format
��/ 5
(
��5 6!
VerifyProofsMessage
��6 I
,
��I J
Environment
��K V
.
��V W
NewLine
��W ^
,
��^ _
employeeProfile
��` o
.
��o p
EmployeeName
��p |
.
��| }
	Substring��} �
(��� �
$num��� �
,��� �
$num��� �
)��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 

�� %
=
��& '
string
��( .
.
��. /
Format
��/ 5
(
��5 6!
VerifyProofsMessage
��6 I
,
��I J
Environment
��K V
.
��V W
NewLine
��W ^
,
��^ _
employeeProfile
��` o
.
��o p
EmployeeName
��p |
)
��| }
;
��} ~
}
�� %
OracleDynamicParameters
�� +
	parmeters
��, 5
=
��6 7
new
��8 ;%
OracleDynamicParameters
��< S
(
��S T
)
��T U
;
��U V
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 7
,
��7 8
employeeProfile
��9 H
.
��H I
Mobile
��I O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Int64
��k p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 2
,
��2 3

��4 A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Varchar2
��] e
,
��e f
	direction
��g p
:
��p q!
ParameterDirection��r �
.��� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( <
,
��< =
$num
��> ?
,
��? @
dbType
��A G
:
��G H
OracleMappingType
��I Z
.
��Z [
Int32
��[ `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Input��� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 9
,
��9 :
$num
��; <
,
��< =
dbType
��> D
:
��D E
OracleMappingType
��F W
.
��W X
Int32
��X ]
,
��] ^
	direction
��_ h
:
��h i 
ParameterDirection
��j |
.
��| }
Input��} �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 1
,
��1 2
$str
��3 ;
,
��; <
dbType
��= C
:
��C D
OracleMappingType
��E V
.
��V W
Varchar2
��W _
,
��_ `
	direction
��a j
:
��j k 
ParameterDirection
��l ~
.
��~ 
Input�� �
)��� �
;��� �
	parmeters
�� 
.
�� 
Add
�� !
(
��! "
name
��" &
:
��& '
$str
��( 9
,
��9 :

templateid
��; E
,
��E F
dbType
��G M
:
��M N
OracleMappingType
��O `
.
��` a
Varchar2
��a i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �
await
�� 

connection
�� $
.
��$ %
ExecuteAsync
��% 1
(
��1 2 
DatabaseProcedures
��2 D
.
��D E
SEND_SMS
��E M
,
��M N
	parmeters
��O X
,
��X Y
commandType
��Z e
:
��e f
CommandType
��g r
.
��r s
StoredProcedure��s �
)��� �
;��� �
}
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmployeeProfile
�� *
>
��* +'
GetEmployeeMinimalProfile
��, E
(
��E F
int
��F I
employeeSlno
��J V
)
��V W
{
�� 	
EmployeeProfile
�� 
employeeProfile
�� +
=
��, -
null
��. 2
;
��2 3
using
�� 
(
�� +
EmployeeInformationRepository
�� 0
profileRepository
��1 B
=
��C D
new
��E H+
EmployeeInformationRepository
��I f
(
��f g

��g t
,
��t u
this
��v z
.
��z {

redisCache��{ �
)��� �
)��� �
{
�� 
employeeProfile
�� 
=
��  !
await
��" '
profileRepository
��( 9
.
��9 :'
GetEmployeeMinimumProfile
��: S
(
��S T
employeeSlno
��T `
)
��` a
;
��a b
}
�� 
return
�� 
employeeProfile
�� "
;
��" #
}
�� 	
}
�� 
}�� ��
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\LeaveManagementReports\ReportsRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &"
LeaveManagementReports& <
{ 
public 

class 
ReportsRepository "
:# $
BaseRepository% 3
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
ILoggerManager '
logger( .
;. /
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public 
ReportsRepository  
(  !
IConfiguration! /

,= >
ILoggerManager? M
loggerN T
)T U
:V W
baseX \
(\ ]

)j k
{ 	
this 
. 

=  

;. /
this 
. 
logger 
= 
logger  
;  !
} 	
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
>" #
employeeLeaves$ 2
=3 4
null5 9
;9 :
List   
<   
LeaveWorkFlowReport   $
>  $ %
leaveWorkFlowReport  & 9
=  : ;
null  < @
;  @ A
List!! 
<!! "
LeaveFileUploadReports!! '
>!!' ("
leaveFileUploadReports!!) ?
=!!@ A
null!!B F
;!!F G
using## 
(## 
var## 

connection## !
=##" #
await##$ )
base##* .
.##. /
CreateConnection##/ ?
(##? @
DbSchema##@ H
.##H I
PORTAL##I O
)##O P
)##P Q
{$$ 
OracleDynamicParameters%% '

parameters%%( 2
=%%3 4
new%%5 8#
OracleDynamicParameters%%9 P
(%%P Q
)%%Q R
;%%R S

parameters&& 
.&& 
Add&& 
(&& 
name&& #
:&&# $
$str&&% 3
,&&3 4
getLeaveReportReq&&5 F
.&&F G
pBranchSlno&&G R
,&&R S
dbType&&T Z
:&&Z [
OracleMappingType&&\ m
.&&m n
Varchar2&&n v
,&&v w
	direction	&&x �
:
&&� � 
ParameterDirection
&&� �
.
&&� �
Input
&&� �
)
&&� �
;
&&� �

parameters'' 
.'' 
Add'' 
('' 
name'' #
:''# $
$str''% 1
,''1 2
getLeaveReportReq''3 D
.''D E
fromDate''E M
,''M N
dbType''O U
:''U V
OracleMappingType''W h
.''h i
Date''i m
,''m n
	direction''o x
:''x y
ParameterDirection	''z �
.
''� �
Input
''� �
)
''� �
;
''� �

parameters(( 
.(( 
Add(( 
((( 
name(( #
:((# $
$str((% /
,((/ 0
getLeaveReportReq((1 B
.((B C
toDate((C I
,((I J
dbType((K Q
:((Q R
OracleMappingType((S d
.((d e
Date((e i
,((i j
	direction((k t
:((t u
ParameterDirection	((v �
.
((� �
Input
((� �
)
((� �
;
((� �

parameters)) 
.)) 
Add)) 
()) 
name)) #
:))# $
$str))% 4
,))4 5
getLeaveReportReq))6 G
.))G H
statusId))H P
,))P Q
dbType))R X
:))X Y
OracleMappingType))Z k
.))k l
Int32))l q
,))q r
	direction))s |
:))| }
ParameterDirection	))~ �
.
))� �
Input
))� �
)
))� �
;
))� �

parameters** 
.** 
Add** 
(** 
name** #
:**# $
$str**% 2
,**2 3
dbType**4 :
:**: ;
OracleMappingType**< M
.**M N
	RefCursor**N W
,**W X
	direction**Y b
:**b c
ParameterDirection**d v
.**v w
Output**w }
)**} ~
;**~ 

parameters++ 
.++ 
Add++ 
(++ 
name++ #
:++# $
$str++% 9
,++9 :
dbType++; A
:++A B
OracleMappingType++C T
.++T U
	RefCursor++U ^
,++^ _
	direction++` i
:++i j
ParameterDirection++k }
.++} ~
Output	++~ �
)
++� �
;
++� �

parameters,, 
.,, 
Add,, 
(,, 
name,, #
:,,# $
$str,,% 7
,,,7 8
dbType,,9 ?
:,,? @
OracleMappingType,,A R
.,,R S
	RefCursor,,S \
,,,\ ]
	direction,,^ g
:,,g h
ParameterDirection,,i {
.,,{ |
Output	,,| �
)
,,� �
;
,,� �
var-- 
results-- 
=-- 
await-- #

connection--$ .
.--. /
QueryMultipleAsync--/ A
(--A B
DatabaseProcedures--B T
.--T U
SP_LEAVE_REPORT--U d
,--d e

parameters--f p
,--p q
commandType--r }
:--} ~
CommandType	-- �
.
--� �
StoredProcedure
--� �
)
--� �
;
--� �
employeeLeaves.. 
=..  
results..! (
...( )
Read..) -
<..- .
LeaveDetailReport... ?
>..? @
(..@ A
)..A B
...B C
ToList..C I
(..I J
)..J K
;..K L
leaveWorkFlowReport// #
=//$ %
results//& -
.//- .
Read//. 2
<//2 3
LeaveWorkFlowReport//3 F
>//F G
(//G H
)//H I
.//I J
ToList//J P
(//P Q
)//Q R
;//R S"
leaveFileUploadReports00 &
=00' (
results00) 0
.000 1
Read001 5
<005 6"
LeaveFileUploadReports006 L
>00L M
(00M N
)00N O
.00O P
ToList00P V
(00V W
)00W X
;00X Y
foreach11 
(11 
var11 
item11 "
in11# %
employeeLeaves11& 4
)114 5
{22 
item33 
.33 
leaveWorkFlowReport33 ,
=33- .
leaveWorkFlowReport33/ B
.33B C
Where33C H
(33H I
x33I J
=>33K M
(33N O
x33O P
.33P Q
RLeaveId33Q Y
==33Z \
item33] a
.33a b
LeaveId33b i
)33i j
)33j k
.33k l
ToList33l r
(33r s
)33s t
;33t u
item44 
.44 "
leaveFileUploadReports44 /
=440 1"
leaveFileUploadReports442 H
.44H I
Where44I N
(44N O
x44O P
=>44Q S
(44T U
x44U V
.44V W
FLeaveId44W _
==44` b
item44c g
.44g h
LeaveId44h o
)44o p
)44p q
.44q r
ToList44r x
(44x y
)44y z
;44z {
}55 
}66 
return77 
employeeLeaves77 !
;77! "
}88 	
public99 
async99 
Task99 
<99 
List99 
<99 
LeaveDetailReport99 0
>990 1
>991 2
GetAllLeaves993 ?
(99? @
GetLeaveReportReq99@ Q
getLeaveReportReq99R c
)99c d
{:: 	
List;; 
<;; 
LeaveDetailReport;; "
>;;" #
employeeLeaves;;$ 2
=;;3 4
null;;5 9
;;;9 :
List== 
<== "
LeaveFileUploadReports== '
>==' ("
leaveFileUploadReports==) ?
===@ A
null==B F
;==F G
using?? 
(?? 
var?? 

connection?? !
=??" #
await??$ )
base??* .
.??. /
CreateConnection??/ ?
(??? @
DbSchema??@ H
.??H I
PORTAL??I O
)??O P
)??P Q
{@@ 
OracleDynamicParametersAA '

parametersAA( 2
=AA3 4
newAA5 8#
OracleDynamicParametersAA9 P
(AAP Q
)AAQ R
;AAR S

parametersBB 
.BB 
AddBB 
(BB 
nameBB #
:BB# $
$strBB% 3
,BB3 4
getLeaveReportReqBB5 F
.BBF G
pBranchSlnoBBG R
,BBR S
dbTypeBBT Z
:BBZ [
OracleMappingTypeBB\ m
.BBm n
Varchar2BBn v
,BBv w
	direction	BBx �
:
BB� � 
ParameterDirection
BB� �
.
BB� �
Input
BB� �
)
BB� �
;
BB� �

parametersCC 
.CC 
AddCC 
(CC 
nameCC #
:CC# $
$strCC% 1
,CC1 2
getLeaveReportReqCC3 D
.CCD E
fromDateCCE M
,CCM N
dbTypeCCO U
:CCU V
OracleMappingTypeCCW h
.CCh i
DateCCi m
,CCm n
	directionCCo x
:CCx y
ParameterDirection	CCz �
.
CC� �
Input
CC� �
)
CC� �
;
CC� �

parametersDD 
.DD 
AddDD 
(DD 
nameDD #
:DD# $
$strDD% /
,DD/ 0
getLeaveReportReqDD1 B
.DDB C
toDateDDC I
,DDI J
dbTypeDDK Q
:DDQ R
OracleMappingTypeDDS d
.DDd e
DateDDe i
,DDi j
	directionDDk t
:DDt u
ParameterDirection	DDv �
.
DD� �
Input
DD� �
)
DD� �
;
DD� �

parametersEE 
.EE 
AddEE 
(EE 
nameEE #
:EE# $
$strEE% 4
,EE4 5
nullEE6 :
,EE: ;
dbTypeEE< B
:EEB C
OracleMappingTypeEED U
.EEU V
Int32EEV [
,EE[ \
	directionEE] f
:EEf g
ParameterDirectionEEh z
.EEz {
Input	EE{ �
)
EE� �
;
EE� �

parametersFF 
.FF 
AddFF 
(FF 
nameFF #
:FF# $
$strFF% 2
,FF2 3
dbTypeFF4 :
:FF: ;
OracleMappingTypeFF< M
.FFM N
	RefCursorFFN W
,FFW X
	directionFFY b
:FFb c
ParameterDirectionFFd v
.FFv w
OutputFFw }
)FF} ~
;FF~ 

parametersGG 
.GG 
AddGG 
(GG 
nameGG #
:GG# $
$strGG% 9
,GG9 :
dbTypeGG; A
:GGA B
OracleMappingTypeGGC T
.GGT U
	RefCursorGGU ^
,GG^ _
	directionGG` i
:GGi j
ParameterDirectionGGk }
.GG} ~
Output	GG~ �
)
GG� �
;
GG� �

parametersHH 
.HH 
AddHH 
(HH 
nameHH #
:HH# $
$strHH% 7
,HH7 8
dbTypeHH9 ?
:HH? @
OracleMappingTypeHHA R
.HHR S
	RefCursorHHS \
,HH\ ]
	directionHH^ g
:HHg h
ParameterDirectionHHi {
.HH{ |
Output	HH| �
)
HH� �
;
HH� �
varII 
resultsII 
=II 
awaitII #

connectionII$ .
.II. /
QueryMultipleAsyncII/ A
(IIA B
DatabaseProceduresIIB T
.IIT U#
SP_GET_ALL_LEAVE_REPORTIIU l
,IIl m

parametersIIn x
,IIx y
commandType	IIz �
:
II� �
CommandType
II� �
.
II� �
StoredProcedure
II� �
)
II� �
;
II� �
employeeLeavesJJ 
=JJ  
resultsJJ! (
.JJ( )
ReadJJ) -
<JJ- .
LeaveDetailReportJJ. ?
>JJ? @
(JJ@ A
)JJA B
.JJB C
ToListJJC I
(JJI J
)JJJ K
;JJK L
}RR 
returnSS 
employeeLeavesSS !
;SS! "
}TT 	
publicVV 
asyncVV 
TaskVV 
<VV 
ListVV 
<VV 
AutoApprovalReportVV 1
>VV1 2
>VV2 3!
GetAutoApprovalReportVV4 I
(VVI J
GetLeaveReportReqVVJ [
getLeaveReportReqVV\ m
)VVm n
{WW 	
ListXX 
<XX 
AutoApprovalReportXX #
>XX# $
employeeLeavesXX% 3
=XX4 5
nullXX6 :
;XX: ;
usingZZ 
(ZZ 
varZZ 

connectionZZ !
=ZZ" #
awaitZZ$ )
baseZZ* .
.ZZ. /
CreateConnectionZZ/ ?
(ZZ? @
DbSchemaZZ@ H
.ZZH I
PORTALZZI O
)ZZO P
)ZZP Q
{[[ 
OracleDynamicParameters\\ '

parameters\\( 2
=\\3 4
new\\5 8#
OracleDynamicParameters\\9 P
(\\P Q
)\\Q R
;\\R S

parameters]] 
.]] 
Add]] 
(]] 
name]] #
:]]# $
$str]]% 3
,]]3 4
getLeaveReportReq]]5 F
.]]F G
pBranchSlno]]G R
,]]R S
dbType]]T Z
:]]Z [
OracleMappingType]]\ m
.]]m n
Varchar2]]n v
,]]v w
	direction	]]x �
:
]]� � 
ParameterDirection
]]� �
.
]]� �
Input
]]� �
)
]]� �
;
]]� �

parameters^^ 
.^^ 
Add^^ 
(^^ 
name^^ #
:^^# $
$str^^% 1
,^^1 2
getLeaveReportReq^^3 D
.^^D E
fromDate^^E M
,^^M N
dbType^^O U
:^^U V
OracleMappingType^^W h
.^^h i
Date^^i m
,^^m n
	direction^^o x
:^^x y
ParameterDirection	^^z �
.
^^� �
Input
^^� �
)
^^� �
;
^^� �

parameters__ 
.__ 
Add__ 
(__ 
name__ #
:__# $
$str__% /
,__/ 0
getLeaveReportReq__1 B
.__B C
toDate__C I
,__I J
dbType__K Q
:__Q R
OracleMappingType__S d
.__d e
Date__e i
,__i j
	direction__k t
:__t u
ParameterDirection	__v �
.
__� �
Input
__� �
)
__� �
;
__� �

parameters`` 
.`` 
Add`` 
(`` 
name`` #
:``# $
$str``% 4
,``4 5
getLeaveReportReq``6 G
.``G H
statusId``H P
,``P Q
dbType``R X
:``X Y
OracleMappingType``Z k
.``k l
Int32``l q
,``q r
	direction``s |
:``| }
ParameterDirection	``~ �
.
``� �
Input
``� �
)
``� �
;
``� �

parametersaa 
.aa 
Addaa 
(aa 
nameaa #
:aa# $
$straa% :
,aa: ;
dbTypeaa< B
:aaB C
OracleMappingTypeaaD U
.aaU V
	RefCursoraaV _
,aa_ `
	directionaaa j
:aaj k
ParameterDirectionaal ~
.aa~ 
Output	aa �
)
aa� �
;
aa� �
varbb 
resultsbb 
=bb 
awaitbb #

connectionbb$ .
.bb. /
QueryMultipleAsyncbb/ A
(bbA B
DatabaseProceduresbbB T
.bbT U)
SP_AUTO_APPROVAL_LEAVE_REPORTbbU r
,bbr s

parametersbbt ~
,bb~ 
commandType
bb� �
:
bb� �
CommandType
bb� �
.
bb� �
StoredProcedure
bb� �
)
bb� �
;
bb� �
employeeLeavescc 
=cc  
resultscc! (
.cc( )
Readcc) -
<cc- .
AutoApprovalReportcc. @
>cc@ A
(ccA B
)ccB C
.ccC D
ToListccD J
(ccJ K
)ccK L
;ccL M
}dd 
returnee 
employeeLeavesee !
;ee! "
}ff 	
publichh 
asynchh 
Taskhh 
<hh 
Listhh 
<hh 
LeaveDetailReporthh 0
>hh0 1
>hh1 2 
GetLeaveTransactionshh3 G
(hhG H"
GetLeaveTransactionReqhhH ^"
getLeaveTransactionReqhh_ u
)hhu v
{ii 	
Listjj 
<jj 
LeaveDetailReportjj "
>jj" #
employeeLeavesjj$ 2
=jj3 4
nulljj5 9
;jj9 :
Listkk 
<kk 
LeaveWorkFlowReportkk $
>kk$ %
leaveWorkFlowReportkk& 9
=kk: ;
nullkk< @
;kk@ A
Listll 
<ll "
LeaveFileUploadReportsll '
>ll' ("
leaveFileUploadReportsll) ?
=ll@ A
nullllB F
;llF G
usingnn 
(nn 
varnn 

connectionnn !
=nn" #
awaitnn$ )
basenn* .
.nn. /
CreateConnectionnn/ ?
(nn? @
DbSchemann@ H
.nnH I
PORTALnnI O
)nnO P
)nnP Q
{oo 
OracleDynamicParameterspp '

parameterspp( 2
=pp3 4
newpp5 8#
OracleDynamicParameterspp9 P
(ppP Q
)ppQ R
;ppR S

parametersqq 
.qq 
Addqq 
(qq 
nameqq #
:qq# $
$strqq% 4
,qq4 5"
getLeaveTransactionReqqq6 L
.qqL M
employeeSLNoqqM Y
,qqY Z
dbTypeqq[ a
:qqa b
OracleMappingTypeqqc t
.qqt u
Varchar2qqu }
,qq} ~
	direction	qq �
:
qq� � 
ParameterDirection
qq� �
.
qq� �
Input
qq� �
)
qq� �
;
qq� �

parametersrr 
.rr 
Addrr 
(rr 
namerr #
:rr# $
$strrr% =
,rr= >"
getLeaveTransactionReqrr? U
.rrU V 
reportingManagerSlnorrV j
,rrj k
dbTyperrl r
:rrr s
OracleMappingType	rrt �
.
rr� �
Varchar2
rr� �
,
rr� �
	direction
rr� �
:
rr� � 
ParameterDirection
rr� �
.
rr� �
Input
rr� �
)
rr� �
;
rr� �

parametersss 
.ss 
Addss 
(ss 
namess #
:ss# $
$strss% 4
,ss4 5"
getLeaveTransactionReqss6 L
.ssL M
statusIdssM U
,ssU V
dbTypessW ]
:ss] ^
OracleMappingTypess_ p
.ssp q
Int32ssq v
,ssv w
	direction	ssx �
:
ss� � 
ParameterDirection
ss� �
.
ss� �
Input
ss� �
)
ss� �
;
ss� �

parameterstt 
.tt 
Addtt 
(tt 
namett #
:tt# $
$strtt% 2
,tt2 3
dbTypett4 :
:tt: ;
OracleMappingTypett< M
.ttM N
	RefCursorttN W
,ttW X
	directionttY b
:ttb c
ParameterDirectionttd v
.ttv w
Outputttw }
)tt} ~
;tt~ 

parametersuu 
.uu 
Adduu 
(uu 
nameuu #
:uu# $
$struu% 9
,uu9 :
dbTypeuu; A
:uuA B
OracleMappingTypeuuC T
.uuT U
	RefCursoruuU ^
,uu^ _
	directionuu` i
:uui j
ParameterDirectionuuk }
.uu} ~
Output	uu~ �
)
uu� �
;
uu� �

parametersvv 
.vv 
Addvv 
(vv 
namevv #
:vv# $
$strvv% 7
,vv7 8
dbTypevv9 ?
:vv? @
OracleMappingTypevvA R
.vvR S
	RefCursorvvS \
,vv\ ]
	directionvv^ g
:vvg h
ParameterDirectionvvi {
.vv{ |
Output	vv| �
)
vv� �
;
vv� �
varww 
resultsww 
=ww 
awaitww #

connectionww$ .
.ww. /
QueryMultipleAsyncww/ A
(wwA B
DatabaseProcedureswwB T
.wwT U%
SP_GET_LEAVE_TRANSACTIONSwwU n
,wwn o

parameterswwp z
,wwz {
commandType	ww| �
:
ww� �
CommandType
ww� �
.
ww� �
StoredProcedure
ww� �
)
ww� �
;
ww� �
employeeLeavesxx 
=xx  
resultsxx! (
.xx( )
Readxx) -
<xx- .
LeaveDetailReportxx. ?
>xx? @
(xx@ A
)xxA B
.xxB C
ToListxxC I
(xxI J
)xxJ K
;xxK L
leaveWorkFlowReportyy #
=yy$ %
resultsyy& -
.yy- .
Readyy. 2
<yy2 3
LeaveWorkFlowReportyy3 F
>yyF G
(yyG H
)yyH I
.yyI J
ToListyyJ P
(yyP Q
)yyQ R
;yyR S"
leaveFileUploadReportszz &
=zz' (
resultszz) 0
.zz0 1
Readzz1 5
<zz5 6"
LeaveFileUploadReportszz6 L
>zzL M
(zzM N
)zzN O
.zzO P
ToListzzP V
(zzV W
)zzW X
;zzX Y
foreach{{ 
({{ 
var{{ 
item{{ !
in{{" $
employeeLeaves{{% 3
){{3 4
{|| 
item}} 
.}} 
leaveWorkFlowReport}} ,
=}}- .
leaveWorkFlowReport}}/ B
.}}B C
Where}}C H
(}}H I
x}}I J
=>}}K M
(}}N O
x}}O P
.}}P Q
RLeaveId}}Q Y
==}}Z \
item}}] a
.}}a b
LeaveId}}b i
)}}i j
)}}j k
.}}k l
ToList}}l r
(}}r s
)}}s t
;}}t u
item~~ 
.~~ "
leaveFileUploadReports~~ /
=~~0 1"
leaveFileUploadReports~~2 H
.~~H I
Where~~I N
(~~N O
x~~O P
=>~~Q S
(~~T U
x~~U V
.~~V W
FLeaveId~~W _
==~~` b
item~~c g
.~~g h
LeaveId~~h o
)~~o p
)~~p q
.~~q r
ToList~~r x
(~~x y
)~~y z
;~~z {
} 
}
�� 
return
�� 
employeeLeaves
�� !
;
��! "
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� .
 EmployeeVerificationDetailReport
�� ?
>
��? @
>
��@ A+
GetEmployeeVerificationReport
��B _
(
��_ `+
EmployeeVerificationReportReq
��` }
	reportReq��~ �
)��� �
{
�� 	
List
�� 
<
�� .
 EmployeeVerificationDetailReport
�� 1
>
��1 2
reports
��3 :
=
��; <
null
��= A
;
��A B
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 3
,
��3 4
	reportReq
��5 >
.
��> ?
pBranchSlno
��? J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Varchar2
��f n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
	reportReq
��3 <
.
��< =
fromDate
��= E
,
��E F
dbType
��G M
:
��M N
OracleMappingType
��O `
.
��` a
Date
��a e
,
��e f
	direction
��g p
:
��p q!
ParameterDirection��r �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
	reportReq
��1 :
.
��: ;
toDate
��; A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Date
��] a
,
��a b
	direction
��c l
:
��l m!
ParameterDirection��n �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
reports
�� 
=
�� 
(
�� 
await
��  

connection
��! +
.
��+ ,

QueryAsync
��, 6
<
��6 7.
 EmployeeVerificationDetailReport
��7 W
>
��W X
(
��X Y 
DatabaseProcedures
��Y k
.
��k l)
SP_EMP_VERIFICATION_REPORT��l �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
reports
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\LeaveManagement\LeaveEncashmentRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
LeaveManagement& 5
{ 
public 

class %
LeaveEncashmentRepository *
:+ ,
BaseRepository- ;
{ 
private 
readonly 
IConfiguration '

;5 6
public %
LeaveEncashmentRepository (
(( )
IConfiguration) 7

)E F
:G H
baseI M
(M N

)[ \
{ 	
this 
. 

=  

;. /
} 	
public 
async 
Task 
< 
List 
< 
LeaveEncashment .
>. /
>/ 0
GetLeaveEncashment1 C
(C D
intD G
employeeSlnoH T
)T U
{ 	
List   
<   
LeaveEncashment    
>    !

leavesInfo  " ,
=  - .
null  / 3
;  3 4
using!! 
(!! 
var!! 

connection!! !
=!!" #
await!!$ )
CreateConnection!!* :
(!!: ;
DbSchema!!; C
.!!C D
PORTAL!!D J
)!!J K
)!!K L
{"" 
OracleDynamicParameters## '

parameters##( 2
=##3 4
new##5 8#
OracleDynamicParameters##9 P
(##P Q
)##Q R
;##R S

parameters$$ 
.$$ 
Add$$ 
($$ 
name$$ #
:$$# $
$str$$% 4
,$$4 5
employeeSlno$$6 B
,$$B C
dbType$$D J
:$$J K
OracleMappingType$$L ]
.$$] ^
Int32$$^ c
,$$c d
	direction$$e n
:$$n o
ParameterDirection	$$p �
.
$$� �
Input
$$� �
)
$$� �
;
$$� �

parameters%% 
.%% 
Add%% 
(%% 
name%% #
:%%# $
$str%%% .
,%%. /
dbType%%0 6
:%%6 7
OracleMappingType%%8 I
.%%I J
	RefCursor%%J S
,%%S T
	direction%%U ^
:%%^ _
ParameterDirection%%` r
.%%r s
Output%%s y
)%%y z
;%%z {

parameters&& 
.&& 
Add&& 
(&& 
name&& #
:&&# $
$str&&% /
,&&/ 0
dbType&&1 7
:&&7 8
OracleMappingType&&9 J
.&&J K
	RefCursor&&K T
,&&T U
	direction&&V _
:&&_ `
ParameterDirection&&a s
.&&s t
Output&&t z
)&&z {
;&&{ |
var)) 
results)) 
=)) 
await)) #

connection))$ .
.)). /
QueryMultipleAsync))/ A
())A B
DatabaseProcedures))B T
.))T U#
SP_GET_LEAVE_ENCASHMENT))U l
,))l m

parameters))n x
,))x y
commandType	))z �
:
))� �
CommandType
))� �
.
))� �
StoredProcedure
))� �
)
))� �
;
))� �

leavesInfo** 
=** 
results** $
.**$ %
Read**% )
<**) *
LeaveEncashment*** 9
>**9 :
(**: ;
)**; <
.**< =
ToList**= C
(**C D
)**D E
;**E F
var++ 
encashmentWorkFlows++ '
=++( )
results++* 1
.++1 2
Read++2 6
<++6 7
EncashmentWorkFlow++7 I
>++I J
(++J K
)++K L
.++L M
ToList++M S
(++S T
)++T U
;++U V
foreach-- 
(-- 
var-- 
item-- !
in--" $

leavesInfo--% /
)--/ 0
{.. 
item// 
.// 
EncashmentWorkFlows// ,
=//- .
encashmentWorkFlows/// B
.//B C
Where//C H
(//H I
x//I J
=>//K M
x//N O
.//O P
EncashmentId//P \
==//] _
item//` d
.//d e
EncashmentId//e q
)//q r
.//r s
ToList//s y
(//y z
)//z {
;//{ |
}00 
}11 
return22 

leavesInfo22 
;22 
}33 	
public55 
async55 
Task55 
<55 
bool55 
>55 
SaveLeaveEncashment55  3
(553 4
LeaveEncashmentReq554 F&
employeeLeaveEncashmentReq55G a
)55a b
{66 	
bool77 
resp77 
=77 
false77 
;77 
int88 
updatedRecords88 
=88  
$num88! "
;88" #
bool99 
isSaveWorkFlow99 
=99  !
false99" '
;99' (
using;; 
(;; 
var;; 

connection;; !
=;;" #
await;;$ )
CreateConnection;;* :
(;;: ;
DbSchema;;; C
.;;C D
PORTAL;;D J
);;J K
);;K L
{<< 
WorkFlowType== 
leaveWorkFlowType== .
===/ 0
WorkFlowType==1 =
.=== >

Encashment==> H
;==H I
List>> 
<>> 
WorkFlowInformation>> (
>>>( )
mappedWorkflows>>* 9
=>>: ;
await>>< A"
GetEncashmentWorkFlows>>B X
(>>X Y&
employeeLeaveEncashmentReq>>Y s
.>>s t
EmployeeSlno	>>t �
,
>>� �
leaveWorkFlowType
>>� �
)
>>� �
;
>>� �
mappedWorkflows?? 
=??  !
mappedWorkflows??" 1
.??1 2
OrderBy??2 9
(??9 :
x??: ;
=>??< >
x??? @
.??@ A
StepMasterId??A M
)??M N
.??N O
ToList??O U
(??U V
)??V W
;??W X
WorkFlowInformation@@ #
workFlow@@$ ,
=@@- .
mappedWorkflows@@/ >
.@@> ?
FirstOrDefault@@? M
(@@M N
)@@N O
;@@O P
ifAA 
(AA 
workFlowAA 
!=AA 
nullAA  $
)AA$ %
{BB #
OracleDynamicParametersCC +

parametersCC, 6
=CC7 8
newCC9 <#
OracleDynamicParametersCC= T
(CCT U
)CCU V
;CCV W

parametersDD 
.DD 
AddDD "
(DD" #
nameDD# '
:DD' (
$strDD) 8
,DD8 9&
employeeLeaveEncashmentReqDD: T
.DDT U
EmployeeSlnoDDU a
,DDa b
dbTypeDDc i
:DDi j
OracleMappingTypeDDk |
.DD| }
Int32	DD} �
,
DD� �
	direction
DD� �
:
DD� � 
ParameterDirection
DD� �
.
DD� �
Input
DD� �
)
DD� �
;
DD� �

parametersEE 
.EE 
AddEE "
(EE" #
nameEE# '
:EE' (
$strEE) 7
,EE7 8&
employeeLeaveEncashmentReqEE9 S
.EES T

BranchSlnoEET ^
,EE^ _
dbTypeEE` f
:EEf g
OracleMappingTypeEEh y
.EEy z
Int32EEz 
,	EE �
	direction
EE� �
:
EE� � 
ParameterDirection
EE� �
.
EE� �
Input
EE� �
)
EE� �
;
EE� �

parametersFF 
.FF 
AddFF "
(FF" #
nameFF# '
:FF' (
$strFF) 4
,FF4 5&
employeeLeaveEncashmentReqFF6 P
.FFP Q
EmpSlnoFFQ X
,FFX Y
dbTypeFFZ `
:FF` a
OracleMappingTypeFFb s
.FFs t
Int32FFt y
,FFy z
	direction	FF{ �
:
FF� � 
ParameterDirection
FF� �
.
FF� �
Input
FF� �
)
FF� �
;
FF� �

parametersGG 
.GG 
AddGG "
(GG" #
nameGG# '
:GG' (
$strGG) 4
,GG4 5&
employeeLeaveEncashmentReqGG6 P
.GGP Q
UniqueNoGGQ Y
,GGY Z
dbTypeGG[ a
:GGa b
OracleMappingTypeGGc t
.GGt u
Int32GGu z
,GGz {
	direction	GG| �
:
GG� � 
ParameterDirection
GG� �
.
GG� �
Input
GG� �
)
GG� �
;
GG� �

parametersHH 
.HH 
AddHH "
(HH" #
nameHH# '
:HH' (
$strHH) 3
,HH3 4&
employeeLeaveEncashmentReqHH5 O
.HHO P
FinSlnoHHP W
,HHW X
dbTypeHHY _
:HH_ `
OracleMappingTypeHHa r
.HHr s
Int32HHs x
,HHx y
	direction	HHz �
:
HH� � 
ParameterDirection
HH� �
.
HH� �
Input
HH� �
)
HH� �
;
HH� �

parametersII 
.II 
AddII "
(II" #
nameII# '
:II' (
$strII) <
,II< =&
employeeLeaveEncashmentReqII> X
.IIX Y
TotalDaysTakenIIY g
,IIg h
dbTypeIIi o
:IIo p
OracleMappingType	IIq �
.
II� �
Int32
II� �
,
II� �
	direction
II� �
:
II� � 
ParameterDirection
II� �
.
II� �
Input
II� �
)
II� �
;
II� �

parametersJJ 
.JJ 
AddJJ "
(JJ" #
nameJJ# '
:JJ' (
$strJJ) =
,JJ= >&
employeeLeaveEncashmentReqJJ? Y
.JJY Z
EncashmentAmountJJZ j
,JJj k
dbTypeJJl r
:JJr s
OracleMappingType	JJt �
.
JJ� �
Decimal
JJ� �
,
JJ� �
	direction
JJ� �
:
JJ� � 
ParameterDirection
JJ� �
.
JJ� �
Input
JJ� �
)
JJ� �
;
JJ� �

parametersKK 
.KK 
AddKK "
(KK" #
nameKK# '
:KK' (
$strKK) :
,KK: ;&
employeeLeaveEncashmentReqKK< V
.KKV W
TaxbleAmountKKW c
,KKc d
dbTypeKKe k
:KKk l
OracleMappingTypeKKm ~
.KK~ 
Decimal	KK �
,
KK� �
	direction
KK� �
:
KK� � 
ParameterDirection
KK� �
.
KK� �
Input
KK� �
)
KK� �
;
KK� �

parametersLL 
.LL 
AddLL "
(LL" #
nameLL# '
:LL' (
$strLL) 8
,LL8 9&
employeeLeaveEncashmentReqLL: T
.LLT U
TotalAmountLLU `
,LL` a
dbTypeLLb h
:LLh i
OracleMappingTypeLLj {
.LL{ |
Decimal	LL| �
,
LL� �
	direction
LL� �
:
LL� � 
ParameterDirection
LL� �
.
LL� �
Input
LL� �
)
LL� �
;
LL� �

parametersMM 
.MM 
AddMM "
(MM" #
nameMM# '
:MM' (
$strMM) 3
,MM3 4&
employeeLeaveEncashmentReqMM5 O
.MMO P
RemarksMMP W
,MMW X
dbTypeMMY _
:MM_ `
OracleMappingTypeMMa r
.MMr s
Varchar2MMs {
,MM{ |
	direction	MM} �
:
MM� � 
ParameterDirection
MM� �
.
MM� �
Input
MM� �
)
MM� �
;
MM� �

parametersOO 
.OO 
AddOO "
(OO" #
nameOO# '
:OO' (
$strOO) <
,OO< =
workFlowOO> F
.OOF G
WorkFlowTypeIdOOG U
,OOU V
dbTypeOOW ]
:OO] ^
OracleMappingTypeOO_ p
.OOp q
Int32OOq v
,OOv w
	direction	OOx �
:
OO� � 
ParameterDirection
OO� �
.
OO� �
Input
OO� �
)
OO� �
;
OO� �

parametersPP 
.PP 
AddPP "
(PP" #
namePP# '
:PP' (
$strPP) 8
,PP8 9
workFlowPP: B
.PPB C

StepTypeIdPPC M
,PPM N
dbTypePPO U
:PPU V
OracleMappingTypePPW h
.PPh i
Int32PPi n
,PPn o
	directionPPp y
:PPy z
ParameterDirection	PP{ �
.
PP� �
Input
PP� �
)
PP� �
;
PP� �

parametersQQ 
.QQ 
AddQQ "
(QQ" #
nameQQ# '
:QQ' (
$strQQ) :
,QQ: ;
workFlowQQ< D
.QQD E
StepMasterIdQQE Q
,QQQ R
dbTypeQQS Y
:QQY Z
OracleMappingTypeQQ[ l
.QQl m
Int32QQm r
,QQr s
	directionQQt }
:QQ} ~
ParameterDirection	QQ �
.
QQ� �
Input
QQ� �
)
QQ� �
;
QQ� �

parametersRR 
.RR 
AddRR "
(RR" #
nameRR# '
:RR' (
$strRR) ?
,RR? @
LeaveStatusNamesRRA Q
.RRQ R
PendingForApprovalRRR d
.RRd e
ToInt32OrDefaultRRe u
(RRu v
)RRv w
,RRw x
dbTypeRRy 
:	RR �
OracleMappingType
RR� �
.
RR� �
Int32
RR� �
,
RR� �
	direction
RR� �
:
RR� � 
ParameterDirection
RR� �
.
RR� �
Input
RR� �
)
RR� �
;
RR� �

parametersSS 
.SS 
AddSS "
(SS" #
nameSS# '
:SS' (
$strSS) 7
,SS7 8
workFlowSS9 A
.SSA B"
Reporting_EmployeeSlnoSSB X
,SSX Y
dbTypeSSZ `
:SS` a
OracleMappingTypeSSb s
.SSs t
Int32SSt y
,SSy z
	direction	SS{ �
:
SS� � 
ParameterDirection
SS� �
.
SS� �
Input
SS� �
)
SS� �
;
SS� �

parametersTT 
.TT 
AddTT "
(TT" #
nameTT# '
:TT' (
$strTT) :
,TT: ;&
employeeLeaveEncashmentReqTT< V
.TTV W

,TTd e
dbTypeTTf l
:TTl m
OracleMappingTypeTTn 
.	TT �
Int32
TT� �
,
TT� �
	direction
TT� �
:
TT� � 
ParameterDirection
TT� �
.
TT� �
Input
TT� �
)
TT� �
;
TT� �
updatedRecordsVV "
=VV# $
awaitVV% *

connectionVV+ 5
.VV5 6
ExecuteAsyncVV6 B
(VVB C
DatabaseProceduresVVC U
.VVU V&
SP_INSERT_LEAVE_ENCASHMENTVVV p
,VVp q

parametersVVr |
,VV| }
commandType	VV~ �
:
VV� �
CommandType
VV� �
.
VV� �
StoredProcedure
VV� �
)
VV� �
;
VV� �
}XX 
}ZZ 
resp[[ 
=[[ 
updatedRecords[[ !
*[[" #
-[[$ %
$num[[% &
>[[' (
$num[[) *
;[[* +
return\\ 
resp\\ 
;\\ 
}]] 	
public__ 
async__ 
Task__ 
<__ 
bool__ 
>__ !
DeleteLeaveEncashment__  5
(__5 6
DeleteEncashmentReq__6 I
deleteEncashmentReq__J ]
)__] ^
{`` 	
boolaa 
respaa 
=aa 
falseaa 
;aa 
intbb 
updatedRecordsbb 
=bb  
$numbb! "
;bb" #
usingcc 
(cc 
varcc 

connectioncc !
=cc" #
awaitcc$ )
CreateConnectioncc* :
(cc: ;
DbSchemacc; C
.ccC D
PORTALccD J
)ccJ K
)ccK L
{dd 
OracleDynamicParametersee '

parametersee( 2
=ee3 4
newee5 8#
OracleDynamicParametersee9 P
(eeP Q
)eeQ R
;eeR S

parametersff 
.ff 
Addff 
(ff 
nameff #
:ff# $
$strff% 5
,ff5 6
deleteEncashmentReqff7 J
.ffJ K
EncashmentIdffK W
,ffW X
dbTypeffY _
:ff_ `
OracleMappingTypeffa r
.ffr s
Int32ffs x
,ffx y
	direction	ffz �
:
ff� � 
ParameterDirection
ff� �
.
ff� �
Input
ff� �
)
ff� �
;
ff� �

parametersgg 
.gg 
Addgg 
(gg 
namegg #
:gg# $
$strgg% 1
,gg1 2
deleteEncashmentReqgg3 F
.ggF G
	UpdatedByggG P
,ggP Q
dbTypeggR X
:ggX Y
OracleMappingTypeggZ k
.ggk l
Int32ggl q
,ggq r
	directionggs |
:gg| }
ParameterDirection	gg~ �
.
gg� �
Input
gg� �
)
gg� �
;
gg� �

parametershh 
.hh 
Addhh 
(hh 
namehh #
:hh# $
$strhh% 6
,hh6 7
deleteEncashmentReqhh8 K
.hhK L

,hhY Z
dbTypehh[ a
:hha b
OracleMappingTypehhc t
.hht u
Int32hhu z
,hhz {
	direction	hh| �
:
hh� � 
ParameterDirection
hh� �
.
hh� �
Input
hh� �
)
hh� �
;
hh� �

parametersii 
.ii 
Addii 
(ii 
nameii #
:ii# $
$strii% 8
,ii8 9
deleteEncashmentReqii: M
.iiM N
TotalDaysTakeniiN \
,ii\ ]
dbTypeii^ d
:iid e
OracleMappingTypeiif w
.iiw x
Int32iix }
,ii} ~
	direction	ii �
:
ii� � 
ParameterDirection
ii� �
.
ii� �
Input
ii� �
)
ii� �
;
ii� �
updatedRecordskk 
=kk  
awaitkk! &

connectionkk' 1
.kk1 2
ExecuteAsynckk2 >
(kk> ?
DatabaseProcedureskk? Q
.kkQ R&
SP_DELETE_LEAVE_ENCASHMENTkkR l
,kkl m

parameterskkn x
,kkx y
commandType	kkz �
:
kk� �
CommandType
kk� �
.
kk� �
StoredProcedure
kk� �
)
kk� �
;
kk� �
}ll 
respmm 
=mm 
updatedRecordsmm !
*mm" #
-mm$ %
$nummm% &
>mm' (
$nummm) *
;mm* +
returnnn 
respnn 
;nn 
}oo 	
publicpp 
asyncpp 
Taskpp 
<pp 
decimalpp !
>pp! "'
GetEmployeeTDSAmountDetailspp# >
(pp> ?#
EmployeeTDSMountDetailspp? V#
employeeTDSMountDetailsppW n
)ppn o
{qq 	
decimalrr 
	tdsAmountrr 
=rr 
$numrr  !
;rr! "#
EmployeeTDSMountDetailsss #
tdsEmployeeDetailsss$ 6
=ss7 8
nullss9 =
;ss= >
usingtt 
(tt 
vartt 

connectiontt !
=tt" #
awaittt$ )
basett* .
.tt. /
CreateConnectiontt/ ?
(tt? @
DbSchematt@ H
.ttH I
PORTALttI O
)ttO P
)ttP Q
{uu 
OracleDynamicParametersvv '
	parmetersvv( 1
=vv2 3
newvv4 7#
OracleDynamicParametersvv8 O
(vvO P
)vvP Q
;vvQ R
	parmetersww 
.ww 
Addww 
(ww 
nameww "
:ww" #
$strww$ /
,ww/ 0#
employeeTDSMountDetailsww1 H
.wwH I
EmpSlnowwI P
,wwP Q
dbTypewwR X
:wwX Y
OracleMappingTypewwZ k
.wwk l
Int32wwl q
,wwq r
	directionwws |
:ww| }
ParameterDirection	ww~ �
.
ww� �
Input
ww� �
)
ww� �
;
ww� �
	parmetersxx 
.xx 
Addxx 
(xx 
namexx "
:xx" #
$strxx$ /
,xx/ 0#
employeeTDSMountDetailsxx1 H
.xxH I
UniquenoxxI Q
,xxQ R
dbTypexxS Y
:xxY Z
OracleMappingTypexx[ l
.xxl m
Int32xxm r
,xxr s
	directionxxt }
:xx} ~
ParameterDirection	xx �
.
xx� �
Input
xx� �
)
xx� �
;
xx� �
	parmetersyy 
.yy 
Addyy 
(yy 
nameyy "
:yy" #
$stryy$ 2
,yy2 3#
employeeTDSMountDetailsyy4 K
.yyK L

BranchSlnoyyL V
,yyV W
dbTypeyyX ^
:yy^ _
OracleMappingTypeyy` q
.yyq r
Int32yyr w
,yyw x
	direction	yyy �
:
yy� � 
ParameterDirection
yy� �
.
yy� �
Input
yy� �
)
yy� �
;
yy� �
	parmeterszz 
.zz 
Addzz 
(zz 
namezz "
:zz" #
$strzz$ .
,zz. /#
employeeTDSMountDetailszz0 G
.zzG H
FinSlnozzH O
,zzO P
dbTypezzQ W
:zzW X
OracleMappingTypezzY j
.zzj k
Int32zzk p
,zzp q
	directionzzr {
:zz{ |
ParameterDirection	zz} �
.
zz� �
Input
zz� �
)
zz� �
;
zz� �
	parmeters{{ 
.{{ 
Add{{ 
({{ 
name{{ "
:{{" #
$str{{$ 5
,{{5 6#
employeeTDSMountDetails{{7 N
.{{N O

,{{\ ]
dbType{{^ d
:{{d e
OracleMappingType{{f w
.{{w x
Int32{{x }
,{{} ~
	direction	{{ �
:
{{� � 
ParameterDirection
{{� �
.
{{� �
Input
{{� �
)
{{� �
;
{{� �
	parmeters}} 
.}} 
Add}} 
(}} 
name}} "
:}}" #
$str}}$ 1
,}}1 2
dbType}}3 9
:}}9 :
OracleMappingType}}; L
.}}L M
Decimal}}M T
,}}T U
	direction}}V _
:}}_ `
ParameterDirection}}a s
.}}s t
Output}}t z
)}}z {
;}}{ |
	tdsAmount~~ 
=~~ 
await~~ !

connection~~" ,
.~~, -
ExecuteScalarAsync~~- ?
<~~? @
decimal~~@ G
>~~G H
(~~H I
DatabaseProcedures~~I [
.~~[ \#
GET_EMPLOYEE_TDS_AMOUNT~~\ s
,~~s t
	parmeters~~u ~
,~~~ 
commandType
~~� �
:
~~� �
CommandType
~~� �
.
~~� �
StoredProcedure
~~� �
)
~~� �
;
~~� �
} 
return
�� 
	tdsAmount
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� ,
UpdateEmployeeEncashmentStatus
��  >
(
��> ?!
UpdateEncashmentReq
��? R
leaveDetail
��S ^
)
��^ _
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  0
,
��0 1
leaveDetail
��2 =
.
��= >
EncashmentId
��> J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  1
,
��1 2
leaveDetail
��3 >
.
��> ?

��? L
,
��L M
dbType
��N T
:
��T U
OracleMappingType
��V g
.
��g h
Int32
��h m
,
��m n
	direction
��o x
:
��x y!
ParameterDirection��z �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  0
,
��0 1
leaveDetail
��2 =
.
��= >
EmployeeSlno
��> J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  3
,
��3 4
leaveDetail
��5 @
.
��@ A
WorkFlowTypeId
��A O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Int32
��k p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  /
,
��/ 0
leaveDetail
��1 <
.
��< =

StepTypeId
��= G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Int32
��c h
,
��h i
	direction
��j s
:
��s t!
ParameterDirection��u �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  1
,
��1 2
leaveDetail
��3 >
.
��> ?
StepMasterId
��? K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Int32
��g l
,
��l m
	direction
��n w
:
��w x!
ParameterDirection��y �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  *
,
��* +
leaveDetail
��, 7
.
��7 8
ApprovedRemarks
��8 G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Varchar2
��c k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R)
PROCESS_ENCASHMENT_WORKFLOW
��R m
,
��m n
param
��o t
,
��t u
commandType��v �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
resp
�� 
=
�� 
(
�� 
updatedRecords
�� &
*
��' (
-
��) *
$num
��* +
)
��+ ,
>
��- .
$num
��/ 0
;
��0 1
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  !
WorkFlowInformation
��  3
>
��3 4
>
��4 5$
GetEncashmentWorkFlows
��6 L
(
��L M
int
��M P
employeeSlno
��Q ]
,
��] ^
WorkFlowType
��_ k
leaveWorkFlowType
��l }
)
��} ~
{
�� 	
List
�� 
<
�� !
WorkFlowInformation
�� $
>
��$ %!
workFlowInformation
��& 9
=
��: ;
null
��< @
;
��@ A
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
employeeSlno
��7 C
,
��C D
dbType
��E K
:
��K L
OracleMappingType
��M ^
.
��^ _
Int32
��_ d
,
��d e
	direction
��f o
:
��o p!
ParameterDirection��q �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 8
,
��8 9
leaveWorkFlowType
��: K
.
��K L
ToInt32OrDefault
��L \
(
��\ ]
)
��] ^
,
��^ _
dbType
��` f
:
��f g
OracleMappingType
��h y
.
��y z
Int32
��z 
,�� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {!
workFlowInformation
�� #
=
��$ %
(
��& '
await
��' ,

connection
��- 7
.
��7 8

QueryAsync
��8 B
<
��B C!
WorkFlowInformation
��C V
>
��V W
(
��W X 
DatabaseProcedures
��X j
.
��j k$
GET_EMPLOYEE_WORKFLOW��k �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� !
workFlowInformation
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� -
LeaveEncashmentApprovalsDetails
�� >
>
��> ?
>
��? @)
GetLeavesEncashmentApproval
��A \
(
��\ ]
int
��] `
employeeSlno
��a m
)
��m n
{
�� 	
List
�� 
<
�� -
LeaveEncashmentApprovalsDetails
�� 0
>
��0 1&
LeaveEncashmentApprovals
��2 J
=
��K L
null
��M Q
;
��Q R
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 7
,
��7 8
LeaveStatusNames
��9 I
.
��I J 
PendingForApproval
��J \
.
��\ ]
ToInt32OrDefault
��] m
(
��m n
)
��n o
,
��o p
dbType
��q w
:
��w x 
OracleMappingType��y �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {&
LeaveEncashmentApprovals
�� (
=
��) *
(
��+ ,
await
��, 1

connection
��2 <
.
��< =

QueryAsync
��= G
<
��G H-
LeaveEncashmentApprovalsDetails
��H g
>
��g h
(
��h i 
DatabaseProcedures
��i {
.
��{ |-
GET_LEAVES_ENCASHMENT_APPROVAL��| �
,��� �

parameters��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� &
LeaveEncashmentApprovals
�� +
;
��+ ,
}
�� 	
}
�� 
}�� ��
gF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\LeaveManagement\LeaveEntitlementRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
LeaveManagement& 5
{ 
public 

class &
LeaveEntitlementRepository +
:, -
BaseRepository. <
{ 
private 
readonly 
IConfiguration '

;5 6
private 
readonly 
IDistributedCache *

redisCache+ 5
;5 6
public &
LeaveEntitlementRepository )
() *
IConfiguration* 8

)F G
:H I
baseJ N
(N O

)\ ]
{ 	
this 
. 

=  

;. /
}   	
public"" 
async"" 
Task"" 
<"" 
List"" 
<"" 
LeaveEntitlement"" /
>""/ 0
>""0 1
GetLeaveEntitlement""2 E
(""E F*
GetEmployeeLeaveEntitlementReq""F d(
employeeLeaveEntitlementReq	""e �
)
""� �
{## 	
List$$ 
<$$ 
LeaveEntitlement$$ !
>$$! "
entitlement$$# .
=$$/ 0
null$$1 5
;$$5 6
string%% 
BranchSlnotring%% "
=%%# $
string%%% +
.%%+ ,
Join%%, 0
(%%0 1
$str%%1 4
,%%4 5'
employeeLeaveEntitlementReq%%6 Q
.%%Q R

BranchSlno%%R \
)%%\ ]
;%%] ^
using&& 
(&& 
var&& 

connection&& !
=&&" #
await&&$ )
CreateConnection&&* :
(&&: ;
DbSchema&&; C
.&&C D
PORTAL&&D J
)&&J K
)&&K L
{'' 
OracleDynamicParameters(( '

parameters((( 2
=((3 4
new((5 8#
OracleDynamicParameters((9 P
(((P Q
)((Q R
;((R S

parameters)) 
.)) 
Add)) 
()) 
name)) #
:))# $
$str))% 8
,))8 9'
employeeLeaveEntitlementReq)): U
.))U V
OfficeTypeSlno))V d
,))d e
dbType))f l
:))l m
OracleMappingType))n 
.	)) �
Int32
))� �
,
))� �
	direction
))� �
:
))� � 
ParameterDirection
))� �
.
))� �
Input
))� �
)
))� �
;
))� �

parameters** 
.** 
Add** 
(** 
name** #
:**# $
$str**% 3
,**3 4'
employeeLeaveEntitlementReq**5 P
.**P Q

BranchSlno**Q [
.**[ \
ToArray**\ c
(**c d
)**d e
,**e f
dbType**g m
:**m n
OracleMappingType	**o �
.
**� �
Int32
**� �
,
**� �
	direction
**� �
:
**� � 
ParameterDirection
**� �
.
**� �
Input
**� �
,
**� �)
employeeLeaveEntitlementReq
**� �
.
**� �

BranchSlno
**� �
.
**� �
Count
**� �
,
**� �
collectionType++ "
:++" #'
OracleMappingCollectionType++$ ?
.++? @!
PLSQLAssociativeArray++@ U
)++U V
;++V W

parameters,, 
.,, 
Add,, 
(,, 
name,, #
:,,# $
$str,,% 5
,,,5 6'
employeeLeaveEntitlementReq,,7 R
.,,R S
LeaveTypeId,,S ^
,,,^ _
dbType,,` f
:,,f g
OracleMappingType,,h y
.,,y z
Int32,,z 
,	,, �
	direction
,,� �
:
,,� � 
ParameterDirection
,,� �
.
,,� �
Input
,,� �
)
,,� �
;
,,� �

parameters-- 
.-- 
Add-- 
(-- 
name-- #
:--# $
$str--% .
,--. /
dbType--0 6
:--6 7
OracleMappingType--8 I
.--I J
	RefCursor--J S
,--S T
	direction--U ^
:--^ _
ParameterDirection--` r
.--r s
Output--s y
)--y z
;--z {
entitlement.. 
=.. 
(.. 
await.. $

connection..% /
.../ 0

QueryAsync..0 :
<..: ;
LeaveEntitlement..; K
>..K L
(..L M
DatabaseProcedures..M _
..._ `$
SP_GET_LEAVE_ENTITLEMENT..` x
,..x y

parameters	..z �
,
..� �
commandType
..� �
:
..� �
CommandType
..� �
.
..� �
StoredProcedure
..� �
)
..� �
)
..� �
.
..� �
ToList
..� �
(
..� �
)
..� �
;
..� �
entitlement// 
=// 
entitlement// )
.//) *
OrderByDescending//* ;
(//; <
x//< =
=>//> @
x//A B
.//B C
EmpId//C H
)//H I
.//I J
ToList//J P
(//P Q
)//Q R
;//R S
}00 
return11 
entitlement11 
;11 
}22 	
public33 
async33 
Task33 
<33 
bool33 
>33 "
UpdateLeaveEntitlement33  6
(336 7
List337 ;
<33; <
LeaveEntitlement33< L
>33L M
leaveEntitlements33N _
)33_ `
{44 	
bool55 
resp55 
=55 
false55 
;55 
int66 
updatedRecords66 
=66  
$num66! "
;66" #
List77 
<77 
LeaveEntitlement77 !
>77! " 
oldLeaveEntitlements77# 7
=778 9
null77: >
;77> ?
List88 
<88 
LeaveEntitlement88 !
>88! " 
newleaveEntitlements88# 7
=888 9
null88: >
;88> ?#
OracleDynamicParameters99 #

parameters99$ .
=99/ 0
null991 5
;995 6
foreach;; 
(;; 
var;; 
item;; 
in;;  
leaveEntitlements;;! 2
);;2 3
{<< 
item== 
.== 

RowVersion== 
===  !
Guid==" &
.==& '
NewGuid==' .
(==. /
)==/ 0
.==0 1
ToString==1 9
(==9 :
)==: ;
;==; <
}AA 
usingDD 
(DD 
varDD 

connectionDD !
=DD" #
awaitDD$ )
CreateConnectionDD* :
(DD: ;
DbSchemaDD; C
.DDC D
PORTALDDD J
)DDJ K
)DDK L
{EE 

parametersFF 
=FF 
newFF  #
OracleDynamicParametersFF! 8
(FF8 9
)FF9 :
;FF: ;

parametersGG 
.GG 
AddGG 
(GG 
nameGG #
:GG# $
$strGG% E
,GGE F
leaveEntitlementsGGG X
.GGX Y
SelectGGY _
(GG_ `
xGG` a
=>GGa c
xGGc d
.GGd e&
EmployeeLeaveEntitlementIdGGe 
)	GG �
.
GG� �
ToArray
GG� �
(
GG� �
)
GG� �
,
GG� �
dbType
GG� �
:
GG� �
OracleMappingType
GG� �
.
GG� �
Int32
GG� �
,
GG� �
	direction
GG� �
:
GG� � 
ParameterDirection
GG� �
.
GG� �
Input
GG� �
,
GG� �
leaveEntitlements
GG� �
.
GG� �
Select
GG� �
(
GG� �
x
GG� �
=>
GG� �
x
GG� �
.
GG� �(
EmployeeLeaveEntitlementId
GG� �
)
GG� �
.
GG� �
Count
GG� �
(
GG� �
)
GG� �
,
GG� �
collectionTypeHH "
:HH" #'
OracleMappingCollectionTypeHH$ ?
.HH? @!
PLSQLAssociativeArrayHH@ U
)HHU V
;HHV W

parametersII 
.II 
AddII 
(II 
nameII #
:II# $
$strII% 4
,II4 5
leaveEntitlementsII6 G
.IIG H
SelectIIH N
(IIN O
xIIO P
=>IIQ S
xIIT U
.IIU V
EmployeeSlnoIIV b
)IIb c
.IIc d
ToArrayIId k
(IIk l
)IIl m
,IIm n
dbTypeIIo u
:IIu v
OracleMappingType	IIw �
.
II� �
Int32
II� �
,
II� �
	direction
II� �
:
II� � 
ParameterDirection
II� �
.
II� �
Input
II� �
,
II� �
leaveEntitlements
II� �
.
II� �
Select
II� �
(
II� �
x
II� �
=>
II� �
x
II� �
.
II� �(
EmployeeLeaveEntitlementId
II� �
)
II� �
.
II� �
Count
II� �
(
II� �
)
II� �
,
II� �
collectionTypeJJ "
:JJ" #'
OracleMappingCollectionTypeJJ$ ?
.JJ? @!
PLSQLAssociativeArrayJJ@ U
)JJU V
;JJV W

parametersKK 
.KK 
AddKK 
(KK 
nameKK #
:KK# $
$strKK% <
,KK< =
leaveEntitlementsKK> O
.KKO P
SelectKKP V
(KKV W
xKKW X
=>KKY [
xKK\ ]
.KK] ^
LeaveInformationIdKK^ p
)KKp q
.KKq r
ToArrayKKr y
(KKy z
)KKz {
,KK{ |
dbType	KK} �
:
KK� �
OracleMappingType
KK� �
.
KK� �
Int32
KK� �
,
KK� �
	direction
KK� �
:
KK� � 
ParameterDirection
KK� �
.
KK� �
Input
KK� �
,
KK� �
leaveEntitlements
KK� �
.
KK� �
Select
KK� �
(
KK� �
x
KK� �
=>
KK� �
x
KK� �
.
KK� �(
EmployeeLeaveEntitlementId
KK� �
)
KK� �
.
KK� �
Count
KK� �
(
KK� �
)
KK� �
,
KK� �
collectionTypeLL "
:LL" #'
OracleMappingCollectionTypeLL$ ?
.LL? @!
PLSQLAssociativeArrayLL@ U
)LLU V
;LLV W

parametersMM 
.MM 
AddMM 
(MM 
nameMM #
:MM# $
$strMM% 5
,MM5 6
leaveEntitlementsMM7 H
.MMH I
SelectMMI O
(MMO P
xMMP Q
=>MMR T
xMMU V
.MMV W
	LeaveYearMMW `
)MM` a
.MMa b
ToArrayMMb i
(MMi j
)MMj k
,MMk l
dbTypeMMm s
:MMs t
OracleMappingType	MMu �
.
MM� �
Int32
MM� �
,
MM� �
	direction
MM� �
:
MM� � 
ParameterDirection
MM� �
.
MM� �
Input
MM� �
,
MM� �
leaveEntitlements
MM� �
.
MM� �
Select
MM� �
(
MM� �
x
MM� �
=>
MM� �
x
MM� �
.
MM� �(
EmployeeLeaveEntitlementId
MM� �
)
MM� �
.
MM� �
Count
MM� �
(
MM� �
)
MM� �
,
MM� �
collectionTypeNN "
:NN" #'
OracleMappingCollectionTypeNN$ ?
.NN? @!
PLSQLAssociativeArrayNN@ U
)NNU V
;NNV W

parametersOO 
.OO 
AddOO 
(OO 
nameOO #
:OO# $
$strOO% 7
,OO7 8
leaveEntitlementsOO9 J
.OOJ K
SelectOOK Q
(OOQ R
xOOR S
=>OOT V
xOOW X
.OOX Y

)OOf g
.OOg h
ToArrayOOh o
(OOo p
)OOp q
,OOq r
dbTypeOOs y
:OOy z
OracleMappingType	OO{ �
.
OO� �
Date
OO� �
,
OO� �
	direction
OO� �
:
OO� � 
ParameterDirection
OO� �
.
OO� �
Input
OO� �
,
OO� �
leaveEntitlements
OO� �
.
OO� �
Select
OO� �
(
OO� �
x
OO� �
=>
OO� �
x
OO� �
.
OO� �(
EmployeeLeaveEntitlementId
OO� �
)
OO� �
.
OO� �
Count
OO� �
(
OO� �
)
OO� �
,
OO� �
collectionTypePP "
:PP" #'
OracleMappingCollectionTypePP$ ?
.PP? @!
PLSQLAssociativeArrayPP@ U
)PPU V
;PPV W

parametersQQ 
.QQ 
AddQQ 
(QQ 
nameQQ #
:QQ# $
$strQQ% 8
,QQ8 9
leaveEntitlementsQQ: K
.QQK L
SelectQQL R
(QQR S
xQQS T
=>QQU W
xQQX Y
.QQY Z
DateValidUntilQQZ h
)QQh i
.QQi j
ToArrayQQj q
(QQq r
)QQr s
,QQs t
dbTypeQQu {
:QQ{ |
OracleMappingType	QQ} �
.
QQ� �
Date
QQ� �
,
QQ� �
	direction
QQ� �
:
QQ� � 
ParameterDirection
QQ� �
.
QQ� �
Input
QQ� �
,
QQ� �
leaveEntitlements
QQ� �
.
QQ� �
Select
QQ� �
(
QQ� �
x
QQ� �
=>
QQ� �
x
QQ� �
.
QQ� �(
EmployeeLeaveEntitlementId
QQ� �
)
QQ� �
.
QQ� �
Count
QQ� �
(
QQ� �
)
QQ� �
,
QQ� �
collectionTypeRR "
:RR" #'
OracleMappingCollectionTypeRR$ ?
.RR? @!
PLSQLAssociativeArrayRR@ U
)RRU V
;RRV W

parametersSS 
.SS 
AddSS 
(SS 
nameSS #
:SS# $
$strSS% 4
,SS4 5
leaveEntitlementsSS6 G
.SSG H
SelectSSH N
(SSN O
xSSO P
=>SSQ S
xSST U
.SSU V
TotalLeavesSSV a
)SSa b
.SSb c
ToArraySSc j
(SSj k
)SSk l
,SSl m
dbTypeSSn t
:SSt u
OracleMappingType	SSv �
.
SS� �
Decimal
SS� �
,
SS� �
	direction
SS� �
:
SS� � 
ParameterDirection
SS� �
.
SS� �
Input
SS� �
,
SS� �
leaveEntitlements
SS� �
.
SS� �
Select
SS� �
(
SS� �
x
SS� �
=>
SS� �
x
SS� �
.
SS� �(
EmployeeLeaveEntitlementId
SS� �
)
SS� �
.
SS� �
Count
SS� �
(
SS� �
)
SS� �
,
SS� �
collectionTypeTT "
:TT" #'
OracleMappingCollectionTypeTT$ ?
.TT? @!
PLSQLAssociativeArrayTT@ U
)TTU V
;TTV W

parametersUU 
.UU 
AddUU 
(UU 
nameUU #
:UU# $
$strUU% 7
,UU7 8
leaveEntitlementsUU9 J
.UUJ K
SelectUUK Q
(UUQ R
xUUR S
=>UUT V
xUUW X
.UUX Y
ConsumedLeavesUUY g
)UUg h
.UUh i
ToArrayUUi p
(UUp q
)UUq r
,UUr s
dbTypeUUt z
:UUz {
OracleMappingType	UU| �
.
UU� �
Decimal
UU� �
,
UU� �
	direction
UU� �
:
UU� � 
ParameterDirection
UU� �
.
UU� �
Input
UU� �
,
UU� �
leaveEntitlements
UU� �
.
UU� �
Select
UU� �
(
UU� �
x
UU� �
=>
UU� �
x
UU� �
.
UU� �(
EmployeeLeaveEntitlementId
UU� �
)
UU� �
.
UU� �
Count
UU� �
(
UU� �
)
UU� �
,
UU� �
collectionTypeVV "
:VV" #'
OracleMappingCollectionTypeVV$ ?
.VV? @!
PLSQLAssociativeArrayVV@ U
)VVU V
;VVV W

parametersWW 
.WW 
AddWW 
(WW 
nameWW #
:WW# $
$strWW% 3
,WW3 4
leaveEntitlementsWW5 F
.WWF G
SelectWWG M
(WWM N
xWWN O
=>WWP R
xWWS T
.WWT U

RowVersionWWU _
)WW_ `
.WW` a
ToArrayWWa h
(WWh i
)WWi j
,WWj k
dbTypeWWl r
:WWr s
OracleMappingType	WWt �
.
WW� �
Varchar2
WW� �
,
WW� �
	direction
WW� �
:
WW� � 
ParameterDirection
WW� �
.
WW� �
Input
WW� �
,
WW� �
leaveEntitlements
WW� �
.
WW� �
Select
WW� �
(
WW� �
x
WW� �
=>
WW� �
x
WW� �
.
WW� �(
EmployeeLeaveEntitlementId
WW� �
)
WW� �
.
WW� �
Count
WW� �
(
WW� �
)
WW� �
,
WW� �
collectionTypeXX "
:XX" #'
OracleMappingCollectionTypeXX$ ?
.XX? @!
PLSQLAssociativeArrayXX@ U
)XXU V
;XXV W

parametersYY 
.YY 
AddYY 
(YY 
nameYY #
:YY# $
$strYY% 2
,YY2 3
leaveEntitlementsYY4 E
.YYE F
SelectYYF L
(YYL M
xYYM N
=>YYO Q
xYYR S
.YYS T
	CreatedByYYT ]
)YY] ^
.YY^ _
ToArrayYY_ f
(YYf g
)YYg h
,YYh i
dbTypeYYj p
:YYp q
OracleMappingType	YYr �
.
YY� �
Int32
YY� �
,
YY� �
	direction
YY� �
:
YY� � 
ParameterDirection
YY� �
.
YY� �
Input
YY� �
,
YY� �
leaveEntitlements
YY� �
.
YY� �
Select
YY� �
(
YY� �
x
YY� �
=>
YY� �
x
YY� �
.
YY� �(
EmployeeLeaveEntitlementId
YY� �
)
YY� �
.
YY� �
Count
YY� �
(
YY� �
)
YY� �
,
YY� �
collectionTypeZZ "
:ZZ" #'
OracleMappingCollectionTypeZZ$ ?
.ZZ? @!
PLSQLAssociativeArrayZZ@ U
)ZZU V
;ZZV W

parametersaa 
.aa 
Addaa 
(aa 
nameaa #
:aa# $
$straa% 8
,aa8 9
leaveEntitlementsaa: K
.aaK L
SelectaaL R
(aaR S
xaaS T
=>aaU W
xaaX Y
.aaY Z
OriTotalLeavesaaZ h
)aah i
.aai j
ToArrayaaj q
(aaq r
)aar s
,aas t
dbTypeaau {
:aa{ |
OracleMappingType	aa} �
.
aa� �
Int32
aa� �
,
aa� �
	direction
aa� �
:
aa� � 
ParameterDirection
aa� �
.
aa� �
Input
aa� �
,
aa� �
leaveEntitlements
aa� �
.
aa� �
Select
aa� �
(
aa� �
x
aa� �
=>
aa� �
x
aa� �
.
aa� �(
EmployeeLeaveEntitlementId
aa� �
)
aa� �
.
aa� �
Count
aa� �
(
aa� �
)
aa� �
,
aa� �
collectionTypebb "
:bb" #'
OracleMappingCollectionTypebb$ ?
.bb? @!
PLSQLAssociativeArraybb@ U
)bbU V
;bbV W
updatedRecordscc 
=cc  
awaitcc! &

connectioncc' 1
.cc1 2
ExecuteAsynccc2 >
(cc> ?
DatabaseProcedurescc? Q
.ccQ R%
SP_SAVE_LEAVE_ENTITLEMENTccR k
,cck l

parametersccm w
,ccw x
commandType	ccy �
:
cc� �
CommandType
cc� �
.
cc� �
StoredProcedure
cc� �
)
cc� �
;
cc� �
}dd 
respee 
=ee 
updatedRecordsee !
*ee" #
-ee$ %
$numee% &
>ee' (
$numee) *
;ee* +
returnff 
respff 
;ff 
}gg 	
publicii 
asyncii 
Taskii 
<ii 
boolii 
>ii  
SaveLeaveEntitlementii  4
(ii4 5
Listii5 9
<ii9 :
LeaveEntitlementii: J
>iiJ K
leaveEntitlementsiiL ]
)ii] ^
{jj 	
boolkk 
respkk 
=kk 
falsekk 
;kk 
intll 
updatedRecordsll 
=ll  
$numll! "
;ll" #
Listmm 
<mm 
LeaveEntitlementmm !
>mm! " 
oldLeaveEntitlementsmm# 7
=mm8 9
nullmm: >
;mm> ?
Listnn 
<nn 
LeaveEntitlementnn !
>nn! " 
newleaveEntitlementsnn# 7
=nn8 9
nullnn: >
;nn> ?#
OracleDynamicParametersoo #

parametersoo$ .
=oo/ 0
newoo1 4#
OracleDynamicParametersoo5 L
(ooL M
)ooM N
;ooN O 
oldLeaveEntitlementspp  
=pp! "
leaveEntitlementspp# 4
.pp4 5
Wherepp5 :
(pp: ;
xpp; <
=>pp= ?
xpp@ A
.ppA B&
EmployeeLeaveEntitlementIdppB \
!=pp] _
$numpp` a
)ppa b
.ppb c
ToListppc i
(ppi j
)ppj k
;ppk l 
newleaveEntitlementsqq  
=qq! "
leaveEntitlementsqq# 4
.qq4 5
Whereqq5 :
(qq: ;
xqq; <
=>qq= ?
xqq@ A
.qqA B&
EmployeeLeaveEntitlementIdqqB \
==qq] _
$numqq` a
)qqa b
.qqb c
ToListqqc i
(qqi j
)qqj k
;qqk l
usingrr 
(rr 
varrr 

connectionrr !
=rr" #
awaitrr$ )
CreateConnectionrr* :
(rr: ;
DbSchemarr; C
.rrC D
PORTALrrD J
)rrJ K
)rrK L
{ss 
}
�� 
resp
�� 
=
�� 
updatedRecords
�� !
*
��" #
-
��$ %
$num
��% &
>
��' (
$num
��) *
;
��* +
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� $
DeleteLeaveEntitlement
��  6
(
��6 7/
!DeleteEmployeeLeaveEntitlementReq
��7 X/
!deleteEmployeeLeaveEntitlementReq
��Y z
)
��z {
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
CreateConnection
��* :
(
��: ;
DbSchema
��; C
.
��C D
PORTAL
��D J
)
��J K
)
��K L
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% E
,
��E F/
!deleteEmployeeLeaveEntitlementReq
��G h
.
��h i)
EmployeeLeaveEntitlementId��i �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2/
!deleteEmployeeLeaveEntitlementReq
��3 T
.
��T U
	UpdatedBy
��U ^
,
��^ _
dbType
��` f
:
��f g
OracleMappingType
��h y
.
��y z
Int32
��z 
,�� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5/
!deleteEmployeeLeaveEntitlementReq
��6 W
.
��W X
EmployeeSlno
��X d
,
��d e
dbType
��f l
:
��l m
OracleMappingType
��n 
.�� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R)
SP_DELETE_LEAVE_ENTITLEMENT
��R m
,
��m n

parameters
��o y
,
��y z
commandType��{ �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
}
�� 
resp
�� 
=
�� 
updatedRecords
�� !
*
��" #
-
��$ %
$num
��% &
>
��' (
$num
��) *
;
��* +
return
�� 
resp
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\8-Database\LeaveManagement\LeaveManagementRepository.cs
	namespace 	
Phoenix
 
. 
Database 
. 

Repository %
.% &
LeaveManagement& 5
{   
public!! 

class!! %
LeaveManagementRepository!! *
:!!+ ,
BaseRepository!!- ;
{"" 
private## 
readonly## 
IConfiguration## '

;##5 6
private$$ 
readonly$$ 
ILoggerManager$$ '
logger$$( .
;$$. /
private%% 
readonly%% 
IDistributedCache%% *

redisCache%%+ 5
;%%5 6
public&& %
LeaveManagementRepository&& (
(&&( )
IConfiguration&&) 7

,&&E F
ILoggerManager&&G U
logger&&V \
)&&\ ]
:&&^ _
base&&` d
(&&d e

)&&r s
{'' 	
this(( 
.(( 

=((  

;((. /
this)) 
.)) 
logger)) 
=)) 
logger))  
;))  !
}** 	
public++ 
async++ 
Task++ 
<++ 
List++ 
<++ 
LeaveDetail++ *
>++* +
>+++ ,
GetEmployeeLeaves++- >
(++> ?
int++? B
employeeSlno++C O
,++O P
int++Q T
statusId++U ]
)++] ^
{,, 	
List-- 
<-- 
LeaveDetail-- 
>-- 
employeeLeaves-- ,
=--- .
null--/ 3
;--3 4

Dictionary.. 
<.. 
string.. 
,.. 
DateTime.. '
>..' (
payrollDates..) 5
=..6 7
await..8 =
GetPayrollDates..> M
(..M N
DateTime..N V
...V W
Now..W Z
)..Z [
;..[ \
using// 
(// 
var// 

connection// !
=//" #
await//$ )
base//* .
.//. /
CreateConnection/// ?
(//? @
DbSchema//@ H
.//H I
PORTAL//I O
)//O P
)//P Q
{00 
OracleDynamicParameters11 '

parameters11( 2
=113 4
new115 8#
OracleDynamicParameters119 P
(11P Q
)11Q R
;11R S

parameters22 
.22 
Add22 
(22 
name22 #
:22# $
$str22% 4
,224 5
employeeSlno226 B
,22B C
dbType22D J
:22J K
OracleMappingType22L ]
.22] ^
Int3222^ c
,22c d
	direction22e n
:22n o
ParameterDirection	22p �
.
22� �
Input
22� �
)
22� �
;
22� �

parameters33 
.33 
Add33 
(33 
name33 #
:33# $
$str33% 7
,337 8
statusId339 A
,33A B
dbType33C I
:33I J
OracleMappingType33K \
.33\ ]
Int3233] b
,33b c
	direction33d m
:33m n
ParameterDirection	33o �
.
33� �
Input
33� �
)
33� �
;
33� �

parameters44 
.44 
Add44 
(44 
name44 #
:44# $
$str44% .
,44. /
dbType440 6
:446 7
OracleMappingType448 I
.44I J
	RefCursor44J S
,44S T
	direction44U ^
:44^ _
ParameterDirection44` r
.44r s
Output44s y
)44y z
;44z {

parameters55 
.55 
Add55 
(55 
name55 #
:55# $
$str55% /
,55/ 0
dbType551 7
:557 8
OracleMappingType559 J
.55J K
	RefCursor55K T
,55T U
	direction55V _
:55_ `
ParameterDirection55a s
.55s t
Output55t z
)55z {
;55{ |
var66 
results66 
=66 
await66 #

connection66$ .
.66. /
QueryMultipleAsync66/ A
(66A B
DatabaseProcedures66B T
.66T U$
SP_GET_EMP_LEAVE_DETAILS66U m
,66m n

parameters66o y
,66y z
commandType	66{ �
:
66� �
CommandType
66� �
.
66� �
StoredProcedure
66� �
)
66� �
;
66� �
employeeLeaves77 
=77  
results77! (
.77( )
Read77) -
<77- .
LeaveDetail77. 9
>779 :
(77: ;
)77; <
.77< =
ToList77= C
(77C D
)77D E
;77E F
var88 
leaveWorkFlows88 "
=88# $
results88% ,
.88, -
Read88- 1
<881 2

>88? @
(88@ A
)88A B
.88B C
ToList88C I
(88I J
)88J K
;88K L
foreach:: 
(:: 
var:: 
item:: !
in::" $
employeeLeaves::% 3
)::3 4
{;; 
item<< 
.<< 
LeaveWorkFlows<< '
=<<( )
leaveWorkFlows<<* 8
.<<8 9
Where<<9 >
(<<> ?
x<<? @
=><<A C
x<<D E
.<<E F
LeaveId<<F M
==<<N P
item<<Q U
.<<U V
LeaveId<<V ]
)<<] ^
.<<^ _
ToList<<_ e
(<<e f
)<<f g
;<<g h
item== 
.== 
EnableDelete== %
===& '
item==( ,
.==, -
	LeaveFrom==- 6
>===7 9
payrollDates==: F
[==F G
$str==G R
]==R S
?==T U
true==V Z
:==[ \
false==] b
;==b c
if>> 
(>> 
item>> 
.>> 

==>>+ -
LeaveStatusNames>>. >
.>>> ?
PendingForApproval>>? Q
.>>Q R
ToInt32OrDefault>>R b
(>>b c
)>>c d
)>>d e
{?? 
item@@ 
.@@ 
EnableDelete@@ )
=@@* +
true@@, 0
;@@0 1
}AA 
elseBB 
{CC 
itemDD 
.DD 
EnableDeleteDD )
=DD* +
falseDD, 1
;DD1 2
}EE 
}FF 
}HH 
returnII 
employeeLeavesII !
;II! "
}JJ 	
publicKK 
asyncKK 
TaskKK 
<KK 
ListKK 
<KK 
LeaveDetailKK *
>KK* +
>KK+ ,
GetEmployeeLeavesKK- >
(KK> ?

leaveRequestKKM Y
,KKY Z
DateTimeKK[ c
	startDateKKd m
,KKm n
DateTimeKKo w
endDateKKx 
)	KK �
{LL 	
ListNN 
<NN 
LeaveDetailNN 
>NN 
	empLeavesNN '
=NN( )
nullNN* .
;NN. /
usingOO 
(OO 
varOO 

connectionOO !
=OO" #
awaitOO$ )
baseOO* .
.OO. /
CreateConnectionOO/ ?
(OO? @
DbSchemaOO@ H
.OOH I
PORTALOOI O
)OOO P
)OOP Q
{PP 
OracleDynamicParametersQQ '

parametersQQ( 2
=QQ3 4
newQQ5 8#
OracleDynamicParametersQQ9 P
(QQP Q
)QQQ R
;QQR S

parametersRR 
.RR 
AddRR 
(RR 
nameRR #
:RR# $
$strRR% 4
,RR4 5
leaveRequestRR6 B
.RRB C
EmployeeSlnoRRC O
,RRO P
dbTypeRRQ W
:RRW X
OracleMappingTypeRRY j
.RRj k
Int32RRk p
,RRp q
	directionRRr {
:RR{ |
ParameterDirection	RR} �
.
RR� �
Input
RR� �
)
RR� �
;
RR� �

parametersSS 
.SS 
AddSS 
(SS 
nameSS #
:SS# $
$strSS% 2
,SS2 3
	startDateSS4 =
,SS= >
dbTypeSS? E
:SSE F
OracleMappingTypeSSG X
.SSX Y
DateSSY ]
,SS] ^
	directionSS_ h
:SSh i
ParameterDirectionSSj |
.SS| }
Input	SS} �
)
SS� �
;
SS� �

parametersTT 
.TT 
AddTT 
(TT 
nameTT #
:TT# $
$strTT% 0
,TT0 1
endDateTT2 9
,TT9 :
dbTypeTT; A
:TTA B
OracleMappingTypeTTC T
.TTT U
DateTTU Y
,TTY Z
	directionTT[ d
:TTd e
ParameterDirectionTTf x
.TTx y
InputTTy ~
)TT~ 
;	TT �

parametersUU 
.UU 
AddUU 
(UU 
nameUU #
:UU# $
$strUU% 8
,UU8 9
leaveRequestUU: F
.UUF G
FromDateUUG O
,UUO P
dbTypeUUQ W
:UUW X
OracleMappingTypeUUY j
.UUj k
DateUUk o
,UUo p
	directionUUq z
:UUz {
ParameterDirection	UU| �
.
UU� �
Input
UU� �
)
UU� �
;
UU� �

parametersVV 
.VV 
AddVV 
(VV 
nameVV #
:VV# $
$strVV% 6
,VV6 7
leaveRequestVV8 D
.VVD E
ToDateVVE K
,VVK L
dbTypeVVM S
:VVS T
OracleMappingTypeVVU f
.VVf g
DateVVg k
,VVk l
	directionVVm v
:VVv w
ParameterDirection	VVx �
.
VV� �
Input
VV� �
)
VV� �
;
VV� �

parametersWW 
.WW 
AddWW 
(WW 
nameWW #
:WW# $
$strWW% .
,WW. /
dbTypeWW0 6
:WW6 7
OracleMappingTypeWW8 I
.WWI J
	RefCursorWWJ S
,WWS T
	directionWWU ^
:WW^ _
ParameterDirectionWW` r
.WWr s
OutputWWs y
)WWy z
;WWz {
	empLeavesXX 
=XX 
(XX 
awaitXX "

connectionXX# -
.XX- .

QueryAsyncXX. 8
<XX8 9
LeaveDetailXX9 D
>XXD E
(XXE F
DatabaseProceduresXXF X
.XXX Y"
SP_GET_EMPLOYEE_LEAVESXXY o
,XXo p

parametersXXq {
,XX{ |
commandType	XX} �
:
XX� �
CommandType
XX� �
.
XX� �
StoredProcedure
XX� �
)
XX� �
)
XX� �
.
XX� �
ToList
XX� �
(
XX� �
)
XX� �
;
XX� �
	empLeavesYY 
=YY 
	empLeavesYY %
.YY% &
OrderByDescendingYY& 7
(YY7 8
xYY8 9
=>YY: <
xYY= >
.YY> ?
	LeaveFromYY? H
)YYH I
.YYI J
ToListYYJ P
(YYP Q
)YYQ R
;YYR S
}ZZ 
return[[ 
	empLeaves[[ 
;[[ 
}\\ 	
public^^ 
async^^ 
Task^^ 
<^^ !
EmpLeavePolicyDetails^^ /
>^^/ 0!
GetEmpLeavesbyLeaveId^^1 F
(^^F G
int^^G J
leaveId^^K R
)^^R S
{__ 	!
EmpLeavePolicyDetailsaa !!
empLeavePolicyDetailsaa" 7
=aa8 9
nullaa: >
;aa> ?
usingbb 
(bb 
varbb 

connectionbb !
=bb" #
awaitbb$ )
basebb* .
.bb. /
CreateConnectionbb/ ?
(bb? @
DbSchemabb@ H
.bbH I
PORTALbbI O
)bbO P
)bbP Q
{cc 
OracleDynamicParametersdd '

parametersdd( 2
=dd3 4
newdd5 8#
OracleDynamicParametersdd9 P
(ddP Q
)ddQ R
;ddR S

parametersee 
.ee 
Addee 
(ee 
nameee #
:ee# $
$stree% 0
,ee0 1
leaveIdee2 9
,ee9 :
dbTypeee; A
:eeA B
OracleMappingTypeeeC T
.eeT U
Int32eeU Z
,eeZ [
	directionee\ e
:eee f
ParameterDirectioneeg y
.eey z
Inputeez 
)	ee �
;
ee� �

parametersff 
.ff 
Addff 
(ff 
nameff #
:ff# $
$strff% .
,ff. /
dbTypeff0 6
:ff6 7
OracleMappingTypeff8 I
.ffI J
	RefCursorffJ S
,ffS T
	directionffU ^
:ff^ _
ParameterDirectionff` r
.ffr s
Outputffs y
)ffy z
;ffz {!
empLeavePolicyDetailsgg %
=gg& '
awaitgg( -

connectiongg. 8
.gg8 9
QueryFirstAsyncgg9 H
<ggH I!
EmpLeavePolicyDetailsggI ^
>gg^ _
(gg_ `
DatabaseProceduresgg` r
.ggr s"
SP_LEAVE_DETAILS_BYID	ggs �
,
gg� �

parameters
gg� �
,
gg� �
commandType
gg� �
:
gg� �
CommandType
gg� �
.
gg� �
StoredProcedure
gg� �
)
gg� �
;
gg� �
}hh 
returnii !
empLeavePolicyDetailsii (
;ii( )
}jj 	
publicll 
asyncll 
Taskll 
<ll 
Listll 
<ll 
LeaveDetailll *
>ll* +
>ll+ ,(
GetEmployeeLeavesByLeaveTypell- I
(llI J
intllJ M
employeeSlnollN Z
,llZ [
DateTimell\ d
?lld e
	startDatellf o
,llo p
DateTimellq y
?lly z
endDate	ll{ �
,
ll� �
int
ll� �
leaveTypeId
ll� �
)
ll� �
{mm 	
Listnn 
<nn 
LeaveDetailnn 
>nn 
	empLeavesnn '
=nn( )
nullnn* .
;nn. /
usingoo 
(oo 
varoo 

connectionoo !
=oo" #
awaitoo$ )
baseoo* .
.oo. /
CreateConnectionoo/ ?
(oo? @
DbSchemaoo@ H
.ooH I
PORTALooI O
)ooO P
)ooP Q
{pp 
OracleDynamicParametersqq '

parametersqq( 2
=qq3 4
newqq5 8#
OracleDynamicParametersqq9 P
(qqP Q
)qqQ R
;qqR S

parametersrr 
.rr 
Addrr 
(rr 
namerr #
:rr# $
$strrr% 4
,rr4 5
employeeSlnorr6 B
,rrB C
dbTyperrD J
:rrJ K
OracleMappingTyperrL ]
.rr] ^
Int32rr^ c
,rrc d
	directionrre n
:rrn o
ParameterDirection	rrp �
.
rr� �
Input
rr� �
)
rr� �
;
rr� �

parametersss 
.ss 
Addss 
(ss 
namess #
:ss# $
$strss% 2
,ss2 3
	startDatess4 =
,ss= >
dbTypess? E
:ssE F
OracleMappingTypessG X
.ssX Y
DatessY ]
,ss] ^
	directionss_ h
:ssh i
ParameterDirectionssj |
.ss| }
Input	ss} �
)
ss� �
;
ss� �

parameterstt 
.tt 
Addtt 
(tt 
namett #
:tt# $
$strtt% 0
,tt0 1
endDatett2 9
,tt9 :
dbTypett; A
:ttA B
OracleMappingTypettC T
.ttT U
DatettU Y
,ttY Z
	directiontt[ d
:ttd e
ParameterDirectionttf x
.ttx y
Inputtty ~
)tt~ 
;	tt �

parametersuu 
.uu 
Adduu 
(uu 
nameuu #
:uu# $
$struu% 5
,uu5 6
leaveTypeIduu7 B
,uuB C
dbTypeuuD J
:uuJ K
OracleMappingTypeuuL ]
.uu] ^
Int32uu^ c
,uuc d
	directionuue n
:uun o
ParameterDirection	uup �
.
uu� �
Input
uu� �
)
uu� �
;
uu� �

parametersvv 
.vv 
Addvv 
(vv 
namevv #
:vv# $
$strvv% .
,vv. /
dbTypevv0 6
:vv6 7
OracleMappingTypevv8 I
.vvI J
	RefCursorvvJ S
,vvS T
	directionvvU ^
:vv^ _
ParameterDirectionvv` r
.vvr s
Outputvvs y
)vvy z
;vvz {
	empLeavesww 
=ww 
(ww 
awaitww "

connectionww# -
.ww- .

QueryAsyncww. 8
<ww8 9
LeaveDetailww9 D
>wwD E
(wwE F
DatabaseProcedureswwF X
.wwX Y%
SP_GET_EMP_LEAVES_BY_TYPEwwY r
,wwr s

parameterswwt ~
,ww~ 
commandType
ww� �
:
ww� �
CommandType
ww� �
.
ww� �
StoredProcedure
ww� �
)
ww� �
)
ww� �
.
ww� �
ToList
ww� �
(
ww� �
)
ww� �
;
ww� �
	empLeavesxx 
=xx 
	empLeavesxx %
.xx% &
OrderByDescendingxx& 7
(xx7 8
xxx8 9
=>xx: <
xxx= >
.xx> ?
	LeaveFromxx? H
)xxH I
.xxI J
ToListxxJ P
(xxP Q
)xxQ R
;xxR S
}yy 
returnzz 
	empLeaveszz 
;zz 
}{{ 	
public|| 
async|| 
Task|| 
<|| 
List|| 
<|| 
EmpLeaveBalance|| .
>||. /
>||/ 0#
GetEmployeeLeaveBalance||1 H
(||H I
int||I L
employeeSlno||M Y
)||Y Z
{}} 	
List~~ 
<~~ 
EmpLeaveBalance~~  
>~~  !
empLeaveBalance~~" 1
=~~2 3
null~~4 8
;~~8 9
using 
( 
var 

connection !
=" #
await$ )
base* .
.. /
CreateConnection/ ?
(? @
DbSchema@ H
.H I
PORTALI O
)O P
)P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
empLeaveBalance
�� 
=
��  !
(
��" #
await
��# (

connection
��) 3
.
��3 4

QueryAsync
��4 >
<
��> ?
EmpLeaveBalance
��? N
>
��N O
(
��O P 
DatabaseProcedures
��P b
.
��b c'
SP_GET_EMP_LEAVES_BALANCE
��c |
,
��| }

parameters��~ �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
string
�� 
gender
�� 
=
�� 
await
�� !
GetEmpGender
��" .
(
��. /
employeeSlno
��/ ;
)
��; <
;
��< =
bool
�� 
	isMarried
�� 
=
�� 
await
�� "#
CheckForMaritalStatus
��# 8
(
��8 9
employeeSlno
��9 E
)
��E F
;
��F G
empLeaveBalance
�� 
=
�� 
empLeaveBalance
�� -
.
��- .
Where
��. 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
LeaveTypeId
��; F
!=
��G I
LeaveTypeNames
��J X
.
��X Y
ON_DUTY
��Y `
.
��` a
ToInt32OrDefault
��a q
(
��q r
)
��r s
)
��s t
.
��t u
ToList
��u {
(
��{ |
)
��| }
;
��} ~
if
�� 
(
�� 
	isMarried
�� 
)
�� 
{
�� 
empLeaveBalance
�� 
=
��  !
empLeaveBalance
��" 1
.
��1 2
Where
��2 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
LeaveTypeId
��? J
!=
��K M
LeaveTypeNames
��N \
.
��\ ]
MARRIAGE_LEAVE
��] k
.
��k l
ToInt32OrDefault
��l |
(
��| }
)
��} ~
)
��~ 
.�� �
ToList��� �
(��� �
)��� �
;��� �
bool
�� 
hasChildren
��  
=
��! "
await
��# (
CheckForChildren
��) 9
(
��9 :
employeeSlno
��: F
)
��F G
;
��G H
if
�� 
(
�� 
hasChildren
�� 
)
��  
{
�� 
if
�� 
(
�� 
gender
�� 
==
�� !
$str
��" %
)
��% &
{
�� 
empLeaveBalance
�� '
=
��( )
empLeaveBalance
��* 9
.
��9 :
Where
��: ?
(
��? @
x
��@ A
=>
��B D
(
��E F
x
��F G
.
��G H
LeaveTypeId
��H S
!=
��T V
LeaveTypeNames
��W e
.
��e f
MATERNITY_LEAVE
��f u
.
��u v
ToInt32OrDefault��v �
(��� �
)��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
else
�� 
if
�� 
(
�� 
gender
�� #
==
��$ &
$str
��' *
)
��* +
{
�� 
empLeaveBalance
�� '
=
��( )
empLeaveBalance
��* 9
.
��9 :
Where
��: ?
(
��? @
x
��@ A
=>
��B D
(
��E F
x
��F G
.
��G H
LeaveTypeId
��H S
!=
��T V
LeaveTypeNames
��W e
.
��e f
PATERNITY_LEAVE
��f u
.
��u v
ToInt32OrDefault��v �
(��� �
)��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 
empLeaveBalance
�� 
=
��  !
empLeaveBalance
��" 1
.
��1 2
Where
��2 7
(
��7 8
x
��8 9
=>
��: <
(
��= >
x
��> ?
.
��? @
LeaveTypeId
��@ K
!=
��L N
LeaveTypeNames
��O ]
.
��] ^
PATERNITY_LEAVE
��^ m
.
��m n
ToInt32OrDefault
��n ~
(
��~ 
)�� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
empLeaveBalance
�� 
=
��  !
empLeaveBalance
��" 1
.
��1 2
Where
��2 7
(
��7 8
x
��8 9
=>
��: <
(
��= >
x
��> ?
.
��? @
LeaveTypeId
��@ K
!=
��L N
LeaveTypeNames
��O ]
.
��] ^
MATERNITY_LEAVE
��^ m
.
��m n
ToInt32OrDefault
��n ~
(
��~ 
)�� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
empLeaveBalance
�� 
=
�� 
empLeaveBalance
�� -
.
��- .
Where
��. 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
ShowInDashboard
��; J
==
��K M
$num
��N O
)
��O P
.
��P Q
ToList
��Q W
(
��W X
)
��X Y
;
��Y Z
return
�� 
empLeaveBalance
�� "
;
��" #
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  #
CheckForMaritalStatus
��! 6
(
��6 7
int
��7 :
employeeSlno
��; G
)
��G H
{
�� 	
int
�� 

�� 
=
�� 
$num
��  !
;
��! "
bool
�� 
	isMarried
�� 
=
�� 
false
�� "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
dbType
��3 9
:
��9 :
OracleMappingType
��; L
.
��L M
Int32
��M R
,
��R S
	direction
��T ]
:
��] ^ 
ParameterDirection
��_ q
.
��q r
Output
��r x
)
��x y
;
��y z
await
�� 

connection
��  
.
��  !
ExecuteAsync
��! -
(
��- . 
DatabaseProcedures
��. @
.
��@ A%
SP_CHECK_MARITAL_STATUS
��A X
,
��X Y

parameters
��Z d
,
��d e
commandType
��f q
:
��q r
CommandType
��s ~
.
��~ 
StoredProcedure�� �
)��� �
;��� �

�� 
=
�� 

parameters
��  *
.
��* +
Get
��+ .
<
��. /
int
��/ 2
>
��2 3
(
��3 4
$str
��4 @
)
��@ A
;
��A B
}
�� 
	isMarried
�� 
=
�� 

�� %
>
��& '
$num
��( )
;
��) *
return
�� 
	isMarried
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
CheckForChildren
��! 1
(
��1 2
int
��2 5
employeeSlno
��6 B
)
��B C
{
�� 	
int
�� 

childCount
�� 
=
�� 
$num
�� 
;
�� 
bool
�� 
hasChildren
�� 
=
�� 
false
�� $
;
��$ %
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
dbType
��4 :
:
��: ;
OracleMappingType
��< M
.
��M N
Int32
��N S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
await
�� 

connection
��  
.
��  !
ExecuteAsync
��! -
(
��- . 
DatabaseProcedures
��. @
.
��@ A#
SP_CHECK_HAS_CHILDREN
��A V
,
��V W

parameters
��X b
,
��b c
commandType
��d o
:
��o p
CommandType
��q |
.
��| }
StoredProcedure��} �
)��� �
;��� �

childCount
�� 
=
�� 

parameters
�� '
.
��' (
Get
��( +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
$str
��1 >
)
��> ?
;
��? @
}
�� 
hasChildren
�� 
=
�� 

childCount
�� $
>=
��% '
$num
��( )
;
��) *
return
�� 
hasChildren
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
string
�� !
>
��! "
GetEmpGender
��# /
(
��/ 0
int
��0 3
employeeSlno
��4 @
)
��@ A
{
�� 	
string
�� 
gender
�� 
=
�� 
null
��  
;
��  !
string
�� 
getGenderQuery
�� !
=
��" #
$str
��$ y
;
��y z
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
string
�� 
query
�� 
=
�� 
string
�� %
.
��% &
Format
��& ,
(
��, -
getGenderQuery
��- ;
,
��; <
employeeSlno
��= I
)
��I J
;
��J K
gender
�� 
=
�� 
await
�� 

connection
�� )
.
��) *&
QueryFirstOrDefaultAsync
��* B
<
��B C
string
��C I
>
��I J
(
��J K
query
��K P
)
��P Q
;
��Q R
}
�� 
return
�� 
gender
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� '
UpdateEmployeeLeaveStatus
��  9
(
��9 :
LeaveDetail
��: E
leaveDetail
��F Q
)
��Q R
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
try
�� 
{
�� 
using
�� 
(
�� 
var
�� 

connection
�� %
=
��& '
await
��( -
base
��. 2
.
��2 3
CreateConnection
��3 C
(
��C D
DbSchema
��D L
.
��L M
PORTAL
��M S
)
��S T
)
��T U
{
�� %
OracleDynamicParameters
�� +
param
��, 1
=
��2 3
new
��4 7
(
��7 8
)
��8 9
;
��9 :
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
leaveDetail
��0 ;
.
��; <
LeaveId
��< C
,
��C D
dbType
��E K
:
��K L
OracleMappingType
��M ^
.
��^ _
Int32
��_ d
,
��d e
	direction
��f o
:
��o p!
ParameterDirection��q �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 5
,
��5 6
leaveDetail
��7 B
.
��B C

��C P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Int32
��l q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 4
,
��4 5
leaveDetail
��6 A
.
��A B
EmployeeSlno
��B N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 7
,
��7 8
leaveDetail
��9 D
.
��D E
WorkFlowTypeId
��E S
,
��S T
dbType
��U [
:
��[ \
OracleMappingType
��] n
.
��n o
Int32
��o t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 3
,
��3 4
leaveDetail
��5 @
.
��@ A

StepTypeId
��A K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Int32
��g l
,
��l m
	direction
��n w
:
��w x!
ParameterDirection��y �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ 5
,
��5 6
leaveDetail
��7 B
.
��B C
StepMasterId
��C O
,
��O P
dbType
��Q W
:
��W X
OracleMappingType
��Y j
.
��j k
Int32
��k p
,
��p q
	direction
��r {
:
��{ |!
ParameterDirection��} �
.��� �
Input��� �
)��� �
;��� �
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� "
:
��" #
$str
��$ .
,
��. /
leaveDetail
��0 ;
.
��; <
ApprovedRemarks
��< K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Varchar2
��g o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �
updatedRecords
�� "
=
��# $
await
��% *

connection
��+ 5
.
��5 6
ExecuteAsync
��6 B
(
��B C 
DatabaseProcedures
��C U
.
��U V$
PROCESS_LEAVE_WORKFLOW
��V l
,
��l m
param
��n s
,
��s t
commandType��u �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
resp
�� 
=
�� 
(
�� 
updatedRecords
�� *
*
��+ ,
-
��- .
$num
��. /
)
��/ 0
>
��1 2
$num
��3 4
;
��4 5
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� /
!UpdateMultipleEmployeeLeaveStatus
��  A
(
��A B2
$UpdateMultipleEmployeeLeaveStatusReq
��B f
empLeaveDetails
��g v
)
��v w
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
int
�� 
updatedRecords
�� 
=
��  
$num
��! "
;
��" #
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8
(
��8 9
)
��9 :
;
��: ;

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
empLeaveDetails
��1 @
.
��@ A
LeaveId
��A H
.
��H I
ToArray
��I P
(
��P Q
)
��Q R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Int32
��n s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
,��� �
empLeaveDetails��� �
.��� �
LeaveId��� �
.��� �
Count��� �
,��� �
collectionType
�� 
:
�� )
OracleMappingCollectionType
��  ;
.
��; <#
PLSQLAssociativeArray
��< Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 6
,
��6 7
empLeaveDetails
��8 G
.
��G H

��H U
,
��U V
dbType
��W ]
:
��] ^
OracleMappingType
��_ p
.
��p q
Int32
��q v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
empLeaveDetails
��4 C
.
��C D

ApprovedBy
��D N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Int32
��j o
,
��o p
	direction
��q z
:
��z {!
ParameterDirection��| �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% /
,
��/ 0
empLeaveDetails
��1 @
.
��@ A
ApprovedRemarks
��A P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Varchar2
��l t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 7
,
��7 8
dbType
��9 ?
:
��? @
OracleMappingType
��A R
.
��R S
Int32
��S X
,
��X Y
	direction
��Z c
:
��c d 
ParameterDirection
��e w
.
��w x
Output
��x ~
)
��~ 
;�� �
updatedRecords
�� 
=
��  
await
��! &

connection
��' 1
.
��1 2
ExecuteAsync
��2 >
(
��> ? 
DatabaseProcedures
��? Q
.
��Q R!
PROCESS_LEAVE_BY_HR
��R e
,
��e f

parameters
��g q
,
��q r
commandType
��s ~
:
��~ 
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
int
�� 
rowsUpdated
�� 
=
��  !

parameters
��" ,
.
��, -
Get
��- 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
$str
��6 H
)
��H I
;
��I J
}
�� 
resp
�� 
=
�� 
(
�� 
(
�� 
updatedRecords
�� #
*
��$ %
-
��& '
$num
��' (
)
��( )
>
��* +
$num
��, -
)
��- .
;
��. /
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
CancelLeave
��  +
(
��+ ,
int
��, /
leaveId
��0 7
)
��7 8
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '
param
��( -
=
��. /
new
��0 3
(
��3 4
)
��4 5
;
��5 6
param
�� 
.
�� 
Add
�� 
(
�� 
name
�� 
:
�� 
$str
��  *
,
��* +
leaveId
��, 3
,
��3 4
dbType
��5 ;
:
��; <
OracleMappingType
��= N
.
��N O
Int32
��O T
,
��T U
	direction
��V _
:
��_ ` 
ParameterDirection
��a s
.
��s t
Input
��t y
)
��y z
;
��z {
int
�� 
updatedRecords
�� "
=
��# $
await
��% *

connection
��+ 5
.
��5 6
ExecuteAsync
��6 B
(
��B C 
DatabaseProcedures
��C U
.
��U V#
CANCEL_EMPLOYEE_LEAVE
��V k
,
��k l
param
��m r
,
��r s
commandType
��t 
:�� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
resp
�� 
=
�� 
(
�� 
updatedRecords
�� &
*
��' (
-
��) *
$num
��* +
)
��+ ,
>
��- .
$num
��/ 0
;
��0 1
}
�� 
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� *
>
��* +
SaveEmployeeLeave
��, =
(
��= >

��> K
leaveRequest
��L X
)
��X Y
{
�� 	
bool
�� 
isSaved
�� 
=
�� 
false
��  
;
��  !
EmpLeaveResponse
�� 
response
�� %
=
��& '
null
��( ,
;
��, -
double
�� 
	totalDays
�� 
=
�� 
$num
�� "
;
��" #
List
�� 
<
�� 
DateTime
�� 
>
�� 

dateRanges
�� %
=
��& '
null
��( ,
;
��, -
List
�� 
<
�� 
DateTime
�� 
>
�� 
leaveAppliedDates
�� ,
=
��- .
null
��/ 3
;
��3 4
List
�� 
<
�� 
DateTime
�� 
>
�� 
publicHolidays
�� )
=
��* +
null
��, 0
;
��0 1
List
�� 
<
�� 
DateTime
�� 
>
�� 
holidayDates
�� '
=
��( )
null
��* .
;
��. /
List
�� 
<
�� 
DateTime
�� 
>
�� 

leaveDates
�� %
=
��& '
null
��( ,
;
��, -
DateTime
�� $
payrollPeriodStartDate
�� +
=
��, -
DateTime
��. 6
.
��6 7
Now
��7 :
;
��: ;
DateTime
�� "
payrollPeriodEndDate
�� )
=
��* +
DateTime
��, 4
.
��4 5
Now
��5 8
;
��8 9

dateRanges
�� 
=
�� 
leaveRequest
�� %
.
��% &
FromDate
��& .
.
��. /
GetDateRange
��/ ;
(
��; <
leaveRequest
��< H
.
��H I
ToDate
��I O
)
��O P
.
��P Q
ToList
��Q W
(
��W X
)
��X Y
;
��Y Z
if
�� 
(
�� 

dateRanges
�� 
.
�� 
Count
��  
>
��! "
$num
��# $
)
��$ %
{
�� 
leaveAppliedDates
�� !
=
��" #

dateRanges
��$ .
;
��. /
}
�� 
publicHolidays
�� 
=
�� 
await
�� "%
GetOrganizationHolidays
��# :
(
��: ;
leaveRequest
��; G
.
��G H
EmployeeSlno
��H T
,
��T U
leaveRequest
��V b
.
��b c
FromDate
��c k
)
��k l
;
��l m
holidayDates
�� 
=
�� 
publicHolidays
�� )
.
��) *
Where
��* /
(
��/ 0
x
��0 1
=>
��2 4
x
��5 6
.
��6 7
Date
��7 ;
>=
��< >
leaveRequest
��? K
.
��K L
FromDate
��L T
&&
��U W
x
��X Y
.
��Y Z
Date
��Z ^
<=
��_ a
leaveRequest
��b n
.
��n o
ToDate
��o u
)
��u v
.
��v w
ToList
��w }
(
��} ~
)
��~ 
;�� �
LeaveTypeNames
�� 
	leaveType
�� $
=
��% &
(
��' (
LeaveTypeNames
��( 6
)
��6 7
leaveRequest
��7 C
.
��C D
	LeaveType
��D M
.
��M N
LeaveTypeId
��N Y
;
��Y Z
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '
IsWeekEndHoliDays
��' 8
==
��9 ;
false
��< A
)
��A B
{
�� 
leaveAppliedDates
�� !
.
��! "
	RemoveAll
��" +
(
��+ ,
x
��, -
=>
��. 0
holidayDates
��1 =
.
��= >
Contains
��> F
(
��F G
x
��G H
.
��H I
Date
��I M
)
��M N
)
��N O
;
��O P
}
�� 
leaveAppliedDates
�� 
=
�� 
leaveAppliedDates
��  1
.
��1 2
OrderBy
��2 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A
Date
��A E
)
��E F
.
��F G
ToList
��G M
(
��M N
)
��N O
;
��O P

leaveDates
�� 
=
�� 
leaveAppliedDates
�� *
;
��* +
if
�� 
(
�� 

leaveDates
�� 
.
�� 
Count
��  
>
��! "
$num
��# $
)
��$ %
{
�� 
	totalDays
�� 
=
�� 

leaveDates
�� &
.
��& '
Count
��' ,
;
��, -
if
�� 
(
�� 

leaveDates
�� 
.
�� 
Count
�� $
>
��% &
$num
��' (
&&
��) +
(
��, -
leaveRequest
��- 9
.
��9 :
FromDateDayTypeId
��: K
==
��L N
LeaveDayTypeNames
��O `
.
��` a

SecondHalf
��a k
.
��k l
ToInt32OrDefault
��l |
(
��| }
)
��} ~
)
��~ 
)�� �
{
�� 
	totalDays
�� 
=
�� 
	totalDays
��  )
-
��* +
$num
��, /
;
��/ 0
}
�� 
if
�� 
(
�� 

leaveDates
�� 
.
�� 
Count
�� $
>
��% &
$num
��' (
&&
��) +
(
��, -
leaveRequest
��- 9
.
��9 :
ToDateDayTypeId
��: I
==
��J L
LeaveDayTypeNames
��M ^
.
��^ _
	FirstHalf
��_ h
.
��h i
ToInt32OrDefault
��i y
(
��y z
)
��z {
)
��{ |
)
��| }
{
�� 
	totalDays
�� 
=
�� 
	totalDays
��  )
-
��* +
$num
��, /
;
��/ 0
}
�� 
if
�� 
(
�� 

leaveDates
�� 
.
�� 
Count
�� $
==
��% '
$num
��( )
&&
��* ,
leaveRequest
��- 9
.
��9 :
	LeaveType
��: C
.
��C D
CanApplyHalfDay
��D S
&&
��T V
leaveRequest
��W c
.
��c d
FromDateDayTypeId
��d u
!=
��v x 
LeaveDayTypeNames��y �
.��� �
FullDay��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
{
�� 
	totalDays
�� 
=
�� 
	totalDays
��  )
-
��* +
$num
��, /
;
��/ 0
}
�� 
}
�� 

Dictionary
�� 
<
�� 
string
�� 
,
�� 
DateTime
�� '
>
��' (
payrollDates
��) 5
=
��6 7
await
��8 =
GetPayrollDates
��> M
(
��M N
leaveRequest
��N Z
.
��Z [
FromDate
��[ c
)
��c d
;
��d e$
payrollPeriodStartDate
�� "
=
��# $
payrollDates
��% 1
[
��1 2
$str
��2 =
]
��= >
;
��> ?"
payrollPeriodEndDate
��  
=
��! "
payrollDates
��# /
[
��/ 0
$str
��0 9
]
��9 :
;
��: ;
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '
LeaveTypeId
��' 2
==
��3 5
LeaveTypeNames
��6 D
.
��D E
ON_DUTY
��E L
.
��L M
ToInt32OrDefault
��M ]
(
��] ^
)
��^ _
)
��_ `
{
�� 
ApplyingFor
�� 
applyingFor
�� '
=
��( )
(
��* +
ApplyingFor
��+ 6
)
��6 7
leaveRequest
��7 C
.
��C D
ApplyingFor
��D O
;
��O P
switch
�� 
(
�� 
applyingFor
�� #
)
��# $
{
�� 
case
�� 
ApplyingFor
�� $
.
��$ %
Self
��% )
:
��) *
leaveRequest
�� $
.
��$ %
SelectedEmployees
��% 6
=
��7 8
new
��9 <
List
��= A
<
��A B
int
��B E
>
��E F
(
��F G
)
��G H
;
��H I
leaveRequest
�� $
.
��$ %
SelectedEmployees
��% 6
.
��6 7
Add
��7 :
(
��: ;
leaveRequest
��; G
.
��G H
EmployeeSlno
��H T
)
��T U
;
��U V
break
�� 
;
�� 
}
�� 
List
�� 
<
�� 
LeaveDetail
��  
>
��  !

��" /
=
��0 1
await
��2 7
GetEmployeeLeaves
��8 I
(
��I J
leaveRequest
��J V
,
��V W$
payrollPeriodStartDate
��X n
,
��n o#
payrollPeriodEndDate��p �
)��� �
;��� �
response
�� 
=
�� (
CheckForOverLappingPeriods
�� 5
(
��5 6

leaveDates
��6 @
,
��@ A
leaveRequest
��B N
,
��N O

��P ]
)
��] ^
;
��^ _
if
�� 
(
�� 
!
�� 
response
�� 
.
�� 
Response
�� &
)
��& '
{
�� 
return
�� 
response
�� #
;
��# $
}
�� 
isSaved
�� 
=
�� 
await
�� 
ApplyOnDuty
��  +
(
��+ ,

leaveDates
��, 6
,
��6 7
	totalDays
��8 A
,
��A B
leaveRequest
��C O
.
��O P
SelectedEmployees
��P a
,
��a b
leaveRequest
��c o
.
��o p
EmployeeSlno
��p |
,
��| }
leaveRequest��~ �
)��� �
;��� �
if
�� 
(
�� 
isSaved
�� 
)
�� 
{
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
{
�� 
Response
��  
=
��! "
true
��# '
,
��' (
Message
�� 
=
��  !
$str
��" O
}
�� 
;
�� 
}
�� 
}
�� 
else
�� 
{
�� 
List
�� 
<
�� 
EmpLeaveBalance
�� $
>
��$ %

��& 3
=
��4 5
await
��6 ;%
GetEmployeeLeaveBalance
��< S
(
��S T
leaveRequest
��T `
.
��` a
EmployeeSlno
��a m
)
��m n
;
��n o
EmpLeaveBalance
�� "
employeeLeaveBalance
��  4
=
��5 6

��7 D
.
��D E
Where
��E J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
LeaveTypeId
��R ]
==
��^ `
leaveRequest
��a m
.
��m n
	LeaveType
��n w
.
��w x
LeaveTypeId��x �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
if
�� 
(
�� "
employeeLeaveBalance
�� (
!=
��) +
null
��, 0
&&
��1 3"
employeeLeaveBalance
��4 H
.
��H I#
AvailableLeaveBalance
��I ^
<
��_ `
	totalDays
��a j
)
��j k
{
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
{
�� 
Response
��  
=
��! "
false
��# (
,
��( )
Message
�� 
=
��  !
$str
��" O
}
�� 
;
�� 
return
�� 
response
�� #
;
��# $
}
�� 
List
�� 
<
�� 
LeaveDetail
��  
>
��  !

��" /
=
��0 1
await
��2 7
GetEmployeeLeaves
��8 I
(
��I J
leaveRequest
��J V
,
��V W$
payrollPeriodStartDate
��X n
,
��n o#
payrollPeriodEndDate��p �
)��� �
;��� �
response
�� 
=
�� (
CheckForOverLappingPeriods
�� 5
(
��5 6
leaveAppliedDates
��6 G
,
��G H
leaveRequest
��I U
,
��U V

��W d
)
��d e
;
��e f
if
�� 
(
�� 
!
�� 
response
�� 
.
�� 
Response
�� &
)
��& '
{
�� 
return
�� 
response
�� #
;
��# $
}
�� 
response
�� 
=
�� 
await
��  #
ValidateLeavePolicies
��! 6
(
��6 7

leaveDates
��7 A
,
��A B
leaveRequest
��C O
,
��O P
	totalDays
��Q Z
,
��Z [$
payrollPeriodStartDate
��\ r
,
��r s#
payrollPeriodEndDate��t �
)��� �
;��� �
if
�� 
(
�� 
response
�� 
.
�� 
Response
�� %
&&
��& (
	totalDays
��) 2
>
��3 4
$num
��5 6
)
��6 7
{
�� 
await
�� 
	LeaveSave
�� #
(
��# $
leaveRequest
��$ 0
,
��0 1
	totalDays
��2 ;
,
��; <
holidayDates
��= I
,
��I J

leaveDates
��K U
,
��U V
leaveAppliedDates
��W h
)
��h i
;
��i j
}
�� 
else
�� 
{
�� 
return
�� 
response
�� #
;
��# $
}
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 

Dictionary
�� %
<
��% &
string
��& ,
,
��, -
DateTime
��. 6
>
��6 7
>
��7 8
GetPayrollDates
��9 H
(
��H I
DateTime
��I Q
fromDate
��R Z
)
��Z [
{
�� 	

�� 

�� '
=
��( )
null
��* .
;
��. /

Dictionary
�� 
<
�� 
string
�� 
,
�� 
DateTime
�� '
>
��' (
payrollDates
��) 5
=
��6 7
new
��8 ;

Dictionary
��< F
<
��F G
string
��G M
,
��M N
DateTime
��O W
>
��W X
(
��X Y
)
��Y Z
;
��Z [
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '%
PayrollPeriodRepository
��( ?
(
��? @
this
��@ D
.
��D E

��E R
)
��R S
)
��S T
{
�� 
payrollDates
�� 
=
�� 
await
�� $

connection
��% /
.
��/ 0
GetPayrollDates
��0 ?
(
��? @
fromDate
��@ H
)
��H I
;
��I J
if
�� 
(
�� 

�� !
!=
��" $
null
��% )
)
��) *
{
�� 
payrollDates
��  
.
��  !
Add
��! $
(
��$ %
$str
��% 0
,
��0 1

��2 ?
.
��? @
FromDate
��@ H
)
��H I
;
��I J
payrollDates
��  
.
��  !
Add
��! $
(
��$ %
$str
��% .
,
��. /

��0 =
.
��= >
ToDate
��> D
)
��D E
;
��E F
}
�� 
}
�� 
return
�� 
payrollDates
�� 
;
��  
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
LeaveDetail
�� *
>
��* +
>
��+ ,"
GetLeavesForApproval
��- A
(
��A B
int
��B E
employeeSlno
��F R
)
��R S
{
�� 	
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
employeeList
�� *
=
��+ ,
null
��- 1
;
��1 2
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 7
,
��7 8
LeaveStatusNames
��9 I
.
��I J 
PendingForApproval
��J \
.
��\ ]
ToInt32OrDefault
��] m
(
��m n
)
��n o
,
��o p
dbType
��q w
:
��w x 
OracleMappingType��y �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
employeeList
�� 
=
�� 
(
��  
await
��  %

connection
��& 0
.
��0 1

QueryAsync
��1 ;
<
��; <
LeaveDetail
��< G
>
��G H
(
��H I 
DatabaseProcedures
��I [
.
��[ \%
GET_LEAVES_FOR_APPROVAL
��\ s
,
��s t

parameters
��u 
,�� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
foreach
�� 
(
�� 
var
�� 
item
�� 
in
��  
employeeList
��! -
)
��- .
{
�� 
string
�� 
[
�� 
]
�� 

imagesPath
�� #
=
��$ %
null
��& *
;
��* +

�� 
	imagePath
�� '
=
��( )
new
��* -

��. ;
(
��; <
)
��< =
;
��= >

imagesPath
�� 
=
�� 
item
�� !
.
��! "
	PhotoPath
��" +
.
��+ ,
Split
��, 1
(
��1 2
$char
��2 5
)
��5 6
;
��6 7
	imagePath
�� 
.
�� 
AppendFormat
�� &
(
��& '
$str
��' 7
,
��7 8!
ApplicationSettings
��9 L
.
��L M
Current
��M T
.
��T U
ProfilePath
��U `
,
��` a

imagesPath
��b l
[
��l m
$num
��m n
]
��n o
)
��o p
;
��p q
item
�� 
.
�� 
	PhotoPath
�� 
=
��  
	imagePath
��! *
.
��* +
ToString
��+ 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
return
�� 
employeeList
�� 
;
��  
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
GetTeamLeavesData
�� 0
>
��0 1
>
��1 2
GetMyTeamLeaves
��3 B
(
��B C!
LeaveSearchCriteria
��C V
searchCriteria
��W e
)
��e f
{
�� 	
List
�� 
<
�� 
GetTeamLeavesData
�� "
>
��" #
employeeList
��$ 0
=
��1 2
null
��3 7
;
��7 8
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
searchCriteria
��6 D
.
��D E
EmployeeSlno
��E Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Int32
��m r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
searchCriteria
��3 A
.
��A B
FromDate
��B J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Date
��f j
,
��j k
	direction
��l u
:
��u v!
ParameterDirection��w �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
searchCriteria
��2 @
.
��@ A
ToDate
��A G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Date
��c g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
employeeList
�� 
=
�� 
(
��  
await
��  %

connection
��& 0
.
��0 1

QueryAsync
��1 ;
<
��; <
GetTeamLeavesData
��< M
>
��M N
(
��N O 
DatabaseProcedures
��O a
.
��a b
GET_TEAM_LEAVES
��b q
,
��q r

parameters
��s }
,
��} ~
commandType�� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
employeeList
�� 
;
��  
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� "
GetTeamEmpLeavesData
�� 3
>
��3 4
>
��4 5%
GetMyTeamEmployeeLeaves
��6 M
(
��M N!
LeaveSearchCriteria
��N a
searchCriteria
��b p
)
��p q
{
�� 	
List
�� 
<
�� "
GetTeamEmpLeavesData
�� %
>
��% &
	leaveList
��' 0
=
��1 2
null
��3 7
;
��7 8
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
searchCriteria
��6 D
.
��D E
EmployeeSlno
��E Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Int32
��m r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 1
,
��1 2
searchCriteria
��3 A
.
��A B
FromDate
��B J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Date
��f j
,
��j k
	direction
��l u
:
��u v!
ParameterDirection��w �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
searchCriteria
��2 @
.
��@ A
ToDate
��A G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Date
��c g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
	leaveList
�� 
=
�� 
(
�� 
await
�� "

connection
��# -
.
��- .

QueryAsync
��. 8
<
��8 9"
GetTeamEmpLeavesData
��9 M
>
��M N
(
��N O 
DatabaseProcedures
��O a
.
��a b!
GET_TEAM_EMP_LEAVES
��b u
,
��u v

parameters��w �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
	leaveList
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
LeaveDetail
�� *
>
��* +
>
��+ ,&
GetManagerApprovalLeaves
��- E
(
��E F
int
��F I
employeeSlno
��J V
)
��V W
{
�� 	
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
	empLeaves
�� '
=
��( )
null
��* .
;
��. /
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
	empLeaves
�� 
=
�� 
(
�� 
await
�� "

connection
��# -
.
��- .

QueryAsync
��. 8
<
��8 9
LeaveDetail
��9 D
>
��D E
(
��E F 
DatabaseProcedures
��F X
.
��X Y,
SP_GET_MNGR_APRVL_LEAVE_RECENT
��Y w
,
��w x

parameters��y �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
	empLeaves
�� 
=
�� 
	empLeaves
�� %
.
��% &
OrderByDescending
��& 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
	LeaveFrom
��? H
)
��H I
.
��I J
ToList
��J P
(
��P Q
)
��Q R
;
��R S
}
�� 
return
�� 
	empLeaves
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
ApplyOnDuty
��  +
(
��+ ,
List
��, 0
<
��0 1
DateTime
��1 9
>
��9 :

��; H
,
��H I
double
��J P
	totalDays
��Q Z
,
��Z [
List
��\ `
<
��` a
int
��a d
>
��d e
selectedEmployees
��f w
,
��w x
int
��y |!
reportingManagerId��} �
,��� �

leaveRequest��� �
)��� �
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
bool
�� 
isSaveWorkFlow
�� 
=
��  !
false
��" '
;
��' (
int
�� 
savedRecords
�� 
=
�� 
$num
��  
;
��  !%
OracleDynamicParameters
�� #

parameters
��$ .
=
��/ 0
null
��1 5
;
��5 6
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
base
��4 8
.
��8 9
CreateConnection
��9 I
(
��I J
DbSchema
��J R
.
��R S
PORTAL
��S Y
)
��Y Z
)
��Z [
{
�� 
using
�� 
(
�� 
var
�� 
tran
�� 
=
��  !

connection
��" ,
.
��, -
BeginTransaction
��- =
(
��= >
)
��> ?
)
��? @
{
�� 
foreach
�� 
(
�� 
int
��  
employeeSlno
��! -
in
��. 0
selectedEmployees
��1 B
)
��B C
{
�� 

parameters
�� "
=
��# $
new
��% (%
OracleDynamicParameters
��) @
(
��@ A
)
��A B
;
��B C

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- M
,
��M N
leaveRequest
��O [
.
��[ \
	LeaveType
��\ e
.
��e f

��f s
,
��s t
dbType
��u {
:
��{ | 
OracleMappingType��} �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
employeeSlno
��> J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Int32
��f k
,
��k l
	direction
��m v
:
��v w!
ParameterDirection��x �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ?
,
��? @
leaveRequest
��A M
.
��M N
FromDate
��N V
,
��V W
dbType
��X ^
:
��^ _
OracleMappingType
��` q
.
��q r
Date
��r v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
leaveRequest
��? K
.
��K L
ToDate
��L R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Date
��n r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
leaveRequest
��? K
.
��K L
	LeaveType
��L U
.
��U V
LeaveTypeId
��V a
,
��a b
dbType
��c i
:
��i j
OracleMappingType
��k |
.
��| }
Int32��} �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 7
,
��7 8
leaveRequest
��9 E
.
��E F
Remarks
��F M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- A
,
��A B
leaveRequest
��C O
.
��O P
FromDateDayTypeId
��P a
,
��a b
dbType
��c i
:
��i j
OracleMappingType
��k |
.
��| }
Int32��} �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- @
,
��@ A
	totalDays
��B K
,
��K L
dbType
��M S
:
��S T
OracleMappingType
��U f
.
��f g
Decimal
��g n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- E
,
��E F
$num
��G H
,
��H I
dbType
��J P
:
��P Q
OracleMappingType
��R c
.
��c d
Int32
��d i
,
��i j
	direction
��k t
:
��t u!
ParameterDirection��v �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
$num
��@ A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- A
,
��A B
$num
��C D
,
��D E
dbType
��F L
:
��L M
OracleMappingType
��N _
.
��_ `
Int32
��` e
,
��e f
	direction
��g p
:
��p q!
ParameterDirection��r �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ?
,
��? @
leaveRequest
��A M
.
��M N
ApplyingFor
��N Y
==
��Z \
ApplyingFor
��] h
.
��h i
Self
��i m
.
��m n
ToInt32OrDefault
��n ~
(
��~ 
)�� �
?��� � 
LeaveStatusNames��� �
.��� �"
PendingForApproval��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
:��� � 
LeaveStatusNames��� �
.��� �
Approved��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- E
,
��E F
leaveRequest
��G S
.
��S T
FromDateDayTypeId
��T e
,
��e f
dbType
��g m
:
��m n 
OracleMappingType��o �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- C
,
��C D
leaveRequest
��E Q
.
��Q R
ToDateDayTypeId
��R a
,
��a b
dbType
��c i
:
��i j
OracleMappingType
��k |
.
��| }
Int32��} �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ;
,
��; <
Guid
��= A
.
��A B
NewGuid
��B I
(
��I J
)
��J K
.
��K L
ToString
��L T
(
��T U
)
��U V
,
��V W
dbType
��X ^
:
��^ _
OracleMappingType
��` q
.
��q r
Varchar2
��r z
,
��z {
	direction��| �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
leaveRequest
��? K
.
��K L
CompOffDate
��L W
,
��W X
dbType
��Y _
:
��_ `
OracleMappingType
��a r
.
��r s
Date
��s w
,
��w x
	direction��y �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- A
,
��A B
leaveRequest
��C O
.
��O P
RatificationTime
��P `
,
��` a
dbType
��b h
:
��h i
OracleMappingType
��j {
.
��{ |
Int32��| �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ?
,
��? @
leaveRequest
��A M
.
��M N
LeaveTypeReason
��N ]
==
��^ `
null
��a e
?
��f g
null
��h l
:
��m n
leaveRequest
��o {
.
��{ |
LeaveTypeReason��| �
.��� �
ReasonId��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- A
,
��A B
dbType
��C I
:
��I J
OracleMappingType
��K \
.
��\ ]
Int32
��] b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Output��� �
)��� �
;��� �
savedRecords
�� $
+=
��% '
await
��( -

connection
��. 8
.
��8 9
ExecuteAsync
��9 E
(
��E F 
DatabaseProcedures
��F X
.
��X Y
INSERT_EMP_LEAVE
��Y i
,
��i j

parameters
��k u
,
��u v
commandType��w �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
var
�� 
parentId
�� $
=
��% &

parameters
��' 1
.
��1 2
Get
��2 5
<
��5 6
int
��6 9
>
��9 :
(
��: ;
$str
��; O
)
��O P
;
��P Q
List
�� 
<
�� 
EmpLeaveDetails
�� ,
>
��, -
empLeaveDetails
��. =
=
��> ?
new
��@ C
List
��D H
<
��H I
EmpLeaveDetails
��I X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
EmpLeaveDetails
�� '
empLeaveData
��( 4
=
��5 6
new
��7 :
EmpLeaveDetails
��; J
(
��J K
)
��K L
;
��L M
int
�� 
rowIndex
�� $
=
��% &
$num
��' (
;
��( )
foreach
�� 
(
��  !
DateTime
��! )

onDutyDate
��* 4
in
��5 7

��8 E
)
��E F
{
�� 
empLeaveData
�� (
=
��) *
new
��+ .
EmpLeaveDetails
��/ >
(
��> ?
)
��? @
;
��@ A
empLeaveData
�� (
.
��( )
EmployeeLeaveId
��) 8
=
��9 :
parentId
��; C
;
��C D
empLeaveData
�� (
.
��( )

RowVersion
��) 3
=
��4 5
Guid
��6 :
.
��: ;
NewGuid
��; B
(
��B C
)
��C D
.
��D E
ToString
��E M
(
��M N
)
��N O
;
��O P
empLeaveData
�� (
.
��( )
Remarks
��) 0
=
��1 2
leaveRequest
��3 ?
.
��? @
Remarks
��@ G
;
��G H
empLeaveData
�� (
.
��( )
EmployeeSlno
��) 5
=
��6 7
leaveRequest
��8 D
.
��D E
EmployeeSlno
��E Q
;
��Q R
empLeaveData
�� (
.
��( )
	LeaveDate
��) 2
=
��3 4

onDutyDate
��5 ?
;
��? @
empLeaveData
�� (
.
��( )
LeaveDayTypeId
��) 7
=
��8 9
rowIndex
��: B
==
��C E
$num
��F G
?
��H I
(
��J K
rowIndex
��K S
==
��T V
$num
��W X
?
��Y Z
leaveRequest
��[ g
.
��g h
FromDateDayTypeId
��h y
:
��z { 
LeaveDayTypeNames��| �
.��� �
FullDay��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
:��� �
(��� �
rowIndex��� �
==��� �

.��� �
Count��� �
?��� �
leaveRequest��� �
.��� �
ToDateDayTypeId��� �
:��� �!
LeaveDayTypeNames��� �
.��� �
FullDay��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
empLeaveData
�� (
.
��( )

��) 6
=
��7 8
LeaveStatusNames
��9 I
.
��I J 
PendingForApproval
��J \
.
��\ ]
ToInt32OrDefault
��] m
(
��m n
)
��n o
;
��o p
empLeaveDetails
�� +
.
��+ ,
Add
��, /
(
��/ 0
empLeaveData
��0 <
)
��< =
;
��= >
rowIndex
�� $
++
��$ &
;
��& '
}
�� 

parameters
�� "
=
��# $
new
��% (%
OracleDynamicParameters
��) @
(
��@ A
)
��A B
;
��B C
List
�� 
<
�� %
OracleDynamicParameters
�� 4
>
��4 5
param
��6 ;
=
��< =
new
��> A
(
��A B
)
��B C
;
��C D
List
�� 
<
�� 
int
��  
>
��  !
employeeIds
��" -
=
��. /
empLeaveDetails
��0 ?
.
��? @
Select
��@ F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
EmployeeSlno
��N Z
)
��Z [
.
��[ \
ToList
��\ b
(
��b c
)
��c d
;
��d e
List
�� 
<
�� 
int
��  
>
��  !
employeeLeaveId
��" 1
=
��2 3
empLeaveDetails
��4 C
.
��C D
Select
��D J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
EmployeeLeaveId
��R a
)
��a b
.
��b c
ToList
��c i
(
��i j
)
��j k
;
��k l
List
�� 
<
�� 
DateTime
�� %
>
��% & 
employeeLeaveDates
��' 9
=
��: ;
empLeaveDetails
��< K
.
��K L
Select
��L R
(
��R S
x
��S T
=>
��U W
x
��X Y
.
��Y Z
	LeaveDate
��Z c
)
��c d
.
��d e
ToList
��e k
(
��k l
)
��l m
;
��m n
List
�� 
<
�� 
int
��  
>
��  !
leaveDayTypeIds
��" 1
=
��2 3
empLeaveDetails
��4 C
.
��C D
Select
��D J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
LeaveDayTypeId
��R `
)
��` a
.
��a b
ToList
��b h
(
��h i
)
��i j
;
��j k
List
�� 
<
�� 
int
��  
>
��  !
leaveStatusIds
��" 0
=
��1 2
empLeaveDetails
��3 B
.
��B C
Select
��C I
(
��I J
x
��J K
=>
��L N
x
��O P
.
��P Q

��Q ^
)
��^ _
.
��_ `
ToList
��` f
(
��f g
)
��g h
;
��h i
List
�� 
<
�� 
string
�� #
>
��# $
remarks
��% ,
=
��- .
empLeaveDetails
��/ >
.
��> ?
Select
��? E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
Remarks
��M T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
List
�� 
<
�� 
string
�� #
>
��# $
rowVersions
��% 0
=
��1 2
empLeaveDetails
��3 B
.
��B C
Select
��C I
(
��I J
x
��J K
=>
��L N
x
��O P
.
��P Q

RowVersion
��Q [
)
��[ \
.
��\ ]
ToList
��] c
(
��c d
)
��d e
;
��e f

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- <
,
��< =
employeeIds
��> I
.
��I J
ToArray
��J Q
(
��Q R
)
��R S
,
��S T
dbType
��U [
:
��[ \
OracleMappingType
��] n
.
��n o
Int32
��o t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
employeeIds��� �
.��� �
Count��� �
,��� �
collectionType
�� &
:
��& ')
OracleMappingCollectionType
��( C
.
��C D#
PLSQLAssociativeArray
��D Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ?
,
��? @
employeeLeaveId
��A P
.
��P Q
ToArray
��Q X
(
��X Y
)
��Y Z
,
��Z [
dbType
��\ b
:
��b c
OracleMappingType
��d u
.
��u v
Int32
��v {
,
��{ |
	direction��} �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
employeeLeaveId��� �
.��� �
Count��� �
,��� �
collectionType
�� &
:
��& ')
OracleMappingCollectionType
��( C
.
��C D#
PLSQLAssociativeArray
��D Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 9
,
��9 : 
employeeLeaveDates
��; M
.
��M N
ToArray
��N U
(
��U V
)
��V W
,
��W X
dbType
��Y _
:
��_ `
OracleMappingType
��a r
.
��r s
Date
��s w
,
��w x
	direction��y �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �"
employeeLeaveDates��� �
.��� �
Count��� �
,��� �
collectionType
�� &
:
��& ')
OracleMappingCollectionType
��( C
.
��C D#
PLSQLAssociativeArray
��D Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- >
,
��> ?
leaveDayTypeIds
��@ O
.
��O P
ToArray
��P W
(
��W X
)
��X Y
,
��Y Z
dbType
��[ a
:
��a b
OracleMappingType
��c t
.
��t u
Int32
��u z
,
��z {
	direction��| �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
leaveDayTypeIds��� �
.��� �
Count��� �
,��� �
collectionType
�� &
:
��& ')
OracleMappingCollectionType
��( C
.
��C D#
PLSQLAssociativeArray
��D Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- =
,
��= >
leaveStatusIds
��? M
.
��M N
ToArray
��N U
(
��U V
)
��V W
,
��W X
dbType
��Y _
:
��_ `
OracleMappingType
��a r
.
��r s
Int32
��s x
,
��x y
	direction��z �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
leaveStatusIds��� �
.��� �
Count��� �
,��� �
collectionType
�� &
:
��& ')
OracleMappingCollectionType
��( C
.
��C D#
PLSQLAssociativeArray
��D Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- 7
,
��7 8
remarks
��9 @
.
��@ A
ToArray
��A H
(
��H I
)
��I J
,
��J K
dbType
��L R
:
��R S
OracleMappingType
��T e
.
��e f
Varchar2
��f n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
,��� �
remarks��� �
.��� �
Count��� �
,��� �
collectionType
�� &
:
��& ')
OracleMappingCollectionType
��( C
.
��C D#
PLSQLAssociativeArray
��D Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- :
,
��: ;
rowVersions
��< G
.
��G H
ToArray
��H O
(
��O P
)
��P Q
,
��Q R
dbType
��S Y
:
��Y Z
OracleMappingType
��[ l
.
��l m
Varchar2
��m u
,
��u v
	direction��w �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
rowVersions��� �
.��� �
Count��� �
,��� �
collectionType
�� &
:
��& ')
OracleMappingCollectionType
��( C
.
��C D#
PLSQLAssociativeArray
��D Y
)
��Y Z
;
��Z [

parameters
�� "
.
��" #
Add
��# &
(
��& '
name
��' +
:
��+ ,
$str
��- ?
,
��? @
dbType
��A G
:
��G H
OracleMappingType
��I Z
.
��Z [
Int32
��[ `
,
��` a
	direction
��b k
:
��k l 
ParameterDirection
��m 
.�� �
Output��� �
)��� �
;��� �
int
�� 
updatedRecords
�� *
=
��+ ,
await
��- 2

connection
��3 =
.
��= >
ExecuteAsync
��> J
(
��J K 
DatabaseProcedures
��K ]
.
��] ^&
INSERT_EMP_LEAVE_DETAILS
��^ v
,
��v w

parameters��x �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
int
�� 
rowsUpdated
�� '
=
��( )

parameters
��* 4
.
��4 5
Get
��5 8
<
��8 9
int
��9 <
>
��< =
(
��= >
$str
��> P
)
��P Q
;
��Q R
savedRecords
�� $
=
��% &
savedRecords
��' 3
+
��4 5
rowsUpdated
��6 A
;
��A B
using
�� 
(
�� +
WorkFlowInformationRepository
�� <

repository
��= G
=
��H I
new
��J M+
WorkFlowInformationRepository
��N k
(
��k l

connection
��l v
,
��v w
this
��x |
.
��| }

)��� �
)��� �
{
�� 
isSaveWorkFlow
�� *
=
��+ ,
await
��- 2

repository
��3 =
.
��= >#
InitiateLeaveWorkFlow
��> S
(
��S T
leaveRequest
��T `
.
��` a
EmployeeSlno
��a m
,
��m n
parentId
��o w
,
��w x
leaveRequest��y �
)��� �
;��� �
}
�� 
}
�� 
tran
�� 
.
�� 
Commit
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 
return
�� 
resp
�� 
=
�� 
(
�� 
savedRecords
�� '
*
��( )
-
��* +
$num
��+ ,
)
��, -
>
��. /
$num
��0 1
;
��1 2
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
LeaveDetail
��  +
>
��+ ,
>
��, -.
 GetEmployeeLeavesBeforeStartDate
��. N
(
��N O
int
��O R
employeeSlno
��S _
,
��_ `
DateTime
��a i
leaveStartDate
��j x
)
��x y
{
�� 	
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
	empLeaves
�� '
=
��( )
null
��* .
;
��. /
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
leaveStartDate
��4 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Date
��^ b
,
��b c
	direction
��d m
:
��m n!
ParameterDirection��o �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
	empLeaves
�� 
=
�� 
(
�� 
await
�� "

connection
��# -
.
��- .

QueryAsync
��. 8
<
��8 9
LeaveDetail
��9 D
>
��D E
(
��E F 
DatabaseProcedures
��F X
.
��X Y)
SP_GET_EMP_LEAVES_BF_STDATE
��Y t
,
��t u

parameters��v �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
	empLeaves
�� 
=
�� 
	empLeaves
�� %
.
��% &
OrderByDescending
��& 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
	LeaveFrom
��? H
)
��H I
.
��I J
ToList
��J P
(
��P Q
)
��Q R
;
��R S
}
�� 
return
�� 
	empLeaves
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
LeaveDetail
��  +
>
��+ ,
>
��, -+
GetEmployeeLeavesAfterEndDate
��. K
(
��K L
int
��L O
employeeSlno
��P \
,
��\ ]
DateTime
��^ f
leaveEndDate
��g s
)
��s t
{
�� 	
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
	empLeaves
�� '
=
��( )
null
��* .
;
��. /
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 0
,
��0 1
leaveEndDate
��2 >
,
��> ?
dbType
��@ F
:
��F G
OracleMappingType
��H Y
.
��Y Z
Date
��Z ^
,
��^ _
	direction
��` i
:
��i j 
ParameterDirection
��k }
.
��} ~
Input��~ �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% .
,
��. /
dbType
��0 6
:
��6 7
OracleMappingType
��8 I
.
��I J
	RefCursor
��J S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
	empLeaves
�� 
=
�� 
(
�� 
await
�� "

connection
��# -
.
��- .

QueryAsync
��. 8
<
��8 9
LeaveDetail
��9 D
>
��D E
(
��E F 
DatabaseProcedures
��F X
.
��X Y)
SP_GET_EMP_LEAVES_AF_TODATE
��Y t
,
��t u

parameters��v �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
	empLeaves
�� 
=
�� 
	empLeaves
�� %
.
��% &
OrderByDescending
��& 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
	LeaveFrom
��? H
)
��H I
.
��I J
ToList
��J P
(
��P Q
)
��Q R
;
��R S
}
�� 
return
�� 
	empLeaves
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
	LeaveSave
��! *
(
��* +

��+ 8
leaveRequest
��9 E
,
��E F
double
��G M
	totalDays
��N W
,
��W X
List
��Y ]
<
��] ^
DateTime
��^ f
>
��f g
holidayDates
��h t
,
��t u
List
��v z
<
��z {
DateTime��{ �
>��� �

leaveDates��� �
,��� �
List��� �
<��� �
DateTime��� �
>��� �!
leaveAppliedDates��� �
)��� �
{
�� 	
bool
�� 
resp
�� 
=
�� 
false
�� 
;
�� 
bool
�� 
isSaveWorkFlow
�� 
=
��  !
false
��" '
;
��' (
int
�� 
savedRecords
�� 
=
�� 
$num
��  
;
��  !
int
�� 
EmailsavedRecords
�� !
=
��" #
$num
��$ %
;
��% &%
OracleDynamicParameters
�� #

parameters
��$ .
=
��/ 0
null
��1 5
;
��5 6
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
base
��4 8
.
��8 9
CreateConnection
��9 I
(
��I J
DbSchema
��J R
.
��R S
PORTAL
��S Y
)
��Y Z
)
��Z [
{
�� 
using
�� 
(
�� 
var
�� 
tran
�� 
=
��  !

connection
��" ,
.
��, -
BeginTransaction
��- =
(
��= >
)
��> ?
)
��? @
{
�� 

parameters
�� 
=
��  
new
��! $%
OracleDynamicParameters
��% <
(
��< =
)
��= >
;
��> ?

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) I
,
��I J
leaveRequest
��K W
.
��W X
	LeaveType
��X a
.
��a b

��b o
,
��o p
dbType
��q w
:
��w x 
OracleMappingType��y �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 8
,
��8 9
leaveRequest
��: F
.
��F G
EmployeeSlno
��G S
,
��S T
dbType
��U [
:
��[ \
OracleMappingType
��] n
.
��n o
Int32
��o t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) ;
,
��; <
leaveRequest
��= I
.
��I J
FromDate
��J R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Date
��n r
,
��r s
	direction
��t }
:
��} ~!
ParameterDirection�� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 9
,
��9 :
leaveRequest
��; G
.
��G H
ToDate
��H N
,
��N O
dbType
��P V
:
��V W
OracleMappingType
��X i
.
��i j
Date
��j n
,
��n o
	direction
��p y
:
��y z!
ParameterDirection��{ �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 9
,
��9 :
leaveRequest
��; G
.
��G H
	LeaveType
��H Q
.
��Q R
LeaveTypeId
��R ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Int32
��y ~
,
��~ 
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 3
,
��3 4
leaveRequest
��5 A
.
��A B
Remarks
��B I
,
��I J
dbType
��K Q
:
��Q R
OracleMappingType
��S d
.
��d e
Varchar2
��e m
,
��m n
	direction
��o x
:
��x y!
ParameterDirection��z �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) =
,
��= >
leaveRequest
��? K
.
��K L
FromDateDayTypeId
��L ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Int32
��y ~
,
��~ 
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) <
,
��< =
	totalDays
��> G
,
��G H
dbType
��I O
:
��O P
OracleMappingType
��Q b
.
��b c
Decimal
��c j
,
��j k
	direction
��l u
:
��u v!
ParameterDirection��w �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) A
,
��A B
$num
��C D
,
��D E
dbType
��F L
:
��L M
OracleMappingType
��N _
.
��_ `
Int32
��` e
,
��e f
	direction
��g p
:
��p q!
ParameterDirection��r �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) :
,
��: ;
$num
��< =
,
��= >
dbType
��? E
:
��E F
OracleMappingType
��G X
.
��X Y
Int32
��Y ^
,
��^ _
	direction
��` i
:
��i j 
ParameterDirection
��k }
.
��} ~
Input��~ �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) =
,
��= >
$num
��? @
,
��@ A
dbType
��B H
:
��H I
OracleMappingType
��J [
.
��[ \
Int32
��\ a
,
��a b
	direction
��c l
:
��l m!
ParameterDirection��n �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) A
,
��A B
leaveRequest
��C O
.
��O P
FromDateDayTypeId
��P a
,
��a b
dbType
��c i
:
��i j
OracleMappingType
��k |
.
��| }
Int32��} �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) ?
,
��? @
leaveRequest
��A M
.
��M N
ToDateDayTypeId
��N ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Int32
��y ~
,
��~ 
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) ;
,
��; <
LeaveStatusNames
��= M
.
��M N 
PendingForApproval
��N `
.
��` a
ToInt32OrDefault
��a q
(
��q r
)
��r s
,
��s t
dbType
��u {
:
��{ | 
OracleMappingType��} �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 7
,
��7 8
Guid
��9 =
.
��= >
NewGuid
��> E
(
��E F
)
��F G
.
��G H
ToString
��H P
(
��P Q
)
��Q R
,
��R S
dbType
��T Z
:
��Z [
OracleMappingType
��\ m
.
��m n
Varchar2
��n v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 9
,
��9 :
leaveRequest
��; G
.
��G H
CompOffDate
��H S
,
��S T
dbType
��U [
:
��[ \
OracleMappingType
��] n
.
��n o
Date
��o s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) =
,
��= >
leaveRequest
��? K
.
��K L
RatificationTime
��L \
,
��\ ]
dbType
��^ d
:
��d e
OracleMappingType
��f w
.
��w x
Int32
��x }
,
��} ~
	direction�� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) =
,
��= >
dbType
��? E
:
��E F
OracleMappingType
��G X
.
��X Y
Int32
��Y ^
,
��^ _
	direction
��` i
:
��i j 
ParameterDirection
��k }
.
��} ~
Output��~ �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) ;
,
��; <
leaveRequest
��= I
.
��I J
LeaveTypeReason
��J Y
==
��Z \
null
��] a
?
��b c
null
��d h
:
��i j
leaveRequest
��k w
.
��w x
LeaveTypeReason��x �
.��� �
ReasonId��� �
,��� �
dbType��� �
:��� �!
OracleMappingType��� �
.��� �
Int32��� �
,��� �
	direction��� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �
savedRecords
��  
=
��! "
await
��# (

connection
��) 3
.
��3 4
ExecuteAsync
��4 @
(
��@ A 
DatabaseProcedures
��A S
.
��S T
INSERT_EMP_LEAVE
��T d
,
��d e

parameters
��f p
,
��p q
commandType
��r }
:
��} ~
CommandType�� �
.��� �
StoredProcedure��� �
)��� �
;��� �
var
�� 
parentId
��  
=
��! "

parameters
��# -
.
��- .
Get
��. 1
<
��1 2
int
��2 5
>
��5 6
(
��6 7
$str
��7 K
)
��K L
;
��L M
List
�� 
<
�� 
EmpLeaveDetails
�� (
>
��( )
empLeaveDetails
��* 9
=
��: ;
new
��< ?
List
��@ D
<
��D E
EmpLeaveDetails
��E T
>
��T U
(
��U V
)
��V W
;
��W X
EmpLeaveDetails
�� #
empLeaveData
��$ 0
=
��1 2
new
��3 6
EmpLeaveDetails
��7 F
(
��F G
)
��G H
;
��H I
int
�� 
rowIndex
��  
=
��! "
$num
��# $
;
��$ %
foreach
�� 
(
�� 
var
��  
item
��! %
in
��& (

leaveDates
��) 3
)
��3 4
{
�� 
empLeaveData
�� $
=
��% &
new
��' *
EmpLeaveDetails
��+ :
(
��: ;
)
��; <
;
��< =
empLeaveData
�� $
.
��$ %
EmployeeLeaveId
��% 4
=
��5 6
parentId
��7 ?
;
��? @
empLeaveData
�� $
.
��$ %

RowVersion
��% /
=
��0 1
Guid
��2 6
.
��6 7
NewGuid
��7 >
(
��> ?
)
��? @
.
��@ A
ToString
��A I
(
��I J
)
��J K
;
��K L
empLeaveData
�� $
.
��$ %
Remarks
��% ,
=
��- .
leaveRequest
��/ ;
.
��; <
Remarks
��< C
;
��C D
empLeaveData
�� $
.
��$ %
EmployeeSlno
��% 1
=
��2 3
leaveRequest
��4 @
.
��@ A
EmployeeSlno
��A M
;
��M N
empLeaveData
�� $
.
��$ %
	LeaveDate
��% .
=
��/ 0
item
��1 5
;
��5 6
empLeaveData
�� $
.
��$ %
LeaveDayTypeId
��% 3
=
��4 5
GetDayTypeId
��6 B
(
��B C
rowIndex
��C K
,
��K L
leaveRequest
��M Y
,
��Y Z
leaveAppliedDates
��[ l
.
��l m
Count
��m r
)
��r s
;
��s t
empLeaveData
�� $
.
��$ %

��% 2
=
��3 4
LeaveStatusNames
��5 E
.
��E F 
PendingForApproval
��F X
.
��X Y
ToInt32OrDefault
��Y i
(
��i j
)
��j k
;
��k l
empLeaveDetails
�� '
.
��' (
Add
��( +
(
��+ ,
empLeaveData
��, 8
)
��8 9
;
��9 :
rowIndex
��  
++
��  "
;
��" #
}
�� 

parameters
�� 
=
��  
new
��! $%
OracleDynamicParameters
��% <
(
��< =
)
��= >
;
��> ?
List
�� 
<
�� %
OracleDynamicParameters
�� 0
>
��0 1
param
��2 7
=
��8 9
new
��: =
(
��= >
)
��> ?
;
��? @
List
�� 
<
�� 
int
�� 
>
�� 
employeeSlno
�� *
=
��+ ,
empLeaveDetails
��- <
.
��< =
Select
��= C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
EmployeeSlno
��K W
)
��W X
.
��X Y
ToList
��Y _
(
��_ `
)
��` a
;
��a b
List
�� 
<
�� 
int
�� 
>
�� 
employeeLeaveId
�� -
=
��. /
empLeaveDetails
��0 ?
.
��? @
Select
��@ F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
EmployeeLeaveId
��N ]
)
��] ^
.
��^ _
ToList
��_ e
(
��e f
)
��f g
;
��g h
List
�� 
<
�� 
DateTime
�� !
>
��! " 
employeeLeaveDates
��# 5
=
��6 7
empLeaveDetails
��8 G
.
��G H
Select
��H N
(
��N O
x
��O P
=>
��Q S
x
��T U
.
��U V
	LeaveDate
��V _
)
��_ `
.
��` a
ToList
��a g
(
��g h
)
��h i
;
��i j
List
�� 
<
�� 
int
�� 
>
�� 
leaveDayTypeIds
�� -
=
��. /
empLeaveDetails
��0 ?
.
��? @
Select
��@ F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
LeaveDayTypeId
��N \
)
��\ ]
.
��] ^
ToList
��^ d
(
��d e
)
��e f
;
��f g
List
�� 
<
�� 
int
�� 
>
�� 
leaveStatusIds
�� ,
=
��- .
empLeaveDetails
��/ >
.
��> ?
Select
��? E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M

��M Z
)
��Z [
.
��[ \
ToList
��\ b
(
��b c
)
��c d
;
��d e
List
�� 
<
�� 
string
�� 
>
��  
remarks
��! (
=
��) *
empLeaveDetails
��+ :
.
��: ;
Select
��; A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
Remarks
��I P
)
��P Q
.
��Q R
ToList
��R X
(
��X Y
)
��Y Z
;
��Z [
List
�� 
<
�� 
string
�� 
>
��  
rowVersions
��! ,
=
��- .
empLeaveDetails
��/ >
.
��> ?
Select
��? E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M

RowVersion
��M W
)
��W X
.
��X Y
ToList
��Y _
(
��_ `
)
��` a
;
��a b

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 8
,
��8 9
employeeSlno
��: F
.
��F G
ToArray
��G N
(
��N O
)
��O P
,
��P Q
dbType
��R X
:
��X Y
OracleMappingType
��Z k
.
��k l
Int32
��l q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
,��� �
employeeSlno��� �
.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) ;
,
��; <
employeeLeaveId
��= L
.
��L M
ToArray
��M T
(
��T U
)
��U V
,
��V W
dbType
��X ^
:
��^ _
OracleMappingType
��` q
.
��q r
Int32
��r w
,
��w x
	direction��y �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
employeeLeaveId��� �
.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 5
,
��5 6 
employeeLeaveDates
��7 I
.
��I J
ToArray
��J Q
(
��Q R
)
��R S
,
��S T
dbType
��U [
:
��[ \
OracleMappingType
��] n
.
��n o
Date
��o s
,
��s t
	direction
��u ~
:
��~ "
ParameterDirection��� �
.��� �
Input��� �
,��� �"
employeeLeaveDates��� �
.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) :
,
��: ;
leaveDayTypeIds
��< K
.
��K L
ToArray
��L S
(
��S T
)
��T U
,
��U V
dbType
��W ]
:
��] ^
OracleMappingType
��_ p
.
��p q
Int32
��q v
,
��v w
	direction��x �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
leaveDayTypeIds��� �
.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 9
,
��9 :
leaveStatusIds
��; I
.
��I J
ToArray
��J Q
(
��Q R
)
��R S
,
��S T
dbType
��U [
:
��[ \
OracleMappingType
��] n
.
��n o
Int32
��o t
,
��t u
	direction
��v 
:�� �"
ParameterDirection��� �
.��� �
Input��� �
,��� �
leaveStatusIds��� �
.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 3
,
��3 4
remarks
��5 <
.
��< =
ToArray
��= D
(
��D E
)
��E F
,
��F G
dbType
��H N
:
��N O
OracleMappingType
��P a
.
��a b
Varchar2
��b j
,
��j k
	direction
��l u
:
��u v!
ParameterDirection��w �
.��� �
Input��� �
,��� �
remarks��� �
.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) 6
,
��6 7
rowVersions
��8 C
.
��C D
ToArray
��D K
(
��K L
)
��L M
,
��M N
dbType
��O U
:
��U V
OracleMappingType
��W h
.
��h i
Varchar2
��i q
,
��q r
	direction
��s |
:
��| }!
ParameterDirection��~ �
.��� �
Input��� �
,��� �
rowVersions��� �
.��� �
Count��� �
,��� �
collectionType
�� "
:
��" #)
OracleMappingCollectionType
��$ ?
.
��? @#
PLSQLAssociativeArray
��@ U
)
��U V
;
��V W

parameters
�� 
.
�� 
Add
�� "
(
��" #
name
��# '
:
��' (
$str
��) ;
,
��; <
dbType
��= C
:
��C D
OracleMappingType
��E V
.
��V W
Int32
��W \
,
��\ ]
	direction
��^ g
:
��g h 
ParameterDirection
��i {
.
��{ |
Output��| �
)��� �
;��� �
int
�� 
updatedRecords
�� &
=
��' (
await
��) .

connection
��/ 9
.
��9 :
ExecuteAsync
��: F
(
��F G 
DatabaseProcedures
��G Y
.
��Y Z&
INSERT_EMP_LEAVE_DETAILS
��Z r
,
��r s

parameters
��t ~
,
��~ 
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
;��� �
int
�� 
rowsUpdated
�� #
=
��$ %

parameters
��& 0
.
��0 1
Get
��1 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
$str
��: L
)
��L M
;
��M N
savedRecords
��  
=
��! "
savedRecords
��# /
+
��0 1
rowsUpdated
��2 =
;
��= >
LeaveDetail
�� 

��  -
=
��. /
new
��0 3
LeaveDetail
��4 ?
(
��? @
)
��@ A
;
��A B

�� !
.
��! "
EmployeeSlno
��" .
=
��/ 0
leaveRequest
��1 =
.
��= >
EmployeeSlno
��> J
;
��J K

�� !
.
��! "
	LeaveFrom
��" +
=
��, -
leaveRequest
��. :
.
��: ;
FromDate
��; C
;
��C D

�� !
.
��! "
LeaveTo
��" )
=
��* +
leaveRequest
��, 8
.
��8 9
ToDate
��9 ?
;
��? @

�� !
.
��! "
LeaveTypeId
��" -
=
��. /
leaveRequest
��0 <
.
��< =
	LeaveType
��= F
.
��F G
LeaveTypeId
��G R
;
��R S

�� !
.
��! "
Remarks
��" )
=
��* +
leaveRequest
��, 8
.
��8 9
Remarks
��9 @
;
��@ A

�� !
.
��! "
FromDateDayTypeId
��" 3
=
��4 5
leaveRequest
��6 B
.
��B C
FromDateDayTypeId
��C T
;
��T U

�� !
.
��! "
StepMasterId
��" .
=
��/ 0
$num
��1 2
;
��2 3

�� !
.
��! "

��" /
=
��0 1
$num
��2 3
;
��3 4
if
�� 
(
�� 
leaveRequest
�� $
.
��$ %
	LeaveType
��% .
.
��. /
LeaveTypeId
��/ :
!=
��; =
Convert
��> E
.
��E F
ToInt32
��F M
(
��M N
LeaveTypeNames
��N \
.
��\ ]
ON_DUTY
��] d
)
��d e
)
��e f
{
�� 
await
�� "
UpdateConsumedLeaves
�� 2
(
��2 3

connection
��3 =
,
��= >
leaveRequest
��? K
,
��K L
	totalDays
��M V
)
��V W
;
��W X
}
�� 
using
�� 
(
�� +
WorkFlowInformationRepository
�� 8

repository
��9 C
=
��D E
new
��F I+
WorkFlowInformationRepository
��J g
(
��g h

connection
��h r
,
��r s
this
��t x
.
��x y

)��� �
)��� �
{
�� 
isSaveWorkFlow
�� &
=
��' (
await
��) .

repository
��/ 9
.
��9 :#
InitiateLeaveWorkFlow
��: O
(
��O P
leaveRequest
��P \
.
��\ ]
EmployeeSlno
��] i
,
��i j
parentId
��k s
,
��s t
leaveRequest��u �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
leaveRequest
�� $
.
��$ %
	LeaveType
��% .
.
��. / 
IsDocumentRequired
��/ A
)
��A B
{
�� 
await
�� 
UploadLeaveFile
�� -
(
��- .
leaveRequest
��. :
,
��: ;
parentId
��< D
,
��D E

connection
��F P
)
��P Q
;
��Q R
}
�� 
tran
�� 
.
�� 
Commit
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 
resp
�� 
=
�� 
(
�� 
(
�� 
savedRecords
�� !
*
��" #
-
��$ %
$num
��% &
)
��& '
>
��( )
$num
��* +
)
��+ ,
&&
��- /
isSaveWorkFlow
��0 >
;
��> ?
return
�� 
resp
�� 
;
�� 
}
�� 	
private
�� 
int
�� 
GetDayTypeId
��  
(
��  !
int
��! $
rowIndex
��% -
,
��- .

��/ <
leaveRequest
��= I
,
��I J
int
��K N
	totalDays
��O X
)
��X Y
{
�� 	
int
�� 
	dayTypeId
�� 
=
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
rowIndex
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
leaveRequest
��  
.
��  !
FromDateDayTypeId
��! 2
==
��3 5
LeaveDayTypeNames
��6 G
.
��G H
	FirstHalf
��H Q
.
��Q R
ToInt32OrDefault
��R b
(
��b c
)
��c d
)
��d e
{
�� 
if
�� 
(
�� 
	totalDays
�� !
>
��" #
$num
��$ %
)
��% &
{
�� 
	dayTypeId
�� !
=
��" #
LeaveDayTypeNames
��$ 5
.
��5 6
FullDay
��6 =
.
��= >
ToInt32OrDefault
��> N
(
��N O
)
��O P
;
��P Q
}
�� 
else
�� 
{
�� 
	dayTypeId
�� !
=
��" #
LeaveDayTypeNames
��$ 5
.
��5 6
	FirstHalf
��6 ?
.
��? @
ToInt32OrDefault
��@ P
(
��P Q
)
��Q R
;
��R S
}
�� 
}
�� 
else
�� 
if
�� 
(
�� 
leaveRequest
�� %
.
��% &
FromDateDayTypeId
��& 7
==
��8 :
LeaveDayTypeNames
��; L
.
��L M

SecondHalf
��M W
.
��W X
ToInt32OrDefault
��X h
(
��h i
)
��i j
)
��j k
{
�� 
	dayTypeId
�� 
=
�� 
LeaveDayTypeNames
��  1
.
��1 2

SecondHalf
��2 <
.
��< =
ToInt32OrDefault
��= M
(
��M N
)
��N O
;
��O P
}
�� 
}
�� 
if
�� 
(
�� 
(
�� 
rowIndex
�� 
+
�� 
$num
�� 
)
�� 
==
�� !
	totalDays
��" +
)
��+ ,
{
�� 
int
�� 
firstDayTypeId
�� "
=
��# $
leaveRequest
��% 1
.
��1 2
FromDateDayTypeId
��2 C
;
��C D
if
�� 
(
�� 
leaveRequest
��  
.
��  !
ToDateDayTypeId
��! 0
==
��1 3
LeaveDayTypeNames
��4 E
.
��E F
	FirstHalf
��F O
.
��O P
ToInt32OrDefault
��P `
(
��` a
)
��a b
)
��b c
{
�� 
	dayTypeId
�� 
=
�� 
LeaveDayTypeNames
��  1
.
��1 2
	FirstHalf
��2 ;
.
��; <
ToInt32OrDefault
��< L
(
��L M
)
��M N
;
��N O
}
�� 
else
�� 
if
�� 
(
�� 
leaveRequest
�� %
.
��% &
ToDateDayTypeId
��& 5
==
��6 8
LeaveDayTypeNames
��9 J
.
��J K

SecondHalf
��K U
.
��U V
ToInt32OrDefault
��V f
(
��f g
)
��g h
)
��h i
{
�� 
if
�� 
(
�� 
	totalDays
�� !
>
��" #
$num
��$ %
)
��% &
{
�� 
	dayTypeId
�� !
=
��" #
LeaveDayTypeNames
��$ 5
.
��5 6
FullDay
��6 =
.
��= >
ToInt32OrDefault
��> N
(
��N O
)
��O P
;
��P Q
}
�� 
else
�� 
{
�� 
	dayTypeId
�� !
=
��" #
LeaveDayTypeNames
��$ 5
.
��5 6

SecondHalf
��6 @
.
��@ A
ToInt32OrDefault
��A Q
(
��Q R
)
��R S
;
��S T
}
�� 
}
�� 
}
�� 
return
�� 
	dayTypeId
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� +
>
��+ ,#
ValidateLeavePolicies
��- B
(
��B C
List
��C G
<
��G H
DateTime
��H P
>
��P Q
leaveAppliedDates
��R c
,
��c d

��e r
leaveRequest
��s 
,�� �
double��� �
	totalDays��� �
,��� �
DateTime��� �&
payrollPeriodStartDate��� �
,��� �
DateTime��� �$
payrollPeriodEndDate��� �
)��� �
{
�� 	
LeaveTypeNames
�� 
	leaveType
�� $
=
��% &
(
��' (
LeaveTypeNames
��( 6
)
��6 7
leaveRequest
��7 C
.
��C D
	LeaveType
��D M
.
��M N
LeaveTypeId
��N Y
;
��Y Z
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 

�� +
=
��, -
await
��. 3
GetEmployeeLeaves
��4 E
(
��E F
leaveRequest
��F R
,
��R S$
payrollPeriodStartDate
��T j
,
��j k#
payrollPeriodEndDate��l �
)��� �
;��� �
EmpLeaveResponse
�� 
response
�� %
=
��& '(
CheckForOverLappingPeriods
��( B
(
��B C
leaveAppliedDates
��C T
,
��T U
leaveRequest
��V b
,
��b c

��d q
)
��q r
;
��r s
if
�� 
(
�� 
response
�� 
!=
�� 
null
��  
&&
��! #
!
��$ %
response
��% -
.
��- .
Response
��. 6
)
��6 7
{
�� 
return
�� 
response
�� 
;
��  
}
�� 
if
�� 
(
�� 
!
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� '
.
��' (
CanApplyHalfDay
��( 7
)
��7 8
{
�� 
if
�� 
(
�� 
(
�� 
leaveRequest
�� !
.
��! "
FromDateDayTypeId
��" 3
==
��4 6
LeaveDayTypeNames
��7 H
.
��H I
	FirstHalf
��I R
.
��R S
ToInt32OrDefault
��S c
(
��c d
)
��d e
||
��f h
leaveRequest
��i u
.
��u v 
FromDateDayTypeId��v �
==��� �!
LeaveDayTypeNames��� �
.��� �

SecondHalf��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
||��� �
leaveRequest
��  
.
��  !
ToDateDayTypeId
��! 0
==
��1 3
LeaveDayTypeNames
��4 E
.
��E F
	FirstHalf
��F O
.
��O P
ToInt32OrDefault
��P `
(
��` a
)
��a b
||
��c e
leaveRequest
��f r
.
��r s
ToDateDayTypeId��s �
==��� �!
LeaveDayTypeNames��� �
.��� �

SecondHalf��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
)��� �
{
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
(
��3 4
)
��4 5
{
�� 
Response
��  
=
��! "
false
��# (
,
��( )
Message
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str
��0 p
,
��p q
	leaveType
��r {
.
��{ |,
GetCustomAttributeDescription��| �
(��� �
)��� �
)��� �
}
�� 
;
�� 
return
�� 
response
�� #
;
��# $
}
�� 
}
�� 
switch
�� 
(
�� 
	leaveType
�� 
)
�� 
{
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
CASUAL_LEAVE
��$ 0
:
��0 1
response
�� 
=
�� 
await
�� $'
ValidateCasualLeavePolicy
��% >
(
��> ?
leaveRequest
��? K
,
��K L$
payrollPeriodStartDate
��M c
,
��c d"
payrollPeriodEndDate
��e y
,
��y z
LeaveTypeNames��{ �
.��� �
CASUAL_LEAVE��� �
,��� �
	totalDays��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $

SICK_LEAVE
��$ .
:
��. /
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
(
��3 4
)
��4 5
{
�� 
Response
��  
=
��! "
true
��# '
,
��' (
Message
�� 
=
��  !
$str
��" &
}
�� 
;
�� 
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
PATERNITY_LEAVE
��$ 3
:
��3 4
response
�� 
=
�� 
await
�� $*
ValidatePaternityLeavePolicy
��% A
(
��A B
leaveRequest
��B N
,
��N O$
payrollPeriodStartDate
��P f
,
��f g"
payrollPeriodEndDate
��h |
,
��| }
LeaveTypeNames��~ �
.��� �
PATERNITY_LEAVE��� �
,��� �
	totalDays��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
MATERNITY_LEAVE
��$ 3
:
��3 4
response
�� 
=
�� 
await
�� $*
ValidateMaternityLeavePolicy
��% A
(
��A B
leaveRequest
��B N
,
��N O$
payrollPeriodStartDate
��P f
,
��f g"
payrollPeriodEndDate
��h |
,
��| }
LeaveTypeNames��~ �
.��� �
MATERNITY_LEAVE��� �
,��� �
	totalDays��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
MARRIAGE_LEAVE
��$ 2
:
��2 3
response
�� 
=
�� 
await
�� $)
ValidateMarriageLeavePolicy
��% @
(
��@ A
leaveRequest
��A M
,
��M N$
payrollPeriodStartDate
��O e
,
��e f"
payrollPeriodEndDate
��g {
,
��{ |
LeaveTypeNames��} �
.��� �
MARRIAGE_LEAVE��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
BEREAVEMENT_LEAVE
��$ 5
:
��5 6
response
�� 
=
�� 
await
�� $,
ValidateBereavementLeavePolicy
��% C
(
��C D
leaveRequest
��D P
,
��P Q$
payrollPeriodStartDate
��R h
,
��h i"
payrollPeriodEndDate
��j ~
,
��~ 
LeaveTypeNames��� �
.��� �!
BEREAVEMENT_LEAVE��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
SUMMER_VACATION
��$ 3
:
��3 4
response
�� 
=
�� 
await
�� $$
ValidateSummerVacation
��% ;
(
��; <
leaveRequest
��< H
,
��H I
	totalDays
��J S
)
��S T
;
��T U
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
WINTER_VACATION
��$ 3
:
��3 4
response
�� 
=
�� 
await
�� $$
ValidateWinterVacation
��% ;
(
��; <
leaveRequest
��< H
,
��H I
	totalDays
��J S
)
��S T
;
��T U
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $"
SPECIAL_CASUAL_LEAVE
��$ 8
:
��8 9
response
�� 
=
�� 
await
�� $.
 ValidateSpecialCasualLeavePolicy
��% E
(
��E F
leaveRequest
��F R
,
��R S$
payrollPeriodStartDate
��T j
,
��j k#
payrollPeriodEndDate��l �
,��� �
LeaveTypeNames��� �
.��� �$
SPECIAL_CASUAL_LEAVE��� �
,��� �
	totalDays��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
EARNED_LEAVE
��$ 0
:
��0 1
response
�� 
=
�� 
await
�� $*
ValidatePrivilegeLeavePolicy
��% A
(
��A B
leaveRequest
��B N
,
��N O$
payrollPeriodStartDate
��P f
,
��f g"
payrollPeriodEndDate
��h |
,
��| }
	totalDays��~ �
,��� �
LeaveTypeNames��� �
.��� �
EARNED_LEAVE��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
EARLY_LOGOUT_TIME
��$ 5
:
��5 6
response
�� 
=
�� 
await
�� $+
ValidateEarlyLogoutTimePolicy
��% B
(
��B C
leaveRequest
��C O
,
��O P$
payrollPeriodStartDate
��Q g
,
��g h"
payrollPeriodEndDate
��i }
,
��} ~
LeaveTypeNames�� �
.��� �!
EARLY_LOGOUT_TIME��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
LeaveTypeNames
�� #
.
��# $
COVID_LEAVE
��$ /
:
��/ 0
case
�� 
LeaveTypeNames
�� #
.
��# $ 
SPECIAL_SICK_LEAVE
��$ 6
:
��6 7
response
�� 
=
�� 
await
�� $,
ValidateSpecialSickLeavePolicy
��% C
(
��C D
leaveRequest
��D P
,
��P Q$
payrollPeriodStartDate
��R h
,
��h i"
payrollPeriodEndDate
��j ~
,
��~ 
LeaveTypeNames��� �
.��� �"
SPECIAL_SICK_LEAVE��� �
)��� �
;��� �
break
�� 
;
�� 
default
�� 
:
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
(
��3 4
)
��4 5
{
�� 
Response
��  
=
��! "
true
��# '
,
��' (
Message
�� 
=
��  !
$str
��" &
}
�� 
;
�� 
break
�� 
;
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� +
>
��+ ,(
ValidatePrefixSuffixPolicy
��- G
(
��G H

��H U
leaveRequest
��V b
,
��b c
DateTime
��d l%
payrollPeriodStartDate��m �
,��� �
DateTime��� �$
payrollPeriodEndDate��� �
,��� �
LeaveTypeNames��� �
	leaveType��� �
,��� �
double��� �
	totalDays��� �
)��� �
{
�� 	
EmpLeaveResponse
�� 
response
�� %
=
��& '
null
��( ,
;
��, -
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
beforeLeaves
�� *
=
��+ ,
null
��- 1
;
��1 2
List
�� 
<
�� 
LeaveDetail
�� 
>
�� "
beforePreviousLeaves
�� 2
=
��3 4
null
��5 9
;
��9 :
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
afterLeaves
�� )
=
��* +
null
��, 0
;
��0 1
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
afterNextLeaves
�� -
=
��. /
null
��0 4
;
��4 5
DateTime
�� 
previousDay
��  
=
��! "
DateTime
��# +
.
��+ ,
Now
��, /
;
��/ 0
DateTime
�� 
beforepreviousDay
�� &
=
��' (
DateTime
��) 1
.
��1 2
Now
��2 5
;
��5 6
DateTime
�� 
nextDay
�� 
=
�� 
DateTime
�� '
.
��' (
Now
��( +
;
��+ ,
DateTime
�� 

�� "
=
��# $
DateTime
��% -
.
��- .
Now
��. 1
;
��1 2
List
�� 
<
�� 
DateTime
�� 
>
�� 
publicHolidays
�� )
=
��* +
null
��, 0
;
��0 1
previousDay
�� 
=
�� 
leaveRequest
�� &
.
��& '
FromDate
��' /
.
��/ 0
AddDays
��0 7
(
��7 8
-
��8 9
$num
��9 :
)
��: ;
;
��; <
beforepreviousDay
�� 
=
�� 
leaveRequest
��  ,
.
��, -
FromDate
��- 5
.
��5 6
AddDays
��6 =
(
��= >
-
��> ?
$num
��? @
)
��@ A
;
��A B
nextDay
�� 
=
�� 
leaveRequest
�� "
.
��" #
ToDate
��# )
.
��) *
AddDays
��* 1
(
��1 2
$num
��2 3
)
��3 4
;
��4 5

�� 
=
�� 
leaveRequest
�� (
.
��( )
ToDate
��) /
.
��/ 0
AddDays
��0 7
(
��7 8
$num
��8 9
)
��9 :
;
��: ;
publicHolidays
�� 
=
�� 
await
�� "%
GetOrganizationHolidays
��# :
(
��: ;
leaveRequest
��; G
.
��G H
EmployeeSlno
��H T
,
��T U$
payrollPeriodStartDate
��V l
)
��l m
;
��m n
beforeLeaves
�� 
=
�� 
await
��  .
 GetEmployeeLeavesBeforeStartDate
��! A
(
��A B
leaveRequest
��B N
.
��N O
EmployeeSlno
��O [
,
��[ \
previousDay
��] h
)
��h i
;
��i j"
beforePreviousLeaves
��  
=
��! "
await
��# (.
 GetEmployeeLeavesBeforeStartDate
��) I
(
��I J
leaveRequest
��J V
.
��V W
EmployeeSlno
��W c
,
��c d
beforepreviousDay
��e v
)
��v w
;
��w x
afterLeaves
�� 
=
�� 
await
�� +
GetEmployeeLeavesAfterEndDate
��  =
(
��= >
leaveRequest
��> J
.
��J K
EmployeeSlno
��K W
,
��W X
nextDay
��Y `
)
��` a
;
��a b
afterNextLeaves
�� 
=
�� 
await
�� #+
GetEmployeeLeavesAfterEndDate
��$ A
(
��A B
leaveRequest
��B N
.
��N O
EmployeeSlno
��O [
,
��[ \

��] j
)
��j k
;
��k l
LeaveDetail
�� 

�� %
=
��& '
beforeLeaves
��( 4
.
��4 5
OrderByDescending
��5 F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
LeaveTo
��N U
)
��U V
.
��V W
FirstOrDefault
��W e
(
��e f
)
��f g
;
��g h
LeaveDetail
�� %
previoustopreviousLeave
�� /
=
��0 1"
beforePreviousLeaves
��2 F
.
��F G
OrderByDescending
��G X
(
��X Y
x
��Y Z
=>
��[ ]
x
��^ _
.
��_ `
LeaveTo
��` g
)
��g h
.
��h i
FirstOrDefault
��i w
(
��w x
)
��x y
;
��y z
LeaveDetail
�� 
	nextLeave
�� !
=
��" #
afterLeaves
��$ /
.
��/ 0
OrderBy
��0 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
	LeaveFrom
��? H
)
��H I
.
��I J
FirstOrDefault
��J X
(
��X Y
)
��Y Z
;
��Z [
LeaveDetail
�� 
nexttoNextLeave
�� '
=
��( )
afterNextLeaves
��* 9
.
��9 :
OrderBy
��: A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
	LeaveFrom
��I R
)
��R S
.
��S T
FirstOrDefault
��T b
(
��b c
)
��c d
;
��d e
if
�� 
(
�� 

�� 
!=
��  
null
��! %
)
��% &
{
�� 
if
�� 
(
�� 

�� !
.
��! "
LeaveTypeId
��" -
!=
��. 0
LeaveTypeNames
��1 ?
.
��? @

SICK_LEAVE
��@ J
.
��J K
ToInt32OrDefault
��K [
(
��[ \
)
��\ ]
&&
��^ `

��a n
.
��n o
LeaveTypeId
��o z
!=
��{ }
LeaveTypeNames��~ �
.��� �
ON_DUTY��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
&&��� �

.��� �
TotalDaysTaken��� �
>=��� �
$num��� �
&&��� �

.��� �
LeaveTo��� �
.��� �
Date��� �
==��� �
leaveRequest��� �
.��� �
FromDate��� �
.��� �
AddDays��� �
(��� �
-��� �
$num��� �
)��� �
.��� �
Date��� �
)��� �
{
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
(
��3 4
)
��4 5
{
�� 
Response
��  
=
��! "
false
��# (
,
��( )
Message
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str��0 �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �
MaximumUsage��� �
)��� �
}
�� 
;
�� 
}
�� 
if
�� 
(
�� 

�� !
.
��! "
LeaveTypeId
��" -
.
��- .
NotIn
��. 3
(
��3 4
new
��4 7
int
��8 ;
[
��; <
]
��< =
{
��> ?
LeaveTypeNames
��@ N
.
��N O

SICK_LEAVE
��O Y
.
��Y Z
ToInt32OrDefault
��Z j
(
��j k
)
��k l
,
��l m
LeaveTypeNames
��n |
.
��| }
ON_DUTY��} �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
}��� �
)��� �
&&��� �

.��� �
TotalDaysTaken��� �
==��� �
$num��� �
&&��� �
	totalDays��� �
>=��� �
$num��� �
&&��� �

.��� �
LeaveTo��� �
.��� �
Date��� �
==��� �
leaveRequest��� �
.��� �
FromDate��� �
.��� �
AddDays��� �
(��� �
-��� �
$num��� �
)��� �
.��� �
Date��� �
)��� �
{
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
(
��3 4
)
��4 5
{
�� 
Response
��  
=
��! "
false
��# (
,
��( )
Message
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str��0 �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �
MaximumUsage��� �
)��� �
}
�� 
;
�� 
}
�� 
DateTime
�� "
previousHolidayCheck
�� -
=
��. /
publicHolidays
��0 >
.
��> ?
Where
��? D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
Date
��L P
==
��Q S
previousDay
��T _
.
��_ `
Date
��` d
)
��d e
.
��e f
FirstOrDefault
��f t
(
��t u
)
��u v
;
��v w
if
�� 
(
�� %
previoustopreviousLeave
�� +
!=
��, .
null
��/ 3
&&
��4 6"
previousHolidayCheck
��7 K
!=
��L N
DateTime
��O W
.
��W X
MinValue
��X `
)
��` a
{
�� 
if
�� 
(
�� 

�� %
.
��% &
LeaveTypeId
��& 1
.
��1 2
NotIn
��2 7
(
��7 8
new
��8 ;
int
��< ?
[
��? @
]
��@ A
{
��B C
LeaveTypeNames
��D R
.
��R S

SICK_LEAVE
��S ]
.
��] ^
ToInt32OrDefault
��^ n
(
��n o
)
��o p
,
��p q
LeaveTypeNames��r �
.��� �
ON_DUTY��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
}��� �
)��� �
&&��� �$
previousHolidayCheck��� �
.��� �
Day��� �
==��� �
leaveRequest��� �
.��� �
FromDate��� �
.��� �
AddDays��� �
(��� �
-��� �
$num��� �
)��� �
.��� �
Day��� �
&&
�� %
previoustopreviousLeave
�� 3
.
��3 4
LeaveTo
��4 ;
.
��; <
Day
��< ?
==
��@ B
leaveRequest
��C O
.
��O P
FromDate
��P X
.
��X Y
AddDays
��Y `
(
��` a
-
��a b
$num
��b c
)
��c d
.
��d e
Day
��e h
&&
��i k#
previousHolidayCheck��l �
!=��� �
DateTime��� �
.��� �
MinValue��� �
)��� �
{
�� 
response
��  
=
��! "
new
��# &
EmpLeaveResponse
��' 7
(
��7 8
)
��8 9
{
�� 
Response
�� $
=
��% &
false
��' ,
,
��, -
Message
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
$str��4 �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �
MaximumUsage��� �
)��� �
}
�� 
;
�� 
}
�� 
}
�� 
}
�� 
if
�� 
(
�� 
	nextLeave
�� 
!=
�� 
null
�� !
)
��! "
{
�� 
if
�� 
(
�� 
	nextLeave
�� 
.
�� 
LeaveTypeId
�� )
!=
��* ,
LeaveTypeNames
��- ;
.
��; <

SICK_LEAVE
��< F
.
��F G
ToInt32OrDefault
��G W
(
��W X
)
��X Y
&&
��Z \
	nextLeave
��] f
.
��f g
LeaveTypeId
��g r
!=
��s u
LeaveTypeNames��v �
.��� �
ON_DUTY��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
&&��� �
	nextLeave��� �
.��� �
TotalDaysTaken��� �
>=��� �
$num��� �
&&��� �
	nextLeave��� �
.��� �
	LeaveFrom��� �
.��� �
Day��� �
==��� �
leaveRequest��� �
.��� �
ToDate��� �
.��� �
AddDays��� �
(��� �
$num��� �
)��� �
.��� �
Day��� �
)��� �
{
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
(
��3 4
)
��4 5
{
�� 
Response
��  
=
��! "
false
��# (
,
��( )
Message
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str��0 �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �
MaximumUsage��� �
)��� �
}
�� 
;
�� 
}
�� 
if
�� 
(
�� 
	nextLeave
�� 
.
�� 
LeaveTypeId
�� )
!=
��* ,
LeaveTypeNames
��- ;
.
��; <

SICK_LEAVE
��< F
.
��F G
ToInt32OrDefault
��G W
(
��W X
)
��X Y
&&
��Z \
	nextLeave
��] f
.
��f g
LeaveTypeId
��g r
!=
��s u
LeaveTypeNames��v �
.��� �
ON_DUTY��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
&&��� �
	nextLeave��� �
.��� �
TotalDaysTaken��� �
==��� �
$num��� �
&&��� �
	totalDays��� �
>=��� �
$num��� �
&&��� �
	nextLeave��� �
.��� �
	LeaveFrom��� �
.��� �
Day��� �
==��� �
leaveRequest��� �
.��� �
ToDate��� �
.��� �
AddDays��� �
(��� �
$num��� �
)��� �
.��� �
Day��� �
)��� �
{
�� 
response
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
(
��3 4
)
��4 5
{
�� 
Response
��  
=
��! "
false
��# (
,
��( )
Message
�� 
=
��  !
string
��" (
.
��( )
Format
��) /
(
��/ 0
$str��0 �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �
MaximumUsage��� �
)��� �
}
�� 
;
�� 
}
�� 
DateTime
�� 
NextHolidayCheck
�� )
=
��* +
publicHolidays
��, :
.
��: ;
Where
��; @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Date
��H L
==
��M O
nextDay
��P W
.
��W X
Date
��X \
)
��\ ]
.
��] ^
FirstOrDefault
��^ l
(
��l m
)
��m n
;
��n o
if
�� 
(
�� 
nexttoNextLeave
�� #
!=
��$ &
null
��' +
&&
��, .
NextHolidayCheck
��/ ?
!=
��@ B
DateTime
��C K
.
��K L
MinValue
��L T
)
��T U
{
�� 
if
�� 
(
�� 
nexttoNextLeave
�� '
.
��' (
LeaveTypeId
��( 3
!=
��4 6
LeaveTypeNames
��7 E
.
��E F

SICK_LEAVE
��F P
.
��P Q
ToInt32OrDefault
��Q a
(
��a b
)
��b c
&&
��d f
nexttoNextLeave
��g v
.
��v w
LeaveTypeId��w �
!=��� �
LeaveTypeNames��� �
.��� �
ON_DUTY��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
&&��� � 
NextHolidayCheck��� �
.��� �
Day��� �
==��� �
leaveRequest��� �
.��� �
ToDate��� �
.��� �
AddDays��� �
(��� �
$num��� �
)��� �
.��� �
Day��� �
&&
�� 
nexttoNextLeave
�� *
.
��* +
	LeaveFrom
��+ 4
.
��4 5
Day
��5 8
==
��9 ;
leaveRequest
��< H
.
��H I
ToDate
��I O
.
��O P
AddDays
��P W
(
��W X
$num
��X Y
)
��Y Z
.
��Z [
Day
��[ ^
)
��^ _
{
�� 
response
��  
=
��! "
new
��# &
EmpLeaveResponse
��' 7
(
��7 8
)
��8 9
{
�� 
Response
�� $
=
��% &
false
��' ,
,
��, -
Message
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
$str��4 �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �
MaximumUsage��� �
)��� �
}
�� 
;
�� 
}
�� 
}
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� +
>
��+ ,'
ValidateCasualLeavePolicy
��- F
(
��F G

��G T
leaveRequest
��U a
,
��a b
DateTime
��c k%
payrollPeriodStartDate��l �
,��� �
DateTime��� �$
payrollPeriodEndDate��� �
,��� �
LeaveTypeNames��� �
	leaveType��� �
,��� �
double��� �
	totalDays��� �
)��� �
{
�� 	
EmpLeaveResponse
�� 
response
�� %
=
��& '
null
��( ,
;
��, -
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 

�� +
=
��, -
null
��. 2
;
��2 3

�� 
=
�� 
await
�� !*
GetEmployeeLeavesByLeaveType
��" >
(
��> ?
leaveRequest
��? K
.
��K L
EmployeeSlno
��L X
,
��X Y$
payrollPeriodStartDate
��Z p
,
��p q#
payrollPeriodEndDate��r �
,��� �
	leaveType��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '

UpperBound
��' 1
>
��2 3
$num
��4 5
&&
��6 8
	totalDays
��9 B
>
��C D
leaveRequest
��E Q
.
��Q R
	LeaveType
��R [
.
��[ \

UpperBound
��\ f
)
��f g
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
string
�� $
.
��$ %
Format
��% +
(
��+ ,
$str��, �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �

UpperBound��� �
)��� �
}
�� 
;
�� 
return
�� 
response
�� 
;
��  
}
�� 
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '
MaximumUsage
��' 3
>
��4 5
$num
��6 7
&&
��8 :

��; H
.
��H I
Count
��I N
(
��N O
)
��O P
>=
��Q S
leaveRequest
��T `
.
��` a
	LeaveType
��a j
.
��j k
MaximumUsage
��k w
)
��w x
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
string
�� $
.
��$ %
Format
��% +
(
��+ ,
$str
��, h
,
��h i
leaveRequest
��j v
.
��v w
	LeaveType��w �
.��� �
MaximumUsage��� �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
)��� �
}
�� 
;
�� 
return
�� 
response
�� 
;
��  
}
�� 
response
�� 
=
�� 
await
�� (
ValidatePrefixSuffixPolicy
�� 7
(
��7 8
leaveRequest
��8 D
,
��D E$
payrollPeriodStartDate
��F \
,
��\ ]"
payrollPeriodEndDate
��^ r
,
��r s
	leaveType
��t }
,
��} ~
	totalDays�� �
)��� �
;��� �
if
�� 
(
�� 
response
�� 
==
�� 
null
��  
)
��  !
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
true
�� #
,
��# $
Message
�� 
=
�� 
$str
�� "
}
�� 
;
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� +
>
��+ ,*
ValidatePrivilegeLeavePolicy
��- I
(
��I J

��J W
leaveRequest
��X d
,
��d e
DateTime
��f n%
payrollPeriodStartDate��o �
,��� �
DateTime��� �$
payrollPeriodEndDate��� �
,��� �
double��� �
	totalDays��� �
,��� �
LeaveTypeNames��� �
	leaveType��� �
)��� �
{
�� 	
EmpLeaveResponse
�� 
response
�� %
=
��& '
null
��( ,
;
��, -
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
yearLeavesApplied
�� /
=
��0 1
null
��2 6
;
��6 7
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '

LowerBound
��' 1
>
��2 3
$num
��4 5
&&
��6 8
(
��9 :
	totalDays
��: C
)
��C D
<
��E F
leaveRequest
��G S
.
��S T
	LeaveType
��T ]
.
��] ^

LowerBound
��^ h
)
��h i
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�	�	 
Response
�	�	 
=
�	�	 
false
�	�	 $
,
�	�	$ %
Message
�	�	 
=
�	�	 
string
�	�	 $
.
�	�	$ %
Format
�	�	% +
(
�	�	+ ,
$str
�	�	, s
,
�	�	s t
	leaveType
�	�	u ~
.
�	�	~ ,
GetCustomAttributeDescription�	�	 �
(�	�	� �
)�	�	� �
,�	�	� �
leaveRequest�	�	� �
.�	�	� �
	LeaveType�	�	� �
.�	�	� �

LowerBound�	�	� �
)�	�	� �
}
�	�	 
;
�	�	 
return
�	�	 
response
�	�	 
;
�	�	  
}
�	�	 
DateTime
�	�	 
	yearStart
�	�	 
=
�	�	  
leaveRequest
�	�	! -
.
�	�	- .
FromDate
�	�	. 6
.
�	�	6 7
StartOfYear
�	�	7 B
(
�	�	B C
)
�	�	C D
;
�	�	D E
DateTime
�	�	 
yearEnd
�	�	 
=
�	�	 
leaveRequest
�	�	 +
.
�	�	+ ,
ToDate
�	�	, 2
.
�	�	2 3
	EndOfYear
�	�	3 <
(
�	�	< =
)
�	�	= >
;
�	�	> ?
yearLeavesApplied
�	�	 
=
�	�	 
await
�	�	  %*
GetEmployeeLeavesByLeaveType
�	�	& B
(
�	�	B C
leaveRequest
�	�	C O
.
�	�	O P
EmployeeSlno
�	�	P \
,
�	�	\ ]
	yearStart
�	�	^ g
,
�	�	g h
yearEnd
�	�	i p
,
�	�	p q
	leaveType
�	�	r {
.
�	�	{ |
ToInt32OrDefault�	�	| �
(�	�	� �
)�	�	� �
)�	�	� �
;�	�	� �
if
�	�	 
(
�	�	 
leaveRequest
�	�	 
.
�	�	 
	LeaveType
�	�	 &
.
�	�	& '
MaximumUsage
�	�	' 3
>
�	�	4 5
$num
�	�	6 7
&&
�	�	8 :
yearLeavesApplied
�	�	; L
.
�	�	L M
Count
�	�	M R
(
�	�	R S
)
�	�	S T
>=
�	�	U W
leaveRequest
�	�	X d
.
�	�	d e
	LeaveType
�	�	e n
.
�	�	n o
MaximumUsage
�	�	o {
)
�	�	{ |
{
�	�	 
response
�	�	 
=
�	�	 
new
�	�	 
EmpLeaveResponse
�	�	 /
(
�	�	/ 0
)
�	�	0 1
{
�	�	 
Response
�	�	 
=
�	�	 
false
�	�	 $
,
�	�	$ %
Message
�	�	 
=
�	�	 
string
�	�	 $
.
�	�	$ %
Format
�	�	% +
(
�	�	+ ,
$str
�	�	, g
,
�	�	g h
leaveRequest
�	�	i u
.
�	�	u v
	LeaveType
�	�	v 
.�	�	 �

LowerBound�	�	� �
,�	�	� �
	leaveType�	�	� �
.�	�	� �-
GetCustomAttributeDescription�	�	� �
(�	�	� �
)�	�	� �
)�	�	� �
}
�	�	 
;
�	�	 
return
�	�	 
response
�	�	 
;
�	�	  
}
�	�	 
response
�	�	 
=
�	�	 
await
�	�	 (
ValidatePrefixSuffixPolicy
�	�	 7
(
�	�	7 8
leaveRequest
�	�	8 D
,
�	�	D E$
payrollPeriodStartDate
�	�	F \
,
�	�	\ ]"
payrollPeriodEndDate
�	�	^ r
,
�	�	r s
	leaveType
�	�	t }
,
�	�	} ~
	totalDays�	�	 �
)�	�	� �
;�	�	� �
if
�	�	 
(
�	�	 
response
�	�	 
==
�	�	 
null
�	�	  
)
�	�	  !
{
�	�	 
response
�	�	 
=
�	�	 
new
�	�	 
EmpLeaveResponse
�	�	 /
(
�	�	/ 0
)
�	�	0 1
{
�	�	 
Response
�	�	 
=
�	�	 
true
�	�	 #
,
�	�	# $
Message
�	�	 
=
�	�	 
$str
�	�	 "
}
�	�	 
;
�	�	 
}
�	�	 
return
�	�	 
response
�	�	 
;
�	�	 
}
�	�	 	
private
�	�	 
async
�	�	 
Task
�	�	 
<
�	�	 
EmpLeaveResponse
�	�	 +
>
�	�	+ ,*
ValidatePaternityLeavePolicy
�	�	- I
(
�	�	I J

�	�	J W
leaveRequest
�	�	X d
,
�	�	d e
DateTime
�	�	f n%
payrollPeriodStartDate�	�	o �
,�	�	� �
DateTime�	�	� �$
payrollPeriodEndDate�	�	� �
,�	�	� �
LeaveTypeNames�	�	� �
	leaveType�	�	� �
,�	�	� �
double�	�	� �
	totalDays�	�	� �
)�	�	� �
{
�	�	 	
EmpLeaveResponse
�	�	 
response
�	�	 %
=
�	�	& '
null
�	�	( ,
;
�	�	, -
List
�	�	 
<
�	�	 
LeaveDetail
�	�	 
>
�	�	  
checkleavesApplied
�	�	 0
=
�	�	1 2
null
�	�	3 7
;
�	�	7 8
DateTime
�	�	 
	startDate
�	�	 
=
�	�	  
leaveRequest
�	�	! -
.
�	�	- .
FromDate
�	�	. 6
;
�	�	6 7
DateTime
�	�	 
endDate
�	�	 
=
�	�	 
leaveRequest
�	�	 +
.
�	�	+ ,
ToDate
�	�	, 2
;
�	�	2 3
var
�	�	 

dateRanges
�	�	 
=
�	�	 
	startDate
�	�	 &
.
�	�	& '
GetDateRange
�	�	' 3
(
�	�	3 4
endDate
�	�	4 ;
)
�	�	; <
.
�	�	< =
ToList
�	�	= C
(
�	�	C D
)
�	�	D E
;
�	�	E F 
checkleavesApplied
�	�	 
=
�	�	  
await
�	�	! &*
GetEmployeeLeavesByLeaveType
�	�	' C
(
�	�	C D
leaveRequest
�	�	D P
.
�	�	P Q
EmployeeSlno
�	�	Q ]
,
�	�	] ^
null
�	�	_ c
,
�	�	c d
null
�	�	e i
,
�	�	i j
	leaveType
�	�	k t
.
�	�	t u
ToInt32OrDefault�	�	u �
(�	�	� �
)�	�	� �
)�	�	� �
;�	�	� �
if
�	�	 
(
�	�	 
leaveRequest
�	�	 
.
�	�	 
	LeaveType
�	�	 &
.
�	�	& '
MaximumUsage
�	�	' 3
>
�	�	4 5
$num
�	�	6 7
&&
�	�	8 : 
checkleavesApplied
�	�	; M
.
�	�	M N
Count
�	�	N S
>=
�	�	T V
leaveRequest
�	�	W c
.
�	�	c d
	LeaveType
�	�	d m
.
�	�	m n
MaximumUsage
�	�	n z
)
�	�	z {
{
�	�	 
response
�	�	 
=
�	�	 
new
�	�	 
EmpLeaveResponse
�	�	 /
(
�	�	/ 0
)
�	�	0 1
{
�	�	 
Response
�	�	 
=
�	�	 
false
�	�	 $
,
�	�	$ %
Message
�	�	 
=
�	�	 
string
�	�	 $
.
�	�	$ %
Format
�	�	% +
(
�	�	+ ,
$str�	�	, �
,�	�	� �
	leaveType�	�	� �
.�	�	� �-
GetCustomAttributeDescription�	�	� �
(�	�	� �
)�	�	� �
,�	�	� �
leaveRequest�	�	� �
.�	�	� �
	LeaveType�	�	� �
.�	�	� �
MaximumUsage�	�	� �
)�	�	� �
}
�	�	 
;
�	�	 
return
�	�	 
response
�	�	 
;
�	�	  
}
�	�	 
response
�	�	 
=
�	�	 
await
�	�	 (
ValidatePrefixSuffixPolicy
�	�	 7
(
�	�	7 8
leaveRequest
�	�	8 D
,
�	�	D E$
payrollPeriodStartDate
�	�	F \
,
�	�	\ ]"
payrollPeriodEndDate
�	�	^ r
,
�	�	r s
	leaveType
�	�	t }
,
�	�	} ~
	totalDays�	�	 �
)�	�	� �
;�	�	� �
if
�	�	 
(
�	�	 
response
�	�	 
==
�	�	 
null
�	�	  
)
�	�	  !
{
�	�	 
response
�	�	 
=
�	�	 
new
�	�	 
EmpLeaveResponse
�	�	 /
(
�	�	/ 0
)
�	�	0 1
{
�	�	 
Response
�	�	 
=
�	�	 
true
�	�	 #
,
�	�	# $
Message
�	�	 
=
�	�	 
$str
�	�	 "
}
�	�	 
;
�	�	 
}
�	�	 
return
�	�	 
response
�	�	 
;
�	�	 
}
�	�	 	
private
�	�	 
async
�	�	 
Task
�	�	 
<
�	�	 
EmpLeaveResponse
�	�	 +
>
�	�	+ ,*
ValidateMaternityLeavePolicy
�	�	- I
(
�	�	I J

�	�	J W
leaveRequest
�	�	X d
,
�	�	d e
DateTime
�	�	f n%
payrollPeriodStartDate�	�	o �
,�	�	� �
DateTime�	�	� �$
payrollPeriodEndDate�	�	� �
,�	�	� �
LeaveTypeNames�	�	� �
	leaveType�	�	� �
,�	�	� �
double�	�	� �
	totalDays�	�	� �
)�	�	� �
{
�	�	 	
EmpLeaveResponse
�	�	 
response
�	�	 %
=
�	�	& '
null
�	�	( ,
;
�	�	, -
List
�	�	 
<
�	�	 
LeaveDetail
�	�	 
>
�	�	  
checkleavesApplied
�	�	 0
=
�	�	1 2
null
�	�	3 7
;
�	�	7 8
DateTime
�	�	 
	startDate
�	�	 
=
�	�	  
leaveRequest
�	�	! -
.
�	�	- .
FromDate
�	�	. 6
;
�	�	6 7
DateTime
�	�	 
endDate
�	�	 
=
�	�	 
leaveRequest
�	�	 +
.
�	�	+ ,
ToDate
�	�	, 2
;
�	�	2 3 
checkleavesApplied
�	�	 
=
�	�	  
await
�	�	! &*
GetEmployeeLeavesByLeaveType
�	�	' C
(
�	�	C D
leaveRequest
�	�	D P
.
�	�	P Q
EmployeeSlno
�	�	Q ]
,
�	�	] ^
null
�	�	_ c
,
�	�	c d
null
�	�	e i
,
�	�	i j
	leaveType
�	�	k t
.
�	�	t u
ToInt32OrDefault�	�	u �
(�	�	� �
)�	�	� �
)�	�	� �
;�	�	� �
if
�	�	 
(
�	�	 
leaveRequest
�	�	 
.
�	�	 
	LeaveType
�	�	 &
.
�	�	& '
MaximumUsage
�	�	' 3
>
�	�	4 5
$num
�	�	6 7
&&
�	�	8 : 
checkleavesApplied
�	�	; M
.
�	�	M N
Count
�	�	N S
>=
�	�	T V
leaveRequest
�	�	W c
.
�	�	c d
	LeaveType
�	�	d m
.
�	�	m n
MaximumUsage
�	�	n z
)
�	�	z {
{
�	�	 
response
�	�	 
=
�	�	 
new
�	�	 
EmpLeaveResponse
�	�	 /
(
�	�	/ 0
)
�	�	0 1
{
�	�	 
Response
�	�	 
=
�	�	 
false
�	�	 $
,
�	�	$ %
Message
�	�	 
=
�	�	 
string
�	�	 $
.
�	�	$ %
Format
�	�	% +
(
�	�	+ ,
$str�	�	, �
,�	�	� �
	leaveType�	�	� �
.�	�	� �-
GetCustomAttributeDescription�	�	� �
(�	�	� �
)�	�	� �
,�	�	� �
leaveRequest�	�	� �
.�	�	� �
	LeaveType�	�	� �
.�	�	� �
MaximumUsage�	�	� �
)�	�	� �
}
�	�	 
;
�	�	 
return
�	�	 
response
�	�	 
;
�	�	  
}
�	�	 
response
�	�	 
=
�	�	 
await
�	�	 (
ValidatePrefixSuffixPolicy
�	�	 7
(
�	�	7 8
leaveRequest
�	�	8 D
,
�	�	D E$
payrollPeriodStartDate
�	�	F \
,
�	�	\ ]"
payrollPeriodEndDate
�	�	^ r
,
�	�	r s
	leaveType
�	�	t }
,
�	�	} ~
	totalDays�	�	 �
)�	�	� �
;�	�	� �
if
�	�	 
(
�	�	 
response
�	�	 
==
�	�	 
null
�	�	  
)
�	�	  !
{
�	�	 
response
�	�	 
=
�	�	 
new
�	�	 
EmpLeaveResponse
�	�	 /
(
�	�	/ 0
)
�	�	0 1
{
�	�	 
Response
�	�	 
=
�	�	 
true
�	�	 #
,
�	�	# $
Message
�
�
 
=
�
�
 
$str
�
�
 "
}
�
�
 
;
�
�
 
}
�
�
 
return
�
�
 
response
�
�
 
;
�
�
 
}
�
�
 	
private
�
�
 
async
�
�
 
Task
�
�
 
<
�
�
 
EmpLeaveResponse
�
�
 +
>
�
�
+ ,,
ValidateSpecialSickLeavePolicy
�
�
- K
(
�
�
K L

�
�
L Y
leaveRequest
�
�
Z f
,
�
�
f g
DateTime
�
�
h p%
payrollPeriodStartDate�
�
q �
,�
�
� �
DateTime�
�
� �$
payrollPeriodEndDate�
�
� �
,�
�
� �
LeaveTypeNames�
�
� �
	leaveType�
�
� �
)�
�
� �
{
�
�
 	
EmpLeaveResponse
�
�
 
response
�
�
 %
=
�
�
& '
null
�
�
( ,
;
�
�
, -
List
�
�
 
<
�
�
 
LeaveDetail
�
�
 
>
�
�
 

�
�
 +
=
�
�
, -
null
�
�
. 2
;
�
�
2 3
DateTime
�
�
 
	startDate
�
�
 
=
�
�
  
leaveRequest
�
�
! -
.
�
�
- .
FromDate
�
�
. 6
;
�
�
6 7
DateTime
�
�
 
endDate
�
�
 
=
�
�
 
leaveRequest
�
�
 +
.
�
�
+ ,
ToDate
�
�
, 2
;
�
�
2 3
var
�
�
 

dateRanges
�
�
 
=
�
�
 
	startDate
�
�
 &
.
�
�
& '
GetDateRange
�
�
' 3
(
�
�
3 4
endDate
�
�
4 ;
)
�
�
; <
.
�
�
< =
ToList
�
�
= C
(
�
�
C D
)
�
�
D E
;
�
�
E F

�
�
 
=
�
�
 
await
�
�
 !*
GetEmployeeLeavesByLeaveType
�
�
" >
(
�
�
> ?
leaveRequest
�
�
? K
.
�
�
K L
EmployeeSlno
�
�
L X
,
�
�
X Y
null
�
�
Z ^
,
�
�
^ _
null
�
�
` d
,
�
�
d e
	leaveType
�
�
f o
.
�
�
o p
ToInt32OrDefault�
�
p �
(�
�
� �
)�
�
� �
)�
�
� �
;�
�
� �
if
�
�
 
(
�
�
 
leaveRequest
�
�
 
.
�
�
 
	LeaveType
�
�
 &
.
�
�
& '
MaximumUsage
�
�
' 3
>
�
�
4 5
$num
�
�
6 7
&&
�
�
8 :

�
�
; H
.
�
�
H I
Count
�
�
I N
>=
�
�
O Q
leaveRequest
�
�
R ^
.
�
�
^ _
	LeaveType
�
�
_ h
.
�
�
h i
MaximumUsage
�
�
i u
)
�
�
u v
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
false
�
�
 $
,
�
�
$ %
Message
�
�
 
=
�
�
 
string
�
�
 $
.
�
�
$ %
Format
�
�
% +
(
�
�
+ ,
$str�
�
, �
,�
�
� �
	leaveType�
�
� �
.�
�
� �-
GetCustomAttributeDescription�
�
� �
(�
�
� �
)�
�
� �
,�
�
� �
leaveRequest�
�
� �
.�
�
� �
	LeaveType�
�
� �
.�
�
� �
MaximumUsage�
�
� �
)�
�
� �
}
�
�
 
;
�
�
 
return
�
�
 
response
�
�
 
;
�
�
  
}
�
�
 
if
�
�
 
(
�
�
 
response
�
�
 
==
�
�
 
null
�
�
  
)
�
�
  !
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
true
�
�
 #
,
�
�
# $
Message
�
�
 
=
�
�
 
$str
�
�
 "
}
�
�
 
;
�
�
 
}
�
�
 
return
�
�
 
response
�
�
 
;
�
�
 
}
�
�
 	
private
�
�
 
async
�
�
 
Task
�
�
 
<
�
�
 
EmpLeaveResponse
�
�
 +
>
�
�
+ ,.
 ValidateSpecialCasualLeavePolicy
�
�
- M
(
�
�
M N

�
�
N [
leaveRequest
�
�
\ h
,
�
�
h i
DateTime
�
�
j r%
payrollPeriodStartDate�
�
s �
,�
�
� �
DateTime�
�
� �$
payrollPeriodEndDate�
�
� �
,�
�
� �
LeaveTypeNames�
�
� �
	leaveType�
�
� �
,�
�
� �
double�
�
� �
	totalDays�
�
� �
)�
�
� �
{
�
�
 	
EmpLeaveResponse
�
�
 
response
�
�
 %
=
�
�
& '
null
�
�
( ,
;
�
�
, -
List
�
�
 
<
�
�
 
LeaveDetail
�
�
 
>
�
�
 

�
�
 +
=
�
�
, -
null
�
�
. 2
;
�
�
2 3
DateTime
�
�
 
	startDate
�
�
 
=
�
�
  
leaveRequest
�
�
! -
.
�
�
- .
FromDate
�
�
. 6
;
�
�
6 7
DateTime
�
�
 
endDate
�
�
 
=
�
�
 
leaveRequest
�
�
 +
.
�
�
+ ,
ToDate
�
�
, 2
;
�
�
2 3
var
�
�
 

dateRanges
�
�
 
=
�
�
 
	startDate
�
�
 &
.
�
�
& '
GetDateRange
�
�
' 3
(
�
�
3 4
endDate
�
�
4 ;
)
�
�
; <
.
�
�
< =
ToList
�
�
= C
(
�
�
C D
)
�
�
D E
;
�
�
E F

�
�
 
=
�
�
 
await
�
�
 !*
GetEmployeeLeavesByLeaveType
�
�
" >
(
�
�
> ?
leaveRequest
�
�
? K
.
�
�
K L
EmployeeSlno
�
�
L X
,
�
�
X Y
null
�
�
Z ^
,
�
�
^ _
null
�
�
` d
,
�
�
d e
	leaveType
�
�
f o
.
�
�
o p
ToInt32OrDefault�
�
p �
(�
�
� �
)�
�
� �
)�
�
� �
;�
�
� �
if
�
�
 
(
�
�
 
leaveRequest
�
�
 
.
�
�
 
	LeaveType
�
�
 &
.
�
�
& '
MaximumUsage
�
�
' 3
>
�
�
4 5
$num
�
�
6 7
&&
�
�
8 :

�
�
; H
.
�
�
H I
Count
�
�
I N
>=
�
�
O Q
leaveRequest
�
�
R ^
.
�
�
^ _
	LeaveType
�
�
_ h
.
�
�
h i
MaximumUsage
�
�
i u
)
�
�
u v
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
false
�
�
 $
,
�
�
$ %
Message
�
�
 
=
�
�
 
string
�
�
 $
.
�
�
$ %
Format
�
�
% +
(
�
�
+ ,
$str�
�
, �
,�
�
� �
	leaveType�
�
� �
.�
�
� �-
GetCustomAttributeDescription�
�
� �
(�
�
� �
)�
�
� �
,�
�
� �
leaveRequest�
�
� �
.�
�
� �
	LeaveType�
�
� �
.�
�
� �
MaximumUsage�
�
� �
)�
�
� �
}
�
�
 
;
�
�
 
return
�
�
 
response
�
�
 
;
�
�
  
}
�
�
 
response
�
�
 
=
�
�
 
await
�
�
 (
ValidatePrefixSuffixPolicy
�
�
 7
(
�
�
7 8
leaveRequest
�
�
8 D
,
�
�
D E$
payrollPeriodStartDate
�
�
F \
,
�
�
\ ]"
payrollPeriodEndDate
�
�
^ r
,
�
�
r s
	leaveType
�
�
t }
,
�
�
} ~
	totalDays�
�
 �
)�
�
� �
;�
�
� �
if
�
�
 
(
�
�
 
response
�
�
 
==
�
�
 
null
�
�
  
)
�
�
  !
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
true
�
�
 #
,
�
�
# $
Message
�
�
 
=
�
�
 
$str
�
�
 "
}
�
�
 
;
�
�
 
}
�
�
 
return
�
�
 
response
�
�
 
;
�
�
 
}
�
�
 	
private
�
�
 
async
�
�
 
Task
�
�
 
<
�
�
 
EmpLeaveResponse
�
�
 +
>
�
�
+ ,,
ValidateBereavementLeavePolicy
�
�
- K
(
�
�
K L

�
�
L Y
leaveRequest
�
�
Z f
,
�
�
f g
DateTime
�
�
h p%
payrollPeriodStartDate�
�
q �
,�
�
� �
DateTime�
�
� �$
payrollPeriodEndDate�
�
� �
,�
�
� �
LeaveTypeNames�
�
� �
	leaveType�
�
� �
)�
�
� �
{
�
�
 	
EmpLeaveResponse
�
�
 
response
�
�
 %
=
�
�
& '
null
�
�
( ,
;
�
�
, -
List
�
�
 
<
�
�
 
LeaveDetail
�
�
 
>
�
�
 

�
�
 +
=
�
�
, -
null
�
�
. 2
;
�
�
2 3
DateTime
�
�
 
	startDate
�
�
 
=
�
�
  
leaveRequest
�
�
! -
.
�
�
- .
FromDate
�
�
. 6
;
�
�
6 7
DateTime
�
�
 
endDate
�
�
 
=
�
�
 
leaveRequest
�
�
 +
.
�
�
+ ,
ToDate
�
�
, 2
;
�
�
2 3
var
�
�
 

dateRanges
�
�
 
=
�
�
 
	startDate
�
�
 &
.
�
�
& '
GetDateRange
�
�
' 3
(
�
�
3 4
endDate
�
�
4 ;
)
�
�
; <
.
�
�
< =
ToList
�
�
= C
(
�
�
C D
)
�
�
D E
;
�
�
E F

�
�
 
=
�
�
 
await
�
�
 !*
GetEmployeeLeavesByLeaveType
�
�
" >
(
�
�
> ?
leaveRequest
�
�
? K
.
�
�
K L
EmployeeSlno
�
�
L X
,
�
�
X Y
null
�
�
Z ^
,
�
�
^ _
null
�
�
` d
,
�
�
d e
	leaveType
�
�
f o
.
�
�
o p
ToInt32OrDefault�
�
p �
(�
�
� �
)�
�
� �
)�
�
� �
;�
�
� �
if
�
�
 
(
�
�
 
leaveRequest
�
�
 
.
�
�
 
	LeaveType
�
�
 &
.
�
�
& '
MaximumUsage
�
�
' 3
>
�
�
4 5
$num
�
�
6 7
&&
�
�
8 :

�
�
; H
.
�
�
H I
Count
�
�
I N
>=
�
�
O Q
leaveRequest
�
�
R ^
.
�
�
^ _
	LeaveType
�
�
_ h
.
�
�
h i
MaximumUsage
�
�
i u
)
�
�
u v
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
false
�
�
 $
,
�
�
$ %
Message
�
�
 
=
�
�
 
string
�
�
 $
.
�
�
$ %
Format
�
�
% +
(
�
�
+ ,
$str�
�
, �
,�
�
� �
	leaveType�
�
� �
.�
�
� �-
GetCustomAttributeDescription�
�
� �
(�
�
� �
)�
�
� �
,�
�
� �
leaveRequest�
�
� �
.�
�
� �
	LeaveType�
�
� �
.�
�
� �
MaximumUsage�
�
� �
)�
�
� �
}
�
�
 
;
�
�
 
return
�
�
 
response
�
�
 
;
�
�
  
}
�
�
 
if
�
�
 
(
�
�
 
response
�
�
 
==
�
�
 
null
�
�
  
)
�
�
  !
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
true
�
�
 #
,
�
�
# $
Message
�
�
 
=
�
�
 
$str
�
�
 "
}
�
�
 
;
�
�
 
}
�
�
 
return
�
�
 
response
�
�
 
;
�
�
 
}
�
�
 	
private
�
�
 
async
�
�
 
Task
�
�
 
<
�
�
 
EmpLeaveResponse
�
�
 +
>
�
�
+ ,)
ValidateMarriageLeavePolicy
�
�
- H
(
�
�
H I

�
�
I V
leaveRequest
�
�
W c
,
�
�
c d
DateTime
�
�
e m%
payrollPeriodStartDate�
�
n �
,�
�
� �
DateTime�
�
� �$
payrollPeriodEndDate�
�
� �
,�
�
� �
LeaveTypeNames�
�
� �
	leaveType�
�
� �
)�
�
� �
{
�
�
 	
EmpLeaveResponse
�
�
 
response
�
�
 %
=
�
�
& '
null
�
�
( ,
;
�
�
, -
List
�
�
 
<
�
�
 
LeaveDetail
�
�
 
>
�
�
 

�
�
 +
=
�
�
, -
null
�
�
. 2
;
�
�
2 3
DateTime
�
�
 
	startDate
�
�
 
=
�
�
  
leaveRequest
�
�
! -
.
�
�
- .
FromDate
�
�
. 6
;
�
�
6 7
DateTime
�
�
 
endDate
�
�
 
=
�
�
 
leaveRequest
�
�
 +
.
�
�
+ ,
ToDate
�
�
, 2
;
�
�
2 3
var
�
�
 

dateRanges
�
�
 
=
�
�
 
	startDate
�
�
 &
.
�
�
& '
GetDateRange
�
�
' 3
(
�
�
3 4
endDate
�
�
4 ;
)
�
�
; <
.
�
�
< =
ToList
�
�
= C
(
�
�
C D
)
�
�
D E
;
�
�
E F

�
�
 
=
�
�
 
await
�
�
 !*
GetEmployeeLeavesByLeaveType
�
�
" >
(
�
�
> ?
leaveRequest
�
�
? K
.
�
�
K L
EmployeeSlno
�
�
L X
,
�
�
X Y
null
�
�
Z ^
,
�
�
^ _
null
�
�
` d
,
�
�
d e
	leaveType
�
�
f o
.
�
�
o p
ToInt32OrDefault�
�
p �
(�
�
� �
)�
�
� �
)�
�
� �
;�
�
� �
if
�
�
 
(
�
�
 
leaveRequest
�
�
 
.
�
�
 
	LeaveType
�
�
 &
.
�
�
& '
MaximumUsage
�
�
' 3
>
�
�
4 5
$num
�
�
6 7
&&
�
�
8 :

�
�
; H
.
�
�
H I
Count
�
�
I N
>=
�
�
O Q
leaveRequest
�
�
R ^
.
�
�
^ _
	LeaveType
�
�
_ h
.
�
�
h i
MaximumUsage
�
�
i u
)
�
�
u v
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
false
�
�
 $
,
�
�
$ %
Message
�
�
 
=
�
�
 
string
�
�
 $
.
�
�
$ %
Format
�
�
% +
(
�
�
+ ,
$str�
�
, �
,�
�
� �
	leaveType�
�
� �
.�
�
� �-
GetCustomAttributeDescription�
�
� �
(�
�
� �
)�
�
� �
,�
�
� �
leaveRequest�
�
� �
.�
�
� �
	LeaveType�
�
� �
.�
�
� �
MaximumUsage�
�
� �
)�
�
� �
}
�
�
 
;
�
�
 
return
�
�
 
response
�
�
 
;
�
�
  
}
�
�
 
if
�
�
 
(
�
�
 
response
�
�
 
==
�
�
 
null
�
�
  
)
�
�
  !
{
�
�
 
response
�
�
 
=
�
�
 
new
�
�
 
EmpLeaveResponse
�
�
 /
(
�
�
/ 0
)
�
�
0 1
{
�
�
 
Response
�
�
 
=
�
�
 
true
�
�
 #
,
�
�
# $
Message
�� 
=
�� 
$str
�� "
}
�� 
;
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� +
>
��+ ,+
ValidateEarlyLogoutTimePolicy
��- J
(
��J K

��K X
leaveRequest
��Y e
,
��e f
DateTime
��g o%
payrollPeriodStartDate��p �
,��� �
DateTime��� �$
payrollPeriodEndDate��� �
,��� �
LeaveTypeNames��� �
	leaveType��� �
)��� �
{
�� 	
EmpLeaveResponse
�� 
response
�� %
=
��& '
null
��( ,
;
��, -
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 

�� +
=
��, -
null
��. 2
;
��2 3

�� 
=
�� 
await
�� !*
GetEmployeeLeavesByLeaveType
��" >
(
��> ?
leaveRequest
��? K
.
��K L
EmployeeSlno
��L X
,
��X Y$
payrollPeriodStartDate
��Z p
,
��p q#
payrollPeriodEndDate��r �
,��� �
	leaveType��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '
MaximumUsage
��' 3
>
��4 5
$num
��6 7
&&
��8 :

��; H
.
��H I
Count
��I N
>=
��O Q
leaveRequest
��R ^
.
��^ _
	LeaveType
��_ h
.
��h i
MaximumUsage
��i u
)
��u v
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
string
�� $
.
��$ %
Format
��% +
(
��+ ,
$str��, �
,��� �
	leaveType��� �
.��� �-
GetCustomAttributeDescription��� �
(��� �
)��� �
,��� �
leaveRequest��� �
.��� �
	LeaveType��� �
.��� �
MaximumUsage��� �
)��� �
}
�� 
;
�� 
return
�� 
response
�� 
;
��  
}
�� 
if
�� 
(
�� 
response
�� 
==
�� 
null
��  
)
��  !
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
true
�� #
,
��# $
Message
�� 
=
�� 
$str
�� "
}
�� 
;
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� +
>
��+ ,$
ValidateSummerVacation
��- C
(
��C D

��D Q
leaveRequest
��R ^
,
��^ _
double
��` f
	totalDays
��g p
)
��p q
{
�� 	
EmpLeaveResponse
�� 
response
�� %
=
��& '
null
��( ,
;
��, -
int
�� 
UsedLeaveCount
�� 
=
��  
$num
��! "
;
��" #
UsedLeaveCount
�� 
=
�� 
await
�� "-
CheckForLeaveCountBetweenwDates
��# B
(
��B C
leaveRequest
��C O
,
��O P
leaveRequest
��Q ]
.
��] ^
EmployeeSlno
��^ j
,
��j k
LeaveTypeNames
��l z
.
��z {
SUMMER_VACATION��{ �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
,��� � 
LeaveStatusNames��� �
.��� �"
PendingAndApproval��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
UsedLeaveCount
�� 
>=
�� !
$num
��" #
)
��# $
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
$str
�� `
}
�� 
;
�� 
return
�� 
response
�� 
;
��  
}
�� 
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '
LeaveBalance
��' 3
<
��4 5
	totalDays
��6 ?
)
��? @
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
$str
�� K
}
�� 
;
�� 
return
�� 
response
�� 
;
��  
}
�� 
if
�� 
(
�� 
response
�� 
==
�� 
null
��  
)
��  !
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
true
�� #
,
��# $
Message
�� 
=
�� 
$str
�� "
}
�� 
;
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
EmpLeaveResponse
�� +
>
��+ ,$
ValidateWinterVacation
��- C
(
��C D

��D Q
leaveRequest
��R ^
,
��^ _
double
��` f
	totalDays
��g p
)
��p q
{
�� 	
EmpLeaveResponse
�� 
response
�� %
=
��& '
null
��( ,
;
��, -
int
�� 
UsedLeaveCount
�� 
=
��  
$num
��! "
;
��" #
UsedLeaveCount
�� 
=
�� 
await
�� "-
CheckForLeaveCountBetweenwDates
��# B
(
��B C
leaveRequest
��C O
,
��O P
leaveRequest
��Q ]
.
��] ^
EmployeeSlno
��^ j
,
��j k
LeaveTypeNames
��l z
.
��z {
WINTER_VACATION��{ �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
,��� � 
LeaveStatusNames��� �
.��� �"
PendingAndApproval��� �
.��� � 
ToInt32OrDefault��� �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
UsedLeaveCount
�� 
>=
�� !
$num
��" #
)
��# $
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
$str
�� `
}
�� 
;
�� 
return
�� 
response
�� 
;
��  
}
�� 
if
�� 
(
�� 
leaveRequest
�� 
.
�� 
	LeaveType
�� &
.
��& '
LeaveBalance
��' 3
<
��4 5
	totalDays
��6 ?
)
��? @
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
$str
�� K
}
�� 
;
�� 
return
�� 
response
�� 
;
��  
}
�� 
if
�� 
(
�� 
response
�� 
==
�� 
null
��  
)
��  !
{
�� 
response
�� 
=
�� 
new
�� 
EmpLeaveResponse
�� /
(
��/ 0
)
��0 1
{
�� 
Response
�� 
=
�� 
true
�� #
,
��# $
Message
�� 
=
�� 
$str
�� "
}
�� 
;
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
int
�� 
>
�� -
CheckForLeaveCountBetweenwDates
��  ?
(
��? @

��@ M
leaveRequest
��N Z
,
��Z [
int
��\ _
employeeSlno
��` l
,
��l m
int
��n q
leaveTypeId
��r }
,
��} ~
int�� �

)��� �
{
�� 	
int
�� 

leaveCount
�� 
=
�� 
$num
�� 
;
�� 
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
leaveTypeId
��7 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 7
,
��7 8

��9 F
,
��F G
dbType
��H N
:
��N O
OracleMappingType
��P a
.
��a b
Int32
��b g
,
��g h
	direction
��i r
:
��r s!
ParameterDirection��t �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 5
,
��5 6
leaveRequest
��7 C
.
��C D
	LeaveType
��D M
.
��M N

��N [
,
��[ \
dbType
��] c
:
��c d
OracleMappingType
��e v
.
��v w
Date
��w {
,
��{ |
	direction��} �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 6
,
��6 7
leaveRequest
��8 D
.
��D E
	LeaveType
��E N
.
��N O
DateValidUntil
��O ]
,
��] ^
dbType
��_ e
:
��e f
OracleMappingType
��g x
.
��x y
Date
��y }
,
��} ~
	direction�� �
:��� �"
ParameterDirection��� �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
dbType
��4 :
:
��: ;
OracleMappingType
��< M
.
��M N
Int32
��N S
,
��S T
	direction
��U ^
:
��^ _ 
ParameterDirection
��` r
.
��r s
Output
��s y
)
��y z
;
��z {
await
�� 

connection
��  
.
��  !
ExecuteAsync
��! -
(
��- . 
DatabaseProcedures
��. @
.
��@ A+
SP_CHECK_FOR_LEAVES_BTW_DATES
��A ^
,
��^ _

parameters
��` j
,
��j k
commandType
��l w
:
��w x
CommandType��y �
.��� �
StoredProcedure��� �
)��� �
;��� �

leaveCount
�� 
=
�� 

parameters
�� '
.
��' (
Get
��( +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
$str
��1 >
)
��> ?
;
��? @
}
�� 
return
�� 

leaveCount
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
DateTime
��  (
>
��( )
>
��) *%
GetOrganizationHolidays
��+ B
(
��B C
int
��C F
employeeSlno
��G S
,
��S T
DateTime
��U ]

��^ k
)
��k l
{
�� 	
List
�� 
<
�� 
DateTime
�� 
>
�� 
publicHolidays
�� )
=
��* +
null
��, 0
;
��0 1
using
�� 
(
�� 

��  

connection
��! +
=
��, -
await
��. 3
CreateConnection
��4 D
(
��D E
DbSchema
��E M
.
��M N
PORTAL
��N T
)
��T U
)
��U V
{
�� 
OracleDynamicParameters
�� '
parametersHoliday
��( 9
=
��: ;
new
��< ?%
OracleDynamicParameters
��@ W
(
��W X
)
��X Y
;
��Y Z
parametersHoliday
�� !
.
��! "
Add
��" %
(
��% &
name
��& *
:
��* +
$str
��, ;
,
��; <
employeeSlno
��= I
,
��I J
dbType
��K Q
:
��Q R
OracleMappingType
��S d
.
��d e
Int64
��e j
,
��j k
	direction
��l u
:
��u v!
ParameterDirection��w �
.��� �
Input��� �
)��� �
;��� �
parametersHoliday
�� !
.
��! "
Add
��" %
(
��% &
name
��& *
:
��* +
$str
��, 5
,
��5 6
dbType
��7 =
:
��= >
OracleMappingType
��? P
.
��P Q
	RefCursor
��Q Z
,
��Z [
	direction
��\ e
:
��e f 
ParameterDirection
��g y
.
��y z
Output��z �
)��� �
;��� �
IEnumerable
�� 
<
��  
HolidayInformation
�� .
>
��. /
holidaysList
��0 <
=
��= >
(
��? @
await
��@ E

connection
��F P
.
��P Q

QueryAsync
��Q [
<
��[ \ 
HolidayInformation
��\ n
>
��n o
(
��o p!
DatabaseProcedures��p �
.��� �%
P_GET_PORTAL_HOLIDAYS��� �
,��� �!
parametersHoliday��� �
,��� �
commandType��� �
:��� �
CommandType��� �
.��� �
StoredProcedure��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
publicHolidays
�� 
=
��  
holidaysList
��! -
.
��- .
Where
��. 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
HolidayDate
��; F
>=
��G I

��J W
)
��W X
.
��X Y
Select
��Y _
(
��_ `
x
��` a
=>
��b d
x
��e f
.
��f g
HolidayDate
��g r
)
��r s
.
��s t
ToList
��t z
(
��z {
)
��{ |
;
��| }
}
�� 
return
�� 
publicHolidays
�� !
;
��! "
}
�� 	
private
�� 
EmpLeaveResponse
��  (
CheckForOverLappingPeriods
��! ;
(
��; <
List
��< @
<
��@ A
DateTime
��A I
>
��I J
appliedDates
��K W
,
��W X

��Y f
leaveRequest
��g s
,
��s t
List
��u y
<
��y z
LeaveDetail��z �
>��� �

)��� �
{
�� 	
EmpLeaveResponse
�� 
errorMessage
�� )
;
��) *#
ITimePeriodCollection
�� ! 
overLappingPeriods
��" 4
=
��5 64
&CheckForOverLappingDaysForAppliedLeave
��7 ]
(
��] ^
appliedDates
��^ j
,
��j k
leaveRequest
��l x
,
��x y

)��� �
;��� �
if
�� 
(
��  
overLappingPeriods
�� "
.
��" #
Count
��# (
>
��) *
$num
��+ ,
)
��, -
{
�� 
errorMessage
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
{
�� 
Response
�� 
=
�� 
false
�� $
,
��$ %
Message
�� 
=
�� 
$str
�� i
}
�� 
;
�� 
}
�� 
else
�� 
{
�� 
errorMessage
�� 
=
�� 
new
�� "
EmpLeaveResponse
��# 3
{
�� 
Response
�� 
=
�� 
true
�� #
,
��# $
Message
�� 
=
�� 
$str
�� "
}
�� 
;
�� 
}
�� 
return
�� 
errorMessage
�� 
;
��  
}
�� 	
private
�� 
List
�� 
<
�� 
int
�� 
>
�� 7
)CheckForOverLappingDayTypeForAppliedLeave
�� C
(
��C D#
ITimePeriodCollection
��D Y
overlapPeriods
��Z h
,
��h i

��j w
leaveRequest��x �
,��� �
List��� �
<��� �
LeaveDetail��� �
>��� �

)��� �
{
�� 	
List
�� 
<
�� 
int
�� 
>
��  
lastAppliedLeaves2
�� (
=
��) *
new
��+ .
List
��/ 3
<
��3 4
int
��4 7
>
��7 8
(
��8 9
)
��9 :
;
��: ;
List
�� 
<
�� 
int
�� 
>
�� 
data
�� 
=
�� 
null
�� !
;
��! "
List
�� 
<
�� 
LeaveDetail
�� 
>
�� 
lastAppliedLeaves
�� /
=
��0 1
new
��2 5
List
��6 :
<
��: ;
LeaveDetail
��; F
>
��F G
(
��G H
)
��H I
;
��I J
var
�� 
overlappingLeaves
�� !
=
��" #

��$ 1
.
��1 2
Where
��2 7
(
��7 8
appliedLeave
��8 D
=>
��E G
overlapPeriods
��H V
.
��V W
Any
��W Z
(
��Z [
date
��[ _
=>
��` b
(
��c d
appliedLeave
��d p
.
��p q
	LeaveFrom
��q z
==
��{ }
date��~ �
.��� �
Start��� �
||��� �
appliedLeave��� �
.��� �
LeaveTo��� �
==��� �
date��� �
.��� �
End��� �
)��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
dateTime
�� !
in
��" $
overlappingLeaves
��% 6
)
��6 7
{
�� 
if
�� 
(
�� 
dateTime
�� 
.
�� 
	LeaveFrom
�� &
.
��& '
Date
��' +
==
��, .
leaveRequest
��/ ;
.
��; <
FromDate
��< D
.
��D E
Date
��E I
)
��I J
{
�� 
if
�� 
(
�� 
(
�� 
dateTime
�� 
.
�� 
FromDateDayTypeId
�� 
==
��  
$num
��! "
&&
��# %
leaveRequest
��& 2
.
��2 3
FromDateDayTypeId
��3 D
==
��E G
$num
��H I
)
��I J
||
��K M
(
�� 
dateTime
�� 
.
�� 
FromDateDayTypeId
�� 
==
��  
$num
��! "
&&
��# %
leaveRequest
��& 2
.
��2 3
FromDateDayTypeId
��3 D
==
��E G
$num
��H I
)
��I J
)
��J K
{
�� 
var
�� 
groupedLeaveFroms
�� -
=
��. /
overlappingLeaves
��0 A
.
��A B
Where
��B G
(
��G H
s
��H I
=>
��J L
s
��M N
.
��N O
	LeaveFrom
��O X
==
��Y [
leaveRequest
��\ h
.
��h i
FromDate
��i q
)
��q r
.
��r s
ToList
��s y
(
��y z
)
��z {
;
��{ |
if
�� 
(
�� 
groupedLeaveFroms
�� -
.
��- .
Count
��. 3
<
��4 5
$num
��6 7
)
��7 8
{
��  
lastAppliedLeaves2
�� .
.
��. /
Add
��/ 2
(
��2 3
dateTime
��3 ;
.
��; <
LeaveId
��< C
)
��C D
;
��D E
}
�� 
}
�� 
}
�
if
�
(
�
dateTime
�
.
�
	LeaveFrom
�
.
�
Date
�
==
�
leaveRequest
�
.
�
ToDate
�
.
�
Date
�
)
�
{
�
if
�
(
�
(
�
dateTime
�
.
�
FromDateDayTypeId
�
==
�
$num
�
&&
�
leaveRequest
�
.
�
ToDateDayTypeId
�
==
�
$num
�
)
�
||
�
(
�
dateTime
�
.
�
FromDateDayTypeId
�
==
�
$num
�
&&
�
leaveRequest
�
.
�
ToDateDayTypeId
�
==
�
$num
�
)
�
)
�
{
�
var
�
groupedLeaveFroms
�
=
�
overlappingLeaves
�
.
�
Where
�
(
�
s
�
=>
�
s
�
.
�
	LeaveFrom
�
==
�
leaveRequest
�
.
�
ToDate
�
)
�
.
�
ToList
�
(
�
)
�
;
�
if
�
(
�
groupedLeaveFroms
�
.
�
Count
�
<
�
$num
�
)
�
{
�
lastAppliedLeaves2
�
.
�
Add
�
(
�
dateTime
�
.
�
LeaveId
�
)
�
;
�
}
�
}
�
}
�
if
�
(
�
dateTime
�
.
�
LeaveTo
�
.
�
Date
�
==
�
leaveRequest
�
.
�
FromDate
�
.
�
Date
�
)
�
{
�
if
�
(
�
(
�
dateTime
�
.
�
ToDateDayTypeId
�
==
�
$num
�
&&
�
leaveRequest
�
.
�
FromDateDayTypeId
�
==
�
$num
�
)
�
||
�
(
�
dateTime
�
.
�
ToDateDayTypeId
�
==
�
$num
�
&&
�
leaveRequest
�
.
�
FromDateDayTypeId
�
==
�
$num
�
)
�
)
�
{
�
var
�
groupedLeaveFroms
�
=
�
overlappingLeaves
�
.
�
Where
�
(
�
s
�
=>
�
s
�
.
�
LeaveTo
�
==
�
leaveRequest
�
.
�
FromDate
�
)
�
.
�
ToList
�
(
�
)
�
;
�
if
�
(
�
groupedLeaveFroms
�
.
�
Count
�
<
�
$num
�
)
�
{
�
lastAppliedLeaves2
�
.
�
Add
�
(
�
dateTime
�
.
�
LeaveId
�
)
�
;
�
}
�
}
�
}
�
if
�
(
�
dateTime
�
.
�
LeaveTo
�
.
�
Date
�
==
�
leaveRequest
�
.
�
ToDate
�
.
�
Date
�
)
�
{
�
if
�
(
�
(
�
dateTime
�
.
�
ToDateDayTypeId
�
==
�
$num
�
&&
�
leaveRequest
�
.
�
ToDateDayTypeId
�
==
�
$num
�
)
�
||
�
(
�
dateTime
�
.
�
ToDateDayTypeId
�
==
�
$num
�
&&
�
leaveRequest
�
.
�
ToDateDayTypeId
�
==
�
$num
�
)
�
)
�
{
�
var
�
groupedLeaveFroms
�
=
�
overlappingLeaves
�
.
�
Where
�
(
�
s
�
=>
�
s
�
.
�
LeaveTo
�
==
�
leaveRequest
�
.
�
ToDate
�
)
�
.
�
ToList
�
(
�
)
�
;
�
if
�
(
�
groupedLeaveFroms
�
.
�
Count
�
<
�
$num
�
)
�
{
�
lastAppliedLeaves2
�
.
�
Add
�
(
�
dateTime
�
.
�
LeaveId
�
)
�
;
�
}
�
}
�
}
�
}
�
return
�
lastAppliedLeaves2
�
;
�
}
�
private
�
ITimePeriodCollection
�
&CheckForOverLappingDaysForAppliedLeave
�
(
�
List
�
<
�
DateTime
�
>
�
appliedDates
�
,
�

�
leaveRequest�
,�
List�
<�
LeaveDetail�
>�

)�
{
�
ITimePeriodCollection
�
overlapPeriods
�
=
�
null
�
;
�
ITimePeriodCollection
�
overlapPeriods2
�
=
�
null
�
;
�
TimePeriodCollection
�
leaveAppliedTimePeriods
�
=
�
new
�
TimePeriodCollection
�
(
�
)
�
;
�
TimePeriodCollection
�
leaveAppliedTimePeriods2
�
=
�
new
�
TimePeriodCollection
�
(
�
)
�
;
�
overlapPeriods
�
=
�
new
�
TimePeriodCollection
�
(
�
)
�
;
�
overlapPeriods2
�
=
�
new
�
TimePeriodCollection
�
(
�
)
�
;
�
List
�
<
�
DateTime
�
>
�
lastAppliedLeaves
�
=
�
new
�
List
�
<
�
DateTime
�
>
�
(
�
)
�
;
�
List
�
<
�
DateTime
�
>
�
lastAppliedLeaves2
�
=
�
new
�
List
�
<
�
DateTime
�
>
�
(
�
)
�
;
�
TimePeriodCollection
�
periodsToCheck
�
=
�
new
�
TimePeriodCollection
�
{
�
new
�
	TimeRange
�
(
�
leaveRequest
�
.
�
FromDate
�
,
�
leaveRequest
�
.
�
ToDate�
)�
}�
;�
foreach
�
(
�
var
�
dateTime
�
in
�

�
)
�
{
�
lastAppliedLeaves
�
.
�
AddRange
�
(
�
dateTime
�
.
�
	LeaveFrom
�
.
�
GetDateRange
�
(
�
dateTime
�
.
�
LeaveTo
�
)
�
.
�
ToList
�
(
�
)
�
)
�
;
�
lastAppliedLeaves2
�
.
�
AddRange
�
(
�
dateTime
�
.
�
	LeaveFrom
�
.
�
GetDateRange
�
(
�
dateTime
�
.
�
	LeaveFrom
�
)
�
.
�
ToList
�
(
�
)
�
)
�
;
�
if
�
(
�
dateTime
�
.
�
	LeaveFrom
�
!=
�
dateTime
�
.
�
LeaveTo
�
)
�
{
�
lastAppliedLeaves2
�
.
�
AddRange
�
(
�
dateTime
�
.
�
LeaveTo
�
.
�
GetDateRange
�
(
�
dateTime
�
.
�
LeaveTo
�
)
�
.
�
ToList
�
(
�
)
�
)
�
;
�
}
�
}
�
foreach
�
(
�
var
�
	dateRange
�
in
�
lastAppliedLeaves
�
)
�
{
�
leaveAppliedTimePeriods
�
.
�
Add
�
(
�
new
�
	TimeRange
�
(
�
	dateRange
�
.
�
Date
�
,
�
	dateRange
�
.
�
Date
�
)
�
)
�
;
�
}
�
foreach
�
(
�
var
�
	dateRange
�
in
�
lastAppliedLeaves2
�
)
�
{
�
leaveAppliedTimePeriods2
�
.
�
Add
�
(
�
new
�
	TimeRange
�
(
�
	dateRange
�
.
�
Date
�
,
�
	dateRange
�
.
�
Date
�
)
�
)
�
;
�
}
�
foreach
�
(
�
DateTime
�
item
�
in
�
appliedDates
�
)
�
{
�
overlapPeriods
�
=
�
leaveAppliedTimePeriods
�
.
�
OverlapPeriods
�
(
�
new
�
	TimeRange
�
(
�
item
�
,
�
item
�
)
�
)
�
;
�
overlapPeriods2
�
=
�
leaveAppliedTimePeriods2
�
.
�
OverlapPeriods
�
(
�
new
�
	TimeRange
�
(
�
item
�
,
�
item
�
)
�
)
�
;
�
if
�
(
�
overlapPeriods2
�
.
�
Count
�
>
�
$num
�
)
�
{
�
var
�
data
�
=
�
)CheckForOverLappingDayTypeForAppliedLeave
�
(
�
overlapPeriods2
�
,
�
leaveRequest
�
,
�

�
)
�
;
�
if
�
(
�
data
�
!=
�
null
�
&&
�
data
�
.
�
Count
�
>
�
$num
�
)
�
{
�
return
�
overlapPeriods
�
=
�
new
�
TimePeriodCollection
�
(
�
)
�
;
�
}
�
}
�
if
�
(
�
overlapPeriods
�
.
�
Count
�
>
�
$num
�
)
�
{
�
return
�
overlapPeriods
�
;
�
}
�
}
�
return
�
overlapPeriods
�
;
�
}
�
private
�
async
�
Task
�
UpdateConsumedLeaves
�
(
�

�

connection
�
,
�

�
empLeaveRequest
�
,
�
double
�
	totalDays
�
)
�
{
�
OracleDynamicParameters
�

parameters
�
=
�
new
�
OracleDynamicParameters
�
(
�
)
�
;
�

parameters
�
.
�
Add
�
(
�
name
�
:
�
$str
�
,
�
empLeaveRequest
�
.
�
	LeaveType
�
.
�

�
,
�
dbType
�
:
�
OracleMappingType�
.�
Int32�
,�
	direction�
:�
ParameterDirection�
.�
Input�
)�
;�

parameters
�
.
�
Add
�
(
�
name
�
:
�
$str
�
,
�
empLeaveRequest
�
.
�
EmployeeSlno
�
,
�
dbType
�
:
�
OracleMappingType
�
.
�
Int32
�
,
�
	direction
�
:
�
ParameterDirection�
.�
Input�
)�
;�

parameters
�
.
�
Add
�
(
�
name
�
:
�
$str
�
,
�
	totalDays
�
,
�
dbType
�
:
�
OracleMappingType
�
.
�
Decimal
�
,
�
	direction
�
:
�
ParameterDirection�
.�
Input�
)�
;�
await
�

connection
�
.
�
ExecuteAsync
�
(
�
DatabaseProcedures
�
.
�
SP_EMP_UPDATE_CONSUMED_LEAVES
�
,
�

parameters
�
,
�
commandType
�
:
�
CommandType�
.�
StoredProcedure�
)�
;�
}
�
private
�
async
�
Task
�
UploadLeaveFile
�
(
�

�

�
,
�
int
�
leaveId
�
,
�

�

connection
�
)
�
{
�
List
�
<
�
OracleDynamicParameters
�
>
�
	parmeters
�
=
�
new
�
(
�
)
�
;
�
bool
�
fileResp
�
=
�
await
�
UploadLeaveFileToDirectory
�
(
�

�
.
�
LeaveFileUploads
�
,
�
leaveId
�
)
�
;
�
if
�
(
�
fileResp
�
)
�
{
�

�
.
�
LeaveFileUploads
�
.
�
ForEach
�
(
�
file
�
=>
�
{
�
var
�
param
�
=
�
new
�
OracleDynamicParameters
�
(
�
)
�
;
�
param
�
.
�
Add
�
(
�
name
�
:
�
$str
�
,
�
leaveId
�
,
�
dbType
�
:
�
OracleMappingType
�
.
�
Int32
�
,
�
	direction
�
:
�
ParameterDirection�
.�
Input�
)�
;�
param
�
.
�
Add
�
(
�
name
�
:
�
$str
�
,
�
file
�
.
�
FileToUpload
�
.
�
FileName
�
,
�
dbType
�
:
�
OracleMappingType
�
.
�
Varchar2
�
,
�
	direction
�
:
�
ParameterDirection�
.�
Input�
)�
;�
param
�
.
�
Add
�
(
�
name
�
:
�
$str
�
,
�
file
�
.
�
FileName_Original
�
,
�
dbType
�
:
�
OracleMappingType
�
.
�
Varchar2
�
,
�
	direction
�
:�
ParameterDirection�
.�
Input�
)�
;�
param
�
.
�
Add
�
(
�
name
�
:
�
$str
�
,
�
file
�
.
�
FilePath
�
,
�
dbType
�
:
�
OracleMappingType
�
.
�
Varchar2
�
,
�
	direction
�
:
�
ParameterDirection�
.�
Input�
)�
;�
	parmeters
�
.
�
Add
�
(
�
param
�
)
�
;
�
}
�
)
�
;
�
}
�
await
�� 

connection
�� 
.
�� 
ExecuteAsync
�� )
(
��) * 
DatabaseProcedures
��* <
.
��< =%
SP_EMP_LEAVE_FILEUPLOAD
��= T
,
��T U
	parmeters
��V _
,
��_ `
commandType
��a l
:
��l m
CommandType
��n y
.
��y z
StoredProcedure��z �
)��� �
;��� �
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  (
UploadLeaveFileToDirectory
��! ;
(
��; <
List
��< @
<
��@ A
LeaveFileUpload
��A P
>
��P Q
leaveFileUploads
��R b
,
��b c
int
��d g
leaveId
��h o
)
��o p
{
�� 	
foreach
�� 
(
�� 
var
�� 
	leaveFile
�� "
in
��# %
leaveFileUploads
��& 6
)
��6 7
{
�� 
if
�� 
(
�� 
	leaveFile
�� 
!=
��  
null
��! %
)
��% &
{
�� 
string
�� 
path
�� 
=
��  !
Path
��" &
.
��& '
Combine
��' .
(
��. /!
ApplicationSettings
��/ B
.
��B C
Current
��C J
.
��J K

��K X
)
��X Y
;
��Y Z
if
�� 
(
�� 
!
�� 
	Directory
�� "
.
��" #
Exists
��# )
(
��) *
path
��* .
)
��. /
)
��/ 0
{
�� 
	Directory
�� !
.
��! "
CreateDirectory
��" 1
(
��1 2
path
��2 6
)
��6 7
;
��7 8
}
�� 
string
�� 
fileType
�� #
=
��$ %
Path
��& *
.
��* +
GetExtension
��+ 7
(
��7 8
	leaveFile
��8 A
.
��A B
FileToUpload
��B N
.
��N O
FileName
��O W
)
��W X
.
��X Y
ToString
��Y a
(
��a b
)
��b c
.
��c d
ToLower
��d k
(
��k l
)
��l m
;
��m n
string
�� 
fileName
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
$str
��4 ?
,
��? @
leaveId
��A H
,
��H I
DateTime
��J R
.
��R S
Now
��S V
.
��V W
Ticks
��W \
,
��\ ]
fileType
��^ f
)
��f g
;
��g h
path
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
path
��( ,
,
��, -
fileName
��. 6
)
��6 7
;
��7 8
if
�� 
(
�� 
!
�� 
File
�� 
.
�� 
Exists
�� $
(
��$ %
path
��% )
)
��) *
)
��* +
{
�� 
string
�� 
base64String
�� +
=
��, -
	leaveFile
��. 7
.
��7 8
FileToUpload
��8 D
.
��D E
FileAsBase64
��E Q
.
��Q R
	Substring
��R [
(
��[ \
	leaveFile
��\ e
.
��e f
FileToUpload
��f r
.
��r s
FileAsBase64
��s 
.�� �
IndexOf��� �
(��� �
$char��� �
)��� �
+��� �
$num��� �
)��� �
;��� �
byte
�� 
[
�� 
]
�� 

imageBytes
�� )
=
��* +
Convert
��, 3
.
��3 4
FromBase64String
��4 D
(
��D E
base64String
��E Q
)
��Q R
;
��R S
File
�� 
.
�� 

�� *
(
��* +
path
��+ /
,
��/ 0

imageBytes
��1 ;
)
��; <
;
��< =
	leaveFile
�� !
.
��! "
FileName_Original
��" 3
=
��4 5
	leaveFile
��6 ?
.
��? @
FileToUpload
��@ L
.
��L M
FileName
��M U
;
��U V
	leaveFile
�� !
.
��! "
FilePath
��" *
=
��+ ,
path
��- 1
;
��1 2
	leaveFile
�� !
.
��! "
FileToUpload
��" .
.
��. /
FileName
��/ 7
=
��8 9
fileName
��: B
;
��B C
}
�� 
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
int
�� 
>
�� !
GetUtilizedOnDuties
�� 2
(
��2 3
int
��3 6
employeeSlno
��7 C
)
��C D
{
�� 	
int
�� 
utilizedOnDuties
��  
=
��! "
$num
��# $
;
��$ %
DateTime
�� 
	startDate
�� 
=
��  
new
��! $
DateTime
��% -
(
��- .
DateTime
��. 6
.
��6 7
Now
��7 :
.
��: ;
Year
��; ?
,
��? @
DateTime
��A I
.
��I J
Now
��J M
.
��M N
Month
��N S
-
��T U
$num
��V W
,
��W X!
ApplicationSettings
��Y l
.
��l m
Current
��m t
.
��t u!
PayrollPeriodStart��u �
)��� �
.��� �

StartOfDay��� �
(��� �
)��� �
;��� �
DateTime
�� 
endDate
�� 
=
�� 
new
�� "
DateTime
��# +
(
��+ ,
DateTime
��, 4
.
��4 5
Now
��5 8
.
��8 9
Year
��9 =
,
��= >
DateTime
��? G
.
��G H
Now
��H K
.
��K L
Month
��L Q
,
��Q R!
ApplicationSettings
��S f
.
��f g
Current
��g n
.
��n o
PayrollPeriodEnd
��o 
)�� �
.��� �
EndOfDay��� �
(��� �
)��� �
;��� �
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
await
��$ )
base
��* .
.
��. /
CreateConnection
��/ ?
(
��? @
DbSchema
��@ H
.
��H I
PORTAL
��I O
)
��O P
)
��P Q
{
�� 
OracleDynamicParameters
�� '

parameters
��( 2
=
��3 4
new
��5 8%
OracleDynamicParameters
��9 P
(
��P Q
)
��Q R
;
��R S

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 4
,
��4 5
employeeSlno
��6 B
,
��B C
dbType
��D J
:
��J K
OracleMappingType
��L ]
.
��] ^
Int32
��^ c
,
��c d
	direction
��e n
:
��n o!
ParameterDirection��p �
.��� �
Input��� �
)��� �
;��� �

parameters
�� 
.
�� 
Add
�� 
(
�� 
name
�� #
:
��# $
$str
��% 2
,
��2 3
	startDate
��4 =
,
��= >
dbType
:
