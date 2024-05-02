âI
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper.Cron\CronJobService.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
.% &
Cron& *
{		 
public

 

abstract

 
class

 
CronJobService

 (
:

) *
IHostedService

+ 9
,

9 :
IDisposable

; F
{ 
private 
System 
. 
Timers 
. 
Timer #
?# $
_timer% +
;+ ,
private 
readonly 
CronExpression '
_expression( 3
;3 4
private 
readonly 
TimeZoneInfo %
_timeZoneInfo& 3
;3 4
	protected 
CronJobService  
(  !
string! '
cronExpression( 6
,6 7
TimeZoneInfo8 D
timeZoneInfoE Q
)Q R
{ 	
_expression 
= 
CronExpression (
.( )
Parse) .
(. /
cronExpression/ =
,= >

CronFormat? I
.I J
IncludeSecondsJ X
)X Y
;Y Z
_timeZoneInfo 
= 
timeZoneInfo (
;( )
} 	
public 
virtual 
async 
Task !

StartAsync" ,
(, -
CancellationToken- >
cancellationToken? P
)P Q
{ 	
await 
ScheduleJob 
( 
cancellationToken /
)/ 0
;0 1
} 	
	protected 
virtual 
async 
Task  $
ScheduleJob% 0
(0 1
CancellationToken1 B
cancellationTokenC T
)T U
{ 	
var 
next 
= 
_expression "
." #
GetNextOccurrence# 4
(4 5
DateTimeOffset5 C
.C D
NowD G
,G H
_timeZoneInfoI V
)V W
;W X
if 
( 
next 
. 
HasValue 
) 
{ 
var   
delay   
=   
next    
.    !
Value  ! &
-  ' (
DateTimeOffset  ) 7
.  7 8
Now  8 ;
;  ; <
if!! 
(!! 
delay!! 
.!! 
TotalMilliseconds!! +
<=!!, .
$num!!/ 0
)!!0 1
{"" 
await## 
ScheduleJob## %
(##% &
cancellationToken##& 7
)##7 8
;##8 9
}$$ 
if%% 
(%% 
delay%% 
.%% 
TotalMilliseconds%% +
>%%, -
$num%%. /
)%%/ 0
{&& 
_timer'' 
='' 
new''  
System''! '
.''' (
Timers''( .
.''. /
Timer''/ 4
(''4 5
delay''5 :
.'': ;
TotalMilliseconds''; L
)''L M
;''M N
_timer(( 
.(( 
Elapsed(( "
+=((# %
async((& +
(((, -
_((- .
,((. /
_((0 1
)((1 2
=>((3 5
{)) 
if** 
(** 
_timer** "
!=**# %
null**& *
)*** +
{**, -
_timer**. 4
.**4 5
Dispose**5 <
(**< =
)**= >
;**> ?
}**@ A
_timer++ 
=++  
null++! %
;++% &
if-- 
(-- 
!-- 
cancellationToken-- .
.--. /#
IsCancellationRequested--/ F
)--F G
{.. 
await// !
DoWork//" (
(//( )
cancellationToken//) :
)//: ;
;//; <
}00 
if22 
(22 
!22 
cancellationToken22 .
.22. /#
IsCancellationRequested22/ F
)22F G
{33 
await44 !
ScheduleJob44" -
(44- .
cancellationToken44. ?
)44? @
;44@ A
}55 
}66 
;66 
}77 
if88 
(88 
_timer88 
!=88 
null88 !
)88! "
{99 
_timer:: 
.:: 
Start::  
(::  !
)::! "
;::" #
};; 
}<< 
await== 
Task== 
.== 
CompletedTask== $
;==$ %
}>> 	
public@@ 
virtual@@ 
async@@ 
Task@@ !
DoWork@@" (
(@@( )
CancellationToken@@) :
cancellationToken@@; L
)@@L M
{AA 	
awaitBB 
TaskBB 
.BB 
DelayBB 
(BB 
$numBB !
,BB! "
cancellationTokenBB# 4
)BB4 5
;BB5 6
}CC 	
publicEE 
virtualEE 
asyncEE 
TaskEE !
	StopAsyncEE" +
(EE+ ,
CancellationTokenEE, =
cancellationTokenEE> O
)EEO P
{FF 	
_timerGG 
?GG 
.GG 
StopGG 
(GG 
)GG 
;GG 
awaitHH 
TaskHH 
.HH 
CompletedTaskHH $
;HH$ %
}II 	
publicKK 
virtualKK 
voidKK 
DisposeKK #
(KK# $
)KK$ %
{LL 	
_timerMM 
?MM 
.MM 
DisposeMM 
(MM 
)MM 
;MM 
GCNN 
.NN 
SuppressFinalizeNN 
(NN  
thisNN  $
)NN$ %
;NN% &
}OO 	
}PP 
publicSS 

	interfaceSS 
IScheduleConfigSS $
<SS$ %
TSS% &
>SS& '
{TT 
stringUU 
CronExpressionUU 
{UU 
getUU  #
;UU# $
setUU% (
;UU( )
}UU* +
TimeZoneInfoVV 
TimeZoneInfoVV !
{VV" #
getVV$ '
;VV' (
setVV) ,
;VV, -
}VV. /
}WW 
publicYY 

classYY 
ScheduleConfigYY 
<YY  
TYY  !
>YY! "
:YY# $
IScheduleConfigYY% 4
<YY4 5
TYY5 6
>YY6 7
{ZZ 
public[[ 
string[[ 
CronExpression[[ $
{[[% &
get[[' *
;[[* +
set[[, /
;[[/ 0
}[[1 2
=[[3 4
string[[5 ;
.[[; <
Empty[[< A
;[[A B
public\\ 
TimeZoneInfo\\ 
TimeZoneInfo\\ (
{\\) *
get\\+ .
;\\. /
set\\0 3
;\\3 4
}\\5 6
=\\7 8
TimeZoneInfo\\9 E
.\\E F
Local\\F K
;\\K L
}]] 
public__ 

static__ 
class__ &
ScheduledServiceExtensions__ 2
{`` 
publicaa 
staticaa 
IServiceCollectionaa (

AddCronJobaa) 3
<aa3 4
Taa4 5
>aa5 6
(aa6 7
thisaa7 ;
IServiceCollectionaa< N
servicesaaO W
,aaW X
ActionaaY _
<aa_ `
IScheduleConfigaa` o
<aao p
Taap q
>aaq r
>aar s
optionsaat {
)aa{ |
where	aa} ‚
T
aaƒ „
:
aa… †
CronJobService
aa‡ •
{bb 	
ifcc 
(cc 
optionscc 
==cc 
nullcc 
)cc  
{dd 
throwee 
newee !
ArgumentNullExceptionee /
(ee/ 0
nameofee0 6
(ee6 7
optionsee7 >
)ee> ?
,ee? @
$streeA k
)eek l
;eel m
}ff 
vargg 
configgg 
=gg 
newgg 
ScheduleConfiggg +
<gg+ ,
Tgg, -
>gg- .
(gg. /
)gg/ 0
;gg0 1
optionshh 
.hh 
Invokehh 
(hh 
confighh !
)hh! "
;hh" #
ifii 
(ii 
stringii 
.ii 
IsNullOrWhiteSpaceii )
(ii) *
configii* 0
.ii0 1
CronExpressionii1 ?
)ii? @
)ii@ A
{jj 
throwkk 
newkk !
ArgumentNullExceptionkk /
(kk/ 0
nameofkk0 6
(kk6 7
ScheduleConfigkk7 E
<kkE F
TkkF G
>kkG H
.kkH I
CronExpressionkkI W
)kkW X
,kkX Y
$str	kkZ ‚
)
kk‚ ƒ
;
kkƒ „
}ll 
servicesnn 
.nn 
AddSingletonnn !
<nn! "
IScheduleConfignn" 1
<nn1 2
Tnn2 3
>nn3 4
>nn4 5
(nn5 6
confignn6 <
)nn< =
;nn= >
servicesoo 
.oo 
AddHostedServiceoo %
<oo% &
Too& '
>oo' (
(oo( )
)oo) *
;oo* +
returnpp 
servicespp 
;pp 
}qq 	
}rr 
}ss 