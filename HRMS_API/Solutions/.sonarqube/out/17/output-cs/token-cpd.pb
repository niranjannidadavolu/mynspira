�
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Enumerations\EnumDescription.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Enumerations *
{ 
public 

static 
class 
EnumDescription '
{ 
public		 
static		 
string		 
GetDescription		 +
(		+ ,
this		, 0
Enum		1 5
value		6 ;
)		; <
{

 	
Type 
type 
= 
value 
. 
GetType %
(% &
)& '
;' (
string 
name 
= 
Enum 
. 
GetName &
(& '
type' +
,+ ,
value- 2
)2 3
;3 4
if 
( 
name 
!= 
null 
) 
{ 
	FieldInfo 
field 
=  !
type" &
.& '
GetField' /
(/ 0
name0 4
)4 5
;5 6
if 
( 
field 
!= 
null !
)! "
{ 
if 
( 
	Attribute !
.! "
GetCustomAttribute" 4
(4 5
field5 :
,: ;
typeof #
(# $ 
DescriptionAttribute$ 8
)8 9
)9 :
is; = 
DescriptionAttribute> R
attrS W
)W X
{ 
return 
attr #
.# $
Description$ /
;/ 0
} 
} 
} 
return 
null 
; 
} 	
} 
} �4
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Enumerations\Enumerations.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Enumerations *
{ 
public 

class 
Enumerations 
{ 
public 
enum 
DbSchema 
{ 
PORTAL %
,% &
NERP' +
}, -
public		 
enum		 
Employee_Details		 $
{

 	
EMPLOYEE 
= 
$num 
, 
EDUCATIONDTLS 
= 
$num 
, 

FAMILYDTLS 
= 
$num 
, 
EXPERIENACEDTLS 
= 
$num 
,  
ADDRESSDTLS 
= 
$num 
, 
ASSET 
= 
$num 
} 	
public 
enum 
	NodeLevel 
{ 	
Module 
= 
$num 
, 
Page 
= 
$num 
, 
PagePermissions 
= 
$num 
} 	
public 
enum 
NodeType 
{ 	
Module 
= 
$num 
, 
Page 
= 
$num 
, 
PagePermissions 
= 
$num 
} 	
public   
enum   
RecordStatus    
{!! 	
Active"" 
="" 
$num"" 
,"" 
InActive## 
=## 
$num## 
,## 
Deleted$$ 
=$$ 
$num$$ 
}%% 	
public'' 
enum'' 
LeaveStatusNames'' $
{(( 	
PendingAndApproval)) 
=))  
$num))! "
,))" #
PendingForApproval** 
=**  
$num**! "
,**" #
Approved++ 
=++ 
$num++ 
,++ 
Rejected,, 
=,, 
$num,, 
,,, 
OnHold-- 
=-- 
$num-- 
,-- 
Canceled.. 
=.. 
$num.. 
}// 	
public11 
enum11 
LeaveDayTypeNames11 %
{22 	
FullDay33 
=33 
$num33 
,33 
	FirstHalf44 
=44 
$num44 
,44 

SecondHalf55 
=55 
$num55 
}66 	
public77 
enum77 
LeaveTypeNames77 "
{88 	
[99 
DisplayValue99 
(99 
$str99 #
)99# $
]99$ %
PRESENT:: 
=:: 
$num:: 
,:: 
[;; 
DisplayValue;; 
(;; 
$str;; !
);;! "
];;" #
LEAVE<< 
=<< 
$num<< 
,<< 
[== 
DisplayValue== 
(== 
$str== #
)==# $
]==$ %
ON_DUTY>> 
=>> 
$num>> 
,>> 
[?? 
DisplayValue?? 
(?? 
$str?? *
)??* +
]??+ ,
MANUAL_PRESENT@@ 
=@@ 
$num@@ 
,@@ 
[AA 
DisplayValueAA 
(AA 
$strAA "
)AA" #
]AA# $
ABSENTBB 
=BB 
$numBB 
,BB 
[CC 
DisplayValueCC 
(CC 
$strCC (
)CC( )
]CC) *
CASUAL_LEAVEDD 
=DD 
$numDD 
,DD 
[EE 
DisplayValueEE 
(EE 
$strEE &
)EE& '
]EE' (

SICK_LEAVEFF 
=FF 
$numFF 
,FF 
[GG 
DisplayValueGG 
(GG 
$strGG +
)GG+ ,
]GG, -
MATERNITY_LEAVEHH 
=HH 
$numHH 
,HH  
[II 
DisplayValueII 
(II 
$strII 1
)II1 2
]II2 3
MARRIAGE_LEAVEJJ 
=JJ 
$numJJ 
,JJ 
[KK 
DisplayValueKK 
(KK 
$strKK '
)KK' (
]KK( )
COVID_LEAVELL 
=LL 
$numLL 
,LL 
[MM 
DisplayValueMM 
(MM 
$strMM -
)MM- .
]MM. /
BEREAVEMENT_LEAVENN 
=NN 
$numNN  "
,NN" #
[OO 
DisplayValueOO 
(OO 
$strOO +
)OO+ ,
]OO, -
SUMMER_VACATIONPP 
=PP 
$numPP  
,PP  !
[QQ 
DisplayValueQQ 
(QQ 
$strQQ +
)QQ+ ,
]QQ, -
WINTER_VACATIONRR 
=RR 
$numRR  
,RR  !
[SS 
DisplayValueSS 
(SS 
$strSS +
)SS+ ,
]SS, -
PATERNITY_LEAVETT 
=TT 
$numTT  
,TT  !
[UU 
DisplayValueUU 
(UU 
$strUU *
)UU* +
]UU+ ,
EARNED_LEAVEVV 
=VV 
$numVV 
,VV 
[WW 
DisplayValueWW 
(WW 
$strWW 0
)WW0 1
]WW1 2 
SPECIAL_CASUAL_LEAVEXX  
=XX! "
$numXX# %
,XX% &
[YY 
DisplayValueYY 
(YY 
$strYY .
)YY. /
]YY/ 0
SPECIAL_SICK_LEAVEZZ 
=ZZ  
$numZZ! #
,ZZ# $
[[[ 
DisplayValue[[ 
([[ 
$str[[ ,
)[[, -
][[- .
COMPENSATORY_OFF\\ 
=\\ 
$num\\ !
,\\! "
[]] 
DisplayValue]] 
(]] 
$str]] -
)]]- .
]]]. /
EARLY_LOGOUT_TIME^^ 
=^^ 
$num^^  "
}__ 	
public`` 
enum`` 
ApplyingFor`` 
{aa 	
Selfbb 
=bb 
$numbb 
,bb 
ForTeamcc 
=cc 
$numcc 
,cc 
ForTeamAndSelfdd 
=dd 
$numdd 
}ee 	
publicgg 
enumgg 
WorkFlowTypegg  
{hh 	
Leaveii 
=ii 
$numii 
,ii 
Traveljj 
=jj 
$numjj 
,jj 

Encashmentkk 
=kk 
$numkk 
}ll 	
}mm 
}nn �
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Enumerations\ErrorEnum.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Enumerations *
{ 
public 

class 
	ErrorEnum 
{ 
public 
enum 

Exceptions 
{		 	"
NullReferenceException

 "
=

# $
$num

% &
,

& '!
FileNotFoundException !
=" #
$num$ %
,% &
OverflowException 
= 
$num  !
,! " 
OutOfMemoryException  
=! "
$num# $
,$ % 
InvalidCastException  
=! "
$num# $
,$ %#
ObjectDisposedException #
=$ %
$num& '
,' ('
UnauthorizedAccessException '
=( )
$num* +
,+ ,#
NotImplementedException #
=$ %
$num& '
,' (!
NotSupportedException !
=" #
$num$ %
,% &%
InvalidOperationException %
=& '
$num( *
,* +
TimeoutException 
= 
$num !
,! "
ArgumentException 
= 
$num  "
," #
FormatException 
= 
$num  
,  !"
StackOverflowException "
=# $
$num% '
,' (
SqlException 
= 
$num 
, $
IndexOutOfRangeException $
=% &
$num' )
,) *
IOException 
= 
$num 
, 
} 	
} 
} �m
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Enumerations\ExceptionType.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Enumerations *
{ 
public 

enum 
ExceptionType 
{ 
[ 	
Description	 
( 
$str b
)b c
]c d$
AccessViolationException  
,  !
[		 	
Description			 
(		 
$str		 l
)		l m
]		m n
AggregateException

 
,

 
[ 	
Description	 
( 
$str e
)e f
]f g&
AppDomainUnloadedException "
," #
[ 	
Description	 
( 
$str Z
)Z [
][ \ 
ApplicationException 
, 
[ 	
Description	 
( 
$str ^
)^ _
]_ `
ArgumentException 
, 
[ 	
Description	 
( 
$str o
)o p
]p q!
ArgumentNullException 
, 
[ 	
Description	 
( 
$str l
)l m
]m n'
ArgumentOutOfRangeException #
,# $
[ 	
Description	 
( 
$str k
)k l
]l m
ArithmeticException 
, 
[ 	
Description	 
( 
$str r
)r s
]s t&
ArrayTypeMismatchException "
," #
[ 	
Description	 
( 
$str b
)b c
]c d#
BadImageFormatException 
,  
[ 	
Description	 
( 
$str b
)b c
]c d*
CannotUnloadAppDomainException &
,& '
[ 	
Description	 
( 
$str	 �
)
� �
]
� �#
ContextMarshalException 
,  
[ 	
Description	 
( 
$str	 �
)
� �
]
� �#
DataMisalignedException   
,    
[!! 	
Description!!	 
(!! 
$str!! {
)!!{ |
]!!| }!
DivideByZeroException"" 
,"" 
[## 	
Description##	 
(## 
$str## h
)##h i
]##i j 
DllNotFoundException$$ 
,$$ 
[%% 	
Description%%	 
(%% 
$str	%% �
)
%%� �
]
%%� �(
DuplicateWaitObjectException&& $
,&&$ %
['' 	
Description''	 
('' 
$str	'' �
)
''� �
]
''� �'
EntryPointNotFoundException(( #
,((# $
[)) 	
Description))	 
()) 
$str	)) �
)
))� �
]
))� �$
ExecutionEngineException**  
,**  !
[++ 	
Description++	 
(++ 
$str	++ �
)
++� �
]
++� � 
FieldAccessException,, 
,,, 
[-- 	
Description--	 
(-- 
$str	-- �
)
--� �
]
--� �
FormatException.. 
,.. 
[// 	
Description//	 
(// 
$str	// �
)
//� �
]
//� �$
IndexOutOfRangeException00  
,00  !
[11 	
Description11	 
(11 
$str	11 �
)
11� �
]
11� �'
InsufficientMemoryException22 #
,22# $
[33 	
Description33	 
(33 
$str33 n
)33n o
]33o p 
InvalidCastException44 
,44 
[55 	
Description55	 
(55 
$str	55 �
)
55� �
]
55� �%
InvalidOperationException66 !
,66! "
[77 	
Description77	 
(77 
$str	77 �
)
77� �
]
77� �#
InvalidProgramException88 
,88  
[99 	
Description99	 
(99 
$str99 i
)99i j
]99j k$
InvalidTimeZoneException::  
,::  !
[;; 	
Description;;	 
(;; 
$str;; r
);;r s
];;s t!
MemberAccessException<< 
,<< 
[== 	
Description==	 
(== 
$str	== �
)
==� �
]
==� �!
MethodAccessException>> 
,>> 
[?? 	
Description??	 
(?? 
$str	?? �
)
??� �
]
??� �!
MissingFieldException@@ 
,@@ 
[AA 	
DescriptionAA	 
(AA 
$str	AA �
)
AA� �
]
AA� �"
MissingMemberExceptionBB 
,BB 
[CC 	
DescriptionCC	 
(CC 
$str	CC �
)
CC� �
]
CC� �"
MissingMethodExceptionDD 
,DD 
[EE 	
DescriptionEE	 
(EE 
$str	EE �
)
EE� �
]
EE� �*
MulticastNotSupportedExceptionFF &
,FF& '
[GG 	
DescriptionGG	 
(GG 
$strGG y
)GGy z
]GGz {"
NotCancelableExceptionHH 
,HH 
[II 	
DescriptionII	 
(II 
$str	II �
)
II� �
]
II� �$
NotFiniteNumberExceptionJJ  
,JJ  !
[KK 	
DescriptionKK	 
(KK 
$strKK {
)KK{ |
]KK| }#
NotImplementedExceptionLL 
,LL  
[MM 	
DescriptionMM	 
(MM 
$str	MM �
)
MM� �
]
MM� �!
NotSupportedExceptionNN 
,NN 
[OO 	
DescriptionOO	 
(OO 
$str	OO �
)
OO� �
]
OO� �"
NullReferenceExceptionPP 
,PP 
[QQ 	
DescriptionQQ	 
(QQ 
$strQQ w
)QQw x
]QQx y#
ObjectDisposedExceptionRR 
,RR  
[SS 	
DescriptionSS	 
(SS 
$str	SS �
)
SS� �
]
SS� �&
OperationCanceledExceptionTT "
,TT" #
[UU 	
DescriptionUU	 
(UU 
$str	UU �
)
UU� �
]
UU� � 
OutOfMemoryExceptionVV 
,VV 
[WW 	
DescriptionWW	 
(WW 
$str	WW �
)
WW� �
]
WW� �
OverflowExceptionXX 
,XX 
[YY 	
DescriptionYY	 
(YY 
$strYY x
)YYx y
]YYy z)
PlatformNotSupportedExceptionZZ %
,ZZ% &
[[[ 	
Description[[	 
([[ 
$str	[[ �
)
[[� �
]
[[� �
RankException\\ 
,\\ 
[]] 	
Description]]	 
(]] 
$str	]] �
)
]]� �
]
]]� �"
StackOverflowException^^ 
,^^ 
[__ 	
Description__	 
(__ 
$str__ _
)___ `
]__` a
SystemException`` 
,`` 
[aa 	
Descriptionaa	 
(aa 
$str	aa �
)
aa� �
]
aa� �
TimeoutExceptionbb 
,bb 
[cc 	
Descriptioncc	 
(cc 
$strcc d
)ccd e
]cce f%
TimeZoneNotFoundExceptiondd !
,dd! "
[ee 	
Descriptionee	 
(ee 
$str	ee �
)
ee� �
]
ee� �
TypeAccessExceptionff 
,ff 
[gg 	
Descriptiongg	 
(gg 
$str	gg �
)
gg� �
]
gg� �'
TypeInitializationExceptionhh #
,hh# $
[ii 	
Descriptionii	 
(ii 
$strii d
)iid e
]iie f
TypeLoadExceptionjj 
,jj 
[kk 	
Descriptionkk	 
(kk 
$strkk x
)kkx y
]kky z!
TypeUnloadedExceptionll 
,ll 
[mm 	
Descriptionmm	 
(mm 
$str	mm �
)
mm� �
]
mm� �'
UnauthorizedAccessExceptionnn #
,nn# $
[oo 	
Descriptionoo	 
(oo 
$str	oo �
)
oo� �
]
oo� �
UriFormatExceptionpp 
,pp 
[qq 	
Descriptionqq	 
(qq 
$str	qq �
)
qq� �
]
qq� �
ConstraintExceptionrr 
,rr 
[ss 	
Descriptionss	 
(ss 
$str	ss �
)
ss� �
]
ss� �
DataExceptiontt 
,tt 
[uu 	
Descriptionuu	 
(uu 
$struu v
)uuv w
]uuw x"
DBConcurrencyExceptionvv 
,vv 
[ww 	
Descriptionww	 
(ww 
$str	ww �
)
ww� �
]
ww� �*
DeleteRowInaccessibleExceptionxx &
,xx& '
[yy 	
Descriptionyy	 
(yy 
$str	yy �
)
yy� �
]
yy� �"
DuplicateNameExceptionzz 
,zz 
[{{ 	
Description{{	 
({{ 
$str	{{ �
)
{{� �
]
{{� �
EvaluateException|| 
,|| 
[}} 	
Description}}	 
(}} 
$str	}} �
)
}}� �
]
}}� �'
InRowChangingEventException~~ #
,~~# $
[ 	
Description	 
( 
$str	 �
)
� �
]
� �(
InvalidConstraintException
�� "
,
��" #
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �(
InvalidExpressionException
�� "
,
��" #
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �(
MissingPrimaryKeyException
�� "
,
��" #
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �$
NoNullAllowedException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� p
)
��p q
]
��q r'
OperationAbortedException
�� !
,
��! "
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �
ReadOnlyException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �$
RowNotInTableException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �#
StrongTypingException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �"
SyntaxErrorException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �,
TypedDataSetGeneratorException
�� &
,
��& '
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �&
VersionNotFoundException
��  
,
��  !
[
�� 	
Description
��	 
(
�� 
$str
�� t
)
��t u
]
��u v(
DirectoryNotFoundException
�� "
,
��" #
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �$
DriveNotFoundException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �"
EndOfStreamException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �!
FileFormatException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� y
)
��y z
]
��z {
FileLoadException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �#
FileNotFoundException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� ^
)
��^ _
]
��_ `-
InternalBufferOverflowException
�� '
,
��' (
[
�� 	
Description
��	 
(
�� 
$str
�� n
)
��n o
]
��o p"
InvalidDataException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� \
)
��\ ]
]
��] ^
IOException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str�� �
)��� �
]��� �"
PathTooLongException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� V
)
��V W
]
��W X
PipeException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� Q
)
��Q R
]
��R S
ADOException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� X
)
��X Y
]
��Y Z
DbException
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� H
)
��H I
]
��I J
	Exception
�� 
,
�� 
}
�� 
}�� 