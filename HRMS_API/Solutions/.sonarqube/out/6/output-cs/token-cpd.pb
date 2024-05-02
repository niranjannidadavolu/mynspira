�
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\AmbiguousMomentException.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 
class 
AmbiguousMomentException &
:' (
	Exception) 2
{ 
public $
AmbiguousMomentException	 !
(! "
DateTime" *
moment+ 1
)1 2
{ 
this		 
.		 
moment		 
=		 
moment		 
;		 
}

 
public $
AmbiguousMomentException	 !
(! "
DateTime" *
moment+ 1
,1 2
string3 9
message: A
)A B
:C D
base 
( 
message 
) 
{
this 
. 
moment 
= 
moment 
; 
} 
public $
AmbiguousMomentException	 !
(! "
DateTime" *
moment+ 1
,1 2
	Exception3 <
cause= B
)B C
:D E
base 
( 
cause 
.
Message 
, 
cause 
) 
{ 
this 
. 
moment 
= 
moment 
; 
} 
public $
AmbiguousMomentException	 !
(! "
DateTime" *
moment+ 1
,1 2
string3 9
message: A
,A B
	ExceptionC L
causeM R
)R S
:T U
base 
( 
message 
, 
cause 
) 
{ 
this 
. 
moment 
= 
moment 
; 
} 
public 
DateTime	 
Moment 
{ 
get 
{ 
return	 
moment 
; 
} 
} 
private 	
readonly
 
DateTime 
moment "
;" #
}   
}!! �=
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\BroadcastCalendarTool.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

static 
class !
BroadcastCalendarTool -
{ 
public 
static 
int 
GetWeeksOfYear (
(( )
int) ,
year- 1
)1 2
{		 	
DateTime

 
	yearStart

 
=

  
GetStartOfYear

! /
(

/ 0
year

0 4
)

4 5
;

5 6
DateTime 

=# $
GetStartOfYear% 3
(3 4
year4 8
+9 :
$num; <
)< =
;= >
return 
( 
int 
) 

.% &
Subtract& .
(. /
	yearStart/ 8
)8 9
.9 :
	TotalDays: C
/D E
TimeSpecF N
.N O
DaysPerWeekO Z
;Z [
}
public 
static 
void 
	GetWeekOf $
($ %
DateTime% -
moment. 4
,4 5
out6 9
int: =
year> B
,B C
outD G
intH K
weekL P
)P Q
{ 	
	GetYearOf 
( 
moment 
, 
out !
year" &
)& '
;' (
DateTime 
firstWeekStart #
=$ %
GetStartOfWeek& 4
(4 5
year5 9
,9 :
$num; <
)< =
;= >
week 
= 
$num 
+ 
( 
int 
) 
( 
moment #
.# $
Subtract$ ,
(, -
firstWeekStart- ;
); <
.< =
	TotalDays= F
/G H
TimeSpecI Q
.Q R
DaysPerWeekR ]
)] ^
;^ _
} 	
public 
static 
DateTime 
GetStartOfWeek -
(- .
int. 1
year2 6
,6 7
int8 ;
week< @
)@ A
{ 	
DateTime 
	yearStart 
=  
GetStartOfYear! /
(/ 0
year0 4
)4 5
;5 6
return 
	yearStart 
. 
AddDays $
($ %
(% &
week& *
-+ ,
$num- .
). /
*0 1
TimeSpec2 :
.: ;
DaysPerWeek; F
)F G
;G H
} 	
public 
static 
void 
	AddMonths $
($ %
int% (
	startYear) 2
,2 3
	YearMonth4 =

startMonth> H
,H I
intJ M
	addMonthsN W
,W X
outY \
int] `

targetYeara k
,k l
outm p
	YearMonthq z
targetMonth	{ �
)
� �
{ 	
int 
totalMonths 
= 
	startYear '
*( )
TimeSpec* 2
.2 3

+A B
(C D
(D E
intE H
)H I

startMonthI S
-T U
$numV W
)W X
+Y Z
	addMonths[ d
;d e

targetYear   
=   
totalMonths   $
/  % &
TimeSpec  ' /
.  / 0

;  = >
targetMonth!! 
=!! 
(!! 
	YearMonth!! $
)!!$ %
(!!% &
totalMonths!!& 1
%!!2 3
TimeSpec!!4 <
.!!< =

+!!K L
$num!!M N
)!!N O
;!!O P
}"" 	
public## 
static## 
void## 

GetMonthOf## %
(##% &
DateTime##& .
moment##/ 5
,##5 6
out##7 :
int##; >
year##? C
,##C D
out##E H
	YearMonth##I R
month##S X
)##X Y
{$$ 	
int%% 
currentYear%% 
=%% 
moment%% $
.%%$ %
Year%%% )
;%%) *
	YearMonth&& 
currentMonth&& "
=&&# $
	YearMonth&&% .
.&&. /
January&&/ 6
;&&6 7
do'' 
{(( 
	AddMonths)) 
()) 
currentYear)) %
,))% &
currentMonth))' 3
,))3 4
$num))5 6
,))6 7
out))8 ;
currentYear))< G
,))G H
out))I L
currentMonth))M Y
)))Y Z
;))Z [
if** 
(** 
GetStartOfMonth** #
(**# $
currentYear**$ /
,**/ 0
currentMonth**1 =
)**= >
>**? @
moment**A G
)**G H
{++ 
	AddMonths,, 
(,, 
currentYear,, )
,,,) *
currentMonth,,+ 7
,,,7 8
-,,9 :
$num,,: ;
,,,; <
out,,= @
year,,A E
,,,E F
out,,G J
month,,K P
),,P Q
;,,Q R
break-- 
;-- 
}.. 
}// 
while// 
(// 
true// 
)// 
;// 
}00 	
public11 
static11 
DateTime11 
GetStartOfMonth11 .
(11. /
int11/ 2
year113 7
,117 8
	YearMonth119 B
month11C H
)11H I
{22 	
DateTime33 
start33 
=33 
new33  
DateTime33! )
(33) *
year33* .
,33. /
(330 1
int331 4
)334 5
month335 :
,33: ;
$num33< =
)33= >
;33> ?
start44 
=44 
start44 
.44 
	DayOfWeek44 #
==44$ &
	DayOfWeek44' 0
.440 1
Sunday441 7
?448 9
start55 
.55 
AddDays55 
(55 
-55 
$num55  
)55  !
:55" #
start66 
.66 
AddDays66 
(66 
-66 
(66  
(66  !
int66! $
)66$ %
start66% *
.66* +
	DayOfWeek66+ 4
-665 6
$num667 8
)668 9
)669 :
;66: ;
return88 
start88 
;88 
}99 	
public== 
static== 
void== 
	GetYearOf== $
(==$ %
DateTime==% -
moment==. 4
,==4 5
out==6 9
int==: =
year==> B
)==B C
{>> 	
year?? 
=?? 
moment?? 
.?? 
Year?? 
;?? 
whileAA 
(AA 
GetStartOfYearAA !
(AA! "
yearAA" &
+AA' (
$numAA) *
)AA* +
<=AA, .
momentAA/ 5
)AA5 6
{BB 
yearCC 
++CC 
;CC 
}DD 
}EE 	
publicFF 
staticFF 
DateTimeFF 
GetStartOfYearFF -
(FF- .
intFF. 1
yearFF2 6
)FF6 7
{GG 	
returnHH 
GetStartOfMonthHH "
(HH" #
yearHH# '
,HH' (
	YearMonthHH) 2
.HH2 3
JanuaryHH3 :
)HH: ;
;HH; <
}II 	
}KK 
}LL �N
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\BroadcastMonth.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

sealed 
class 
BroadcastMonth &
:' (
CalendarTimeRange) :
{ 
public 
BroadcastMonth 
( 
) 
:  !
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public		 
BroadcastMonth		 
(		 

calendar		, 4
)		4 5
:		6 7
this

 
(

 

ClockProxy

 
.

 
Clock

 !
.

! "
Now

" %
,

% &
calendar

' /
)

/ 0
{ 	
} 	
public
BroadcastMonth
(
DateTime
moment
)
:
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{ 	
} 	
public 
BroadcastMonth 
( 
DateTime &
moment' -
,- .

calendar= E
)E F
:G H
this 
( 
	GetYearOf 
( 
moment !
)! "
," #

GetMonthOf$ .
(. /
moment/ 5
)5 6
,6 7
calendar8 @
)@ A
{ 	
} 	
public 
BroadcastMonth 
( 
int !
year" &
,& '
	YearMonth( 1
month2 7
)7 8
:9 :
this 
( 
year 
, 
month 
, 
new !
TimeCalendar" .
(. /
)/ 0
)0 1
{ 	
} 	
public 
BroadcastMonth 
( 
int !
year" &
,& '
	YearMonth( 1
month2 7
,7 8

calendarG O
)O P
:Q R
base 
( 
GetPeriodOf 
( 
year !
,! "
month# (
)( )
,) *
calendar+ 3
)3 4
{ 	
this 
. 
year 
= 
year 
; 
this 
. 
month 
= 
month 
; 
} 	
public 
	YearMonth 
Month 
{   	
get!! 
{!! 
return!! 
month!! 
;!! 
}!!  !
}"" 	
public## 
int## 
Year## 
{$$ 	
get%% 
{%% 
return%% 
year%% 
;%% 
}%%  
}&& 	
public'' !
ITimePeriodCollection'' $
GetDays''% ,
('', -
)''- .
{(( 	 
TimePeriodCollection))  
days))! %
=))& '
new))( + 
TimePeriodCollection)), @
())@ A
)))A B
;))B C
DateTime** 
moment** 
=** 
Start** #
.**# $
Date**$ (
;**( )
while++ 
(++ 
moment++ 
<=++ 
End++  
.++  !
Date++! %
)++% &
{,, 
days-- 
.-- 
Add-- 
(-- 
new-- 
Day--  
(--  !
moment--! '
.--' (
Date--( ,
,--, -
Calendar--. 6
)--6 7
)--7 8
;--8 9
moment.. 
=.. 
moment.. 
...  
AddDays..  '
(..' (
$num..( )
)..) *
;..* +
}// 
return00 
days00 
;00 
}11 	
public44 !
ITimePeriodCollection44 $
GetWeeks44% -
(44- .
)44. /
{55 	 
TimePeriodCollection66  
weeks66! &
=66' (
new66) , 
TimePeriodCollection66- A
(66A B
)66B C
;66C D
DateTime77 
moment77 
=77 
Start77 #
.77# $
Date77$ (
;77( )
while88 
(88 
moment88 
<88 
End88 
.88  
Date88  $
)88$ %
{99 
weeks:: 
.:: 
Add:: 
(:: 
new:: 

(::+ ,
moment::, 2
.::2 3
Date::3 7
,::7 8
Calendar::9 A
)::A B
)::B C
;::C D
moment;; 
=;; 
moment;; 
.;;  
AddDays;;  '
(;;' (
TimeSpec;;( 0
.;;0 1
DaysPerWeek;;1 <
);;< =
;;;= >
}<< 
return== 
weeks== 
;== 
}>> 	
publicAA 
BroadcastMonthAA 
GetPreviousMonthAA .
(AA. /
)AA/ 0
{BB 	
returnCC 
	AddMonthsCC 
(CC 
-CC 
$numCC 
)CC  
;CC  !
}DD 	
publicGG 
BroadcastMonthGG 
GetNextMonthGG *
(GG* +
)GG+ ,
{HH 	
returnII 
	AddMonthsII 
(II 
$numII 
)II 
;II  
}JJ 	
publicMM 
BroadcastMonthMM 
	AddMonthsMM '
(MM' (
intMM( +
monthsMM, 2
)MM2 3
{NN 	
intOO 

targetYearOO 
;OO 
	YearMonthPP 
targetMonthPP !
;PP! "!
BroadcastCalendarToolQQ !
.QQ! "
	AddMonthsQQ" +
(QQ+ ,
YearQQ, 0
,QQ0 1
MonthQQ2 7
,QQ7 8
monthsQQ9 ?
,QQ? @
outQQA D

targetYearQQE O
,QQO P
outQQQ T
targetMonthQQU `
)QQ` a
;QQa b
returnRR 
newRR 
BroadcastMonthRR %
(RR% &

targetYearRR& 0
,RR0 1
targetMonthRR2 =
,RR= >
CalendarRR? G
)RRG H
;RRH I
}SS 	
	protectedVV 
overrideVV 
stringVV !
FormatVV" (
(VV( )
ITimeFormatterVV) 7
	formatterVV8 A
)VVA B
{WW 	
returnXX 
	formatterXX 
.XX 
GetCalendarPeriodXX .
(XX. /
stringXX/ 5
.XX5 6
FormatXX6 <
(XX< =
$strXX= F
,XXF G
YearXXH L
,XXL M
MonthXXN S
)XXS T
,XXT U
	formatterYY 
.YY 
GetShortDateYY &
(YY& '
StartYY' ,
)YY, -
,YY- .
	formatterYY/ 8
.YY8 9
GetShortDateYY9 E
(YYE F
EndYYF I
)YYI J
,YYJ K
DurationYYL T
)YYT U
;YYU V
}ZZ 	
private]] 
static]] 
int]] 
	GetYearOf]] $
(]]$ %
DateTime]]% -
moment]]. 4
)]]4 5
{^^ 	
int__ 
year__ 
;__ !
BroadcastCalendarTool`` !
.``! "
	GetYearOf``" +
(``+ ,
moment``, 2
,``2 3
out``4 7
year``8 <
)``< =
;``= >
returnaa 
yearaa 
;aa 
}bb 	
privateee 
staticee 
	YearMonthee  

GetMonthOfee! +
(ee+ ,
DateTimeee, 4
momentee5 ;
)ee; <
{ff 	
intgg 
yeargg 
;gg 
	YearMonthhh 
monthhh 
;hh !
BroadcastCalendarToolii !
.ii! "

GetMonthOfii" ,
(ii, -
momentii- 3
,ii3 4
outii5 8
yearii9 =
,ii= >
outii? B
monthiiC H
)iiH I
;iiI J
returnjj 
monthjj 
;jj 
}kk 	
privatenn 
staticnn 

ITimeRangenn !
GetPeriodOfnn" -
(nn- .
intnn. 1
yearnn2 6
,nn6 7
	YearMonthnn8 A
monthnnB G
)nnG H
{oo 	
DateTimepp 
startpp 
=pp !
BroadcastCalendarToolpp 2
.pp2 3
GetStartOfMonthpp3 B
(ppB C
yearppC G
,ppG H
monthppI N
)ppN O
;ppO P
ifqq 
(qq 
monthqq 
==qq 
	YearMonthqq "
.qq" #
Decemberqq# +
)qq+ ,
{rr 
yearss 
++ss 
;ss 
monthtt 
=tt 
	YearMonthtt !
.tt! "
Januarytt" )
;tt) *
}uu 
elsevv 
{ww 
monthxx 
++xx 
;xx 
}yy 
DateTimezz 
endzz 
=zz !
BroadcastCalendarToolzz 0
.zz0 1
GetStartOfMonthzz1 @
(zz@ A
yearzzA E
,zzE F
monthzzG L
)zzL M
;zzM N
return{{ 
new{{ 
CalendarTimeRange{{ (
({{( )
start{{) .
,{{. /
end{{0 3
){{3 4
;{{4 5
}|| 	
private
�� 
readonly
�� 
int
�� 
year
�� !
;
��! "
private
�� 
readonly
�� 
	YearMonth
�� "
month
��# (
;
��( )
}
�� 
}�� �>
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\BroadcastWeek.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

sealed 
class 

:& '
CalendarTimeRange( 9
{ 
public 

( 
) 
:  
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public		 

(		 

calendar		+ 3
)		3 4
:		5 6
this

 
(

 

ClockProxy

 
.

 
Clock

 !
.

! "
Now

" %
,

% &
calendar

' /
)

/ 0
{ 	
} 	
public

(
DateTime
moment
)
:
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{ 	
} 	
public 

( 
DateTime %
moment& ,
,, -

calendar< D
)D E
:F G
this 
( 
	GetYearOf 
( 
moment !
)! "
," #
	GetWeekOf$ -
(- .
moment. 4
)4 5
,5 6
calendar7 ?
)? @
{ 	
} 	
public 

( 
int  
year! %
,% &
int' *
week+ /
)/ 0
:1 2
this 
( 
year 
, 
week 
, 
new  
TimeCalendar! -
(- .
). /
)/ 0
{ 	
} 	
public 

( 
int  
year! %
,% &
int' *
week+ /
,/ 0

calendar? G
)G H
:I J
base 
( 
GetPeriodOf 
( 
year !
,! "
week# '
)' (
,( )
calendar* 2
)2 3
{ 	
this 
. 
year 
= 
year 
; 
this 
. 
week 
= 
week 
; 
} 	
public 
int 
Week 
{   	
get!! 
{!! 
return!! 
week!! 
;!! 
}!!  
}"" 	
public## 
int## 
Year## 
{$$ 	
get%% 
{%% 
return%% 
year%% 
;%% 
}%%  
}&& 	
public'' !
ITimePeriodCollection'' $
GetDays''% ,
('', -
)''- .
{(( 	 
TimePeriodCollection))  
days))! %
=))& '
new))( + 
TimePeriodCollection)), @
())@ A
)))A B
;))B C
DateTime** 
moment** 
=** 
Start** #
.**# $
Date**$ (
;**( )
while++ 
(++ 
moment++ 
<=++ 
End++  
.++  !
Date++! %
)++% &
{,, 
days-- 
.-- 
Add-- 
(-- 
new-- 
Day--  
(--  !
moment--! '
.--' (
Date--( ,
,--, -
Calendar--. 6
)--6 7
)--7 8
;--8 9
moment.. 
=.. 
moment.. 
...  
AddDays..  '
(..' (
$num..( )
)..) *
;..* +
}// 
return00 
days00 
;00 
}11 	
public22 

GetPreviousWeek22 ,
(22, -
)22- .
{33 	
return44 
AddWeeks44 
(44 
-44 
$num44 
)44 
;44  
}55 	
public66 

GetNextWeek66 (
(66( )
)66) *
{77 	
return88 
AddWeeks88 
(88 
$num88 
)88 
;88 
}99 	
public:: 

AddWeeks:: %
(::% &
int::& )
weeks::* /
)::/ 0
{;; 	
return<< 
new<< 

(<<$ %
Start<<% *
.<<* +
AddDays<<+ 2
(<<2 3
weeks<<3 8
*<<9 :
TimeSpec<<; C
.<<C D
DaysPerWeek<<D O
)<<O P
,<<P Q
Calendar<<R Z
)<<Z [
;<<[ \
}== 	
	protected>> 
override>> 
string>> !
Format>>" (
(>>( )
ITimeFormatter>>) 7
	formatter>>8 A
)>>A B
{?? 	
return@@ 
	formatter@@ 
.@@ 
GetCalendarPeriod@@ .
(@@. /
string@@/ 5
.@@5 6
Format@@6 <
(@@< =
$str@@= F
,@@F G
Year@@H L
,@@L M
Week@@N R
)@@R S
,@@S T
	formatterAA 
.AA 
GetShortDateAA &
(AA& '
StartAA' ,
)AA, -
,AA- .
	formatterAA/ 8
.AA8 9
GetShortDateAA9 E
(AAE F
EndAAF I
)AAI J
,AAJ K
DurationAAL T
)AAT U
;AAU V
}BB 	
privateCC 
staticCC 
intCC 
	GetYearOfCC $
(CC$ %
DateTimeCC% -
momentCC. 4
)CC4 5
{DD 	
intEE 
yearEE 
;EE !
BroadcastCalendarToolFF !
.FF! "
	GetYearOfFF" +
(FF+ ,
momentFF, 2
,FF2 3
outFF4 7
yearFF8 <
)FF< =
;FF= >
returnGG 
yearGG 
;GG 
}HH 	
privateII 
staticII 
intII 
	GetWeekOfII $
(II$ %
DateTimeII% -
momentII. 4
)II4 5
{JJ 	
intKK 
yearKK 
;KK 
intLL 
weekLL 
;LL !
BroadcastCalendarToolMM !
.MM! "
	GetWeekOfMM" +
(MM+ ,
momentMM, 2
,MM2 3
outMM4 7
yearMM8 <
,MM< =
outMM> A
weekMMB F
)MMF G
;MMG H
returnNN 
weekNN 
;NN 
}OO 	
privatePP 
staticPP 

ITimeRangePP !
GetPeriodOfPP" -
(PP- .
intPP. 1
yearPP2 6
,PP6 7
intPP8 ;
weekPP< @
)PP@ A
{QQ 	
DateTimeRR 
startRR 
=RR !
BroadcastCalendarToolRR 2
.RR2 3
GetStartOfWeekRR3 A
(RRA B
yearRRB F
,RRF G
weekRRH L
)RRL M
;RRM N
returnSS 
newSS 
CalendarTimeRangeSS (
(SS( )
startSS) .
,SS. /
startSS0 5
.SS5 6
AddDaysSS6 =
(SS= >
TimeSpecSS> F
.SSF G
DaysPerWeekSSG R
)SSR S
)SSS T
;SST U
}TT 	
privateUU 
readonlyUU 
intUU 
yearUU !
;UU! "
privateVV 
readonlyVV 
intVV 
weekVV !
;VV! "
}XX 
}YY �:
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\BroadcastYear.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

sealed 
class 

:& '
CalendarTimeRange( 9
{ 
public 

( 
) 
:  
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 

( 

calendar+ 3
)3 4
:5 6
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{ 	
} 	
public 

( 
DateTime %
moment& ,
), -
:. /
this   
(   
moment   
,   
new   
TimeCalendar   )
(  ) *
)  * +
)  + ,
{!! 	
}"" 	
public%% 

(%% 
DateTime%% %
moment%%& ,
,%%, -

calendar%%< D
)%%D E
:%%F G
this&& 
(&& 
	GetYearOf&& 
(&& 
moment&& !
)&&! "
,&&" #
calendar&&$ ,
)&&, -
{'' 	
}(( 	
public++ 

(++ 
int++  
year++! %
)++% &
:++' (
this,, 
(,, 
year,, 
,,, 
new,, 
TimeCalendar,, '
(,,' (
),,( )
),,) *
{-- 	
}.. 	
public11 

(11 
int11  
year11! %
,11% &

calendar115 =
)11= >
:11? @
base22 
(22 
GetPeriodOf22 
(22 
year22 !
)22! "
,22" #
calendar22$ ,
)22, -
{33 	
this44 
.44 
year44 
=44 
year44 
;44 
}55 	
public88 
int88 
Year88 
{99 	
get:: 
{:: 
return:: 
year:: 
;:: 
}::  
};; 	
public>> !
ITimePeriodCollection>> $
GetWeeks>>% -
(>>- .
)>>. /
{?? 	 
TimePeriodCollection@@  
weeks@@! &
=@@' (
new@@) , 
TimePeriodCollection@@- A
(@@A B
)@@B C
;@@C D
intAA 
	weekCountAA 
=AA !
BroadcastCalendarToolAA 1
.AA1 2
GetWeeksOfYearAA2 @
(AA@ A
yearAAA E
)AAE F
;AAF G
forBB 
(BB 
intBB 
weekBB 
=BB 
$numBB 
;BB 
weekBB #
<=BB$ &
	weekCountBB' 0
;BB0 1
weekBB2 6
++BB6 8
)BB8 9
{CC 
weeksDD 
.DD 
AddDD 
(DD 
newDD 

(DD+ ,
yearDD, 0
,DD0 1
weekDD2 6
)DD6 7
)DD7 8
;DD8 9
}EE 
returnFF 
weeksFF 
;FF 
}GG 	
publicJJ !
ITimePeriodCollectionJJ $
	GetMonthsJJ% .
(JJ. /
)JJ/ 0
{KK 	 
TimePeriodCollectionLL  
monthsLL! '
=LL( )
newLL* - 
TimePeriodCollectionLL. B
(LLB C
)LLC D
;LLD E
forMM 
(MM 
intMM 
monthMM 
=MM 
$numMM 
;MM 
monthMM  %
<=MM& (
TimeSpecMM) 1
.MM1 2

;MM? @
monthMMA F
++MMF H
)MMH I
{NN 
monthsOO 
.OO 
AddOO 
(OO 
newOO 
BroadcastMonthOO -
(OO- .
yearOO. 2
,OO2 3
(OO4 5
	YearMonthOO5 >
)OO> ?
monthOO? D
)OOD E
)OOE F
;OOF G
}PP 
returnQQ 
monthsQQ 
;QQ 
}RR 	
publicUU 

GetPreviousYearUU ,
(UU, -
)UU- .
{VV 	
returnWW 
AddYearsWW 
(WW 
-WW 
$numWW 
)WW 
;WW  
}XX 	
public[[ 

GetNextYear[[ (
([[( )
)[[) *
{\\ 	
return]] 
AddYears]] 
(]] 
$num]] 
)]] 
;]] 
}^^ 	
publicaa 

AddYearsaa %
(aa% &
intaa& )
countaa* /
)aa/ 0
{bb 	
returncc 
newcc 

(cc$ %
Yearcc% )
+cc* +
countcc, 1
,cc1 2
Calendarcc3 ;
)cc; <
;cc< =
}dd 	
	protectedgg 
overridegg 
stringgg !
Formatgg" (
(gg( )
ITimeFormattergg) 7
	formattergg8 A
)ggA B
{hh 	
returnii 
	formatterii 
.ii 
GetCalendarPeriodii .
(ii. /
Yearii/ 3
.ii3 4
ToStringii4 <
(ii< =
CultureInfoii= H
.iiH I
InvariantCultureiiI Y
)iiY Z
,iiZ [
	formatterjj 
.jj 
GetShortDatejj &
(jj& '
Startjj' ,
)jj, -
,jj- .
	formatterjj/ 8
.jj8 9
GetShortDatejj9 E
(jjE F
EndjjF I
)jjI J
,jjJ K
DurationjjL T
)jjT U
;jjU V
}kk 	
privatenn 
staticnn 
intnn 
	GetYearOfnn $
(nn$ %
DateTimenn% -
momentnn. 4
)nn4 5
{oo 	
intpp 
yearpp 
;pp !
BroadcastCalendarToolqq !
.qq! "
	GetYearOfqq" +
(qq+ ,
momentqq, 2
,qq2 3
outqq4 7
yearqq8 <
)qq< =
;qq= >
returnrr 
yearrr 
;rr 
}ss 	
privatevv 
staticvv 

ITimeRangevv !
GetPeriodOfvv" -
(vv- .
intvv. 1
yearvv2 6
)vv6 7
{ww 	
returnxx 
newxx 
CalendarTimeRangexx (
(xx( )!
BroadcastCalendarToolyy %
.yy% &
GetStartOfYearyy& 4
(yy4 5
yearyy5 9
)yy9 :
,yy: ;!
BroadcastCalendarToolzz %
.zz% &
GetStartOfYearzz& 4
(zz4 5
yearzz5 9
+zz: ;
$numzz< =
)zz= >
)zz> ?
;zz? @
}{{ 	
private 
readonly 
int 
year !
;! "
}
�� 
}�� ��
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarDateAdd.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
CalendarDateAdd  
:! "
DateAdd# *
{ 
public 
CalendarDateAdd 
( 
)  
:! "
this 
( 
new 
TimeCalendar !
(! "
new" %
TimeCalendarConfig& 8
{9 :
	EndOffset; D
=E F
TimeSpanG O
.O P
ZeroP T
}U V
)V W
)W X
{ 	
} 	
public 
CalendarDateAdd 
( 

calendar- 5
)5 6
{ 	
if 
( 
calendar 
== 
null  
)  !
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 :
): ;
;; <
} 
if 
( 
calendar 
. 
StartOffset $
!=% '
TimeSpan( 0
.0 1
Zero1 5
)5 6
{ 
throw   
new   '
ArgumentOutOfRangeException   5
(  5 6
$str  6 @
,  @ A
$str  B P
)  P Q
;  Q R
}!! 
if"" 
("" 
calendar"" 
."" 
	EndOffset"" "
!=""# %
TimeSpan""& .
."". /
Zero""/ 3
)""3 4
{## 
throw$$ 
new$$ '
ArgumentOutOfRangeException$$ 5
($$5 6
$str$$6 @
,$$@ A
$str$$B N
)$$N O
;$$O P
}%% 
this&& 
.&& 
calendar&& 
=&& 
calendar&& $
;&&$ %
}'' 	
public** 
IList** 
<** 
	DayOfWeek** 
>** 
WeekDays**  (
{++ 	
get,, 
{,, 
return,, 
weekDays,, !
;,,! "
},,# $
}-- 	
public00 
IList00 
<00 
	HourRange00 
>00 
WorkingHours00  ,
{11 	
get22 
{22 
return22 
workingHours22 %
;22% &
}22' (
}33 	
public66 
IList66 
<66 
DayHourRange66 !
>66! "
WorkingDayHours66# 2
{77 	
get88 
{88 
return88 
workingDayHours88 (
;88( )
}88* +
}99 	
public<< 

Calendar<< %
{== 	
get>> 
{>> 
return>> 
calendar>> !
;>>! "
}>># $
}?? 	
publicBB 
newBB !
ITimePeriodCollectionBB (
IncludePeriodsBB) 7
{CC 	
getDD 
{DD 
throwDD 
newDD !
NotSupportedExceptionDD 1
(DD1 2
)DD2 3
;DD3 4
}DD5 6
}EE 	
publicHH 
voidHH 
AddWorkingWeekDaysHH &
(HH& '
)HH' (
{II 	
weekDaysJJ 
.JJ 
AddJJ 
(JJ 
	DayOfWeekJJ "
.JJ" #
MondayJJ# )
)JJ) *
;JJ* +
weekDaysKK 
.KK 
AddKK 
(KK 
	DayOfWeekKK "
.KK" #
TuesdayKK# *
)KK* +
;KK+ ,
weekDaysLL 
.LL 
AddLL 
(LL 
	DayOfWeekLL "
.LL" #
	WednesdayLL# ,
)LL, -
;LL- .
weekDaysMM 
.MM 
AddMM 
(MM 
	DayOfWeekMM "
.MM" #
ThursdayMM# +
)MM+ ,
;MM, -
weekDaysNN 
.NN 
AddNN 
(NN 
	DayOfWeekNN "
.NN" #
FridayNN# )
)NN) *
;NN* +
}OO 	
publicRR 
voidRR 
AddWeekendWeekDaysRR &
(RR& '
)RR' (
{SS 	
weekDaysTT 
.TT 
AddTT 
(TT 
	DayOfWeekTT "
.TT" #
SaturdayTT# +
)TT+ ,
;TT, -
weekDaysUU 
.UU 
AddUU 
(UU 
	DayOfWeekUU "
.UU" #
SundayUU# )
)UU) *
;UU* +
}VV 	
publicYY 
overrideYY 
DateTimeYY  
?YY  !
SubtractYY" *
(YY* +
DateTimeYY+ 3
startYY4 9
,YY9 :
TimeSpanYY; C
offsetYYD J
,YYJ K
SeekBoundaryModeYYL \
seekBoundaryModeYY] m
=YYn o
SeekBoundaryMode	YYp �
.
YY� �
Next
YY� �
)
YY� �
{ZZ 	
if[[ 
([[ 
weekDays[[ 
.[[ 
Count[[ 
==[[ !
$num[[" #
&&[[$ &
ExcludePeriods[[' 5
.[[5 6
Count[[6 ;
==[[< >
$num[[? @
&&[[A C
workingHours[[D P
.[[P Q
Count[[Q V
==[[W Y
$num[[Z [
)[[[ \
{\\ 
return]] 
start]] 
.]] 
Subtract]] %
(]]% &
offset]]& ,
)]], -
;]]- .
}^^ 
return`` 
offset`` 
<`` 
TimeSpan`` $
.``$ %
Zero``% )
?``* +
CalculateEndaa 
(aa 
startaa "
,aa" #
offsetaa$ *
.aa* +
Negateaa+ 1
(aa1 2
)aa2 3
,aa3 4

.aaB C
ForwardaaC J
,aaJ K
seekBoundaryModeaaL \
)aa\ ]
:aa^ _
CalculateEndbb 
(bb 
startbb "
,bb" #
offsetbb$ *
,bb* +

.bb9 :
Backwardbb: B
,bbB C
seekBoundaryModebbD T
)bbT U
;bbU V
}cc 	
publicff 
overrideff 
DateTimeff  
?ff  !
Addff" %
(ff% &
DateTimeff& .
startff/ 4
,ff4 5
TimeSpanff6 >
offsetff? E
,ffE F
SeekBoundaryModeffG W
seekBoundaryModeffX h
=ffi j
SeekBoundaryModeffk {
.ff{ |
Next	ff| �
)
ff� �
{gg 	
ifhh 
(hh 
weekDayshh 
.hh 
Counthh 
==hh !
$numhh" #
&&hh$ &
ExcludePeriodshh' 5
.hh5 6
Counthh6 ;
==hh< >
$numhh? @
&&hhA C
workingHourshhD P
.hhP Q
CounthhQ V
==hhW Y
$numhhZ [
)hh[ \
{ii 
returnjj 
startjj 
.jj 
Addjj  
(jj  !
offsetjj! '
)jj' (
;jj( )
}kk 
returnmm 
offsetmm 
<mm 
TimeSpanmm $
.mm$ %
Zeromm% )
?mm* +
CalculateEndnn 
(nn 
startnn "
,nn" #
offsetnn$ *
.nn* +
Negatenn+ 1
(nn1 2
)nn2 3
,nn3 4

.nnB C
BackwardnnC K
,nnK L
seekBoundaryModennM ]
)nn] ^
:nn_ `
CalculateEndoo 
(oo 
startoo "
,oo" #
offsetoo$ *
,oo* +

.oo9 :
Forwardoo: A
,ooA B
seekBoundaryModeooC S
)ooS T
;ooT U
}pp 	
	protectedss 
DateTimess 
?ss 
CalculateEndss (
(ss( )
DateTimess) 1
startss2 7
,ss7 8
TimeSpanss9 A
offsetssB H
,ssH I


,tt' (
SeekBoundaryModett) 9
seekBoundaryModett: J
)ttJ K
{uu 	
ifvv 
(vv 
offsetvv 
<vv 
TimeSpanvv !
.vv! "
Zerovv" &
)vv& '
{ww 
throwxx 
newxx %
InvalidOperationExceptionxx 3
(xx3 4
$strxx4 P
)xxP Q
;xxQ R
}yy 
DateTime{{ 
?{{ 
endDate{{ 
={{ 
null{{  $
;{{$ %
DateTime|| 
moment|| 
=|| 
start|| #
;||# $
TimeSpan}} 
?}} 
	remaining}} 
=}}  !
offset}}" (
;}}( )
Week~~ 
week~~ 
=~~ 
new~~ 
Week~~  
(~~  !
start~~! &
,~~& '
calendar~~( 0
)~~0 1
;~~1 2
while
�� 
(
�� 
week
�� 
!=
�� 
null
�� 
)
��  
{
�� 
base
�� 
.
�� 
IncludePeriods
�� #
.
��# $
Clear
��$ )
(
��) *
)
��* +
;
��+ ,
base
�� 
.
�� 
IncludePeriods
�� #
.
��# $
AddAll
��$ *
(
��* +%
GetAvailableWeekPeriods
��+ B
(
��B C
week
��C G
)
��G H
)
��H I
;
��I J
endDate
�� 
=
�� 
CalculateEnd
�� &
(
��& '
moment
��' -
,
��- .
	remaining
��/ 8
.
��8 9
Value
��9 >
,
��> ?

��@ M
,
��M N
seekBoundaryMode
��O _
,
��_ `
out
��a d
	remaining
��e n
)
��n o
;
��o p
if
�� 
(
�� 
endDate
�� 
!=
�� 
null
�� #
||
��$ &
!
��' (
	remaining
��( 1
.
��1 2
HasValue
��2 :
)
��: ;
{
�� 
break
�� 
;
�� 
}
�� 
switch
�� 
(
�� 

�� %
)
��% &
{
�� 
case
�� 

�� &
.
��& '
Forward
��' .
:
��. /
week
�� 
=
�� 
FindNextWeek
�� +
(
��+ ,
week
��, 0
)
��0 1
;
��1 2
if
�� 
(
�� 
week
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
moment
�� "
=
��# $
week
��% )
.
��) *
Start
��* /
;
��/ 0
}
�� 
break
�� 
;
�� 
case
�� 

�� &
.
��& '
Backward
��' /
:
��/ 0
week
�� 
=
�� 
FindPreviousWeek
�� /
(
��/ 0
week
��0 4
)
��4 5
;
��5 6
if
�� 
(
�� 
week
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
moment
�� "
=
��# $
week
��% )
.
��) *
End
��* -
;
��- .
}
�� 
break
�� 
;
�� 
}
�� 
}
�� 
return
�� 
endDate
�� 
;
�� 
}
�� 	
private
�� 
Week
�� 
FindNextWeek
�� !
(
��! "
Week
��" &
current
��' .
)
��. /
{
�� 	
if
�� 
(
�� 
ExcludePeriods
�� 
.
�� 
Count
�� $
==
��% '
$num
��( )
)
��) *
{
�� 
return
�� 
current
�� 
.
�� 
GetNextWeek
�� *
(
��* +
)
��+ ,
;
��, -
}
�� 
	TimeRange
�� 
limits
�� 
=
�� 
new
�� "
	TimeRange
��# ,
(
��, -
current
��- 4
.
��4 5
End
��5 8
.
��8 9
AddTicks
��9 A
(
��A B
$num
��B C
)
��C D
,
��D E
DateTime
��F N
.
��N O
MaxValue
��O W
)
��W X
;
��X Y
TimeGapCalculator
�� 
<
�� 
	TimeRange
�� '
>
��' (

��) 6
=
��7 8
new
��9 <
TimeGapCalculator
��= N
<
��N O
	TimeRange
��O X
>
��X Y
(
��Y Z
calendar
��Z b
)
��b c
;
��c d#
ITimePeriodCollection
�� !
remainingPeriods
��" 2
=
��3 4

��5 B
.
��B C
GetGaps
��C J
(
��J K
ExcludePeriods
��K Y
,
��Y Z
limits
��[ a
)
��a b
;
��b c
return
�� 
remainingPeriods
�� #
.
��# $
Count
��$ )
>
��* +
$num
��, -
?
��. /
new
��0 3
Week
��4 8
(
��8 9
remainingPeriods
��9 I
[
��I J
$num
��J K
]
��K L
.
��L M
Start
��M R
)
��R S
:
��T U
null
��V Z
;
��Z [
}
�� 	
private
�� 
Week
�� 
FindPreviousWeek
�� %
(
��% &
Week
��& *
current
��+ 2
)
��2 3
{
�� 	
if
�� 
(
�� 
ExcludePeriods
�� 
.
�� 
Count
�� $
==
��% '
$num
��( )
)
��) *
{
�� 
return
�� 
current
�� 
.
�� 
GetPreviousWeek
�� .
(
��. /
)
��/ 0
;
��0 1
}
�� 
	TimeRange
�� 
limits
�� 
=
�� 
new
�� "
	TimeRange
��# ,
(
��, -
DateTime
��- 5
.
��5 6
MinValue
��6 >
,
��> ?
current
��@ G
.
��G H
Start
��H M
.
��M N
AddTicks
��N V
(
��V W
-
��W X
$num
��X Y
)
��Y Z
)
��Z [
;
��[ \
TimeGapCalculator
�� 
<
�� 
	TimeRange
�� '
>
��' (

��) 6
=
��7 8
new
��9 <
TimeGapCalculator
��= N
<
��N O
	TimeRange
��O X
>
��X Y
(
��Y Z
calendar
��Z b
)
��b c
;
��c d#
ITimePeriodCollection
�� !
remainingPeriods
��" 2
=
��3 4

��5 B
.
��B C
GetGaps
��C J
(
��J K
ExcludePeriods
��K Y
,
��Y Z
limits
��[ a
)
��a b
;
��b c
return
�� 
remainingPeriods
�� #
.
��# $
Count
��$ )
>
��* +
$num
��, -
?
��. /
new
��0 3
Week
��4 8
(
��8 9
remainingPeriods
��9 I
[
��I J
remainingPeriods
��J Z
.
��Z [
Count
��[ `
-
��a b
$num
��c d
]
��d e
.
��e f
End
��f i
)
��i j
:
��k l
null
��m q
;
��q r
}
�� 	
	protected
�� 
virtual
�� 
IEnumerable
�� %
<
��% &
ITimePeriod
��& 1
>
��1 2%
GetAvailableWeekPeriods
��3 J
(
��J K
Week
��K O
week
��P T
)
��T U
{
�� 	
if
�� 
(
�� 
weekDays
�� 
.
�� 
Count
�� 
==
�� !
$num
��" #
&&
��$ &
workingHours
��' 3
.
��3 4
Count
��4 9
==
��: <
$num
��= >
&&
��? A
WorkingDayHours
��B Q
.
��Q R
Count
��R W
==
��X Z
$num
��[ \
)
��\ ]
{
�� 
return
�� 
new
�� "
TimePeriodCollection
�� /
{
��0 1
week
��2 6
}
��7 8
;
��8 9
}
�� 
CalendarPeriodCollectorFilter
�� )
filter
��* 0
=
��1 2
new
��3 6+
CalendarPeriodCollectorFilter
��7 T
(
��T U
)
��U V
;
��V W
foreach
�� 
(
�� 
	DayOfWeek
�� 
weekDay
�� &
in
��' )
weekDays
��* 2
)
��2 3
{
�� 
filter
�� 
.
�� 
WeekDays
�� 
.
��  
Add
��  #
(
��# $
weekDay
��$ +
)
��+ ,
;
��, -
}
�� 
foreach
�� 
(
�� 
	HourRange
�� 
workingHour
�� *
in
��+ -
workingHours
��. :
)
��: ;
{
�� 
filter
�� 
.
�� 
CollectingHours
�� &
.
��& '
Add
��' *
(
��* +
workingHour
��+ 6
)
��6 7
;
��7 8
}
�� 
foreach
�� 
(
�� 
DayHourRange
�� !
workingDayHour
��" 0
in
��1 3
workingDayHours
��4 C
)
��C D
{
�� 
filter
�� 
.
��  
CollectingDayHours
�� )
.
��) *
Add
��* -
(
��- .
workingDayHour
��. <
)
��< =
;
��= >
}
�� 
CalendarPeriodCollector
�� #

��$ 1
=
��2 3
new
�� %
CalendarPeriodCollector
�� +
(
��+ ,
filter
��, 2
,
��2 3
week
��4 8
,
��8 9

��: G
.
��G H
Forward
��H O
,
��O P
calendar
��Q Y
)
��Y Z
;
��Z [

�� 
.
�� 
CollectHours
�� &
(
��& '
)
��' (
;
��( )
return
�� 

��  
.
��  !
Periods
��! (
;
��( )
}
�� 	
private
�� 
readonly
�� 
List
�� 
<
�� 
	DayOfWeek
�� '
>
��' (
weekDays
��) 1
=
��2 3
new
��4 7
List
��8 <
<
��< =
	DayOfWeek
��= F
>
��F G
(
��G H
)
��H I
;
��I J
private
�� 
readonly
�� 
List
�� 
<
�� 
	HourRange
�� '
>
��' (
workingHours
��) 5
=
��6 7
new
��8 ;
List
��< @
<
��@ A
	HourRange
��A J
>
��J K
(
��K L
)
��L M
;
��M N
private
�� 
readonly
�� 
List
�� 
<
�� 
DayHourRange
�� *
>
��* +
workingDayHours
��, ;
=
��< =
new
��> A
List
��B F
<
��F G
DayHourRange
��G S
>
��S T
(
��T U
)
��U V
;
��V W
private
�� 
readonly
�� 

�� &
calendar
��' /
;
��/ 0
}
�� 
}�� �L
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarDateDiff.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
CalendarDateDiff !
{ 
public 
CalendarDateDiff 
(  
)  !
:" #
this 
( 
new 
TimeCalendar !
(! "
new" %
TimeCalendarConfig& 8
{9 :
	EndOffset; D
=E F
TimeSpanG O
.O P
ZeroP T
}U V
)V W
,W X
newY \
DurationProvider] m
(m n
)n o
)o p
{ 	
} 	
public 
CalendarDateDiff 
(  

calendar. 6
,6 7
IDurationProvider8 I
durationProviderJ Z
)Z [
{ 	
if 
( 
calendar 
== 
null  
)  !
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 :
): ;
;; <
} 
if 
( 
durationProvider  
==! #
null$ (
)( )
{ 
throw   
new   !
ArgumentNullException   /
(  / 0
$str  0 B
)  B C
;  C D
}!! 
if"" 
("" 
calendar"" 
."" 
StartOffset"" $
!=""% '
TimeSpan""( 0
.""0 1
Zero""1 5
)""5 6
{## 
throw$$ 
new$$ '
ArgumentOutOfRangeException$$ 5
($$5 6
$str$$6 @
,$$@ A
$str$$B P
)$$P Q
;$$Q R
}%% 
if&& 
(&& 
calendar&& 
.&& 
	EndOffset&& "
!=&&# %
TimeSpan&&& .
.&&. /
Zero&&/ 3
)&&3 4
{'' 
throw(( 
new(( '
ArgumentOutOfRangeException(( 5
(((5 6
$str((6 @
,((@ A
$str((B N
)((N O
;((O P
})) 
this++ 
.++ 
calendar++ 
=++ 
calendar++ $
;++$ %
this,, 
.,, 
durationProvider,, !
=,," #
durationProvider,,$ 4
;,,4 5
}-- 	
public00 
IList00 
<00 
	DayOfWeek00 
>00 
WeekDays00  (
{11 	
get22 
{22 
return22 
collectorFilter22 (
.22( )
WeekDays22) 1
;221 2
}223 4
}33 	
public66 
IList66 
<66 
	HourRange66 
>66 
WorkingHours66  ,
{77 	
get88 
{88 
return88 
collectorFilter88 (
.88( )
CollectingHours88) 8
;888 9
}88: ;
}99 	
public<< 
IList<< 
<<< 
DayHourRange<< !
><<! "
WorkingDayHours<<# 2
{== 	
get>> 
{>> 
return>> 
collectorFilter>> (
.>>( )
CollectingDayHours>>) ;
;>>; <
}>>= >
}?? 	
publicBB 

CalendarBB %
{CC 	
getDD 
{DD 
returnDD 
calendarDD !
;DD! "
}DD# $
}EE 	
publicHH 
IDurationProviderHH  
DurationProviderHH! 1
{II 	
getJJ 
{JJ 
returnJJ 
durationProviderJJ )
;JJ) *
}JJ+ ,
}KK 	
publicNN 
voidNN 
AddWorkingWeekDaysNN &
(NN& '
)NN' (
{OO 	
WeekDaysPP 
.PP 
AddPP 
(PP 
	DayOfWeekPP "
.PP" #
MondayPP# )
)PP) *
;PP* +
WeekDaysQQ 
.QQ 
AddQQ 
(QQ 
	DayOfWeekQQ "
.QQ" #
TuesdayQQ# *
)QQ* +
;QQ+ ,
WeekDaysRR 
.RR 
AddRR 
(RR 
	DayOfWeekRR "
.RR" #
	WednesdayRR# ,
)RR, -
;RR- .
WeekDaysSS 
.SS 
AddSS 
(SS 
	DayOfWeekSS "
.SS" #
ThursdaySS# +
)SS+ ,
;SS, -
WeekDaysTT 
.TT 
AddTT 
(TT 
	DayOfWeekTT "
.TT" #
FridayTT# )
)TT) *
;TT* +
}UU 	
publicXX 
voidXX 
AddWeekendWeekDaysXX &
(XX& '
)XX' (
{YY 	
WeekDaysZZ 
.ZZ 
AddZZ 
(ZZ 
	DayOfWeekZZ "
.ZZ" #
SaturdayZZ# +
)ZZ+ ,
;ZZ, -
WeekDays[[ 
.[[ 
Add[[ 
([[ 
	DayOfWeek[[ "
.[[" #
Sunday[[# )
)[[) *
;[[* +
}\\ 	
public__ 
TimeSpan__ 

Difference__ "
(__" #
DateTime__# +
date__, 0
)__0 1
{`` 	
returnaa 

Differenceaa 
(aa 
dateaa "
,aa" #

ClockProxyaa$ .
.aa. /
Clockaa/ 4
.aa4 5
Nowaa5 8
)aa8 9
;aa9 :
}bb 	
publicee 
TimeSpanee 

Differenceee "
(ee" #
DateTimeee# +
date1ee, 1
,ee1 2
DateTimeee3 ;
date2ee< A
)eeA B
{ff 	
ifgg 
(gg 
date1gg 
.gg 
Equalsgg 
(gg 
date2gg "
)gg" #
)gg# $
{hh 
returnii 
TimeSpanii 
.ii  
Zeroii  $
;ii$ %
}jj 
ifkk 
(kk 
collectorFilterkk 
.kk  
WeekDayskk  (
.kk( )
Countkk) .
==kk/ 1
$numkk2 3
&&kk4 6
collectorFilterkk7 F
.kkF G
CollectingHourskkG V
.kkV W
CountkkW \
==kk] _
$numkk` a
&&kkb d
collectorFilterkke t
.kkt u
CollectingDayHours	kku �
.
kk� �
Count
kk� �
==
kk� �
$num
kk� �
)
kk� �
{ll 
returnmm 
newmm 
DateDiffmm #
(mm# $
date1mm$ )
,mm) *
date2mm+ 0
,mm0 1
calendarmm2 :
.mm: ;
Culturemm; B
.mmB C
CalendarmmC K
,mmK L
calendarmmM U
.mmU V
FirstDayOfWeekmmV d
,mmd e
calendarmmf n
.mmn o

)mm| }
.mm} ~

Difference	mm~ �
;
mm� �
}nn 
	TimeRangepp 
differenceRangepp %
=pp& '
newpp( +
	TimeRangepp, 5
(pp5 6
date1pp6 ;
,pp; <
date2pp= B
)ppB C
;ppC D#
CalendarPeriodCollectorrr #
	collectorrr$ -
=rr. /
newrr0 3#
CalendarPeriodCollectorrr4 K
(rrK L
collectorFilterss 
,ss  
newss! $
	TimeRangess% .
(ss. /
differenceRangess/ >
.ss> ?
Startss? D
.ssD E
DatessE I
,ssI J
differenceRangessK Z
.ssZ [
Endss[ ^
.ss^ _
Datess_ c
.ssc d
AddDaysssd k
(ssk l
$numssl m
)ssm n
)ssn o
,sso p

.ss~ 
Forward	ss �
,
ss� �
calendar
ss� �
)
ss� �
;
ss� �
	collectortt 
.tt 
CollectHourstt "
(tt" #
)tt# $
;tt$ %
TimeGapCalculatorww 
<ww 
	TimeRangeww '
>ww' (

=ww7 8
newww9 <
TimeGapCalculatorww= N
<wwN O
	TimeRangewwO X
>wwX Y
(wwY Z
calendarwwZ b
)wwb c
;wwc d!
ITimePeriodCollectionxx !
gapsxx" &
=xx' (

.xx6 7
GetGapsxx7 >
(xx> ?
	collectorxx? H
.xxH I
PeriodsxxI P
,xxP Q
differenceRangexxR a
)xxa b
;xxb c
TimeSpan{{ 

difference{{ 
={{  !
gaps{{" &
.{{& '
GetTotalDuration{{' 7
({{7 8
durationProvider{{8 H
){{H I
;{{I J
return|| 
date1|| 
<|| 
date2||  
?||! "

difference||# -
:||. /

difference||0 :
.||: ;
Negate||; A
(||A B
)||B C
;||C D
}}} 	
private
�� 
readonly
�� +
CalendarPeriodCollectorFilter
�� 6
collectorFilter
��7 F
=
��G H
new
��I L+
CalendarPeriodCollectorFilter
��M j
(
��j k
)
��k l
;
��l m
private
�� 
readonly
�� 

�� &
calendar
��' /
;
��/ 0
private
�� 
readonly
�� 
IDurationProvider
�� *
durationProvider
��+ ;
;
��; <
}
�� 
}�� �
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarNameType.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 
CalendarNameType  
{ 
Full 
, 
Abbreviated 
, 
} 
} ��
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarPeriodCollector.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class #
CalendarPeriodCollector (
:) *
CalendarVisitor+ :
<: ;)
CalendarPeriodCollectorFilter; X
,X Y*
CalendarPeriodCollectorContextZ x
>x y
{ 
public #
CalendarPeriodCollector &
(& ')
CalendarPeriodCollectorFilter' D
filterE K
,K L
ITimePeriodM X
limitsY _
,_ `


=( )

.7 8
Forward8 ?
,? @

calendarO W
=X Y
nullZ ^
)^ _
:` a
base 
( 
filter 
, 
limits 
,  

,. /
calendar0 8
)8 9
{ 	
} 	
public !
ITimePeriodCollection $
Periods% ,
{ 	
get 
{ 
return 
periods  
;  !
}" #
} 	
public 
void 
CollectYears  
(  !
)! "
{   	
StartPeriodVisit!! 
(!! 
new!!  *
CalendarPeriodCollectorContext!!! ?
{!!@ A
Scope!!B G
=!!H I*
CalendarPeriodCollectorContext!!J h
.!!h i
CollectType!!i t
.!!t u
Year!!u y
}!!z {
)!!{ |
;!!| }
}"" 	
public%% 
void%% 

(%%! "
)%%" #
{&& 	
StartPeriodVisit'' 
('' 
new''  *
CalendarPeriodCollectorContext''! ?
{''@ A
Scope''B G
=''H I*
CalendarPeriodCollectorContext''J h
.''h i
CollectType''i t
.''t u
Month''u z
}''{ |
)''| }
;''} ~
}(( 	
public++ 
void++ 
CollectDays++ 
(++  
)++  !
{,, 	
StartPeriodVisit-- 
(-- 
new--  *
CalendarPeriodCollectorContext--! ?
{--@ A
Scope--B G
=--H I*
CalendarPeriodCollectorContext--J h
.--h i
CollectType--i t
.--t u
Day--u x
}--y z
)--z {
;--{ |
}.. 	
public11 
void11 
CollectHours11  
(11  !
)11! "
{22 	
StartPeriodVisit33 
(33 
new33  *
CalendarPeriodCollectorContext33! ?
{33@ A
Scope33B G
=33H I*
CalendarPeriodCollectorContext33J h
.33h i
CollectType33i t
.33t u
Hour33u y
}33z {
)33{ |
;33| }
}44 	
public77 
override77 
string77 
ToString77 '
(77' (
)77( )
{88 	
return99 
periods99 
.99 
ToString99 #
(99# $
)99$ %
;99% &
}:: 	
	protected== 
override== 
bool== 

EnterYears==  *
(==* +
Years==+ 0
years==1 6
,==6 7*
CalendarPeriodCollectorContext==8 V
context==W ^
)==^ _
{>> 	
return?? 
context@@ 
.@@ 
Scope@@ 
==@@  *
CalendarPeriodCollectorContext@@! ?
.@@? @
CollectType@@@ K
.@@K L
Month@@L Q
||@@R T
contextAA 
.AA 
ScopeAA 
==AA  *
CalendarPeriodCollectorContextAA! ?
.AA? @
CollectTypeAA@ K
.AAK L
DayAAL O
||AAP R
contextBB 
.BB 
ScopeBB 
==BB  *
CalendarPeriodCollectorContextBB! ?
.BB? @
CollectTypeBB@ K
.BBK L
HourBBL P
;BBP Q
}CC 	
	protectedFF 
overrideFF 
boolFF 
EnterMonthsFF  +
(FF+ ,
YearFF, 0
yearFF1 5
,FF5 6*
CalendarPeriodCollectorContextFF7 U
contextFFV ]
)FF] ^
{GG 	
returnHH 
contextII 
.II 
ScopeII 
==II  *
CalendarPeriodCollectorContextII! ?
.II? @
CollectTypeII@ K
.IIK L
DayIIL O
||IIP R
contextJJ 
.JJ 
ScopeJJ 
==JJ  *
CalendarPeriodCollectorContextJJ! ?
.JJ? @
CollectTypeJJ@ K
.JJK L
HourJJL P
;JJP Q
}KK 	
	protectedNN 
overrideNN 
boolNN 
	EnterDaysNN  )
(NN) *
MonthNN* /
monthNN0 5
,NN5 6*
CalendarPeriodCollectorContextNN7 U
contextNNV ]
)NN] ^
{OO 	
returnPP 
contextQQ 
.QQ 
ScopeQQ 
==QQ  *
CalendarPeriodCollectorContextQQ! ?
.QQ? @
CollectTypeQQ@ K
.QQK L
HourQQL P
;QQP Q
}RR 	
	protectedUU 
overrideUU 
boolUU 

EnterHoursUU  *
(UU* +
DayUU+ .
dayUU/ 2
,UU2 3*
CalendarPeriodCollectorContextUU4 R
contextUUS Z
)UUZ [
{VV 	
returnWW 
falseWW 
;WW 
}XX 	
	protected[[ 
override[[ 
bool[[ 
OnVisitYears[[  ,
([[, -
Years[[- 2
years[[3 8
,[[8 9*
CalendarPeriodCollectorContext[[: X
context[[Y `
)[[` a
{\\ 	
if]] 
(]] 
context]] 
.]] 
Scope]] 
!=]]  *
CalendarPeriodCollectorContext]]! ?
.]]? @
CollectType]]@ K
.]]K L
Year]]L P
)]]P Q
{^^ 
return__ 
true__ 
;__ 
}`` 
foreachbb 
(bb 
Yearbb 
yearbb 
inbb !
yearsbb" '
.bb' (
GetYearsbb( 0
(bb0 1
)bb1 2
)bb2 3
{cc 
ifdd 
(dd 
IsMatchingYeardd "
(dd" #
yeardd# '
,dd' (
contextdd) 0
)dd0 1
&&dd2 4
CheckLimitsdd5 @
(dd@ A
yearddA E
)ddE F
)ddF G
{ee 
periodsff 
.ff 
Addff 
(ff  
yearff  $
)ff$ %
;ff% &
}gg 
}hh 
returnii 
falseii 
;ii 
}jj 	
	protectedmm 
overridemm 
boolmm 
OnVisitYearmm  +
(mm+ ,
Yearmm, 0
yearmm1 5
,mm5 6*
CalendarPeriodCollectorContextmm7 U
contextmmV ]
)mm] ^
{nn 	
ifoo 
(oo 
contextoo 
.oo 
Scopeoo 
!=oo  *
CalendarPeriodCollectorContextoo! ?
.oo? @
CollectTypeoo@ K
.ooK L
MonthooL Q
)ooQ R
{pp 
returnqq 
trueqq 
;qq 
}rr 
ifuu 
(uu 
Filteruu 
.uu 
CollectingMonthsuu '
.uu' (
Countuu( -
==uu. 0
$numuu1 2
)uu2 3
{vv 
foreachww 
(ww 
Monthww 
monthww $
inww% '
yearww( ,
.ww, -
	GetMonthsww- 6
(ww6 7
)ww7 8
)ww8 9
{xx 
ifyy 
(yy 
IsMatchingMonthyy '
(yy' (
monthyy( -
,yy- .
contextyy/ 6
)yy6 7
&&yy8 :
CheckLimitsyy; F
(yyF G
monthyyG L
)yyL M
)yyM N
{zz 
periods{{ 
.{{  
Add{{  #
({{# $
month{{$ )
){{) *
;{{* +
}|| 
}}} 
}~~ 
else 
{
�� 
foreach
�� 
(
�� 

MonthRange
�� #
collectingMonth
��$ 3
in
��4 6
Filter
��7 =
.
��= >
CollectingMonths
��> N
)
��N O
{
�� 
if
�� 
(
�� 
collectingMonth
�� '
.
��' (

��( 5
)
��5 6
{
�� 
Month
�� 
month
�� #
=
��$ %
new
��& )
Month
��* /
(
��/ 0
year
��0 4
.
��4 5
	YearValue
��5 >
,
��> ?
collectingMonth
��@ O
.
��O P
Min
��P S
,
��S T
year
��U Y
.
��Y Z
Calendar
��Z b
)
��b c
;
��c d
if
�� 
(
�� 
IsMatchingMonth
�� +
(
��+ ,
month
��, 1
,
��1 2
context
��3 :
)
��: ;
&&
��< >
CheckLimits
��? J
(
��J K
month
��K P
)
��P Q
)
��Q R
{
�� 
periods
�� #
.
��# $
Add
��$ '
(
��' (
month
��( -
)
��- .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
Months
�� 
months
�� %
=
��& '
new
��( +
Months
��, 2
(
��2 3
year
��3 7
.
��7 8
	YearValue
��8 A
,
��A B
collectingMonth
��C R
.
��R S
Min
��S V
,
��V W
collectingMonth
�� +
.
��+ ,
Max
��, /
-
��0 1
collectingMonth
��2 A
.
��A B
Min
��B E
,
��E F
year
��G K
.
��K L
Calendar
��L T
)
��T U
;
��U V
bool
�� 

isMatching
�� '
=
��( )
true
��* .
;
��. /
foreach
�� 
(
��  !
Month
��! &
month
��' ,
in
��- /
months
��0 6
.
��6 7
	GetMonths
��7 @
(
��@ A
)
��A B
)
��B C
{
�� 
if
�� 
(
��  
IsMatchingMonth
��  /
(
��/ 0
month
��0 5
,
��5 6
context
��7 >
)
��> ?
)
��? @
{
�� 
continue
��  (
;
��( )
}
�� 

isMatching
�� &
=
��' (
false
��) .
;
��. /
break
�� !
;
��! "
}
�� 
if
�� 
(
�� 

isMatching
�� &
&&
��' )
CheckLimits
��* 5
(
��5 6
months
��6 <
)
��< =
)
��= >
{
�� 
periods
�� #
.
��# $
Add
��$ '
(
��' (
months
��( .
)
��. /
;
��/ 0
}
�� 
}
�� 
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
	protected
�� 
override
�� 
bool
�� 
OnVisitMonth
��  ,
(
��, -
Month
��- 2
month
��3 8
,
��8 9,
CalendarPeriodCollectorContext
��: X
context
��Y `
)
��` a
{
�� 	
if
�� 
(
�� 
context
�� 
.
�� 
Scope
�� 
!=
��  ,
CalendarPeriodCollectorContext
��! ?
.
��? @
CollectType
��@ K
.
��K L
Day
��L O
)
��O P
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
Filter
�� 
.
�� 
CollectingDays
�� %
.
��% &
Count
��& +
==
��, .
$num
��/ 0
)
��0 1
{
�� 
foreach
�� 
(
�� 
Day
�� 
day
��  
in
��! #
month
��$ )
.
��) *
GetDays
��* 1
(
��1 2
)
��2 3
)
��3 4
{
�� 
if
�� 
(
�� 

�� %
(
��% &
day
��& )
,
��) *
context
��+ 2
)
��2 3
&&
��4 6
CheckLimits
��7 B
(
��B C
day
��C F
)
��F G
)
��G H
{
�� 
periods
�� 
.
��  
Add
��  #
(
��# $
day
��$ '
)
��' (
;
��( )
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
foreach
�� 
(
�� 
DayRange
�� !

��" /
in
��0 2
Filter
��3 9
.
��9 :
CollectingDays
��: H
)
��H I
{
�� 
if
�� 
(
�� 

�� %
.
��% &
IsSingleDay
��& 1
)
��1 2
{
�� 
Day
�� 
day
�� 
=
��  !
new
��" %
Day
��& )
(
��) *
month
��* /
.
��/ 0
Year
��0 4
,
��4 5
month
��6 ;
.
��; <

MonthValue
��< F
,
��F G

��H U
.
��U V
Min
��V Y
,
��Y Z
month
��[ `
.
��` a
Calendar
��a i
)
��i j
;
��j k
if
�� 
(
�� 

�� )
(
��) *
day
��* -
,
��- .
context
��/ 6
)
��6 7
&&
��8 :
CheckLimits
��; F
(
��F G
day
��G J
)
��J K
)
��K L
{
�� 
periods
�� #
.
��# $
Add
��$ '
(
��' (
day
��( +
)
��+ ,
;
��, -
}
�� 
}
�� 
else
�� 
{
�� 
Days
�� 
days
�� !
=
��" #
new
��$ '
Days
��( ,
(
��, -
month
��- 2
.
��2 3
Year
��3 7
,
��7 8
month
��9 >
.
��> ?

MonthValue
��? I
,
��I J

��K X
.
��X Y
Min
��Y \
,
��\ ]

��^ k
.
��k l
Max
��l o
-
��p q

��r 
.�� �
Min��� �
,��� �
month��� �
.��� �
Calendar��� �
)��� �
;��� �
bool
�� 

isMatching
�� '
=
��( )
true
��* .
;
��. /
foreach
�� 
(
��  !
Day
��! $
day
��% (
in
��) +
days
��, 0
.
��0 1
GetDays
��1 8
(
��8 9
)
��9 :
)
��: ;
{
�� 
if
�� 
(
��  

��  -
(
��- .
day
��. 1
,
��1 2
context
��3 :
)
��: ;
)
��; <
{
�� 
continue
��  (
;
��( )
}
�� 

isMatching
�� &
=
��' (
false
��) .
;
��. /
break
�� !
;
��! "
}
�� 
if
�� 
(
�� 

isMatching
�� &
&&
��' )
CheckLimits
��* 5
(
��5 6
days
��6 :
)
��: ;
)
��; <
{
�� 
periods
�� #
.
��# $
Add
��$ '
(
��' (
days
��( ,
)
��, -
;
��- .
}
�� 
}
�� 
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
	protected
�� 
override
�� 
bool
�� 

OnVisitDay
��  *
(
��* +
Day
��+ .
day
��/ 2
,
��2 3,
CalendarPeriodCollectorContext
��4 R
context
��S Z
)
��Z [
{
�� 	
if
�� 
(
�� 
context
�� 
.
�� 
Scope
�� 
!=
��  ,
CalendarPeriodCollectorContext
��! ?
.
��? @
CollectType
��@ K
.
��K L
Hour
��L P
)
��P Q
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
Filter
�� 
.
�� 
CollectingHours
�� &
.
��& '
Count
��' ,
==
��- /
$num
��0 1
&&
��2 4
Filter
��5 ;
.
��; < 
CollectingDayHours
��< N
.
��N O
Count
��O T
==
��U W
$num
��X Y
)
��Y Z
{
�� 
foreach
�� 
(
�� 
Hour
�� 
hour
�� "
in
��# %
day
��& )
.
��) *
GetHours
��* 2
(
��2 3
)
��3 4
)
��4 5
{
�� 
if
�� 
(
�� 
IsMatchingHour
�� &
(
��& '
hour
��' +
,
��+ ,
context
��- 4
)
��4 5
&&
��6 8
CheckLimits
��9 D
(
��D E
hour
��E I
)
��I J
)
��J K
{
�� 
periods
�� 
.
��  
Add
��  #
(
��# $
hour
��$ (
)
��( )
;
��) *
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
if
�� 
(
�� 

�� !
(
��! "
day
��" %
,
��% &
context
��' .
)
��. /
)
��/ 0
{
�� 
List
�� 
<
�� 
	HourRange
�� "
>
��" #
collectingHours
��$ 3
=
��4 5
new
��6 9
List
��: >
<
��> ?
	HourRange
��? H
>
��H I
(
��I J
Filter
��J P
.
��P Q
CollectingHours
��Q `
)
��` a
;
��a b
foreach
�� 
(
�� 
DayHourRange
�� )
collectingDayHour
��* ;
in
��< >
Filter
��? E
.
��E F 
CollectingDayHours
��F X
)
��X Y
{
�� 
if
�� 
(
�� 
collectingDayHour
�� -
.
��- .
Day
��. 1
==
��2 4
day
��5 8
.
��8 9
	DayOfWeek
��9 B
)
��B C
{
�� 
collectingHours
�� +
.
��+ ,
Add
��, /
(
��/ 0
collectingDayHour
��0 A
)
��A B
;
��B C
}
�� 
}
�� 
foreach
�� 
(
�� 
	HourRange
�� &
collectingHour
��' 5
in
��6 8
collectingHours
��9 H
)
��H I
{
�� 
DateTime
��  
start
��! &
=
��' (
collectingHour
��) 7
.
��7 8
Start
��8 =
.
��= >

ToDateTime
��> H
(
��H I
day
��I L
.
��L M
Start
��M R
)
��R S
;
��S T
DateTime
��  
end
��! $
=
��% &
collectingHour
��' 5
.
��5 6
End
��6 9
.
��9 :

ToDateTime
��: D
(
��D E
day
��E H
.
��H I
Start
��I N
)
��N O
;
��O P
CalendarTimeRange
�� )
hours
��* /
=
��0 1
new
��2 5
CalendarTimeRange
��6 G
(
��G H
start
��H M
,
��M N
end
��O R
,
��R S
day
��T W
.
��W X
Calendar
��X `
)
��` a
;
��a b
if
�� 
(
�� !
CheckExcludePeriods
�� /
(
��/ 0
hours
��0 5
)
��5 6
&&
��7 9
CheckLimits
��: E
(
��E F
hours
��F K
)
��K L
)
��L M
{
�� 
periods
�� #
.
��# $
Add
��$ '
(
��' (
hours
��( -
)
��- .
;
��. /
}
�� 
}
�� 
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
readonly
�� #
ITimePeriodCollection
�� .
periods
��/ 6
=
��7 8
new
��9 <"
TimePeriodCollection
��= Q
(
��Q R
)
��R S
;
��S T
}
�� 
}�� �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarPeriodCollectorContext.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class *
CalendarPeriodCollectorContext /
:0 1#
ICalendarVisitorContext2 I
{ 
public 
enum 
CollectType 
{ 	
Year 
, 
Month 
, 
Day 
, 
Hour 
, 
} 	
public 
CollectType 
Scope  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarPeriodCollectorFilter.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class )
CalendarPeriodCollectorFilter .
:/ 0!
CalendarVisitorFilter1 F
,F G*
ICalendarPeriodCollectorFilterH f
{ 
public 
override 
void 
Clear "
(" #
)# $
{ 	
base 
. 
Clear 
( 
) 
; 
collectingMonths 
. 
Clear "
(" #
)# $
;$ %
collectingDays 
. 
Clear  
(  !
)! "
;" #
collectingHours 
. 
Clear !
(! "
)" #
;# $
} 	
public 
IList 
< 

MonthRange 
>  
CollectingMonths! 1
{ 	
get 
{ 
return 
collectingMonths )
;) *
}+ ,
} 	
public!! 
IList!! 
<!! 
DayRange!! 
>!! 
CollectingDays!! -
{"" 	
get## 
{## 
return## 
collectingDays## '
;##' (
}##) *
}$$ 	
public'' 
IList'' 
<'' 
	HourRange'' 
>'' 
CollectingHours''  /
{(( 	
get)) 
{)) 
return)) 
collectingHours)) (
;))( )
}))* +
}** 	
public-- 
IList-- 
<-- 
DayHourRange-- !
>--! "
CollectingDayHours--# 5
{.. 	
get// 
{// 
return// 
collectingDayHours// +
;//+ ,
}//- .
}00 	
private44 
readonly44 
List44 
<44 

MonthRange44 (
>44( )
collectingMonths44* :
=44; <
new44= @
List44A E
<44E F

MonthRange44F P
>44P Q
(44Q R
)44R S
;44S T
private55 
readonly55 
List55 
<55 
DayRange55 &
>55& '
collectingDays55( 6
=557 8
new559 <
List55= A
<55A B
DayRange55B J
>55J K
(55K L
)55L M
;55M N
private66 
readonly66 
List66 
<66 
	HourRange66 '
>66' (
collectingHours66) 8
=669 :
new66; >
List66? C
<66C D
	HourRange66D M
>66M N
(66N O
)66O P
;66P Q
private77 
readonly77 
List77 
<77 
DayHourRange77 *
>77* +
collectingDayHours77, >
=77? @
new77A D
List77E I
<77I J
DayHourRange77J V
>77V W
(77W X
)77X Y
;77Y Z
}99 
};; �Z
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
CalendarTimeRange "
:# $
	TimeRange% .
,. /
ICalendarTimeRange0 B
{ 
public 
CalendarTimeRange  
(  !
DateTime! )
start* /
,/ 0
DateTime1 9
end: =
)= >
:? @
this 
( 
start 
, 
end 
, 
new  
TimeCalendar! -
(- .
). /
)/ 0
{ 	
} 	
public 
CalendarTimeRange  
(  !
DateTime! )
start* /
,/ 0
DateTime1 9
end: =
,= >

calendarM U
)U V
:W X
this 
( 
new 
	TimeRange 
( 
start $
,$ %
end& )
)) *
,* +
calendar, 4
)4 5
{ 	
} 	
public 
CalendarTimeRange  
(  !
DateTime! )
start* /
,/ 0
TimeSpan1 9
duration: B
)B C
:D E
this 
( 
start 
, 
duration  
,  !
new" %
TimeCalendar& 2
(2 3
)3 4
)4 5
{   	
}!! 	
public$$ 
CalendarTimeRange$$  
($$  !
DateTime$$! )
start$$* /
,$$/ 0
TimeSpan$$1 9
duration$$: B
,$$B C

calendar$$R Z
)$$Z [
:$$\ ]
this%% 
(%% 
new%% 
	TimeRange%% 
(%% 
start%% $
,%%$ %
duration%%& .
)%%. /
,%%/ 0
calendar%%1 9
)%%9 :
{&& 	
}'' 	
public** 
CalendarTimeRange**  
(**  !
ITimePeriod**! ,
period**- 3
)**3 4
:**5 6
this++ 
(++ 
period++ 
,++ 
new++ 
TimeCalendar++ )
(++) *
)++* +
)+++ ,
{,, 	
}-- 	
public00 
CalendarTimeRange00  
(00  !
ITimePeriod00! ,
period00- 3
,003 4

calendar00C K
)00K L
:00M N
base11 
(11 
ToCalendarTimeRange11 $
(11$ %
period11% +
,11+ ,
calendar11- 5
)115 6
,116 7
true118 <
)11< =
{22 	
this33 
.33 
calendar33 
=33 
calendar33 $
;33$ %
}44 	
public77 

Calendar77 %
{88 	
get99 
{99 
return99 
calendar99 !
;99! "
}99# $
}:: 	
public== 
	YearMonth== 

{>> 	
get?? 
{?? 
return?? 
Calendar?? !
.??! "

;??/ 0
}??1 2
}@@ 	
publicCC 
virtualCC 
intCC 
BaseYearCC #
{DD 	
getEE 
{EE 
returnEE 
StartEE 
.EE 
YearEE #
;EE# $
}EE% &
}FF 	
publicII 
DateTimeII 
FirstMonthStartII '
{JJ 	
getKK 
{KK 
returnKK 
newKK 
DateTimeKK %
(KK% &
StartKK& +
.KK+ ,
YearKK, 0
,KK0 1
StartKK2 7
.KK7 8
MonthKK8 =
,KK= >
$numKK? @
)KK@ A
;KKA B
}KKC D
}LL 	
publicOO 
DateTimeOO 
LastMonthStartOO &
{PP 	
getQQ 
{QQ 
returnQQ 
newQQ 
DateTimeQQ %
(QQ% &
EndQQ& )
.QQ) *
YearQQ* .
,QQ. /
EndQQ0 3
.QQ3 4
MonthQQ4 9
,QQ9 :
$numQQ; <
)QQ< =
;QQ= >
}QQ? @
}RR 	
publicUU 
DateTimeUU 

{VV 	
getWW 
{WW 
returnWW 
newWW 
DateTimeWW %
(WW% &
StartWW& +
.WW+ ,
YearWW, 0
,WW0 1
StartWW2 7
.WW7 8
MonthWW8 =
,WW= >
StartWW? D
.WWD E
DayWWE H
)WWH I
;WWI J
}WWK L
}XX 	
public[[ 
DateTime[[ 
LastDayStart[[ $
{\\ 	
get]] 
{]] 
return]] 
new]] 
DateTime]] %
(]]% &
End]]& )
.]]) *
Year]]* .
,]]. /
End]]0 3
.]]3 4
Month]]4 9
,]]9 :
End]]; >
.]]> ?
Day]]? B
)]]B C
;]]C D
}]]E F
}^^ 	
publicaa 
DateTimeaa 
FirstHourStartaa &
{bb 	
getcc 
{cc 
returncc 
newcc 
DateTimecc %
(cc% &
Startcc& +
.cc+ ,
Yearcc, 0
,cc0 1
Startcc2 7
.cc7 8
Monthcc8 =
,cc= >
Startcc? D
.ccD E
DayccE H
,ccH I
StartccJ O
.ccO P
HourccP T
,ccT U
$numccV W
,ccW X
$numccY Z
)ccZ [
;cc[ \
}cc] ^
}dd 	
publicgg 
DateTimegg 

{hh 	
getii 
{ii 
returnii 
newii 
DateTimeii %
(ii% &
Endii& )
.ii) *
Yearii* .
,ii. /
Endii0 3
.ii3 4
Monthii4 9
,ii9 :
Endii; >
.ii> ?
Dayii? B
,iiB C
EndiiD G
.iiG H
HouriiH L
,iiL M
$numiiN O
,iiO P
$numiiQ R
)iiR S
;iiS T
}iiU V
}jj 	
publicmm 
DateTimemm 
FirstMinuteStartmm (
{nn 	
getoo 
{oo 
returnoo 
newoo 
DateTimeoo %
(oo% &
Startoo& +
.oo+ ,
Yearoo, 0
,oo0 1
Startoo2 7
.oo7 8
Monthoo8 =
,oo= >
Startoo? D
.ooD E
DayooE H
,ooH I
StartooJ O
.ooO P
HourooP T
,ooT U
StartooV [
.oo[ \
Minuteoo\ b
,oob c
$numood e
,ooe f
$numoog h
)ooh i
;ooi j
}ook l
}pp 	
publicss 
DateTimess 
LastMinuteStartss '
{tt 	
getuu 
{uu 
returnuu 
newuu 
DateTimeuu %
(uu% &
Enduu& )
.uu) *
Yearuu* .
,uu. /
Enduu0 3
.uu3 4
Monthuu4 9
,uu9 :
Enduu; >
.uu> ?
Dayuu? B
,uuB C
EnduuD G
.uuG H
HouruuH L
,uuL M
EnduuN Q
.uuQ R
MinuteuuR X
,uuX Y
$numuuZ [
,uu[ \
$numuu] ^
)uu^ _
;uu_ `
}uua b
}vv 	
publicyy 
overrideyy 

ITimeRangeyy "
Copyyy# '
(yy' (
TimeSpanyy( 0
offsetyy1 7
)yy7 8
{zz 	
throw{{ 
new{{ !
NotSupportedException{{ +
({{+ ,
){{, -
;{{- .
}|| 	
	protected 
override 
string !
Format" (
(( )
ITimeFormatter) 7
	formatter8 A
)A B
{
�� 	
return
�� 
	formatter
�� 
.
�� 
GetCalendarPeriod
�� .
(
��. /
	formatter
��/ 8
.
��8 9
GetDateTime
��9 D
(
��D E
Start
��E J
)
��J K
,
��K L
	formatter
��M V
.
��V W
GetDateTime
��W b
(
��b c
End
��c f
)
��f g
,
��g h
Duration
��i q
)
��q r
;
��r s
}
�� 	
	protected
�� 
override
�� 
bool
�� 
IsEqual
��  '
(
��' (
object
��( .
obj
��/ 2
)
��2 3
{
�� 	
return
�� 
base
�� 
.
�� 
IsEqual
�� 
(
��  
obj
��  #
)
��# $
&&
��% '
HasSameData
��( 3
(
��3 4
obj
��4 7
as
��8 :
CalendarTimeRange
��; L
)
��L M
;
��M N
}
�� 	
	protected
�� 
override
�� 
int
�� 
ComputeHashCode
�� .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
base
��, 0
.
��0 1
ComputeHashCode
��1 @
(
��@ A
)
��A B
,
��B C
calendar
��D L
)
��L M
;
��M N
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
CalendarTimeRange
��! 2
comp
��3 7
)
��7 8
{
�� 	
return
�� 
calendar
�� 
.
�� 
Equals
�� "
(
��" #
comp
��# '
.
��' (
calendar
��( 0
)
��0 1
;
��1 2
}
�� 	
private
�� 
static
�� 
	TimeRange
��  !
ToCalendarTimeRange
��! 4
(
��4 5
ITimePeriod
��5 @
period
��A G
,
��G H
ITimePeriodMapper
��I Z
mapper
��[ a
)
��a b
{
�� 	
DateTime
�� 
mappedStart
��  
=
��! "
mapper
��# )
.
��) *
MapStart
��* 2
(
��2 3
period
��3 9
.
��9 :
Start
��: ?
)
��? @
;
��@ A
DateTime
�� 
	mappedEnd
�� 
=
��  
mapper
��! '
.
��' (
MapEnd
��( .
(
��. /
period
��/ 5
.
��5 6
End
��6 9
)
��9 :
;
��: ;
if
�� 
(
�� 
	mappedEnd
�� 
<=
�� 
mappedStart
�� (
)
��( )
{
�� 
throw
�� 
new
�� #
NotSupportedException
�� /
(
��/ 0
)
��0 1
;
��1 2
}
�� 
return
�� 
new
�� 
	TimeRange
��  
(
��  !
mappedStart
��! ,
,
��, -
	mappedEnd
��. 7
)
��7 8
;
��8 9
}
�� 	
private
�� 
readonly
�� 

�� &
calendar
��' /
;
��/ 0
}
�� 
}�� ��
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarVisitor.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 
CalendarVisitor )
<) *
TFilter* 1
,1 2
TContext3 ;
>; <
where 
TFilter 
: 
class 
, "
ICalendarVisitorFilter 5
where 
TContext 
: 
class 
, #
ICalendarVisitorContext  7
{ 
	protected 
CalendarVisitor !
(! "
TFilter" )
filter* 0
,0 1
ITimePeriod2 =
limits> D
,D E


=( )

.7 8
Forward8 ?
,? @

calendarO W
=X Y
nullZ ^
)^ _
{ 	
if 
( 
filter 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 8
)8 9
;9 :
} 
if 
( 
limits 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 8
)8 9
;9 :
} 
this   
.   
filter   
=   
filter    
;    !
this!! 
.!! 
limits!! 
=!! 
limits!!  
;!!  !
this"" 
."" 

=""  

;"". /
this## 
.## 
calendar## 
=## 
calendar## $
;##$ %
}$$ 	
public'' 
TFilter'' 
Filter'' 
{(( 	
get)) 
{)) 
return)) 
filter)) 
;))  
}))! "
}** 	
public-- 
ITimePeriod-- 
Limits-- !
{.. 	
get// 
{// 
return// 
limits// 
;//  
}//! "
}00 	
public33 


{44 	
get55 
{55 
return55 

;55& '
}55( )
}66 	
public99 

Calendar99 %
{:: 	
get;; 
{;; 
return;; 
calendar;; !
;;;! "
};;# $
}<< 	
	protected?? 
void?? 
StartPeriodVisit?? '
(??' (
TContext??( 0
context??1 8
=??9 :
null??; ?
)??? @
{@@ 	
StartPeriodVisitAA 
(AA 
limitsAA #
,AA# $
contextAA% ,
)AA, -
;AA- .
}BB 	
	protectedEE 
voidEE 
StartPeriodVisitEE '
(EE' (
ITimePeriodEE( 3
periodEE4 :
,EE: ;
TContextEE< D
contextEEE L
=EEM N
nullEEO S
)EES T
{FF 	
ifGG 
(GG 
periodGG 
==GG 
nullGG 
)GG 
{HH 
throwII 
newII !
ArgumentNullExceptionII /
(II/ 0
$strII0 8
)II8 9
;II9 :
}JJ 
ifKK 
(KK 
periodKK 
.KK 
IsMomentKK 
)KK  
{LL 
returnMM 
;MM 
}NN 
OnVisitStartPP 
(PP 
)PP 
;PP 
YearsRR 
yearsRR 
=RR 
calendarRR "
!=RR# %
nullRR& *
?RR+ ,
newSS 
YearsSS 
(SS 
periodSS  
.SS  !
StartSS! &
.SS& '
YearSS' +
,SS+ ,
periodSS- 3
.SS3 4
EndSS4 7
.SS7 8
YearSS8 <
-SS= >
periodSS? E
.SSE F
StartSSF K
.SSK L
YearSSL P
+SSQ R
$numSSS T
,SST U
calendarSSV ^
)SS^ _
:SS` a
newTT 
YearsTT 
(TT 
periodTT  
.TT  !
StartTT! &
.TT& '
YearTT' +
,TT+ ,
periodTT- 3
.TT3 4
EndTT4 7
.TT7 8
YearTT8 <
-TT= >
periodTT? E
.TTE F
StartTTF K
.TTK L
YearTTL P
+TTQ R
$numTTS T
)TTT U
;TTU V
ifUU 
(UU 
OnVisitYearsUU 
(UU 
yearsUU "
,UU" #
contextUU$ +
)UU+ ,
&&UU- /

EnterYearsUU0 :
(UU: ;
yearsUU; @
,UU@ A
contextUUB I
)UUI J
)UUJ K
{VV 
ITimePeriodCollectionWW %
yearsToVisitWW& 2
=WW3 4
yearsWW5 :
.WW: ;
GetYearsWW; C
(WWC D
)WWD E
;WWE F
ifXX 
(XX 

==XX" $

.XX2 3
BackwardXX3 ;
)XX; <
{YY 
yearsToVisitZZ  
.ZZ  !
	SortByEndZZ! *
(ZZ* +
)ZZ+ ,
;ZZ, -
}[[ 
foreach\\ 
(\\ 
Year\\ 
year\\ "
in\\# %
yearsToVisit\\& 2
)\\2 3
{]] 
if^^ 
(^^ 
!^^ 
year^^ 
.^^ 
OverlapsWith^^ *
(^^* +
period^^+ 1
)^^1 2
||^^3 5
OnVisitYear^^6 A
(^^A B
year^^B F
,^^F G
context^^H O
)^^O P
==^^Q S
false^^T Y
)^^Y Z
{__ 
continue``  
;``  !
}aa 
ifdd 
(dd 
EnterMonthsdd #
(dd# $
yeardd$ (
,dd( )
contextdd* 1
)dd1 2
==dd3 5
falsedd6 ;
)dd; <
{ee 
continueff  
;ff  !
}gg !
ITimePeriodCollectionhh )

=hh8 9
yearhh: >
.hh> ?
	GetMonthshh? H
(hhH I
)hhI J
;hhJ K
ifii 
(ii 

==ii& (

.ii6 7
Backwardii7 ?
)ii? @
{jj 

.kk% &
	SortByEndkk& /
(kk/ 0
)kk0 1
;kk1 2
}ll 
foreachmm 
(mm 
Monthmm "
monthmm# (
inmm) +

)mm9 :
{nn 
ifoo 
(oo 
!oo 
monthoo "
.oo" #
OverlapsWithoo# /
(oo/ 0
periodoo0 6
)oo6 7
||oo8 :
OnVisitMonthoo; G
(ooG H
monthooH M
,ooM N
contextooO V
)ooV W
==ooX Z
falseoo[ `
)oo` a
{pp 
continueqq $
;qq$ %
}rr 
ifuu 
(uu 
	EnterDaysuu %
(uu% &
monthuu& +
,uu+ ,
contextuu- 4
)uu4 5
==uu6 8
falseuu9 >
)uu> ?
{vv 
continueww $
;ww$ %
}xx !
ITimePeriodCollectionyy -
daysToVisityy. 9
=yy: ;
monthyy< A
.yyA B
GetDaysyyB I
(yyI J
)yyJ K
;yyK L
ifzz 
(zz 

==zz* ,

.zz: ;
Backwardzz; C
)zzC D
{{{ 
daysToVisit|| '
.||' (
	SortByEnd||( 1
(||1 2
)||2 3
;||3 4
}}} 
foreach~~ 
(~~  !
Day~~! $
day~~% (
in~~) +
daysToVisit~~, 7
)~~7 8
{ 
if
�� 
(
��  
!
��  !
day
��! $
.
��$ %
OverlapsWith
��% 1
(
��1 2
period
��2 8
)
��8 9
||
��: <

OnVisitDay
��= G
(
��G H
day
��H K
,
��K L
context
��M T
)
��T U
==
��V X
false
��Y ^
)
��^ _
{
�� 
continue
��  (
;
��( )
}
�� 
if
�� 
(
��  

EnterHours
��  *
(
��* +
day
��+ .
,
��. /
context
��0 7
)
��7 8
==
��9 ;
false
��< A
)
��A B
{
�� 
continue
��  (
;
��( )
}
�� #
ITimePeriodCollection
�� 1
hoursToVisit
��2 >
=
��? @
day
��A D
.
��D E
GetHours
��E M
(
��M N
)
��N O
;
��O P
if
�� 
(
��  

��  -
==
��. 0

��1 >
.
��> ?
Backward
��? G
)
��G H
{
�� 
hoursToVisit
��  ,
.
��, -
	SortByEnd
��- 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
foreach
�� #
(
��$ %
Hour
��% )
hour
��* .
in
��/ 1
hoursToVisit
��2 >
)
��> ?
{
�� 
if
��  "
(
��# $
!
��$ %
hour
��% )
.
��) *
OverlapsWith
��* 6
(
��6 7
period
��7 =
)
��= >
||
��? A
OnVisitHour
��B M
(
��M N
hour
��N R
,
��R S
context
��T [
)
��[ \
==
��] _
false
��` e
)
��e f
{
��  !
continue
��$ ,
;
��, -
}
��  !
}
�� 
}
�� 
}
�� 
}
�� 
}
�� 

OnVisitEnd
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
	protected
�� 
Year
�� 
StartYearVisit
�� %
(
��% &
Year
��& *
year
��+ /
,
��/ 0
TContext
��1 9
context
��: A
=
��B C
null
��D H
,
��H I

��J W
?
��W X
visitDirection
��Y g
=
��h i
null
��j n
)
��n o
{
�� 	
if
�� 
(
�� 
year
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
if
�� 
(
�� 
visitDirection
�� 
==
�� !
null
��" &
)
��& '
{
�� 
visitDirection
�� 
=
��  

��! .
;
��. /
}
�� 
OnVisitStart
�� 
(
�� 
)
�� 
;
�� 
Year
�� 
lastVisited
�� 
=
�� 
null
�� #
;
��# $
DateTime
�� 
minStart
�� 
=
�� 
DateTime
��  (
.
��( )
MinValue
��) 1
;
��1 2
DateTime
�� 
maxEnd
�� 
=
�� 
DateTime
�� &
.
��& '
MaxValue
��' /
.
��/ 0
AddYears
��0 8
(
��8 9
-
��9 :
$num
��: ;
)
��; <
;
��< =
while
�� 
(
�� 
year
�� 
.
�� 
Start
�� 
>
�� 
minStart
��  (
&&
��) +
year
��, 0
.
��0 1
End
��1 4
<
��5 6
maxEnd
��7 =
)
��= >
{
�� 
if
�� 
(
�� 
OnVisitYear
�� 
(
��  
year
��  $
,
��$ %
context
��& -
)
��- .
==
��/ 1
false
��2 7
)
��7 8
{
�� 
lastVisited
�� 
=
��  !
year
��" &
;
��& '
break
�� 
;
�� 
}
�� 
switch
�� 
(
�� 
visitDirection
�� &
)
��& '
{
�� 
case
�� 

�� &
.
��& '
Forward
��' .
:
��. /
year
�� 
=
�� 
year
�� #
.
��# $
GetNextYear
��$ /
(
��/ 0
)
��0 1
;
��1 2
break
�� 
;
�� 
case
�� 

�� &
.
��& '
Backward
��' /
:
��/ 0
year
�� 
=
�� 
year
�� #
.
��# $
GetPreviousYear
��$ 3
(
��3 4
)
��4 5
;
��5 6
break
�� 
;
�� 
}
�� 
}
�� 

OnVisitEnd
�� 
(
�� 
)
�� 
;
�� 
return
�� 
lastVisited
�� 
;
�� 
}
�� 	
	protected
�� 
Month
�� 
StartMonthVisit
�� '
(
��' (
Month
��( -
month
��. 3
,
��3 4
TContext
��5 =
context
��> E
=
��F G
null
��H L
,
��L M

��N [
?
��[ \
visitDirection
��] k
=
��l m
null
��n r
)
��r s
{
�� 	
if
�� 
(
�� 
month
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
visitDirection
�� 
==
�� !
null
��" &
)
��& '
{
�� 
visitDirection
�� 
=
��  

��! .
;
��. /
}
�� 
OnVisitStart
�� 
(
�� 
)
�� 
;
�� 
Month
�� 
lastVisited
�� 
=
�� 
null
��  $
;
��$ %
DateTime
�� 
minStart
�� 
=
�� 
DateTime
��  (
.
��( )
MinValue
��) 1
;
��1 2
DateTime
�� 
maxEnd
�� 
=
�� 
DateTime
�� &
.
��& '
MaxValue
��' /
.
��/ 0
	AddMonths
��0 9
(
��9 :
-
��: ;
$num
��; <
)
��< =
;
��= >
while
�� 
(
�� 
month
�� 
.
�� 
Start
�� 
>
��  
minStart
��! )
&&
��* ,
month
��- 2
.
��2 3
End
��3 6
<
��7 8
maxEnd
��9 ?
)
��? @
{
�� 
if
�� 
(
�� 
OnVisitMonth
��  
(
��  !
month
��! &
,
��& '
context
��( /
)
��/ 0
==
��1 3
false
��4 9
)
��9 :
{
�� 
lastVisited
�� 
=
��  !
month
��" '
;
��' (
break
�� 
;
�� 
}
�� 
switch
�� 
(
�� 
visitDirection
�� &
)
��& '
{
�� 
case
�� 

�� &
.
��& '
Forward
��' .
:
��. /
month
�� 
=
�� 
month
��  %
.
��% &
GetNextMonth
��& 2
(
��2 3
)
��3 4
;
��4 5
break
�� 
;
�� 
case
�� 

�� &
.
��& '
Backward
��' /
:
��/ 0
month
�� 
=
�� 
month
��  %
.
��% &
GetPreviousMonth
��& 6
(
��6 7
)
��7 8
;
��8 9
break
�� 
;
�� 
}
�� 
}
�� 

OnVisitEnd
�� 
(
�� 
)
�� 
;
�� 
return
�� 
lastVisited
�� 
;
�� 
}
�� 	
	protected
�� 
Day
�� 

�� #
(
��# $
Day
��$ '
day
��( +
,
��+ ,
TContext
��- 5
context
��6 =
=
��> ?
null
��@ D
,
��D E

��F S
?
��S T
visitDirection
��U c
=
��d e
null
��f j
)
��j k
{
�� 	
if
�� 
(
�� 
day
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 5
)
��5 6
;
��6 7
}
�� 
if
�� 
(
�� 
visitDirection
�� 
==
�� !
null
��" &
)
��& '
{
�� 
visitDirection
�� 
=
��  

��! .
;
��. /
}
�� 
OnVisitStart
�� 
(
�� 
)
�� 
;
�� 
Day
�� 
lastVisited
�� 
=
�� 
null
�� "
;
��" #
DateTime
�� 
minStart
�� 
=
�� 
DateTime
��  (
.
��( )
MinValue
��) 1
;
��1 2
DateTime
�� 
maxEnd
�� 
=
�� 
DateTime
�� &
.
��& '
MaxValue
��' /
.
��/ 0
AddDays
��0 7
(
��7 8
-
��8 9
$num
��9 :
)
��: ;
;
��; <
while
�� 
(
�� 
day
�� 
.
�� 
Start
�� 
>
�� 
minStart
�� '
&&
��( *
day
��+ .
.
��. /
End
��/ 2
<
��3 4
maxEnd
��5 ;
)
��; <
{
�� 
if
�� 
(
�� 

OnVisitDay
�� 
(
�� 
day
�� "
,
��" #
context
��$ +
)
��+ ,
==
��- /
false
��0 5
)
��5 6
{
�� 
lastVisited
�� 
=
��  !
day
��" %
;
��% &
break
�� 
;
�� 
}
�� 
switch
�� 
(
�� 
visitDirection
�� &
)
��& '
{
�� 
case
�� 

�� &
.
��& '
Forward
��' .
:
��. /
day
�� 
=
�� 
day
�� !
.
��! "

GetNextDay
��" ,
(
��, -
)
��- .
;
��. /
break
�� 
;
�� 
case
�� 

�� &
.
��& '
Backward
��' /
:
��/ 0
day
�� 
=
�� 
day
�� !
.
��! "
GetPreviousDay
��" 0
(
��0 1
)
��1 2
;
��2 3
break
�� 
;
�� 
}
�� 
}
�� 

OnVisitEnd
�� 
(
�� 
)
�� 
;
�� 
return
�� 
lastVisited
�� 
;
�� 
}
�� 	
	protected
�� 
Hour
�� 
StartHourVisit
�� %
(
��% &
Hour
��& *
hour
��+ /
,
��/ 0
TContext
��1 9
context
��: A
=
��B C
null
��D H
,
��H I

��J W
?
��W X
visitDirection
��Y g
=
��h i
null
��j n
)
��n o
{
�� 	
if
�� 
(
�� 
hour
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
if
�� 
(
�� 
visitDirection
�� 
==
�� !
null
��" &
)
��& '
{
�� 
visitDirection
�� 
=
��  

��! .
;
��. /
}
�� 
OnVisitStart
�� 
(
�� 
)
�� 
;
�� 
Hour
�� 
lastVisited
�� 
=
�� 
null
�� #
;
��# $
DateTime
�� 
minStart
�� 
=
�� 
DateTime
��  (
.
��( )
MinValue
��) 1
;
��1 2
DateTime
�� 
maxEnd
�� 
=
�� 
DateTime
�� &
.
��& '
MaxValue
��' /
.
��/ 0
AddHours
��0 8
(
��8 9
-
��9 :
$num
��: ;
)
��; <
;
��< =
while
�� 
(
�� 
hour
�� 
.
�� 
Start
�� 
>
�� 
minStart
��  (
&&
��) +
hour
��, 0
.
��0 1
End
��1 4
<
��5 6
maxEnd
��7 =
)
��= >
{
�� 
if
�� 
(
�� 
OnVisitHour
�� 
(
��  
hour
��  $
,
��$ %
context
��& -
)
��- .
==
��/ 1
false
��2 7
)
��7 8
{
�� 
lastVisited
�� 
=
��  !
hour
��" &
;
��& '
break
�� 
;
�� 
}
�� 
switch
�� 
(
�� 
visitDirection
�� &
)
��& '
{
�� 
case
�� 

�� &
.
��& '
Forward
��' .
:
��. /
hour
�� 
=
�� 
hour
�� #
.
��# $
GetNextHour
��$ /
(
��/ 0
)
��0 1
;
��1 2
break
�� 
;
�� 
case
�� 

�� &
.
��& '
Backward
��' /
:
��/ 0
hour
�� 
=
�� 
hour
�� #
.
��# $
GetPreviousHour
��$ 3
(
��3 4
)
��4 5
;
��5 6
break
�� 
;
�� 
}
�� 
}
�� 

OnVisitEnd
�� 
(
�� 
)
�� 
;
�� 
return
�� 
lastVisited
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
void
�� 
OnVisitStart
�� +
(
��+ ,
)
��, -
{
�� 	
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
CheckLimits
�� *
(
��* +
ITimePeriod
��+ 6
test
��7 ;
)
��; <
{
�� 	
return
�� 
limits
�� 
.
�� 
	HasInside
�� #
(
��# $
test
��$ (
)
��( )
;
��) *
}
�� 	
	protected
�� 
virtual
�� 
bool
�� !
CheckExcludePeriods
�� 2
(
��2 3
ITimePeriod
��3 >
test
��? C
)
��C D
{
�� 	
if
�� 
(
�� 
filter
�� 
.
�� 
ExcludePeriods
�� %
.
��% &
Count
��& +
==
��, .
$num
��/ 0
)
��0 1
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
return
�� 
filter
�� 
.
�� 
ExcludePeriods
�� (
.
��( )
OverlapPeriods
��) 7
(
��7 8
test
��8 <
)
��< =
.
��= >
Count
��> C
==
��D F
$num
��G H
;
��H I
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 

EnterYears
�� )
(
��) *
Years
��* /
years
��0 5
,
��5 6
TContext
��7 ?
context
��@ G
)
��G H
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
EnterMonths
�� *
(
��* +
Year
��+ /
year
��0 4
,
��4 5
TContext
��6 >
context
��? F
)
��F G
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
	EnterDays
�� (
(
��( )
Month
��) .
month
��/ 4
,
��4 5
TContext
��6 >
context
��? F
)
��F G
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 

EnterHours
�� )
(
��) *
Day
��* -
day
��. 1
,
��1 2
TContext
��3 ;
context
��< C
)
��C D
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
OnVisitYears
�� +
(
��+ ,
Years
��, 1
years
��2 7
,
��7 8
TContext
��9 A
context
��B I
)
��I J
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
OnVisitYear
�� *
(
��* +
Year
��+ /
year
��0 4
,
��4 5
TContext
��6 >
context
��? F
)
��F G
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
OnVisitMonth
�� +
(
��+ ,
Month
��, 1
month
��2 7
,
��7 8
TContext
��9 A
context
��B I
)
��I J
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 

OnVisitDay
�� )
(
��) *
Day
��* -
day
��. 1
,
��1 2
TContext
��3 ;
context
��< C
)
��C D
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
OnVisitHour
�� *
(
��* +
Hour
��+ /
hour
��0 4
,
��4 5
TContext
��6 >
context
��? F
)
��F G
{
�� 	
return
�� 
true
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsMatchingYear
�� -
(
��- .
Year
��. 2
year
��3 7
,
��7 8
TContext
��9 A
context
��B I
)
��I J
{
�� 	
if
�� 
(
�� 
filter
�� 
.
�� 
Years
�� 
.
�� 
Count
�� "
>
��# $
$num
��% &
&&
��' )
!
��* +
filter
��+ 1
.
��1 2
Years
��2 7
.
��7 8
Contains
��8 @
(
��@ A
year
��A E
.
��E F
	YearValue
��F O
)
��O P
)
��P Q
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� !
CheckExcludePeriods
�� &
(
��& '
year
��' +
)
��+ ,
;
��, -
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsMatchingMonth
�� .
(
��. /
Month
��/ 4
month
��5 :
,
��: ;
TContext
��< D
context
��E L
)
��L M
{
�� 	
if
�� 
(
�� 
filter
�� 
.
�� 
Years
�� 
.
�� 
Count
�� "
>
��# $
$num
��% &
&&
��' )
!
��* +
filter
��+ 1
.
��1 2
Years
��2 7
.
��7 8
Contains
��8 @
(
��@ A
month
��A F
.
��F G
Year
��G K
)
��K L
)
��L M
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
Months
�� 
.
�� 
Count
�� #
>
��$ %
$num
��& '
&&
��( *
!
��+ ,
filter
��, 2
.
��2 3
Months
��3 9
.
��9 :
Contains
��: B
(
��B C
month
��C H
.
��H I
	YearMonth
��I R
)
��R S
)
��S T
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� !
CheckExcludePeriods
�� &
(
��& '
month
��' ,
)
��, -
;
��- .
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 

�� ,
(
��, -
Day
��- 0
day
��1 4
,
��4 5
TContext
��6 >
context
��? F
)
��F G
{
�� 	
if
�� 
(
�� 
filter
�� 
.
�� 
Years
�� 
.
�� 
Count
�� "
>
��# $
$num
��% &
&&
��' )
!
��* +
filter
��+ 1
.
��1 2
Years
��2 7
.
��7 8
Contains
��8 @
(
��@ A
day
��A D
.
��D E
Year
��E I
)
��I J
)
��J K
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
Months
�� 
.
�� 
Count
�� #
>
��$ %
$num
��& '
&&
��( *
!
��+ ,
filter
��, 2
.
��2 3
Months
��3 9
.
��9 :
Contains
��: B
(
��B C
(
��C D
	YearMonth
��D M
)
��M N
day
��N Q
.
��Q R
Month
��R W
)
��W X
)
��X Y
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
Days
�� 
.
�� 
Count
�� !
>
��" #
$num
��$ %
&&
��& (
!
��) *
filter
��* 0
.
��0 1
Days
��1 5
.
��5 6
Contains
��6 >
(
��> ?
day
��? B
.
��B C
DayValue
��C K
)
��K L
)
��L M
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
WeekDays
�� 
.
��  
Count
��  %
>
��& '
$num
��( )
&&
��* ,
!
��- .
filter
��. 4
.
��4 5
WeekDays
��5 =
.
��= >
Contains
��> F
(
��F G
day
��G J
.
��J K
	DayOfWeek
��K T
)
��T U
)
��U V
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� !
CheckExcludePeriods
�� &
(
��& '
day
��' *
)
��* +
;
��+ ,
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsMatchingHour
�� -
(
��- .
Hour
��. 2
hour
��3 7
,
��7 8
TContext
��9 A
context
��B I
)
��I J
{
�� 	
if
�� 
(
�� 
filter
�� 
.
�� 
Years
�� 
.
�� 
Count
�� "
>
��# $
$num
��% &
&&
��' )
!
��* +
filter
��+ 1
.
��1 2
Years
��2 7
.
��7 8
Contains
��8 @
(
��@ A
hour
��A E
.
��E F
Year
��F J
)
��J K
)
��K L
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
Months
�� 
.
�� 
Count
�� #
>
��$ %
$num
��& '
&&
��( *
!
��+ ,
filter
��, 2
.
��2 3
Months
��3 9
.
��9 :
Contains
��: B
(
��B C
(
��C D
	YearMonth
��D M
)
��M N
hour
��N R
.
��R S
Month
��S X
)
��X Y
)
��Y Z
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
Days
�� 
.
�� 
Count
�� !
>
��" #
$num
��$ %
&&
��& (
!
��) *
filter
��* 0
.
��0 1
Days
��1 5
.
��5 6
Contains
��6 >
(
��> ?
hour
��? C
.
��C D
Day
��D G
)
��G H
)
��H I
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
WeekDays
�� 
.
��  
Count
��  %
>
��& '
$num
��( )
&&
��* ,
!
��- .
filter
��. 4
.
��4 5
WeekDays
��5 =
.
��= >
Contains
��> F
(
��F G
hour
��G K
.
��K L
Start
��L Q
.
��Q R
	DayOfWeek
��R [
)
��[ \
)
��\ ]
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
filter
�� 
.
�� 
Hours
�� 
.
�� 
Count
�� "
>
��# $
$num
��% &
&&
��' )
!
��* +
filter
��+ 1
.
��1 2
Hours
��2 7
.
��7 8
Contains
��8 @
(
��@ A
hour
��A E
.
��E F
	HourValue
��F O
)
��O P
)
��P Q
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� !
CheckExcludePeriods
�� &
(
��& '
hour
��' +
)
��+ ,
;
��, -
}
�� 	
	protected
�� 
virtual
�� 
void
�� 

OnVisitEnd
�� )
(
��) *
)
��* +
{
�� 	
}
�� 	
private
�� 
readonly
�� 
TFilter
��  
filter
��! '
;
��' (
private
�� 
readonly
�� 
ITimePeriod
�� $
limits
��% +
;
��+ ,
private
�� 
readonly
�� 

�� &

��' 4
;
��4 5
private
�� 
readonly
�� 

�� &
calendar
��' /
;
��/ 0
}
�� 
}�� �*
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\CalendarVisitorFilter.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class !
CalendarVisitorFilter &
:' ("
ICalendarVisitorFilter) ?
{ 
public 
virtual 
void 
Clear !
(! "
)" #
{ 	
years 
. 
Clear 
( 
) 
; 
months 
. 
Clear 
( 
) 
; 
days 
. 
Clear 
( 
) 
; 
weekDays 
. 
Clear 
( 
) 
; 
hours 
. 
Clear 
( 
) 
; 
} 	
public !
ITimePeriodCollection $
ExcludePeriods% 3
{ 	
get 
{ 
return 
excludePeriods '
;' (
}) *
} 	
public"" 
IList"" 
<"" 
int"" 
>"" 
Years"" 
{## 	
get$$ 
{$$ 
return$$ 
years$$ 
;$$ 
}$$  !
}%% 	
public(( 
IList(( 
<(( 
	YearMonth(( 
>(( 
Months((  &
{)) 	
get** 
{** 
return** 
months** 
;**  
}**! "
}++ 	
public.. 
IList.. 
<.. 
int.. 
>.. 
Days.. 
{// 	
get00 
{00 
return00 
days00 
;00 
}00  
}11 	
public44 
IList44 
<44 
	DayOfWeek44 
>44 
WeekDays44  (
{55 	
get66 
{66 
return66 
weekDays66 !
;66! "
}66# $
}77 	
public:: 
IList:: 
<:: 
int:: 
>:: 
Hours:: 
{;; 	
get<< 
{<< 
return<< 
hours<< 
;<< 
}<<  !
}== 	
public@@ 
void@@ 
AddWorkingWeekDays@@ &
(@@& '
)@@' (
{AA 	
weekDaysBB 
.BB 
AddBB 
(BB 
	DayOfWeekBB "
.BB" #
MondayBB# )
)BB) *
;BB* +
weekDaysCC 
.CC 
AddCC 
(CC 
	DayOfWeekCC "
.CC" #
TuesdayCC# *
)CC* +
;CC+ ,
weekDaysDD 
.DD 
AddDD 
(DD 
	DayOfWeekDD "
.DD" #
	WednesdayDD# ,
)DD, -
;DD- .
weekDaysEE 
.EE 
AddEE 
(EE 
	DayOfWeekEE "
.EE" #
ThursdayEE# +
)EE+ ,
;EE, -
weekDaysFF 
.FF 
AddFF 
(FF 
	DayOfWeekFF "
.FF" #
FridayFF# )
)FF) *
;FF* +
}GG 	
publicJJ 
voidJJ 
AddWeekendWeekDaysJJ &
(JJ& '
)JJ' (
{KK 	
weekDaysLL 
.LL 
AddLL 
(LL 
	DayOfWeekLL "
.LL" #
SaturdayLL# +
)LL+ ,
;LL, -
weekDaysMM 
.MM 
AddMM 
(MM 
	DayOfWeekMM "
.MM" #
SundayMM# )
)MM) *
;MM* +
}NN 	
privateRR 
readonlyRR  
TimePeriodCollectionRR -
excludePeriodsRR. <
=RR= >
newRR? B 
TimePeriodCollectionRRC W
(RRW X
)RRX Y
;RRY Z
privateSS 
readonlySS 
ListSS 
<SS 
intSS !
>SS! "
yearsSS# (
=SS) *
newSS+ .
ListSS/ 3
<SS3 4
intSS4 7
>SS7 8
(SS8 9
)SS9 :
;SS: ;
privateTT 
readonlyTT 
ListTT 
<TT 
	YearMonthTT '
>TT' (
monthsTT) /
=TT0 1
newTT2 5
ListTT6 :
<TT: ;
	YearMonthTT; D
>TTD E
(TTE F
)TTF G
;TTG H
privateUU 
readonlyUU 
ListUU 
<UU 
intUU !
>UU! "
daysUU# '
=UU( )
newUU* -
ListUU. 2
<UU2 3
intUU3 6
>UU6 7
(UU7 8
)UU8 9
;UU9 :
privateVV 
readonlyVV 
ListVV 
<VV 
	DayOfWeekVV '
>VV' (
weekDaysVV) 1
=VV2 3
newVV4 7
ListVV8 <
<VV< =
	DayOfWeekVV= F
>VVF G
(VVG H
)VVH I
;VVI J
privateWW 
readonlyWW 
ListWW 
<WW 
intWW !
>WW! "
hoursWW# (
=WW) *
newWW+ .
ListWW/ 3
<WW3 4
intWW4 7
>WW7 8
(WW8 9
)WW9 :
;WW: ;
}YY 
}[[ �
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ClockProxy.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

static 
class 

ClockProxy "
{ 
public 
static 
IClock 
Clock "
{ 	
get 
{ 
if 
( 
clock 
== 
null !
)! "
{ 
lock 
( 
mutex 
)  
{ 
if 
( 
clock !
==" $
null% )
)) *
{ 
clock !
=" #
new$ '
SystemClock( 3
(3 4
)4 5
;5 6
} 
} 
} 
return   
clock   
;   
}!! 
set"" 
{## 
lock$$ 
($$ 
mutex$$ 
)$$ 
{%% 
clock&& 
=&& 
value&& !
;&&! "
}'' 
}(( 
})) 	
private-- 
static-- 
readonly-- 
object--  &
mutex--' ,
=--- .
new--/ 2
object--3 9
(--9 :
)--: ;
;--; <
private.. 
static.. 
volatile.. 
IClock..  &
clock..' ,
;.., -
}00 
}22 �a
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Date.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

struct 
Date 
: 
IComparable $
,$ %
IComparable& 1
<1 2
Date2 6
>6 7
,7 8

IEquatable9 C
<C D
DateD H
>H I
{ 
public 
Date 
( 
DateTime 
date !
)! "
{ 	
this 
. 
date 
= 
date 
. 
Date !
;! "
} 	
public 
Date 
( 
int 
year 
, 
int !
month" '
=( )
$num* +
,+ ,
int- 0
day1 4
=5 6
$num7 8
)8 9
{ 	
if 
( 
year 
< 
DateTime 
.  
MinValue  (
.( )
Year) -
||. 0
year1 5
>6 7
DateTime8 @
.@ A
MaxValueA I
.I J
YearJ N
)N O
{ 
throw 
new '
ArgumentOutOfRangeException 5
(5 6
$str6 <
)< =
;= >
} 
if 
( 
month 
<= 
$num 
|| 
month #
>$ %
TimeSpec& .
.. /

)< =
{ 
throw   
new   '
ArgumentOutOfRangeException   5
(  5 6
$str  6 =
)  = >
;  > ?
}!! 
if"" 
("" 
day"" 
<="" 
$num"" 
||"" 
day"" 
>""  !
TimeSpec""" *
.""* +
MaxDaysPerMonth""+ :
)"": ;
{## 
throw$$ 
new$$ '
ArgumentOutOfRangeException$$ 5
($$5 6
$str$$6 ;
)$$; <
;$$< =
}%% 
date&& 
=&& 
new&& 
DateTime&& 
(&&  
year&&  $
,&&$ %
month&&& +
,&&+ ,
day&&- 0
)&&0 1
;&&1 2
}'' 	
public** 
int** 
Year** 
{++ 	
get,, 
{,, 
return,, 
date,, 
.,, 
Year,, "
;,," #
},,$ %
}-- 	
public00 
int00 
Month00 
{11 	
get22 
{22 
return22 
date22 
.22 
Month22 #
;22# $
}22% &
}33 	
public66 
int66 
Day66 
{77 	
get88 
{88 
return88 
date88 
.88 
Day88 !
;88! "
}88# $
}99 	
public<< 
DateTime<< 
DateTime<<  
{== 	
get>> 
{>> 
return>> 
date>> 
;>> 
}>>  
}?? 	
publicBB 
intBB 
	CompareToBB 
(BB 
DateBB !
otherBB" '
)BB' (
{CC 	
returnDD 
dateDD 
.DD 
	CompareToDD !
(DD! "
otherDD" '
.DD' (
dateDD( ,
)DD, -
;DD- .
}EE 	
publicHH 
intHH 
	CompareToHH 
(HH 
objectHH #
objHH$ '
)HH' (
{II 	
returnJJ 
dateJJ 
.JJ 
	CompareToJJ !
(JJ! "
(JJ" #
(JJ# $
DateJJ$ (
)JJ( )
objJJ) ,
)JJ, -
.JJ- .
dateJJ. 2
)JJ2 3
;JJ3 4
}KK 	
publicNN 
boolNN 
EqualsNN 
(NN 
DateNN 
otherNN  %
)NN% &
{OO 	
returnPP 
datePP 
.PP 
EqualsPP 
(PP 
otherPP $
.PP$ %
datePP% )
)PP) *
;PP* +
}QQ 	
publicTT 
overrideTT 
stringTT 
ToStringTT '
(TT' (
)TT( )
{UU 	
returnVV 
dateVV 
.VV 
ToStringVV  
(VV  !
$strVV! $
)VV$ %
;VV% &
}WW 	
publicZZ 
overrideZZ 
boolZZ 
EqualsZZ #
(ZZ# $
objectZZ$ *
objZZ+ .
)ZZ. /
{[[ 	
if\\ 
(\\ 
obj\\ 
==\\ 
null\\ 
||\\ 
GetType\\ &
(\\& '
)\\' (
!=\\) +
obj\\, /
.\\/ 0
GetType\\0 7
(\\7 8
)\\8 9
)\\9 :
{]] 
return^^ 
false^^ 
;^^ 
}__ 
returnaa 
Equalsaa 
(aa 
(aa 
Dateaa 
)aa  
objaa  #
)aa# $
;aa$ %
}bb 	
publicee 
overrideee 
intee 
GetHashCodeee '
(ee' (
)ee( )
{ff 	
returngg 
HashToolgg 
.gg 
ComputeHashCodegg +
(gg+ ,
GetTypegg, 3
(gg3 4
)gg4 5
.gg5 6
GetHashCodegg6 A
(ggA B
)ggB C
,ggC D
dateggE I
)ggI J
;ggJ K
}hh 	
publickk 
statickk 
TimeSpankk 
operatorkk '
-kk( )
(kk) *
Datekk* .
date1kk/ 4
,kk4 5
Datekk6 :
date2kk; @
)kk@ A
{ll 	
returnmm 
date1mm 
.mm 
datemm 
-mm 
date2mm  %
.mm% &
datemm& *
;mm* +
}nn 	
publicqq 
staticqq 
Dateqq 
operatorqq #
-qq$ %
(qq% &
Dateqq& *
dateqq+ /
,qq/ 0
TimeSpanqq1 9
durationqq: B
)qqB C
{rr 	
returnss 
newss 
Datess 
(ss 
datess  
.ss  !
datess! %
-ss& '
durationss( 0
)ss0 1
;ss1 2
}tt 	
publicww 
staticww 
Dateww 
operatorww #
+ww$ %
(ww% &
Dateww& *
dateww+ /
,ww/ 0
TimeSpanww1 9
durationww: B
)wwB C
{xx 	
returnyy 
newyy 
Dateyy 
(yy 
dateyy  
.yy  !
dateyy! %
+yy& '
durationyy( 0
)yy0 1
;yy1 2
}zz 	
public}} 
static}} 
bool}} 
operator}} #
<}}$ %
(}}% &
Date}}& *
date1}}+ 0
,}}0 1
Date}}2 6
date2}}7 <
)}}< =
{~~ 	
return 
date1 
. 
date 
< 
date2  %
.% &
date& *
;* +
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
<=
��$ &
(
��& '
Date
��' +
date1
��, 1
,
��1 2
Date
��3 7
date2
��8 =
)
��= >
{
�� 	
return
�� 
date1
�� 
.
�� 
date
�� 
<=
��  
date2
��! &
.
��& '
date
��' +
;
��+ ,
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
==
��$ &
(
��& '
Date
��' +
left
��, 0
,
��0 1
Date
��2 6
right
��7 <
)
��< =
{
�� 	
return
�� 
Equals
�� 
(
�� 
left
�� 
,
�� 
right
��  %
)
��% &
;
��& '
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
!=
��$ &
(
��& '
Date
��' +
left
��, 0
,
��0 1
Date
��2 6
right
��7 <
)
��< =
{
�� 	
return
�� 
!
�� 
Equals
�� 
(
�� 
left
�� 
,
��  
right
��! &
)
��& '
;
��' (
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
>
��$ %
(
��% &
Date
��& *
date1
��+ 0
,
��0 1
Date
��2 6
date2
��7 <
)
��< =
{
�� 	
return
�� 
date1
�� 
.
�� 
date
�� 
>
�� 
date2
��  %
.
��% &
date
��& *
;
��* +
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
>=
��$ &
(
��& '
Date
��' +
date1
��, 1
,
��1 2
Date
��3 7
date2
��8 =
)
��= >
{
�� 	
return
�� 
date1
�� 
.
�� 
date
�� 
>=
��  
date2
��! &
.
��& '
date
��' +
;
��+ ,
}
�� 	
public
�� 
DateTime
�� 

ToDateTime
�� "
(
��" #
Time
��# '
time
��( ,
)
��, -
{
�� 	
return
�� 

ToDateTime
�� 
(
�� 
this
�� "
,
��" #
time
��$ (
)
��( )
;
��) *
}
�� 	
public
�� 
DateTime
�� 

ToDateTime
�� "
(
��" #
int
��# &
hour
��' +
,
��+ ,
int
��- 0
minute
��1 7
=
��8 9
$num
��: ;
,
��; <
int
��= @
second
��A G
=
��H I
$num
��J K
,
��K L
int
��M P
millisecond
��Q \
=
��] ^
$num
��_ `
)
��` a
{
�� 	
return
�� 

ToDateTime
�� 
(
�� 
this
�� "
,
��" #
hour
��$ (
,
��( )
minute
��* 0
,
��0 1
second
��2 8
,
��8 9
millisecond
��: E
)
��E F
;
��F G
}
�� 	
public
�� 
static
�� 
DateTime
�� 

ToDateTime
�� )
(
��) *
Date
��* .
date
��/ 3
,
��3 4
Time
��5 9
time
��: >
)
��> ?
{
�� 	
return
�� 
date
�� 
.
�� 
DateTime
��  
.
��  !
Add
��! $
(
��$ %
time
��% )
.
��) *
Duration
��* 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
static
�� 
DateTime
�� 

ToDateTime
�� )
(
��) *
Date
��* .
date
��/ 3
,
��3 4
int
��5 8
hour
��9 =
,
��= >
int
��? B
minute
��C I
=
��J K
$num
��L M
,
��M N
int
��O R
second
��S Y
=
��Z [
$num
��\ ]
,
��] ^
int
��_ b
millisecond
��c n
=
��o p
$num
��q r
)
��r s
{
�� 	
return
�� 
new
�� 
DateTime
�� 
(
��  
date
��  $
.
��$ %
Year
��% )
,
��) *
date
��+ /
.
��/ 0
Month
��0 5
,
��5 6
date
��7 ;
.
��; <
Day
��< ?
,
��? @
hour
��A E
,
��E F
minute
��G M
,
��M N
second
��O U
,
��U V
millisecond
��W b
)
��b c
;
��c d
}
�� 	
private
�� 
readonly
�� 
DateTime
�� !
date
��" &
;
��& '
}
�� 
}�� ��
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DateAdd.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
DateAdd 
{ 
public !
ITimePeriodCollection $
IncludePeriods% 3
{ 	
get 
{ 
return 
includePeriods '
;' (
}) *
} 	
public !
ITimePeriodCollection $
ExcludePeriods% 3
{ 	
get 
{ 
return 
excludePeriods '
;' (
}) *
} 	
public 
virtual 
DateTime 
?  
Subtract! )
() *
DateTime* 2
start3 8
,8 9
TimeSpan: B
offsetC I
,I J
SeekBoundaryModeK [
seekBoundaryMode\ l
=m n
SeekBoundaryModeo 
.	 �
Next
� �
)
� �
{ 	
if   
(   
includePeriods   
.   
Count   $
==  % '
$num  ( )
&&  * ,
excludePeriods  - ;
.  ; <
Count  < A
==  B D
$num  E F
)  F G
{!! 
return"" 
start"" 
."" 
Subtract"" %
(""% &
offset""& ,
)"", -
;""- .
}## 
TimeSpan%% 
?%% 
	remaining%% 
;%%  
return&& 
offset&& 
<&& 
TimeSpan&& $
.&&$ %
Zero&&% )
?&&* +
CalculateEnd'' 
('' 
start'' "
,''" #
offset''$ *
.''* +
Negate''+ 1
(''1 2
)''2 3
,''3 4

.''B C
Forward''C J
,''J K
seekBoundaryMode''L \
,''\ ]
out''^ a
	remaining''b k
)''k l
:''m n
CalculateEnd(( 
((( 
start(( "
,((" #
offset(($ *
,((* +

.((9 :
Backward((: B
,((B C
seekBoundaryMode((D T
,((T U
out((V Y
	remaining((Z c
)((c d
;((d e
})) 	
public,, 
virtual,, 
DateTime,, 
?,,  
Add,,! $
(,,$ %
DateTime,,% -
start,,. 3
,,,3 4
TimeSpan,,5 =
offset,,> D
,,,D E
SeekBoundaryMode,,F V
seekBoundaryMode,,W g
=,,h i
SeekBoundaryMode,,j z
.,,z {
Next,,{ 
)	,, �
{-- 	
if.. 
(.. 
includePeriods.. 
... 
Count.. $
==..% '
$num..( )
&&..* ,
excludePeriods..- ;
...; <
Count..< A
==..B D
$num..E F
)..F G
{// 
return00 
start00 
.00 
Add00  
(00  !
offset00! '
)00' (
;00( )
}11 
TimeSpan33 
?33 
	remaining33 
;33  
return44 
offset44 
<44 
TimeSpan44 $
.44$ %
Zero44% )
?44* +
CalculateEnd55 
(55 
start55 "
,55" #
offset55$ *
.55* +
Negate55+ 1
(551 2
)552 3
,553 4

.55B C
Backward55C K
,55K L
seekBoundaryMode55M ]
,55] ^
out55_ b
	remaining55c l
)55l m
:55n o
CalculateEnd66 
(66 
start66 "
,66" #
offset66$ *
,66* +

.669 :
Forward66: A
,66A B
seekBoundaryMode66C S
,66S T
out66U X
	remaining66Y b
)66b c
;66c d
}77 	
	protected:: 
DateTime:: 
?:: 
CalculateEnd:: (
(::( )
DateTime::) 1
start::2 7
,::7 8
TimeSpan::9 A
offset::B H
,::H I


,;;' (
SeekBoundaryMode;;) 9
seekBoundaryMode;;: J
,;;J K
out;;L O
TimeSpan;;P X
?;;X Y
	remaining;;Z c
);;c d
{<< 	
if== 
(== 
offset== 
<== 
TimeSpan== !
.==! "
Zero==" &
)==& '
{>> 
throw?? 
new?? %
InvalidOperationException?? 3
(??3 4
$str??4 P
)??P Q
;??Q R
}@@ 
	remainingBB 
=BB 
offsetBB 
;BB  
TimePeriodCollectionEE  

=EE/ 0
newEE1 4 
TimePeriodCollectionEE5 I
(EEI J
includePeriodsEEJ X
)EEX Y
;EEY Z
ifHH 
(HH 

.HH 
CountHH #
==HH$ &
$numHH' (
)HH( )
{II 

.JJ 
AddJJ !
(JJ! "
	TimeRangeJJ" +
.JJ+ ,
AnytimeJJ, 3
)JJ3 4
;JJ4 5
}KK 
ITimePeriodCollectionNN !
availablePeriodsNN" 2
=NN3 4
newNN5 8 
TimePeriodCollectionNN9 M
(NNM N
)NNN O
;NNO P
ifQQ 
(QQ 
excludePeriodsQQ 
.QQ 
CountQQ $
==QQ% '
$numQQ( )
)QQ) *
{RR 
availablePeriodsSS  
.SS  !
AddAllSS! '
(SS' (

)SS5 6
;SS6 7
}TT 
elseUU 
{VV 
TimeGapCalculatorWW !
<WW! "
	TimeRangeWW" +
>WW+ ,

=WW; <
newWW= @
TimeGapCalculatorWWA R
<WWR S
	TimeRangeWWS \
>WW\ ]
(WW] ^
)WW^ _
;WW_ `
foreachXX 
(XX 
ITimePeriodXX $
searchPeriodXX% 1
inXX2 4

)XXB C
{YY 
if\\ 
(\\ 
!\\ 
excludePeriods\\ '
.\\' (
HasOverlapPeriods\\( 9
(\\9 :
searchPeriod\\: F
)\\F G
)\\G H
{]] 
availablePeriods^^ (
.^^( )
Add^^) ,
(^^, -
searchPeriod^^- 9
)^^9 :
;^^: ;
}__ 
else`` 
{aa 
availablePeriodsbb (
.bb( )
AddAllbb) /
(bb/ 0

.bb= >
GetGapsbb> E
(bbE F
excludePeriodsbbF T
,bbT U
searchPeriodbbV b
)bbb c
)bbc d
;bbd e
}cc 
}dd 
}ee 
ifhh 
(hh 
availablePeriodshh  
.hh  !
Counthh! &
==hh' )
$numhh* +
)hh+ ,
{ii 
returnjj 
nulljj 
;jj 
}kk 
ifoo 
(oo 
availablePeriodsoo  
.oo  !
Countoo! &
>oo' (
$numoo) *
)oo* +
{pp 
TimePeriodCombinerqq "
<qq" #
	TimeRangeqq# ,
>qq, -
periodCombinerqq. <
=qq= >
newqq? B
TimePeriodCombinerqqC U
<qqU V
	TimeRangeqqV _
>qq_ `
(qq` a
)qqa b
;qqb c
availablePeriodsrr  
=rr! "
periodCombinerrr# 1
.rr1 2
CombinePeriodsrr2 @
(rr@ A
availablePeriodsrrA Q
)rrQ R
;rrR S
}ss 
ITimePeriodvv 
startPeriodvv #
=vv$ %
nullvv& *
;vv* +
DateTimeww 

seekMomentww 
=ww  !
startww" '
;ww' (
switchxx 
(xx 

)xx! "
{yy 
casezz 

.zz" #
Forwardzz# *
:zz* +
startPeriod{{ 
={{  !
FindNextPeriod{{" 0
({{0 1
start{{1 6
,{{6 7
availablePeriods{{8 H
,{{H I
out{{J M

seekMoment{{N X
){{X Y
;{{Y Z
break|| 
;|| 
case}} 

.}}" #
Backward}}# +
:}}+ ,
startPeriod~~ 
=~~  !
FindPreviousPeriod~~" 4
(~~4 5
start~~5 :
,~~: ;
availablePeriods~~< L
,~~L M
out~~N Q

seekMoment~~R \
)~~\ ]
;~~] ^
break 
; 
}
�� 
if
�� 
(
�� 
startPeriod
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
if
�� 
(
�� 
offset
�� 
==
�� 
TimeSpan
�� "
.
��" #
Zero
��# '
)
��' (
{
�� 
return
�� 

seekMoment
�� !
;
��! "
}
�� 
switch
�� 
(
�� 

�� !
)
��! "
{
�� 
case
�� 

�� "
.
��" #
Forward
��# *
:
��* +
for
�� 
(
�� 
int
�� 
i
�� 
=
��  
availablePeriods
��! 1
.
��1 2
IndexOf
��2 9
(
��9 :
startPeriod
��: E
)
��E F
;
��F G
i
��H I
<
��J K
availablePeriods
��L \
.
��\ ]
Count
��] b
;
��b c
i
��d e
++
��e g
)
��g h
{
�� 
ITimePeriod
�� #
gap
��$ '
=
��( )
availablePeriods
��* :
[
��: ;
i
��; <
]
��< =
;
��= >
TimeSpan
��  
gapRemining
��! ,
=
��- .
gap
��/ 2
.
��2 3
End
��3 6
-
��7 8

seekMoment
��9 C
;
��C D
bool
�� 
isTargetPeriod
�� +
=
��, -
false
��. 3
;
��3 4
switch
�� 
(
��  
seekBoundaryMode
��  0
)
��0 1
{
�� 
case
��  
SeekBoundaryMode
��! 1
.
��1 2
Fill
��2 6
:
��6 7
isTargetPeriod
��  .
=
��/ 0
gapRemining
��1 <
>=
��= ?
	remaining
��@ I
;
��I J
break
��  %
;
��% &
case
��  
SeekBoundaryMode
��! 1
.
��1 2
Next
��2 6
:
��6 7
isTargetPeriod
��  .
=
��/ 0
gapRemining
��1 <
>
��= >
	remaining
��? H
;
��H I
break
��  %
;
��% &
}
�� 
if
�� 
(
�� 
isTargetPeriod
�� *
)
��* +
{
�� 
DateTime
�� $
end
��% (
=
��) *

seekMoment
��+ 5
+
��6 7
	remaining
��8 A
.
��A B
Value
��B G
;
��G H
	remaining
�� %
=
��& '
null
��( ,
;
��, -
return
�� "
end
��# &
;
��& '
}
�� 
	remaining
�� !
=
��" #
	remaining
��$ -
-
��. /
gapRemining
��0 ;
;
��; <
if
�� 
(
�� 
i
�� 
==
��  
availablePeriods
��! 1
.
��1 2
Count
��2 7
-
��8 9
$num
��: ;
)
��; <
{
�� 
return
�� "
null
��# '
;
��' (
}
�� 

seekMoment
�� "
=
��# $
availablePeriods
��% 5
[
��5 6
i
��6 7
+
��8 9
$num
��: ;
]
��; <
.
��< =
Start
��= B
;
��B C
}
�� 
break
�� 
;
�� 
case
�� 

�� "
.
��" #
Backward
��# +
:
��+ ,
for
�� 
(
�� 
int
�� 
i
�� 
=
��  
availablePeriods
��! 1
.
��1 2
IndexOf
��2 9
(
��9 :
startPeriod
��: E
)
��E F
;
��F G
i
��H I
>=
��J L
$num
��M N
;
��N O
i
��P Q
--
��Q S
)
��S T
{
�� 
ITimePeriod
�� #
gap
��$ '
=
��( )
availablePeriods
��* :
[
��: ;
i
��; <
]
��< =
;
��= >
TimeSpan
��  
gapRemining
��! ,
=
��- .

seekMoment
��/ 9
-
��: ;
gap
��< ?
.
��? @
Start
��@ E
;
��E F
bool
�� 
isTargetPeriod
�� +
=
��, -
false
��. 3
;
��3 4
switch
�� 
(
��  
seekBoundaryMode
��  0
)
��0 1
{
�� 
case
��  
SeekBoundaryMode
��! 1
.
��1 2
Fill
��2 6
:
��6 7
isTargetPeriod
��  .
=
��/ 0
gapRemining
��1 <
>=
��= ?
	remaining
��@ I
;
��I J
break
��  %
;
��% &
case
��  
SeekBoundaryMode
��! 1
.
��1 2
Next
��2 6
:
��6 7
isTargetPeriod
��  .
=
��/ 0
gapRemining
��1 <
>
��= >
	remaining
��? H
;
��H I
break
��  %
;
��% &
}
�� 
if
�� 
(
�� 
isTargetPeriod
�� *
)
��* +
{
�� 
DateTime
�� $
end
��% (
=
��) *

seekMoment
��+ 5
-
��6 7
	remaining
��8 A
.
��A B
Value
��B G
;
��G H
	remaining
�� %
=
��& '
null
��( ,
;
��, -
return
�� "
end
��# &
;
��& '
}
�� 
	remaining
�� !
=
��" #
	remaining
��$ -
-
��. /
gapRemining
��0 ;
;
��; <
if
�� 
(
�� 
i
�� 
==
��  
$num
��! "
)
��" #
{
�� 
return
�� "
null
��# '
;
��' (
}
�� 

seekMoment
�� "
=
��# $
availablePeriods
��% 5
[
��5 6
i
��6 7
-
��8 9
$num
��: ;
]
��; <
.
��< =
End
��= @
;
��@ A
}
�� 
break
�� 
;
�� 
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
ITimePeriod
�� "
FindNextPeriod
��# 1
(
��1 2
DateTime
��2 :
start
��; @
,
��@ A
IEnumerable
��B M
<
��M N
ITimePeriod
��N Y
>
��Y Z
periods
��[ b
,
��b c
out
��d g
DateTime
��h p
moment
��q w
)
��w x
{
�� 	
ITimePeriod
�� 

�� %
=
��& '
null
��( ,
;
��, -
TimeSpan
�� 

difference
�� 
=
��  !
TimeSpan
��" *
.
��* +
MaxValue
��+ 3
;
��3 4
moment
�� 
=
�� 
start
�� 
;
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
period
�� 
.
�� 
	HasInside
�� $
(
��$ %
start
��% *
)
��* +
)
��+ ,
{
�� 

�� !
=
��" #
period
��$ *
;
��* +
moment
�� 
=
�� 
start
�� "
;
��" #
break
�� 
;
�� 
}
�� 
if
�� 
(
�� 
period
�� 
.
�� 
End
�� 
<
��  
start
��! &
)
��& '
{
�� 
continue
�� 
;
�� 
}
�� 
TimeSpan
�� 
periodToMoment
�� '
=
��( )
period
��* 0
.
��0 1
Start
��1 6
-
��7 8
start
��9 >
;
��> ?
if
�� 
(
�� 
periodToMoment
�� "
>=
��# %

difference
��& 0
)
��0 1
{
�� 
continue
�� 
;
�� 
}
�� 

difference
�� 
=
�� 
periodToMoment
�� +
;
��+ ,

�� 
=
�� 
period
��  &
;
��& '
moment
�� 
=
�� 

�� &
.
��& '
Start
��' ,
;
��, -
}
�� 
return
�� 

��  
;
��  !
}
�� 	
private
�� 
static
�� 
ITimePeriod
�� " 
FindPreviousPeriod
��# 5
(
��5 6
DateTime
��6 >
start
��? D
,
��D E
IEnumerable
��F Q
<
��Q R
ITimePeriod
��R ]
>
��] ^
periods
��_ f
,
��f g
out
��h k
DateTime
��l t
moment
��u {
)
��{ |
{
�� 	
ITimePeriod
�� 

�� %
=
��& '
null
��( ,
;
��, -
TimeSpan
�� 

difference
�� 
=
��  !
TimeSpan
��" *
.
��* +
MaxValue
��+ 3
;
��3 4
moment
�� 
=
�� 
start
�� 
;
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
period
�� 
.
�� 
	HasInside
�� $
(
��$ %
start
��% *
)
��* +
)
��+ ,
{
�� 

�� !
=
��" #
period
��$ *
;
��* +
moment
�� 
=
�� 
start
�� "
;
��" #
break
�� 
;
�� 
}
�� 
if
�� 
(
�� 
period
�� 
.
�� 
Start
��  
>
��! "
start
��# (
)
��( )
{
�� 
continue
�� 
;
�� 
}
�� 
TimeSpan
�� 
periodToMoment
�� '
=
��( )
start
��* /
-
��0 1
period
��2 8
.
��8 9
End
��9 <
;
��< =
if
�� 
(
�� 
periodToMoment
�� "
>=
��# %

difference
��& 0
)
��0 1
{
�� 
continue
�� 
;
�� 
}
�� 

difference
�� 
=
�� 
periodToMoment
�� +
;
��+ ,

�� 
=
�� 
period
��  &
;
��& '
moment
�� 
=
�� 

�� &
.
��& '
End
��' *
;
��* +
}
�� 
return
�� 

��  
;
��  !
}
�� 	
private
�� 
readonly
�� "
TimePeriodCollection
�� -
includePeriods
��. <
=
��= >
new
��? B"
TimePeriodCollection
��C W
(
��W X
)
��X Y
;
��Y Z
private
�� 
readonly
�� "
TimePeriodCollection
�� -
excludePeriods
��. <
=
��= >
new
��? B"
TimePeriodCollection
��C W
(
��W X
)
��X Y
;
��Y Z
}
�� 
}�� ��
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DateDiff.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

sealed 
class 
DateDiff  
{ 
public 
DateDiff 
( 
DateTime  
date! %
)% &
:' (
this 
( 
date 
, 
SafeCurrentInfo &
.& '
Calendar' /
,/ 0
SafeCurrentInfo1 @
.@ A
FirstDayOfWeekA O
)O P
{ 	
} 	
public 
DateDiff 
( 
DateTime  
date! %
,% &
Calendar' /
calendar0 8
,8 9
	DayOfWeek: C
firstDayOfWeekD R
,R S
	YearMonth 

=$ %
TimeSpec& .
.. /"
CalendarYearStartMonth/ E
)E F
:G H
this 
( 
date 
, 

ClockProxy !
.! "
Clock" '
.' (
Now( +
,+ ,
calendar- 5
,5 6
firstDayOfWeek7 E
,E F

)T U
{ 	
} 	
public   
DateDiff   
(   
DateTime    
date1  ! &
,  & '
DateTime  ( 0
date2  1 6
)  6 7
:  8 9
this!! 
(!! 
date1!! 
,!! 
date2!! 
,!! 
SafeCurrentInfo!! .
.!!. /
Calendar!!/ 7
,!!7 8
SafeCurrentInfo!!9 H
.!!H I
FirstDayOfWeek!!I W
)!!W X
{"" 	
}## 	
public&& 
DateDiff&& 
(&& 
DateTime&&  
date1&&! &
,&&& '
DateTime&&( 0
date2&&1 6
,&&6 7
Calendar&&8 @
calendar&&A I
,&&I J
	DayOfWeek'' 
firstDayOfWeek'' $
,''$ %
	YearMonth''& /

=''> ?
TimeSpec''@ H
.''H I"
CalendarYearStartMonth''I _
)''_ `
{(( 	
if)) 
()) 
calendar)) 
==)) 
null))  
)))  !
{** 
throw++ 
new++ !
ArgumentNullException++ /
(++/ 0
$str++0 :
)++: ;
;++; <
},, 
this-- 
.-- 
calendar-- 
=-- 
calendar-- $
;--$ %
this.. 
... 

=..  

;... /
this// 
.// 
firstDayOfWeek// 
=//  !
firstDayOfWeek//" 0
;//0 1
this00 
.00 
date100 
=00 
date100 
;00 
this11 
.11 
date211 
=11 
date211 
;11 

difference22 
=22 
date222 
.22 
Subtract22 '
(22' (
date122( -
)22- .
;22. /
}33 	
public66 
DateDiff66 
(66 
TimeSpan66  

difference66! +
)66+ ,
:66- .
this77 
(77 

ClockProxy77 
.77 
Clock77 !
.77! "
Now77" %
,77% &

difference77' 1
,771 2
SafeCurrentInfo773 B
.77B C
Calendar77C K
,77K L
SafeCurrentInfo77M \
.77\ ]
FirstDayOfWeek77] k
)77k l
{88 	
}99 	
public<< 
DateDiff<< 
(<< 
TimeSpan<<  

difference<<! +
,<<+ ,
Calendar<<- 5
calendar<<6 >
,<<> ?
	DayOfWeek== 
firstDayOfWeek== (
,==( )
	YearMonth==* 3

===B C
TimeSpec==D L
.==L M"
CalendarYearStartMonth==M c
)==c d
:==e f
this>> 
(>> 

ClockProxy>> 
.>> 
Clock>> !
.>>! "
Now>>" %
,>>% &

difference>>' 1
,>>1 2
calendar>>3 ;
,>>; <
firstDayOfWeek>>= K
,>>K L

)>>Z [
{?? 	
}@@ 	
publicCC 
DateDiffCC 
(CC 
DateTimeCC  
date1CC! &
,CC& '
TimeSpanCC( 0

differenceCC1 ;
)CC; <
:CC= >
thisDD 
(DD 
date1DD 
,DD 

differenceDD "
,DD" #
SafeCurrentInfoDD$ 3
.DD3 4
CalendarDD4 <
,DD< =
SafeCurrentInfoDD> M
.DDM N
FirstDayOfWeekDDN \
)DD\ ]
{EE 	
}FF 	
publicII 
DateDiffII 
(II 
DateTimeII  
date1II! &
,II& '
TimeSpanII( 0

differenceII1 ;
,II; <
CalendarII= E
calendarIIF N
,IIN O
	DayOfWeekJJ 
firstDayOfWeekJJ (
,JJ( )
	YearMonthJJ* 3

=JJB C
TimeSpecJJD L
.JJL M"
CalendarYearStartMonthJJM c
)JJc d
{KK 	
ifLL 
(LL 
calendarLL 
==LL 
nullLL  
)LL  !
{MM 
throwNN 
newNN !
ArgumentNullExceptionNN /
(NN/ 0
$strNN0 :
)NN: ;
;NN; <
}OO 
thisPP 
.PP 
calendarPP 
=PP 
calendarPP $
;PP$ %
thisQQ 
.QQ 

=QQ  

;QQ. /
thisRR 
.RR 
firstDayOfWeekRR 
=RR  !
firstDayOfWeekRR" 0
;RR0 1
thisSS 
.SS 
date1SS 
=SS 
date1SS 
;SS 
date2TT 
=TT 
date1TT 
.TT 
AddTT 
(TT 

differenceTT (
)TT( )
;TT) *
thisUU 
.UU 

differenceUU 
=UU 

differenceUU (
;UU( )
}VV 	
publicXX 
staticXX 
DateTimeFormatInfoXX (
SafeCurrentInfoXX) 8
{YY 	
getZZ 
{ZZ 
returnZZ 
DateTimeFormatInfoZZ +
.ZZ+ ,
CurrentInfoZZ, 7
??ZZ8 :
DateTimeFormatInfoZZ; M
.ZZM N

;ZZ[ \
}ZZ] ^
}[[ 	
public^^ 
Calendar^^ 
Calendar^^  
{__ 	
get`` 
{`` 
return`` 
calendar`` !
;``! "
}``# $
}aa 	
publicdd 
	YearMonthdd 

{ee 	
getff 
{ff 
returnff 

;ff& '
}ff( )
}gg 	
publicjj 
	DayOfWeekjj 
FirstDayOfWeekjj '
{kk 	
getll 
{ll 
returnll 
firstDayOfWeekll '
;ll' (
}ll) *
}mm 	
publicpp 
DateTimepp 
Date1pp 
{qq 	
getrr 
{rr 
returnrr 
date1rr 
;rr 
}rr  !
}ss 	
publicvv 
DateTimevv 
Date2vv 
{ww 	
getxx 
{xx 
returnxx 
date2xx 
;xx 
}xx  !
}yy 	
public|| 
TimeSpan|| 

Difference|| "
{}} 	
get~~ 
{~~ 
return~~ 

difference~~ #
;~~# $
}~~% &
} 	
public
�� 
bool
�� 
IsEmpty
�� 
{
�� 	
get
�� 
{
�� 
return
�� 

difference
�� #
==
��$ &
TimeSpan
��' /
.
��/ 0
Zero
��0 4
;
��4 5
}
��6 7
}
�� 	
private
�� 
int
�� 
Year1
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
calendar
�� !
.
��! "
GetYear
��" )
(
��) *
Date1
��* /
)
��/ 0
;
��0 1
}
��2 3
}
�� 	
private
�� 
int
�� 
Year2
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
calendar
�� !
.
��! "
GetYear
��" )
(
��) *
Date2
��* /
)
��/ 0
;
��0 1
}
��2 3
}
�� 	
public
�� 
int
�� 
Years
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
years
�� 
.
�� 
HasValue
�� #
)
��# $
{
�� 
years
�� 
=
�� 
	CalcYears
�� %
(
��% &
)
��& '
;
��' (
}
�� 
return
�� 
years
�� 
.
�� 
Value
�� "
;
��" #
}
�� 
}
�� 	
public
�� 
int
�� 
ElapsedYears
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
elapsedYears
�� !
.
��! "
HasValue
��" *
)
��* +
{
�� 
elapsedYears
��  
=
��! "
Years
��# (
;
��( )
}
�� 
return
�� 
elapsedYears
�� #
.
��# $
Value
��$ )
;
��) *
}
�� 
}
�� 	
public
�� 
int
�� 
Quarters
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
quarters
�� 
.
�� 
HasValue
�� &
)
��& '
{
�� 
quarters
�� 
=
�� 
CalcQuarters
�� +
(
��+ ,
)
��, -
;
��- .
}
�� 
return
�� 
quarters
�� 
.
��  
Value
��  %
;
��% &
}
�� 
}
�� 	
private
�� 
int
�� 
Month1
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
calendar
�� !
.
��! "
GetMonth
��" *
(
��* +
Date1
��+ 0
)
��0 1
;
��1 2
}
��3 4
}
�� 	
private
�� 
int
�� 
Month2
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
calendar
�� !
.
��! "
GetMonth
��" *
(
��* +
Date2
��+ 0
)
��0 1
;
��1 2
}
��3 4
}
�� 	
public
�� 
int
�� 
Months
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
months
�� 
.
�� 
HasValue
�� $
)
��$ %
{
�� 
months
�� 
=
�� 

CalcMonths
�� '
(
��' (
)
��( )
;
��) *
}
�� 
return
�� 
months
�� 
.
�� 
Value
�� #
;
��# $
}
�� 
}
�� 	
public
�� 
int
�� 

��  
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 

�� "
.
��" #
HasValue
��# +
)
��+ ,
{
�� 

�� !
=
��" #
Months
��$ *
-
��+ ,
ElapsedYears
��- 9
*
��: ;
TimeSpec
��< D
.
��D E

��E R
;
��R S
}
�� 
return
�� 

�� $
.
��$ %
Value
��% *
;
��* +
}
�� 
}
�� 	
public
�� 
int
�� 
Weeks
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
weeks
�� 
.
�� 
HasValue
�� #
)
��# $
{
�� 
weeks
�� 
=
�� 
	CalcWeeks
�� %
(
��% &
)
��& '
;
��' (
}
�� 
return
�� 
weeks
�� 
.
�� 
Value
�� "
;
��" #
}
�� 
}
�� 	
public
�� 
int
�� 
Days
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
(
�� 
int
�� 
)
�� 
Math
�� "
.
��" #
Round
��# (
(
��( )
Round
��) .
(
��. /

difference
��/ 9
.
��9 :
	TotalDays
��: C
)
��C D
)
��D E
;
��E F
}
��G H
}
�� 	
public
�� 
int
�� 
Weekdays
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
(
�� 
int
�� 
)
�� 
Math
�� "
.
��" #
Round
��# (
(
��( )
Round
��) .
(
��. /

difference
��/ 9
.
��9 :
	TotalDays
��: C
)
��C D
)
��D E
/
��F G
TimeSpec
��H P
.
��P Q
DaysPerWeek
��Q \
;
��\ ]
}
��^ _
}
�� 	
public
�� 
int
�� 
ElapsedDays
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
elapsedDays
��  
.
��  !
HasValue
��! )
)
��) *
{
�� 
DateTime
�� 
compareDate
�� (
=
��) *
date1
��+ 0
.
��0 1
AddYears
��1 9
(
��9 :
ElapsedYears
��: F
)
��F G
.
��G H
	AddMonths
��H Q
(
��Q R

��R _
)
��_ `
;
��` a
elapsedDays
�� 
=
��  !
(
��" #
int
��# &
)
��& '
date2
��' ,
.
��, -
Subtract
��- 5
(
��5 6
compareDate
��6 A
)
��A B
.
��B C
	TotalDays
��C L
;
��L M
}
�� 
return
�� 
elapsedDays
�� "
.
��" #
Value
��# (
;
��( )
}
�� 
}
�� 	
public
�� 
int
�� 
Hours
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
(
�� 
int
�� 
)
�� 
Math
�� "
.
��" #
Round
��# (
(
��( )
Round
��) .
(
��. /

difference
��/ 9
.
��9 :

TotalHours
��: D
)
��D E
)
��E F
;
��F G
}
��H I
}
�� 	
public
�� 
int
�� 
ElapsedHours
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
elapsedHours
�� !
.
��! "
HasValue
��" *
)
��* +
{
�� 
DateTime
�� 
compareDate
�� (
=
��) *
date1
��+ 0
.
��0 1
AddYears
��1 9
(
��9 :
ElapsedYears
��: F
)
��F G
.
��G H
	AddMonths
��H Q
(
��Q R

��R _
)
��_ `
.
��` a
AddDays
��a h
(
��h i
ElapsedDays
��i t
)
��t u
;
��u v
elapsedHours
��  
=
��! "
(
��# $
int
��$ '
)
��' (
date2
��( -
.
��- .
Subtract
��. 6
(
��6 7
compareDate
��7 B
)
��B C
.
��C D

TotalHours
��D N
;
��N O
}
�� 
return
�� 
elapsedHours
�� #
.
��# $
Value
��$ )
;
��) *
}
�� 
}
�� 	
public
�� 
int
�� 
Minutes
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
(
�� 
int
�� 
)
�� 
Math
�� "
.
��" #
Round
��# (
(
��( )
Round
��) .
(
��. /

difference
��/ 9
.
��9 :
TotalMinutes
��: F
)
��F G
)
��G H
;
��H I
}
��J K
}
�� 	
public
�� 
int
�� 
ElapsedMinutes
�� !
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
elapsedMinutes
�� #
.
��# $
HasValue
��$ ,
)
��, -
{
�� 
DateTime
�� 
compareDate
�� (
=
��) *
date1
��+ 0
.
��0 1
AddYears
��1 9
(
��9 :
ElapsedYears
�� $
)
��$ %
.
��% &
	AddMonths
��& /
(
��/ 0

��0 =
)
��= >
.
��> ?
AddDays
��? F
(
��F G
ElapsedDays
��G R
)
��R S
.
��S T
AddHours
��T \
(
��\ ]
ElapsedHours
��] i
)
��i j
;
��j k
elapsedMinutes
�� "
=
��# $
(
��% &
int
��& )
)
��) *
date2
��* /
.
��/ 0
Subtract
��0 8
(
��8 9
compareDate
��9 D
)
��D E
.
��E F
TotalMinutes
��F R
;
��R S
}
�� 
return
�� 
elapsedMinutes
�� %
.
��% &
Value
��& +
;
��+ ,
}
�� 
}
�� 	
public
�� 
int
�� 
Seconds
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
(
�� 
int
�� 
)
�� 
Math
�� "
.
��" #
Round
��# (
(
��( )
Round
��) .
(
��. /

difference
��/ 9
.
��9 :
TotalSeconds
��: F
)
��F G
)
��G H
;
��H I
}
��J K
}
�� 	
public
�� 
int
�� 
ElapsedSeconds
�� !
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� 
elapsedSeconds
�� #
.
��# $
HasValue
��$ ,
)
��, -
{
�� 
DateTime
�� 
compareDate
�� (
=
��) *
date1
��+ 0
.
��0 1
AddYears
��1 9
(
��9 :
ElapsedYears
�� $
)
��$ %
.
��% &
	AddMonths
��& /
(
��/ 0

�� %
)
��% &
.
��& '
AddDays
��' .
(
��. /
ElapsedDays
�� #
)
��# $
.
��$ %
AddHours
��% -
(
��- .
ElapsedHours
�� $
)
��$ %
.
��% &

AddMinutes
��& 0
(
��0 1
ElapsedMinutes
�� &
)
��& '
;
��' (
elapsedSeconds
�� "
=
��# $
(
��% &
int
��& )
)
��) *
date2
��* /
.
��/ 0
Subtract
��0 8
(
��8 9
compareDate
��9 D
)
��D E
.
��E F
TotalSeconds
��F R
;
��R S
}
�� 
return
�� 
elapsedSeconds
�� %
.
��% &
Value
��& +
;
��+ ,
}
�� 
}
�� 	
public
�� 
string
�� 
GetDescription
�� $
(
��$ %
int
��% (
	precision
��) 2
=
��3 4
int
��5 8
.
��8 9
MaxValue
��9 A
,
��A B
ITimeFormatter
��C Q
	formatter
��R [
=
��\ ]
null
��^ b
)
��b c
{
�� 	
if
�� 
(
�� 
	precision
�� 
<
�� 
$num
�� 
)
�� 
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 A
)
��A B
;
��B C
}
�� 
	formatter
�� 
=
�� 
	formatter
�� !
??
��" $

��% 2
.
��2 3
Instance
��3 ;
;
��; <
int
�� 
[
�� 
]
�� 
elapsedItems
�� 
=
��  
new
��! $
int
��% (
[
��( )
$num
��) *
]
��* +
;
��+ ,
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
=
�� 
ElapsedYears
�� *
;
��* +
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
=
�� 

�� +
;
��+ ,
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
=
�� 
ElapsedDays
�� )
;
��) *
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
=
�� 
ElapsedHours
�� *
;
��* +
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
=
�� 
ElapsedMinutes
�� ,
;
��, -
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
=
�� 
ElapsedSeconds
�� ,
;
��, -
if
�� 
(
�� 
	precision
�� 
<=
�� 
elapsedItems
�� )
.
��) *
Length
��* 0
-
��1 2
$num
��3 4
)
��4 5
{
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
	precision
�� &
;
��& '
i
��( )
<
��* +
elapsedItems
��, 8
.
��8 9
Length
��9 ?
;
��? @
i
��A B
++
��B D
)
��D E
{
�� 
elapsedItems
��  
[
��  !
i
��! "
]
��" #
=
��$ %
$num
��& '
;
��' (
}
�� 
}
�� 
return
�� 
	formatter
�� 
.
�� 
GetDuration
�� (
(
��( )
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
,
��  
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
,
��  
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
,
��  
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
,
��  
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
,
��  
elapsedItems
�� 
[
�� 
$num
�� 
]
�� 
)
��  
;
��  !
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
GetDescription
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
override
�� 
bool
�� 
Equals
�� #
(
��# $
object
��$ *
obj
��+ .
)
��. /
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
this
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
DateDiff
�� 
comp
�� 
=
�� 
(
�� 
DateDiff
�� %
)
��% &
obj
��& )
;
��) *
return
�� 
calendar
�� 
==
�� 
comp
�� #
.
��# $
calendar
��$ ,
&&
��- /

�� 
==
��  
comp
��! %
.
��% &

��& 3
&&
��4 6
firstDayOfWeek
�� 
==
�� !
comp
��" &
.
��& '
firstDayOfWeek
��' 5
&&
��6 8
date1
�� 
==
�� 
comp
�� 
.
�� 
date1
�� #
&&
��$ &
date2
�� 
==
�� 
comp
�� 
.
�� 
date2
�� #
&&
��$ &

difference
�� 
==
�� 
comp
�� "
.
��" #

difference
��# -
;
��- .
}
�� 	
public
�� 
override
�� 
int
�� 
GetHashCode
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
GetType
��, 3
(
��3 4
)
��4 5
.
��5 6
GetHashCode
��6 A
(
��A B
)
��B C
,
��C D
calendar
�� 
,
�� 

�� 
,
�� 
firstDayOfWeek
�� 
,
�� 
date1
�� 
,
�� 
date2
�� 
,
�� 

difference
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
double
�� 
Round
�� #
(
��# $
double
��$ *
number
��+ 1
)
��1 2
{
�� 	
if
�� 
(
�� 
number
�� 
>=
�� 
$num
�� 
)
�� 
{
�� 
return
�� 
Math
�� 
.
�� 
Floor
�� !
(
��! "
number
��" (
)
��( )
;
��) *
}
�� 
return
�� 
-
�� 
Math
�� 
.
�� 
Floor
�� 
(
�� 
-
��  
number
��  &
)
��& '
;
��' (
}
�� 	
private
�� 
int
�� 
	CalcYears
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
TimeCompare
�� 
.
�� 
IsSameMonth
�� '
(
��' (
date1
��( -
,
��- .
date2
��/ 4
)
��4 5
)
��5 6
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
int
�� 

compareDay
�� 
=
�� 
date2
�� "
.
��" #
Day
��# &
;
��& '
int
�� !
compareDaysPerMonth
�� #
=
��$ %
calendar
��& .
.
��. /
GetDaysInMonth
��/ =
(
��= >
Year1
��> C
,
��C D
Month2
��E K
)
��K L
;
��L M
if
�� 
(
�� 

compareDay
�� 
>
�� !
compareDaysPerMonth
�� 0
)
��0 1
{
�� 

compareDay
�� 
=
�� !
compareDaysPerMonth
�� 0
;
��0 1
}
�� 
DateTime
�� 
compareDate
��  
=
��! "
new
��# &
DateTime
��' /
(
��/ 0
Year1
��0 5
,
��5 6
Month2
��7 =
,
��= >

compareDay
��? I
,
��I J
date2
�� 
.
�� 
Hour
�� 
,
�� 
date2
�� !
.
��! "
Minute
��" (
,
��( )
date2
��* /
.
��/ 0
Second
��0 6
,
��6 7
date2
��8 =
.
��= >
Millisecond
��> I
)
��I J
;
��J K
if
�� 
(
�� 
date2
�� 
>
�� 
date1
�� 
)
�� 
{
�� 
if
�� 
(
�� 
compareDate
�� 
<
��  !
date1
��" '
)
��' (
{
�� 
compareDate
�� 
=
��  !
compareDate
��" -
.
��- .
AddYears
��. 6
(
��6 7
$num
��7 8
)
��8 9
;
��9 :
}
�� 
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
compareDate
�� 
>
��  !
date1
��" '
)
��' (
{
�� 
compareDate
�� 
=
��  !
compareDate
��" -
.
��- .
AddYears
��. 6
(
��6 7
-
��7 8
$num
��8 9
)
��9 :
;
��: ;
}
�� 
}
�� 
return
�� 
Year2
�� 
-
�� 
calendar
�� #
.
��# $
GetYear
��$ +
(
��+ ,
compareDate
��, 7
)
��7 8
;
��8 9
}
�� 	
private
�� 
int
�� 
CalcQuarters
��  
(
��  !
)
��! "
{
�� 	
if
�� 
(
�� 
TimeCompare
�� 
.
�� 
IsSameMonth
�� '
(
��' (
date1
��( -
,
��- .
date2
��/ 4
)
��4 5
)
��5 6
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
int
�� 
year1
�� 
=
�� 
TimeTool
��  
.
��  !
	GetYearOf
��! *
(
��* +

��+ 8
,
��8 9
Year1
��: ?
,
��? @
Month1
��A G
)
��G H
;
��H I
YearQuarter
�� 
quarter1
��  
=
��! "
TimeTool
��# +
.
��+ ,
GetQuarterOfMonth
��, =
(
��= >

��> K
,
��K L
(
��M N
	YearMonth
��N W
)
��W X
Month1
��X ^
)
��^ _
;
��_ `
int
�� 
year2
�� 
=
�� 
TimeTool
��  
.
��  !
	GetYearOf
��! *
(
��* +

��+ 8
,
��8 9
Year2
��: ?
,
��? @
Month2
��A G
)
��G H
;
��H I
YearQuarter
�� 
quarter2
��  
=
��! "
TimeTool
��# +
.
��+ ,
GetQuarterOfMonth
��, =
(
��= >

��> K
,
��K L
(
��M N
	YearMonth
��N W
)
��W X
Month2
��X ^
)
��^ _
;
��_ `
return
�� 
year2
�� 
*
�� 
TimeSpec
��  
.
��  !
QuartersPerYear
��! 0
+
��1 2
quarter2
��3 ;
-
��< =
(
�� 
year1
�� 
*
�� 
TimeSpec
�� !
.
��! "
QuartersPerYear
��" 1
+
��2 3
quarter1
��4 <
)
��< =
;
��= >
}
�� 	
private
�� 
int
�� 

CalcMonths
�� 
(
�� 
)
��  
{
�� 	
if
�� 
(
�� 
TimeCompare
�� 
.
�� 
	IsSameDay
�� %
(
��% &
date1
��& +
,
��+ ,
date2
��- 2
)
��2 3
)
��3 4
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
int
�� 

compareDay
�� 
=
�� 
date2
�� "
.
��" #
Day
��# &
;
��& '
int
�� !
compareDaysPerMonth
�� #
=
��$ %
calendar
��& .
.
��. /
GetDaysInMonth
��/ =
(
��= >
Year1
��> C
,
��C D
Month1
��E K
)
��K L
;
��L M
if
�� 
(
�� 

compareDay
�� 
>
�� !
compareDaysPerMonth
�� 0
)
��0 1
{
�� 

compareDay
�� 
=
�� !
compareDaysPerMonth
�� 0
;
��0 1
}
�� 
DateTime
�� 
compareDate
��  
=
��! "
new
��# &
DateTime
��' /
(
��/ 0
Year1
��0 5
,
��5 6
Month1
��7 =
,
��= >

compareDay
��? I
,
��I J
date2
�� 
.
�� 
Hour
�� 
,
�� 
date2
�� !
.
��! "
Minute
��" (
,
��( )
date2
��* /
.
��/ 0
Second
��0 6
,
��6 7
date2
��8 =
.
��= >
Millisecond
��> I
)
��I J
;
��J K
if
�� 
(
�� 
date2
�� 
>
�� 
date1
�� 
)
�� 
{
�� 
if
�� 
(
�� 
compareDate
�� 
<
��  !
date1
��" '
)
��' (
{
�� 
compareDate
�� 
=
��  !
compareDate
��" -
.
��- .
	AddMonths
��. 7
(
��7 8
$num
��8 9
)
��9 :
;
��: ;
}
�� 
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
compareDate
�� 
>
��  !
date1
��" '
)
��' (
{
�� 
compareDate
�� 
=
��  !
compareDate
��" -
.
��- .
	AddMonths
��. 7
(
��7 8
-
��8 9
$num
��9 :
)
��: ;
;
��; <
}
�� 
}
�� 
return
�� 
Year2
�� 
*
�� 
TimeSpec
�� 
.
�� 

�� *
+
��+ ,
Month2
��- 3
-
��4 5
(
�� 
calendar
��
.
�� 
GetYear
�� 
(
�� 
compareDate
�� )
)
��) *
*
��+ ,
TimeSpec
��- 5
.
��5 6

��6 C
+
��D E
calendar
��F N
.
��N O
GetMonth
��O W
(
��W X
compareDate
��X c
)
��c d
)
��d e
;
��e f
}
�� 	
private
�� 
int
�� 
	CalcWeeks
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
TimeCompare
�� 
.
�� 
	IsSameDay
�� %
(
��% &
date1
��& +
,
��+ ,
date2
��- 2
)
��2 3
)
��3 4
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
DateTime
�� 
week1
�� 
=
�� 
TimeTool
�� %
.
��% &
GetStartOfWeek
��& 4
(
��4 5
date1
��5 :
,
��: ;
firstDayOfWeek
��< J
)
��J K
;
��K L
DateTime
�� 
week2
�� 
=
�� 
TimeTool
�� %
.
��% &
GetStartOfWeek
��& 4
(
��4 5
date2
��5 :
,
��: ;
firstDayOfWeek
��< J
)
��J K
;
��K L
if
�� 
(
�� 
week1
�� 
.
�� 
Equals
�� 
(
�� 
week2
�� "
)
��" #
)
��# $
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
return
�� 
(
�� 
int
�� 
)
�� 
(
�� 
week2
�� 
.
�� 
Subtract
�� '
(
��' (
week1
��( -
)
��- .
.
��. /
	TotalDays
��/ 8
/
��9 :
TimeSpec
��; C
.
��C D
DaysPerWeek
��D O
)
��O P
;
��P Q
}
�� 	
private
�� 
readonly
�� 
Calendar
�� !
calendar
��" *
;
��* +
private
�� 
readonly
�� 
	YearMonth
�� "

��# 0
;
��0 1
private
�� 
readonly
�� 
	DayOfWeek
�� "
firstDayOfWeek
��# 1
;
��1 2
private
�� 
readonly
�� 
DateTime
�� !
date1
��" '
;
��' (
private
�� 
readonly
�� 
DateTime
�� !
date2
��" '
;
��' (
private
�� 
readonly
�� 
TimeSpan
�� !

difference
��" ,
;
��, -
private
�� 
int
�� 
?
�� 
years
�� 
;
�� 
private
�� 
int
�� 
?
�� 
quarters
�� 
;
�� 
private
�� 
int
�� 
?
�� 
months
�� 
;
�� 
private
�� 
int
�� 
?
�� 
weeks
�� 
;
�� 
private
�� 
int
�� 
?
�� 
elapsedYears
�� !
;
��! "
private
�� 
int
�� 
?
�� 

�� "
;
��" #
private
�� 
int
�� 
?
�� 
elapsedDays
��  
;
��  !
private
�� 
int
�� 
?
�� 
elapsedHours
�� !
;
��! "
private
�� 
int
�� 
?
�� 
elapsedMinutes
�� #
;
��# $
private
�� 
int
�� 
?
�� 
elapsedSeconds
�� #
;
��# $
}
�� 
}�� �~
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DateTimeSet.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

class 
DateTimeSet 
: 
IDateTimeSet +
{ 
public 
DateTimeSet 
( 
) 
{ 	
} 	
public 
DateTimeSet 
( 
IEnumerable &
<& '
DateTime' /
>/ 0
moments1 8
)8 9
{ 	
AddAll 
( 
moments 
) 
; 
} 	
public 
DateTime 
this 
[ 
int  
index! &
]& '
{ 	
get   
{   
return   
moments    
[    !
index  ! &
]  & '
;  ' (
}  ) *
}!! 	
public$$ 
DateTime$$ 
?$$ 
Min$$ 
{%% 	
get&& 
{&& 
return&& 
!&& 
IsEmpty&& !
?&&" #
moments&&$ +
[&&+ ,
$num&&, -
]&&- .
:&&/ 0
null&&1 5
;&&5 6
}&&7 8
}'' 	
public** 
DateTime** 
?** 
Max** 
{++ 	
get,, 
{,, 
return,, 
!,, 
IsEmpty,, !
?,," #
moments,,$ +
[,,+ ,
Count,,, 1
-,,2 3
$num,,4 5
],,5 6
:,,7 8
null,,9 =
;,,= >
},,? @
}-- 	
public00 
TimeSpan00 
?00 
Duration00 !
{11 	
get22 
{33 
DateTime44 
?44 
min44 
=44 
Min44  #
;44# $
DateTime55 
?55 
max55 
=55 
Max55  #
;55# $
return66 
min66 
.66 
HasValue66 #
&&66$ &
max66' *
.66* +
HasValue66+ 3
?664 5
max666 9
.669 :
Value66: ?
-66@ A
min66B E
.66E F
Value66F K
:66L M
null66N R
;66R S
}77 
}88 	
public;; 
bool;; 
IsEmpty;; 
{<< 	
get== 
{== 
return== 
Count== 
==== !
$num==" #
;==# $
}==% &
}>> 	
publicAA 
boolAA 
IsMomentAA 
{BB 	
getCC 
{DD 
TimeSpanEE 
?EE 
durationEE "
=EE# $
DurationEE% -
;EE- .
returnFF 
durationFF 
.FF  
HasValueFF  (
&&FF) +
durationFF, 4
.FF4 5
ValueFF5 :
==FF; =
TimeSpanFF> F
.FFF G
ZeroFFG K
;FFK L
}GG 
}HH 	
publicKK 
boolKK 
	IsAnytimeKK 
{LL 	
getMM 
{NN 
DateTimeOO 
?OO 
minOO 
=OO 
MinOO  #
;OO# $
DateTimePP 
?PP 
maxPP 
=PP 
MaxPP  #
;PP# $
returnQQ 
minRR 
.RR 
HasValueRR  
&&RR! #
minRR$ '
.RR' (
ValueRR( -
==RR. 0
DateTimeRR1 9
.RR9 :
MinValueRR: B
&&RRC E
maxSS 
.SS 
HasValueSS  
&&SS! #
maxSS$ '
.SS' (
ValueSS( -
==SS. 0
DateTimeSS1 9
.SS9 :
MaxValueSS: B
;SSB C
}TT 
}UU 	
publicXX 
intXX 
CountXX 
{YY 	
getZZ 
{ZZ 
returnZZ 
momentsZZ  
.ZZ  !
CountZZ! &
;ZZ& '
}ZZ( )
}[[ 	
bool^^ 
ICollection^^
<^^ 
DateTime^^ !
>^^! "
.^^" #

IsReadOnly^^# -
{__ 	
get`` 
{`` 
return`` 
false`` 
;`` 
}``  !
}aa 	
publicdd 
intdd 
IndexOfdd 
(dd 
DateTimedd #
momentdd$ *
)dd* +
{ee 	
returnff 
momentsff 
.ff 
IndexOfff "
(ff" #
momentff# )
)ff) *
;ff* +
}gg 	
publicjj 
DateTimejj 
?jj 
FindPreviousjj %
(jj% &
DateTimejj& .
momentjj/ 5
)jj5 6
{kk 	
ifll 
(ll 
IsEmptyll 
)ll 
{mm 
returnnn 
nullnn 
;nn 
}oo 
forqq 
(qq 
intqq 
iqq 
=qq 
Countqq 
-qq  
$numqq! "
;qq" #
iqq$ %
>=qq& (
$numqq) *
;qq* +
iqq, -
--qq- /
)qq/ 0
{rr 
ifss 
(ss 
momentsss 
[ss 
iss 
]ss 
<ss  
momentss! '
)ss' (
{tt 
returnuu 
momentsuu "
[uu" #
iuu# $
]uu$ %
;uu% &
}vv 
}ww 
returnyy 
nullyy 
;yy 
}zz 	
public}} 
DateTime}} 
?}} 
FindNext}} !
(}}! "
DateTime}}" *
moment}}+ 1
)}}1 2
{~~ 	
if 
( 
IsEmpty 
) 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
Count
��  %
;
��% &
i
��' (
++
��( *
)
��* +
{
�� 
if
�� 
(
�� 
moments
�� 
[
�� 
i
�� 
]
�� 
>
��  
moment
��! '
)
��' (
{
�� 
return
�� 
moments
�� "
[
��" #
i
��# $
]
��$ %
;
��% &
}
�� 
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
public
�� 
IEnumerator
�� 
<
�� 
DateTime
�� #
>
��# $

��% 2
(
��2 3
)
��3 4
{
�� 	
return
�� 
moments
�� 
.
�� 

�� (
(
��( )
)
��) *
;
��* +
}
�� 	
IEnumerator
�� 
IEnumerable
�� 
.
��  

��  -
(
��- .
)
��. /
{
�� 	
return
�� 

��  
(
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
bool
�� 
Add
�� 
(
�� 
DateTime
��  
moment
��! '
)
��' (
{
�� 	
if
�� 
(
�� 
Contains
�� 
(
�� 
moment
�� 
)
��  
)
��  !
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
Count
��  %
;
��% &
i
��' (
++
��( *
)
��* +
{
�� 
if
�� 
(
�� 
moments
�� 
[
�� 
i
�� 
]
�� 
<=
�� !
moment
��" (
)
��( )
{
�� 
continue
�� 
;
�� 
}
�� 
moments
�� 
.
�� 
Insert
�� 
(
�� 
i
��  
,
��  !
moment
��" (
)
��( )
;
��) *
return
�� 
true
�� 
;
�� 
}
�� 
moments
�� 
.
�� 
Add
�� 
(
�� 
moment
�� 
)
�� 
;
��  
return
�� 
true
�� 
;
�� 
}
�� 	
void
�� 
ICollection
��
<
�� 
DateTime
�� !
>
��! "
.
��" #
Add
��# &
(
��& '
DateTime
��' /
moment
��0 6
)
��6 7
{
�� 	
Add
�� 
(
�� 
moment
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
AddAll
�� 
(
�� 
IEnumerable
�� &
<
��& '
DateTime
��' /
>
��/ 0
items
��1 6
)
��6 7
{
�� 	
if
�� 
(
�� 
items
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
foreach
�� 
(
�� 
DateTime
�� 
item
�� "
in
��# %
items
��& +
)
��+ ,
{
�� 
Add
�� 
(
�� 
item
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
IList
�� 
<
�� 
TimeSpan
�� 
>
�� 
GetDurations
�� +
(
��+ ,
int
��, /

startIndex
��0 :
,
��: ;
int
��< ?
count
��@ E
)
��E F
{
�� 	
if
�� 
(
�� 

startIndex
�� 
>=
�� 
Count
�� #
-
��$ %
$num
��& '
)
��' (
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 B
)
��B C
;
��C D
}
�� 
if
�� 
(
�� 
count
�� 
<=
�� 
$num
�� 
)
�� 
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 =
)
��= >
;
��> ?
}
�� 
int
�� 
endIndex
�� 
=
�� 

startIndex
�� %
+
��& '
count
��( -
-
��. /
$num
��0 1
;
��1 2
if
�� 
(
�� 
endIndex
�� 
>=
�� 
Count
�� !
-
��" #
$num
��$ %
)
��% &
{
�� 
endIndex
�� 
=
�� 
Count
��  
-
��! "
$num
��# $
;
��$ %
}
�� 
List
�� 
<
�� 
TimeSpan
�� 
>
�� 
	durations
�� $
=
��% &
new
��' *
List
��+ /
<
��/ 0
TimeSpan
��0 8
>
��8 9
(
��9 :
)
��: ;
;
��; <
if
�� 
(
�� 
endIndex
�� 
>=
�� 

startIndex
�� &
)
��& '
{
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 

startIndex
�� '
;
��' (
i
��) *
<=
��+ -
endIndex
��. 6
;
��6 7
i
��8 9
++
��9 ;
)
��; <
{
�� 
	durations
�� 
.
�� 
Add
�� !
(
��! "
this
��" &
[
��& '
i
��' (
+
��) *
$num
��+ ,
]
��, -
-
��. /
this
��0 4
[
��4 5
i
��5 6
]
��6 7
)
��7 8
;
��8 9
}
�� 
}
�� 
return
�� 
	durations
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
Clear
�� 
(
�� 
)
�� 
{
�� 	
moments
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
Contains
�� 
(
�� 
DateTime
�� %
moment
��& ,
)
��, -
{
�� 	
return
�� 
moments
�� 
.
�� 
Contains
�� #
(
��# $
moment
��$ *
)
��* +
;
��+ ,
}
�� 	
public
�� 
void
�� 
CopyTo
�� 
(
�� 
DateTime
�� #
[
��# $
]
��$ %
array
��& +
,
��+ ,
int
��- 0

arrayIndex
��1 ;
)
��; <
{
�� 	
moments
�� 
.
�� 
CopyTo
�� 
(
�� 
array
��  
,
��  !

arrayIndex
��" ,
)
��, -
;
��- .
}
�� 	
public
�� 
bool
�� 
Remove
�� 
(
�� 
DateTime
�� #
moment
��$ *
)
��* +
{
�� 	
return
�� 
moments
�� 
.
�� 
Remove
�� !
(
��! "
moment
��" (
)
��( )
;
��) *
}
�� 	
public
�� 
override
�� 
bool
�� 
Equals
�� #
(
��# $
object
��$ *
obj
��+ .
)
��. /
{
�� 	
return
�� 
moments
�� 
.
�� 
Equals
�� !
(
��! "
obj
��" %
)
��% &
;
��& '
}
�� 	
public
�� 
override
�� 
int
�� 
GetHashCode
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
moments
�� 
.
�� 
GetHashCode
�� &
(
��& '
)
��' (
;
��( )
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
DateTime
�� 
?
�� 
min
�� 
=
�� 
Min
�� 
;
��  
DateTime
�� 
?
�� 
max
�� 
=
�� 
Max
�� 
;
��  
TimeSpan
�� 
?
�� 
duration
�� 
=
��  
Duration
��! )
;
��) *
if
�� 
(
�� 
!
�� 
min
�� 
.
�� 
HasValue
�� 
||
��  
!
��! "
max
��" %
.
��% &
HasValue
��& .
||
��/ 1
!
��2 3
duration
��3 ;
.
��; <
HasValue
��< D
)
��D E
{
�� 
return
�� 

�� $
.
��$ %
Instance
��% -
.
��- .

��. ;
(
��; <
Count
��< A
)
��A B
;
��B C
}
�� 
return
�� 

��  
.
��  !
Instance
��! )
.
��) *!
GetCollectionPeriod
��* =
(
��= >
Count
��> C
,
��C D
min
��E H
.
��H I
Value
��I N
,
��N O
max
��P S
.
��S T
Value
��T Y
,
��Y Z
duration
��[ c
.
��c d
Value
��d i
)
��i j
;
��j k
}
�� 	
private
�� 
readonly
�� 
List
�� 
<
�� 
DateTime
�� &
>
��& '
moments
��( /
=
��0 1
new
��2 5
List
��6 :
<
��: ;
DateTime
��; C
>
��C D
(
��D E
)
��E F
;
��F G
}
�� 
}�� �2
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Day.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Day 
: 
DayTimeRange *
{ 
public 
Day 
( 
) 
: 
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 
Day 
( 
DateTime 
moment "
)" #
:$ %
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{ 	
} 	
public 
Day 
( 

calendar! )
)) *
:+ ,
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{   	
}!! 	
public$$ 
Day$$ 
($$ 
DateTime$$ 
moment$$ "
,$$" #

calendar$$2 :
)$$: ;
:$$< =
this%% 
(%% 
calendar%% 
.%% 
GetYear%% !
(%%! "
moment%%" (
)%%( )
,%%) *
calendar%%+ 3
.%%3 4
GetMonth%%4 <
(%%< =
moment%%= C
)%%C D
,%%D E
calendar%%F N
.%%N O

(%%\ ]
moment%%] c
)%%c d
,%%d e
calendar%%f n
)%%n o
{&& 	
}'' 	
public** 
Day** 
(** 
int** 
year** 
,** 
int**  
month**! &
)**& '
:**( )
this++ 
(++ 
year++ 
,++ 
month++ 
,++ 
new++ !
TimeCalendar++" .
(++. /
)++/ 0
)++0 1
{,, 	
}-- 	
public00 
Day00 
(00 
int00 
year00 
,00 
int00  
month00! &
,00& '

calendar006 >
)00> ?
:00@ A
this11 
(11 
year11 
,11 
month11 
,11 
$num11 
,11  
calendar11! )
)11) *
{22 	
}33 	
public66 
Day66 
(66 
int66 
year66 
,66 
int66  
month66! &
,66& '
int66( +
day66, /
)66/ 0
:661 2
this77 
(77 
year77 
,77 
month77 
,77 
day77 !
,77! "
new77# &
TimeCalendar77' 3
(773 4
)774 5
)775 6
{88 	
}99 	
public<< 
Day<< 
(<< 
int<< 
year<< 
,<< 
int<<  
month<<! &
,<<& '
int<<( +
day<<, /
,<</ 0

calendar<<? G
)<<G H
:<<I J
base== 
(== 
year== 
,== 
month== 
,== 
day== !
,==! "
$num==# $
,==$ %
calendar==& .
)==. /
{>> 	
}?? 	
publicBB 
intBB 
YearBB 
{CC 	
getDD 
{DD 
returnDD 
	StartYearDD "
;DD" #
}DD$ %
}EE 	
publicHH 
intHH 
MonthHH 
{II 	
getJJ 
{JJ 
returnJJ 

StartMonthJJ #
;JJ# $
}JJ% &
}KK 	
publicNN 
intNN 
DayValueNN 
{OO 	
getPP 
{PP 
returnPP 
StartDayPP !
;PP! "
}PP# $
}QQ 	
publicTT 
	DayOfWeekTT 
	DayOfWeekTT "
{UU 	
getVV 
{VV 
returnVV 
StartDayOfWeekVV '
;VV' (
}VV) *
}WW 	
publicZZ 
stringZZ 
DayNameZZ 
{[[ 	
get\\ 
{\\ 
return\\ 
StartDayName\\ %
;\\% &
}\\' (
}]] 	
public`` 
Day`` 
GetPreviousDay`` !
(``! "
)``" #
{aa 	
returnbb 
AddDaysbb 
(bb 
-bb 
$numbb 
)bb 
;bb 
}cc 	
publicff 
Dayff 

GetNextDayff 
(ff 
)ff 
{gg 	
returnhh 
AddDayshh 
(hh 
$numhh 
)hh 
;hh 
}ii 	
publicll 
Dayll 
AddDaysll 
(ll 
intll 
daysll #
)ll# $
{mm 	
DateTimenn 
startDaynn 
=nn 
newnn  #
DateTimenn$ ,
(nn, -
	StartYearnn- 6
,nn6 7

StartMonthnn8 B
,nnB C
StartDaynnD L
)nnL M
;nnM N
returnoo 
newoo 
Dayoo 
(oo 
startDayoo #
.oo# $
AddDaysoo$ +
(oo+ ,
daysoo, 0
)oo0 1
,oo1 2
Calendaroo3 ;
)oo; <
;oo< =
}pp 	
	protectedss 
overridess 
stringss !
Formatss" (
(ss( )
ITimeFormatterss) 7
	formatterss8 A
)ssA B
{tt 	
returnuu 
	formatteruu 
.uu 
GetCalendarPerioduu .
(uu. /
DayNameuu/ 6
,uu6 7
	formattervv 
.vv 
GetShortDatevv &
(vv& '
Startvv' ,
)vv, -
,vv- .
	formattervv/ 8
.vv8 9
GetShortDatevv9 E
(vvE F
EndvvF I
)vvI J
,vvJ K
DurationvvL T
)vvT U
;vvU V
}ww 	
}yy 
}{{ �
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DayHourRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
DayHourRange 
: 
	HourRange  )
{ 
public 
DayHourRange 
( 
	DayOfWeek %
day& )
,) *
int+ .
hour/ 3
)3 4
:5 6
base 
( 
hour 
, 
hour 
) 
{ 	
this 
. 
day 
= 
day 
; 
} 	
public 
DayHourRange 
( 
	DayOfWeek %
day& )
,) *
int+ .
	startHour/ 8
,8 9
int: =
endHour> E
)E F
:G H
base 
( 
new 
Time 
( 
	startHour #
)# $
,$ %
new& )
Time* .
(. /
endHour/ 6
)6 7
)7 8
{ 	
this 
. 
day 
= 
day 
; 
} 	
public   
DayHourRange   
(   
	DayOfWeek   %
day  & )
,  ) *
Time  + /
start  0 5
,  5 6
Time  7 ;
end  < ?
)  ? @
:  A B
base!! 
(!! 
start!! 
,!! 
end!! 
)!! 
{"" 	
this## 
.## 
day## 
=## 
day## 
;## 
}$$ 	
public'' 
	DayOfWeek'' 
Day'' 
{(( 	
get)) 
{)) 
return)) 
day)) 
;)) 
})) 
}** 	
public-- 
override-- 
string-- 
ToString-- '
(--' (
)--( )
{.. 	
return// 
Day// 
+// 
$str// 
+// 
base//  $
.//$ %
ToString//% -
(//- .
)//. /
;/// 0
}00 	
private44 
readonly44 
	DayOfWeek44 "
day44# &
;44& '
}66 
}88 �
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DayRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

struct 
DayRange 
{ 
public 
DayRange 
( 
int 
day 
)  
:! "
this 
( 
day 
, 
day 
) 
{ 	
} 	
public 
DayRange 
( 
int 
min 
,  
int! $
max% (
)( )
{ 	
if 
( 
min 
< 
$num 
|| 
min 
>  
TimeSpec! )
.) *
MaxDaysPerMonth* 9
)9 :
{ 
throw 
new '
ArgumentOutOfRangeException 5
(5 6
$str6 ;
); <
;< =
} 
if 
( 
max 
< 
min 
|| 
max  
>! "
TimeSpec# +
.+ ,
MaxDaysPerMonth, ;
); <
{ 
throw   
new   '
ArgumentOutOfRangeException   5
(  5 6
$str  6 ;
)  ; <
;  < =
}!! 
this"" 
."" 
min"" 
="" 
min"" 
;"" 
this## 
.## 
max## 
=## 
max## 
;## 
}$$ 	
public'' 
int'' 
Min'' 
{(( 	
get)) 
{)) 
return)) 
min)) 
;)) 
})) 
}** 	
public-- 
int-- 
Max-- 
{.. 	
get// 
{// 
return// 
max// 
;// 
}// 
}00 	
public33 
bool33 
IsSingleDay33 
{44 	
get55 
{55 
return55 
min55 
==55 
max55  #
;55# $
}55% &
}66 	
public99 
bool99 
	HasInside99 
(99 
int99 !
test99" &
)99& '
{:: 	
return;; 
test;; 
>=;; 
min;; 
&&;; !
test;;" &
<=;;' )
max;;* -
;;;- .
}<< 	
private@@ 
readonly@@ 
int@@ 
min@@  
;@@  !
privateAA 
readonlyAA 
intAA 
maxAA  
;AA  !
}CC 
}EE �#
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Days.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Days 
: 
DayTimeRange +
{ 
public 
Days 
( 
DateTime 
moment #
,# $
int% (
count) .
). /
:0 1
this 
( 
moment 
, 
count 
, 
new  #
TimeCalendar$ 0
(0 1
)1 2
)2 3
{ 	
} 	
public 
Days 
( 
DateTime 
moment #
,# $
int% (
count) .
,. /

calendar> F
)F G
:H I
this 
( 
calendar 
. 
GetYear !
(! "
moment" (
)( )
,) *
calendar+ 3
.3 4
GetMonth4 <
(< =
moment= C
)C D
,D E
calendarF N
.N O

(\ ]
moment] c
)c d
,d e
countf k
,k l
calendarm u
)u v
{ 	
} 	
public 
Days 
( 
int 
	startYear !
,! "
int# &

startMonth' 1
,1 2
int3 6
startDay7 ?
,? @
intA D
dayCountE M
)M N
:O P
this 
( 
	startYear 
, 

startMonth &
,& '
startDay( 0
,0 1
dayCount2 :
,: ;
new< ?
TimeCalendar@ L
(L M
)M N
)N O
{   	
}!! 	
public$$ 
Days$$ 
($$ 
int$$ 
	startYear$$ !
,$$! "
int$$# &

startMonth$$' 1
,$$1 2
int$$3 6
startDay$$7 ?
,$$? @
int$$A D
dayCount$$E M
,$$M N

calendar$$] e
)$$e f
:$$g h
base%% 
(%% 
	startYear%% 
,%% 

startMonth%% &
,%%& '
startDay%%( 0
,%%0 1
dayCount%%2 :
,%%: ;
calendar%%< D
)%%D E
{&& 	
}'' 	
public** !
ITimePeriodCollection** $
GetDays**% ,
(**, -
)**- .
{++ 	 
TimePeriodCollection,,  
days,,! %
=,,& '
new,,( + 
TimePeriodCollection,,, @
(,,@ A
),,A B
;,,B C
DateTime-- 
startDay-- 
=-- 
new--  #
DateTime--$ ,
(--, -
	StartYear--- 6
,--6 7

StartMonth--8 B
,--B C
StartDay--D L
)--L M
;--M N
for.. 
(.. 
int.. 
i.. 
=.. 
$num.. 
;.. 
i.. 
<.. 
DayCount..  (
;..( )
i..* +
++..+ -
)..- .
{// 
days00 
.00 
Add00 
(00 
new00 
Day00  
(00  !
startDay00! )
.00) *
AddDays00* 1
(001 2
i002 3
)003 4
,004 5
Calendar006 >
)00> ?
)00? @
;00@ A
}11 
return22 
days22 
;22 
}33 	
	protected66 
override66 
string66 !
Format66" (
(66( )
ITimeFormatter66) 7
	formatter668 A
)66A B
{77 	
return88 
	formatter88 
.88 
GetCalendarPeriod88 .
(88. /
StartDayName88/ ;
,88; <

EndDayName88= G
,88G H
	formatter99 
.99 
GetShortDate99 &
(99& '
Start99' ,
)99, -
,99- .
	formatter99/ 8
.998 9
GetShortDate999 E
(99E F
End99F I
)99I J
,99J K
Duration99L T
)99T U
;99U V
}:: 	
}<< 
}>> �2
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DaySeeker.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
	DaySeeker 
: 
CalendarVisitor ,
<, -!
CalendarVisitorFilter- B
,B C
DaySeekerContextD T
>T U
{ 
public 
	DaySeeker 
( 


=5 6

.D E
ForwardE L
,L M

calendar\ d
=e f
nullg k
)k l
:m n
this 
( 
new !
CalendarVisitorFilter *
(* +
)+ ,
,, -

,; <
calendar= E
)E F
{ 	
} 	
public 
	DaySeeker 
( !
CalendarVisitorFilter .
filter/ 5
,5 6


=S T

.b c
Forwardc j
,j k

calendar "
=# $
null% )
)) *
:+ ,
base 
( 
filter 
, 
	TimeRange "
." #
Anytime# *
,* +

,9 :
calendar; C
)C D
{ 	
} 	
public !
ITimePeriodCollection $
Periods% ,
{   	
get!! 
{!! 
return!! 
periods!!  
;!!  !
}!!" #
}"" 	
public%% 
Day%% 
FindDay%% 
(%% 
Day%% 
start%% $
,%%$ %
int%%& )
offset%%* 0
)%%0 1
{&& 	
if'' 
('' 
offset'' 
=='' 
$num'' 
)'' 
{(( 
return)) 
start)) 
;)) 
}** 
DaySeekerContext,, 
context,, $
=,,% &
new,,' *
DaySeekerContext,,+ ;
(,,; <
start,,< A
,,,A B
offset,,C I
),,I J
;,,J K

visitDirection.. (
=..) *

;..8 9
if11 
(11 
offset11 
<11 
$num11 
)11 
{22 
visitDirection33 
=33  
visitDirection33! /
==330 2

.33@ A
Forward33A H
?33I J

.44! "
Backward44" *
:44+ ,

.55! "
Forward55" )
;55) *
}66 

(88 
start88 
,88  
context88! (
,88( )
visitDirection88* 8
)888 9
;889 :
return99 
context99 
.99 
FoundDay99 #
;99# $
}:: 	
	protected== 
override== 
bool== 

EnterYears==  *
(==* +
Years==+ 0
years==1 6
,==6 7
DaySeekerContext==8 H
context==I P
)==P Q
{>> 	
return?? 
!?? 
context?? 
.?? 

IsFinished?? &
;??& '
}@@ 	
	protectedCC 
overrideCC 
boolCC 
EnterMonthsCC  +
(CC+ ,
YearCC, 0
yearCC1 5
,CC5 6
DaySeekerContextCC7 G
contextCCH O
)CCO P
{DD 	
returnEE 
!EE 
contextEE 
.EE 

IsFinishedEE &
;EE& '
}FF 	
	protectedII 
overrideII 
boolII 
	EnterDaysII  )
(II) *
MonthII* /
monthII0 5
,II5 6
DaySeekerContextII7 G
contextIIH O
)IIO P
{JJ 	
returnKK 
!KK 
contextKK 
.KK 

IsFinishedKK &
;KK& '
}LL 	
	protectedOO 
overrideOO 
boolOO 

EnterHoursOO  *
(OO* +
DayOO+ .
dayOO/ 2
,OO2 3
DaySeekerContextOO4 D
contextOOE L
)OOL M
{PP 	
returnQQ 
!QQ 
contextQQ 
.QQ 

IsFinishedQQ &
;QQ& '
}RR 	
	protectedUU 
overrideUU 
boolUU 

OnVisitDayUU  *
(UU* +
DayUU+ .
dayUU/ 2
,UU2 3
DaySeekerContextUU4 D
contextUUE L
)UUL M
{VV 	
ifWW 
(WW 
contextWW 
.WW 

IsFinishedWW "
)WW" #
{XX 
returnYY 
falseYY 
;YY 
}ZZ 
if\\ 
(\\ 
day\\ 
.\\ 
IsSamePeriod\\  
(\\  !
context\\! (
.\\( )
StartDay\\) 1
)\\1 2
)\\2 3
{]] 
return^^ 
true^^ 
;^^ 
}__ 
ifaa 
(aa 

(aa 
dayaa !
,aa! "
contextaa# *
)aa* +
==aa, .
falseaa/ 4
)aa4 5
{bb 
returncc 
truecc 
;cc 
}dd 
ifee 
(ee 
CheckLimitsee 
(ee 
dayee 
)ee  
==ee! #
falseee$ )
)ee) *
{ff 
returngg 
truegg 
;gg 
}hh 
contextjj 
.jj 

ProcessDayjj 
(jj 
dayjj "
)jj" #
;jj# $
returnll 
!ll 
contextll 
.ll 

IsFinishedll &
;ll& '
}mm 	
privateqq 
readonlyqq !
ITimePeriodCollectionqq .
periodsqq/ 6
=qq7 8
newqq9 < 
TimePeriodCollectionqq= Q
(qqQ R
)qqR S
;qqS T
}ss 
}uu �
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DaySeekerContext.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
DaySeekerContext !
:" ##
ICalendarVisitorContext$ ;
{ 
public 
DaySeekerContext 
(  
Day  #
startDay$ ,
,, -
int. 1
dayCount2 :
): ;
{ 	
if 
( 
startDay 
== 
null  
)  !
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 :
): ;
;; <
} 
StartDay 
= 
startDay 
;  
DayCount 
= 
Math 
. 
Abs 
(  
dayCount  (
)( )
;) *
RemaingDays 
= 
DayCount "
;" #
} 	
public 
int 
DayCount 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public!! 
int!! 
RemaingDays!! 
{!!  
get!!! $
;!!$ %
private!!& -
set!!. 1
;!!1 2
}!!3 4
public$$ 
Day$$ 
StartDay$$ 
{$$ 
get$$ !
;$$! "
private$$# *
set$$+ .
;$$. /
}$$0 1
public'' 
Day'' 
FoundDay'' 
{'' 
get'' !
;''! "
private''# *
set''+ .
;''. /
}''0 1
public** 
bool** 

IsFinished** 
{++ 	
get,, 
{,, 
return,, 
RemaingDays,, $
==,,% '
$num,,( )
;,,) *
},,+ ,
}-- 	
public00 
void00 

ProcessDay00 
(00 
Day00 "
day00# &
)00& '
{11 	
if22 
(22 

IsFinished22 
)22 
{33 
return44 
;44 
}55 
RemaingDays77 
-=77 
$num77 
;77 
if88 
(88 

IsFinished88 
)88 
{99 
FoundDay:: 
=:: 
day:: 
;:: 
};; 
}<< 	
}>> 
}@@ �K
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DayTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 
DayTimeRange &
:' (
CalendarTimeRange) :
{ 
	protected 
DayTimeRange 
( 
int "
	startYear# ,
,, -
int. 1

startMonth2 <
,< =
int> A
startDayB J
,J K
intL O
dayCountP X
)X Y
:Z [
this 
( 
	startYear 
, 

startMonth &
,& '
startDay( 0
,0 1
dayCount2 :
,: ;
new< ?
TimeCalendar@ L
(L M
)M N
)N O
{ 	
} 	
	protected 
DayTimeRange 
( 
int "
	startYear# ,
,, -
int. 1

startMonth2 <
,< =
int> A
startDayB J
,J K
intL O
dayCountP X
,X Y

calendarh p
)p q
:r s
base 
( 
GetPeriodOf 
( 
	startYear &
,& '

startMonth( 2
,2 3
startDay4 <
,< =
dayCount> F
)F G
,G H
calendarI Q
)Q R
{ 	
this 
. 
startDay 
= 
new 
DateTime  (
(( )
	startYear) 2
,2 3

startMonth4 >
,> ?
startDay@ H
)H I
;I J
this 
. 
dayCount 
= 
dayCount $
;$ %
endDay 
= 
calendar 
. 
MapEnd $
($ %
this% )
.) *
startDay* 2
.2 3
AddDays3 :
(: ;
dayCount; C
)C D
)D E
;E F
} 	
public!! 
int!! 
	StartYear!! 
{"" 	
get## 
{## 
return## 
startDay## !
.##! "
Year##" &
;##& '
}##( )
}$$ 	
public'' 
int'' 

StartMonth'' 
{(( 	
get)) 
{)) 
return)) 
startDay)) !
.))! "
Month))" '
;))' (
}))) *
}** 	
public-- 
int-- 
StartDay-- 
{.. 	
get// 
{// 
return// 
startDay// !
.//! "
Day//" %
;//% &
}//' (
}00 	
public33 
int33 
EndYear33 
{44 	
get55 
{55 
return55 
endDay55 
.55  
Year55  $
;55$ %
}55& '
}66 	
public99 
int99 
EndMonth99 
{:: 	
get;; 
{;; 
return;; 
endDay;; 
.;;  
Month;;  %
;;;% &
};;' (
}<< 	
public?? 
int?? 
EndDay?? 
{@@ 	
getAA 
{AA 
returnAA 
endDayAA 
.AA  
DayAA  #
;AA# $
}AA% &
}BB 	
publicEE 
intEE 
DayCountEE 
{FF 	
getGG 
{GG 
returnGG 
dayCountGG !
;GG! "
}GG# $
}HH 	
publicKK 
	DayOfWeekKK 
StartDayOfWeekKK '
{LL 	
getMM 
{MM 
returnMM 
CalendarMM !
.MM! "
GetDayOfWeekMM" .
(MM. /
startDayMM/ 7
)MM7 8
;MM8 9
}MM: ;
}NN 	
publicQQ 
stringQQ 
StartDayNameQQ "
{RR 	
getSS 
{SS 
returnSS 
CalendarSS !
.SS! "

GetDayNameSS" ,
(SS, -
StartDayOfWeekSS- ;
)SS; <
;SS< =
}SS> ?
}TT 	
publicWW 
	DayOfWeekWW 
EndDayOfWeekWW %
{XX 	
getYY 
{YY 
returnYY 
CalendarYY !
.YY! "
GetDayOfWeekYY" .
(YY. /
endDayYY/ 5
)YY5 6
;YY6 7
}YY8 9
}ZZ 	
public]] 
string]] 

EndDayName]]  
{^^ 	
get__ 
{__ 
return__ 
Calendar__ !
.__! "

GetDayName__" ,
(__, -
EndDayOfWeek__- 9
)__9 :
;__: ;
}__< =
}`` 	
publiccc !
ITimePeriodCollectioncc $
GetHourscc% -
(cc- .
)cc. /
{dd 	 
TimePeriodCollectionee  
hoursee! &
=ee' (
newee) , 
TimePeriodCollectionee- A
(eeA B
)eeB C
;eeC D
DateTimeff 
	startDateff 
=ff  
startDayff! )
;ff) *
forgg 
(gg 
intgg 
daygg 
=gg 
$numgg 
;gg 
daygg !
<gg" #
dayCountgg$ ,
;gg, -
daygg. 1
++gg1 3
)gg3 4
{hh 
DateTimeii 
curDayii 
=ii  !
	startDateii" +
.ii+ ,
AddDaysii, 3
(ii3 4
dayii4 7
)ii7 8
;ii8 9
forjj 
(jj 
intjj 
hourjj 
=jj 
$numjj  !
;jj! "
hourjj# '
<jj( )
TimeSpecjj* 2
.jj2 3
HoursPerDayjj3 >
;jj> ?
hourjj@ D
++jjD F
)jjF G
{kk 
hoursll 
.ll 
Addll 
(ll 
newll !
Hourll" &
(ll& '
curDayll' -
.ll- .
AddHoursll. 6
(ll6 7
hourll7 ;
)ll; <
,ll< =
Calendarll> F
)llF G
)llG H
;llH I
}mm 
}nn 
returnoo 
hoursoo 
;oo 
}pp 	
	protectedss 
overridess 
boolss 
IsEqualss  '
(ss' (
objectss( .
objss/ 2
)ss2 3
{tt 	
returnuu 
baseuu 
.uu 
IsEqualuu 
(uu  
objuu  #
)uu# $
&&uu% '
HasSameDatauu( 3
(uu3 4
objuu4 7
asuu8 :
DayTimeRangeuu; G
)uuG H
;uuH I
}vv 	
privateyy 
boolyy 
HasSameDatayy  
(yy  !
DayTimeRangeyy! -
compyy. 2
)yy2 3
{zz 	
return{{ 
startDay|| 
==|| 
comp||  
.||  !
startDay||! )
&&||* ,
dayCount}} 
==}} 
comp}}  
.}}  !
dayCount}}! )
&&}}* ,
endDay~~ 
==~~ 
comp~~ 
.~~ 
endDay~~ %
;~~% &
} 	
	protected
�� 
override
�� 
int
�� 
ComputeHashCode
�� .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
base
��, 0
.
��0 1
ComputeHashCode
��1 @
(
��@ A
)
��A B
,
��B C
startDay
��D L
,
��L M
dayCount
��N V
,
��V W
endDay
��X ^
)
��^ _
;
��_ `
}
�� 	
private
�� 
static
�� 
	TimeRange
��  
GetPeriodOf
��! ,
(
��, -
int
��- 0
year
��1 5
,
��5 6
int
��7 :
month
��; @
,
��@ A
int
��B E
day
��F I
,
��I J
int
��K N
dayCount
��O W
)
��W X
{
�� 	
if
�� 
(
�� 
dayCount
�� 
<
�� 
$num
�� 
)
�� 
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 @
)
��@ A
;
��A B
}
�� 
DateTime
�� 
start
�� 
=
�� 
new
��  
DateTime
��! )
(
��) *
year
��* .
,
��. /
month
��0 5
,
��5 6
day
��7 :
)
��: ;
;
��; <
DateTime
�� 
end
�� 
=
�� 
start
��  
.
��  !
AddDays
��! (
(
��( )
dayCount
��) 1
)
��1 2
;
��2 3
return
�� 
new
�� 
	TimeRange
��  
(
��  !
start
��! &
,
��& '
end
��( +
)
��+ ,
;
��, -
}
�� 	
private
�� 
readonly
�� 
DateTime
�� !
startDay
��" *
;
��* +
private
�� 
readonly
�� 
int
�� 
dayCount
�� %
;
��% &
private
�� 
readonly
�� 
DateTime
�� !
endDay
��" (
;
��( )
}
�� 
}�� �X
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Duration.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

static 
class 
Duration  
{ 
public 
static 
TimeSpan 
Year #
(# $
int$ '
year( ,
), -
{ 	
return 
DateTimeFormatInfo %
.% &
CurrentInfo& 1
==2 4
null5 9
?: ;
TimeSpan< D
.D E
ZeroE I
:J K
YearL P
(P Q
DateTimeFormatInfoQ c
.c d
CurrentInfod o
.o p
Calendarp x
,x y
yearz ~
)~ 
;	 �
} 	
public 
static 
TimeSpan 
Year #
(# $
Calendar$ ,
calendar- 5
,5 6
int7 :
year; ?
)? @
{ 	
return 
Days 
( 
calendar  
.  !

(. /
year/ 3
)3 4
)4 5
;5 6
} 	
public%% 
static%% 
TimeSpan%% 
Halfyear%% '
(%%' (
int%%( +
year%%, 0
,%%0 1
YearHalfyear%%2 >
yearHalfyear%%? K
)%%K L
{&& 	
return'' 
DateTimeFormatInfo'' %
.''% &
CurrentInfo''& 1
==''2 4
null''5 9
?'': ;
TimeSpan''< D
.''D E
Zero''E I
:''J K
Halfyear''L T
(''T U
DateTimeFormatInfo''U g
.''g h
CurrentInfo''h s
.''s t
Calendar''t |
,''| }
year	''~ �
,
''� �
yearHalfyear
''� �
)
''� �
;
''� �
}(( 	
public++ 
static++ 
TimeSpan++ 
Halfyear++ '
(++' (
Calendar++( 0
calendar++1 9
,++9 :
int++; >
year++? C
,++C D
YearHalfyear++E Q
yearHalfyear++R ^
)++^ _
{,, 	
	YearMonth-- 
[-- 
]-- 
halfyearMonths-- &
=--' (
TimeTool--) 1
.--1 2
GetMonthsOfHalfyear--2 E
(--E F
yearHalfyear--F R
)--R S
;--S T
TimeSpan.. 
duration.. 
=.. 
TimeSpec..  (
...( )

NoDuration..) 3
;..3 4
foreach// 
(// 
	YearMonth// 

in//- /
halfyearMonths//0 >
)//> ?
{00 
duration11 
=11 
duration11 #
.11# $
Add11$ '
(11' (
Month11( -
(11- .
calendar11. 6
,116 7
year118 <
,11< =

)11K L
)11L M
;11M N
}22 
return33 
duration33 
;33 
}44 	
public;; 
static;; 
TimeSpan;; 
Quarter;; &
(;;& '
int;;' *
year;;+ /
,;;/ 0
YearQuarter;;1 <
yearQuarter;;= H
);;H I
{<< 	
return== 
DateTimeFormatInfo== %
.==% &
CurrentInfo==& 1
====2 4
null==5 9
?==: ;
TimeSpan==< D
.==D E
Zero==E I
:==J K
Quarter==L S
(==S T
DateTimeFormatInfo==T f
.==f g
CurrentInfo==g r
.==r s
Calendar==s {
,=={ |
year	==} �
,
==� �
yearQuarter
==� �
)
==� �
;
==� �
}>> 	
publicAA 
staticAA 
TimeSpanAA 
QuarterAA &
(AA& '
CalendarAA' /
calendarAA0 8
,AA8 9
intAA: =
yearAA> B
,AAB C
YearQuarterAAD O
yearQuarterAAP [
)AA[ \
{BB 	
	YearMonthCC 
[CC 
]CC 

=CC& '
TimeToolCC( 0
.CC0 1
GetMonthsOfQuarterCC1 C
(CCC D
yearQuarterCCD O
)CCO P
;CCP Q
TimeSpanDD 
durationDD 
=DD 
TimeSpecDD  (
.DD( )

NoDurationDD) 3
;DD3 4
foreachEE 
(EE 
	YearMonthEE 
quarterMonthEE +
inEE, .

)EE< =
{FF 
durationGG 
=GG 
durationGG #
.GG# $
AddGG$ '
(GG' (
MonthGG( -
(GG- .
calendarGG. 6
,GG6 7
yearGG8 <
,GG< =
quarterMonthGG> J
)GGJ K
)GGK L
;GGL M
}HH 
returnII 
durationII 
;II 
}JJ 	
publicQQ 
staticQQ 
TimeSpanQQ 
MonthQQ $
(QQ$ %
intQQ% (
yearQQ) -
,QQ- .
	YearMonthQQ/ 8
	yearMonthQQ9 B
)QQB C
{RR 	
returnSS 
DateTimeFormatInfoSS %
.SS% &
CurrentInfoSS& 1
==SS2 4
nullSS5 9
?SS: ;
TimeSpanSS< D
.SSD E
ZeroSSE I
:SSJ K
MonthSSL Q
(SSQ R
DateTimeFormatInfoSSR d
.SSd e
CurrentInfoSSe p
.SSp q
CalendarSSq y
,SSy z
yearSS{ 
,	SS �
	yearMonth
SS� �
)
SS� �
;
SS� �
}TT 	
publicWW 
staticWW 
TimeSpanWW 
MonthWW $
(WW$ %
CalendarWW% -
calendarWW. 6
,WW6 7
intWW8 ;
yearWW< @
,WW@ A
	YearMonthWWB K
	yearMonthWWL U
)WWU V
{XX 	
returnYY 
DaysYY 
(YY 
calendarYY  
.YY  !
GetDaysInMonthYY! /
(YY/ 0
yearYY0 4
,YY4 5
(YY6 7
intYY7 :
)YY: ;
	yearMonthYY; D
)YYD E
)YYE F
;YYF G
}ZZ 	
publicaa 
staticaa 
TimeSpanaa 
Weekaa #
=aa$ %
Weeksaa& +
(aa+ ,
$numaa, -
)aa- .
;aa. /
publicdd 
staticdd 
TimeSpandd 
Weeksdd $
(dd$ %
intdd% (
weeksdd) .
)dd. /
{ee 	
returnff 
Daysff 
(ff 
weeksff 
*ff 
TimeSpecff  (
.ff( )
DaysPerWeekff) 4
)ff4 5
;ff5 6
}gg 	
publicnn 
staticnn 
TimeSpannn 
Daynn "
=nn# $
Daysnn% )
(nn) *
$numnn* +
)nn+ ,
;nn, -
publicqq 
staticqq 
TimeSpanqq 
Daysqq #
(qq# $
intqq$ '
daysqq( ,
,qq, -
intqq. 1
hoursqq2 7
=qq8 9
$numqq: ;
,qq; <
intqq= @
minutesqqA H
=qqI J
$numqqK L
,qqL M
intqqN Q
secondsqqR Y
=qqZ [
$numqq\ ]
,qq] ^
intqq_ b
millisecondsqqc o
=qqp q
$numqqr s
)qqs t
{rr 	
returnss 
newss 
TimeSpanss 
(ss  
daysss  $
,ss$ %
hoursss& +
,ss+ ,
minutesss- 4
,ss4 5
secondsss6 =
,ss= >
millisecondsss? K
)ssK L
;ssL M
}tt 	
public{{ 
static{{ 
TimeSpan{{ 
Hour{{ #
={{$ %
Hours{{& +
({{+ ,
$num{{, -
){{- .
;{{. /
public~~ 
static~~ 
TimeSpan~~ 
Hours~~ $
(~~$ %
int~~% (
hours~~) .
,~~. /
int~~0 3
minutes~~4 ;
=~~< =
$num~~> ?
,~~? @
int~~A D
seconds~~E L
=~~M N
$num~~O P
,~~P Q
int~~R U
milliseconds~~V b
=~~c d
$num~~e f
)~~f g
{ 	
return
�� 
new
�� 
TimeSpan
�� 
(
��  
$num
��  !
,
��! "
hours
��# (
,
��( )
minutes
��* 1
,
��1 2
seconds
��3 :
,
��: ;
milliseconds
��< H
)
��H I
;
��I J
}
�� 	
public
�� 
static
�� 
TimeSpan
�� 
Minute
�� %
=
��& '
Minutes
��( /
(
��/ 0
$num
��0 1
)
��1 2
;
��2 3
public
�� 
static
�� 
TimeSpan
�� 
Minutes
�� &
(
��& '
int
��' *
minutes
��+ 2
,
��2 3
int
��4 7
seconds
��8 ?
=
��@ A
$num
��B C
,
��C D
int
��E H
milliseconds
��I U
=
��V W
$num
��X Y
)
��Y Z
{
�� 	
return
�� 
new
�� 
TimeSpan
�� 
(
��  
$num
��  !
,
��! "
$num
��# $
,
��$ %
minutes
��& -
,
��- .
seconds
��/ 6
,
��6 7
milliseconds
��8 D
)
��D E
;
��E F
}
�� 	
public
�� 
static
�� 
TimeSpan
�� 
Second
�� %
=
��& '
Seconds
��( /
(
��/ 0
$num
��0 1
)
��1 2
;
��2 3
public
�� 
static
�� 
TimeSpan
�� 
Seconds
�� &
(
��& '
int
��' *
seconds
��+ 2
,
��2 3
int
��4 7
milliseconds
��8 D
=
��E F
$num
��G H
)
��H I
{
�� 	
return
�� 
new
�� 
TimeSpan
�� 
(
��  
$num
��  !
,
��! "
$num
��# $
,
��$ %
$num
��& '
,
��' (
seconds
��) 0
,
��0 1
milliseconds
��2 >
)
��> ?
;
��? @
}
�� 	
public
�� 
static
�� 
TimeSpan
�� 
Millisecond
�� *
=
��+ ,
Milliseconds
��- 9
(
��9 :
$num
��: ;
)
��; <
;
��< =
public
�� 
static
�� 
TimeSpan
�� 
Milliseconds
�� +
(
��+ ,
int
��, /
milliseconds
��0 <
)
��< =
{
�� 	
return
�� 
new
�� 
TimeSpan
�� 
(
��  
$num
��  !
,
��! "
$num
��# $
,
��$ %
$num
��& '
,
��' (
$num
��) *
,
��* +
milliseconds
��, 8
)
��8 9
;
��9 :
}
�� 	
}
�� 
}�� �l
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DurationCalculator.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
DurationCalculator #
{ 
public 
DurationCalculator !
(! "
)" #
:$ %
this 
( 
new 
DurationProvider %
(% &
)& '
)' (
{ 	
} 	
public 
DurationCalculator !
(! "
IDurationProvider" 3
durationProvider4 D
)D E
{ 	
if 
( 
durationProvider  
==! #
null$ (
)( )
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 B
)B C
;C D
} 
this 
. 
durationProvider !
=" #
durationProvider$ 4
;4 5
}   	
public## 
IDurationProvider##  
DurationProvider##! 1
{$$ 	
get%% 
{%% 
return%% 
durationProvider%% )
;%%) *
}%%+ ,
}&& 	
public)) !
ITimePeriodCollection)) $
IncludePeriods))% 3
{** 	
get++ 
{++ 
return++ 
includePeriods++ '
;++' (
}++) *
},, 	
public// !
ITimePeriodCollection// $
ExcludePeriods//% 3
{00 	
get11 
{11 
return11 
excludePeriods11 '
;11' (
}11) *
}22 	
public55 
void55 
Hours55 
(55 
Time55 
start55 $
,55$ %
Time55& *
end55+ .
)55. /
{66 	
Hours77 
(77 
new77 
	HourRange77 
(77  
start77  %
,77% &
end77' *
)77* +
)77+ ,
;77, -
}88 	
public;; 
void;; 
Hours;; 
(;; 
params;;  
	HourRange;;! *
[;;* +
];;+ ,
hours;;- 2
);;2 3
{<< 	
filter== 
.== 
CollectingHours== "
.==" #
Clear==# (
(==( )
)==) *
;==* +
foreach>> 
(>> 
	HourRange>> 
hour>> #
in>>$ &
hours>>' ,
)>>, -
{?? 
filter@@ 
.@@ 
CollectingHours@@ &
.@@& '
Add@@' *
(@@* +
hour@@+ /
)@@/ 0
;@@0 1
}AA 
}BB 	
publicEE 
voidEE 
DayHoursEE 
(EE 
	DayOfWeekEE &
	dayOfWeekEE' 0
,EE0 1
TimeEE2 6
startEE7 <
,EE< =
TimeEE> B
endEEC F
)EEF G
{FF 	
DayHoursGG 
(GG 
newGG 
DayHourRangeGG %
(GG% &
	dayOfWeekGG& /
,GG/ 0
startGG1 6
,GG6 7
endGG8 ;
)GG; <
)GG< =
;GG= >
}HH 	
publicKK 
voidKK 
DayHoursKK 
(KK 
paramsKK #
DayHourRangeKK$ 0
[KK0 1
]KK1 2
dayHoursKK3 ;
)KK; <
{LL 	
filterMM 
.MM 
CollectingDayHoursMM %
.MM% &
ClearMM& +
(MM+ ,
)MM, -
;MM- .
foreachNN 
(NN 
DayHourRangeNN !
dayHourNN" )
inNN* ,
dayHoursNN- 5
)NN5 6
{OO 
filterPP 
.PP 
CollectingDayHoursPP )
.PP) *
AddPP* -
(PP- .
dayHourPP. 5
)PP5 6
;PP6 7
}QQ 
}RR 	
publicUU 
voidUU 
WeekDaysUU 
(UU 
paramsUU #
	DayOfWeekUU$ -
[UU- .
]UU. /
weekDaysUU0 8
)UU8 9
{VV 	
filterWW 
.WW 
WeekDaysWW 
.WW 
ClearWW !
(WW! "
)WW" #
;WW# $
foreachXX 
(XX 
	DayOfWeekXX 
weekDayXX &
inXX' )
weekDaysXX* 2
)XX2 3
{YY 
filterZZ 
.ZZ 
WeekDaysZZ 
.ZZ  
AddZZ  #
(ZZ# $
weekDayZZ$ +
)ZZ+ ,
;ZZ, -
}[[ 
}\\ 	
public__ 
void__ 
WorkingWeekDays__ #
(__# $
)__$ %
{`` 	
filteraa 
.aa 
WeekDaysaa 
.aa 
Clearaa !
(aa! "
)aa" #
;aa# $
filterbb 
.bb 
AddWorkingWeekDaysbb %
(bb% &
)bb& '
;bb' (
}cc 	
publicff 
voidff 
WeekendWeekDaysff #
(ff# $
)ff$ %
{gg 	
filterhh 
.hh 
WeekDayshh 
.hh 
Clearhh !
(hh! "
)hh" #
;hh# $
filterii 
.ii 
AddWeekendWeekDaysii %
(ii% &
)ii& '
;ii' (
}jj 	
publicmm 
TimeSpanmm 
CalcDurationmm $
(mm$ %

ITimeRangemm% /
periodmm0 6
)mm6 7
{nn 	
ifoo 
(oo 
periodoo 
==oo 
nulloo 
)oo 
{pp 
throwqq 
newqq !
ArgumentNullExceptionqq /
(qq/ 0
$strqq0 8
)qq8 9
;qq9 :
}rr 
returnss 
DoCalcDurationss !
(ss! "
periodss" (
.ss( )
Startss) .
,ss. /
periodss0 6
.ss6 7
Endss7 :
)ss: ;
;ss; <
}tt 	
publicww 
TimeSpanww 
CalcDurationww $
(ww$ %
DateTimeww% -
startww. 3
,ww3 4
DateTimeww5 =
endww> A
)wwA B
{xx 	
returnyy 
DoCalcDurationyy !
(yy! "
startyy" '
,yy' (
endyy) ,
)yy, -
;yy- .
}zz 	
public}} 
TimeSpan}} !
CalcDayllightDuration}} -
(}}- .

ITimeRange}}. 8
period}}9 ?
,}}? @
TimeZoneInfo}}A M
timeZone}}N V
)}}V W
{~~ 	
if 
( 
period 
== 
null 
) 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
timeZone
�� 
==
�� 
null
��  
)
��  !
{
�� 
timeZone
�� 
=
�� 
TimeZoneInfo
�� '
.
��' (
Local
��( -
;
��- .
}
�� 
return
�� 
DoCalcDuration
�� !
(
��! "
period
��" (
.
��( )
Start
��) .
,
��. /
period
��0 6
.
��6 7
End
��7 :
,
��: ;
timeZone
��< D
)
��D E
;
��E F
}
�� 	
public
�� 
TimeSpan
�� #
CalcDayllightDuration
�� -
(
��- .
DateTime
��. 6
start
��7 <
,
��< =
DateTime
��> F
end
��G J
,
��J K
TimeZoneInfo
��L X
timeZone
��Y a
)
��a b
{
�� 	
if
�� 
(
�� 
timeZone
�� 
==
�� 
null
��  
)
��  !
{
�� 
timeZone
�� 
=
�� 
TimeZoneInfo
�� '
.
��' (
Local
��( -
;
��- .
}
�� 
return
�� 
DoCalcDuration
�� !
(
��! "
start
��" '
,
��' (
end
��) ,
,
��, -
timeZone
��. 6
)
��6 7
;
��7 8
}
�� 	
	protected
�� 
virtual
�� 
TimeSpan
�� "
DoCalcDuration
��# 1
(
��1 2
DateTime
��2 :
start
��; @
,
��@ A
DateTime
��B J
end
��K N
,
��N O
TimeZoneInfo
��P \
timeZone
��] e
=
��f g
null
��h l
)
��l m
{
�� 	
if
�� 
(
�� 
start
�� 
.
�� 
Equals
�� 
(
�� 
end
��  
)
��  !
)
��! "
{
�� 
return
�� 
TimeSpan
�� 
.
��  
Zero
��  $
;
��$ %
}
�� 
	TimeRange
�� 
	testRange
�� 
=
��  !
new
��" %
	TimeRange
��& /
(
��/ 0
start
��0 5
,
��5 6
end
��7 :
)
��: ;
;
��; <
DateTime
�� 
searchStart
��  
=
��! "
new
��# &
Day
��' *
(
��* +
	testRange
��+ 4
.
��4 5
Start
��5 :
)
��: ;
.
��; <
Start
��< A
;
��A B
DateTime
�� 
	serachEnd
�� 
=
��  
new
��! $
Day
��% (
(
��( )
	testRange
��) 2
.
��2 3
End
��3 6
)
��6 7
.
��7 8

GetNextDay
��8 B
(
��B C
)
��C D
.
��D E
Start
��E J
;
��J K
	TimeRange
�� 
searchPeriod
�� "
=
��# $
new
��% (
	TimeRange
��) 2
(
��2 3
searchStart
��3 >
,
��> ?
	serachEnd
��@ I
)
��I J
;
��J K
filter
�� 
.
�� 
ExcludePeriods
�� !
.
��! "
Clear
��" '
(
��' (
)
��( )
;
��) *
filter
�� 
.
�� 
ExcludePeriods
�� !
.
��! "
AddAll
��" (
(
��( )
excludePeriods
��) 7
)
��7 8
;
��8 9
TimeCalendar
�� 
calendar
�� !
=
��" #
new
��$ '
TimeCalendar
��( 4
(
��4 5
new
��5 8 
TimeCalendarConfig
��9 K
{
��L M
	EndOffset
��N W
=
��X Y
TimeSpan
��Z b
.
��b c
Zero
��c g
}
��h i
)
��i j
;
��j k%
CalendarPeriodCollector
�� #
	collector
��$ -
=
��. /
new
��0 3%
CalendarPeriodCollector
��4 K
(
��K L
filter
��L R
,
��R S
searchPeriod
��T `
,
��` a

��b o
.
��o p
Forward
��p w
,
��w x
calendar��y �
)��� �
;��� �
	collector
�� 
.
�� 
CollectHours
�� "
(
��" #
)
��# $
;
��$ %
TimeSpan
�� 
duration
�� 
=
�� 
TimeSpan
��  (
.
��( )
Zero
��) -
;
��- .
	collector
�� 
.
�� 
Periods
�� 
.
�� 
AddAll
�� $
(
��$ %
includePeriods
��% 3
)
��3 4
;
��4 5
foreach
�� 
(
��  
ICalendarTimeRange
�� '
period
��( .
in
��/ 1
	collector
��2 ;
.
��; <
Periods
��< C
)
��C D
{
�� 
ITimePeriod
�� 
intersection
�� (
=
��) *
	testRange
��+ 4
.
��4 5
GetIntersection
��5 D
(
��D E
period
��E K
)
��K L
;
��L M
if
�� 
(
�� 
intersection
��  
==
��! #
null
��$ (
)
��( )
{
�� 
continue
�� 
;
�� 
}
�� 
duration
�� 
=
�� 
duration
�� #
.
��# $
Add
��$ '
(
��' (
durationProvider
��( 8
.
��8 9
GetDuration
��9 D
(
��D E
intersection
��E Q
.
��Q R
Start
��R W
,
��W X
intersection
��Y e
.
��e f
End
��f i
)
��i j
)
��j k
;
��k l
}
�� 
return
�� 
start
�� 
<
�� 
end
�� 
?
��  
duration
��! )
:
��* +
duration
��, 4
.
��4 5
Negate
��5 ;
(
��; <
)
��< =
;
��= >
}
�� 	
private
�� 
readonly
�� +
CalendarPeriodCollectorFilter
�� 6
filter
��7 =
=
��> ?
new
��@ C+
CalendarPeriodCollectorFilter
��D a
(
��a b
)
��b c
;
��c d
private
�� 
readonly
�� "
TimePeriodCollection
�� -
includePeriods
��. <
=
��= >
new
��? B"
TimePeriodCollection
��C W
(
��W X
)
��X Y
;
��Y Z
private
�� 
readonly
�� "
TimePeriodCollection
�� -
excludePeriods
��. <
=
��= >
new
��? B"
TimePeriodCollection
��C W
(
��W X
)
��X Y
;
��Y Z
private
�� 
readonly
�� 
IDurationProvider
�� *
durationProvider
��+ ;
;
��; <
}
�� 
}�� �
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DurationFormatType.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 
DurationFormatType "
{ 
Compact 
, 
Detailed 
, 
} 
} �
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\DurationProvider.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
DurationProvider !
:" #
IDurationProvider$ 5
{ 
public 
virtual 
TimeSpan 
GetDuration  +
(+ ,
DateTime, 4
start5 :
,: ;
DateTime< D
endE H
)H I
{ 	
return 
end 
. 
Subtract 
(  
start  %
)% &
;& '
} 	
} 
} �c
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\FiscalCalendarTool.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

static 
class 
FiscalCalendarTool *
{ 
public 
static 
int 
GetDaysInMonth (
(( )
	YearMonth) 2
month3 8
,8 9
	YearMonth: C

,Q R!
FiscalQuarterGroupingS h
quarterGroupingi x
)x y
{ 	
int 
diffMonthCount 
=  
month! &
-' (

;6 7
if 
( 
diffMonthCount 
<  
$num! "
)" #
{ 
diffMonthCount 
=  
TimeSpec! )
.) *

+8 9
diffMonthCount: H
;H I
} 
return 
( 
diffMonthCount "
+# $
(% &
int& )
)) *
quarterGrouping* 9
+: ;
$num< =
)= >
%? @
TimeSpecA I
.I J
MonthsPerQuarterJ Z
==[ ]
$num^ _
?` a
TimeSpec 
. "
FiscalDaysPerLongMonth /
:0 1
TimeSpec2 :
.: ;#
FiscalDaysPerShortMonth; R
;R S
} 	
public   
static   
int   
GetYear   !
(  ! "
int  " %
year  & *
,  * +
	YearMonth  , 5
month  6 ;
,  ; <
	YearMonth  = F

,  T U
	YearMonth  V _
fiscalYearBaseMonth  ` s
)  s t
{!! 	
year"" 
="" 

>=""! #
fiscalYearBaseMonth""$ 7
?""8 9
year"": >
:""? @
year""A E
-""F G
$num""H I
;""I J
return## 
month## 
-## 

<##) *
$num##+ ,
?##- .
year##/ 3
:##4 5
year##6 :
+##; <
$num##= >
;##> ?
}$$ 	
public'' 
static'' 
DateTime'' 
GetStartOfMonth'' .
(''. /
int''/ 2
year''3 7
,''7 8
	YearMonth''9 B
month''C H
,''H I
	YearMonth''J S

,''a b
	DayOfWeek''c l
yearStartDay''m y
,''y z
FiscalYearAlignment(( 

,((- .!
FiscalQuarterGrouping((/ D
quarterGrouping((E T
)((T U
{)) 	
int** 
diffMonthCount** 
=**  
month**! &
-**' (

;**6 7
if++ 
(++ 
diffMonthCount++ 
<++  
$num++! "
)++" #
{,, 
year-- 
---- 
;-- 
diffMonthCount.. 
=..  
TimeSpec..! )
...) *

+..8 9
diffMonthCount..: H
;..H I
}// 
DateTime00 
startOfYear00  
=00! "
GetStartOfYear00# 1
(001 2
year002 6
,006 7

,00E F
yearStartDay00G S
,00S T

)00b c
;00c d
int11 
fiveWeekMonthCount11 "
=11# $
(11% &
diffMonthCount11& 4
+115 6
(117 8
int118 ;
)11; <
quarterGrouping11< K
)11K L
/11M N
TimeSpec11O W
.11W X
MonthsPerQuarter11X h
;11h i
return22 
startOfYear22 
.22 
AddDays22 &
(22& '
diffMonthCount33 
*33  
TimeSpec33! )
.33) *#
FiscalDaysPerShortMonth33* A
+33B C
fiveWeekMonthCount33D V
*33W X
TimeSpec33Y a
.33a b
DaysPerWeek33b m
)33m n
;33n o
}44 	
public;; 
static;; 
DateTime;; 
GetStartOfQuarter;; 0
(;;0 1
int;;1 4
year;;5 9
,;;9 :
YearQuarter;;; F
quarter;;G N
,;;N O
	YearMonth;;P Y

,;;g h
	DayOfWeek;;i r
yearStartDay;;s 
,	;; �
FiscalYearAlignment<< 

)<<- .
{== 	
DateTime>> 
startOfYear>>  
=>>! "
GetStartOfYear>># 1
(>>1 2
year>>2 6
,>>6 7

,>>E F
yearStartDay>>G S
,>>S T

)>>b c
;>>c d
DateTime?? 
startOfQuarter?? #
;??# $
switch@@ 
(@@ 

)@@! "
{AA 
caseBB 
FiscalYearAlignmentBB (
.BB( )
NoneBB) -
:BB- .
startOfQuarterCC "
=CC# $
startOfYearCC% 0
.CC0 1
	AddMonthsCC1 :
(CC: ;
(CC; <
(CC< =
intCC= @
)CC@ A
quarterCCA H
-CCI J
$numCCK L
)CCL M
*CCN O
TimeSpecCCP X
.CCX Y
MonthsPerQuarterCCY i
)CCi j
;CCj k
breakDD 
;DD 
caseEE 
FiscalYearAlignmentEE (
.EE( )
LastDayEE) 0
:EE0 1
caseFF 
FiscalYearAlignmentFF (
.FF( )

NearestDayFF) 3
:FF3 4
startOfQuarterGG "
=GG# $
startOfYearGG% 0
.GG0 1
AddDaysGG1 8
(GG8 9
(GG9 :
(GG: ;
intGG; >
)GG> ?
quarterGG? F
-GGG H
$numGGI J
)GGJ K
*GGL M
TimeSpecGGN V
.GGV W!
FiscalWeeksPerQuarterGGW l
*GGm n
TimeSpecGGo w
.GGw x
DaysPerWeek	GGx �
)
GG� �
;
GG� �
breakHH 
;HH 
defaultII 
:II 
throwJJ 
newJJ %
InvalidOperationExceptionJJ 7
(JJ7 8
stringJJ8 >
.JJ> ?
FormatJJ? E
(JJE F
$strJJF b
,JJb c

)JJq r
)JJr s
;JJs t
}KK 
returnLL 
startOfQuarterLL !
;LL! "
}MM 	
publicTT 
staticTT 
DateTimeTT 
GetStartOfHalfyearTT 1
(TT1 2
intTT2 5
yearTT6 :
,TT: ;
YearHalfyearTT< H
halfyearTTI Q
,TTQ R
	YearMonthTTS \

,TTj k
	DayOfWeekTTl u
yearStartDay	TTv �
,
TT� �
FiscalYearAlignmentUU 

)UU- .
{VV 	
DateTimeWW 
startOfYearWW  
=WW! "
GetStartOfYearWW# 1
(WW1 2
yearWW2 6
,WW6 7

,WWE F
yearStartDayWWG S
,WWS T

)WWb c
;WWc d
DateTimeXX 
startOfHalfyearXX $
;XX$ %
switchYY 
(YY 

)YY! "
{ZZ 
case[[ 
FiscalYearAlignment[[ (
.[[( )
None[[) -
:[[- .
startOfHalfyear\\ #
=\\$ %
startOfYear\\& 1
.\\1 2
	AddMonths\\2 ;
(\\; <
(\\< =
(\\= >
int\\> A
)\\A B
halfyear\\B J
-\\K L
$num\\M N
)\\N O
*\\P Q
TimeSpec\\R Z
.\\Z [
MonthsPerHalfyear\\[ l
)\\l m
;\\m n
break]] 
;]] 
case^^ 
FiscalYearAlignment^^ (
.^^( )
LastDay^^) 0
:^^0 1
case__ 
FiscalYearAlignment__ (
.__( )

NearestDay__) 3
:__3 4
startOfHalfyear`` #
=``$ %
startOfYear``& 1
.``1 2
AddDays``2 9
(``9 :
(``: ;
(``; <
int``< ?
)``? @
halfyear``@ H
-``I J
$num``K L
)``L M
*``N O
TimeSpec``P X
.``X Y"
FiscalWeeksPerHalfyear``Y o
*``p q
TimeSpec``r z
.``z {
DaysPerWeek	``{ �
)
``� �
;
``� �
breakaa 
;aa 
defaultbb 
:bb 
throwcc 
newcc %
InvalidOperationExceptioncc 7
(cc7 8
stringcc8 >
.cc> ?
Formatcc? E
(ccE F
$strccF b
,ccb c

)ccq r
)ccr s
;ccs t
}dd 
returnee 
startOfHalfyearee "
;ee" #
}ff 	
publicmm 
staticmm 
intmm 

(mm' (
intmm( +
calendarYearmm, 8
,mm8 9
	YearMonthmm: C
fiscalYearBaseMonthmmD W
,mmW X
	YearMonthmmY b

)mmp q
{nn 	
returnoo 

>=oo! #
fiscalYearBaseMonthoo$ 7
?oo8 9
calendarYearoo: F
+ooG H
$numooI J
:ooK L
calendarYearooM Y
;ooY Z
}pp 	
publicss 
staticss 
DateTimess 
GetStartOfYearss -
(ss- .
intss. 1
yearss2 6
,ss6 7
	YearMonthss8 A

,ssO P
	DayOfWeekssQ Z
yearStartDayss[ g
,ssg h
FiscalYearAlignmentssi |

)
ss� �
{tt 	
DateTimeuu 
startOfYearuu  
=uu! "
newuu# &
DateTimeuu' /
(uu/ 0
yearuu0 4
,uu4 5
(uu6 7
intuu7 :
)uu: ;

,uuH I
$numuuJ K
)uuK L
;uuL M
switchww 
(ww 

)ww! "
{xx 
caseyy 
FiscalYearAlignmentyy (
.yy( )
Noneyy) -
:yy- .
breakzz 
;zz 
case{{ 
FiscalYearAlignment{{ (
.{{( )
LastDay{{) 0
:{{0 1
while|| 
(|| 
startOfYear|| &
.||& '
	DayOfWeek||' 0
!=||1 3
yearStartDay||4 @
)||@ A
{}} 
startOfYear~~ #
=~~$ %
startOfYear~~& 1
.~~1 2
AddDays~~2 9
(~~9 :
-~~: ;
$num~~; <
)~~< =
;~~= >
} 
break
�� 
;
�� 
case
�� !
FiscalYearAlignment
�� (
.
��( )

NearestDay
��) 3
:
��3 4
int
�� 
diffDayCount
�� $
=
��% &
Math
��' +
.
��+ ,
Abs
��, /
(
��/ 0
(
��0 1
int
��1 4
)
��4 5
startOfYear
��5 @
.
��@ A
	DayOfWeek
��A J
-
��K L
(
��M N
int
��N Q
)
��Q R
yearStartDay
��R ^
)
��^ _
;
��_ `
startOfYear
�� 
=
��  !
startOfYear
��" -
.
��- .
AddDays
��. 5
(
��5 6
diffDayCount
��6 B
>
��C D
$num
��E F
?
��G H
TimeSpec
��I Q
.
��Q R
DaysPerWeek
��R ]
-
��^ _
diffDayCount
��` l
:
��m n
-
��o p
diffDayCount
��p |
)
��| }
;
��} ~
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
string
��8 >
.
��> ?
Format
��? E
(
��E F
$str
��F b
,
��b c

��d q
)
��q r
)
��r s
;
��s t
}
�� 
return
�� 
startOfYear
�� 
;
�� 
}
�� 	
}
�� 
}�� �
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\FiscalQuarterGrouping.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum !
FiscalQuarterGrouping %
{ 
FourFourFiveWeeks 
= 
$num 
, 
FourFiveFourWeeks 
= 
$num 
, 
FiveFourFourWeeks 
= 
$num 
, 
} 
} �
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\FiscalYearAlignment.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 
FiscalYearAlignment #
{ 
None 
, 
LastDay 
, 

NearestDay 
, 
} 
} �G
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Halfyear.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Halfyear  
:! "
HalfyearTimeRange# 4
{ 
public 
Halfyear 
( 
) 
: 
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 
Halfyear 
( 
DateTime  
moment! '
)' (
:) *
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{ 	
} 	
public 
Halfyear 
( 

calendar& .
). /
:0 1
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{   	
}!! 	
public$$ 
Halfyear$$ 
($$ 
DateTime$$  
moment$$! '
,$$' (

calendar$$7 ?
)$$? @
:$$A B
this%% 
(%% 
TimeTool%% 
.%% 
	GetYearOf%% #
(%%# $
calendar%%$ ,
.%%, -

,%%: ;
calendar%%< D
.%%D E
GetYear%%E L
(%%L M
moment%%M S
)%%S T
,%%T U
calendar%%V ^
.%%^ _
GetMonth%%_ g
(%%g h
moment%%h n
)%%n o
)%%o p
,%%p q
TimeTool&& 
.&& 
GetHalfyearOfMonth&& +
(&&+ ,
calendar&&, 4
.&&4 5

,&&B C
(&&D E
	YearMonth&&E N
)&&N O
calendar&&O W
.&&W X
GetMonth&&X `
(&&` a
moment&&a g
)&&g h
)&&h i
,&&i j
calendar&&k s
)&&s t
{'' 	
}(( 	
public++ 
Halfyear++ 
(++ 
int++ 
year++  
,++  !
YearHalfyear++" .
yearHalfyear++/ ;
)++; <
:++= >
this,, 
(,, 
year,, 
,,, 
yearHalfyear,, #
,,,# $
new,,% (
TimeCalendar,,) 5
(,,5 6
),,6 7
),,7 8
{-- 	
}.. 	
public11 
Halfyear11 
(11 
int11 
year11  
,11  !
YearHalfyear11" .
yearHalfyear11/ ;
,11; <

calendar11K S
)11S T
:11U V
base22 
(22 
year22 
,22 
yearHalfyear22 #
,22# $
$num22% &
,22& '
calendar22( 0
)220 1
{33 	
}44 	
public77 
int77 
Year77 
{88 	
get99 
{99 
return99 
	StartYear99 "
;99" #
}99$ %
}:: 	
public== 
	YearMonth== 

StartMonth== #
{>> 	
get?? 
{@@ 
intAA 
yearAA 
;AA 
	YearMonthBB 
monthBB 
;BB  
intCC 

monthCountCC 
=CC  
(CC! "
(CC" #
intCC# &
)CC& '

-CC5 6
$numCC7 8
)CC8 9
*CC: ;
TimeSpecCC< D
.CCD E
MonthsPerHalfyearCCE V
;CCV W
TimeToolDD 
.DD 
AddMonthDD !
(DD! "
BaseYearDD" *
,DD* +
CalendarDD, 4
.DD4 5

,DDB C

monthCountDDD N
,DDN O
outDDP S
yearDDT X
,DDX Y
outDDZ ]
monthDD^ c
)DDc d
;DDd e
returnEE 
monthEE 
;EE 
}FF 
}GG 	
publicJJ 
YearHalfyearJJ 
YearHalfyearJJ (
{KK 	
getLL 
{LL 
returnLL 

;LL& '
}LL( )
}MM 	
publicPP 
stringPP 
HalfyearNamePP "
{QQ 	
getRR 
{RR 
returnRR 
StartHalfyearNameRR *
;RR* +
}RR, -
}SS 	
publicVV 
stringVV 
HalfyearOfYearNameVV (
{WW 	
getXX 
{XX 
returnXX #
StartHalfyearOfYearNameXX 0
;XX0 1
}XX2 3
}YY 	
public\\ 
bool\\ 
IsCalendarHalfyear\\ &
{]] 	
get^^ 
{^^ 
return^^ 
(^^ 
(^^ 
int^^ 
)^^ 

-^^- .
$num^^/ 0
)^^0 1
%^^2 3
TimeSpec^^4 <
.^^< =
MonthsPerHalfyear^^= N
==^^O Q
$num^^R S
;^^S T
}^^U V
}__ 	
publicbb 
boolbb !
MultipleCalendarYearsbb )
{cc 	
getdd 
{ee 
ifff 
(ff 
IsCalendarHalfyearff &
)ff& '
{gg 
returnhh 
falsehh  
;hh  !
}ii 
intkk 
	startYearkk 
;kk 
	YearMonthll 
monthll 
;ll  
intmm 

monthCountmm 
=mm  
(mm! "
(mm" #
intmm# &
)mm& '

-mm5 6
$nummm7 8
)mm8 9
*mm: ;
TimeSpecmm< D
.mmD E
MonthsPerHalfyearmmE V
;mmV W
TimeToolnn 
.nn 
AddMonthnn !
(nn! "
BaseYearnn" *
,nn* +

,nn9 :

monthCountnn; E
,nnE F
outnnG J
	startYearnnK T
,nnT U
outnnV Y
monthnnZ _
)nn_ `
;nn` a
intpp 
endYearpp 
;pp 

monthCountqq 
+=qq 
TimeSpecqq &
.qq& '
MonthsPerHalfyearqq' 8
;qq8 9
TimeToolrr 
.rr 
AddMonthrr !
(rr! "
BaseYearrr" *
,rr* +

,rr9 :

monthCountrr; E
,rrE F
outrrG J
endYearrrK R
,rrR S
outrrT W
monthrrX ]
)rr] ^
;rr^ _
returnss 
	startYearss  
!=ss! #
endYearss$ +
;ss+ ,
}tt 
}uu 	
publicxx 
Halfyearxx 
GetPreviousHalfyearxx +
(xx+ ,
)xx, -
{yy 	
returnzz 
AddHalfyearszz 
(zz  
-zz  !
$numzz! "
)zz" #
;zz# $
}{{ 	
public~~ 
Halfyear~~ 
GetNextHalfyear~~ '
(~~' (
)~~( )
{ 	
return
�� 
AddHalfyears
�� 
(
��  
$num
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
Halfyear
�� 
AddHalfyears
�� $
(
��$ %
int
��% (
count
��) .
)
��. /
{
�� 	
int
�� 
year
�� 
;
�� 
YearHalfyear
�� 
halfyear
�� !
;
��! "
TimeTool
�� 
.
�� 
AddHalfyear
��  
(
��  !
BaseYear
��! )
,
��) *

��+ 8
,
��8 9
count
��: ?
,
��? @
out
��A D
year
��E I
,
��I J
out
��K N
halfyear
��O W
)
��W X
;
��X Y
return
�� 
new
�� 
Halfyear
�� 
(
��  
year
��  $
,
��$ %
halfyear
��& .
,
��. /
Calendar
��0 8
)
��8 9
;
��9 :
}
�� 	
	protected
�� 
override
�� 
string
�� !
Format
��" (
(
��( )
ITimeFormatter
��) 7
	formatter
��8 A
)
��A B
{
�� 	
return
�� 
	formatter
�� 
.
�� 
GetCalendarPeriod
�� .
(
��. / 
HalfyearOfYearName
��/ A
,
��A B
	formatter
�� 
.
�� 
GetShortDate
�� &
(
��& '
Start
��' ,
)
��, -
,
��- .
	formatter
��/ 8
.
��8 9
GetShortDate
��9 E
(
��E F
End
��F I
)
��I J
,
��J K
Duration
��L T
)
��T U
;
��U V
}
�� 	
}
�� 
}�� �&
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Halfyears.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
	Halfyears !
:" #
HalfyearTimeRange$ 5
{ 
public 
	Halfyears 
( 
DateTime !
moment" (
,( )
YearHalfyear* 6

,D E
intF I
countJ O
)O P
:Q R
this 
( 
moment 
, 

,& '
count( -
,- .
new/ 2
TimeCalendar3 ?
(? @
)@ A
)A B
{ 	
} 	
public 
	Halfyears 
( 
DateTime !
moment" (
,( )
YearHalfyear* 6

,D E
intF I
countJ O
,O P

calendar_ g
)g h
:i j
this 
( 
TimeTool 
. 
	GetYearOf #
(# $
calendar$ ,
., -

,: ;
calendar< D
.D E
GetYearE L
(L M
momentM S
)S T
,T U
calendarV ^
.^ _
GetMonth_ g
(g h
momenth n
)n o
)o p
,p q

, 
count  
,  !
calendar" *
)* +
{ 	
} 	
public 
	Halfyears 
( 
int 
	startYear &
,& '
YearHalfyear( 4

,B C
intD G

)U V
:W X
this   
(   
	startYear   
,   

,  ) *

,  8 9
new  : =
TimeCalendar  > J
(  J K
)  K L
)  L M
{!! 	
}"" 	
public%% 
	Halfyears%% 
(%% 
int%% 
	startYear%% &
,%%& '
YearHalfyear%%( 4

,%%B C
int%%D G

,%%U V

calendar%%e m
)%%m n
:%%o p
base&& 
(&& 
	startYear&& 
,&& 

,&&) *

,&&8 9
calendar&&: B
)&&B C
{'' 	
}(( 	
public++ !
ITimePeriodCollection++ $
GetHalfyears++% 1
(++1 2
)++2 3
{,, 	 
TimePeriodCollection--  
	halfyears--! *
=--+ ,
new--- 0 
TimePeriodCollection--1 E
(--E F
)--F G
;--G H
for.. 
(.. 
int.. 
i.. 
=.. 
$num.. 
;.. 
i.. 
<.. 

;..- .
i../ 0
++..0 2
)..2 3
{// 
int00 
year00 
;00 
YearHalfyear11 
halfyear11 %
;11% &
TimeTool22 
.22 
AddHalfyear22 $
(22$ %
BaseYear22% -
,22- .

,22< =
i22> ?
,22? @
out22A D
year22E I
,22I J
out22K N
halfyear22O W
)22W X
;22X Y
	halfyears33 
.33 
Add33 
(33 
new33 !
Halfyear33" *
(33* +
year33+ /
,33/ 0
halfyear331 9
,339 :
Calendar33; C
)33C D
)33D E
;33E F
}44 
return55 
	halfyears55 
;55 
}66 	
	protected99 
override99 
string99 !
Format99" (
(99( )
ITimeFormatter99) 7
	formatter998 A
)99A B
{:: 	
return;; 
	formatter;; 
.;; 
GetCalendarPeriod;; .
(;;. /#
StartHalfyearOfYearName;;/ F
,;;F G!
EndHalfyearOfYearName;;H ]
,;;] ^
	formatter<< 
.<< 
GetShortDate<< &
(<<& '
Start<<' ,
)<<, -
,<<- .
	formatter<</ 8
.<<8 9
GetShortDate<<9 E
(<<E F
End<<F I
)<<I J
,<<J K
Duration<<L T
)<<T U
;<<U V
}== 	
}?? 
}AA �{
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\HalfyearTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 
HalfyearTimeRange +
:, -
CalendarTimeRange. ?
{ 
	protected 
HalfyearTimeRange #
(# $
int$ '
	startYear( 1
,1 2
YearHalfyear3 ?

,M N
intO R

,` a

calendarp x
)x y
:z {
base 
( 
GetPeriodOf 
( 
calendar %
,% &
	startYear' 0
,0 1

,? @

)N O
,O P
calendarQ Y
)Y Z
{ 	
this 
. 
	startYear 
= 
	startYear &
;& '
this 
. 

=  

;. /
this 
. 

=  

;. /
TimeTool 
. 
AddHalfyear  
(  !
	startYear! *
,* +

,9 :

-I J
$numK L
,L M
outN Q
endYearR Y
,Y Z
out[ ^
endHalfyear_ j
)j k
;k l
} 	
public 
override 
int 
BaseYear $
{ 	
get 
{ 
return 
	startYear "
;" #
}$ %
} 	
public"" 
int"" 
	StartYear"" 
{## 	
get$$ 
{$$ 
return$$ 
Calendar$$ !
.$$! "
GetYear$$" )
($$) *
	startYear$$* 3
,$$3 4
($$5 6
int$$6 9
)$$9 :
Calendar$$: B
.$$B C

)$$P Q
;$$Q R
}$$S T
}%% 	
public(( 
int(( 
EndYear(( 
{)) 	
get** 
{** 
return** 
Calendar** !
.**! "
GetYear**" )
(**) *
endYear*** 1
,**1 2
(**3 4
int**4 7
)**7 8
Calendar**8 @
.**@ A

)**N O
;**O P
}**Q R
}++ 	
public.. 
YearHalfyear.. 

{// 	
get00 
{00 
return00 

;00& '
}00( )
}11 	
public44 
YearHalfyear44 
EndHalfyear44 '
{55 	
get66 
{66 
return66 
endHalfyear66 $
;66$ %
}66& '
}77 	
public:: 
int:: 

{;; 	
get<< 
{<< 
return<< 

;<<& '
}<<( )
}== 	
public@@ 
string@@ 
StartHalfyearName@@ '
{AA 	
getBB 
{BB 
returnBB 
CalendarBB !
.BB! "
GetHalfyearNameBB" 1
(BB1 2

)BB? @
;BB@ A
}BBB C
}CC 	
publicFF 
stringFF #
StartHalfyearOfYearNameFF -
{GG 	
getHH 
{HH 
returnHH 
CalendarHH !
.HH! "!
GetHalfyearOfYearNameHH" 7
(HH7 8
	StartYearHH8 A
,HHA B

)HHP Q
;HHQ R
}HHS T
}II 	
publicLL 
stringLL 
EndHalfyearNameLL %
{MM 	
getNN 
{NN 
returnNN 
CalendarNN !
.NN! "
GetHalfyearNameNN" 1
(NN1 2
EndHalfyearNN2 =
)NN= >
;NN> ?
}NN@ A
}OO 	
publicRR 
stringRR !
EndHalfyearOfYearNameRR +
{SS 	
getTT 
{TT 
returnTT 
CalendarTT !
.TT! "!
GetHalfyearOfYearNameTT" 7
(TT7 8
EndYearTT8 ?
,TT? @
EndHalfyearTTA L
)TTL M
;TTM N
}TTO P
}UU 	
publicXX !
ITimePeriodCollectionXX $
GetQuartersXX% 0
(XX0 1
)XX1 2
{YY 	 
TimePeriodCollectionZZ  
quartersZZ! )
=ZZ* +
newZZ, / 
TimePeriodCollectionZZ0 D
(ZZD E
)ZZE F
;ZZF G
YearQuarter[[ 
startQuarter[[ $
=[[% &

==[[5 7
YearHalfyear[[8 D
.[[D E
First[[E J
?[[K L
YearQuarter[[M X
.[[X Y
First[[Y ^
:[[_ `
YearQuarter[[a l
.[[l m
Third[[m r
;[[r s
for\\ 
(\\ 
int\\ 
i\\ 
=\\ 
$num\\ 
;\\ 
i\\ 
<\\ 

;\\- .
i\\/ 0
++\\0 2
)\\2 3
{]] 
for^^ 
(^^ 
int^^ 
quarter^^  
=^^! "
$num^^# $
;^^$ %
quarter^^& -
<^^. /
TimeSpec^^0 8
.^^8 9
QuartersPerHalfyear^^9 L
;^^L M
quarter^^N U
++^^U W
)^^W X
{__ 
int`` 
year`` 
;`` 
YearQuarteraa 
yearQuarteraa  +
;aa+ ,
TimeToolbb 
.bb 

AddQuarterbb '
(bb' (
	startYearbb( 1
,bb1 2
startQuarterbb3 ?
,bb? @
ibbA B
*bbC D
TimeSpecbbE M
.bbM N
QuartersPerHalfyearbbN a
+bbb c
quarterbbd k
,bbk l
outbbm p
yearbbq u
,bbu v
outbbw z
yearQuarter	bb{ �
)
bb� �
;
bb� �
quarterscc 
.cc 
Addcc  
(cc  !
newcc! $
Quartercc% ,
(cc, -
yearcc- 1
,cc1 2
yearQuartercc3 >
,cc> ?
Calendarcc@ H
)ccH I
)ccI J
;ccJ K
}dd 
}ee 
returnff 
quartersff 
;ff 
}gg 	
publicjj !
ITimePeriodCollectionjj $
	GetMonthsjj% .
(jj. /
)jj/ 0
{kk 	 
TimePeriodCollectionll  
monthsll! '
=ll( )
newll* - 
TimePeriodCollectionll. B
(llB C
)llC D
;llD E
	YearMonthmm 

startMonthmm  
=mm! "

;mm0 1
ifnn 
(nn 

==nn  
YearHalfyearnn! -
.nn- .
Secondnn. 4
)nn4 5
{oo 
intpp 
yearpp 
;pp 
TimeToolqq 
.qq 
AddMonthqq !
(qq! "
	startYearqq" +
,qq+ ,

startMonthqq- 7
,qq7 8
TimeSpecqq9 A
.qqA B
MonthsPerHalfyearqqB S
,qqS T
outqqU X
yearqqY ]
,qq] ^
outqq_ b

startMonthqqc m
)qqm n
;qqn o
}rr 
forss 
(ss 
intss 
iss 
=ss 
$numss 
;ss 
iss 
<ss 

;ss- .
iss/ 0
++ss0 2
)ss2 3
{tt 
foruu 
(uu 
intuu 
monthuu 
=uu  
$numuu! "
;uu" #
monthuu$ )
<uu* +
TimeSpecuu, 4
.uu4 5
MonthsPerHalfyearuu5 F
;uuF G
monthuuH M
++uuM O
)uuO P
{vv 
intww 
yearww 
;ww 
	YearMonthxx 
	yearMonthxx '
;xx' (
TimeToolyy 
.yy 
AddMonthyy %
(yy% &
	startYearyy& /
,yy/ 0

startMonthyy1 ;
,yy; <
iyy= >
*yy? @
TimeSpecyyA I
.yyI J
MonthsPerHalfyearyyJ [
+yy\ ]
monthyy^ c
,yyc d
outyye h
yearyyi m
,yym n
outyyo r
	yearMonthyys |
)yy| }
;yy} ~
monthszz 
.zz 
Addzz 
(zz 
newzz "
Monthzz# (
(zz( )
yearzz) -
,zz- .
	yearMonthzz/ 8
,zz8 9
Calendarzz: B
)zzB C
)zzC D
;zzD E
}{{ 
}|| 
return}} 
months}} 
;}} 
}~~ 	
	protected
�� 
override
�� 
bool
�� 
IsEqual
��  '
(
��' (
object
��( .
obj
��/ 2
)
��2 3
{
�� 	
return
�� 
base
�� 
.
�� 
IsEqual
�� 
(
��  
obj
��  #
)
��# $
&&
��% '
HasSameData
��( 3
(
��3 4
obj
��4 7
as
��8 :
HalfyearTimeRange
��; L
)
��L M
;
��M N
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
HalfyearTimeRange
��! 2
comp
��3 7
)
��7 8
{
�� 	
return
�� 
	startYear
�� 
==
�� 
comp
�� !
.
��! "
	startYear
��" +
&&
��, .

�� 
==
��  
comp
��! %
.
��% &

��& 3
&&
��4 6

�� 
==
��  
comp
��! %
.
��% &

��& 3
&&
��4 6
endYear
�� 
==
�� 
comp
�� 
.
��  
endYear
��  '
&&
��( *
endHalfyear
�� 
==
�� 
comp
�� #
.
��# $
endHalfyear
��$ /
;
��/ 0
}
�� 	
	protected
�� 
override
�� 
int
�� 
ComputeHashCode
�� .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
base
��, 0
.
��0 1
ComputeHashCode
��1 @
(
��@ A
)
��A B
,
��B C
	startYear
��D M
,
��M N

��O \
,
��\ ]

��^ k
,
��k l
endYear
��m t
,
��t u
endHalfyear��v �
)��� �
;��� �
}
�� 	
private
�� 
static
�� 
DateTime
��  
GetStartOfHalfyear
��  2
(
��2 3

��3 @
calendar
��A I
,
��I J
int
��K N
year
��O S
,
��S T
YearHalfyear
��U a
halfyear
��b j
)
��j k
{
�� 	
DateTime
�� 
startOfHalfyear
�� $
;
��$ %
switch
�� 
(
�� 
calendar
�� 
.
�� 
YearType
�� %
)
��% &
{
�� 
case
�� 
YearType
�� 
.
�� 

FiscalYear
�� (
:
��( )
startOfHalfyear
�� #
=
��$ % 
FiscalCalendarTool
��& 8
.
��8 9 
GetStartOfHalfyear
��9 K
(
��K L
year
��L P
,
��P Q
halfyear
��R Z
,
��Z [
calendar
��  
.
��  !

��! .
,
��. /
calendar
��0 8
.
��8 9"
FiscalFirstDayOfYear
��9 M
,
��M N
calendar
��O W
.
��W X!
FiscalYearAlignment
��X k
)
��k l
;
��l m
break
�� 
;
�� 
default
�� 
:
�� 
DateTime
�� 
	yearStart
�� &
=
��' (
new
��) ,
DateTime
��- 5
(
��5 6
year
��6 :
,
��: ;
(
��< =
int
��= @
)
��@ A
calendar
��A I
.
��I J

��J W
,
��W X
$num
��Y Z
)
��Z [
;
��[ \
startOfHalfyear
�� #
=
��$ %
	yearStart
��& /
.
��/ 0
	AddMonths
��0 9
(
��9 :
(
��: ;
(
��; <
int
��< ?
)
��? @
halfyear
��@ H
-
��I J
$num
��K L
)
��L M
*
��N O
TimeSpec
��P X
.
��X Y
MonthsPerHalfyear
��Y j
)
��j k
;
��k l
break
�� 
;
�� 
}
�� 
return
�� 
startOfHalfyear
�� "
;
��" #
}
�� 	
private
�� 
static
�� 
	TimeRange
��  
GetPeriodOf
��! ,
(
��, -

��- :
calendar
��; C
,
��C D
int
��E H
	startYear
��I R
,
��R S
YearHalfyear
��T `

��a n
,
��n o
int
��p s

)��� �
{
�� 	
if
�� 
(
�� 

�� 
<
�� 
$num
��  !
)
��! "
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 E
)
��E F
;
��F G
}
�� 
DateTime
�� 
start
�� 
=
��  
GetStartOfHalfyear
�� /
(
��/ 0
calendar
��0 8
,
��8 9
	startYear
��: C
,
��C D

��E R
)
��R S
;
��S T
int
�� 
endYear
�� 
;
�� 
YearHalfyear
�� 
endHalfyear
�� $
;
��$ %
TimeTool
�� 
.
�� 
AddHalfyear
��  
(
��  !
	startYear
��! *
,
��* +

��, 9
,
��9 :

��; H
,
��H I
out
��J M
endYear
��N U
,
��U V
out
��W Z
endHalfyear
��[ f
)
��f g
;
��g h
DateTime
�� 
end
�� 
=
��  
GetStartOfHalfyear
�� -
(
��- .
calendar
��. 6
,
��6 7
endYear
��8 ?
,
��? @
endHalfyear
��A L
)
��L M
;
��M N
return
�� 
new
�� 
	TimeRange
��  
(
��  !
start
��! &
,
��& '
end
��( +
)
��+ ,
;
��, -
}
�� 	
private
�� 
readonly
�� 
int
�� 
	startYear
�� &
;
��& '
private
�� 
readonly
�� 
YearHalfyear
�� %

��& 3
;
��3 4
private
�� 
readonly
�� 
int
�� 

�� *
;
��* +
private
�� 
readonly
�� 
int
�� 
endYear
�� $
;
��$ %
private
�� 
readonly
�� 
YearHalfyear
�� %
endHalfyear
��& 1
;
��1 2
}
�� 
}�� � 
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\HashTool.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

static 
class 
HashTool  
{ 
public 
static 
int 
AddHashCode %
(% &
int& )
hash* .
,. /
object0 6
obj7 :
): ;
{ 	
int 
combinedHash 
= 
obj "
!=# %
null& *
?+ ,
obj- 0
.0 1
GetHashCode1 <
(< =
)= >
:? @
	nullValueA J
;J K
combinedHash 
+= 
hash  
*! "
factor# )
;) *
return 
combinedHash 
;  
} 	
public"" 
static"" 
int"" 
AddHashCode"" %
(""% &
int""& )
hash""* .
,"". /
int""0 3
objHash""4 ;
)""; <
{## 	
int$$ 
combinedHash$$ 
=$$ 
objHash$$ &
;$$& '
combinedHash'' 
+='' 
hash''  
*''! "
factor''# )
;'') *
return)) 
combinedHash)) 
;))  
}** 	
public-- 
static-- 
int-- 
ComputeHashCode-- )
(--) *
object--* 0
obj--1 4
)--4 5
{.. 	
return// 
obj// 
!=// 
null// 
?//  
obj//! $
.//$ %
GetHashCode//% 0
(//0 1
)//1 2
://3 4
	nullValue//5 >
;//> ?
}00 	
public33 
static33 
int33 
ComputeHashCode33 )
(33) *
params33* 0
object331 7
[337 8
]338 9
objs33: >
)33> ?
{44 	
int55 
hash55 
=55 
	initValue55  
;55  !
if66 
(66 
objs66 
!=66 
null66 
)66 
{77 
foreach88 
(88 
object88 
obj88  #
in88$ &
objs88' +
)88+ ,
{99 
hash:: 
=:: 
hash:: 
*::  !
factor::" (
+::) *
(::+ ,
obj::, /
!=::0 2
null::3 7
?::8 9
obj::: =
.::= >
GetHashCode::> I
(::I J
)::J K
:::L M
	nullValue::N W
)::W X
;::X Y
};; 
}<< 
return== 
hash== 
;== 
}>> 	
publicAA 
staticAA 
intAA 
ComputeHashCodeAA )
(AA) *
IEnumerableAA* 5

enumerableAA6 @
)AA@ A
{BB 	
intCC 
hashCC 
=CC 
	initValueCC  
;CC  !
foreachDD 
(DD 
objectDD 
itemDD  
inDD! #

enumerableDD$ .
)DD. /
{EE 
hashFF 
=FF 
hashFF 
*FF 
factorFF $
+FF% &
(FF' (
itemFF( ,
!=FF- /
nullFF0 4
?FF5 6
itemFF7 ;
.FF; <
GetHashCodeFF< G
(FFG H
)FFH I
:FFJ K
	nullValueFFL U
)FFU V
;FFV W
}GG 
returnHH 
hashHH 
;HH 
}II 	
privateMM 
constMM 
intMM 
	nullValueMM #
=MM$ %
$numMM& '
;MM' (
privateNN 
constNN 
intNN 
	initValueNN #
=NN$ %
$numNN& '
;NN' (
privateOO 
constOO 
intOO 
factorOO  
=OO! "
$numOO# %
;OO% &
}QQ 
}SS �.
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Hour.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Hour 
: 

{ 
public 
Hour 
( 
) 
: 
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 
Hour 
( 

calendar" *
)* +
:, -
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{ 	
} 	
public 
Hour 
( 
DateTime 
moment #
)# $
:% &
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{   	
}!! 	
public$$ 
Hour$$ 
($$ 
DateTime$$ 
moment$$ #
,$$# $

calendar$$3 ;
)$$; <
:$$= >
this%% 
(%% 
calendar%% 
.%% 
GetYear%% !
(%%! "
moment%%" (
)%%( )
,%%) *
calendar%%+ 3
.%%3 4
GetMonth%%4 <
(%%< =
moment%%= C
)%%C D
,%%D E
calendar&& 
.&& 

(&&& '
moment&&' -
)&&- .
,&&. /
calendar&&0 8
.&&8 9
GetHour&&9 @
(&&@ A
moment&&A G
)&&G H
,&&H I
calendar&&J R
)&&R S
{'' 	
}(( 	
public++ 
Hour++ 
(++ 
int++ 
year++ 
,++ 
int++ !
month++" '
,++' (
int++) ,
day++- 0
,++0 1
int++2 5
hour++6 :
)++: ;
:++< =
this,, 
(,, 
year,, 
,,, 
month,, 
,,, 
day,, !
,,,! "
hour,,# '
,,,' (
new,,) ,
TimeCalendar,,- 9
(,,9 :
),,: ;
),,; <
{-- 	
}.. 	
public11 
Hour11 
(11 
int11 
year11 
,11 
int11 !
month11" '
,11' (
int11) ,
day11- 0
,110 1
int112 5
hour116 :
,11: ;

calendar11J R
)11R S
:11T U
base22 
(22 
year22 
,22 
month22 
,22 
day22 !
,22! "
hour22# '
,22' (
$num22) *
,22* +
calendar22, 4
)224 5
{33 	
}44 	
public77 
int77 
Year77 
{88 	
get99 
{99 
return99 
	StartYear99 "
;99" #
}99$ %
}:: 	
public== 
int== 
Month== 
{>> 	
get?? 
{?? 
return?? 

StartMonth?? #
;??# $
}??% &
}@@ 	
publicCC 
intCC 
DayCC 
{DD 	
getEE 
{EE 
returnEE 
StartDayEE !
;EE! "
}EE# $
}FF 	
publicII 
intII 
	HourValueII 
{JJ 	
getKK 
{KK 
returnKK 
	StartHourKK "
;KK" #
}KK$ %
}LL 	
publicOO 
HourOO 
GetPreviousHourOO #
(OO# $
)OO$ %
{PP 	
returnQQ 
AddHoursQQ 
(QQ 
-QQ 
$numQQ 
)QQ 
;QQ  
}RR 	
publicUU 
HourUU 
GetNextHourUU 
(UU  
)UU  !
{VV 	
returnWW 
AddHoursWW 
(WW 
$numWW 
)WW 
;WW 
}XX 	
public[[ 
Hour[[ 
AddHours[[ 
([[ 
int[[  
hours[[! &
)[[& '
{\\ 	
DateTime]] 
	startHour]] 
=]]  
new]]! $
DateTime]]% -
(]]- .
	StartYear]]. 7
,]]7 8

StartMonth]]9 C
,]]C D
StartDay]]E M
,]]M N
	StartHour]]O X
,]]X Y
$num]]Z [
,]][ \
$num]]] ^
)]]^ _
;]]_ `
return^^ 
new^^ 
Hour^^ 
(^^ 
	startHour^^ %
.^^% &
AddHours^^& .
(^^. /
hours^^/ 4
)^^4 5
,^^5 6
Calendar^^7 ?
)^^? @
;^^@ A
}__ 	
	protectedbb 
overridebb 
stringbb !
Formatbb" (
(bb( )
ITimeFormatterbb) 7
	formatterbb8 A
)bbA B
{cc 	
returndd 
	formatterdd 
.dd 
GetCalendarPerioddd .
(dd. /
	formatterdd/ 8
.dd8 9
GetShortDatedd9 E
(ddE F
StartddF K
)ddK L
,ddL M
	formatteree 
.ee 
GetShortTimeee &
(ee& '
Startee' ,
)ee, -
,ee- .
	formatteree/ 8
.ee8 9
GetShortTimeee9 E
(eeE F
EndeeF I
)eeI J
,eeJ K
DurationeeL T
)eeT U
;eeU V
}ff 	
}hh 
}jj �
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\HourRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
	HourRange 
{ 
public 
	HourRange 
( 
int 
hour !
)! "
:# $
this 
( 
hour 
, 
hour 
) 
{ 	
} 	
public 
	HourRange 
( 
int 
	startHour &
,& '
int( +
endHour, 3
)3 4
:5 6
this 
( 
new 
Time 
( 
	startHour #
)# $
,$ %
new& )
Time* .
(. /
endHour/ 6
)6 7
)7 8
{ 	
} 	
public 
	HourRange 
( 
Time 
start #
,# $
Time% )
end* -
)- .
{ 	
if   
(   
start   
.   
Ticks   
<=   
end   "
.  " #
Ticks  # (
)  ( )
{!! 
this"" 
."" 
start"" 
="" 
start"" "
;""" #
this## 
.## 
end## 
=## 
end## 
;## 
}$$ 
else%% 
{&& 
this'' 
.'' 
end'' 
='' 
start''  
;''  !
this(( 
.(( 
start(( 
=(( 
end((  
;((  !
})) 
}** 	
public-- 
Time-- 
Start-- 
{.. 	
get// 
{// 
return// 
start// 
;// 
}//  !
}00 	
public33 
Time33 
End33 
{44 	
get55 
{55 
return55 
end55 
;55 
}55 
}66 	
public99 
bool99 
IsMoment99 
{:: 	
get;; 
{;; 
return;; 
start;; 
.;; 
Equals;; %
(;;% &
end;;& )
);;) *
;;;* +
};;, -
}<< 	
public?? 
override?? 
string?? 
ToString?? '
(??' (
)??( )
{@@ 	
returnAA 
startAA 
+AA 
$strAA  
+AA! "
endAA# &
;AA& '
}BB 	
privateFF 
readonlyFF 
TimeFF 
startFF #
;FF# $
privateGG 
readonlyGG 
TimeGG 
endGG !
;GG! "
}II 
}KK �(
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Hours.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Hours 
: 

{ 
public 
Hours 
( 
DateTime 
moment $
,$ %
int& )
count* /
)/ 0
:1 2
this 
( 
moment 
, 
count 
, 
new  #
TimeCalendar$ 0
(0 1
)1 2
)2 3
{ 	
} 	
public 
Hours 
( 
DateTime 
moment $
,$ %
int& )
count* /
,/ 0

calendar? G
)G H
:I J
this 
( 
calendar 
. 
GetYear !
(! "
moment" (
)( )
,) *
calendar+ 3
.3 4
GetMonth4 <
(< =
moment= C
)C D
,D E
calendar 
. 

(& '
moment' -
)- .
,. /
calendar0 8
.8 9
GetHour9 @
(@ A
momentA G
)G H
,H I
countJ O
,O P
calendarQ Y
)Y Z
{ 	
} 	
public 
Hours 
( 
int 
	startYear "
," #
int$ '

startMonth( 2
,2 3
int4 7
startDay8 @
,@ A
intB E
hourF J
,J K
intL O
	hourCountP Y
)Y Z
:[ \
this   
(   
	startYear   
,   

startMonth   &
,  & '
startDay  ( 0
,  0 1
hour  2 6
,  6 7
	hourCount  8 A
,  A B
new  C F
TimeCalendar  G S
(  S T
)  T U
)  U V
{!! 	
}"" 	
public%% 
Hours%% 
(%% 
int%% 
	startYear%% "
,%%" #
int%%$ '

startMonth%%( 2
,%%2 3
int%%4 7
startDay%%8 @
,%%@ A
int%%B E
hour%%F J
,%%J K
int%%L O
	hourCount%%P Y
,%%Y Z

calendar%%i q
)%%q r
:%%s t
base&& 
(&& 
	startYear&& 
,&& 

startMonth&& &
,&&& '
startDay&&( 0
,&&0 1
hour&&2 6
,&&6 7
	hourCount&&8 A
,&&A B
calendar&&C K
)&&K L
{'' 	
}(( 	
public++ !
ITimePeriodCollection++ $
GetHours++% -
(++- .
)++. /
{,, 	 
TimePeriodCollection--  
hours--! &
=--' (
new--) , 
TimePeriodCollection--- A
(--A B
)--B C
;--C D
DateTime.. 
	startHour.. 
=..  
new..! $
DateTime..% -
(..- .
	StartYear... 7
,..7 8

StartMonth..9 C
,..C D
StartDay..E M
,..M N
	StartHour..O X
,..X Y
$num..Z [
,..[ \
$num..] ^
)..^ _
;.._ `
for// 
(// 
int// 
i// 
=// 
$num// 
;// 
i// 
<// 
	HourCount//  )
;//) *
i//+ ,
++//, .
)//. /
{00 
hours11 
.11 
Add11 
(11 
new11 
Hour11 "
(11" #
	startHour11# ,
.11, -
AddHours11- 5
(115 6
i116 7
)117 8
,118 9
Calendar11: B
)11B C
)11C D
;11D E
}22 
return33 
hours33 
;33 
}44 	
	protected77 
override77 
string77 !
Format77" (
(77( )
ITimeFormatter77) 7
	formatter778 A
)77A B
{88 	
return99 
	formatter99 
.99 
GetCalendarPeriod99 .
(99. /
	formatter99/ 8
.998 9
GetShortDate999 E
(99E F
Start99F K
)99K L
,99L M
	formatter99N W
.99W X
GetShortDate99X d
(99d e
End99e h
)99h i
,99i j
	formatter:: 
.:: 
GetShortTime:: &
(::& '
Start::' ,
)::, -
,::- .
	formatter::/ 8
.::8 9
GetShortTime::9 E
(::E F
End::F I
)::I J
,::J K
Duration::L T
)::T U
;::U V
};; 	
}== 
}?? �G
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\HourTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 

:( )
CalendarTimeRange* ;
{ 
	protected 

(  
int  #
	startYear$ -
,- .
int/ 2

startMonth3 =
,= >
int? B
startDayC K
,K L
intM P
	startHourQ Z
,Z [
int\ _
	hourCount` i
)i j
:k l
this 
( 
	startYear 
, 

startMonth &
,& '
startDay( 0
,0 1
	startHour2 ;
,; <
	hourCount= F
,F G
newH K
TimeCalendarL X
(X Y
)Y Z
)Z [
{ 	
} 	
	protected 

(  
int  #
	startYear$ -
,- .
int/ 2

startMonth3 =
,= >
int? B
startDayC K
,K L
intM P
	startHourQ Z
,Z [
int\ _
	hourCount` i
,i j

calendar	y �
)
� �
:
� �
base 
( 
GetPeriodOf 
( 
	startYear &
,& '

startMonth( 2
,2 3
startDay4 <
,< =
	startHour> G
,G H
	hourCountI R
)R S
,S T
calendarU ]
)] ^
{ 	
this 
. 
	startHour 
= 
new  
DateTime! )
() *
	startYear* 3
,3 4

startMonth5 ?
,? @
startDayA I
,I J
	startHourK T
,T U
$numV W
,W X
$numY Z
)Z [
;[ \
this 
. 
	hourCount 
= 
	hourCount &
;& '
endHour 
= 
this 
. 
	startHour $
.$ %
AddHours% -
(- .
	hourCount. 7
)7 8
;8 9
} 	
public!! 
int!! 
	StartYear!! 
{"" 	
get## 
{## 
return## 
	startHour## "
.##" #
Year### '
;##' (
}##) *
}$$ 	
public'' 
int'' 

StartMonth'' 
{(( 	
get)) 
{)) 
return)) 
	startHour)) "
.))" #
Month))# (
;))( )
}))* +
}** 	
public-- 
int-- 
StartDay-- 
{.. 	
get// 
{// 
return// 
	startHour// "
.//" #
Day//# &
;//& '
}//( )
}00 	
public33 
int33 
	StartHour33 
{44 	
get55 
{55 
return55 
	startHour55 "
.55" #
Hour55# '
;55' (
}55) *
}66 	
public99 
int99 
EndYear99 
{:: 	
get;; 
{;; 
return;; 
endHour;;  
.;;  !
Year;;! %
;;;% &
};;' (
}<< 	
public?? 
int?? 
EndMonth?? 
{@@ 	
getAA 
{AA 
returnAA 
endHourAA  
.AA  !
MonthAA! &
;AA& '
}AA( )
}BB 	
publicEE 
intEE 
EndDayEE 
{FF 	
getGG 
{GG 
returnGG 
endHourGG  
.GG  !
DayGG! $
;GG$ %
}GG& '
}HH 	
publicKK 
intKK 
EndHourKK 
{LL 	
getMM 
{MM 
returnMM 
endHourMM  
.MM  !
HourMM! %
;MM% &
}MM' (
}NN 	
publicQQ 
intQQ 
	HourCountQQ 
{RR 	
getSS 
{SS 
returnSS 
	hourCountSS "
;SS" #
}SS$ %
}TT 	
publicWW !
ITimePeriodCollectionWW $

GetMinutesWW% /
(WW/ 0
)WW0 1
{XX 	 
TimePeriodCollectionYY  
minutesYY! (
=YY) *
newYY+ . 
TimePeriodCollectionYY/ C
(YYC D
)YYD E
;YYE F
forZZ 
(ZZ 
intZZ 
hourZZ 
=ZZ 
$numZZ 
;ZZ 
hourZZ #
<ZZ$ %
	hourCountZZ& /
;ZZ/ 0
hourZZ1 5
++ZZ5 7
)ZZ7 8
{[[ 
DateTime\\ 
curHour\\  
=\\! "
	startHour\\# ,
.\\, -
AddHours\\- 5
(\\5 6
hour\\6 :
)\\: ;
;\\; <
for]] 
(]] 
int]] 
minute]] 
=]]  !
$num]]" #
;]]# $
minute]]% +
<]], -
TimeSpec]]. 6
.]]6 7
MinutesPerHour]]7 E
;]]E F
minute]]G M
++]]M O
)]]O P
{^^ 
minutes__ 
.__ 
Add__ 
(__  
new__  #
Minute__$ *
(__* +
curHour__+ 2
.__2 3

AddMinutes__3 =
(__= >
minute__> D
)__D E
,__E F
Calendar__G O
)__O P
)__P Q
;__Q R
}`` 
}aa 
returnbb 
minutesbb 
;bb 
}cc 	
	protectedff 
overrideff 
boolff 
IsEqualff  '
(ff' (
objectff( .
objff/ 2
)ff2 3
{gg 	
returnhh 
basehh 
.hh 
IsEqualhh 
(hh  
objhh  #
)hh# $
&&hh% '
HasSameDatahh( 3
(hh3 4
objhh4 7
ashh8 :

)hhH I
;hhI J
}ii 	
privatell 
boolll 
HasSameDatall  
(ll  !

compll/ 3
)ll3 4
{mm 	
returnnn 
	startHournn 
==nn 
compnn  $
.nn$ %
	startHournn% .
&&nn/ 1
	hourCountnn2 ;
==nn< >
compnn? C
.nnC D
	hourCountnnD M
&&nnN P
endHournnQ X
==nnY [
compnn\ `
.nn` a
endHournna h
;nnh i
}oo 	
	protectedrr 
overriderr 
intrr 
ComputeHashCoderr .
(rr. /
)rr/ 0
{ss 	
returntt 
HashTooltt 
.tt 
ComputeHashCodett +
(tt+ ,
basett, 0
.tt0 1
ComputeHashCodett1 @
(tt@ A
)ttA B
,ttB C
	startHourttD M
,ttM N
	hourCountttO X
,ttX Y
endHourttZ a
)tta b
;ttb c
}uu 	
privatexx 
staticxx 
	TimeRangexx  
GetPeriodOfxx! ,
(xx, -
intxx- 0
yearxx1 5
,xx5 6
intxx7 :
monthxx; @
,xx@ A
intxxB E
dayxxF I
,xxI J
intxxK N
hourxxO S
,xxS T
intxxU X
	hourCountxxY b
)xxb c
{yy 	
ifzz 
(zz 
	hourCountzz 
<zz 
$numzz 
)zz 
{{{ 
throw|| 
new|| '
ArgumentOutOfRangeException|| 5
(||5 6
$str||6 A
)||A B
;||B C
}}} 
DateTime 
start 
= 
new  
DateTime! )
() *
year* .
,. /
month0 5
,5 6
day7 :
,: ;
hour< @
,@ A
$numB C
,C D
$numE F
)F G
;G H
DateTime
�� 
end
�� 
=
�� 
start
��  
.
��  !
AddHours
��! )
(
��) *
	hourCount
��* 3
)
��3 4
;
��4 5
return
�� 
new
�� 
	TimeRange
��  
(
��  !
start
��! &
,
��& '
end
��( +
)
��+ ,
;
��, -
}
�� 	
private
�� 
readonly
�� 
DateTime
�� !
	startHour
��" +
;
��+ ,
private
�� 
readonly
�� 
int
�� 
	hourCount
�� &
;
��& '
private
�� 
readonly
�� 
DateTime
�� !
endHour
��" )
;
��) *
}
�� 
}�� �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ICalendarPeriodCollectorFilter.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface *
ICalendarPeriodCollectorFilter 3
:4 5"
ICalendarVisitorFilter6 L
{ 
IList 
<

MonthRange 
> 
CollectingMonths *
{+ ,
get- 0
;0 1
}2 3
IList 
<
DayRange 
> 
CollectingDays &
{' (
get) ,
;, -
}. /
IList 
<
	HourRange 
> 
CollectingHours (
{) *
get+ .
;. /
}0 1
} 
} �
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ICalendarTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
ICalendarTimeRange '
:( )

ITimeRange* 4
{ 

Calendar 
{  
get! $
;$ %
}& '
} 
} �
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ICalendarVisitorContext.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface #
ICalendarVisitorContext ,
{ 
} 
} �
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ICalendarVisitorFilter.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface "
ICalendarVisitorFilter +
{ !
ITimePeriodCollection 
ExcludePeriods ,
{- .
get/ 2
;2 3
}4 5
IList 
<
int 
> 
Years 
{ 
get 
; 
}  !
IList 
<
	YearMonth 
> 
Months 
{  !
get" %
;% &
}' (
IList 
<
int 
> 
Days 
{ 
get 
; 
}  
IList 
<
	DayOfWeek 
> 
WeekDays !
{" #
get$ '
;' (
}) *
IList!! 
<!!
int!! 
>!! 
Hours!! 
{!! 
get!! 
;!! 
}!!  !
void$$ 
AddWorkingWeekDays$$
($$  
)$$  !
;$$! "
void'' 
AddWeekendWeekDays''
(''  
)''  !
;''! "
void** 
Clear**
(** 
)** 
;** 
},, 
}.. �
gF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\IClock.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
IClock 
{ 
DateTime 
Now 
{ 
get 
; 
} 
} 
} �
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\IDateTimeSet.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
IDateTimeSet !
:" #
ICollection$ /
</ 0
DateTime0 8
>8 9
{ 
DateTime 
this 
[ 
int 
index 
]  
{! "
get# &
;& '
}( )
DateTime 
? 
Min 
{ 
get 
; 
} 
DateTime 
? 
Max 
{ 
get 
; 
} 
TimeSpan 
? 
Duration 
{ 
get  
;  !
}" #
bool 
IsEmpty
{ 
get 
; 
} 
bool!! 
IsMoment!!
{!! 
get!! 
;!! 
}!! 
bool$$ 
	IsAnytime$$
{$$ 
get$$ 
;$$ 
}$$ 
int'' 
IndexOf'' 
('' 
DateTime'' 
moment'' #
)''# $
;''$ %
new** 
bool** 
Add** 
(** 
DateTime** 
moment** $
)**$ %
;**% &
void-- 
AddAll--
(-- 
IEnumerable-- 
<--  
DateTime--  (
>--( )
moments--* 1
)--1 2
;--2 3
IList00 
<00
TimeSpan00 
>00 
GetDurations00 $
(00$ %
int00% (

startIndex00) 3
,003 4
int005 8
count009 >
)00> ?
;00? @
DateTime33 
?33 
FindPrevious33 
(33 
DateTime33 '
moment33( .
)33. /
;33/ 0
DateTime66 
?66 
FindNext66 
(66 
DateTime66 #
moment66$ *
)66* +
;66+ ,
}88 
}:: �
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\IDurationProvider.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
IDurationProvider &
{ 
TimeSpan 
GetDuration 
( 
DateTime %
start& +
,+ ,
DateTime- 5
end6 9
)9 :
;: ;
} 
} �
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\IntervalEdge.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 
IntervalEdge 
{ 
Closed 
, 
Open 
, 
} 
} �
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\InvalidMomentException.cs
	namespace
Phoenix
 
.
CrossCutting
.

TimePeriod
{ 
public 

class "
InvalidMomentException '
:( )
	Exception* 3
{ 
public "
InvalidMomentException %
(% &
DateTime& .
moment/ 5
)5 6
{ 	
this 
. 
moment 
= 
moment  
;  !
} 	
public "
InvalidMomentException %
(% &
DateTime& .
moment/ 5
,5 6
string7 =
message> E
)E F
:G H
base 
( 
message 
) 
{   	
this!! 
.!! 
moment!! 
=!! 
moment!!  
;!!  !
}"" 	
public%% "
InvalidMomentException%% %
(%%% &
DateTime%%& .
moment%%/ 5
,%%5 6
	Exception%%7 @
cause%%A F
)%%F G
:%%H I
base&& 
(&& 
cause&& 
.&& 
Message&& 
,&& 
cause&&  %
)&&% &
{'' 	
this(( 
.(( 
moment(( 
=(( 
moment((  
;((  !
})) 	
public,, "
InvalidMomentException,, %
(,,% &
DateTime,,& .
moment,,/ 5
,,,5 6
string,,7 =
message,,> E
,,,E F
	Exception,,G P
cause,,Q V
),,V W
:,,X Y
base-- 
(-- 
message-- 
,-- 
cause-- 
)--  
{.. 	
this// 
.// 
moment// 
=// 
moment//  
;//  !
}00 	
publicCC 
DateTimeCC 
MomentCC 
{DD 	
getEE 
{EE 
returnEE 
momentEE 
;EE  
}EE! "
}FF 	
privateJJ 
readonlyJJ 
DateTimeJJ !
momentJJ" (
;JJ( )
}LL 
}NN �
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeBlock.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 

ITimeBlock 
:  !
ITimePeriod" -
{ 
new 
DateTime 
Start 
{ 
get  
;  !
set" %
;% &
}' (
new 
DateTime 
End 
{ 
get 
; 
set  #
;# $
}% &
new 
TimeSpan 
Duration 
{ 
get  #
;# $
set% (
;( )
}* +
void 
Setup
( 
DateTime 
newStart $
,$ %
TimeSpan& .
newDuration/ :
): ;
;; <
void 
Move
( 
TimeSpan 
delta  
)  !
;! "
void!! 
DurationFromStart!!
(!! 
TimeSpan!! '
newDuration!!( 3
)!!3 4
;!!4 5
void$$ 
DurationFromEnd$$
($$ 
TimeSpan$$ %
newDuration$$& 1
)$$1 2
;$$2 3

ITimeBlock'' 
Copy'' 
('' 
TimeSpan''  
delta''! &
)''& '
;''' (

ITimeBlock** 
GetPreviousPeriod** $
(**$ %
TimeSpan**% -
offset**. 4
)**4 5
;**5 6

ITimeBlock-- 

(--  !
TimeSpan--! )
offset--* 0
)--0 1
;--1 2

ITimeBlock00 
GetIntersection00 "
(00" #
ITimePeriod00# .
period00/ 5
)005 6
;006 7
}22 
}44 �#
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeCalendar.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

	interface 

:# $
ITimePeriodMapper% 6
{ 
CultureInfo 
Culture 
{ 
get !
;! "
}# $
YearType 
YearType 
{ 
get 
;  
}! "
TimeSpan 
StartOffset 
{ 
get "
;" #
}$ %
TimeSpan 
	EndOffset 
{ 
get  
;  !
}" #
	YearMonth 

{  !
get" %
;% &
}' (
	YearMonth"" 
FiscalYearBaseMonth"" %
{""& '
get""( +
;""+ ,
}""- .
	DayOfWeek%%  
FiscalFirstDayOfYear%% &
{%%' (
get%%) ,
;%%, -
}%%. /
FiscalYearAlignment(( 
FiscalYearAlignment(( /
{((0 1
get((2 5
;((5 6
}((7 8!
FiscalQuarterGrouping++ !
FiscalQuarterGrouping++ 3
{++4 5
get++6 9
;++9 :
}++; <
	DayOfWeek.. 
FirstDayOfWeek..  
{..! "
get..# &
;..& '
}..( )
YearWeekType11 
YearWeekType11 !
{11" #
get11$ '
;11' (
}11) *
int44 
GetYear44 
(44 
DateTime44 
time44 !
)44! "
;44" #
int77 
GetMonth77 
(77 
DateTime77 
time77 "
)77" #
;77# $
int:: 
GetHour:: 
(:: 
DateTime:: 
time:: !
)::! "
;::" #
int== 
	GetMinute== 
(== 
DateTime== 
time== #
)==# $
;==$ %
int@@ 

(@@ 
DateTime@@ "
time@@# '
)@@' (
;@@( )
	DayOfWeekCC 
GetDayOfWeekCC 
(CC 
DateTimeCC '
timeCC( ,
)CC, -
;CC- .
intFF 
GetDaysInMonthFF 
(FF 
intFF 
yearFF #
,FF# $
intFF% (
monthFF) .
)FF. /
;FF/ 0
intII 
GetYearII 
(II 
intII 
yearII 
,II 
intII !
monthII" '
)II' (
;II( )
stringLL 
GetYearNameLL 
(LL 
intLL 
yearLL #
)LL# $
;LL$ %
stringOO 
GetHalfyearNameOO 
(OO 
YearHalfyearOO +
yearHalfyearOO, 8
)OO8 9
;OO9 :
stringRR !
GetHalfyearOfYearNameRR $
(RR$ %
intRR% (
yearRR) -
,RR- .
YearHalfyearRR/ ;
yearHalfyearRR< H
)RRH I
;RRI J
stringUU 
GetQuarterNameUU 
(UU 
YearQuarterUU )
yearQuarterUU* 5
)UU5 6
;UU6 7
stringXX  
GetQuarterOfYearNameXX #
(XX# $
intXX$ '
yearXX( ,
,XX, -
YearQuarterXX. 9
yearQuarterXX: E
)XXE F
;XXF G
string[[ 
GetMonthName[[ 
([[ 
int[[ 
month[[  %
)[[% &
;[[& '
string^^ 
GetMonthOfYearName^^ !
(^^! "
int^^" %
year^^& *
,^^* +
int^^, /
month^^0 5
)^^5 6
;^^6 7
stringaa 
GetWeekOfYearNameaa  
(aa  !
intaa! $
yearaa% )
,aa) *
intaa+ .

weekOfYearaa/ 9
)aa9 :
;aa: ;
stringdd 

GetDayNamedd 
(dd 
	DayOfWeekdd #
	dayOfWeekdd$ -
)dd- .
;dd. /
intgg 

(gg 
DateTimegg "
timegg# '
)gg' (
;gg( )
DateTimejj 
GetStartOfYearWeekjj #
(jj# $
intjj$ '
yearjj( ,
,jj, -
intjj. 1

weekOfYearjj2 <
)jj< =
;jj= >
}ll 
}nn �/
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeFormatter.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

	interface 
ITimeFormatter #
{ 
CultureInfo 
Culture 
{ 
get !
;! "
}# $
string 

{ 
get "
;" #
}$ %
string 
ContextSeparator 
{  !
get" %
;% &
}' (
string 
StartEndSeparator  
{! "
get# &
;& '
}( )
string 
DurationSeparator  
{! "
get# &
;& '
}( )
string"" !
DurationItemSeparator"" $
{""% &
get""' *
;""* +
}"", -
string%% %
DurationLastItemSeparator%% (
{%%) *
get%%+ .
;%%. /
}%%0 1
string(( "
DurationValueSeparator(( %
{((& '
get((( +
;((+ ,
}((- .
string++ 
IntervalStartClosed++ "
{++# $
get++% (
;++( )
}++* +
string.. 
IntervalStartOpen..  
{..! "
get..# &
;..& '
}..( )
string11  
IntervalStartOpenIso11 #
{11$ %
get11& )
;11) *
}11+ ,
string44 
IntervalEndClosed44  
{44! "
get44# &
;44& '
}44( )
string77 
IntervalEndOpen77 
{77  
get77! $
;77$ %
}77& '
string:: 
IntervalEndOpenIso:: !
{::" #
get::$ '
;::' (
}::) *
string== 
DateTimeFormat== 
{== 
get==  #
;==# $
}==% &
string@@ 
ShortDateFormat@@ 
{@@  
get@@! $
;@@$ %
}@@& '
stringCC 
LongTimeFormatCC 
{CC 
getCC  #
;CC# $
}CC% &
stringFF 
ShortTimeFormatFF 
{FF  
getFF! $
;FF$ %
}FF& '
DurationFormatTypeII 
DurationTypeII '
{II( )
getII* -
;II- .
}II/ 0
boolLL 
UseDurationSecondsLL
{LL  !
getLL" %
;LL% &
}LL' (
stringOO 

(OO 
intOO  
countOO! &
)OO& '
;OO' (
stringRR 
GetCollectionPeriodRR "
(RR" #
intRR# &
countRR' ,
,RR, -
DateTimeRR. 6
startRR7 <
,RR< =
DateTimeRR> F
endRRG J
,RRJ K
TimeSpanRRL T
durationRRU ]
)RR] ^
;RR^ _
stringUU 
GetDateTimeUU 
(UU 
DateTimeUU #
dateTimeUU$ ,
)UU, -
;UU- .
stringXX 
GetShortDateXX 
(XX 
DateTimeXX $
dateTimeXX% -
)XX- .
;XX. /
string[[ 
GetLongTime[[ 
([[ 
DateTime[[ #
dateTime[[$ ,
)[[, -
;[[- .
string^^ 
GetShortTime^^ 
(^^ 
DateTime^^ $
dateTime^^% -
)^^- .
;^^. /
stringaa 
	GetPeriodaa 
(aa 
DateTimeaa !
startaa" '
,aa' (
DateTimeaa) 1
endaa2 5
)aa5 6
;aa6 7
stringdd 
GetDurationdd 
(dd 
TimeSpandd #
timeSpandd$ ,
)dd, -
;dd- .
stringgg 
GetDurationgg 
(gg 
TimeSpangg #
timeSpangg$ ,
,gg, -
DurationFormatTypegg. @
durationFormatTypeggA S
)ggS T
;ggT U
stringjj 
GetDurationjj 
(jj 
intjj 
yearsjj $
,jj$ %
intjj& )
monthsjj* 0
,jj0 1
intjj2 5
daysjj6 :
,jj: ;
intjj< ?
hoursjj@ E
,jjE F
intjjG J
minutesjjK R
,jjR S
intjjT W
secondsjjX _
)jj_ `
;jj` a
stringmm 
	GetPeriodmm 
(mm 
DateTimemm !
startmm" '
,mm' (
DateTimemm) 1
endmm2 5
,mm5 6
TimeSpanmm7 ?
durationmm@ H
)mmH I
;mmI J
stringpp 
GetIntervalpp 
(pp 
DateTimepp #
startpp$ )
,pp) *
DateTimepp+ 3
endpp4 7
,pp7 8
IntervalEdgepp9 E
	startEdgeppF O
,ppO P
IntervalEdgeppQ ]
endEdgepp^ e
,ppe f
TimeSpanppg o
durationppp x
)ppx y
;ppy z
stringss 
GetCalendarPeriodss  
(ss  !
stringss! '
startss( -
,ss- .
stringss/ 5
endss6 9
,ss9 :
TimeSpanss; C
durationssD L
)ssL M
;ssM N
stringvv 
GetCalendarPeriodvv  
(vv  !
stringvv! '
contextvv( /
,vv/ 0
stringvv1 7
startvv8 =
,vv= >
stringvv? E
endvvF I
,vvI J
TimeSpanvvK S
durationvvT \
)vv\ ]
;vv] ^
stringyy 
GetCalendarPeriodyy  
(yy  !
stringyy! '
startContextyy( 4
,yy4 5
stringyy6 <

endContextyy= G
,yyG H
stringyyI O
startyyP U
,yyU V
stringyyW ]
endyy^ a
,yya b
TimeSpanyyc k
durationyyl t
)yyt u
;yyu v
}{{ 
}}} �
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeInterval.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 

:# $
ITimePeriod% 0
{ 
bool 
IsStartOpen
{ 
get 
; 
}  !
bool 
	IsEndOpen
{ 
get 
; 
} 
bool 
IsOpen
{ 
get 
; 
} 
bool 

{ 
get  
;  !
}" #
bool 
IsEndClosed
{ 
get 
; 
}  !
bool!! 
IsClosed!!
{!! 
get!! 
;!! 
}!! 
bool$$ 
IsEmpty$$
{$$ 
get$$ 
;$$ 
}$$ 
bool'' 
IsDegenerate''
{'' 
get'' 
;''  
}''! "
bool** 
IsIntervalEnabled**
{**  
get**! $
;**$ %
}**& '
DateTime-- 

{--  
get--! $
;--$ %
set--& )
;--) *
}--+ ,
DateTime00 
EndInterval00 
{00 
get00 "
;00" #
set00$ '
;00' (
}00) *
IntervalEdge33 
	StartEdge33 
{33  
get33! $
;33$ %
set33& )
;33) *
}33+ ,
IntervalEdge66 
EndEdge66 
{66 
get66 "
;66" #
set66$ '
;66' (
}66) *
void99 
Move99
(99 
TimeSpan99 
offset99 !
)99! "
;99" #
void<< 

(<< 
DateTime<< #
moment<<$ *
)<<* +
;<<+ ,
void?? 
ExpandEndTo??
(?? 
DateTime?? !
moment??" (
)??( )
;??) *
voidBB 
ExpandToBB
(BB 
DateTimeBB 
momentBB %
)BB% &
;BB& '
voidEE 
ExpandToEE
(EE 
ITimePeriodEE !
periodEE" (
)EE( )
;EE) *
voidHH 

(HH 
DateTimeHH #
momentHH$ *
)HH* +
;HH+ ,
voidKK 
ShrinkEndToKK
(KK 
DateTimeKK !
momentKK" (
)KK( )
;KK) *
voidNN 
ShrinkToNN
(NN 
ITimePeriodNN !
periodNN" (
)NN( )
;NN) *

CopyQQ 
(QQ 
TimeSpanQQ #
offsetQQ$ *
)QQ* +
;QQ+ ,
}SS 
}UU �	
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeLine.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
	ITimeLine 
{  
ITimePeriodContainer 
Periods $
{% &
get' *
;* +
}, -
ITimePeriod 
Limits 
{ 
get  
;  !
}" #
ITimePeriodMapper 
PeriodMapper &
{' (
get) ,
;, -
}. /
bool 
HasOverlaps
( 
) 
; 
bool 
HasGaps
( 
) 
; !
ITimePeriodCollection!! 
CombinePeriods!! ,
(!!, -
)!!- .
;!!. /!
ITimePeriodCollection$$ 
IntersectPeriods$$ .
($$. /
bool$$/ 3
combinePeriods$$4 B
)$$B C
;$$C D!
ITimePeriodCollection'' 

(''+ ,
)'', -
;''- .
})) 
}++ �	
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeLineMoment.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
ITimeLineMoment $
{ 
DateTime 
Moment 
{ 
get 
; 
}  
int 
BalanceCount 
{ 
get 
; 
}  !
int 

StartCount 
{ 
get 
; 
} 
int 
EndCount 
{ 
get 
; 
} 
bool 
IsEmpty
{ 
get 
; 
} 
void!! 
AddStart!!
(!! 
)!! 
;!! 
void$$ 
RemoveStart$$
($$ 
)$$ 
;$$ 
void'' 
AddEnd''
('' 
)'' 
;'' 
void** 
	RemoveEnd**
(** 
)** 
;** 
},, 
}.. �
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeLineMomentCollection.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface %
ITimeLineMomentCollection .
:/ 0
IEnumerable1 <
<< =
ITimeLineMoment= L
>L M
{ 
int 
Count 
{ 
get 
; 
} 
bool 
IsEmpty
{ 
get 
; 
} 
ITimeLineMoment 
Min 
{ 
get !
;! "
}# $
ITimeLineMoment 
Max 
{ 
get !
;! "
}# $
ITimeLineMoment 
this 
[ 
int  
index! &
]& '
{( )
get* -
;- .
}/ 0
ITimeLineMoment!! 
this!! 
[!! 
DateTime!! %
moment!!& ,
]!!, -
{!!. /
get!!0 3
;!!3 4
}!!5 6
void$$ 
Add$$
($$ 
ITimePeriod$$ 
period$$ #
)$$# $
;$$$ %
void'' 
AddAll''
('' 
IEnumerable'' 
<''  
ITimePeriod''  +
>''+ ,
periods''- 4
)''4 5
;''5 6
void** 
Remove**
(** 
ITimePeriod** 
period**  &
)**& '
;**' (
ITimeLineMoment-- 
Find-- 
(-- 
DateTime-- %
moment--& ,
)--, -
;--- .
bool00 
Contains00
(00 
DateTime00 
moment00 %
)00% &
;00& '
bool33 
HasOverlaps33
(33 
)33 
;33 
bool66 
HasGaps66
(66 
)66 
;66 
}88 
}:: �
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimePeriod.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
ITimePeriod  
{ 
bool 
HasStart
{ 
get 
; 
} 
DateTime 
Start 
{ 
get 
; 
} 
bool 
HasEnd
{ 
get 
; 
} 
DateTime 
End 
{ 
get 
; 
} 
TimeSpan 
Duration 
{ 
get 
;  
}! "
string!! 
DurationDescription!! "
{!!# $
get!!% (
;!!( )
}!!* +
bool$$ 
IsMoment$$
{$$ 
get$$ 
;$$ 
}$$ 
bool'' 
	IsAnytime''
{'' 
get'' 
;'' 
}'' 
bool** 

IsReadOnly**
{** 
get** 
;** 
}**  
TimeSpan-- 
GetDuration-- 
(-- 
IDurationProvider-- .
provider--/ 7
)--7 8
;--8 9
void00 
Setup00
(00 
DateTime00 
newStart00 $
,00$ %
DateTime00& .
newEnd00/ 5
)005 6
;006 7
bool33 
IsSamePeriod33
(33 
ITimePeriod33 %
test33& *
)33* +
;33+ ,
bool66 
	HasInside66
(66 
DateTime66 
test66  $
)66$ %
;66% &
bool99 
	HasInside99
(99 
ITimePeriod99 "
test99# '
)99' (
;99( )
bool<< 
IntersectsWith<<
(<< 
ITimePeriod<< '
test<<( ,
)<<, -
;<<- .
bool?? 
OverlapsWith??
(?? 
ITimePeriod?? %
test??& *
)??* +
;??+ ,
PeriodRelationBB 
GetRelationBB "
(BB" #
ITimePeriodBB# .
testBB/ 3
)BB3 4
;BB4 5
intEE 
	CompareToEE 
(EE 
ITimePeriodEE !
otherEE" '
,EE' (
ITimePeriodComparerEE) <
comparerEE= E
)EEE F
;EEF G
stringHH 
GetDescriptionHH 
(HH 
ITimeFormatterHH ,
	formatterHH- 6
)HH6 7
;HH7 8
}JJ 
}LL �
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimePeriodChain.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
ITimePeriodChain %
:& ' 
ITimePeriodContainer( <
{ 
new 
DateTime 
Start 
{ 
get  
;  !
set" %
;% &
}' (
new 
DateTime 
End 
{ 
get 
; 
set  #
;# $
}% &
ITimePeriod 
First 
{ 
get 
;  
}! "
ITimePeriod 
Last 
{ 
get 
; 
}  !
} 
} �
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimePeriodCollection.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{
public 

	interface !
ITimePeriodCollection *
:+ , 
ITimePeriodContainer- A
{ 
new 
DateTime 
Start 
{ 
get  
;  !
set" %
;% &
}' (
new 
DateTime 
End 
{ 
get 
; 
set  #
;# $
}% &
TimeSpan 

{  
get! $
;$ %
}& '
TimeSpan 
GetTotalDuration !
(! "
IDurationProvider" 3
provider4 <
)< =
;= >
void   
SortBy  
(   
ITimePeriodComparer   '
comparer  ( 0
)  0 1
;  1 2
void## 

(## 
ITimePeriodComparer## .
comparer##/ 7
)##7 8
;##8 9
void&& 
SortByStart&&
(&& 
ListSortDirection&& *

=&&9 :
ListSortDirection&&; L
.&&L M
	Ascending&&M V
)&&V W
;&&W X
void)) 
	SortByEnd))
()) 
ListSortDirection)) (

=))7 8
ListSortDirection))9 J
.))J K
	Ascending))K T
)))T U
;))U V
void,, 
SortByDuration,,
(,, 
ListSortDirection,, -

=,,< =
ListSortDirection,,> O
.,,O P
	Ascending,,P Y
),,Y Z
;,,Z [
bool// 
HasInsidePeriods//
(// 
ITimePeriod// )
test//* .
)//. /
;/// 0
bool22 
HasOverlaps22
(22 
)22 
;22 
bool55 
HasGaps55
(55 
)55 
;55 
bool88 
HasOverlapPeriods88
(88 
ITimePeriod88 *
test88+ /
)88/ 0
;880 1
bool;; "
HasIntersectionPeriods;;
(;;# $
DateTime;;$ ,
test;;- 1
);;1 2
;;;2 3
bool>> "
HasIntersectionPeriods>>
(>># $
ITimePeriod>>$ /
test>>0 4
)>>4 5
;>>5 6!
ITimePeriodCollectionAA 

(AA+ ,
ITimePeriodAA, 7
testAA8 <
)AA< =
;AA= >!
ITimePeriodCollectionDD 
OverlapPeriodsDD ,
(DD, -
ITimePeriodDD- 8
testDD9 =
)DD= >
;DD> ?!
ITimePeriodCollectionGG 
IntersectionPeriodsGG 1
(GG1 2
DateTimeGG2 :
testGG; ?
)GG? @
;GG@ A!
ITimePeriodCollectionJJ 
IntersectionPeriodsJJ 1
(JJ1 2
ITimePeriodJJ2 =
testJJ> B
)JJB C
;JJC D!
ITimePeriodCollectionMM 
RelationPeriodsMM -
(MM- .
ITimePeriodMM. 9
testMM: >
,MM> ?
PeriodRelationMM@ N
relationMMO W
)MMW X
;MMX Y
}OO 
}QQ �
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimePeriodComparer.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
ITimePeriodComparer (
:) *
	IComparer+ 4
<4 5
ITimePeriod5 @
>@ A
{ 
} 
} �
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimePeriodContainer.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface  
ITimePeriodContainer )
:* +
IList, 1
<1 2
ITimePeriod2 =
>= >
,> ?
ITimePeriod@ K
{ 
new 
bool 

IsReadOnly 
{ 
get !
;! "
}# $
bool 
ContainsPeriod
( 
ITimePeriod '
test( ,
), -
;- .
void 
AddAll
( 
IEnumerable 
<  
ITimePeriod  +
>+ ,
periods- 4
)4 5
;5 6
void 
Move
( 
TimeSpan 
delta  
)  !
;! "
} 
} �
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimePeriodMapper.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 
ITimePeriodMapper &
{ 
DateTime 
MapStart 
( 
DateTime "
moment# )
)) *
;* +
DateTime 
MapEnd 
( 
DateTime  
moment! '
)' (
;( )
DateTime 

UnmapStart 
( 
DateTime $
moment% +
)+ ,
;, -
DateTime 
UnmapEnd 
( 
DateTime "
moment# )
)) *
;* +
} 
} �
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ITimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

	interface 

ITimeRange 
:  !
ITimePeriod" -
{ 
new 
DateTime 
Start 
{ 
get  
;  !
set" %
;% &
}' (
new 
DateTime 
End 
{ 
get 
; 
set  #
;# $
}% &
new 
TimeSpan 
Duration 
{ 
get  #
;# $
set% (
;( )
}* +
void 
Move
( 
TimeSpan 
offset !
)! "
;" #
void 

( 
DateTime #
moment$ *
)* +
;+ ,
void!! 
ExpandEndTo!!
(!! 
DateTime!! !
moment!!" (
)!!( )
;!!) *
void$$ 
ExpandTo$$
($$ 
DateTime$$ 
moment$$ %
)$$% &
;$$& '
void'' 
ExpandTo''
('' 
ITimePeriod'' !
period''" (
)''( )
;'') *
void** 

(** 
DateTime** #
moment**$ *
)*** +
;**+ ,
void-- 
ShrinkEndTo--
(-- 
DateTime-- !
moment--" (
)--( )
;--) *
void00 
ShrinkTo00
(00 
ITimePeriod00 !
period00" (
)00( )
;00) *

ITimeRange33 
Copy33 
(33 
TimeSpan33  
offset33! '
)33' (
;33( )

ITimeRange66 
GetIntersection66 "
(66" #
ITimePeriod66# .
period66/ 5
)665 6
;666 7
}88 
}:: �
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\ListSortDirection.Pcl.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 
ListSortDirection !
{ 
	Ascending 
= 
$num 
, 

Descending 
= 
$num 
, 
} 
} �2
gF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Minute.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Minute 
:  
MinuteTimeRange! 0
{ 
public 
Minute 
( 
) 
: 
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 
Minute 
( 

calendar$ ,
), -
:. /
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{ 	
} 	
public 
Minute 
( 
DateTime 
moment %
)% &
:' (
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{   	
}!! 	
public$$ 
Minute$$ 
($$ 
DateTime$$ 
moment$$ %
,$$% &

calendar$$5 =
)$$= >
:$$? @
this%% 
(%% 
calendar%% 
.%% 
GetYear%% !
(%%! "
moment%%" (
)%%( )
,%%) *
calendar%%+ 3
.%%3 4
GetMonth%%4 <
(%%< =
moment%%= C
)%%C D
,%%D E
calendar%%F N
.%%N O

(%%\ ]
moment%%] c
)%%c d
,%%d e
calendar&& 
.&& 
GetHour&& 
(&& 
moment&& #
)&&# $
,&&$ %
calendar&&& .
.&&. /
	GetMinute&&/ 8
(&&8 9
moment&&9 ?
)&&? @
,&&@ A
calendar&&B J
)&&J K
{'' 	
}(( 	
public++ 
Minute++ 
(++ 
int++ 
year++ 
,++ 
int++  #
month++$ )
,++) *
int+++ .
day++/ 2
,++2 3
int++4 7
hour++8 <
,++< =
int++> A
minute++B H
)++H I
:++J K
this,, 
(,, 
year,, 
,,, 
month,, 
,,, 
day,, !
,,,! "
hour,,# '
,,,' (
minute,,) /
,,,/ 0
new,,1 4
TimeCalendar,,5 A
(,,A B
),,B C
),,C D
{-- 	
}.. 	
public11 
Minute11 
(11 
int11 
year11 
,11 
int11  #
month11$ )
,11) *
int11+ .
day11/ 2
,112 3
int114 7
hour118 <
,11< =
int11> A
minute11B H
,11H I

calendar11X `
)11` a
:11b c
base22 
(22 
year22 
,22 
month22 
,22 
day22 !
,22! "
hour22# '
,22' (
minute22) /
,22/ 0
$num221 2
,222 3
calendar224 <
)22< =
{33 	
}44 	
public77 
int77 
Year77 
{88 	
get99 
{99 
return99 
	StartYear99 "
;99" #
}99$ %
}:: 	
public== 
int== 
Month== 
{>> 	
get?? 
{?? 
return?? 

StartMonth?? #
;??# $
}??% &
}@@ 	
publicCC 
intCC 
DayCC 
{DD 	
getEE 
{EE 
returnEE 
StartDayEE !
;EE! "
}EE# $
}FF 	
publicII 
intII 
HourII 
{JJ 	
getKK 
{KK 
returnKK 
	StartHourKK "
;KK" #
}KK$ %
}LL 	
publicOO 
intOO 
MinuteValueOO 
{PP 	
getQQ 
{QQ 
returnQQ 
StartMinuteQQ $
;QQ$ %
}QQ& '
}RR 	
publicUU 
MinuteUU 
GetPreviousMinuteUU '
(UU' (
)UU( )
{VV 	
returnWW 

AddMinutesWW 
(WW 
-WW 
$numWW  
)WW  !
;WW! "
}XX 	
public[[ 
Minute[[ 

([[# $
)[[$ %
{\\ 	
return]] 

AddMinutes]] 
(]] 
$num]] 
)]]  
;]]  !
}^^ 	
publicaa 
Minuteaa 

AddMinutesaa  
(aa  !
intaa! $
minutesaa% ,
)aa, -
{bb 	
DateTimecc 
startMinutecc  
=cc! "
newcc# &
DateTimecc' /
(cc/ 0
	StartYearcc0 9
,cc9 :

StartMonthcc; E
,ccE F
StartDayccG O
,ccO P
	StartHourccQ Z
,ccZ [
StartMinutecc\ g
,ccg h
$numcci j
)ccj k
;cck l
returndd 
newdd 
Minutedd 
(dd 
startMinutedd )
.dd) *

AddMinutesdd* 4
(dd4 5
minutesdd5 <
)dd< =
,dd= >
Calendardd? G
)ddG H
;ddH I
}ee 	
	protectedhh 
overridehh 
stringhh !
Formathh" (
(hh( )
ITimeFormatterhh) 7
	formatterhh8 A
)hhA B
{ii 	
returnjj 
	formatterjj 
.jj 
GetCalendarPeriodjj .
(jj. /
	formatterjj/ 8
.jj8 9
GetShortDatejj9 E
(jjE F
StartjjF K
)jjK L
,jjL M
	formatterkk 
.kk 
GetShortTimekk &
(kk& '
Startkk' ,
)kk, -
,kk- .
	formatterkk/ 8
.kk8 9
GetShortTimekk9 E
(kkE F
EndkkF I
)kkI J
,kkJ K
DurationkkL T
)kkT U
;kkU V
}ll 	
}nn 
}pp �+
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Minutes.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Minutes 
:  !
MinuteTimeRange" 1
{ 
public 
Minutes 
( 
DateTime 
moment  &
,& '
int( +
count, 1
)1 2
:3 4
this 
( 
moment 
, 
count 
, 
new  #
TimeCalendar$ 0
(0 1
)1 2
)2 3
{ 	
} 	
public 
Minutes 
( 
DateTime 
moment  &
,& '
int( +
count, 1
,1 2

calendarA I
)I J
:K L
this 
( 
calendar 
. 
GetYear !
(! "
moment" (
)( )
,) *
calendar+ 3
.3 4
GetMonth4 <
(< =
moment= C
)C D
,D E
calendarF N
.N O

(\ ]
moment] c
)c d
,d e
calendar 
. 
GetHour 
( 
moment #
)# $
,$ %
calendar& .
.. /
	GetMinute/ 8
(8 9
moment9 ?
)? @
,@ A
countB G
,G H
calendarI Q
)Q R
{ 	
} 	
public 
Minutes 
( 
int 
	startYear $
,$ %
int& )

startMonth* 4
,4 5
int6 9
startDay: B
,B C
intD G
	startHourH Q
,Q R
intS V
startMinuteW b
,b c
intd g
minuteCounth s
)s t
:u v
this   
(   
	startYear   
,   

startMonth   &
,  & '
startDay  ( 0
,  0 1
	startHour  2 ;
,  ; <
startMinute  = H
,  H I
minuteCount  J U
,  U V
new  W Z
TimeCalendar  [ g
(  g h
)  h i
)  i j
{!! 	
}"" 	
public%% 
Minutes%% 
(%% 
int%% 
	startYear%% $
,%%$ %
int%%& )

startMonth%%* 4
,%%4 5
int%%6 9
startDay%%: B
,%%B C
int%%D G
	startHour%%H Q
,%%Q R
int%%S V
startMinute%%W b
,%%b c
int%%d g
minuteCount%%h s
,%%s t

calendar
%%� �
)
%%� �
:
%%� �
base&& 
(&& 
	startYear&& 
,&& 

startMonth&& &
,&&& '
startDay&&( 0
,&&0 1
	startHour&&2 ;
,&&; <
startMinute&&= H
,&&H I
minuteCount&&J U
,&&U V
calendar&&W _
)&&_ `
{'' 	
}(( 	
public++ !
ITimePeriodCollection++ $

GetMinutes++% /
(++/ 0
)++0 1
{,, 	 
TimePeriodCollection--  
minutes--! (
=--) *
new--+ . 
TimePeriodCollection--/ C
(--C D
)--D E
;--E F
DateTime.. 
startMinute..  
=..! "
new..# &
DateTime..' /
(../ 0
	StartYear..0 9
,..9 :

StartMonth..; E
,..E F
StartDay..G O
,..O P
	StartHour..Q Z
,..Z [
StartMinute..\ g
,..g h
$num..i j
)..j k
;..k l
for// 
(// 
int// 
i// 
=// 
$num// 
;// 
i// 
<// 
MinuteCount//  +
;//+ ,
i//- .
++//. 0
)//0 1
{00 
minutes11 
.11 
Add11 
(11 
new11 
Minute11  &
(11& '
startMinute11' 2
.112 3

AddMinutes113 =
(11= >
i11> ?
)11? @
,11@ A
Calendar11B J
)11J K
)11K L
;11L M
}22 
return33 
minutes33 
;33 
}44 	
	protected77 
override77 
string77 !
Format77" (
(77( )
ITimeFormatter77) 7
	formatter778 A
)77A B
{88 	
return99 
	formatter99 
.99 
GetCalendarPeriod99 .
(99. /
	formatter99/ 8
.998 9
GetShortDate999 E
(99E F
Start99F K
)99K L
,99L M
	formatter99N W
.99W X
GetShortDate99X d
(99d e
End99e h
)99h i
,99i j
	formatter:: 
.:: 
GetShortTime:: &
(::& '
Start::' ,
)::, -
,::- .
	formatter::/ 8
.::8 9
GetShortTime::9 E
(::E F
End::F I
)::I J
,::J K
Duration::L T
)::T U
;::U V
};; 	
}== 
}?? �B
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\MinuteTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 
MinuteTimeRange )
:* +
CalendarTimeRange, =
{ 
	protected 
MinuteTimeRange !
(! "
int" %
	startYear& /
,/ 0
int1 4

startMonth5 ?
,? @
intA D
startDayE M
,M N
intO R
	startHourS \
,\ ]
int^ a
startMinuteb m
,m n
into r
minuteCounts ~
)~ 
:
� �
this 
( 
	startYear 
, 

startMonth &
,& '
startDay( 0
,0 1
	startHour2 ;
,; <
startMinute= H
,H I
minuteCountJ U
,U V
newW Z
TimeCalendar[ g
(g h
)h i
)i j
{ 	
} 	
	protected 
MinuteTimeRange !
(! "
int" %
	startYear& /
,/ 0
int1 4

startMonth5 ?
,? @
intA D
startDayE M
,M N
intO R
	startHourS \
,\ ]
int^ a
startMinuteb m
,m n
into r
minuteCounts ~
,~ 

� �
calendar
� �
)
� �
:
� �
base 
( 
GetPeriodOf 
( 
	startYear &
,& '

startMonth( 2
,2 3
startDay4 <
,< =
	startHour> G
,G H
startMinuteI T
,T U
minuteCountV a
)a b
,b c
calendard l
)l m
{ 	
this 
. 
startMinute 
= 
new "
DateTime# +
(+ ,
	startYear, 5
,5 6

startMonth7 A
,A B
startDayC K
,K L
	startHourM V
,V W
startMinuteX c
,c d
$nume f
)f g
;g h
this 
. 
minuteCount 
= 
minuteCount *
;* +
	endMinute 
= 
this 
. 
startMinute (
.( )

AddMinutes) 3
(3 4
minuteCount4 ?
)? @
;@ A
} 	
public!! 
int!! 
	StartYear!! 
{"" 	
get## 
{## 
return## 
startMinute## $
.##$ %
Year##% )
;##) *
}##+ ,
}$$ 	
public'' 
int'' 

StartMonth'' 
{(( 	
get)) 
{)) 
return)) 
startMinute)) $
.))$ %
Month))% *
;))* +
})), -
}** 	
public-- 
int-- 
StartDay-- 
{.. 	
get// 
{// 
return// 
startMinute// $
.//$ %
Day//% (
;//( )
}//* +
}00 	
public33 
int33 
	StartHour33 
{44 	
get55 
{55 
return55 
startMinute55 $
.55$ %
Hour55% )
;55) *
}55+ ,
}66 	
public99 
int99 
StartMinute99 
{:: 	
get;; 
{;; 
return;; 
startMinute;; $
.;;$ %
Minute;;% +
;;;+ ,
};;- .
}<< 	
public?? 
int?? 
EndYear?? 
{@@ 	
getAA 
{AA 
returnAA 
	endMinuteAA "
.AA" #
YearAA# '
;AA' (
}AA) *
}BB 	
publicEE 
intEE 
EndMonthEE 
{FF 	
getGG 
{GG 
returnGG 
	endMinuteGG "
.GG" #
MonthGG# (
;GG( )
}GG* +
}HH 	
publicKK 
intKK 
EndDayKK 
{LL 	
getMM 
{MM 
returnMM 
	endMinuteMM "
.MM" #
DayMM# &
;MM& '
}MM( )
}NN 	
publicQQ 
intQQ 
EndHourQQ 
{RR 	
getSS 
{SS 
returnSS 
	endMinuteSS "
.SS" #
HourSS# '
;SS' (
}SS) *
}TT 	
publicWW 
intWW 
	EndMinuteWW 
{XX 	
getYY 
{YY 
returnYY 
	endMinuteYY "
.YY" #
MinuteYY# )
;YY) *
}YY+ ,
}ZZ 	
public]] 
int]] 
MinuteCount]] 
{^^ 	
get__ 
{__ 
return__ 
minuteCount__ $
;__$ %
}__& '
}`` 	
	protectedcc 
overridecc 
boolcc 
IsEqualcc  '
(cc' (
objectcc( .
objcc/ 2
)cc2 3
{dd 	
returnee 
baseee 
.ee 
IsEqualee 
(ee  
objee  #
)ee# $
&&ee% '
HasSameDataee( 3
(ee3 4
objee4 7
asee8 :
MinuteTimeRangeee; J
)eeJ K
;eeK L
}ff 	
privateii 
boolii 
HasSameDataii  
(ii  !
MinuteTimeRangeii! 0
compii1 5
)ii5 6
{jj 	
returnkk 
startMinutekk 
==kk !
compkk" &
.kk& '
startMinutekk' 2
&&kk3 5
minuteCountkk6 A
==kkB D
compkkE I
.kkI J
minuteCountkkJ U
&&kkV X
	endMinutekkY b
==kkc e
compkkf j
.kkj k
	endMinutekkk t
;kkt u
}ll 	
	protectedoo 
overrideoo 
intoo 
ComputeHashCodeoo .
(oo. /
)oo/ 0
{pp 	
returnqq 
HashToolqq 
.qq 
ComputeHashCodeqq +
(qq+ ,
baseqq, 0
.qq0 1
ComputeHashCodeqq1 @
(qq@ A
)qqA B
,qqB C
startMinuteqqD O
,qqO P
minuteCountqqQ \
,qq\ ]
	endMinuteqq^ g
)qqg h
;qqh i
}rr 	
privateuu 
staticuu 
	TimeRangeuu  
GetPeriodOfuu! ,
(uu, -
intuu- 0
yearuu1 5
,uu5 6
intuu7 :
monthuu; @
,uu@ A
intuuB E
dayuuF I
,uuI J
intuuK N
houruuO S
,uuS T
intuuU X
minuteuuY _
,uu_ `
intuua d
minuteCountuue p
)uup q
{vv 	
ifww 
(ww 
minuteCountww 
<ww 
$numww 
)ww  
{xx 
throwyy 
newyy '
ArgumentOutOfRangeExceptionyy 5
(yy5 6
$stryy6 C
)yyC D
;yyD E
}zz 
DateTime|| 
start|| 
=|| 
new||  
DateTime||! )
(||) *
year||* .
,||. /
month||0 5
,||5 6
day||7 :
,||: ;
hour||< @
,||@ A
minute||B H
,||H I
$num||J K
)||K L
;||L M
DateTime}} 
end}} 
=}} 
start}}  
.}}  !

AddMinutes}}! +
(}}+ ,
minuteCount}}, 7
)}}7 8
;}}8 9
return~~ 
new~~ 
	TimeRange~~  
(~~  !
start~~! &
,~~& '
end~~( +
)~~+ ,
;~~, -
} 	
private
�� 
readonly
�� 
DateTime
�� !
startMinute
��" -
;
��- .
private
�� 
readonly
�� 
int
�� 
minuteCount
�� (
;
��( )
private
�� 
readonly
�� 
DateTime
�� !
	endMinute
��" +
;
��+ ,
}
�� 
}�� �.
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Month.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Month 
: 
MonthTimeRange  .
{ 
public 
Month 
( 
) 
: 
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 
Month 
( 

calendar# +
)+ ,
:- .
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{ 	
} 	
public 
Month 
( 
DateTime 
moment $
)$ %
:& '
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{   	
}!! 	
public$$ 
Month$$ 
($$ 
DateTime$$ 
moment$$ $
,$$$ %

calendar$$4 <
)$$< =
:$$> ?
this%% 
(%% 
calendar%% 
.%% 
GetYear%% !
(%%! "
moment%%" (
)%%( )
,%%) *
(%%+ ,
	YearMonth%%, 5
)%%5 6
calendar%%6 >
.%%> ?
GetMonth%%? G
(%%G H
moment%%H N
)%%N O
,%%O P
calendar%%Q Y
)%%Y Z
{&& 	
}'' 	
public** 
Month** 
(** 
int** 
year** 
,** 
	YearMonth** (
	yearMonth**) 2
)**2 3
:**4 5
this++ 
(++ 
year++ 
,++ 
	yearMonth++  
,++  !
new++" %
TimeCalendar++& 2
(++2 3
)++3 4
)++4 5
{,, 	
}-- 	
public00 
Month00 
(00 
int00 
year00 
,00 
	YearMonth00 (
	yearMonth00) 2
,002 3

calendar00B J
)00J K
:00L M
base11 
(11 
year11 
,11 
	yearMonth11  
,11  !
$num11" #
,11# $
calendar11% -
)11- .
{22 	
}33 	
public66 
int66 
Year66 
{77 	
get88 
{88 
return88 
	StartYear88 "
;88" #
}88$ %
}99 	
public<< 
	YearMonth<< 
	YearMonth<< "
{== 	
get>> 
{>> 
return>> 

StartMonth>> #
;>># $
}>>% &
}?? 	
publicBB 
intBB 

MonthValueBB 
{CC 	
getDD 
{DD 
returnDD 
(DD 
intDD 
)DD 

StartMonthDD (
;DD( )
}DD* +
}EE 	
publicHH 
stringHH 
	MonthNameHH 
{II 	
getJJ 
{JJ 
returnJJ 
StartMonthNameJJ '
;JJ' (
}JJ) *
}KK 	
publicNN 
stringNN 
MonthOfYearNameNN %
{OO 	
getPP 
{PP 
returnPP  
StartMonthOfYearNamePP -
;PP- .
}PP/ 0
}QQ 	
publicTT 
intTT 
DaysInMonthTT 
{UU 	
getVV 
{VV 
returnVV 
TimeToolVV !
.VV! "
GetDaysInMonthVV" 0
(VV0 1
	StartYearVV1 :
,VV: ;
(VV< =
intVV= @
)VV@ A

StartMonthVVA K
)VVK L
;VVL M
}VVN O
}WW 	
publicZZ 
MonthZZ 
GetPreviousMonthZZ %
(ZZ% &
)ZZ& '
{[[ 	
return\\ 
	AddMonths\\ 
(\\ 
-\\ 
$num\\ 
)\\  
;\\  !
}]] 	
public`` 
Month`` 
GetNextMonth`` !
(``! "
)``" #
{aa 	
returnbb 
	AddMonthsbb 
(bb 
$numbb 
)bb 
;bb  
}cc 	
publicff 
Monthff 
	AddMonthsff 
(ff 
intff "
monthsff# )
)ff) *
{gg 	
DateTimehh 
	startDatehh 
=hh  
newhh! $
DateTimehh% -
(hh- .
	StartYearhh. 7
,hh7 8
(hh9 :
inthh: =
)hh= >

StartMonthhh> H
,hhH I
$numhhJ K
)hhK L
;hhL M
returnii 
newii 
Monthii 
(ii 
	startDateii &
.ii& '
	AddMonthsii' 0
(ii0 1
monthsii1 7
)ii7 8
,ii8 9
Calendarii: B
)iiB C
;iiC D
}jj 	
	protectedmm 
overridemm 
stringmm !
Formatmm" (
(mm( )
ITimeFormattermm) 7
	formattermm8 A
)mmA B
{nn 	
returnoo 
	formatteroo 
.oo 
GetCalendarPeriodoo .
(oo. /
MonthOfYearNameoo/ >
,oo> ?
	formatterpp 
.pp 
GetShortDatepp &
(pp& '
Startpp' ,
)pp, -
,pp- .
	formatterpp/ 8
.pp8 9
GetShortDatepp9 E
(ppE F
EndppF I
)ppI J
,ppJ K
DurationppL T
)ppT U
;ppU V
}qq 	
}ss 
}uu �
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\MonthRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

struct 

MonthRange 
{ 
public 

MonthRange 
( 
	YearMonth #
month$ )
)) *
:+ ,
this 
( 
month 
, 
month 
) 
{ 	
} 	
public 

MonthRange 
( 
	YearMonth #
min$ '
,' (
	YearMonth) 2
max3 6
)6 7
{ 	
if 
( 
max 
< 
min 
) 
{ 
throw 
new '
ArgumentOutOfRangeException 5
(5 6
$str6 ;
); <
;< =
} 
this 
. 
min 
= 
min 
; 
this 
. 
max 
= 
max 
; 
}   	
public## 
	YearMonth## 
Min## 
{$$ 	
get%% 
{%% 
return%% 
min%% 
;%% 
}%% 
}&& 	
public)) 
	YearMonth)) 
Max)) 
{** 	
get++ 
{++ 
return++ 
max++ 
;++ 
}++ 
},, 	
public// 
bool// 

{00 	
get11 
{11 
return11 
min11 
==11 
max11  #
;11# $
}11% &
}22 	
public55 
bool55 
	HasInside55 
(55 
	YearMonth55 '
test55( ,
)55, -
{66 	
return77 
test77 
>=77 
min77 
&&77 !
test77" &
<=77' )
max77* -
;77- .
}88 	
private<< 
readonly<< 
	YearMonth<< "
min<<# &
;<<& '
private== 
readonly== 
	YearMonth== "
max==# &
;==& '
}?? 
}AA �#
gF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Months.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Months 
:  
MonthTimeRange! /
{ 
public 
Months 
( 
DateTime 
moment %
,% &
	YearMonth' 0

startMonth1 ;
,; <
int= @
countA F
)F G
:H I
this 
( 
moment 
, 

startMonth #
,# $
count% *
,* +
new, /
TimeCalendar0 <
(< =
)= >
)> ?
{ 	
} 	
public 
Months 
( 
DateTime 
moment %
,% &
	YearMonth' 0

startMonth1 ;
,; <
int= @
countA F
,F G

calendarV ^
)^ _
:` a
this 
( 
calendar 
. 
GetYear !
(! "
moment" (
)( )
,) *

startMonth+ 5
,5 6
count7 <
,< =
calendar> F
)F G
{ 	
} 	
public 
Months 
( 
int 
	startYear #
,# $
	YearMonth% .

startMonth/ 9
,9 :
int; >
monthCounth? J
)J K
:L M
this 
( 
	startYear 
, 

startMonth &
,& '
monthCounth( 3
,3 4
new5 8
TimeCalendar9 E
(E F
)F G
)G H
{   	
}!! 	
public$$ 
Months$$ 
($$ 
int$$ 
	startYear$$ #
,$$# $
	YearMonth$$% .

startMonth$$/ 9
,$$9 :
int$$; >

monthCount$$? I
,$$I J

calendar$$Y a
)$$a b
:$$c d
base%% 
(%% 
	startYear%% 
,%% 

startMonth%% &
,%%& '

monthCount%%( 2
,%%2 3
calendar%%4 <
)%%< =
{&& 	
}'' 	
public** !
ITimePeriodCollection** $
	GetMonths**% .
(**. /
)**/ 0
{++ 	 
TimePeriodCollection,,  
months,,! '
=,,( )
new,,* - 
TimePeriodCollection,,. B
(,,B C
),,C D
;,,D E
for-- 
(-- 
int-- 
i-- 
=-- 
$num-- 
;-- 
i-- 
<-- 

MonthCount--  *
;--* +
i--, -
++--- /
)--/ 0
{.. 
int// 
year// 
;// 
	YearMonth00 
month00 
;00  
TimeTool11 
.11 
AddMonth11 !
(11! "
	StartYear11" +
,11+ ,

StartMonth11- 7
,117 8
i119 :
,11: ;
out11< ?
year11@ D
,11D E
out11F I
month11J O
)11O P
;11P Q
months22 
.22 
Add22 
(22 
new22 
Month22 $
(22$ %
year22% )
,22) *
month22+ 0
,220 1
Calendar222 :
)22: ;
)22; <
;22< =
}33 
return44 
months44 
;44 
}55 	
	protected88 
override88 
string88 !
Format88" (
(88( )
ITimeFormatter88) 7
	formatter888 A
)88A B
{99 	
return:: 
	formatter:: 
.:: 
GetCalendarPeriod:: .
(::. / 
StartMonthOfYearName::/ C
,::C D
EndMonthOfYearName::E W
,::W X
	formatter;; 
.;; 
GetShortDate;; &
(;;& '
Start;;' ,
);;, -
,;;- .
	formatter;;/ 8
.;;8 9
GetShortDate;;9 E
(;;E F
End;;F I
);;I J
,;;J K
Duration;;L T
);;T U
;;;U V
}<< 	
}>> 
}@@ �g
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\MonthTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 
MonthTimeRange (
:) *
CalendarTimeRange+ <
{ 
	protected 
MonthTimeRange  
(  !
int! $
	startYear% .
,. /
	YearMonth0 9

startMonth: D
,D E
intF I
monthCounthJ U
)U V
:W X
this 
( 
	startYear 
, 

startMonth &
,& '
monthCounth( 3
,3 4
new5 8
TimeCalendar9 E
(E F
)F G
)G H
{ 	
} 	
	protected 
MonthTimeRange  
(  !
int! $
	startYear% .
,. /
	YearMonth0 9

startMonth: D
,D E
intF I

monthCountJ T
,T U

calendard l
)l m
:n o
base 
( 
GetPeriodOf 
( 
calendar %
,% &
	startYear' 0
,0 1

startMonth2 <
,< =

monthCount> H
)H I
,I J
calendarK S
)S T
{ 	
this 
. 
	startYear 
= 
	startYear &
;& '
this 
. 

startMonth 
= 

startMonth (
;( )
this 
. 

monthCount 
= 

monthCount (
;( )
TimeTool 
. 
AddMonth 
( 
	startYear '
,' (

startMonth) 3
,3 4

monthCount5 ?
-@ A
$numB C
,C D
outE H
endYearI P
,P Q
outR U
endMonthV ^
)^ _
;_ `
} 	
public"" 
int"" 
	StartYear"" 
{## 	
get$$ 
{$$ 
return$$ 
Calendar$$ !
.$$! "
GetYear$$" )
($$) *
	startYear$$* 3
,$$3 4
($$5 6
int$$6 9
)$$9 :

startMonth$$: D
)$$D E
;$$E F
}$$G H
}%% 	
public(( 
int(( 
EndYear(( 
{)) 	
get** 
{** 
return** 
Calendar** !
.**! "
GetYear**" )
(**) *
endYear*** 1
,**1 2
(**3 4
int**4 7
)**7 8
endMonth**8 @
)**@ A
;**A B
}**C D
}++ 	
public.. 
	YearMonth.. 

StartMonth.. #
{// 	
get00 
{00 
return00 

startMonth00 #
;00# $
}00% &
}11 	
public44 
	YearMonth44 
EndMonth44 !
{55 	
get66 
{66 
return66 
endMonth66 !
;66! "
}66# $
}77 	
public:: 
int:: 

MonthCount:: 
{;; 	
get<< 
{<< 
return<< 

monthCount<< #
;<<# $
}<<% &
}== 	
public@@ 
string@@ 
StartMonthName@@ $
{AA 	
getBB 
{BB 
returnBB 
CalendarBB !
.BB! "
GetMonthNameBB" .
(BB. /
(BB/ 0
intBB0 3
)BB3 4

StartMonthBB4 >
)BB> ?
;BB? @
}BBA B
}CC 	
publicFF 
stringFF  
StartMonthOfYearNameFF *
{GG 	
getHH 
{HH 
returnHH 
CalendarHH !
.HH! "
GetMonthOfYearNameHH" 4
(HH4 5
	StartYearHH5 >
,HH> ?
(HH@ A
intHHA D
)HHD E

StartMonthHHE O
)HHO P
;HHP Q
}HHR S
}II 	
publicLL 
stringLL 
EndMonthNameLL "
{MM 	
getNN 
{NN 
returnNN 
CalendarNN !
.NN! "
GetMonthNameNN" .
(NN. /
(NN/ 0
intNN0 3
)NN3 4
EndMonthNN4 <
)NN< =
;NN= >
}NN? @
}OO 	
publicRR 
stringRR 
EndMonthOfYearNameRR (
{SS 	
getTT 
{TT 
returnTT 
CalendarTT !
.TT! "
GetMonthOfYearNameTT" 4
(TT4 5
EndYearTT5 <
,TT< =
(TT> ?
intTT? B
)TTB C
EndMonthTTC K
)TTK L
;TTL M
}TTN O
}UU 	
publicXX !
ITimePeriodCollectionXX $
GetDaysXX% ,
(XX, -
)XX- .
{YY 	 
TimePeriodCollectionZZ  
daysZZ! %
=ZZ& '
newZZ( + 
TimePeriodCollectionZZ, @
(ZZ@ A
)ZZA B
;ZZB C
DateTime[[ 
	startDate[[ 
=[[  
GetStartOfMonth[[! 0
([[0 1
Calendar[[1 9
,[[9 :
	startYear[[; D
,[[D E

startMonth[[F P
)[[P Q
;[[Q R
for\\ 
(\\ 
int\\ 
month\\ 
=\\ 
$num\\ 
;\\ 
month\\  %
<\\& '

monthCount\\( 2
;\\2 3
month\\4 9
++\\9 ;
)\\; <
{]] 
DateTime^^ 

monthStart^^ #
=^^$ %
	startDate^^& /
.^^/ 0
	AddMonths^^0 9
(^^9 :
month^^: ?
)^^? @
;^^@ A
int__ 
daysOfMonth__ 
=__  !
TimeTool__" *
.__* +
GetDaysInMonth__+ 9
(__9 :

monthStart__: D
.__D E
Year__E I
,__I J

monthStart__K U
.__U V
Month__V [
)__[ \
;__\ ]
for`` 
(`` 
int`` 
day`` 
=`` 
$num``  
;``  !
day``" %
<``& '
daysOfMonth``( 3
;``3 4
day``5 8
++``8 :
)``: ;
{aa 
daysbb 
.bb 
Addbb 
(bb 
newbb  
Daybb! $
(bb$ %

monthStartbb% /
.bb/ 0
AddDaysbb0 7
(bb7 8
daybb8 ;
)bb; <
,bb< =
Calendarbb> F
)bbF G
)bbG H
;bbH I
}cc 
}dd 
returnee 
daysee 
;ee 
}ff 	
	protectedii 
overrideii 
boolii 
IsEqualii  '
(ii' (
objectii( .
objii/ 2
)ii2 3
{jj 	
returnkk 
basekk 
.kk 
IsEqualkk 
(kk  
objkk  #
)kk# $
&&kk% '
HasSameDatakk( 3
(kk3 4
objkk4 7
askk8 :
MonthTimeRangekk; I
)kkI J
;kkJ K
}ll 	
privateoo 
booloo 
HasSameDataoo  
(oo  !
MonthTimeRangeoo! /
compoo0 4
)oo4 5
{pp 	
returnqq 
	startYearrr 
==rr 
comprr !
.rr! "
	startYearrr" +
&&rr, .

startMonthss 
==ss 
compss "
.ss" #

startMonthss# -
&&ss. 0

monthCounttt 
==tt 
comptt "
.tt" #

monthCounttt# -
&&tt. 0
endYearuu 
==uu 
compuu 
.uu  
endYearuu  '
&&uu( *
endMonthvv 
==vv 
compvv  
.vv  !
endMonthvv! )
;vv) *
}ww 	
	protectedzz 
overridezz 
intzz 
ComputeHashCodezz .
(zz. /
)zz/ 0
{{{ 	
return|| 
HashTool|| 
.|| 
ComputeHashCode|| +
(||+ ,
base||, 0
.||0 1
ComputeHashCode||1 @
(||@ A
)||A B
,||B C
	startYear||D M
,||M N

startMonth||O Y
,||Y Z

monthCount||[ e
,||e f
endYear||g n
,||n o
endMonth||p x
)||x y
;||y z
}}} 	
private
�� 
static
�� 
DateTime
�� 
GetStartOfMonth
��  /
(
��/ 0

��0 =
calendar
��> F
,
��F G
int
��H K
year
��L P
,
��P Q
	YearMonth
��R [
month
��\ a
)
��a b
{
�� 	
DateTime
�� 
startOfMonth
�� !
;
��! "
if
�� 
(
�� 
calendar
�� 
.
�� 
YearType
�� !
==
��" $
YearType
��% -
.
��- .

FiscalYear
��. 8
)
��8 9
{
�� 
startOfMonth
�� 
=
��  
FiscalCalendarTool
�� 1
.
��1 2
GetStartOfMonth
��2 A
(
��A B
year
�� 
,
�� 
month
�� 
,
��  
calendar
��! )
.
��) *

��* 7
,
��7 8
calendar
��9 A
.
��A B"
FiscalFirstDayOfYear
��B V
,
��V W
calendar
��X `
.
��` a!
FiscalYearAlignment
��a t
,
��t u
calendar
��v ~
.
��~ $
FiscalQuarterGrouping�� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
startOfMonth
�� 
=
�� 
new
�� "
DateTime
��# +
(
��+ ,
year
��, 0
,
��0 1
(
��2 3
int
��3 6
)
��6 7
month
��7 <
,
��< =
$num
��> ?
)
��? @
;
��@ A
}
�� 
return
�� 
startOfMonth
�� 
;
��  
}
�� 	
private
�� 
static
�� 
	TimeRange
��  
GetPeriodOf
��! ,
(
��, -

��- :
calendar
��; C
,
��C D
int
��E H
	startYear
��I R
,
��R S
	YearMonth
��T ]

startMonth
��^ h
,
��h i
int
��j m

monthCount
��n x
)
��x y
{
�� 	
if
�� 
(
�� 

monthCount
�� 
<
�� 
$num
�� 
)
�� 
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 B
)
��B C
;
��C D
}
�� 
DateTime
�� 
start
�� 
=
�� 
GetStartOfMonth
�� ,
(
��, -
calendar
��- 5
,
��5 6
	startYear
��7 @
,
��@ A

startMonth
��B L
)
��L M
;
��M N
DateTime
�� 
end
�� 
;
�� 
if
�� 
(
�� 
calendar
�� 
.
�� 
YearType
�� !
==
��" $
YearType
��% -
.
��- .

FiscalYear
��. 8
)
��8 9
{
�� 
int
�� 
endYear
�� 
;
�� 
	YearMonth
�� 
endMonth
�� "
;
��" #
TimeTool
�� 
.
�� 
AddMonth
�� !
(
��! "
	startYear
��" +
,
��+ ,

startMonth
��- 7
,
��7 8

monthCount
��9 C
,
��C D
out
��E H
endYear
��I P
,
��P Q
out
��R U
endMonth
��V ^
)
��^ _
;
��_ `
end
�� 
=
�� 
GetStartOfMonth
�� %
(
��% &
calendar
��& .
,
��. /
endYear
��0 7
,
��7 8
endMonth
��9 A
)
��A B
;
��B C
}
�� 
else
�� 
{
�� 
end
�� 
=
�� 
start
�� 
.
�� 
	AddMonths
�� %
(
��% &

monthCount
��& 0
)
��0 1
;
��1 2
}
�� 
return
�� 
new
�� 
	TimeRange
��  
(
��  !
start
��! &
,
��& '
end
��( +
)
��+ ,
;
��, -
}
�� 	
private
�� 
readonly
�� 
int
�� 
	startYear
�� &
;
��& '
private
�� 
readonly
�� 
	YearMonth
�� "

startMonth
��# -
;
��- .
private
�� 
readonly
�� 
int
�� 

monthCount
�� '
;
��' (
private
�� 
readonly
�� 
int
�� 
endYear
�� $
;
��$ %
private
�� 
readonly
�� 
	YearMonth
�� "
endMonth
��# +
;
��+ ,
}
�� 
}�� �L
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Now.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

static 
class 
Now 
{ 
public 
static 
DateTime 
CalendarYear +
{ 	
get 
{ 
return 
Year 
( 
TimeSpec &
.& '"
CalendarYearStartMonth' =
)= >
;> ?
}@ A
} 	
public 
static 
DateTime 
Year #
(# $
	YearMonth$ -
yearStartMonth. <
)< =
{ 	
DateTime 
now 
= 

ClockProxy %
.% &
Clock& +
.+ ,
Now, /
;/ 0
int 

startMonth 
= 
( 
int !
)! "
yearStartMonth" 0
;0 1
int 
monthOffset 
= 
now !
.! "
Month" '
-( )

startMonth* 4
;4 5
int   
year   
=   
monthOffset   "
<  # $
$num  % &
?  ' (
now  ) ,
.  , -
Year  - 1
-  2 3
$num  4 5
:  6 7
now  8 ;
.  ; <
Year  < @
;  @ A
return!! 
new!! 
DateTime!! 
(!!  
year!!  $
,!!$ %

startMonth!!& 0
,!!0 1
$num!!2 3
)!!3 4
;!!4 5
}"" 	
public)) 
static)) 
DateTime)) 
CalendarHalfyear)) /
{** 	
get++ 
{++ 
return++ 
Halfyear++ !
(++! "
TimeSpec++" *
.++* +"
CalendarYearStartMonth+++ A
)++A B
;++B C
}++D E
},, 	
public// 
static// 
DateTime// 
Halfyear// '
(//' (
	YearMonth//( 1
yearStartMonth//2 @
)//@ A
{00 	
DateTime11 
now11 
=11 

ClockProxy11 %
.11% &
Clock11& +
.11+ ,
Now11, /
;11/ 0
int22 
year22 
=22 
now22 
.22 
Year22 
;22  
if33 
(33 
now33 
.33 
Month33 
-33 
(33 
int33  
)33  !
yearStartMonth33! /
<330 1
$num332 3
)333 4
{44 
year55 
--55 
;55 
}66 
YearHalfyear77 
halfyear77 !
=77" #
TimeTool77$ ,
.77, -
GetHalfyearOfMonth77- ?
(77? @
yearStartMonth77@ N
,77N O
(77P Q
	YearMonth77Q Z
)77Z [
now77[ ^
.77^ _
Month77_ d
)77d e
;77e f
int88 
months88 
=88 
(88 
(88 
int88 
)88 
halfyear88 '
-88( )
$num88* +
)88+ ,
*88- .
TimeSpec88/ 7
.887 8
MonthsPerHalfyear888 I
;88I J
return99 
new99 
DateTime99 
(99  
year99  $
,99$ %
(99& '
int99' *
)99* +
yearStartMonth99+ 9
,999 :
$num99; <
)99< =
.99= >
	AddMonths99> G
(99G H
months99H N
)99N O
;99O P
}:: 	
publicAA 
staticAA 
DateTimeAA 
CalendarQuarterAA .
{BB 	
getCC 
{CC 
returnCC 
QuarterCC  
(CC  !
TimeSpecCC! )
.CC) *"
CalendarYearStartMonthCC* @
)CC@ A
;CCA B
}CCC D
}DD 	
publicGG 
staticGG 
DateTimeGG 
QuarterGG &
(GG& '
	YearMonthGG' 0
yearStartMonthGG1 ?
)GG? @
{HH 	
DateTimeII 
nowII 
=II 

ClockProxyII %
.II% &
ClockII& +
.II+ ,
NowII, /
;II/ 0
intJJ 
yearJJ 
=JJ 
nowJJ 
.JJ 
YearJJ 
;JJ  
ifKK 
(KK 
nowKK 
.KK 
MonthKK 
-KK 
(KK 
intKK  
)KK  !
yearStartMonthKK! /
<KK0 1
$numKK2 3
)KK3 4
{LL 
yearMM 
--MM 
;MM 
}NN 
YearQuarterOO 
quarterOO 
=OO  !
TimeToolOO" *
.OO* +
GetQuarterOfMonthOO+ <
(OO< =
yearStartMonthOO= K
,OOK L
(OOM N
	YearMonthOON W
)OOW X
nowOOX [
.OO[ \
MonthOO\ a
)OOa b
;OOb c
intPP 
monthsPP 
=PP 
(PP 
(PP 
intPP 
)PP 
quarterPP &
-PP' (
$numPP) *
)PP* +
*PP, -
TimeSpecPP. 6
.PP6 7
MonthsPerQuarterPP7 G
;PPG H
returnQQ 
newQQ 
DateTimeQQ 
(QQ  
yearQQ  $
,QQ$ %
(QQ& '
intQQ' *
)QQ* +
yearStartMonthQQ+ 9
,QQ9 :
$numQQ; <
)QQ< =
.QQ= >
	AddMonthsQQ> G
(QQG H
monthsQQH N
)QQN O
;QQO P
}RR 	
publicYY 
staticYY 
DateTimeYY 
MonthYY $
{ZZ 	
get[[ 
{[[ 
return[[ 
TimeTrim[[ !
.[[! "
Day[[" %
([[% &

ClockProxy[[& 0
.[[0 1
Clock[[1 6
.[[6 7
Now[[7 :
)[[: ;
;[[; <
}[[= >
}\\ 	
public__ 
static__ 
	YearMonth__ 
	YearMonth__  )
{`` 	
getaa 
{aa 
returnaa 
(aa 
	YearMonthaa #
)aa# $

ClockProxyaa$ .
.aa. /
Clockaa/ 4
.aa4 5
Nowaa5 8
.aa8 9
Monthaa9 >
;aa> ?
}aa@ A
}bb 	
publicii 
staticii 
DateTimeii 
Weekii #
(ii# $
)ii$ %
{jj 	
returnkk 
DateTimeFormatInfokk %
.kk% &
CurrentInfokk& 1
==kk2 4
nullkk5 9
?kk: ;
DateTimekk< D
.kkD E
NowkkE H
:kkI J
WeekkkK O
(kkO P
DateTimeFormatInfokkP b
.kkb c
CurrentInfokkc n
.kkn o
FirstDayOfWeekkko }
)kk} ~
;kk~ 
}ll 	
publicoo 
staticoo 
DateTimeoo 
Weekoo #
(oo# $
	DayOfWeekoo$ -
firstDayOfWeekoo. <
)oo< =
{pp 	
DateTimeqq 

currentDayqq 
=qq  !

ClockProxyqq" ,
.qq, -
Clockqq- 2
.qq2 3
Nowqq3 6
;qq6 7
whilerr 
(rr 

currentDayrr 
.rr 
	DayOfWeekrr '
!=rr( *
firstDayOfWeekrr+ 9
)rr9 :
{ss 

currentDaytt 
=tt 

currentDaytt '
.tt' (
AddDaystt( /
(tt/ 0
-tt0 1
$numtt1 2
)tt2 3
;tt3 4
}uu 
returnvv 
newvv 
DateTimevv 
(vv  

currentDayvv  *
.vv* +
Yearvv+ /
,vv/ 0

currentDayvv1 ;
.vv; <
Monthvv< A
,vvA B

currentDayvvC M
.vvM N
DayvvN Q
)vvQ R
;vvR S
}ww 	
public~~ 
static~~ 
DateTime~~ 
Today~~ $
{ 	
get
�� 
{
�� 
return
�� 

ClockProxy
�� #
.
��# $
Clock
��$ )
.
��) *
Now
��* -
.
��- .
Date
��. 2
;
��2 3
}
��4 5
}
�� 	
public
�� 
static
�� 
DateTime
�� 
Hour
�� #
{
�� 	
get
�� 
{
�� 
return
�� 
TimeTrim
�� !
.
��! "
Minute
��" (
(
��( )

ClockProxy
��) 3
.
��3 4
Clock
��4 9
.
��9 :
Now
��: =
)
��= >
;
��> ?
}
��@ A
}
�� 	
public
�� 
static
�� 
DateTime
�� 
Minute
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
TimeTrim
�� !
.
��! "
Second
��" (
(
��( )

ClockProxy
��) 3
.
��3 4
Clock
��4 9
.
��9 :
Now
��: =
)
��= >
;
��> ?
}
��@ A
}
�� 	
public
�� 
static
�� 
DateTime
�� 
Second
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
TimeTrim
�� !
.
��! "
Millisecond
��" -
(
��- .

ClockProxy
��. 8
.
��8 9
Clock
��9 >
.
��> ?
Now
��? B
)
��B C
;
��C D
}
��E F
}
�� 	
}
�� 
}�� �
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\PeriodRelation.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 
PeriodRelation 
{ 
After 
,

, 
StartInside 
, 
InsideStartTouching 
, "
EnclosingStartTouching 
, 
	Enclosing 
,  
EnclosingEndTouching 
, 

ExactMatch 
, 
Inside 
, 
InsideEndTouching 
, 
	EndInside 
, 
EndTouching 
, 
Before 
, 
} 
} �N
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Quarter.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Quarter 
:  !
QuarterTimeRange" 2
{ 
public 
Quarter 
( 
) 
: 
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 
Quarter 
( 

calendar% -
)- .
:/ 0
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{ 	
} 	
public 
Quarter 
( 
DateTime 
moment  &
)& '
:( )
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{   	
}!! 	
public$$ 
Quarter$$ 
($$ 
DateTime$$ 
moment$$  &
,$$& '

calendar$$6 >
)$$> ?
:$$@ A
this%% 
(%% 
TimeTool%% 
.%% 
	GetYearOf%% #
(%%# $
calendar%%$ ,
.%%, -

,%%: ;
calendar%%< D
.%%D E
GetYear%%E L
(%%L M
moment%%M S
)%%S T
,%%T U
calendar%%V ^
.%%^ _
GetMonth%%_ g
(%%g h
moment%%h n
)%%n o
)%%o p
,%%p q
TimeTool&& 
.&& 
GetQuarterOfMonth&& *
(&&* +
calendar&&+ 3
.&&3 4

,&&A B
(&&C D
	YearMonth&&D M
)&&M N
moment&&N T
.&&T U
Month&&U Z
)&&Z [
,&&[ \
calendar&&] e
)&&e f
{'' 	
}(( 	
public++ 
Quarter++ 
(++ 
int++ 
baseYear++ #
,++# $
YearQuarter++% 0
yearQuarter++1 <
)++< =
:++> ?
this,, 
(,, 
baseYear,, 
,,, 
yearQuarter,, &
,,,& '
new,,( +
TimeCalendar,,, 8
(,,8 9
),,9 :
),,: ;
{-- 	
}.. 	
public11 
Quarter11 
(11 
int11 
baseYear11 #
,11# $
YearQuarter11% 0
yearQuarter111 <
,11< =

calendar11L T
)11T U
:11V W
base22 
(22 
baseYear22 
,22 
yearQuarter22 &
,22& '
$num22( )
,22) *
calendar22+ 3
)223 4
{33 	
}44 	
public77 
int77 
Year77 
{88 	
get99 
{:: 
int;; 
year;; 
;;; 
	YearMonth<< 
month<< 
;<<  
int== 

monthCount== 
===  
(==! "
(==" #
int==# &
)==& '
StartQuarter==' 3
-==4 5
$num==6 7
)==7 8
*==9 :
TimeSpec==; C
.==C D
MonthsPerQuarter==D T
;==T U
TimeTool>> 
.>> 
AddMonth>> !
(>>! "
BaseYear>>" *
,>>* +
Calendar>>, 4
.>>4 5

,>>B C

monthCount>>D N
,>>N O
out>>P S
year>>T X
,>>X Y
out>>Z ]
month>>^ c
)>>c d
;>>d e
return?? 
Calendar?? 
.??  
GetYear??  '
(??' (
year??( ,
,??, -
(??. /
int??/ 2
)??2 3
month??3 8
)??8 9
;??9 :
}@@ 
}AA 	
publicDD 
	YearMonthDD 

StartMonthDD #
{EE 	
getFF 
{GG 
intHH 
yearHH 
;HH 
	YearMonthII 
monthII 
;II  
intJJ 

monthCountJJ 
=JJ  
(JJ! "
(JJ" #
intJJ# &
)JJ& '
StartQuarterJJ' 3
-JJ4 5
$numJJ6 7
)JJ7 8
*JJ9 :
TimeSpecJJ; C
.JJC D
MonthsPerQuarterJJD T
;JJT U
TimeToolKK 
.KK 
AddMonthKK !
(KK! "
BaseYearKK" *
,KK* +
CalendarKK, 4
.KK4 5

,KKB C

monthCountKKD N
,KKN O
outKKP S
yearKKT X
,KKX Y
outKKZ ]
monthKK^ c
)KKc d
;KKd e
returnLL 
monthLL 
;LL 
}MM 
}NN 	
publicQQ 
YearQuarterQQ 
YearQuarterQQ &
{RR 	
getSS 
{SS 
returnSS 
StartQuarterSS %
;SS% &
}SS' (
}TT 	
publicWW 
stringWW 
QuarterNameWW !
{XX 	
getYY 
{YY 
returnYY 
StartQuarterNameYY )
;YY) *
}YY+ ,
}ZZ 	
public]] 
string]] 
QuarterOfYearName]] '
{^^ 	
get__ 
{__ 
return__ "
StartQuarterOfYearName__ /
;__/ 0
}__1 2
}`` 	
publiccc 
boolcc 
IsCalendarQuartercc %
{dd 	
getee 
{ee 
returnee 
(ee 
(ee 
intee 
)ee 

-ee- .
$numee/ 0
)ee0 1
%ee2 3
TimeSpecee4 <
.ee< =
MonthsPerQuarteree= M
==eeN P
$numeeQ R
;eeR S
}eeT U
}ff 	
publicii 
boolii !
MultipleCalendarYearsii )
{jj 	
getkk 
{ll 
ifmm 
(mm 
IsCalendarQuartermm %
)mm% &
{nn 
returnoo 
falseoo  
;oo  !
}pp 
intqq 
	startYearqq 
;qq 
	YearMonthrr 
monthrr 
;rr  
intss 

monthCountss 
=ss  
(ss! "
(ss" #
intss# &
)ss& '
StartQuarterss' 3
-ss4 5
$numss6 7
)ss7 8
*ss9 :
TimeSpecss; C
.ssC D
MonthsPerQuarterssD T
;ssT U
TimeTooltt 
.tt 
AddMonthtt !
(tt! "
BaseYeartt" *
,tt* +

,tt9 :

monthCounttt; E
,ttE F
outttG J
	startYearttK T
,ttT U
outttV Y
monthttZ _
)tt_ `
;tt` a
intvv 
endYearvv 
;vv 

monthCountww 
+=ww 
TimeSpecww &
.ww& '
MonthsPerQuarterww' 7
;ww7 8
TimeToolxx 
.xx 
AddMonthxx !
(xx! "
BaseYearxx" *
,xx* +

,xx9 :

monthCountxx; E
,xxE F
outxxG J
endYearxxK R
,xxR S
outxxT W
monthxxX ]
)xx] ^
;xx^ _
returnyy 
	startYearyy  
!=yy! #
endYearyy$ +
;yy+ ,
}zz 
}{{ 	
public~~ 
Quarter~~ 
GetPreviousQuarter~~ )
(~~) *
)~~* +
{ 	
return
�� 
AddQuarters
�� 
(
�� 
-
��  
$num
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
Quarter
�� 
GetNextQuarter
�� %
(
��% &
)
��& '
{
�� 	
return
�� 
AddQuarters
�� 
(
�� 
$num
��  
)
��  !
;
��! "
}
�� 	
public
�� 
Quarter
�� 
AddQuarters
�� "
(
��" #
int
��# &
count
��' ,
)
��, -
{
�� 	
int
�� 
year
�� 
;
�� 
YearQuarter
�� 
quarter
�� 
;
��  
TimeTool
�� 
.
�� 

AddQuarter
�� 
(
��  
BaseYear
��  (
,
��( )
StartQuarter
��* 6
,
��6 7
count
��8 =
,
��= >
out
��? B
year
��C G
,
��G H
out
��I L
quarter
��M T
)
��T U
;
��U V
return
�� 
new
�� 
Quarter
�� 
(
�� 
year
�� #
,
��# $
quarter
��% ,
,
��, -
Calendar
��. 6
)
��6 7
;
��7 8
}
�� 	
	protected
�� 
override
�� 
string
�� !
Format
��" (
(
��( )
ITimeFormatter
��) 7
	formatter
��8 A
)
��A B
{
�� 	
return
�� 
	formatter
�� 
.
�� 
GetCalendarPeriod
�� .
(
��. /
QuarterOfYearName
��/ @
,
��@ A
	formatter
�� 
.
�� 
GetShortDate
�� &
(
��& '
Start
��' ,
)
��, -
,
��- .
	formatter
��/ 8
.
��8 9
GetShortDate
��9 E
(
��E F
End
��F I
)
��I J
,
��J K
Duration
��L T
)
��T U
;
��U V
}
�� 	
}
�� 
}�� �&
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Quarters.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Quarters  
:! "
QuarterTimeRange# 3
{ 
public 
Quarters 
( 
DateTime  
moment! '
,' (
YearQuarter) 4
startYearQuarter5 E
,E F
intG J
countK P
)P Q
:R S
this 
( 
moment 
, 
startYearQuarter )
,) *
count+ 0
,0 1
new2 5
TimeCalendar6 B
(B C
)C D
)D E
{ 	
} 	
public 
Quarters 
( 
DateTime  
moment! '
,' (
YearQuarter) 4
startYearQuarter5 E
,E F
intG J
countK P
,P Q

calendar` h
)h i
:j k
this 
( 
TimeTool 
. 
	GetYearOf #
(# $
calendar$ ,
., -

,: ;
calendar< D
.D E
GetYearE L
(L M
momentM S
)S T
,T U
calendarV ^
.^ _
GetMonth_ g
(g h
momenth n
)n o
)o p
,p q
startYearQuarter 
, 
count #
,# $
calendar% -
)- .
{ 	
} 	
public 
Quarters 
( 
int 
	startYear %
,% &
YearQuarter' 2
startYearQuarter3 C
,C D
intE H
quarterCountI U
)U V
:W X
this   
(   
	startYear   
,   
startYearQuarter   ,
,  , -
quarterCount  . :
,  : ;
new  < ?
TimeCalendar  @ L
(  L M
)  M N
)  N O
{!! 	
}"" 	
public%% 
Quarters%% 
(%% 
int%% 
	startYear%% %
,%%% &
YearQuarter%%' 2
startYearQuarter%%3 C
,%%C D
int%%E H
quarterCount%%I U
,%%U V

calendar%%e m
)%%m n
:%%o p
base&& 
(&& 
	startYear&& 
,&& 
startYearQuarter&& ,
,&&, -
quarterCount&&. :
,&&: ;
calendar&&< D
)&&D E
{'' 	
}(( 	
public++ !
ITimePeriodCollection++ $
GetQuarters++% 0
(++0 1
)++1 2
{,, 	 
TimePeriodCollection--  
quarters--! )
=--* +
new--, / 
TimePeriodCollection--0 D
(--D E
)--E F
;--F G
for.. 
(.. 
int.. 
i.. 
=.. 
$num.. 
;.. 
i.. 
<.. 
QuarterCount..  ,
;.., -
i... /
++../ 1
)..1 2
{// 
int00 
year00 
;00 
YearQuarter11 
quarter11 #
;11# $
TimeTool22 
.22 

AddQuarter22 #
(22# $
BaseYear22$ ,
,22, -
StartQuarter22. :
,22: ;
i22< =
,22= >
out22? B
year22C G
,22G H
out22I L
quarter22M T
)22T U
;22U V
quarters33 
.33 
Add33 
(33 
new33  
Quarter33! (
(33( )
year33) -
,33- .
quarter33/ 6
,336 7
Calendar338 @
)33@ A
)33A B
;33B C
}44 
return55 
quarters55 
;55 
}66 	
	protected99 
override99 
string99 !
Format99" (
(99( )
ITimeFormatter99) 7
	formatter998 A
)99A B
{:: 	
return;; 
	formatter;; 
.;; 
GetCalendarPeriod;; .
(;;. /"
StartQuarterOfYearName;;/ E
,;;E F 
EndQuarterOfYearName;;G [
,;;[ \
	formatter<< 
.<< 
GetShortDate<< &
(<<& '
Start<<' ,
)<<, -
,<<- .
	formatter<</ 8
.<<8 9
GetShortDate<<9 E
(<<E F
End<<F I
)<<I J
,<<J K
Duration<<L T
)<<T U
;<<U V
}== 	
}?? 
}AA �h
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\QuarterTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 
QuarterTimeRange *
:+ ,
CalendarTimeRange- >
{ 
	protected 
QuarterTimeRange "
(" #
int# &
	startYear' 0
,0 1
YearQuarter2 =
startQuarter> J
,J K
intL O
quarterCountP \
)\ ]
:^ _
this 
( 
	startYear 
, 
startQuarter (
,( )
quarterCount* 6
,6 7
new8 ;
TimeCalendar< H
(H I
)I J
)J K
{ 	
} 	
	protected 
QuarterTimeRange "
(" #
int# &
	startYear' 0
,0 1
YearQuarter2 =
startQuarter> J
,J K
intL O
quarterCountP \
,\ ]

calendarl t
)t u
:v w
base 
( 
GetPeriodOf 
( 
calendar %
,% &
	startYear' 0
,0 1
startQuarter2 >
,> ?
quarterCount@ L
)L M
,M N
calendarO W
)W X
{ 	
this 
. 
	startYear 
= 
	startYear &
;& '
this 
. 
startQuarter 
= 
startQuarter  ,
;, -
this 
. 
quarterCount 
= 
quarterCount  ,
;, -
TimeTool 
. 

AddQuarter 
(  
	startYear  )
,) *
startQuarter+ 7
,7 8
quarterCount9 E
-F G
$numH I
,I J
outK N
endYearO V
,V W
outX [

endQuarter\ f
)f g
;g h
} 	
public"" 
override"" 
int"" 
BaseYear"" $
{## 	
get$$ 
{$$ 
return$$ 
	startYear$$ "
;$$" #
}$$$ %
}%% 	
public(( 
int(( 
	StartYear(( 
{)) 	
get** 
{** 
return** 
Calendar** !
.**! "
GetYear**" )
(**) *
	startYear*** 3
,**3 4
(**5 6
int**6 9
)**9 :
Calendar**: B
.**B C

)**P Q
;**Q R
}**S T
}++ 	
public.. 
int.. 
EndYear.. 
{// 	
get00 
{00 
return00 
Calendar00 !
.00! "
GetYear00" )
(00) *
endYear00* 1
,001 2
(003 4
int004 7
)007 8
Calendar008 @
.00@ A

)00N O
;00O P
}00Q R
}11 	
public44 
YearQuarter44 
StartQuarter44 '
{55 	
get66 
{66 
return66 
startQuarter66 %
;66% &
}66' (
}77 	
public:: 
YearQuarter:: 

EndQuarter:: %
{;; 	
get<< 
{<< 
return<< 

endQuarter<< #
;<<# $
}<<% &
}== 	
public@@ 
int@@ 
QuarterCount@@ 
{AA 	
getBB 
{BB 
returnBB 
quarterCountBB %
;BB% &
}BB' (
}CC 	
publicFF 
stringFF 
StartQuarterNameFF &
{GG 	
getHH 
{HH 
returnHH 
CalendarHH !
.HH! "
GetQuarterNameHH" 0
(HH0 1
StartQuarterHH1 =
)HH= >
;HH> ?
}HH@ A
}II 	
publicLL 
stringLL "
StartQuarterOfYearNameLL ,
{MM 	
getNN 
{NN 
returnNN 
CalendarNN !
.NN! " 
GetQuarterOfYearNameNN" 6
(NN6 7
	StartYearNN7 @
,NN@ A
StartQuarterNNB N
)NNN O
;NNO P
}NNQ R
}OO 	
publicRR 
stringRR 
EndQuarterNameRR $
{SS 	
getTT 
{TT 
returnTT 
CalendarTT !
.TT! "
GetQuarterNameTT" 0
(TT0 1

EndQuarterTT1 ;
)TT; <
;TT< =
}TT> ?
}UU 	
publicXX 
stringXX  
EndQuarterOfYearNameXX *
{YY 	
getZZ 
{ZZ 
returnZZ 
CalendarZZ !
.ZZ! " 
GetQuarterOfYearNameZZ" 6
(ZZ6 7
EndYearZZ7 >
,ZZ> ?

EndQuarterZZ@ J
)ZZJ K
;ZZK L
}ZZM N
}[[ 	
public^^ !
ITimePeriodCollection^^ $
	GetMonths^^% .
(^^. /
)^^/ 0
{__ 	 
TimePeriodCollection``  
months``! '
=``( )
new``* - 
TimePeriodCollection``. B
(``B C
)``C D
;``D E
foraa 
(aa 
intaa 
iaa 
=aa 
$numaa 
;aa 
iaa 
<aa 
quarterCountaa  ,
;aa, -
iaa. /
++aa/ 1
)aa1 2
{bb 
forcc 
(cc 
intcc 
monthcc 
=cc  
$numcc! "
;cc" #
monthcc$ )
<cc* +
TimeSpeccc, 4
.cc4 5
MonthsPerQuartercc5 E
;ccE F
monthccG L
++ccL N
)ccN O
{dd 
intee 
yearee 
;ee 
	YearMonthff 
	yearMonthff '
;ff' (
TimeToolgg 
.gg 
AddMonthgg %
(gg% &
	startYeargg& /
,gg/ 0

,gg> ?
igg@ A
*ggB C
TimeSpecggD L
.ggL M
MonthsPerQuarterggM ]
+gg^ _
monthgg` e
,gge f
outggg j
yearggk o
,ggo p
outggq t
	yearMonthggu ~
)gg~ 
;	gg �
monthshh 
.hh 
Addhh 
(hh 
newhh "
Monthhh# (
(hh( )
yearhh) -
,hh- .
	yearMonthhh/ 8
,hh8 9
Calendarhh: B
)hhB C
)hhC D
;hhD E
}ii 
}jj 
returnkk 
monthskk 
;kk 
}ll 	
	protectedoo 
overrideoo 
booloo 
IsEqualoo  '
(oo' (
objectoo( .
objoo/ 2
)oo2 3
{pp 	
returnqq 
baseqq 
.qq 
IsEqualqq 
(qq  
objqq  #
)qq# $
&&qq% '
HasSameDataqq( 3
(qq3 4
objqq4 7
asqq8 :
QuarterTimeRangeqq; K
)qqK L
;qqL M
}rr 	
privateuu 
booluu 
HasSameDatauu  
(uu  !
QuarterTimeRangeuu! 1
compuu2 6
)uu6 7
{vv 	
returnww 
	startYearxx 
==xx 
compxx !
.xx! "
	startYearxx" +
&&xx, .
startQuarteryy 
==yy 
compyy  $
.yy$ %
startQuarteryy% 1
&&yy2 4
quarterCountzz 
==zz 
compzz  $
.zz$ %
quarterCountzz% 1
&&zz2 4
endYear{{ 
=={{ 
comp{{ 
.{{  
endYear{{  '
&&{{( *

endQuarter|| 
==|| 
comp|| "
.||" #

endQuarter||# -
;||- .
}}} 	
	protected
�� 
override
�� 
int
�� 
ComputeHashCode
�� .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
base
��, 0
.
��0 1
ComputeHashCode
��1 @
(
��@ A
)
��A B
,
��B C
	startYear
��D M
,
��M N
startQuarter
��O [
,
��[ \
quarterCount
��] i
,
��i j
endYear
��k r
,
��r s

endQuarter
��t ~
)
��~ 
;�� �
}
�� 	
private
�� 
static
�� 
DateTime
�� 
GetStartOfQuarter
��  1
(
��1 2

��2 ?
calendar
��@ H
,
��H I
int
��J M
year
��N R
,
��R S
YearQuarter
��T _
quarter
��` g
)
��g h
{
�� 	
DateTime
�� 
startOfQuarter
�� #
;
��# $
switch
�� 
(
�� 
calendar
�� 
.
�� 
YearType
�� %
)
��% &
{
�� 
case
�� 
YearType
�� 
.
�� 

FiscalYear
�� (
:
��( )
startOfQuarter
�� "
=
��# $ 
FiscalCalendarTool
��% 7
.
��7 8
GetStartOfQuarter
��8 I
(
��I J
year
��J N
,
��N O
quarter
��P W
,
��W X
calendar
��  
.
��  !

��! .
,
��. /
calendar
��0 8
.
��8 9"
FiscalFirstDayOfYear
��9 M
,
��M N
calendar
��O W
.
��W X!
FiscalYearAlignment
��X k
)
��k l
;
��l m
break
�� 
;
�� 
default
�� 
:
�� 
DateTime
�� 
	yearStart
�� &
=
��' (
new
��) ,
DateTime
��- 5
(
��5 6
year
��6 :
,
��: ;
(
��< =
int
��= @
)
��@ A
calendar
��A I
.
��I J

��J W
,
��W X
$num
��Y Z
)
��Z [
;
��[ \
startOfQuarter
�� "
=
��# $
	yearStart
��% .
.
��. /
	AddMonths
��/ 8
(
��8 9
(
��9 :
(
��: ;
int
��; >
)
��> ?
quarter
��? F
-
��G H
$num
��I J
)
��J K
*
��L M
TimeSpec
��N V
.
��V W
MonthsPerQuarter
��W g
)
��g h
;
��h i
break
�� 
;
�� 
}
�� 
return
�� 
startOfQuarter
�� !
;
��! "
}
�� 	
private
�� 
static
�� 
	TimeRange
��  
GetPeriodOf
��! ,
(
��, -

��- :
calendar
��; C
,
��C D
int
��E H
	startYear
��I R
,
��R S
YearQuarter
��T _
startQuarter
��` l
,
��l m
int
��n q
quarterCount
��r ~
)
��~ 
{
�� 	
if
�� 
(
�� 
quarterCount
�� 
<
�� 
$num
��  
)
��  !
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 D
)
��D E
;
��E F
}
�� 
DateTime
�� 
start
�� 
=
�� 
GetStartOfQuarter
�� .
(
��. /
calendar
��/ 7
,
��7 8
	startYear
��9 B
,
��B C
startQuarter
��D P
)
��P Q
;
��Q R
int
�� 
endYear
�� 
;
�� 
YearQuarter
�� 

endQuarter
�� "
;
��" #
TimeTool
�� 
.
�� 

AddQuarter
�� 
(
��  
	startYear
��  )
,
��) *
startQuarter
��+ 7
,
��7 8
quarterCount
��9 E
,
��E F
out
��G J
endYear
��K R
,
��R S
out
��T W

endQuarter
��X b
)
��b c
;
��c d
DateTime
�� 
end
�� 
=
�� 
GetStartOfQuarter
�� ,
(
��, -
calendar
��- 5
,
��5 6
endYear
��7 >
,
��> ?

endQuarter
��@ J
)
��J K
;
��K L
return
�� 
new
�� 
	TimeRange
��  
(
��  !
start
��! &
,
��& '
end
��( +
)
��+ ,
;
��, -
}
�� 	
private
�� 
readonly
�� 
int
�� 
	startYear
�� &
;
��& '
private
�� 
readonly
�� 
YearQuarter
�� $
startQuarter
��% 1
;
��1 2
private
�� 
readonly
�� 
int
�� 
quarterCount
�� )
;
��) *
private
�� 
readonly
�� 
int
�� 
endYear
�� $
;
��$ %
private
�� 
readonly
�� 
YearQuarter
�� $

endQuarter
��% /
;
��/ 0
}
�� 
}�� �
qF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\SeekBoundaryMode.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 
SeekBoundaryMode  
{ 
Fill 
, 
Next 
, 
} 
} �
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\SeekDirection.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

enum 

{ 
Forward 
, 
Backward 
, 
} 
} �
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\StaticClock.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
StaticClock 
: 
IClock %
{ 
public 
StaticClock 
( 
DateTime #
now$ '
)' (
{ 	
this 
. 
now 
= 
now 
; 
} 	
public 
DateTime 
Now 
{ 	
get 
{ 
return 
now 
; 
} 
} 	
private 
readonly 
DateTime !
now" %
;% &
}!! 
}## ��
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Strings.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{
internal 
sealed
class 
Strings !
{ 
public 
static 
string 
SystemYearName +
(+ ,
int, /
year0 4
)4 5
{ 	
return 
Format 
( 
inst 
. 
	GetString (
(( )
$str) 9
)9 :
,: ;
year< @
)@ A
;A B
} 	
public 
static 
string 
CalendarYearName -
(- .
int. 1
year2 6
)6 7
{ 	
return 
Format 
( 
inst 
. 
	GetString (
(( )
$str) ;
); <
,< =
year> B
)B C
;C D
} 	
public"" 
static"" 
string"" 
FiscalYearName"" +
(""+ ,
int"", /
year""0 4
)""4 5
{## 	
return$$ 
Format$$ 
($$ 
inst$$ 
.$$ 
	GetString$$ (
($$( )
$str$$) 9
)$$9 :
,$$: ;
year$$< @
)$$@ A
;$$A B
}%% 	
public(( 
static(( 
string(( 
SchoolYearName(( +
(((+ ,
int((, /
year((0 4
)((4 5
{)) 	
return** 
Format** 
(** 
inst** 
.** 
	GetString** (
(**( )
$str**) 9
)**9 :
,**: ;
year**< @
)**@ A
;**A B
}++ 	
public22 
static22 
string22 
SystemHalfyearName22 /
(22/ 0
YearHalfyear220 <
yearHalfyear22= I
)22I J
{33 	
return44 
Format44 
(44 
inst44 
.44 
	GetString44 (
(44( )
$str44) =
)44= >
,44> ?
(44@ A
int44A D
)44D E
yearHalfyear44E Q
)44Q R
;44R S
}55 	
public88 
static88 
string88  
CalendarHalfyearName88 1
(881 2
YearHalfyear882 >
yearHalfyear88? K
)88K L
{99 	
return:: 
Format:: 
(:: 
inst:: 
.:: 
	GetString:: (
(::( )
$str::) ?
)::? @
,::@ A
(::B C
int::C F
)::F G
yearHalfyear::G S
)::S T
;::T U
};; 	
public>> 
static>> 
string>> 
FiscalHalfyearName>> /
(>>/ 0
YearHalfyear>>0 <
yearHalfyear>>= I
)>>I J
{?? 	
return@@ 
Format@@ 
(@@ 
inst@@ 
.@@ 
	GetString@@ (
(@@( )
$str@@) =
)@@= >
,@@> ?
(@@@ A
int@@A D
)@@D E
yearHalfyear@@E Q
)@@Q R
;@@R S
}AA 	
publicDD 
staticDD 
stringDD 
SchoolHalfyearNameDD /
(DD/ 0
YearHalfyearDD0 <
yearHalfyearDD= I
)DDI J
{EE 	
returnFF 
FormatFF 
(FF 
instFF 
.FF 
	GetStringFF (
(FF( )
$strFF) =
)FF= >
,FF> ?
(FF@ A
intFFA D
)FFD E
yearHalfyearFFE Q
)FFQ R
;FFR S
}GG 	
publicJJ 
staticJJ 
stringJJ $
SystemHalfyearOfYearNameJJ 5
(JJ5 6
YearHalfyearJJ6 B
yearHalfyearJJC O
,JJO P
intJJQ T
yearJJU Y
)JJY Z
{KK 	
returnLL 
FormatLL 
(LL 
instLL 
.LL 
	GetStringLL (
(LL( )
$strLL) C
)LLC D
,LLD E
(LLF G
intLLG J
)LLJ K
yearHalfyearLLK W
,LLW X
yearLLY ]
)LL] ^
;LL^ _
}MM 	
publicPP 
staticPP 
stringPP &
CalendarHalfyearOfYearNamePP 7
(PP7 8
YearHalfyearPP8 D
yearHalfyearPPE Q
,PPQ R
intPPS V
yearPPW [
)PP[ \
{QQ 	
returnRR 
FormatRR 
(RR 
instRR 
.RR 
	GetStringRR (
(RR( )
$strRR) E
)RRE F
,RRF G
(RRH I
intRRI L
)RRL M
yearHalfyearRRM Y
,RRY Z
yearRR[ _
)RR_ `
;RR` a
}SS 	
publicVV 
staticVV 
stringVV $
FiscalHalfyearOfYearNameVV 5
(VV5 6
YearHalfyearVV6 B
yearHalfyearVVC O
,VVO P
intVVQ T
yearVVU Y
)VVY Z
{WW 	
returnXX 
FormatXX 
(XX 
instXX 
.XX 
	GetStringXX (
(XX( )
$strXX) C
)XXC D
,XXD E
(XXF G
intXXG J
)XXJ K
yearHalfyearXXK W
,XXW X
yearXXY ]
)XX] ^
;XX^ _
}YY 	
public\\ 
static\\ 
string\\ $
SchoolHalfyearOfYearName\\ 5
(\\5 6
YearHalfyear\\6 B
yearHalfyear\\C O
,\\O P
int\\Q T
year\\U Y
)\\Y Z
{]] 	
return^^ 
Format^^ 
(^^ 
inst^^ 
.^^ 
	GetString^^ (
(^^( )
$str^^) C
)^^C D
,^^D E
(^^F G
int^^G J
)^^J K
yearHalfyear^^K W
,^^W X
year^^Y ]
)^^] ^
;^^^ _
}__ 	
publicff 
staticff 
stringff 
SystemQuarterNameff .
(ff. /
YearQuarterff/ :
yearQuarterff; F
)ffF G
{gg 	
returnhh 
Formathh 
(hh 
insthh 
.hh 
	GetStringhh (
(hh( )
$strhh) <
)hh< =
,hh= >
(hh? @
inthh@ C
)hhC D
yearQuarterhhD O
)hhO P
;hhP Q
}ii 	
publicll 
staticll 
stringll 
CalendarQuarterNamell 0
(ll0 1
YearQuarterll1 <
yearQuarterll= H
)llH I
{mm 	
returnnn 
Formatnn 
(nn 
instnn 
.nn 
	GetStringnn (
(nn( )
$strnn) >
)nn> ?
,nn? @
(nnA B
intnnB E
)nnE F
yearQuarternnF Q
)nnQ R
;nnR S
}oo 	
publicrr 
staticrr 
stringrr 
FiscalQuarterNamerr .
(rr. /
YearQuarterrr/ :
yearQuarterrr; F
)rrF G
{ss 	
returntt 
Formattt 
(tt 
insttt 
.tt 
	GetStringtt (
(tt( )
$strtt) <
)tt< =
,tt= >
(tt? @
inttt@ C
)ttC D
yearQuarterttD O
)ttO P
;ttP Q
}uu 	
publicxx 
staticxx 
stringxx 
SchoolQuarterNamexx .
(xx. /
YearQuarterxx/ :
yearQuarterxx; F
)xxF G
{yy 	
returnzz 
Formatzz 
(zz 
instzz 
.zz 
	GetStringzz (
(zz( )
$strzz) <
)zz< =
,zz= >
(zz? @
intzz@ C
)zzC D
yearQuarterzzD O
)zzO P
;zzP Q
}{{ 	
public~~ 
static~~ 
string~~ #
SystemQuarterOfYearName~~ 4
(~~4 5
YearQuarter~~5 @
yearQuarter~~A L
,~~L M
int~~N Q
year~~R V
)~~V W
{ 	
return
�� 
Format
�� 
(
�� 
inst
�� 
.
�� 
	GetString
�� (
(
��( )
$str
��) B
)
��B C
,
��C D
(
��E F
int
��F I
)
��I J
yearQuarter
��J U
,
��U V
year
��W [
)
��[ \
;
��\ ]
}
�� 	
public
�� 
static
�� 
string
�� '
CalendarQuarterOfYearName
�� 6
(
��6 7
YearQuarter
��7 B
yearQuarter
��C N
,
��N O
int
��P S
year
��T X
)
��X Y
{
�� 	
return
�� 
Format
�� 
(
�� 
inst
�� 
.
�� 
	GetString
�� (
(
��( )
$str
��) D
)
��D E
,
��E F
(
��G H
int
��H K
)
��K L
yearQuarter
��L W
,
��W X
year
��Y ]
)
��] ^
;
��^ _
}
�� 	
public
�� 
static
�� 
string
�� %
FiscalQuarterOfYearName
�� 4
(
��4 5
YearQuarter
��5 @
yearQuarter
��A L
,
��L M
int
��N Q
year
��R V
)
��V W
{
�� 	
return
�� 
Format
�� 
(
�� 
inst
�� 
.
�� 
	GetString
�� (
(
��( )
$str
��) B
)
��B C
,
��C D
(
��E F
int
��F I
)
��I J
yearQuarter
��J U
,
��U V
year
��W [
)
��[ \
;
��\ ]
}
�� 	
public
�� 
static
�� 
string
�� %
SchoolQuarterOfYearName
�� 4
(
��4 5
YearQuarter
��5 @
yearQuarter
��A L
,
��L M
int
��N Q
year
��R V
)
��V W
{
�� 	
return
�� 
Format
�� 
(
�� 
inst
�� 
.
�� 
	GetString
�� (
(
��( )
$str
��) B
)
��B C
,
��C D
(
��E F
int
��F I
)
��I J
yearQuarter
��J U
,
��U V
year
��W [
)
��[ \
;
��\ ]
}
�� 	
public
�� 
static
�� 
string
�� 
MonthOfYearName
�� ,
(
��, -
string
��- 3
	monthName
��4 =
,
��= >
string
��? E
yearName
��F N
)
��N O
{
�� 	
return
�� 
Format
�� 
(
�� 
inst
�� 
.
�� 
	GetString
�� (
(
��( )
$str
��) :
)
��: ;
,
��; <
	monthName
��= F
,
��F G
yearName
��H P
)
��P Q
;
��Q R
}
�� 	
public
�� 
static
�� 
string
�� 
WeekOfYearName
�� +
(
��+ ,
int
��, /

weekOfYear
��0 :
,
��: ;
string
��< B
yearName
��C K
)
��K L
{
�� 	
return
�� 
Format
�� 
(
�� 
inst
�� 
.
�� 
	GetString
�� (
(
��( )
$str
��) 9
)
��9 :
,
��: ;

weekOfYear
��< F
,
��F G
yearName
��H P
)
��P Q
;
��Q R
}
�� 	
public
�� 
static
�� 
string
�� 

�� *
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 7
)
��7 8
;
��8 9
}
��: ;
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanYear
�� )
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 6
)
��6 7
;
��7 8
}
��9 :
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanMonths
�� +
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 8
)
��8 9
;
��9 :
}
��; <
}
�� 	
public
�� 
static
�� 
string
�� 

�� *
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 7
)
��7 8
;
��8 9
}
��: ;
}
�� 	
public
�� 
static
�� 
string
�� 

�� *
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 7
)
��7 8
;
��8 9
}
��: ;
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanWeek
�� )
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 6
)
��6 7
;
��7 8
}
��9 :
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanDays
�� )
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 6
)
��6 7
;
��7 8
}
��9 :
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanDay
�� (
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 5
)
��5 6
;
��6 7
}
��8 9
}
�� 	
public
�� 
static
�� 
string
�� 

�� *
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 7
)
��7 8
;
��8 9
}
��: ;
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanHour
�� )
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 6
)
��6 7
;
��7 8
}
��9 :
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanMinutes
�� ,
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 9
)
��9 :
;
��: ;
}
��< =
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanMinute
�� +
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 8
)
��8 9
;
��9 :
}
��; <
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanSeconds
�� ,
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 9
)
��9 :
;
��: ;
}
��< =
}
�� 	
public
�� 
static
�� 
string
�� 
TimeSpanSecond
�� +
{
�� 	
get
�� 
{
�� 
return
�� 
inst
�� 
.
�� 
	GetString
�� '
(
��' (
$str
��( 8
)
��8 9
;
��9 :
}
��; <
}
�� 	
private
�� 
static
�� 
string
�� 
Format
�� $
(
��$ %
string
��% +
format
��, 2
,
��2 3
params
��4 :
object
��; A
[
��A B
]
��B C
args
��D H
)
��H I
{
�� 	
return
�� 
string
�� 
.
�� 
Format
��  
(
��  !
CultureInfo
��! ,
.
��, -
InvariantCulture
��- =
,
��= >
format
��? E
,
��E F
args
��G K
)
��K L
;
��L M
}
�� 	
private
�� 
static
�� 
ResourceManager
�� &
NewInst
��' .
(
��. /
Type
��/ 3

��4 A
)
��A B
{
�� 	
if
�� 
(
�� 

�� 
==
��  
null
��! %
)
��% &
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 ?
)
��? @
;
��@ A
}
�� 
if
�� 
(
�� 

�� 
.
�� 
FullName
�� &
==
��' )
null
��* .
)
��. /
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
return
�� 
new
�� 
ResourceManager
�� &
(
��& '

��' 4
)
��4 5
;
��5 6
}
�� 	
private
�� 
static
�� 
readonly
�� 
ResourceManager
��  /
inst
��0 4
=
��5 6
NewInst
��7 >
(
��> ?
typeof
��? E
(
��E F
Strings
��F M
)
��M N
)
��N O
;
��O P
}
�� 
}�� �
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\SystemClock.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
SystemClock 
: 
IClock %
{ 
internal 
SystemClock 
( 
) 
{ 	
} 	
public 
DateTime 
Now 
{ 	
get 
{ 
return 
DateTime !
.! "
Now" %
;% &
}' (
} 	
} 
} ��
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Time.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

struct 
Time 
: 
IComparable $
,$ %
IComparable& 1
<1 2
Time2 6
>6 7
,7 8

IEquatable9 C
<C D
TimeD H
>H I
{ 
public 
Time 
( 
DateTime 
dateTime %
)% &
{ 	
duration 
= 
dateTime 
.  
	TimeOfDay  )
;) *
} 	
public 
Time 
( 
TimeSpan 
duration %
)% &
:' (
this 
( 
Math 
. 
Abs 
( 
duration "
." #
Hours# (
)( )
,) *
Math+ /
./ 0
Abs0 3
(3 4
duration4 <
.< =
Minutes= D
)D E
,E F
Math 
. 
Abs  
(  !
duration! )
.) *
Seconds* 1
)1 2
,2 3
Math4 8
.8 9
Abs9 <
(< =
duration= E
.E F
MillisecondsF R
)R S
)S T
{ 	
} 	
public 
Time 
( 
int 
hour 
= 
$num  
,  !
int" %
minute& ,
=- .
$num/ 0
,0 1
int2 5
second6 <
== >
$num? @
,@ A
intB E
millisecondF Q
=R S
$numT U
)U V
{   	
if!! 
(!! 
hour!! 
<!! 
$num!! 
||!! 
hour!!  
>!!! "
TimeSpec!!# +
.!!+ ,
HoursPerDay!!, 7
)!!7 8
{"" 
throw## 
new## '
ArgumentOutOfRangeException## 5
(##5 6
$str##6 <
)##< =
;##= >
}$$ 
if%% 
(%% 
hour%% 
==%% 
TimeSpec%%  
.%%  !
HoursPerDay%%! ,
)%%, -
{&& 
if'' 
('' 
minute'' 
>'' 
$num'' 
)'' 
{(( 
throw)) 
new)) '
ArgumentOutOfRangeException)) 9
())9 :
$str)): B
)))B C
;))C D
}** 
if++ 
(++ 
second++ 
>++ 
$num++ 
)++ 
{,, 
throw-- 
new-- '
ArgumentOutOfRangeException-- 9
(--9 :
$str--: B
)--B C
;--C D
}.. 
if// 
(// 
millisecond// 
>//  !
$num//" #
)//# $
{00 
throw11 
new11 '
ArgumentOutOfRangeException11 9
(119 :
$str11: G
)11G H
;11H I
}22 
}33 
if44 
(44 
minute44 
<44 
$num44 
||44 
minute44 $
>=44% '
TimeSpec44( 0
.440 1
MinutesPerHour441 ?
)44? @
{55 
throw66 
new66 '
ArgumentOutOfRangeException66 5
(665 6
$str666 >
)66> ?
;66? @
}77 
if88 
(88 
second88 
<88 
$num88 
||88 
second88 $
>=88% '
TimeSpec88( 0
.880 1
SecondsPerMinute881 A
)88A B
{99 
throw:: 
new:: '
ArgumentOutOfRangeException:: 5
(::5 6
$str::6 >
)::> ?
;::? @
};; 
if<< 
(<< 
millisecond<< 
<<< 
$num<< 
||<<  "
millisecond<<# .
>=<</ 1
TimeSpec<<2 :
.<<: ;!
MillisecondsPerSecond<<; P
)<<P Q
{== 
throw>> 
new>> '
ArgumentOutOfRangeException>> 5
(>>5 6
$str>>6 C
)>>C D
;>>D E
}?? 
durationAA 
=AA 
newAA 
TimeSpanAA #
(AA# $
$numAA$ %
,AA% &
hourAA' +
,AA+ ,
minuteAA- 3
,AA3 4
secondAA5 ;
,AA; <
millisecondAA= H
)AAH I
;AAI J
}BB 	
publicEE 
intEE 
HourEE 
{FF 	
getGG 
{GG 
returnGG 
durationGG !
.GG! "
HoursGG" '
;GG' (
}GG) *
}HH 	
publicKK 
intKK 
MinuteKK 
{LL 	
getMM 
{MM 
returnMM 
durationMM !
.MM! "
MinutesMM" )
;MM) *
}MM+ ,
}NN 	
publicQQ 
intQQ 
SecondQQ 
{RR 	
getSS 
{SS 
returnSS 
durationSS !
.SS! "
SecondsSS" )
;SS) *
}SS+ ,
}TT 	
publicWW 
intWW 
MillisecondWW 
{XX 	
getYY 
{YY 
returnYY 
durationYY !
.YY! "
MillisecondsYY" .
;YY. /
}YY0 1
}ZZ 	
public]] 
TimeSpan]] 
Duration]]  
{^^ 	
get__ 
{__ 
return__ 
duration__ !
;__! "
}__# $
}`` 	
publiccc 
boolcc 
IsZerocc 
{dd 	
getee 
{ee 
returnee 
durationee !
.ee! "
Equalsee" (
(ee( )
TimeSpanee) 1
.ee1 2
Zeroee2 6
)ee6 7
;ee7 8
}ee9 :
}ff 	
publicii 
boolii 
	IsFullDayii 
{jj 	
getkk 
{kk 
returnkk 
(kk 
intkk 
)kk 
durationkk &
.kk& '

TotalHourskk' 1
==kk2 4
TimeSpeckk5 =
.kk= >
HoursPerDaykk> I
;kkI J
}kkK L
}ll 	
publicoo 
booloo 
IsFullDayOrZerooo #
{pp 	
getqq 
{qq 
returnqq 
	IsFullDayqq "
||qq# %
IsZeroqq& ,
;qq, -
}qq. /
}rr 	
publicuu 
longuu 
Ticksuu 
{vv 	
getww 
{ww 
returnww 
durationww !
.ww! "
Ticksww" '
;ww' (
}ww) *
}xx 	
public{{ 
double{{ 

TotalHours{{  
{|| 	
get}} 
{}} 
return}} 
duration}} !
.}}! "

TotalHours}}" ,
;}}, -
}}}. /
}~~ 	
public
�� 
double
�� 
TotalMinutes
�� "
{
�� 	
get
�� 
{
�� 
return
�� 
duration
�� !
.
��! "
TotalMinutes
��" .
;
��. /
}
��0 1
}
�� 	
public
�� 
double
�� 
TotalSeconds
�� "
{
�� 	
get
�� 
{
�� 
return
�� 
duration
�� !
.
��! "
TotalSeconds
��" .
;
��. /
}
��0 1
}
�� 	
public
�� 
double
�� 
TotalMilliseconds
�� '
{
�� 	
get
�� 
{
�� 
return
�� 
duration
�� !
.
��! "
TotalMilliseconds
��" 3
;
��3 4
}
��5 6
}
�� 	
public
�� 
int
�� 
	CompareTo
�� 
(
�� 
Time
�� !
other
��" '
)
��' (
{
�� 	
return
�� 
duration
�� 
.
�� 
	CompareTo
�� %
(
��% &
other
��& +
.
��+ ,
duration
��, 4
)
��4 5
;
��5 6
}
�� 	
public
�� 
int
�� 
	CompareTo
�� 
(
�� 
object
�� #
obj
��$ '
)
��' (
{
�� 	
return
�� 
duration
�� 
.
�� 
	CompareTo
�� %
(
��% &
(
��& '
(
��' (
Time
��( ,
)
��, -
obj
��- 0
)
��0 1
.
��1 2
duration
��2 :
)
��: ;
;
��; <
}
�� 	
public
�� 
bool
�� 
Equals
�� 
(
�� 
Time
�� 
other
��  %
)
��% &
{
�� 	
return
�� 
duration
�� 
.
�� 
Equals
�� "
(
��" #
other
��# (
.
��( )
duration
��) 1
)
��1 2
;
��2 3
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
(
�� 
(
�� 
int
�� 
)
�� 

TotalHours
�� #
)
��# $
.
��$ %
ToString
��% -
(
��- .
$str
��. 2
)
��2 3
+
��4 5
$str
��6 9
+
��: ;
Minute
��< B
.
��B C
ToString
��C K
(
��K L
$str
��L P
)
��P Q
+
��R S
$str
�� 
+
�� 
Second
�� 
.
�� 
ToString
�� %
(
��% &
$str
��& *
)
��* +
+
��, -
$str
��. 1
+
��2 3
Millisecond
��4 ?
.
��? @
ToString
��@ H
(
��H I
$str
��I N
)
��N O
;
��O P
}
�� 	
public
�� 
override
�� 
bool
�� 
Equals
�� #
(
��# $
object
��$ *
obj
��+ .
)
��. /
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
Equals
�� 
(
�� 
(
�� 
Time
�� 
)
��  
obj
��  #
)
��# $
;
��$ %
}
�� 	
public
�� 
override
�� 
int
�� 
GetHashCode
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
GetType
��, 3
(
��3 4
)
��4 5
.
��5 6
GetHashCode
��6 A
(
��A B
)
��B C
,
��C D
duration
��E M
)
��M N
;
��N O
}
�� 	
public
�� 
static
�� 
TimeSpan
�� 
operator
�� '
-
��( )
(
��) *
Time
��* .
time1
��/ 4
,
��4 5
Time
��6 :
time2
��; @
)
��@ A
{
�� 	
return
�� 
(
�� 
time1
�� 
-
�� 
time2
�� !
.
��! "
duration
��" *
)
��* +
.
��+ ,
duration
��, 4
;
��4 5
}
�� 	
public
�� 
static
�� 
Time
�� 
operator
�� #
-
��$ %
(
��% &
Time
��& *
time
��+ /
,
��/ 0
TimeSpan
��1 9
duration
��: B
)
��B C
{
�� 	
if
�� 
(
�� 
Equals
�� 
(
�� 
duration
�� 
,
��  
TimeSpan
��! )
.
��) *
Zero
��* .
)
��. /
)
��/ 0
{
�� 
return
�� 
time
�� 
;
�� 
}
�� 
DateTime
�� 
day
�� 
=
�� 
duration
�� #
>
��$ %
TimeSpan
��& .
.
��. /
Zero
��/ 3
?
��4 5
DateTime
��6 >
.
��> ?
MaxValue
��? G
.
��G H
Date
��H L
:
��M N
DateTime
��O W
.
��W X
MinValue
��X `
.
��` a
Date
��a e
;
��e f
return
�� 
new
�� 
Time
�� 
(
�� 
time
��  
.
��  !

ToDateTime
��! +
(
��+ ,
day
��, /
)
��/ 0
.
��0 1
Subtract
��1 9
(
��9 :
duration
��: B
)
��B C
)
��C D
;
��D E
}
�� 	
public
�� 
static
�� 
TimeSpan
�� 
operator
�� '
+
��( )
(
��) *
Time
��* .
time1
��/ 4
,
��4 5
Time
��6 :
time2
��; @
)
��@ A
{
�� 	
return
�� 
(
�� 
time1
�� 
+
�� 
time2
�� !
.
��! "
duration
��" *
)
��* +
.
��+ ,
duration
��, 4
;
��4 5
}
�� 	
public
�� 
static
�� 
Time
�� 
operator
�� #
+
��$ %
(
��% &
Time
��& *
time
��+ /
,
��/ 0
TimeSpan
��1 9
duration
��: B
)
��B C
{
�� 	
if
�� 
(
�� 
Equals
�� 
(
�� 
duration
�� 
,
��  
TimeSpan
��! )
.
��) *
Zero
��* .
)
��. /
)
��/ 0
{
�� 
return
�� 
time
�� 
;
�� 
}
�� 
DateTime
�� 
day
�� 
=
�� 
duration
�� #
>
��$ %
TimeSpan
��& .
.
��. /
Zero
��/ 3
?
��4 5
DateTime
��6 >
.
��> ?
MinValue
��? G
:
��H I
DateTime
��J R
.
��R S
MaxValue
��S [
;
��[ \
return
�� 
new
�� 
Time
�� 
(
�� 
time
��  
.
��  !

ToDateTime
��! +
(
��+ ,
day
��, /
)
��/ 0
.
��0 1
Add
��1 4
(
��4 5
duration
��5 =
)
��= >
)
��> ?
;
��? @
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
<
��$ %
(
��% &
Time
��& *
time1
��+ 0
,
��0 1
Time
��2 6
time2
��7 <
)
��< =
{
�� 	
return
�� 
time1
�� 
.
�� 
duration
�� !
<
��" #
time2
��$ )
.
��) *
duration
��* 2
;
��2 3
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
<=
��$ &
(
��& '
Time
��' +
time1
��, 1
,
��1 2
Time
��3 7
time2
��8 =
)
��= >
{
�� 	
return
�� 
time1
�� 
.
�� 
duration
�� !
<=
��" $
time2
��% *
.
��* +
duration
��+ 3
;
��3 4
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
==
��$ &
(
��& '
Time
��' +
left
��, 0
,
��0 1
Time
��2 6
right
��7 <
)
��< =
{
�� 	
return
�� 
Equals
�� 
(
�� 
left
�� 
,
�� 
right
��  %
)
��% &
;
��& '
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
!=
��$ &
(
��& '
Time
��' +
left
��, 0
,
��0 1
Time
��2 6
right
��7 <
)
��< =
{
�� 	
return
�� 
!
�� 
Equals
�� 
(
�� 
left
�� 
,
��  
right
��! &
)
��& '
;
��' (
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
>
��$ %
(
��% &
Time
��& *
time1
��+ 0
,
��0 1
Time
��2 6
time2
��7 <
)
��< =
{
�� 	
return
�� 
time1
�� 
.
�� 
duration
�� !
>
��" #
time2
��$ )
.
��) *
duration
��* 2
;
��2 3
}
�� 	
public
�� 
static
�� 
bool
�� 
operator
�� #
>=
��$ &
(
��& '
Time
��' +
time1
��, 1
,
��1 2
Time
��3 7
time2
��8 =
)
��= >
{
�� 	
return
�� 
time1
�� 
.
�� 
duration
�� !
>=
��" $
time2
��% *
.
��* +
duration
��+ 3
;
��3 4
}
�� 	
public
�� 
DateTime
�� 

ToDateTime
�� "
(
��" #
Date
��# '
date
��( ,
)
��, -
{
�� 	
return
�� 

ToDateTime
�� 
(
�� 
date
�� "
.
��" #
DateTime
��# +
)
��+ ,
;
��, -
}
�� 	
public
�� 
DateTime
�� 

ToDateTime
�� "
(
��" #
DateTime
��# +
dateTime
��, 4
)
��4 5
{
�� 	
return
�� 

ToDateTime
�� 
(
�� 
dateTime
�� &
,
��& '
this
��( ,
)
��, -
;
��- .
}
�� 	
public
�� 
static
�� 
DateTime
�� 

ToDateTime
�� )
(
��) *
Date
��* .
date
��/ 3
,
��3 4
Time
��5 9
time
��: >
)
��> ?
{
�� 	
return
�� 

ToDateTime
�� 
(
�� 
date
�� "
.
��" #
DateTime
��# +
,
��+ ,
time
��- 1
)
��1 2
;
��2 3
}
�� 	
public
�� 
static
�� 
DateTime
�� 

ToDateTime
�� )
(
��) *
DateTime
��* 2
dateTime
��3 ;
,
��; <
Time
��= A
time
��B F
)
��F G
{
�� 	
return
�� 
dateTime
�� 
.
�� 
Date
��  
.
��  !
Add
��! $
(
��$ %
time
��% )
.
��) *
Duration
��* 2
)
��2 3
;
��3 4
}
�� 	
private
�� 
readonly
�� 
TimeSpan
�� !
duration
��" *
;
��* +
}
�� 
}�� ��
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeBlock.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
	TimeBlock 
: 

ITimeBlock '
{ 
public 
static 
readonly 
	TimeBlock (
Anytime) 0
=1 2
new3 6
	TimeBlock7 @
(@ A
trueA E
)E F
;F G
public 
	TimeBlock 
( 
) 
: 
this 
( 
TimeSpec 
. 

,' (
TimeSpec) 1
.1 2

)? @
{ 	
} 	
internal 
	TimeBlock 
( 
bool 

isReadOnly  *
=+ ,
false- 2
)2 3
:4 5
this 
( 
TimeSpec 
. 

,' (
TimeSpec) 1
.1 2

,? @

isReadOnlyA K
)K L
{ 	
} 	
public!! 
	TimeBlock!! 
(!! 
DateTime!! !
moment!!" (
,!!( )
bool!!* .

isReadOnly!!/ 9
=!!: ;
false!!< A
)!!A B
:!!C D
this"" 
("" 
moment"" 
,"" 
TimeSpec"" !
.""! "
MinPeriodDuration""" 3
,""3 4

isReadOnly""5 ?
)""? @
{## 	
}$$ 	
public'' 
	TimeBlock'' 
('' 
DateTime'' !
start''" '
,''' (
DateTime'') 1
end''2 5
,''5 6
bool''7 ;

isReadOnly''< F
=''G H
false''I N
)''N O
{(( 	
if)) 
()) 
start)) 
<=)) 
end)) 
))) 
{** 
this++ 
.++ 
start++ 
=++ 
start++ "
;++" #
this,, 
.,, 
end,, 
=,, 
end,, 
;,, 
}-- 
else.. 
{// 
this00 
.00 
end00 
=00 
start00  
;00  !
this11 
.11 
start11 
=11 
end11  
;11  !
}22 
duration33 
=33 
this33 
.33 
end33 
-33  !
this33" &
.33& '
start33' ,
;33, -
this44 
.44 

isReadOnly44 
=44 

isReadOnly44 (
;44( )
}55 	
public88 
	TimeBlock88 
(88 
DateTime88 !
start88" '
,88' (
TimeSpan88) 1
duration882 :
,88: ;
bool88< @

isReadOnly88A K
=88L M
false88N S
)88S T
{99 	
if:: 
(:: 
duration:: 
<:: 
TimeSpec:: #
.::# $
MinPeriodDuration::$ 5
)::5 6
{;; 
throw<< 
new<< '
ArgumentOutOfRangeException<< 5
(<<5 6
$str<<6 @
)<<@ A
;<<A B
}== 
this>> 
.>> 
start>> 
=>> 
start>> 
;>> 
this?? 
.?? 
duration?? 
=?? 
duration?? $
;??$ %
end@@ 
=@@ 
start@@ 
.@@ 
Add@@ 
(@@ 
duration@@ $
)@@$ %
;@@% &
thisAA 
.AA 

isReadOnlyAA 
=AA 

isReadOnlyAA (
;AA( )
}BB 	
publicEE 
	TimeBlockEE 
(EE 
TimeSpanEE !
durationEE" *
,EE* +
DateTimeEE, 4
endEE5 8
,EE8 9
boolEE: >

isReadOnlyEE? I
=EEJ K
falseEEL Q
)EEQ R
{FF 	
ifGG 
(GG 
durationGG 
<GG 
TimeSpecGG #
.GG# $
MinPeriodDurationGG$ 5
)GG5 6
{HH 
throwII 
newII '
ArgumentOutOfRangeExceptionII 5
(II5 6
$strII6 @
)II@ A
;IIA B
}JJ 
thisKK 
.KK 
endKK 
=KK 
endKK 
;KK 
thisLL 
.LL 
durationLL 
=LL 
durationLL $
;LL$ %
startMM 
=MM 
endMM 
.MM 
SubtractMM  
(MM  !
durationMM! )
)MM) *
;MM* +
thisNN 
.NN 

isReadOnlyNN 
=NN 

isReadOnlyNN (
;NN( )
}OO 	
publicRR 
	TimeBlockRR 
(RR 
ITimePeriodRR $
copyRR% )
)RR) *
{SS 	
ifTT 
(TT 
copyTT 
==TT 
nullTT 
)TT 
{UU 
throwVV 
newVV !
ArgumentNullExceptionVV /
(VV/ 0
$strVV0 6
)VV6 7
;VV7 8
}WW 
startXX 
=XX 
copyXX 
.XX 
StartXX 
;XX 
endYY 
=YY 
copyYY 
.YY 
EndYY 
;YY 
durationZZ 
=ZZ 
copyZZ 
.ZZ 
DurationZZ $
;ZZ$ %

isReadOnly[[ 
=[[ 
copy[[ 
.[[ 

IsReadOnly[[ (
;[[( )
}\\ 	
	protected__ 
	TimeBlock__ 
(__ 
ITimePeriod__ '
copy__( ,
,__, -
bool__. 2

isReadOnly__3 =
)__= >
{`` 	
ifaa 
(aa 
copyaa 
==aa 
nullaa 
)aa 
{bb 
throwcc 
newcc !
ArgumentNullExceptioncc /
(cc/ 0
$strcc0 6
)cc6 7
;cc7 8
}dd 
startee 
=ee 
copyee 
.ee 
Startee 
;ee 
endff 
=ff 
copyff 
.ff 
Endff 
;ff 
durationgg 
=gg 
copygg 
.gg 
Durationgg $
;gg$ %
thishh 
.hh 

isReadOnlyhh 
=hh 

isReadOnlyhh (
;hh( )
}ii 	
publicll 
boolll 

IsReadOnlyll 
{mm 	
getnn 
{nn 
returnnn 

isReadOnlynn #
;nn# $
}nn% &
}oo 	
publicrr 
boolrr 
	IsAnytimerr 
{ss 	
gettt 
{tt 
returntt 
!tt 
HasStarttt "
&&tt# %
!tt& '
HasEndtt' -
;tt- .
}tt/ 0
}uu 	
publicxx 
boolxx 
IsMomentxx 
{yy 	
getzz 
{zz 
returnzz 
startzz 
.zz 
Equalszz %
(zz% &
endzz& )
)zz) *
;zz* +
}zz, -
}{{ 	
public~~ 
bool~~ 
HasStart~~ 
{ 	
get
�� 
{
�� 
return
�� 
start
�� 
!=
�� !
TimeSpec
��" *
.
��* +

��+ 8
;
��8 9
}
��: ;
}
�� 	
public
�� 
DateTime
�� 
Start
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
start
�� 
;
�� 
}
��  !
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
start
�� 
=
�� 
value
�� 
;
�� 
end
�� 
=
�� 
start
�� 
.
�� 
Add
�� 
(
��  
duration
��  (
)
��( )
;
��) *
}
�� 
}
�� 	
public
�� 
bool
�� 
HasEnd
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
end
�� 
!=
�� 
TimeSpec
��  (
.
��( )

��) 6
;
��6 7
}
��8 9
}
�� 	
public
�� 
DateTime
�� 
End
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
end
�� 
;
�� 
}
�� 
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
end
�� 
=
�� 
value
�� 
;
�� 
start
�� 
=
�� 
end
�� 
.
�� 
Subtract
�� $
(
��$ %
duration
��% -
)
��- .
;
��. /
}
�� 
}
�� 	
public
�� 
TimeSpan
�� 
Duration
��  
{
�� 	
get
�� 
{
�� 
return
�� 
duration
�� !
;
��! "
}
��# $
set
�� 
{
�� 
DurationFromStart
�� #
(
��# $
value
��$ )
)
��) *
;
��* +
}
��, -
}
�� 	
public
�� 
string
�� !
DurationDescription
�� )
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
.
��& '
Instance
��' /
.
��/ 0
GetDuration
��0 ;
(
��; <
Duration
��< D
,
��D E 
DurationFormatType
��F X
.
��X Y
Detailed
��Y a
)
��a b
;
��b c
}
��d e
}
�� 	
public
�� 
virtual
�� 
TimeSpan
�� 
GetDuration
��  +
(
��+ ,
IDurationProvider
��, =
provider
��> F
)
��F G
{
�� 	
if
�� 
(
�� 
provider
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
provider
�� 
.
�� 
GetDuration
�� '
(
��' (
Start
��( -
,
��- .
End
��/ 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 
void
�� 
Setup
�� !
(
��! "
DateTime
��" *
newStart
��+ 3
,
��3 4
DateTime
��5 =
newEnd
��> D
)
��D E
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
newStart
�� 
<=
�� 
newEnd
�� "
)
��" #
{
�� 
start
�� 
=
�� 
newStart
��  
;
��  !
end
�� 
=
�� 
newEnd
�� 
;
�� 
}
�� 
else
�� 
{
�� 
end
�� 
=
�� 
newStart
�� 
;
�� 
start
�� 
=
�� 
newEnd
�� 
;
�� 
}
�� 
duration
�� 
=
�� 
end
�� 
-
�� 
start
�� "
;
��" #
}
�� 	
public
�� 
virtual
�� 
void
�� 
Setup
�� !
(
��! "
DateTime
��" *
newStart
��+ 3
,
��3 4
TimeSpan
��5 =
newDuration
��> I
)
��I J
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
newDuration
�� 
<
�� 
TimeSpec
�� &
.
��& '
MinPeriodDuration
��' 8
)
��8 9
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 C
)
��C D
;
��D E
}
�� 
start
�� 
=
�� 
newStart
�� 
;
�� 
duration
�� 
=
�� 
newDuration
�� "
;
��" #
end
�� 
=
�� 
start
�� 
.
�� 
Add
�� 
(
�� 
duration
�� $
)
��$ %
;
��% &
}
�� 	
public
�� 

ITimeBlock
�� 
Copy
�� 
(
�� 
)
��  
{
�� 	
return
�� 
Copy
�� 
(
�� 
TimeSpan
��  
.
��  !
Zero
��! %
)
��% &
;
��& '
}
�� 	
public
�� 
virtual
�� 

ITimeBlock
�� !
Copy
��" &
(
��& '
TimeSpan
��' /
offset
��0 6
)
��6 7
{
�� 	
return
�� 
new
�� 
	TimeBlock
��  
(
��  !
start
��! &
.
��& '
Add
��' *
(
��* +
offset
��+ 1
)
��1 2
,
��2 3
end
��4 7
.
��7 8
Add
��8 ;
(
��; <
offset
��< B
)
��B C
,
��C D

IsReadOnly
��E O
)
��O P
;
��P Q
}
�� 	
public
�� 
virtual
�� 
void
�� 
Move
��  
(
��  !
TimeSpan
��! )
offset
��* 0
)
��0 1
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
offset
�� 
==
�� 
TimeSpan
�� "
.
��" #
Zero
��# '
)
��' (
{
�� 
return
�� 
;
�� 
}
�� 
start
�� 
=
�� 
start
�� 
.
�� 
Add
�� 
(
�� 
offset
�� $
)
��$ %
;
��% &
end
�� 
=
�� 
end
�� 
.
�� 
Add
�� 
(
�� 
offset
��  
)
��  !
;
��! "
}
�� 	
public
�� 

ITimeBlock
�� 
GetPreviousPeriod
�� +
(
��+ ,
)
��, -
{
�� 	
return
�� 
GetPreviousPeriod
�� $
(
��$ %
TimeSpan
��% -
.
��- .
Zero
��. 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 

ITimeBlock
�� !
GetPreviousPeriod
��" 3
(
��3 4
TimeSpan
��4 <
offset
��= C
)
��C D
{
�� 	
return
�� 
new
�� 
	TimeBlock
��  
(
��  !
Duration
��! )
,
��) *
Start
��+ 0
.
��0 1
Add
��1 4
(
��4 5
offset
��5 ;
)
��; <
,
��< =

IsReadOnly
��> H
)
��H I
;
��I J
}
�� 	
public
�� 

ITimeBlock
�� 

�� '
(
��' (
)
��( )
{
�� 	
return
�� 

��  
(
��  !
TimeSpan
��! )
.
��) *
Zero
��* .
)
��. /
;
��/ 0
}
�� 	
public
�� 
virtual
�� 

ITimeBlock
�� !

��" /
(
��/ 0
TimeSpan
��0 8
offset
��9 ?
)
��? @
{
�� 	
return
�� 
new
�� 
	TimeBlock
��  
(
��  !
End
��! $
.
��$ %
Add
��% (
(
��( )
offset
��) /
)
��/ 0
,
��0 1
Duration
��2 :
,
��: ;

IsReadOnly
��< F
)
��F G
;
��G H
}
�� 	
public
�� 
virtual
�� 
void
�� 
DurationFromStart
�� -
(
��- .
TimeSpan
��. 6
newDuration
��7 B
)
��B C
{
�� 	
if
�� 
(
�� 
newDuration
�� 
<
�� 
TimeSpec
�� &
.
��& '
MinPeriodDuration
��' 8
)
��8 9
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 C
)
��C D
;
��D E
}
�� 
CheckModification
�� 
(
�� 
)
�� 
;
��  
duration
�� 
=
�� 
newDuration
�� "
;
��" #
end
�� 
=
�� 
start
�� 
.
�� 
Add
�� 
(
�� 
newDuration
�� '
)
��' (
;
��( )
}
�� 	
public
�� 
virtual
�� 
void
�� 
DurationFromEnd
�� +
(
��+ ,
TimeSpan
��, 4
newDuration
��5 @
)
��@ A
{
�� 	
if
�� 
(
�� 
newDuration
�� 
<
�� 
TimeSpec
�� &
.
��& '
MinPeriodDuration
��' 8
)
��8 9
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 C
)
��C D
;
��D E
}
�� 
CheckModification
�� 
(
�� 
)
�� 
;
��  
duration
�� 
=
�� 
newDuration
�� "
;
��" #
start
�� 
=
�� 
end
�� 
.
�� 
Subtract
��  
(
��  !
newDuration
��! ,
)
��, -
;
��- .
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IsSamePeriod
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
start
�� 
==
�� 
test
��  
.
��  !
Start
��! &
&&
��' )
end
��* -
==
��. 0
test
��1 5
.
��5 6
End
��6 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
DateTime
��& .
test
��/ 3
)
��3 4
{
�� 	
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
ITimePeriod
��& 1
test
��2 6
)
��6 7
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IntersectsWith
�� *
(
��* +
ITimePeriod
��+ 6
test
��7 ;
)
��; <
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
IntersectsWith
��" 0
(
��0 1
this
��1 5
,
��5 6
test
��7 ;
)
��; <
;
��< =
}
�� 	
public
�� 
virtual
�� 

ITimeBlock
�� !
GetIntersection
��" 1
(
��1 2
ITimePeriod
��2 =
period
��> D
)
��D E
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
!
�� 
IntersectsWith
�� 
(
��  
period
��  &
)
��& '
)
��' (
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
DateTime
�� 
periodStart
��  
=
��! "
period
��# )
.
��) *
Start
��* /
;
��/ 0
DateTime
�� 
	periodEnd
�� 
=
��  
period
��! '
.
��' (
End
��( +
;
��+ ,
return
�� 
new
�� 
	TimeBlock
��  
(
��  !
periodStart
�� 
>
�� 
start
�� #
?
��$ %
periodStart
��& 1
:
��2 3
start
��4 9
,
��9 :
	periodEnd
�� 
<
�� 
end
�� 
?
��  !
	periodEnd
��" +
:
��, -
end
��. 1
,
��1 2

IsReadOnly
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
OverlapsWith
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
OverlapsWith
��" .
(
��. /
this
��/ 3
,
��3 4
test
��5 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
virtual
�� 
PeriodRelation
�� %
GetRelation
��& 1
(
��1 2
ITimePeriod
��2 =
test
��> B
)
��B C
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
GetRelation
��" -
(
��- .
this
��. 2
,
��2 3
test
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
int
�� 
	CompareTo
�� $
(
��$ %
ITimePeriod
��% 0
other
��1 6
,
��6 7!
ITimePeriodComparer
��8 K
comparer
��L T
)
��T U
{
�� 	
if
�� 
(
�� 
other
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
comparer
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
comparer
�� 
.
�� 
Compare
�� #
(
��# $
this
��$ (
,
��( )
other
��* /
)
��/ 0
;
��0 1
}
�� 	
public
�� 
virtual
�� 
void
�� 
Reset
�� !
(
��! "
)
��" #
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
start
�� 
=
�� 
TimeSpec
�� 
.
�� 

�� *
;
��* +
duration
�� 
=
�� 
TimeSpec
�� 
.
��  
MaxPeriodDuration
��  1
;
��1 2
end
�� 
=
�� 
TimeSpec
�� 
.
�� 

�� (
;
��( )
}
�� 	
public
�� 
string
�� 
GetDescription
�� $
(
��$ %
ITimeFormatter
��% 3
	formatter
��4 =
=
��> ?
null
��@ D
)
��D E
{
�� 	
return
�� 
Format
�� 
(
�� 
	formatter
�� #
??
��$ &

��' 4
.
��4 5
Instance
��5 =
)
��= >
;
��> ?
}
�� 	
	protected
�� 
virtual
�� 
string
��  
Format
��! '
(
��' (
ITimeFormatter
��( 6
	formatter
��7 @
)
��@ A
{
�� 	
return
�� 
	formatter
�� 
.
�� 
	GetPeriod
�� &
(
��& '
start
��' ,
,
��, -
end
��. 1
,
��1 2
duration
��3 ;
)
��; <
;
��< =
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
GetDescription
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
sealed
�� 
override
�� 
bool
�� #
Equals
��$ *
(
��* +
object
��+ 1
obj
��2 5
)
��5 6
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
this
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
IsEqual
�� 
(
�� 
obj
�� 
)
�� 
;
��  
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsEqual
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
return
�� 
HasSameData
�� 
(
�� 
obj
�� "
as
��# %
	TimeBlock
��& /
)
��/ 0
;
��0 1
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
	TimeBlock
��! *
comp
��+ /
)
��/ 0
{
�� 	
return
�� 
start
�� 
==
�� 
comp
��  
.
��  !
start
��! &
&&
��' )
end
��* -
==
��. 0
comp
��1 5
.
��5 6
end
��6 9
&&
��: <

isReadOnly
��= G
==
��H J
comp
��K O
.
��O P

isReadOnly
��P Z
;
��Z [
}
�� 	
public
�� 
sealed
�� 
override
�� 
int
�� "
GetHashCode
��# .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
AddHashCode
�� '
(
��' (
GetType
��( /
(
��/ 0
)
��0 1
.
��1 2
GetHashCode
��2 =
(
��= >
)
��> ?
,
��? @
ComputeHashCode
��A P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
�� 	
	protected
�� 
virtual
�� 
int
�� 
ComputeHashCode
�� -
(
��- .
)
��. /
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,

isReadOnly
��, 6
,
��6 7
start
��8 =
,
��= >
end
��? B
,
��B C
duration
��D L
)
��L M
;
��M N
}
�� 	
	protected
�� 
void
�� 
CheckModification
�� (
(
��( )
)
��) *
{
�� 	
if
�� 
(
�� 

IsReadOnly
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
NotSupportedException
�� /
(
��/ 0
$str
��0 H
)
��H I
;
��I J
}
�� 
}
�� 	
private
�� 
readonly
�� 
bool
�� 

isReadOnly
�� (
;
��( )
private
�� 
DateTime
�� 
start
�� 
;
�� 
private
�� 
TimeSpan
�� 
duration
�� !
;
��! "
private
�� 
DateTime
�� 
end
�� 
;
�� 
}
�� 
}�� В
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeCalendar.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

class 
TimeCalendar 
: 

{ 
public 
static 
readonly 
TimeSpan '
DefaultStartOffset( :
=; <
TimeSpec= E
.E F

NoDurationF P
;P Q
public 
static 
readonly 
TimeSpan '
DefaultEndOffset( 8
=9 :
TimeSpec; C
.C D
MinNegativeDurationD W
;W X
public 
TimeCalendar 
( 
) 
: 
this 
( 
new 
TimeCalendarConfig '
(' (
)( )
)) *
{ 	
} 	
public 
TimeCalendar 
( 
TimeCalendarConfig .
config/ 5
)5 6
{ 	
if 
( 
config 
. 
StartOffset "
<# $
TimeSpan% -
.- .
Zero. 2
)2 3
{   
throw!! 
new!! '
ArgumentOutOfRangeException!! 5
(!!5 6
$str!!6 >
)!!> ?
;!!? @
}"" 
if## 
(## 
config## 
.## 
	EndOffset##  
>##! "
TimeSpan### +
.##+ ,
Zero##, 0
)##0 1
{$$ 
throw%% 
new%% '
ArgumentOutOfRangeException%% 5
(%%5 6
$str%%6 >
)%%> ?
;%%? @
}&& 
culture(( 
=(( 
config(( 
.(( 
Culture(( $
??((% '
CultureInfo((( 3
.((3 4
CurrentCulture((4 B
;((B C
yearType)) 
=)) 
config)) 
.)) 
YearType)) &
.))& '
HasValue))' /
?))0 1
config))2 8
.))8 9
YearType))9 A
.))A B
Value))B G
:))H I
YearType))J R
.))R S

SystemYear))S ]
;))] ^
startOffset** 
=** 
config**  
.**  !
StartOffset**! ,
.**, -
HasValue**- 5
?**6 7
config**8 >
.**> ?
StartOffset**? J
.**J K
Value**K P
:**Q R
DefaultStartOffset**S e
;**e f
	endOffset++ 
=++ 
config++ 
.++ 
	EndOffset++ (
.++( )
HasValue++) 1
?++2 3
config++4 :
.++: ;
	EndOffset++; D
.++D E
Value++E J
:++K L
DefaultEndOffset++M ]
;++] ^

=,, 
config,, "
.,," #

.,,0 1
HasValue,,1 9
?,,: ;
config,,< B
.,,B C

.,,P Q
Value,,Q V
:,,W X
TimeSpec,,Y a
.,,a b"
CalendarYearStartMonth,,b x
;,,x y
fiscalYearBaseMonth-- 
=--  !
config--" (
.--( )
FiscalYearBaseMonth--) <
.--< =
HasValue--= E
?--F G
config--H N
.--N O
FiscalYearBaseMonth--O b
.--b c
Value--c h
:--i j
TimeSpec--k s
.--s t 
FiscalYearBaseMonth	--t �
;
--� � 
fiscalFirstDayOfYear..  
=..! "
config..# )
...) * 
FiscalFirstDayOfYear..* >
...> ?
HasValue..? G
?..H I
config..J P
...P Q 
FiscalFirstDayOfYear..Q e
...e f
Value..f k
:..l m
	DayOfWeek..n w
...w x
Sunday..x ~
;..~ 
fiscalYearAlignment// 
=//  !
config//" (
.//( )
FiscalYearAlignment//) <
.//< =
HasValue//= E
?//F G
config//H N
.//N O
FiscalYearAlignment//O b
.//b c
Value//c h
://i j
FiscalYearAlignment//k ~
.//~ 
None	// �
;
//� �!
fiscalQuarterGrouping00 !
=00" #
config00$ *
.00* +!
FiscalQuarterGrouping00+ @
.00@ A
HasValue00A I
?00J K
config00L R
.00R S!
FiscalQuarterGrouping00S h
.00h i
Value00i n
:00o p"
FiscalQuarterGrouping	00q �
.
00� �
FourFourFiveWeeks
00� �
;
00� �
yearWeekType11 
=11 
config11 !
.11! "
YearWeekType11" .
.11. /
HasValue11/ 7
?118 9
config11: @
.11@ A
YearWeekType11A M
.11M N
Value11N S
:11T U
YearWeekType11V b
.11b c
Calendar11c k
;11k l
dayNameType22 
=22 
config22  
.22  !
DayNameType22! ,
.22, -
HasValue22- 5
?226 7
config228 >
.22> ?
DayNameType22? J
.22J K
Value22K P
:22Q R
CalendarNameType22S c
.22c d
Full22d h
;22h i

=33 
config33 "
.33" #

.330 1
HasValue331 9
?33: ;
config33< B
.33B C

.33P Q
Value33Q V
:33W X
CalendarNameType33Y i
.33i j
Full33j n
;33n o
}44 	
public77 
CultureInfo77 
Culture77 "
{88 	
get99 
{99 
return99 
culture99  
;99  !
}99" #
}:: 	
public== 
YearType== 
YearType==  
{>> 	
get?? 
{?? 
return?? 
yearType?? !
;??! "
}??# $
}@@ 	
publicCC 
TimeSpanCC 
StartOffsetCC #
{DD 	
getEE 
{EE 
returnEE 
startOffsetEE $
;EE$ %
}EE& '
}FF 	
publicII 
TimeSpanII 
	EndOffsetII !
{JJ 	
getKK 
{KK 
returnKK 
	endOffsetKK "
;KK" #
}KK$ %
}LL 	
publicOO 
	YearMonthOO 

{PP 	
getQQ 
{QQ 
returnQQ 

;QQ& '
}QQ( )
}RR 	
publicUU 
	YearMonthUU 
FiscalYearBaseMonthUU ,
{VV 	
getWW 
{WW 
returnWW 
fiscalYearBaseMonthWW ,
;WW, -
}WW. /
}XX 	
public[[ 
	DayOfWeek[[  
FiscalFirstDayOfYear[[ -
{\\ 	
get]] 
{]] 
return]]  
fiscalFirstDayOfYear]] -
;]]- .
}]]/ 0
}^^ 	
publicaa 
FiscalYearAlignmentaa "
FiscalYearAlignmentaa# 6
{bb 	
getcc 
{cc 
returncc 
fiscalYearAlignmentcc ,
;cc, -
}cc. /
}dd 	
publicgg !
FiscalQuarterGroupinggg $!
FiscalQuarterGroupinggg% :
{hh 	
getii 
{ii 
returnii !
fiscalQuarterGroupingii .
;ii. /
}ii0 1
}jj 	
publicmm 
virtualmm 
	DayOfWeekmm  
FirstDayOfWeekmm! /
{nn 	
getoo 
{oo 
returnoo 
cultureoo  
.oo  !
DateTimeFormatoo! /
.oo/ 0
FirstDayOfWeekoo0 >
;oo> ?
}oo@ A
}pp 	
publicss 
YearWeekTypess 
YearWeekTypess (
{tt 	
getuu 
{uu 
returnuu 
yearWeekTypeuu %
;uu% &
}uu' (
}vv 	
publicyy 
staticyy 
TimeCalendaryy "
Newyy# &
(yy& '
CultureInfoyy' 2
cultureyy3 :
)yy: ;
{zz 	
return{{ 
new{{ 
TimeCalendar{{ #
({{# $
new{{$ '
TimeCalendarConfig{{( :
{|| 
Culture}} 
=}} 
culture}} !
}~~ 
)~~
;~~ 
} 	
public
�� 
static
�� 
TimeCalendar
�� "
New
��# &
(
��& '
	YearMonth
��' 0

��1 >
)
��> ?
{
�� 	
return
�� 
new
�� 
TimeCalendar
�� #
(
��# $
new
��$ ' 
TimeCalendarConfig
��( :
{
�� 

�� 
=
�� 

��  -
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
TimeCalendar
�� "
New
��# &
(
��& '
TimeSpan
��' /
startOffset
��0 ;
,
��; <
TimeSpan
��= E
	endOffset
��F O
)
��O P
{
�� 	
return
�� 
new
�� 
TimeCalendar
�� #
(
��# $
new
��$ ' 
TimeCalendarConfig
��( :
{
�� 
StartOffset
�� 
=
�� 
startOffset
�� )
,
��) *
	EndOffset
�� 
=
�� 
	endOffset
�� %
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
TimeCalendar
�� "
New
��# &
(
��& '
TimeSpan
��' /
startOffset
��0 ;
,
��; <
TimeSpan
��= E
	endOffset
��F O
,
��O P
	YearMonth
��Q Z

��[ h
)
��h i
{
�� 	
return
�� 
new
�� 
TimeCalendar
�� #
(
��# $
new
��$ ' 
TimeCalendarConfig
��( :
{
�� 
StartOffset
�� 
=
�� 
startOffset
�� )
,
��) *
	EndOffset
�� 
=
�� 
	endOffset
�� %
,
��% &

�� 
=
�� 

��  -
,
��- .
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
TimeCalendar
�� "
New
��# &
(
��& '
CultureInfo
��' 2
culture
��3 :
,
��: ;
TimeSpan
��< D
startOffset
��E P
,
��P Q
TimeSpan
��R Z
	endOffset
��[ d
)
��d e
{
�� 	
return
�� 
new
�� 
TimeCalendar
�� #
(
��# $
new
��$ ' 
TimeCalendarConfig
��( :
{
�� 
Culture
�� 
=
�� 
culture
�� !
,
��! "
StartOffset
�� 
=
�� 
startOffset
�� )
,
��) *
	EndOffset
�� 
=
�� 
	endOffset
�� %
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
TimeCalendar
�� "
New
��# &
(
��& '
CultureInfo
��' 2
culture
��3 :
,
��: ;
	YearMonth
��< E

��F S
,
��S T
YearWeekType
��U a
yearWeekType
��b n
)
��n o
{
�� 	
return
�� 
new
�� 
TimeCalendar
�� #
(
��# $
new
��$ ' 
TimeCalendarConfig
��( :
{
�� 
Culture
�� 
=
�� 
culture
�� !
,
��! "

�� 
=
�� 

��  -
,
��- .
YearWeekType
�� 
=
�� 
yearWeekType
�� +
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
TimeCalendar
�� "
NewEmptyOffset
��# 1
(
��1 2
)
��2 3
{
�� 	
return
�� 
new
�� 
TimeCalendar
�� #
(
��# $
new
��$ ' 
TimeCalendarConfig
��( :
{
�� 
StartOffset
�� 
=
�� 
TimeSpan
�� &
.
��& '
Zero
��' +
,
��+ ,
	EndOffset
�� 
=
�� 
TimeSpan
�� $
.
��$ %
Zero
��% )
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
virtual
�� 
DateTime
�� 
MapStart
��  (
(
��( )
DateTime
��) 1
moment
��2 8
)
��8 9
{
�� 	
return
�� 
moment
�� 
.
�� 
Add
�� 
(
�� 
startOffset
�� )
)
��) *
;
��* +
}
�� 	
public
�� 
virtual
�� 
DateTime
�� 
MapEnd
��  &
(
��& '
DateTime
��' /
moment
��0 6
)
��6 7
{
�� 	
return
�� 
moment
�� 
.
�� 
Add
�� 
(
�� 
	endOffset
�� '
)
��' (
;
��( )
}
�� 	
public
�� 
virtual
�� 
DateTime
�� 

UnmapStart
��  *
(
��* +
DateTime
��+ 3
moment
��4 :
)
��: ;
{
�� 	
return
�� 
moment
�� 
.
�� 
Subtract
�� "
(
��" #
startOffset
��# .
)
��. /
;
��/ 0
}
�� 	
public
�� 
virtual
�� 
DateTime
�� 
UnmapEnd
��  (
(
��( )
DateTime
��) 1
moment
��2 8
)
��8 9
{
�� 	
return
�� 
moment
�� 
.
�� 
Subtract
�� "
(
��" #
	endOffset
��# ,
)
��, -
;
��- .
}
�� 	
public
�� 
virtual
�� 
int
�� 
GetYear
�� "
(
��" #
DateTime
��# +
time
��, 0
)
��0 1
{
�� 	
return
�� 
culture
�� 
.
�� 
Calendar
�� #
.
��# $
GetYear
��$ +
(
��+ ,
time
��, 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
virtual
�� 
int
�� 
GetMonth
�� #
(
��# $
DateTime
��$ ,
time
��- 1
)
��1 2
{
�� 	
return
�� 
culture
�� 
.
�� 
Calendar
�� #
.
��# $
GetMonth
��$ ,
(
��, -
time
��- 1
)
��1 2
;
��2 3
}
�� 	
public
�� 
virtual
�� 
int
�� 
GetHour
�� "
(
��" #
DateTime
��# +
time
��, 0
)
��0 1
{
�� 	
return
�� 
culture
�� 
.
�� 
Calendar
�� #
.
��# $
GetHour
��$ +
(
��+ ,
time
��, 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
virtual
�� 
int
�� 
	GetMinute
�� $
(
��$ %
DateTime
��% -
time
��. 2
)
��2 3
{
�� 	
return
�� 
culture
�� 
.
�� 
Calendar
�� #
.
��# $
	GetMinute
��$ -
(
��- .
time
��. 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 
int
�� 

�� (
(
��( )
DateTime
��) 1
time
��2 6
)
��6 7
{
�� 	
return
�� 
culture
�� 
.
�� 
Calendar
�� #
.
��# $

��$ 1
(
��1 2
time
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
	DayOfWeek
��  
GetDayOfWeek
��! -
(
��- .
DateTime
��. 6
time
��7 ;
)
��; <
{
�� 	
return
�� 
culture
�� 
.
�� 
Calendar
�� #
.
��# $
GetDayOfWeek
��$ 0
(
��0 1
time
��1 5
)
��5 6
;
��6 7
}
�� 	
public
�� 
virtual
�� 
int
�� 
GetDaysInMonth
�� )
(
��) *
int
��* -
year
��. 2
,
��2 3
int
��4 7
month
��8 =
)
��= >
{
�� 	
return
�� 
culture
�� 
.
�� 
Calendar
�� #
.
��# $
GetDaysInMonth
��$ 2
(
��2 3
year
��3 7
,
��7 8
month
��9 >
)
��> ?
;
��? @
}
�� 	
public
�� 
int
�� 
GetYear
�� 
(
�� 
int
�� 
year
�� #
,
��# $
int
��% (
month
��) .
)
��. /
{
�� 	
if
�� 
(
�� 
YearType
�� 
==
�� 
YearType
�� $
.
��$ %

FiscalYear
��% /
)
��/ 0
{
�� 
year
�� 
=
��  
FiscalCalendarTool
�� )
.
��) *
GetYear
��* 1
(
��1 2
year
��2 6
,
��6 7
(
��8 9
	YearMonth
��9 B
)
��B C
month
��C H
,
��H I

��J W
,
��W X!
FiscalYearBaseMonth
��Y l
)
��l m
;
��m n
}
�� 
return
�� 
year
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GetYearName
�� )
(
��) *
int
��* -
year
��. 2
)
��2 3
{
�� 	
switch
�� 
(
�� 
YearType
�� 
)
�� 
{
�� 
case
�� 
YearType
�� 
.
�� 
CalendarYear
�� *
:
��* +
return
�� 
Strings
�� "
.
��" #
CalendarYearName
��# 3
(
��3 4
year
��4 8
)
��8 9
;
��9 :
case
�� 
YearType
�� 
.
�� 

FiscalYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #
FiscalYearName
��# 1
(
��1 2
year
��2 6
)
��6 7
;
��7 8
case
�� 
YearType
�� 
.
�� 

SchoolYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #
SchoolYearName
��# 1
(
��1 2
year
��2 6
)
��6 7
;
��7 8
default
�� 
:
�� 
return
�� 
Strings
�� "
.
��" #
SystemYearName
��# 1
(
��1 2
year
��2 6
)
��6 7
;
��7 8
}
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GetHalfyearName
�� -
(
��- .
YearHalfyear
��. :
yearHalfyear
��; G
)
��G H
{
�� 	
switch
�� 
(
�� 
YearType
�� 
)
�� 
{
�� 
case
�� 
YearType
�� 
.
�� 
CalendarYear
�� *
:
��* +
return
�� 
Strings
�� "
.
��" #"
CalendarHalfyearName
��# 7
(
��7 8
yearHalfyear
��8 D
)
��D E
;
��E F
case
�� 
YearType
�� 
.
�� 

FiscalYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" # 
FiscalHalfyearName
��# 5
(
��5 6
yearHalfyear
��6 B
)
��B C
;
��C D
case
�� 
YearType
�� 
.
�� 

SchoolYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" # 
SchoolHalfyearName
��# 5
(
��5 6
yearHalfyear
��6 B
)
��B C
;
��C D
default
�� 
:
�� 
return
�� 
Strings
�� "
.
��" # 
SystemHalfyearName
��# 5
(
��5 6
yearHalfyear
��6 B
)
��B C
;
��C D
}
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� #
GetHalfyearOfYearName
�� 3
(
��3 4
int
��4 7
year
��8 <
,
��< =
YearHalfyear
��> J
yearHalfyear
��K W
)
��W X
{
�� 	
switch
�� 
(
�� 
YearType
�� 
)
�� 
{
�� 
case
�� 
YearType
�� 
.
�� 
CalendarYear
�� *
:
��* +
return
�� 
Strings
�� "
.
��" #(
CalendarHalfyearOfYearName
��# =
(
��= >
yearHalfyear
��> J
,
��J K
year
��L P
)
��P Q
;
��Q R
case
�� 
YearType
�� 
.
�� 

FiscalYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #&
FiscalHalfyearOfYearName
��# ;
(
��; <
yearHalfyear
��< H
,
��H I
year
��J N
)
��N O
;
��O P
case
�� 
YearType
�� 
.
�� 

SchoolYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #&
SchoolHalfyearOfYearName
��# ;
(
��; <
yearHalfyear
��< H
,
��H I
year
��J N
)
��N O
;
��O P
default
�� 
:
�� 
return
�� 
Strings
�� "
.
��" #&
SystemHalfyearOfYearName
��# ;
(
��; <
yearHalfyear
��< H
,
��H I
year
��J N
)
��N O
;
��O P
}
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GetQuarterName
�� ,
(
��, -
YearQuarter
��- 8
yearQuarter
��9 D
)
��D E
{
�� 	
switch
�� 
(
�� 
YearType
�� 
)
�� 
{
�� 
case
�� 
YearType
�� 
.
�� 
CalendarYear
�� *
:
��* +
return
�� 
Strings
�� "
.
��" #!
CalendarQuarterName
��# 6
(
��6 7
yearQuarter
��7 B
)
��B C
;
��C D
case
�� 
YearType
�� 
.
�� 

FiscalYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #
FiscalQuarterName
��# 4
(
��4 5
yearQuarter
��5 @
)
��@ A
;
��A B
case
�� 
YearType
�� 
.
�� 

SchoolYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #
SchoolQuarterName
��# 4
(
��4 5
yearQuarter
��5 @
)
��@ A
;
��A B
default
�� 
:
�� 
return
�� 
Strings
�� "
.
��" #
SystemQuarterName
��# 4
(
��4 5
yearQuarter
��5 @
)
��@ A
;
��A B
}
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� "
GetQuarterOfYearName
�� 2
(
��2 3
int
��3 6
year
��7 ;
,
��; <
YearQuarter
��= H
yearQuarter
��I T
)
��T U
{
�� 	
switch
�� 
(
�� 
YearType
�� 
)
�� 
{
�� 
case
�� 
YearType
�� 
.
�� 
CalendarYear
�� *
:
��* +
return
�� 
Strings
�� "
.
��" #'
CalendarQuarterOfYearName
��# <
(
��< =
yearQuarter
��= H
,
��H I
year
��J N
)
��N O
;
��O P
case
�� 
YearType
�� 
.
�� 

FiscalYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #%
FiscalQuarterOfYearName
��# :
(
��: ;
yearQuarter
��; F
,
��F G
year
��H L
)
��L M
;
��M N
case
�� 
YearType
�� 
.
�� 

SchoolYear
�� (
:
��( )
return
�� 
Strings
�� "
.
��" #%
SchoolQuarterOfYearName
��# :
(
��: ;
yearQuarter
��; F
,
��F G
year
��H L
)
��L M
;
��M N
default
�� 
:
�� 
return
�� 
Strings
�� "
.
��" #%
SystemQuarterOfYearName
��# :
(
��: ;
yearQuarter
��; F
,
��F G
year
��H L
)
��L M
;
��M N
}
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GetMonthName
�� *
(
��* +
int
��+ .
month
��/ 4
)
��4 5
{
�� 	
switch
�� 
(
�� 

�� !
)
��! "
{
�� 
case
�� 
CalendarNameType
�� %
.
��% &
Abbreviated
��& 1
:
��1 2
return
�� 
culture
�� "
.
��" #
DateTimeFormat
��# 1
.
��1 2%
GetAbbreviatedMonthName
��2 I
(
��I J
month
��J O
)
��O P
;
��P Q
default
�� 
:
�� 
return
�� 
culture
�� "
.
��" #
DateTimeFormat
��# 1
.
��1 2
GetMonthName
��2 >
(
��> ?
month
��? D
)
��D E
;
��E F
}
�� 
}
�� 	
public
�� 
virtual
�� 
string
��  
GetMonthOfYearName
�� 0
(
��0 1
int
��1 4
year
��5 9
,
��9 :
int
��; >
month
��? D
)
��D E
{
�� 	
return
�� 
Strings
�� 
.
�� 
MonthOfYearName
�� *
(
��* +
GetMonthName
��+ 7
(
��7 8
month
��8 =
)
��= >
,
��> ?
GetYearName
��@ K
(
��K L
year
��L P
)
��P Q
)
��Q R
;
��R S
}
�� 	
public
�� 
virtual
�� 
string
�� 
GetWeekOfYearName
�� /
(
��/ 0
int
��0 3
year
��4 8
,
��8 9
int
��: =

weekOfYear
��> H
)
��H I
{
�� 	
return
�� 
Strings
�� 
.
�� 
WeekOfYearName
�� )
(
��) *

weekOfYear
��* 4
,
��4 5
GetYearName
��6 A
(
��A B
year
��B F
)
��F G
)
��G H
;
��H I
}
�� 	
public
�� 
virtual
�� 
string
�� 

GetDayName
�� (
(
��( )
	DayOfWeek
��) 2
	dayOfWeek
��3 <
)
��< =
{
�� 	
switch
�� 
(
�� 
dayNameType
�� 
)
��  
{
�� 
case
�� 
CalendarNameType
�� %
.
��% &
Abbreviated
��& 1
:
��1 2
return
�� 
culture
�� "
.
��" #
DateTimeFormat
��# 1
.
��1 2#
GetAbbreviatedDayName
��2 G
(
��G H
	dayOfWeek
��H Q
)
��Q R
;
��R S
default
�� 
:
�� 
return
�� 
culture
�� "
.
��" #
DateTimeFormat
��# 1
.
��1 2

GetDayName
��2 <
(
��< =
	dayOfWeek
��= F
)
��F G
;
��G H
}
�� 
}
�� 	
public
�� 
virtual
�� 
int
�� 

�� (
(
��( )
DateTime
��) 1
time
��2 6
)
��6 7
{
�� 	
int
�� 
year
�� 
;
�� 
int
�� 

weekOfYear
�� 
;
�� 
TimeTool
�� 
.
�� 

�� "
(
��" #
time
��# '
,
��' (
culture
��) 0
,
��0 1
yearWeekType
��2 >
,
��> ?
out
��@ C
year
��D H
,
��H I
out
��J M

weekOfYear
��N X
)
��X Y
;
��Y Z
return
�� 

weekOfYear
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
DateTime
��  
GetStartOfYearWeek
��  2
(
��2 3
int
��3 6
year
��7 ;
,
��; <
int
��= @

weekOfYear
��A K
)
��K L
{
�� 	
return
�� 
TimeTool
�� 
.
��  
GetStartOfYearWeek
�� .
(
��. /
year
��/ 3
,
��3 4

weekOfYear
��5 ?
,
��? @
culture
��A H
,
��H I
yearWeekType
��J V
)
��V W
;
��W X
}
�� 	
public
�� 
sealed
�� 
override
�� 
bool
�� #
Equals
��$ *
(
��* +
object
��+ 1
obj
��2 5
)
��5 6
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
this
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
IsEqual
�� 
(
�� 
obj
�� 
)
�� 
;
��  
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsEqual
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
return
�� 
HasSameData
�� 
(
�� 
obj
�� "
as
��# %
TimeCalendar
��& 2
)
��2 3
;
��3 4
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
TimeCalendar
��! -
comp
��. 2
)
��2 3
{
�� 	
return
�� 
culture
�� 
.
�� 
Equals
�� !
(
��! "
comp
��" &
.
��& '
culture
��' .
)
��. /
&&
��0 2
startOffset
�� 
==
�� 
comp
�� #
.
��# $
startOffset
��$ /
&&
��0 2
	endOffset
�� 
==
�� 
comp
�� !
.
��! "
	endOffset
��" +
&&
��, .

�� 
==
��  
comp
��! %
.
��% &

��& 3
&&
��4 6!
fiscalYearBaseMonth
�� #
==
��$ &
comp
��' +
.
��+ ,!
fiscalYearBaseMonth
��, ?
&&
��@ B
yearWeekType
�� 
==
�� 
comp
��  $
.
��$ %
yearWeekType
��% 1
&&
��2 4
dayNameType
�� 
==
�� 
comp
�� #
.
��# $
dayNameType
��$ /
&&
��0 2

�� 
==
��  
comp
��! %
.
��% &

��& 3
;
��3 4
}
�� 	
public
�� 
sealed
�� 
override
�� 
int
�� "
GetHashCode
��# .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
AddHashCode
�� '
(
��' (
GetType
��( /
(
��/ 0
)
��0 1
.
��1 2
GetHashCode
��2 =
(
��= >
)
��> ?
,
��? @
ComputeHashCode
��A P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
�� 	
	protected
�� 
virtual
�� 
int
�� 
ComputeHashCode
�� -
(
��- .
)
��. /
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
culture
�� 
,
�� 
startOffset
�� 
,
�� 
	endOffset
�� 
,
�� 

�� 
,
�� !
fiscalYearBaseMonth
�� #
,
��# $"
fiscalFirstDayOfYear
�� $
,
��$ %!
fiscalYearAlignment
�� #
,
��# $#
fiscalQuarterGrouping
�� %
,
��% &
yearWeekType
�� 
,
�� 
dayNameType
�� 
,
�� 

�� 
)
�� 
;
�� 
}
�� 	
private
�� 
readonly
�� 
CultureInfo
�� $
culture
��% ,
;
��, -
private
�� 
readonly
�� 
YearType
�� !
yearType
��" *
;
��* +
private
�� 
readonly
�� 
TimeSpan
�� !
startOffset
��" -
;
��- .
private
�� 
readonly
�� 
TimeSpan
�� !
	endOffset
��" +
;
��+ ,
private
�� 
readonly
�� 
	YearMonth
�� "

��# 0
;
��0 1
private
�� 
readonly
�� 
	YearMonth
�� "!
fiscalYearBaseMonth
��# 6
;
��6 7
private
�� 
readonly
�� 
	DayOfWeek
�� ""
fiscalFirstDayOfYear
��# 7
;
��7 8
private
�� 
readonly
�� !
FiscalYearAlignment
�� ,!
fiscalYearAlignment
��- @
;
��@ A
private
�� 
readonly
�� #
FiscalQuarterGrouping
�� .#
fiscalQuarterGrouping
��/ D
;
��D E
private
�� 
readonly
�� 
YearWeekType
�� %
yearWeekType
��& 2
;
��2 3
private
�� 
readonly
�� 
CalendarNameType
�� )
dayNameType
��* 5
;
��5 6
private
�� 
readonly
�� 
CalendarNameType
�� )

��* 7
;
��7 8
}
�� 
}�� �
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeCalendarConfig.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

struct 
TimeCalendarConfig $
{ 
public 
CultureInfo 
Culture "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
YearType 
? 
YearType !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
TimeSpan 
? 
StartOffset $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
TimeSpan 
? 
	EndOffset "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
	YearMonth 
? 

{( )
get* -
;- .
set/ 2
;2 3
}4 5
public"" 
	YearMonth"" 
?"" 
FiscalYearBaseMonth"" -
{"". /
get""0 3
;""3 4
set""5 8
;""8 9
}"": ;
public%% 
	DayOfWeek%% 
?%%  
FiscalFirstDayOfYear%% .
{%%/ 0
get%%1 4
;%%4 5
set%%6 9
;%%9 :
}%%; <
public(( 
FiscalYearAlignment(( "
?((" #
FiscalYearAlignment(($ 7
{((8 9
get((: =
;((= >
set((? B
;((B C
}((D E
public++ !
FiscalQuarterGrouping++ $
?++$ %!
FiscalQuarterGrouping++& ;
{++< =
get++> A
;++A B
set++C F
;++F G
}++H I
public.. 
YearWeekType.. 
?.. 
YearWeekType.. )
{..* +
get.., /
;../ 0
set..1 4
;..4 5
}..6 7
public11 
CalendarNameType11 
?11  
DayNameType11! ,
{11- .
get11/ 2
;112 3
set114 7
;117 8
}119 :
public44 
CalendarNameType44 
?44  

{44/ 0
get441 4
;444 5
set446 9
;449 :
}44; <
}66 
}88 �U
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeCompare.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

static 
class 
TimeCompare #
{ 
public 
static 
bool 

IsSameYear %
(% &
DateTime& .
left/ 3
,3 4
DateTime5 =
right> C
)C D
{ 	
return 
left 
. 
Year 
== 
right  %
.% &
Year& *
;* +
} 	
public 
static 
bool 

IsSameYear %
(% &
	YearMonth& /
yearStartMonth0 >
,> ?
DateTime@ H
leftI M
,M N
DateTimeO W
rightX ]
)] ^
{ 	
return 
TimeTool 
. 
	GetYearOf %
(% &
yearStartMonth& 4
,4 5
left6 :
): ;
==< >
TimeTool? G
.G H
	GetYearOfH Q
(Q R
yearStartMonthR `
,` a
rightb g
)g h
;h i
} 	
public%% 
static%% 
bool%% 
IsSameHalfyear%% )
(%%) *
DateTime%%* 2
left%%3 7
,%%7 8
DateTime%%9 A
right%%B G
)%%G H
{&& 	
return'' 
IsSameHalfyear'' !
(''! "
TimeSpec''" *
.''* +"
CalendarYearStartMonth''+ A
,''A B
left''C G
,''G H
right''I N
)''N O
;''O P
}(( 	
public++ 
static++ 
bool++ 
IsSameHalfyear++ )
(++) *
	YearMonth++* 3
yearStartMonth++4 B
,++B C
DateTime++D L
left++M Q
,++Q R
DateTime++S [
right++\ a
)++a b
{,, 	
int-- 
leftYear-- 
=-- 
TimeTool-- #
.--# $
	GetYearOf--$ -
(--- .
yearStartMonth--. <
,--< =
left--> B
)--B C
;--C D
int.. 
	rightYear.. 
=.. 
TimeTool.. $
...$ %
	GetYearOf..% .
(... /
yearStartMonth../ =
,..= >
right..? D
)..D E
;..E F
if// 
(// 
leftYear// 
!=// 
	rightYear// %
)//% &
{00 
return11 
false11 
;11 
}22 
return44 
TimeTool44 
.44 
GetHalfyearOfMonth44 .
(44. /
yearStartMonth44/ =
,44= >
(44? @
	YearMonth44@ I
)44I J
left44J N
.44N O
Month44O T
)44T U
==44V X
TimeTool44Y a
.44a b
GetHalfyearOfMonth44b t
(44t u
yearStartMonth	44u �
,
44� �
(
44� �
	YearMonth
44� �
)
44� �
right
44� �
.
44� �
Month
44� �
)
44� �
;
44� �
}55 	
public<< 
static<< 
bool<< 

(<<( )
DateTime<<) 1
left<<2 6
,<<6 7
DateTime<<8 @
right<<A F
)<<F G
{== 	
return>> 

(>>  !
TimeSpec>>! )
.>>) *"
CalendarYearStartMonth>>* @
,>>@ A
left>>B F
,>>F G
right>>H M
)>>M N
;>>N O
}?? 	
publicBB 
staticBB 
boolBB 

(BB( )
	YearMonthBB) 2
yearStartMonthBB3 A
,BBA B
DateTimeBBC K
leftBBL P
,BBP Q
DateTimeBBR Z
rightBB[ `
)BB` a
{CC 	
intDD 
leftYearDD 
=DD 
TimeToolDD #
.DD# $
	GetYearOfDD$ -
(DD- .
yearStartMonthDD. <
,DD< =
leftDD> B
)DDB C
;DDC D
intEE 
	rightYearEE 
=EE 
TimeToolEE $
.EE$ %
	GetYearOfEE% .
(EE. /
yearStartMonthEE/ =
,EE= >
rightEE? D
)EED E
;EEE F
ifFF 
(FF 
leftYearFF 
!=FF 
	rightYearFF %
)FF% &
{GG 
returnHH 
falseHH 
;HH 
}II 
returnKK 
TimeToolKK 
.KK 
GetQuarterOfMonthKK -
(KK- .
yearStartMonthKK. <
,KK< =
(KK> ?
	YearMonthKK? H
)KKH I
leftKKI M
.KKM N
MonthKKN S
)KKS T
==KKU W
TimeToolKKX `
.KK` a
GetQuarterOfMonthKKa r
(KKr s
yearStartMonth	KKs �
,
KK� �
(
KK� �
	YearMonth
KK� �
)
KK� �
right
KK� �
.
KK� �
Month
KK� �
)
KK� �
;
KK� �
}LL 	
publicSS 
staticSS 
boolSS 
IsSameMonthSS &
(SS& '
DateTimeSS' /
leftSS0 4
,SS4 5
DateTimeSS6 >
rightSS? D
)SSD E
{TT 	
returnUU 

IsSameYearUU 
(UU 
leftUU "
,UU" #
rightUU$ )
)UU) *
&&UU+ -
leftUU. 2
.UU2 3
MonthUU3 8
==UU9 ;
rightUU< A
.UUA B
MonthUUB G
;UUG H
}VV 	
public]] 
static]] 
bool]] 

IsSameWeek]] %
(]]% &
DateTime]]& .
left]]/ 3
,]]3 4
DateTime]]5 =
right]]> C
,]]C D
CultureInfo]]E P
culture]]Q X
,]]X Y
YearWeekType]]Z f
weekType]]g o
)]]o p
{^^ 	
return__ 

IsSameWeek__ 
(__ 
left__ "
,__" #
right__$ )
,__) *
culture__+ 2
,__2 3
culture__4 ;
.__; <
DateTimeFormat__< J
.__J K
CalendarWeekRule__K [
,__[ \
culture__] d
.__d e
DateTimeFormat__e s
.__s t
FirstDayOfWeek	__t �
,
__� �
weekType
__� �
)
__� �
;
__� �
}`` 	
publiccc 
staticcc 
boolcc 

IsSameWeekcc %
(cc% &
DateTimecc& .
leftcc/ 3
,cc3 4
DateTimecc5 =
rightcc> C
,ccC D
CultureInfoccE P
cultureccQ X
,ccX Y
CalendarWeekRuledd 
weekRuledd %
,dd% &
	DayOfWeekdd' 0
firstDayOfWeekdd1 ?
,dd? @
YearWeekTypeddA M
weekTypeddN V
)ddV W
{ee 	
ifff 
(ff 
cultureff 
==ff 
nullff 
)ff  
{gg 
throwhh 
newhh !
ArgumentNullExceptionhh /
(hh/ 0
$strhh0 9
)hh9 :
;hh: ;
}ii 
intll 
leftWeekOfYearll 
;ll 
intmm 
leftYearmm 
;mm 
TimeToolnn 
.nn 

(nn" #
leftnn# '
,nn' (
culturenn) 0
,nn0 1
weekRulenn2 :
,nn: ;
firstDayOfWeeknn< J
,nnJ K
weekTypennL T
,nnT U
outnnV Y
leftYearnnZ b
,nnb c
outnnd g
leftWeekOfYearnnh v
)nnv w
;nnw x
intqq 
rightWeekOfYearqq 
;qq  
intrr 
	rightYearrr 
;rr 
TimeToolss 
.ss 

(ss" #
rightss# (
,ss( )
culturess* 1
,ss1 2
weekRuless3 ;
,ss; <
firstDayOfWeekss= K
,ssK L
weekTypessM U
,ssU V
outssW Z
	rightYearss[ d
,ssd e
outssf i
rightWeekOfYearssj y
)ssy z
;ssz {
returnuu 
leftYearuu 
==uu 
	rightYearuu (
&&uu) +
leftWeekOfYearuu, :
==uu; =
rightWeekOfYearuu> M
;uuM N
}vv 	
public}} 
static}} 
bool}} 
	IsSameDay}} $
(}}$ %
DateTime}}% -
left}}. 2
,}}2 3
DateTime}}4 <
right}}= B
)}}B C
{~~ 	
return 
IsSameMonth 
( 
left #
,# $
right% *
)* +
&&, .
left/ 3
.3 4
Day4 7
==8 :
right; @
.@ A
DayA D
;D E
}
�� 	
public
�� 
static
�� 
bool
�� 

IsSameHour
�� %
(
��% &
DateTime
��& .
left
��/ 3
,
��3 4
DateTime
��5 =
right
��> C
)
��C D
{
�� 	
return
�� 
	IsSameDay
�� 
(
�� 
left
�� !
,
��! "
right
��# (
)
��( )
&&
��* ,
left
��- 1
.
��1 2
Hour
��2 6
==
��7 9
right
��: ?
.
��? @
Hour
��@ D
;
��D E
}
�� 	
public
�� 
static
�� 
bool
�� 
IsSameMinute
�� '
(
��' (
DateTime
��( 0
left
��1 5
,
��5 6
DateTime
��7 ?
right
��@ E
)
��E F
{
�� 	
return
�� 

IsSameHour
�� 
(
�� 
left
�� "
,
��" #
right
��$ )
)
��) *
&&
��+ -
left
��. 2
.
��2 3
Minute
��3 9
==
��: <
right
��= B
.
��B C
Minute
��C I
;
��I J
}
�� 	
public
�� 
static
�� 
bool
�� 
IsSameSecond
�� '
(
��' (
DateTime
��( 0
left
��1 5
,
��5 6
DateTime
��7 ?
right
��@ E
)
��E F
{
�� 	
return
�� 
IsSameMinute
�� 
(
��  
left
��  $
,
��$ %
right
��& +
)
��+ ,
&&
��- /
left
��0 4
.
��4 5
Second
��5 ;
==
��< >
right
��? D
.
��D E
Second
��E K
;
��K L
}
�� 	
}
�� 
}�� ��
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeFormatter.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{
public 

class 

:  
ITimeFormatter! /
{ 
public 

( 
) 
:  
this 
( 
CultureInfo 
. 
CurrentCulture +
)+ ,
{ 	
} 	
public 

( 
CultureInfo (
culture) 0
=1 2
null3 7
,7 8
string 
contextSeparator #
=$ %
$str& *
,* +
string, 2
startEndSeparator3 D
=E F
$strG L
,L M
string 
durationSeparator $
=% &
$str' ,
,, -
string 
dateTimeFormat !
=" #
null$ (
,( )
string 
shortDateFormat "
=# $
null% )
,) *
string 
longTimeFormat !
=" #
null$ (
,( )
string   
shortTimeFormat   "
=  # $
null  % )
,  ) *
DurationFormatType!! 
durationType!! +
=!!, -
DurationFormatType!!. @
.!!@ A
Compact!!A H
,!!H I
bool"" 
useDurationSeconds"" #
=""$ %
false""& +
,""+ ,
bool## "
useIsoIntervalNotation## '
=##( )
false##* /
,##/ 0
string$$ !
durationItemSeparator$$ (
=$$) *
$str$$+ .
,$$. /
string%% %
durationLastItemSeparator%% ,
=%%- .
$str%%/ 2
,%%2 3
string&& "
durationValueSeparator&& )
=&&* +
$str&&, /
,&&/ 0
string'' 
intervalStartClosed'' &
=''' (
$str'') ,
,'', -
string(( 
intervalStartOpen(( $
=((% &
$str((' *
,((* +
string))  
intervalStartOpenIso)) '
=))( )
$str))* -
,))- .
string** 
intervalEndClosed** $
=**% &
$str**' *
,*** +
string++ 
intervalEndOpen++ "
=++# $
$str++% (
,++( )
string,, 
intervalEndOpenIso,, %
=,,& '
$str,,( +
),,+ ,
{-- 	
if.. 
(.. 
culture.. 
==.. 
null.. 
)..  
{// 
culture00 
=00 
CultureInfo00 %
.00% &
CurrentCulture00& 4
;004 5
}11 
this22 
.22 
culture22 
=22 
culture22 "
;22" #

=33 
culture33 #
.33# $
TextInfo33$ ,
.33, -

;33: ;
this44 
.44 
contextSeparator44 !
=44" #
contextSeparator44$ 4
;444 5
this55 
.55 
startEndSeparator55 "
=55# $
startEndSeparator55% 6
;556 7
this66 
.66 
durationSeparator66 "
=66# $
durationSeparator66% 6
;666 7
this77 
.77 !
durationItemSeparator77 &
=77' (!
durationItemSeparator77) >
;77> ?
this88 
.88 %
durationLastItemSeparator88 *
=88+ ,%
durationLastItemSeparator88- F
;88F G
this99 
.99 "
durationValueSeparator99 '
=99( )"
durationValueSeparator99* @
;99@ A
this:: 
.:: 
intervalStartClosed:: $
=::% &
intervalStartClosed::' :
;::: ;
this;; 
.;; 
intervalStartOpen;; "
=;;# $
intervalStartOpen;;% 6
;;;6 7
this<< 
.<<  
intervalStartOpenIso<< %
=<<& ' 
intervalStartOpenIso<<( <
;<<< =
this== 
.== 
intervalEndClosed== "
===# $
intervalEndClosed==% 6
;==6 7
this>> 
.>> 
intervalEndOpen>>  
=>>! "
intervalEndOpen>># 2
;>>2 3
this?? 
.?? 
intervalEndOpenIso?? #
=??$ %
intervalEndOpenIso??& 8
;??8 9
this@@ 
.@@ 
dateTimeFormat@@ 
=@@  !
dateTimeFormat@@" 0
;@@0 1
thisAA 
.AA 
shortDateFormatAA  
=AA! "
shortDateFormatAA# 2
;AA2 3
thisBB 
.BB 
longTimeFormatBB 
=BB  !
longTimeFormatBB" 0
;BB0 1
thisCC 
.CC 
shortTimeFormatCC  
=CC! "
shortTimeFormatCC# 2
;CC2 3
thisDD 
.DD 
durationTypeDD 
=DD 
durationTypeDD  ,
;DD, -
thisEE 
.EE 
useDurationSecondsEE #
=EE$ %
useDurationSecondsEE& 8
;EE8 9
thisFF 
.FF "
useIsoIntervalNotationFF '
=FF( )"
useIsoIntervalNotationFF* @
;FF@ A
}GG 	
publicJJ 
staticJJ 

InstanceJJ$ ,
{KK 	
getLL 
{MM 
ifNN 
(NN 
instanceNN 
==NN 
nullNN  $
)NN$ %
{OO 
lockPP 
(PP 
mutexPP 
)PP  
{QQ 
ifRR 
(RR 
instanceRR $
==RR% '
nullRR( ,
)RR, -
{SS 
instanceTT $
=TT% &
newTT' *

(TT8 9
)TT9 :
;TT: ;
}UU 
}VV 
}WW 
returnXX 
instanceXX 
;XX  
}YY 
setZZ 
{[[ 
if\\ 
(\\ 
value\\ 
==\\ 
null\\ !
)\\! "
{]] 
throw^^ 
new^^ !
ArgumentNullException^^ 3
(^^3 4
$str^^4 ;
)^^; <
;^^< =
}__ 
lock`` 
(`` 
mutex`` 
)`` 
{aa 
instancebb 
=bb 
valuebb $
;bb$ %
}cc 
}dd 
}ee 	
publichh 
CultureInfohh 
Culturehh "
{ii 	
getjj 
{jj 
returnjj 
culturejj  
;jj  !
}jj" #
}kk 	
publicnn 
stringnn 

{oo 	
getpp 
{pp 
returnpp 

;pp& '
}pp( )
}qq 	
publictt 
stringtt 
ContextSeparatortt &
{uu 	
getvv 
{vv 
returnvv 
contextSeparatorvv )
;vv) *
}vv+ ,
}ww 	
publiczz 
stringzz 
StartEndSeparatorzz '
{{{ 	
get|| 
{|| 
return|| 
startEndSeparator|| *
;||* +
}||, -
}}} 	
public
�� 
string
�� 
DurationSeparator
�� '
{
�� 	
get
�� 
{
�� 
return
�� 
durationSeparator
�� *
;
��* +
}
��, -
}
�� 	
public
�� 
string
�� #
DurationItemSeparator
�� +
{
�� 	
get
�� 
{
�� 
return
�� #
durationItemSeparator
�� .
;
��. /
}
��0 1
}
�� 	
public
�� 
string
�� '
DurationLastItemSeparator
�� /
{
�� 	
get
�� 
{
�� 
return
�� '
durationLastItemSeparator
�� 2
;
��2 3
}
��4 5
}
�� 	
public
�� 
string
�� $
DurationValueSeparator
�� ,
{
�� 	
get
�� 
{
�� 
return
�� $
durationValueSeparator
�� /
;
��/ 0
}
��1 2
}
�� 	
public
�� 
string
�� !
IntervalStartClosed
�� )
{
�� 	
get
�� 
{
�� 
return
�� !
intervalStartClosed
�� ,
;
��, -
}
��. /
}
�� 	
public
�� 
string
�� 
IntervalStartOpen
�� '
{
�� 	
get
�� 
{
�� 
return
�� 
intervalStartOpen
�� *
;
��* +
}
��, -
}
�� 	
public
�� 
string
�� "
IntervalStartOpenIso
�� *
{
�� 	
get
�� 
{
�� 
return
�� "
intervalStartOpenIso
�� -
;
��- .
}
��/ 0
}
�� 	
public
�� 
string
�� 
IntervalEndClosed
�� '
{
�� 	
get
�� 
{
�� 
return
�� 
intervalEndClosed
�� *
;
��* +
}
��, -
}
�� 	
public
�� 
string
�� 
IntervalEndOpen
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
intervalEndOpen
�� (
;
��( )
}
��* +
}
�� 	
public
�� 
string
��  
IntervalEndOpenIso
�� (
{
�� 	
get
�� 
{
�� 
return
��  
intervalEndOpenIso
�� +
;
��+ ,
}
��- .
}
�� 	
public
�� 
string
�� 
DateTimeFormat
�� $
{
�� 	
get
�� 
{
�� 
return
�� 
dateTimeFormat
�� '
;
��' (
}
��) *
}
�� 	
public
�� 
string
�� 
ShortDateFormat
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
shortDateFormat
�� (
;
��( )
}
��* +
}
�� 	
public
�� 
string
�� 
LongTimeFormat
�� $
{
�� 	
get
�� 
{
�� 
return
�� 
longTimeFormat
�� '
;
��' (
}
��) *
}
�� 	
public
�� 
string
�� 
ShortTimeFormat
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
shortTimeFormat
�� (
;
��( )
}
��* +
}
�� 	
public
��  
DurationFormatType
�� !
DurationType
��" .
{
�� 	
get
�� 
{
�� 
return
�� 
durationType
�� %
;
��% &
}
��' (
}
�� 	
public
�� 
bool
��  
UseDurationSeconds
�� &
{
�� 	
get
�� 
{
�� 
return
��  
useDurationSeconds
�� +
;
��+ ,
}
��- .
}
�� 	
public
�� 
bool
�� $
UseIsoIntervalNotation
�� *
{
�� 	
get
�� 
{
�� 
return
�� $
useIsoIntervalNotation
�� /
;
��/ 0
}
��1 2
}
�� 	
public
�� 
virtual
�� 
string
�� 

�� +
(
��+ ,
int
��, /
count
��0 5
)
��5 6
{
�� 	
return
�� 
string
�� 
.
�� 
Format
��  
(
��  !
$str
��! .
,
��. /
count
��0 5
)
��5 6
;
��6 7
}
�� 	
public
�� 
virtual
�� 
string
�� !
GetCollectionPeriod
�� 1
(
��1 2
int
��2 5
count
��6 ;
,
��; <
DateTime
��= E
start
��F K
,
��K L
DateTime
��M U
end
��V Y
,
��Y Z
TimeSpan
��[ c
duration
��d l
)
��l m
{
�� 	
return
�� 
string
�� 
.
�� 
Format
��  
(
��  !
$str
��! -
,
��- .

��/ <
(
��< =
count
��= B
)
��B C
,
��C D

��E R
,
��R S
	GetPeriod
��T ]
(
��] ^
start
��^ c
,
��c d
end
��e h
,
��h i
duration
��j r
)
��r s
)
��s t
;
��t u
}
�� 	
public
�� 
string
�� 
GetDateTime
�� !
(
��! "
DateTime
��" *
dateTime
��+ 3
)
��3 4
{
�� 	
return
�� 
!
�� 
string
�� 
.
�� 

�� (
(
��( )
dateTimeFormat
��) 7
)
��7 8
?
��9 :
dateTime
��; C
.
��C D
ToString
��D L
(
��L M
dateTimeFormat
��M [
)
��[ \
:
��] ^
dateTime
��_ g
.
��g h
ToString
��h p
(
��p q
culture
��q x
)
��x y
;
��y z
}
�� 	
public
�� 
string
�� 
GetShortDate
�� "
(
��" #
DateTime
��# +
dateTime
��, 4
)
��4 5
{
�� 	
return
�� 
!
�� 
string
�� 
.
�� 

�� (
(
��( )
shortDateFormat
��) 8
)
��8 9
?
��: ;
dateTime
��< D
.
��D E
ToString
��E M
(
��M N
shortDateFormat
��N ]
)
��] ^
:
��_ `
dateTime
��a i
.
��i j
ToString
��j r
(
��r s
$str
��s v
)
��v w
;
��w x
}
�� 	
public
�� 
string
�� 
GetLongTime
�� !
(
��! "
DateTime
��" *
dateTime
��+ 3
)
��3 4
{
�� 	
return
�� 
!
�� 
string
�� 
.
�� 

�� (
(
��( )
longTimeFormat
��) 7
)
��7 8
?
��9 :
dateTime
��; C
.
��C D
ToString
��D L
(
��L M
longTimeFormat
��M [
)
��[ \
:
��] ^
dateTime
��_ g
.
��g h
ToString
��h p
(
��p q
$str
��q t
)
��t u
;
��u v
}
�� 	
public
�� 
string
�� 
GetShortTime
�� "
(
��" #
DateTime
��# +
dateTime
��, 4
)
��4 5
{
�� 	
return
�� 
!
�� 
string
�� 
.
�� 

�� (
(
��( )
shortTimeFormat
��) 8
)
��8 9
?
��: ;
dateTime
��< D
.
��D E
ToString
��E M
(
��M N
shortTimeFormat
��N ]
)
��] ^
:
��_ `
dateTime
��a i
.
��i j
ToString
��j r
(
��r s
$str
��s v
)
��v w
;
��w x
}
�� 	
public
�� 
string
�� 
	GetPeriod
�� 
(
��  
DateTime
��  (
start
��) .
,
��. /
DateTime
��0 8
end
��9 <
)
��< =
{
�� 	
return
�� 
	GetPeriod
�� 
(
�� 
start
�� "
,
��" #
end
��$ '
,
��' (
end
��) ,
-
��- .
start
��/ 4
)
��4 5
;
��5 6
}
�� 	
public
�� 
string
�� 
GetDuration
�� !
(
��! "
TimeSpan
��" *
timeSpan
��+ 3
)
��3 4
{
�� 	
return
�� 
GetDuration
�� 
(
�� 
timeSpan
�� '
,
��' (
durationType
��) 5
)
��5 6
;
��6 7
}
�� 	
public
�� 
string
�� 
GetDuration
�� !
(
��! "
TimeSpan
��" *
timeSpan
��+ 3
,
��3 4 
DurationFormatType
��5 G 
durationFormatType
��H Z
)
��Z [
{
�� 	
switch
�� 
(
��  
durationFormatType
�� &
)
��& '
{
�� 
case
��  
DurationFormatType
�� '
.
��' (
Detailed
��( 0
:
��0 1
int
�� 
days
�� 
=
�� 
(
��  
int
��  #
)
��# $
timeSpan
��$ ,
.
��, -
	TotalDays
��- 6
;
��6 7
int
�� 
hours
�� 
=
�� 
timeSpan
��  (
.
��( )
Hours
��) .
;
��. /
int
�� 
minutes
�� 
=
��  !
timeSpan
��" *
.
��* +
Minutes
��+ 2
;
��2 3
int
�� 
seconds
�� 
=
��  ! 
UseDurationSeconds
��" 4
?
��5 6
timeSpan
��7 ?
.
��? @
Seconds
��@ G
:
��H I
$num
��J K
;
��K L
return
�� 
GetDuration
�� &
(
��& '
$num
��' (
,
��( )
$num
��* +
,
��+ ,
days
��- 1
,
��1 2
hours
��3 8
,
��8 9
minutes
��: A
,
��A B
seconds
��C J
)
��J K
;
��K L
default
�� 
:
�� 
return
��  
UseDurationSeconds
�� -
?
��. /
string
�� 
.
�� 
Format
�� %
(
��% &
$str
��& @
,
��@ A
timeSpan
��B J
.
��J K
Days
��K O
,
��O P
timeSpan
��Q Y
.
��Y Z
Hours
��Z _
,
��_ `
timeSpan
��a i
.
��i j
Minutes
��j q
,
��q r
timeSpan
��s {
.
��{ |
Seconds��| �
)��� �
:��� �
string
�� 
.
�� 
Format
�� %
(
��% &
$str
��& 9
,
��9 :
timeSpan
��; C
.
��C D
Days
��D H
,
��H I
timeSpan
��J R
.
��R S
Hours
��S X
,
��X Y
timeSpan
��Z b
.
��b c
Minutes
��c j
)
��j k
;
��k l
}
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GetDuration
�� )
(
��) *
int
��* -
years
��. 3
,
��3 4
int
��5 8
months
��9 ?
,
��? @
int
��A D
days
��E I
,
��I J
int
��K N
hours
��O T
,
��T U
int
��V Y
minutes
��Z a
,
��a b
int
��c f
seconds
��g n
)
��n o
{
�� 	

�� 
sb
�� 
=
�� 
new
�� "

��# 0
(
��0 1
)
��1 2
;
��2 3
if
�� 
(
�� 
years
�� 
!=
�� 
$num
�� 
)
�� 
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
years
�� 
)
��  
;
��  !
sb
�� 
.
�� 
Append
�� 
(
�� $
DurationValueSeparator
�� 0
)
��0 1
;
��1 2
sb
�� 
.
�� 
Append
�� 
(
�� 
years
�� 
==
��  "
$num
��# $
?
��% &
Strings
��' .
.
��. /
TimeSpanYear
��/ ;
:
��< =
Strings
��> E
.
��E F

��F S
)
��S T
;
��T U
}
�� 
if
�� 
(
�� 
months
�� 
!=
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
sb
�� 
.
�� 
Length
�� 
>
�� 
$num
��  !
)
��! "
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
days
�� "
==
��# %
$num
��& '
&&
��( *
hours
��+ 0
==
��1 3
$num
��4 5
&&
��6 8
minutes
��9 @
==
��A C
$num
��D E
&&
��F H
seconds
��I P
==
��Q S
$num
��T U
?
��V W'
DurationLastItemSeparator
��X q
:
��r s$
DurationItemSeparator��t �
)��� �
;��� �
}
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
months
��  
)
��  !
;
��! "
sb
�� 
.
�� 
Append
�� 
(
�� $
DurationValueSeparator
�� 0
)
��0 1
;
��1 2
sb
�� 
.
�� 
Append
�� 
(
�� 
months
��  
==
��! #
$num
��$ %
?
��& '
Strings
��( /
.
��/ 0

��0 =
:
��> ?
Strings
��@ G
.
��G H
TimeSpanMonths
��H V
)
��V W
;
��W X
}
�� 
if
�� 
(
�� 
days
�� 
!=
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
sb
�� 
.
�� 
Length
�� 
>
�� 
$num
��  !
)
��! "
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
hours
�� #
==
��$ &
$num
��' (
&&
��) +
minutes
��, 3
==
��4 6
$num
��7 8
&&
��9 ;
seconds
��< C
==
��D F
$num
��G H
?
��I J'
DurationLastItemSeparator
��K d
:
��e f#
DurationItemSeparator
��g |
)
��| }
;
��} ~
}
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
days
�� 
)
�� 
;
��  
sb
�� 
.
�� 
Append
�� 
(
�� $
DurationValueSeparator
�� 0
)
��0 1
;
��1 2
sb
�� 
.
�� 
Append
�� 
(
�� 
days
�� 
==
�� !
$num
��" #
?
��$ %
Strings
��& -
.
��- .
TimeSpanDay
��. 9
:
��: ;
Strings
��< C
.
��C D
TimeSpanDays
��D P
)
��P Q
;
��Q R
}
�� 
if
�� 
(
�� 
hours
�� 
!=
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
sb
�� 
.
�� 
Length
�� 
>
�� 
$num
��  !
)
��! "
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
minutes
�� %
==
��& (
$num
��) *
&&
��+ -
seconds
��. 5
==
��6 8
$num
��9 :
?
��; <'
DurationLastItemSeparator
��= V
:
��W X#
DurationItemSeparator
��Y n
)
��n o
;
��o p
}
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
hours
�� 
)
��  
;
��  !
sb
�� 
.
�� 
Append
�� 
(
�� $
DurationValueSeparator
�� 0
)
��0 1
;
��1 2
sb
�� 
.
�� 
Append
�� 
(
�� 
hours
�� 
==
��  "
$num
��# $
?
��% &
Strings
��' .
.
��. /
TimeSpanHour
��/ ;
:
��< =
Strings
��> E
.
��E F

��F S
)
��S T
;
��T U
}
�� 
if
�� 
(
�� 
minutes
�� 
!=
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
sb
�� 
.
�� 
Length
�� 
>
�� 
$num
��  !
)
��! "
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
seconds
�� %
==
��& (
$num
��) *
?
��+ ,'
DurationLastItemSeparator
��- F
:
��G H#
DurationItemSeparator
��I ^
)
��^ _
;
��_ `
}
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
minutes
�� !
)
��! "
;
��" #
sb
�� 
.
�� 
Append
�� 
(
�� $
DurationValueSeparator
�� 0
)
��0 1
;
��1 2
sb
�� 
.
�� 
Append
�� 
(
�� 
minutes
�� !
==
��" $
$num
��% &
?
��' (
Strings
��) 0
.
��0 1
TimeSpanMinute
��1 ?
:
��@ A
Strings
��B I
.
��I J
TimeSpanMinutes
��J Y
)
��Y Z
;
��Z [
}
�� 
if
�� 
(
�� 
seconds
�� 
!=
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
sb
�� 
.
�� 
Length
�� 
>
�� 
$num
��  !
)
��! "
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� '
DurationLastItemSeparator
�� 7
)
��7 8
;
��8 9
}
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
seconds
�� !
)
��! "
;
��" #
sb
�� 
.
�� 
Append
�� 
(
�� $
DurationValueSeparator
�� 0
)
��0 1
;
��1 2
sb
�� 
.
�� 
Append
�� 
(
�� 
seconds
�� !
==
��" $
$num
��% &
?
��' (
Strings
��) 0
.
��0 1
TimeSpanSecond
��1 ?
:
��@ A
Strings
��B I
.
��I J
TimeSpanSeconds
��J Y
)
��Y Z
;
��Z [
}
�� 
return
�� 
sb
�� 
.
�� 
ToString
�� 
(
�� 
)
��  
;
��  !
}
�� 	
public
�� 
virtual
�� 
string
�� 
	GetPeriod
�� '
(
��' (
DateTime
��( 0
start
��1 6
,
��6 7
DateTime
��8 @
end
��A D
,
��D E
TimeSpan
��F N
duration
��O W
)
��W X
{
�� 	
if
�� 
(
�� 
end
�� 
<
�� 
start
�� 
)
�� 
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 ;
)
��; <
;
��< =
}
�� 
bool
�� 
startHasTimeOfDay
�� "
=
��# $
TimeTool
��% -
.
��- .
HasTimeOfDay
��. :
(
��: ;
start
��; @
)
��@ A
;
��A B
if
�� 
(
�� 
duration
�� 
==
�� 
TimeSpec
�� $
.
��$ %
MinPeriodDuration
��% 6
)
��6 7
{
�� 
return
�� 
startHasTimeOfDay
�� (
?
��) *
GetDateTime
��+ 6
(
��6 7
start
��7 <
)
��< =
:
��> ?
GetShortDate
��@ L
(
��L M
start
��M R
)
��R S
;
��S T
}
�� 
if
�� 
(
�� 
TimeCompare
�� 
.
�� 
	IsSameDay
�� %
(
��% &
start
��& +
,
��+ ,
end
��- 0
)
��0 1
)
��1 2
{
�� 
return
�� 
GetDateTime
�� "
(
��" #
start
��# (
)
��( )
+
��* +
startEndSeparator
��, =
+
��> ?
GetLongTime
��@ K
(
��K L
end
��L O
)
��O P
+
��Q R
durationSeparator
��S d
+
��e f
GetDuration
��g r
(
��r s
duration
��s {
)
��{ |
;
��| }
}
�� 
bool
�� 
endHasTimeOfDay
��  
=
��! "
TimeTool
��# +
.
��+ ,
HasTimeOfDay
��, 8
(
��8 9
end
��9 <
)
��< =
;
��= >
bool
�� 

�� 
=
��  
startHasTimeOfDay
��! 2
||
��3 5
endHasTimeOfDay
��6 E
;
��E F
string
�� 
	startPart
�� 
=
�� 

�� ,
?
��- .
GetDateTime
��/ :
(
��: ;
start
��; @
)
��@ A
:
��B C
GetShortDate
��D P
(
��P Q
start
��Q V
)
��V W
;
��W X
string
�� 
endPart
�� 
=
�� 

�� *
?
��+ ,
GetDateTime
��- 8
(
��8 9
end
��9 <
)
��< =
:
��> ?
GetShortDate
��@ L
(
��L M
end
��M P
)
��P Q
;
��Q R
return
�� 
	startPart
�� 
+
�� 
startEndSeparator
�� 0
+
��1 2
endPart
��3 :
+
��; <
durationSeparator
��= N
+
��O P
GetDuration
��Q \
(
��\ ]
duration
��] e
)
��e f
;
��f g
}
�� 	
public
�� 
string
�� 
GetCalendarPeriod
�� '
(
��' (
string
��( .
start
��/ 4
,
��4 5
string
��6 <
end
��= @
,
��@ A
TimeSpan
��B J
duration
��K S
)
��S T
{
�� 	
string
�� 

timePeriod
�� 
=
�� 
start
��  %
.
��% &
Equals
��& ,
(
��, -
end
��- 0
)
��0 1
?
��2 3
start
��4 9
:
��: ;
start
��< A
+
��B C
startEndSeparator
��D U
+
��V W
end
��X [
;
��[ \
return
�� 

timePeriod
�� 
+
�� 
durationSeparator
��  1
+
��2 3
GetDuration
��4 ?
(
��? @
duration
��@ H
)
��H I
;
��I J
}
�� 	
public
�� 
string
�� 
GetCalendarPeriod
�� '
(
��' (
string
��( .
context
��/ 6
,
��6 7
string
��8 >
start
��? D
,
��D E
string
��F L
end
��M P
,
��P Q
TimeSpan
��R Z
duration
��[ c
)
��c d
{
�� 	
string
�� 

timePeriod
�� 
=
�� 
start
��  %
.
��% &
Equals
��& ,
(
��, -
end
��- 0
)
��0 1
?
��2 3
start
��4 9
:
��: ;
start
��< A
+
��B C
startEndSeparator
��D U
+
��V W
end
��X [
;
��[ \
return
�� 
context
�� 
+
�� 
contextSeparator
�� -
+
��. /

timePeriod
��0 :
+
��; <
durationSeparator
��= N
+
��O P
GetDuration
��Q \
(
��\ ]
duration
��] e
)
��e f
;
��f g
}
�� 	
public
�� 
string
�� 
GetCalendarPeriod
�� '
(
��' (
string
��( .
startContext
��/ ;
,
��; <
string
��= C

endContext
��D N
,
��N O
string
��P V
start
��W \
,
��\ ]
string
��^ d
end
��e h
,
��h i
TimeSpan
��j r
duration
��s {
)
��{ |
{
�� 	
string
�� 

��  
=
��! "
startContext
��# /
.
��/ 0
Equals
��0 6
(
��6 7

endContext
��7 A
)
��A B
?
��C D
startContext
��E Q
:
��R S
startContext
��T `
+
��a b
startEndSeparator
��c t
+
��u v

endContext��w �
;��� �
string
�� 

timePeriod
�� 
=
�� 
start
��  %
.
��% &
Equals
��& ,
(
��, -
end
��- 0
)
��0 1
?
��2 3
start
��4 9
:
��: ;
start
��< A
+
��B C
startEndSeparator
��D U
+
��V W
end
��X [
;
��[ \
return
�� 

��  
+
��! "
contextSeparator
��# 3
+
��4 5

timePeriod
��6 @
+
��A B
durationSeparator
��C T
+
��U V
GetDuration
��W b
(
��b c
duration
��c k
)
��k l
;
��l m
}
�� 	
public
�� 
string
�� 
GetInterval
�� !
(
��! "
DateTime
��" *
start
��+ 0
,
��0 1
DateTime
��2 :
end
��; >
,
��> ?
IntervalEdge
�� 
	startEdge
�� "
,
��" #
IntervalEdge
��$ 0
endEdge
��1 8
,
��8 9
TimeSpan
��: B
duration
��C K
)
��K L
{
�� 	
if
�� 
(
�� 
end
�� 
<
�� 
start
�� 
)
�� 
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 ;
)
��; <
;
��< =
}
�� 

�� 
sb
�� 
=
�� 
new
�� "

��# 0
(
��0 1
)
��1 2
;
��2 3
switch
�� 
(
�� 
	startEdge
�� 
)
�� 
{
�� 
case
�� 
IntervalEdge
�� !
.
��! "
Closed
��" (
:
��( )
sb
�� 
.
�� 
Append
�� 
(
�� !
IntervalStartClosed
�� 1
)
��1 2
;
��2 3
break
�� 
;
�� 
case
�� 
IntervalEdge
�� !
.
��! "
Open
��" &
:
��& '
sb
�� 
.
�� 
Append
�� 
(
�� $
UseIsoIntervalNotation
�� 4
?
��5 6"
intervalStartOpenIso
��7 K
:
��L M
intervalStartOpen
��N _
)
��_ `
;
��` a
break
�� 
;
�� 
}
�� 
bool
�� 
addDuration
�� 
=
�� 
true
�� #
;
��# $
bool
�� 
startHasTimeOfDay
�� "
=
��# $
TimeTool
��% -
.
��- .
HasTimeOfDay
��. :
(
��: ;
start
��; @
)
��@ A
;
��A B
if
�� 
(
�� 
duration
�� 
==
�� 
TimeSpec
�� $
.
��$ %
MinPeriodDuration
��% 6
)
��6 7
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
startHasTimeOfDay
�� +
?
��, -
GetDateTime
��. 9
(
��9 :
start
��: ?
)
��? @
:
��A B
GetShortDate
��C O
(
��O P
start
��P U
)
��U V
)
��V W
;
��W X
addDuration
�� 
=
�� 
false
�� #
;
��# $
}
�� 
else
�� 
if
�� 
(
�� 
TimeCompare
��  
.
��  !
	IsSameDay
��! *
(
��* +
start
��+ 0
,
��0 1
end
��2 5
)
��5 6
)
��6 7
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
GetDateTime
�� %
(
��% &
start
��& +
)
��+ ,
)
��, -
;
��- .
sb
�� 
.
�� 
Append
�� 
(
�� 
startEndSeparator
�� +
)
��+ ,
;
��, -
sb
�� 
.
�� 
Append
�� 
(
�� 
GetLongTime
�� %
(
��% &
end
��& )
)
��) *
)
��* +
;
��+ ,
}
�� 
else
�� 
{
�� 
bool
�� 
endHasTimeOfDay
�� $
=
��% &
TimeTool
��' /
.
��/ 0
HasTimeOfDay
��0 <
(
��< =
start
��= B
)
��B C
;
��C D
bool
�� 

�� "
=
��# $
startHasTimeOfDay
��% 6
||
��7 9
endHasTimeOfDay
��: I
;
��I J
if
�� 
(
�� 

�� !
)
��! "
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
GetDateTime
�� )
(
��) *
start
��* /
)
��/ 0
)
��0 1
;
��1 2
sb
�� 
.
�� 
Append
�� 
(
�� 
startEndSeparator
�� /
)
��/ 0
;
��0 1
sb
�� 
.
�� 
Append
�� 
(
�� 
GetDateTime
�� )
(
��) *
end
��* -
)
��- .
)
��. /
;
��/ 0
}
�� 
else
�� 
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
GetShortDate
�� *
(
��* +
start
��+ 0
)
��0 1
)
��1 2
;
��2 3
sb
�� 
.
�� 
Append
�� 
(
�� 
startEndSeparator
�� /
)
��/ 0
;
��0 1
sb
�� 
.
�� 
Append
�� 
(
�� 
GetShortDate
�� *
(
��* +
end
��+ .
)
��. /
)
��/ 0
;
��0 1
}
�� 
}
�� 
switch
�� 
(
�� 
endEdge
�� 
)
�� 
{
�� 
case
�� 
IntervalEdge
�� !
.
��! "
Closed
��" (
:
��( )
sb
�� 
.
�� 
Append
�� 
(
�� 
IntervalEndClosed
�� /
)
��/ 0
;
��0 1
break
�� 
;
�� 
case
�� 
IntervalEdge
�� !
.
��! "
Open
��" &
:
��& '
sb
�� 
.
�� 
Append
�� 
(
�� $
UseIsoIntervalNotation
�� 4
?
��5 6 
IntervalEndOpenIso
��7 I
:
��J K
IntervalEndOpen
��L [
)
��[ \
;
��\ ]
break
�� 
;
�� 
}
�� 
if
�� 
(
�� 
addDuration
�� 
)
�� 
{
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
durationSeparator
�� +
)
��+ ,
;
��, -
sb
�� 
.
�� 
Append
�� 
(
�� 
GetDuration
�� %
(
��% &
duration
��& .
)
��. /
)
��/ 0
;
��0 1
}
�� 
return
�� 
sb
�� 
.
�� 
ToString
�� 
(
�� 
)
��  
;
��  !
}
�� 	
private
�� 
readonly
�� 
CultureInfo
�� $
culture
��% ,
;
��, -
private
�� 
readonly
�� 
string
�� 

��  -
;
��- .
private
�� 
readonly
�� 
string
�� 
contextSeparator
��  0
;
��0 1
private
�� 
readonly
�� 
string
�� 
startEndSeparator
��  1
;
��1 2
private
�� 
readonly
�� 
string
�� 
durationSeparator
��  1
;
��1 2
private
�� 
readonly
�� 
string
�� #
durationItemSeparator
��  5
;
��5 6
private
�� 
readonly
�� 
string
�� '
durationLastItemSeparator
��  9
;
��9 :
private
�� 
readonly
�� 
string
�� $
durationValueSeparator
��  6
;
��6 7
private
�� 
readonly
�� 
string
�� !
intervalStartClosed
��  3
;
��3 4
private
�� 
readonly
�� 
string
�� 
intervalStartOpen
��  1
;
��1 2
private
�� 
readonly
�� 
string
�� "
intervalStartOpenIso
��  4
;
��4 5
private
�� 
readonly
�� 
string
�� 
intervalEndClosed
��  1
;
��1 2
private
�� 
readonly
�� 
string
�� 
intervalEndOpen
��  /
;
��/ 0
private
�� 
readonly
�� 
string
��  
intervalEndOpenIso
��  2
;
��2 3
private
�� 
readonly
�� 
string
�� 
dateTimeFormat
��  .
;
��. /
private
�� 
readonly
�� 
string
�� 
shortDateFormat
��  /
;
��/ 0
private
�� 
readonly
�� 
string
�� 
longTimeFormat
��  .
;
��. /
private
�� 
readonly
�� 
string
�� 
shortTimeFormat
��  /
;
��/ 0
private
�� 
readonly
��  
DurationFormatType
�� +
durationType
��, 8
;
��8 9
private
�� 
readonly
�� 
bool
��  
useDurationSeconds
�� 0
;
��0 1
private
�� 
readonly
�� 
bool
�� $
useIsoIntervalNotation
�� 4
;
��4 5
private
�� 
static
�� 
readonly
�� 
object
��  &
mutex
��' ,
=
��- .
new
��/ 2
object
��3 9
(
��9 :
)
��: ;
;
��; <
private
�� 
static
�� 
volatile
�� 

��  -
instance
��. 6
;
��6 7
}
�� 
}�� �
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeGapCalculator.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
TimeGapCalculator "
<" #
T# $
>$ %
where& +
T, -
:. /
ITimePeriod0 ;
,; <
new= @
(@ A
)A B
{ 
public 
TimeGapCalculator  
(  !
)! "
:# $
this 
( 
null 
) 
{ 	
} 	
public 
TimeGapCalculator  
(  !
ITimePeriodMapper! 2
periodMapper3 ?
)? @
{ 	
this 
. 
periodMapper 
= 
periodMapper  ,
;, -
} 	
public 
ITimePeriodMapper  
PeriodMapper! -
{ 	
get   
{   
return   
periodMapper   %
;  % &
}  ' (
}!! 	
public$$ 
virtual$$ !
ITimePeriodCollection$$ ,
GetGaps$$- 4
($$4 5 
ITimePeriodContainer$$5 I
periods$$J Q
,$$Q R
ITimePeriod$$S ^
limits$$_ e
=$$f g
null$$h l
)$$l m
{%% 	
if&& 
(&& 
periods&& 
==&& 
null&& 
)&&  
{'' 
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
$str((0 9
)((9 :
;((: ;
})) 
TimeLine** 
<** 
T** 
>** 
timeLine**  
=**! "
new**# &
TimeLine**' /
<**/ 0
T**0 1
>**1 2
(**2 3
periods**3 :
,**: ;
limits**< B
,**B C
periodMapper**D P
)**P Q
;**Q R
return++ 
timeLine++ 
.++ 

(++) *
)++* +
;+++ ,
},, 	
private00 
readonly00 
ITimePeriodMapper00 *
periodMapper00+ 7
;007 8
}22 
}44 ǰ
mF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeInterval.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
TimeInterval 
: 

{ 
public 
static 
readonly 
TimeInterval +
Anytime, 3
=4 5
new6 9
TimeInterval: F
(F G
TimeSpec 
. 

," #
TimeSpec$ ,
., -

,: ;
IntervalEdge< H
.H I
ClosedI O
,O P
IntervalEdgeQ ]
.] ^
Closed^ d
,d e
falsef k
,k l
truem q
)q r
;r s
public 
TimeInterval 
( 
) 
: 
this 
( 
TimeSpec 
. 

,' (
TimeSpec) 1
.1 2

)? @
{ 	
} 	
public 
TimeInterval 
( 
DateTime $
moment% +
,+ ,
IntervalEdge 
	startEdge "
=# $
IntervalEdge% 1
.1 2
Closed2 8
,8 9
IntervalEdge: F
endEdgeG N
=O P
IntervalEdgeQ ]
.] ^
Closed^ d
,d e
bool 
isIntervalEnabled "
=# $
true% )
,) *
bool+ /

isReadOnly0 :
=; <
false= B
)B C
:D E
this 
( 
moment 
, 
moment 
,  
	startEdge! *
,* +
endEdge, 3
,3 4
isIntervalEnabled5 F
,F G

isReadOnlyH R
)R S
{   	
}!! 	
public$$ 
TimeInterval$$ 
($$ 
DateTime$$ $

,$$2 3
DateTime$$4 <
endInterval$$= H
,$$H I
IntervalEdge%% 
	startEdge%% "
=%%# $
IntervalEdge%%% 1
.%%1 2
Closed%%2 8
,%%8 9
IntervalEdge%%: F
endEdge%%G N
=%%O P
IntervalEdge%%Q ]
.%%] ^
Closed%%^ d
,%%d e
bool&& 
isIntervalEnabled&& "
=&&# $
true&&% )
,&&) *
bool&&+ /

isReadOnly&&0 :
=&&; <
false&&= B
)&&B C
{'' 	
if(( 
((( 

<=((  
endInterval((! ,
)((, -
{)) 
this** 
.** 

=**# $

;**2 3
this++ 
.++ 
endInterval++  
=++! "
endInterval++# .
;++. /
},, 
else-- 
{.. 
this// 
.// 
endInterval//  
=//! "

;//0 1
this00 
.00 

=00# $
endInterval00% 0
;000 1
}11 
this33 
.33 
	startEdge33 
=33 
	startEdge33 &
;33& '
this44 
.44 
endEdge44 
=44 
endEdge44 "
;44" #
this66 
.66 
isIntervalEnabled66 "
=66# $
isIntervalEnabled66% 6
;666 7
this77 
.77 

isReadOnly77 
=77 

isReadOnly77 (
;77( )
}88 	
public;; 
TimeInterval;; 
(;; 
ITimePeriod;; '
copy;;( ,
);;, -
{<< 	
if== 
(== 
copy== 
==== 
null== 
)== 
{>> 
throw?? 
new?? !
ArgumentNullException?? /
(??/ 0
$str??0 6
)??6 7
;??7 8
}@@ 

timeIntervalAA &
=AA' (
copyAA) -
asAA. 0

;AA> ?
ifBB 
(BB 
timeIntervalBB 
!=BB 
nullBB  $
)BB$ %
{CC 

=DD 
timeIntervalDD  ,
.DD, -

;DD: ;
endIntervalEE 
=EE 
timeIntervalEE *
.EE* +
EndIntervalEE+ 6
;EE6 7
	startEdgeFF 
=FF 
timeIntervalFF (
.FF( )
	StartEdgeFF) 2
;FF2 3
endEdgeGG 
=GG 
timeIntervalGG &
.GG& '
EndEdgeGG' .
;GG. /
isIntervalEnabledHH !
=HH" #
timeIntervalHH$ 0
.HH0 1
IsIntervalEnabledHH1 B
;HHB C
}II 
elseJJ 
{KK 

=LL 
copyLL  $
.LL$ %
StartLL% *
;LL* +
endIntervalMM 
=MM 
copyMM "
.MM" #
EndMM# &
;MM& '
}NN 

isReadOnlyPP 
=PP 
copyPP 
.PP 

IsReadOnlyPP (
;PP( )
}QQ 	
	protectedTT 
TimeIntervalTT 
(TT 
ITimePeriodTT *
copyTT+ /
,TT/ 0
boolTT1 5

isReadOnlyTT6 @
)TT@ A
{UU 	
ifVV 
(VV 
copyVV 
==VV 
nullVV 
)VV 
{WW 
throwXX 
newXX !
ArgumentNullExceptionXX /
(XX/ 0
$strXX0 6
)XX6 7
;XX7 8
}YY 

timeIntervalZZ &
=ZZ' (
copyZZ) -
asZZ. 0

;ZZ> ?
if[[ 
([[ 
timeInterval[[ 
!=[[ 
null[[  $
)[[$ %
{\\ 

=]] 
timeInterval]]  ,
.]], -

;]]: ;
endInterval^^ 
=^^ 
timeInterval^^ *
.^^* +
EndInterval^^+ 6
;^^6 7
	startEdge__ 
=__ 
timeInterval__ (
.__( )
	StartEdge__) 2
;__2 3
endEdge`` 
=`` 
timeInterval`` &
.``& '
EndEdge``' .
;``. /
isIntervalEnabledaa !
=aa" #
timeIntervalaa$ 0
.aa0 1
IsIntervalEnabledaa1 B
;aaB C
}bb 
elsecc 
{dd 

=ee 
copyee  $
.ee$ %
Startee% *
;ee* +
endIntervalff 
=ff 
copyff "
.ff" #
Endff# &
;ff& '
}gg 
thishh 
.hh 

isReadOnlyhh 
=hh 

isReadOnlyhh (
;hh( )
}ii 	
publicll 
boolll 

IsReadOnlyll 
{mm 	
getnn 
{nn 
returnnn 

isReadOnlynn #
;nn# $
}nn% &
}oo 	
publicrr 
boolrr 
	IsAnytimerr 
{ss 	
gettt 
{tt 
returntt 
!tt 
HasStarttt "
&&tt# %
!tt& '
HasEndtt' -
;tt- .
}tt/ 0
}uu 	
publicxx 
boolxx 
IsMomentxx 
{yy 	
getzz 
{zz 
returnzz 

.zz& '
Equalszz' -
(zz- .
endIntervalzz. 9
)zz9 :
;zz: ;
}zz< =
}{{ 	
public~~ 
bool~~ 
IsStartOpen~~ 
{ 	
get
�� 
{
�� 
return
�� 
	startEdge
�� "
==
��# %
IntervalEdge
��& 2
.
��2 3
Open
��3 7
;
��7 8
}
��9 :
}
�� 	
public
�� 
bool
�� 
	IsEndOpen
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
endEdge
��  
==
��! #
IntervalEdge
��$ 0
.
��0 1
Open
��1 5
;
��5 6
}
��7 8
}
�� 	
public
�� 
bool
�� 
IsOpen
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
IsStartOpen
�� $
&&
��% '
	IsEndOpen
��( 1
;
��1 2
}
��3 4
}
�� 	
public
�� 
bool
�� 

�� !
{
�� 	
get
�� 
{
�� 
return
�� 
	startEdge
�� "
==
��# %
IntervalEdge
��& 2
.
��2 3
Closed
��3 9
;
��9 :
}
��; <
}
�� 	
public
�� 
bool
�� 
IsEndClosed
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
endEdge
��  
==
��! #
IntervalEdge
��$ 0
.
��0 1
Closed
��1 7
;
��7 8
}
��9 :
}
�� 	
public
�� 
bool
�� 
IsClosed
�� 
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
&&
��' )
IsEndClosed
��* 5
;
��5 6
}
��7 8
}
�� 	
public
�� 
bool
�� 
IsEmpty
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
IsMoment
�� !
&&
��" $
!
��% &
IsClosed
��& .
;
��. /
}
��0 1
}
�� 	
public
�� 
bool
�� 
IsDegenerate
��  
{
�� 	
get
�� 
{
�� 
return
�� 
IsMoment
�� !
&&
��" $
IsClosed
��% -
;
��- .
}
��/ 0
}
�� 	
public
�� 
bool
�� 
IsIntervalEnabled
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
isIntervalEnabled
�� *
;
��* +
}
��, -
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
isIntervalEnabled
�� !
=
��" #
value
��$ )
;
��) *
}
�� 
}
�� 	
public
�� 
bool
�� 
HasStart
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
!
�� 
(
�� 

�� (
==
��) +
TimeSpec
��, 4
.
��4 5

��5 B
&&
��C E
	startEdge
��F O
==
��P R
IntervalEdge
��S _
.
��_ `
Closed
��` f
)
��f g
;
��g h
}
��i j
}
�� 	
public
�� 
DateTime
�� 

�� %
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
;
��& '
}
��( )
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
if
�� 
(
�� 
value
�� 
>
�� 
endInterval
�� '
)
��' (
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 9
(
��9 :
$str
��: A
)
��A B
;
��B C
}
�� 

�� 
=
�� 
value
��  %
;
��% &
}
�� 
}
�� 	
public
�� 
DateTime
�� 
Start
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
isIntervalEnabled
�� %
&&
��& (
	startEdge
��) 2
==
��3 5
IntervalEdge
��6 B
.
��B C
Open
��C G
)
��G H
{
�� 
return
�� 

�� (
.
��( )
AddTicks
��) 1
(
��1 2
$num
��2 3
)
��3 4
;
��4 5
}
�� 
return
�� 

�� $
;
��$ %
}
�� 
}
�� 	
public
�� 
IntervalEdge
�� 
	StartEdge
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
	startEdge
�� "
;
��" #
}
��$ %
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
	startEdge
�� 
=
�� 
value
�� !
;
��! "
}
�� 
}
�� 	
public
�� 
bool
�� 
HasEnd
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
!
�� 
(
�� 
endInterval
�� &
==
��' )
TimeSpec
��* 2
.
��2 3

��3 @
&&
��A C
endEdge
��D K
==
��L N
IntervalEdge
��O [
.
��[ \
Closed
��\ b
)
��b c
;
��c d
}
��e f
}
�� 	
public
�� 
DateTime
�� 
EndInterval
�� #
{
�� 	
get
�� 
{
�� 
return
�� 
endInterval
�� $
;
��$ %
}
��& '
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
if
�� 
(
�� 
value
�� 
<
�� 

�� )
)
��) *
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 9
(
��9 :
$str
��: A
)
��A B
;
��B C
}
�� 
endInterval
�� 
=
�� 
value
�� #
;
��# $
}
�� 
}
�� 	
public
�� 
DateTime
�� 
End
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
isIntervalEnabled
�� %
&&
��& (
endEdge
��) 0
==
��1 3
IntervalEdge
��4 @
.
��@ A
Open
��A E
)
��E F
{
�� 
return
�� 
endInterval
�� &
.
��& '
AddTicks
��' /
(
��/ 0
-
��0 1
$num
��1 2
)
��2 3
;
��3 4
}
�� 
return
�� 
endInterval
�� "
;
��" #
}
�� 
}
�� 	
public
�� 
IntervalEdge
�� 
EndEdge
�� #
{
�� 	
get
�� 
{
�� 
return
�� 
endEdge
��  
;
��  !
}
��" #
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
endEdge
�� 
=
�� 
value
�� 
;
��  
}
�� 
}
�� 	
public
�� 
TimeSpan
�� 
Duration
��  
{
�� 	
get
�� 
{
�� 
return
�� 
endInterval
�� $
.
��$ %
Subtract
��% -
(
��- .

��. ;
)
��; <
;
��< =
}
��> ?
}
�� 	
public
�� 
string
�� !
DurationDescription
�� )
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
.
��& '
Instance
��' /
.
��/ 0
GetDuration
��0 ;
(
��; <
Duration
��< D
,
��D E 
DurationFormatType
��F X
.
��X Y
Detailed
��Y a
)
��a b
;
��b c
}
��d e
}
�� 	
public
�� 
virtual
�� 
TimeSpan
�� 
GetDuration
��  +
(
��+ ,
IDurationProvider
��, =
provider
��> F
)
��F G
{
�� 	
if
�� 
(
�� 
provider
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
provider
�� 
.
�� 
GetDuration
�� '
(
��' (
Start
��( -
,
��- .
End
��/ 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 
void
�� 
Setup
�� !
(
��! "
DateTime
��" *
newStartInterval
��+ ;
,
��; <
DateTime
��= E
newEndInterval
��F T
)
��T U
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
newStartInterval
��  
<=
��! #
newEndInterval
��$ 2
)
��2 3
{
�� 

�� 
=
�� 
newStartInterval
��  0
;
��0 1
endInterval
�� 
=
�� 
newEndInterval
�� ,
;
��, -
}
�� 
else
�� 
{
�� 
endInterval
�� 
=
�� 
newStartInterval
�� .
;
��. /

�� 
=
�� 
newEndInterval
��  .
;
��. /
}
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IsSamePeriod
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
Start
�� 
==
�� 
test
��  
.
��  !
Start
��! &
&&
��' )
End
��* -
==
��. 0
test
��1 5
.
��5 6
End
��6 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
DateTime
��& .
test
��/ 3
)
��3 4
{
�� 	
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
ITimePeriod
��& 1
test
��2 6
)
��6 7
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 

�� 
Copy
�� !
(
��! "
)
��" #
{
�� 	
return
�� 
Copy
�� 
(
�� 
TimeSpan
��  
.
��  !
Zero
��! %
)
��% &
;
��& '
}
�� 	
public
�� 
virtual
�� 

�� $
Copy
��% )
(
��) *
TimeSpan
��* 2
offset
��3 9
)
��9 :
{
�� 	
return
�� 
new
�� 
TimeInterval
�� #
(
��# $

�� 
.
�� 
Add
�� !
(
��! "
offset
��" (
)
��( )
,
��) *
endInterval
�� 
.
�� 
Add
�� 
(
��  
offset
��  &
)
��& '
,
��' (
	startEdge
�� 
,
�� 
endEdge
�� 
,
�� 
IsIntervalEnabled
�� !
,
��! "

IsReadOnly
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
Move
��  
(
��  !
TimeSpan
��! )
offset
��* 0
)
��0 1
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
offset
�� 
==
�� 
TimeSpan
�� "
.
��" #
Zero
��# '
)
��' (
{
�� 
return
�� 
;
�� 
}
�� 

�� 
=
�� 

�� )
.
��) *
Add
��* -
(
��- .
offset
��. 4
)
��4 5
;
��5 6
endInterval
�� 
=
�� 
endInterval
�� %
.
��% &
Add
��& )
(
��) *
offset
��* 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
virtual
�� 
void
�� 

�� )
(
��) *
DateTime
��* 2
moment
��3 9
)
��9 :
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 

�� 
>
�� 
moment
��  &
)
��& '
{
�� 

�� 
=
�� 
moment
��  &
;
��& '
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
ExpandEndTo
�� '
(
��' (
DateTime
��( 0
moment
��1 7
)
��7 8
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
endInterval
�� 
<
�� 
moment
�� $
)
��$ %
{
�� 
endInterval
�� 
=
�� 
moment
�� $
;
��$ %
}
�� 
}
�� 	
public
�� 
void
�� 
ExpandTo
�� 
(
�� 
DateTime
�� %
moment
��& ,
)
��, -
{
�� 	

�� 
(
�� 
moment
��  
)
��  !
;
��! "
ExpandEndTo
�� 
(
�� 
moment
�� 
)
�� 
;
��  
}
�� 	
public
�� 
void
�� 
ExpandTo
�� 
(
�� 
ITimePeriod
�� (
period
��) /
)
��/ 0
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 

�� 
timeInterval
�� &
=
��' (
period
��) /
as
��0 2

��3 @
;
��@ A
if
�� 
(
�� 
timeInterval
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 

�� 
(
�� 
timeInterval
�� *
.
��* +

��+ 8
)
��8 9
;
��9 :
ExpandEndTo
�� 
(
�� 
timeInterval
�� (
.
��( )
EndInterval
��) 4
)
��4 5
;
��5 6
}
�� 
else
�� 
{
�� 

�� 
(
�� 
period
�� $
.
��$ %
Start
��% *
)
��* +
;
��+ ,
ExpandEndTo
�� 
(
�� 
period
�� "
.
��" #
End
��# &
)
��& '
;
��' (
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 

�� )
(
��) *
DateTime
��* 2
moment
��3 9
)
��9 :
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
	HasInside
�� 
(
�� 
moment
��  
)
��  !
&&
��" $

��% 2
<
��3 4
moment
��5 ;
)
��; <
{
�� 

�� 
=
�� 
moment
��  &
;
��& '
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
ShrinkEndTo
�� '
(
��' (
DateTime
��( 0
moment
��1 7
)
��7 8
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
	HasInside
�� 
(
�� 
moment
��  
)
��  !
&&
��" $
endInterval
��% 0
>
��1 2
moment
��3 9
)
��9 :
{
�� 
endInterval
�� 
=
�� 
moment
�� $
;
��$ %
}
�� 
}
�� 	
public
�� 
void
�� 
ShrinkTo
�� 
(
�� 
ITimePeriod
�� (
period
��) /
)
��/ 0
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 

�� 
timeInterval
�� &
=
��' (
period
��) /
as
��0 2

��3 @
;
��@ A
if
�� 
(
�� 
timeInterval
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 

�� 
(
�� 
timeInterval
�� *
.
��* +

��+ 8
)
��8 9
;
��9 :
ShrinkEndTo
�� 
(
�� 
timeInterval
�� (
.
��( )
EndInterval
��) 4
)
��4 5
;
��5 6
}
�� 
else
�� 
{
�� 

�� 
(
�� 
period
�� $
.
��$ %
Start
��% *
)
��* +
;
��+ ,
ShrinkEndTo
�� 
(
�� 
period
�� "
.
��" #
End
��# &
)
��& '
;
��' (
}
�� 

�� 
(
�� 
period
��  
.
��  !
Start
��! &
)
��& '
;
��' (
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IntersectsWith
�� *
(
��* +
ITimePeriod
��+ 6
test
��7 ;
)
��; <
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
IntersectsWith
��" 0
(
��0 1
this
��1 5
,
��5 6
test
��7 ;
)
��; <
;
��< =
}
�� 	
public
�� 
virtual
�� 

�� $
GetIntersection
��% 4
(
��4 5
ITimePeriod
��5 @
period
��A G
)
��G H
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
!
�� 
IntersectsWith
�� 
(
��  
period
��  &
)
��& '
)
��' (
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
DateTime
�� 
start
�� 
=
�� 
Start
�� "
;
��" #
DateTime
�� 
end
�� 
=
�� 
End
�� 
;
�� 
DateTime
�� 
periodStart
��  
=
��! "
period
��# )
.
��) *
Start
��* /
;
��/ 0
DateTime
�� 
	periodEnd
�� 
=
��  
period
��! '
.
��' (
End
��( +
;
��+ ,
return
�� 
new
�� 
TimeInterval
�� #
(
��# $
periodStart
�� 
>
�� 
start
�� #
?
��$ %
periodStart
��& 1
:
��2 3
start
��4 9
,
��9 :
	periodEnd
�� 
<
�� 
end
�� 
?
��  !
	periodEnd
��" +
:
��, -
end
��. 1
,
��1 2
IntervalEdge
�� 
.
�� 
Closed
�� #
,
��# $
IntervalEdge
�� 
.
�� 
Closed
�� #
,
��# $
IsIntervalEnabled
�� !
,
��! "

IsReadOnly
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
OverlapsWith
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
OverlapsWith
��" .
(
��. /
this
��/ 3
,
��3 4
test
��5 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
virtual
�� 
PeriodRelation
�� %
GetRelation
��& 1
(
��1 2
ITimePeriod
��2 =
test
��> B
)
��B C
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
GetRelation
��" -
(
��- .
this
��. 2
,
��2 3
test
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
int
�� 
	CompareTo
�� $
(
��$ %
ITimePeriod
��% 0
other
��1 6
,
��6 7!
ITimePeriodComparer
��8 K
comparer
��L T
)
��T U
{
�� 	
if
�� 
(
�� 
other
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
comparer
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
comparer
�� 
.
�� 
Compare
�� #
(
��# $
this
��$ (
,
��( )
other
��* /
)
��/ 0
;
��0 1
}
�� 	
public
�� 
virtual
�� 
void
�� 
Reset
�� !
(
��! "
)
��" #
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
isIntervalEnabled
�� 
=
�� 
true
��  $
;
��$ %

�� 
=
�� 
TimeSpec
�� $
.
��$ %

��% 2
;
��2 3
endInterval
�� 
=
�� 
TimeSpec
�� "
.
��" #

��# 0
;
��0 1
	startEdge
�� 
=
�� 
IntervalEdge
�� $
.
��$ %
Closed
��% +
;
��+ ,
endEdge
�� 
=
�� 
IntervalEdge
�� "
.
��" #
Closed
��# )
;
��) *
}
�� 	
public
�� 
string
�� 
GetDescription
�� $
(
��$ %
ITimeFormatter
��% 3
	formatter
��4 =
=
��> ?
null
��@ D
)
��D E
{
�� 	
return
�� 
Format
�� 
(
�� 
	formatter
�� #
??
��$ &

��' 4
.
��4 5
Instance
��5 =
)
��= >
;
��> ?
}
�� 	
	protected
�� 
virtual
�� 
string
��  
Format
��! '
(
��' (
ITimeFormatter
��( 6
	formatter
��7 @
)
��@ A
{
�� 	
return
�� 
	formatter
�� 
.
�� 
GetInterval
�� (
(
��( )

��) 6
,
��6 7
endInterval
��8 C
,
��C D
	startEdge
��E N
,
��N O
endEdge
��P W
,
��W X
Duration
��Y a
)
��a b
;
��b c
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
GetDescription
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
sealed
�� 
override
�� 
bool
�� #
Equals
��$ *
(
��* +
object
��+ 1
obj
��2 5
)
��5 6
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
this
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
IsEqual
�� 
(
�� 
obj
�� 
)
�� 
;
��  
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsEqual
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
return
�� 
HasSameData
�� 
(
�� 
obj
�� "
as
��# %
TimeInterval
��& 2
)
��2 3
;
��3 4
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
TimeInterval
��! -
comp
��. 2
)
��2 3
{
�� 	
return
�� 

isReadOnly
�� 
==
�� 
comp
�� "
.
��" #

isReadOnly
��# -
&&
��. 0
isIntervalEnabled
�� !
==
��" $
comp
��% )
.
��) *
isIntervalEnabled
��* ;
&&
��< >

�� 
==
��  
comp
��! %
.
��% &

��& 3
&&
��4 6
endInterval
�� 
==
�� 
comp
�� #
.
��# $
endInterval
��$ /
&&
��0 2
	startEdge
�� 
==
�� 
comp
�� !
.
��! "
	startEdge
��" +
&&
��, .
endEdge
�� 
==
�� 
comp
�� 
.
��  
endEdge
��  '
;
��' (
}
�� 	
public
�� 
sealed
�� 
override
�� 
int
�� "
GetHashCode
��# .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
AddHashCode
�� '
(
��' (
GetType
��( /
(
��/ 0
)
��0 1
.
��1 2
GetHashCode
��2 =
(
��= >
)
��> ?
,
��? @
ComputeHashCode
��A P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
�� 	
	protected
�� 
virtual
�� 
int
�� 
ComputeHashCode
�� -
(
��- .
)
��. /
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,

isReadOnly
�� 
,
�� 
isIntervalEnabled
�� !
,
��! "

�� 
,
�� 
endInterval
�� 
,
�� 
	startEdge
�� 
,
�� 
endEdge
�� 
)
�� 
;
�� 
}
�� 	
	protected
�� 
void
�� 
CheckModification
�� (
(
��( )
)
��) *
{
�� 	
if
�� 
(
�� 

IsReadOnly
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
NotSupportedException
�� /
(
��/ 0
$str
��0 K
)
��K L
;
��L M
}
�� 
}
�� 	
private
�� 
readonly
�� 
bool
�� 

isReadOnly
�� (
;
��( )
private
�� 
bool
�� 
isIntervalEnabled
�� &
=
��' (
true
��) -
;
��- .
private
�� 
DateTime
�� 

�� &
;
��& '
private
�� 
DateTime
�� 
endInterval
�� $
;
��$ %
private
�� 
IntervalEdge
�� 
	startEdge
�� &
;
��& '
private
�� 
IntervalEdge
�� 
endEdge
�� $
;
��$ %
}
�� 
}�� ��
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeLine.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
TimeLine 
< 
T 
> 
: 
	ITimeLine (
where) .
T/ 0
:1 2
ITimePeriod3 >
,> ?
new@ C
(C D
)D E
{ 
public 
TimeLine 
(  
ITimePeriodContainer ,
periods- 4
,4 5
ITimePeriodMapper6 G
periodMapperH T
=U V
nullW [
)[ \
:] ^
this 
( 
periods 
, 
null 
, 
periodMapper  ,
), -
{ 	
} 	
public 
TimeLine 
(  
ITimePeriodContainer ,
periods- 4
,4 5
ITimePeriod6 A
limitsB H
=I J
nullK O
,O P
ITimePeriodMapperQ b
periodMapperc o
=p q
nullr v
)v w
{ 	
if 
( 
periods 
== 
null 
)  
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 9
)9 :
;: ;
} 
this 
. 
limits 
= 
limits  
!=! #
null$ (
?) *
new+ .
	TimeRange/ 8
(8 9
limits9 ?
)? @
:A B
newC F
	TimeRangeG P
(P Q
periodsQ X
)X Y
;Y Z
this   
.   
periods   
=   
periods   "
;  " #
this!! 
.!! 
periodMapper!! 
=!! 
periodMapper!!  ,
;!!, -
}"" 	
public%%  
ITimePeriodContainer%% #
Periods%%$ +
{&& 	
get'' 
{'' 
return'' 
periods''  
;''  !
}''" #
}(( 	
public++ 
ITimePeriod++ 
Limits++ !
{,, 	
get-- 
{-- 
return-- 
limits-- 
;--  
}--! "
}.. 	
public11 
ITimePeriodMapper11  
PeriodMapper11! -
{22 	
get33 
{33 
return33 
periodMapper33 %
;33% &
}33' (
}44 	
private77 
bool77 
HasNonMomentPeriods77 (
{88 	
get99 
{:: 
foreach;; 
(;; 
ITimePeriod;; $
period;;% +
in;;, .
periods;;/ 6
);;6 7
{<< 
if== 
(== 
!== 
period== 
.==  
IsMoment==  (
)==( )
{>> 
return?? 
true?? #
;??# $
}@@ 
}AA 
returnBB 
falseBB 
;BB 
}CC 
}DD 	
publicGG 
boolGG 
HasOverlapsGG 
(GG  
)GG  !
{HH 	
returnII 
GetTimeLineMomentsII %
(II% &
)II& '
.II' (
HasOverlapsII( 3
(II3 4
)II4 5
;II5 6
}JJ 	
publicMM 
boolMM 
HasGapsMM 
(MM 
)MM 
{NN 	
returnOO 
GetTimeLineMomentsOO %
(OO% &
)OO& '
.OO' (
HasGapsOO( /
(OO/ 0
)OO0 1
;OO1 2
}PP 	
publicSS !
ITimePeriodCollectionSS $
CombinePeriodsSS% 3
(SS3 4
)SS4 5
{TT 	
ifUU 
(UU 
periodsUU 
.UU 
CountUU 
==UU  
$numUU! "
||UU# %
periodsUU& -
.UU- .
CountUU. 3
>UU4 5
$numUU6 7
&&UU8 :
!UU; <
HasNonMomentPeriodsUU< O
)UUO P
{VV 
returnWW 
newWW  
TimePeriodCollectionWW /
(WW/ 0
)WW0 1
;WW1 2
}XX 
ITimeLineMomentCollectionZZ %
timeLineMomentsZZ& 5
=ZZ6 7
GetTimeLineMomentsZZ8 J
(ZZJ K
)ZZK L
;ZZL M
return[[ 
timeLineMoments[[ "
.[[" #
Count[[# (
==[[) +
$num[[, -
?[[. /
new[[0 3 
TimePeriodCollection[[4 H
{[[I J
new[[K N
	TimeRange[[O X
([[X Y
periods[[Y `
)[[` a
}[[b c
:[[d e
CombinePeriods[[f t
([[t u
timeLineMoments	[[u �
)
[[� �
;
[[� �
}\\ 	
public__ !
ITimePeriodCollection__ $
IntersectPeriods__% 5
(__5 6
bool__6 :
combinePeriods__; I
=__J K
true__L P
)__P Q
{`` 	
ifaa 
(aa 
periodsaa 
.aa 
Countaa 
==aa  
$numaa! "
||aa# %
periodsaa& -
.aa- .
Countaa. 3
>aa4 5
$numaa6 7
&&aa8 :
!aa; <
HasNonMomentPeriodsaa< O
)aaO P
{bb 
returncc 
newcc  
TimePeriodCollectioncc /
(cc/ 0
)cc0 1
;cc1 2
}dd 
ITimeLineMomentCollectionff %
timeLineMomentsff& 5
=ff6 7
GetTimeLineMomentsff8 J
(ffJ K
)ffK L
;ffL M
ifgg 
(gg 
timeLineMomentsgg 
.gg  
Countgg  %
==gg& (
$numgg) *
)gg* +
{hh 
returnii 
newii  
TimePeriodCollectionii /
(ii/ 0
)ii0 1
;ii1 2
}jj 
returnll 
combinePeriodsll !
?ll" #$
IntersectCombinedPeriodsll$ <
(ll< =
timeLineMomentsll= L
)llL M
:llN O
IntersectPeriodsllP `
(ll` a
timeLineMomentslla p
)llp q
;llq r
}mm 	
publicpp !
ITimePeriodCollectionpp $

(pp2 3
)pp3 4
{qq 	 
TimePeriodCollectionss  

gapPeriodsss! +
=ss, -
newss. 1 
TimePeriodCollectionss2 F
(ssF G
)ssG H
;ssH I
foreachtt 
(tt 
ITimePeriodtt  
periodtt! '
intt( *
periodstt+ 2
)tt2 3
{uu 
ifvv 
(vv 
limitsvv 
.vv 
IntersectsWithvv )
(vv) *
periodvv* 0
)vv0 1
)vv1 2
{ww 

gapPeriodsxx 
.xx 
Addxx "
(xx" #
newxx# &
	TimeRangexx' 0
(xx0 1
periodxx1 7
)xx7 8
)xx8 9
;xx9 :
}yy 
}zz 
ITimeLineMomentCollection|| %
timeLineMoments||& 5
=||6 7
GetTimeLineMoments||8 J
(||J K

gapPeriods||K U
)||U V
;||V W
if}} 
(}} 
timeLineMoments}} 
.}}  
Count}}  %
==}}& (
$num}}) *
)}}* +
{~~ 
return 
new  
TimePeriodCollection /
{0 1
limits2 8
}9 :
;: ;
}
�� 
T
�� 
range
�� 
=
�� 
new
�� 
T
�� 
(
�� 
)
�� 
;
�� 
range
�� 
.
�� 
Setup
�� 
(
�� 
MapPeriodStart
�� &
(
��& '
limits
��' -
.
��- .
Start
��. 3
)
��3 4
,
��4 5
MapPeriodEnd
��6 B
(
��B C
limits
��C I
.
��I J
End
��J M
)
��M N
)
��N O
;
��O P
return
�� 

��  
(
��  !
range
��! &
,
��& '
timeLineMoments
��( 7
)
��7 8
;
��8 9
}
�� 	
private
�� '
ITimeLineMomentCollection
�� ) 
GetTimeLineMoments
��* <
(
��< =
)
��= >
{
�� 	
return
��  
GetTimeLineMoments
�� %
(
��% &
periods
��& -
)
��- .
;
��. /
}
�� 	
private
�� '
ITimeLineMomentCollection
�� ) 
GetTimeLineMoments
��* <
(
��< =
ICollection
��= H
<
��H I
ITimePeriod
��I T
>
��T U

��V c
)
��c d
{
�� 	&
TimeLineMomentCollection
�� $
timeLineMoments
��% 4
=
��5 6
new
��7 :&
TimeLineMomentCollection
��; S
(
��S T
)
��T U
;
��U V
if
�� 
(
�� 

�� 
.
�� 
Count
�� #
==
��$ &
$num
��' (
)
��( )
{
�� 
return
�� 
timeLineMoments
�� &
;
��& '
}
�� 
ITimePeriodCollection
�� !

��" /
=
��0 1
new
��2 5"
TimePeriodCollection
��6 J
(
��J K
)
��K L
;
��L M
foreach
�� 
(
�� 
ITimePeriod
��  
momentPeriod
��! -
in
��. 0

��1 >
)
��> ?
{
�� 
if
�� 
(
�� 
momentPeriod
��  
.
��  !
IsMoment
��! )
)
��) *
{
�� 
continue
�� 
;
�� 
}
�� 

ITimeRange
�� 
intersection
�� '
=
��( )
limits
��* 0
.
��0 1
GetIntersection
��1 @
(
��@ A
momentPeriod
��A M
)
��M N
;
��N O
if
�� 
(
�� 
intersection
��  
==
��! #
null
��$ (
||
��) +
intersection
��, 8
.
��8 9
IsMoment
��9 A
)
��A B
{
�� 
continue
�� 
;
�� 
}
�� 
if
�� 
(
�� 
periodMapper
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
intersection
��  
=
��! "
new
��# &
	TimeRange
��' 0
(
��0 1
MapPeriodStart
��1 ?
(
��? @
intersection
��@ L
.
��L M
Start
��M R
)
��R S
,
��S T
MapPeriodEnd
��U a
(
��a b
intersection
��b n
.
��n o
End
��o r
)
��r s
)
��s t
;
��t u
}
�� 

�� 
.
�� 
Add
�� !
(
��! "
intersection
��" .
)
��. /
;
��/ 0
}
�� 
timeLineMoments
�� 
.
�� 
AddAll
�� "
(
��" #

��# 0
)
��0 1
;
��1 2
return
�� 
timeLineMoments
�� "
;
��" #
}
�� 	
private
�� 
static
�� #
ITimePeriodCollection
�� ,
CombinePeriods
��- ;
(
��; <'
ITimeLineMomentCollection
��< U
timeLineMoments
��V e
)
��e f
{
�� 	"
TimePeriodCollection
��  
periods
��! (
=
��) *
new
��+ ."
TimePeriodCollection
��/ C
(
��C D
)
��D E
;
��E F
if
�� 
(
�� 
timeLineMoments
�� 
.
��  
IsEmpty
��  '
)
��' (
{
�� 
return
�� 
periods
�� 
;
�� 
}
�� 
int
�� 
	itemIndex
�� 
=
�� 
$num
�� 
;
�� 
while
�� 
(
�� 
	itemIndex
�� 
<
�� 
timeLineMoments
�� .
.
��. /
Count
��/ 4
)
��4 5
{
�� 
ITimeLineMoment
�� 
periodStart
��  +
=
��, -
timeLineMoments
��. =
[
��= >
	itemIndex
��> G
]
��G H
;
��H I
int
�� 

startCount
�� 
=
��  
periodStart
��! ,
.
��, -

StartCount
��- 7
;
��7 8
if
�� 
(
�� 

startCount
�� 
==
�� !
$num
��" #
)
��# $
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
)
��8 9
;
��9 :
}
�� 
int
�� 
balance
�� 
=
�� 

startCount
�� (
;
��( )
ITimeLineMoment
�� 
	periodEnd
��  )
=
��* +
null
��, 0
;
��0 1
while
�� 
(
�� 
	itemIndex
��  
<
��! "
timeLineMoments
��# 2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
&&
��= ?
balance
��@ G
>
��H I
$num
��J K
)
��K L
{
�� 
	itemIndex
�� 
++
�� 
;
��  
	periodEnd
�� 
=
�� 
timeLineMoments
��  /
[
��/ 0
	itemIndex
��0 9
]
��9 :
;
��: ;
balance
�� 
+=
�� 
	periodEnd
�� (
.
��( )
BalanceCount
��) 5
;
��5 6
}
�� 
if
�� 
(
�� 
	periodEnd
�� 
==
��  
null
��! %
)
��% &
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
	periodEnd
�� 
.
�� 

StartCount
�� (
>
��) *
$num
��+ ,
)
��, -
{
�� 
	itemIndex
�� 
++
�� 
;
��  
continue
�� 
;
�� 
}
�� 
if
�� 
(
�� 
	itemIndex
�� 
<
�� 
timeLineMoments
��  /
.
��/ 0
Count
��0 5
)
��5 6
{
�� 
T
�� 
period
�� 
=
�� 
new
�� "
T
��# $
(
��$ %
)
��% &
;
��& '
period
�� 
.
�� 
Setup
��  
(
��  !
periodStart
��! ,
.
��, -
Moment
��- 3
,
��3 4
	periodEnd
��5 >
.
��> ?
Moment
��? E
)
��E F
;
��F G
periods
�� 
.
�� 
Add
�� 
(
��  
period
��  &
)
��& '
;
��' (
}
�� 
	itemIndex
�� 
++
�� 
;
�� 
}
�� 
return
�� 
periods
�� 
;
�� 
}
�� 	
private
�� 
static
�� #
ITimePeriodCollection
�� ,&
IntersectCombinedPeriods
��- E
(
��E F'
ITimeLineMomentCollection
��F _
timeLineMoments
��` o
)
��o p
{
�� 	"
TimePeriodCollection
��  
periods
��! (
=
��) *
new
��+ ."
TimePeriodCollection
��/ C
(
��C D
)
��D E
;
��E F
if
�� 
(
�� 
timeLineMoments
�� 
.
��  
IsEmpty
��  '
)
��' (
{
�� 
return
�� 
periods
�� 
;
�� 
}
�� 
int
�� 
intersectionStart
�� !
=
��" #
-
��$ %
$num
��% &
;
��& '
int
�� 
balance
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
timeLineMoments
��  /
.
��/ 0
Count
��0 5
;
��5 6
i
��7 8
++
��8 :
)
��: ;
{
�� 
ITimeLineMoment
�� 
moment
��  &
=
��' (
timeLineMoments
��) 8
[
��8 9
i
��9 :
]
��: ;
;
��; <
int
�� 

startCount
�� 
=
��  
moment
��! '
.
��' (

StartCount
��( 2
;
��2 3
int
�� 
endCount
�� 
=
�� 
moment
�� %
.
��% &
EndCount
��& .
;
��. /
balance
�� 
+=
�� 

startCount
�� %
;
��% &
balance
�� 
-=
�� 
endCount
�� #
;
��# $
if
�� 
(
�� 

startCount
�� 
>
��  
$num
��! "
&&
��# %
balance
��& -
>
��. /
$num
��0 1
&&
��2 4
intersectionStart
��5 F
<
��G H
$num
��I J
)
��J K
{
�� 
intersectionStart
�� %
=
��& '
i
��( )
;
��) *
continue
�� 
;
�� 
}
�� 
if
�� 
(
�� 
endCount
�� 
<=
�� 
$num
��  !
||
��" $
balance
��% ,
>
��- .
$num
��/ 0
||
��1 3
intersectionStart
��4 E
<
��F G
$num
��H I
)
��I J
{
�� 
continue
�� 
;
�� 
}
�� 
T
�� 
period
�� 
=
�� 
new
�� 
T
��  
(
��  !
)
��! "
;
��" #
period
�� 
.
�� 
Setup
�� 
(
�� 
timeLineMoments
�� ,
[
��, -
intersectionStart
��- >
]
��> ?
.
��? @
Moment
��@ F
,
��F G
moment
��H N
.
��N O
Moment
��O U
)
��U V
;
��V W
periods
�� 
.
�� 
Add
�� 
(
�� 
period
�� "
)
��" #
;
��# $
intersectionStart
�� !
=
��" #
-
��$ %
$num
��% &
;
��& '
}
�� 
return
�� 
periods
�� 
;
�� 
}
�� 	
private
�� 
static
�� #
ITimePeriodCollection
�� ,
IntersectPeriods
��- =
(
��= >'
ITimeLineMomentCollection
��> W
timeLineMoments
��X g
)
��g h
{
�� 	"
TimePeriodCollection
��  
periods
��! (
=
��) *
new
��+ ."
TimePeriodCollection
��/ C
(
��C D
)
��D E
;
��E F
if
�� 
(
�� 
timeLineMoments
�� 
.
��  
IsEmpty
��  '
)
��' (
{
�� 
return
�� 
periods
�� 
;
�� 
}
�� 
int
�� 
intersectionStart
�� !
=
��" #
-
��$ %
$num
��% &
;
��& '
int
�� 
balance
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
timeLineMoments
��  /
.
��/ 0
Count
��0 5
;
��5 6
i
��7 8
++
��8 :
)
��: ;
{
�� 
ITimeLineMoment
�� 
moment
��  &
=
��' (
timeLineMoments
��) 8
[
��8 9
i
��9 :
]
��: ;
;
��; <
balance
�� 
+=
�� 
moment
�� !
.
��! "
BalanceCount
��" .
;
��. /
if
�� 
(
�� 
balance
�� 
>
�� 
$num
�� 
&&
��  "
intersectionStart
��# 4
<
��5 6
$num
��7 8
)
��8 9
{
�� 
intersectionStart
�� %
=
��& '
i
��( )
;
��) *
continue
�� 
;
�� 
}
�� 
if
�� 
(
�� 
intersectionStart
�� %
<
��& '
$num
��( )
)
��) *
{
�� 
continue
�� 
;
�� 
}
�� 
T
�� 
period
�� 
=
�� 
new
�� 
T
��  
(
��  !
)
��! "
;
��" #
period
�� 
.
�� 
Setup
�� 
(
�� 
timeLineMoments
�� ,
[
��, -
intersectionStart
��- >
]
��> ?
.
��? @
Moment
��@ F
,
��F G
moment
��H N
.
��N O
Moment
��O U
)
��U V
;
��V W
periods
�� 
.
�� 
Add
�� 
(
�� 
period
�� "
)
��" #
;
��# $
intersectionStart
�� !
=
��" #
balance
��$ +
>
��, -
$num
��. /
?
��0 1
i
��2 3
:
��4 5
-
��6 7
$num
��7 8
;
��8 9
}
�� 
return
�� 
periods
�� 
;
�� 
}
�� 	
private
�� 
static
�� #
ITimePeriodCollection
�� ,

��- :
(
��: ;
ITimePeriod
��; F
range
��G L
,
��L M'
ITimeLineMomentCollection
��N g
timeLineMoments
��h w
)
��w x
{
�� 	"
TimePeriodCollection
��  
gaps
��! %
=
��& '
new
��( +"
TimePeriodCollection
��, @
(
��@ A
)
��A B
;
��B C
if
�� 
(
�� 
timeLineMoments
�� 
.
��  
IsEmpty
��  '
)
��' (
{
�� 
return
�� 
gaps
�� 
;
�� 
}
�� 
ITimeLineMoment
�� 
periodStart
�� '
=
��( )
timeLineMoments
��* 9
.
��9 :
Min
��: =
;
��= >
if
�� 
(
�� 
periodStart
�� 
!=
�� 
null
�� #
&&
��$ &
range
��' ,
.
��, -
Start
��- 2
<
��3 4
periodStart
��5 @
.
��@ A
Moment
��A G
)
��G H
{
�� 
T
�� 
startingGap
�� 
=
�� 
new
��  #
T
��$ %
(
��% &
)
��& '
;
��' (
startingGap
�� 
.
�� 
Setup
�� !
(
��! "
range
��" '
.
��' (
Start
��( -
,
��- .
periodStart
��/ :
.
��: ;
Moment
��; A
)
��A B
;
��B C
gaps
�� 
.
�� 
Add
�� 
(
�� 
startingGap
�� $
)
��$ %
;
��% &
}
�� 
int
�� 
	itemIndex
�� 
=
�� 
$num
�� 
;
�� 
while
�� 
(
�� 
	itemIndex
�� 
<
�� 
timeLineMoments
�� .
.
��. /
Count
��/ 4
)
��4 5
{
�� 
ITimeLineMoment
�� 
moment
��  &
=
��' (
timeLineMoments
��) 8
[
��8 9
	itemIndex
��9 B
]
��B C
;
��C D
int
�� 

startCount
�� 
=
��  
moment
��! '
.
��' (

StartCount
��( 2
;
��2 3
if
�� 
(
�� 

startCount
�� 
==
�� !
$num
��" #
)
��# $
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
)
��8 9
;
��9 :
}
�� 
int
�� 
balance
�� 
=
�� 

startCount
�� (
;
��( )
ITimeLineMoment
�� 
gapStart
��  (
=
��) *
null
��+ /
;
��/ 0
while
�� 
(
�� 
	itemIndex
��  
<
��! "
timeLineMoments
��# 2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
&&
��= ?
balance
��@ G
>
��H I
$num
��J K
)
��K L
{
�� 
	itemIndex
�� 
++
�� 
;
��  
gapStart
�� 
=
�� 
timeLineMoments
�� .
[
��. /
	itemIndex
��/ 8
]
��8 9
;
��9 :
balance
�� 
+=
�� 
gapStart
�� '
.
��' (
BalanceCount
��( 4
;
��4 5
}
�� 
if
�� 
(
�� 
gapStart
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
gapStart
�� 
.
�� 

StartCount
�� '
>
��( )
$num
��* +
)
��+ ,
{
�� 
	itemIndex
�� 
++
�� 
;
��  
continue
�� 
;
�� 
}
�� 
if
�� 
(
�� 
	itemIndex
�� 
<
�� 
timeLineMoments
��  /
.
��/ 0
Count
��0 5
-
��6 7
$num
��8 9
)
��9 :
{
�� 
T
�� 
gap
�� 
=
�� 
new
�� 
T
��  !
(
��! "
)
��" #
;
��# $
gap
�� 
.
�� 
Setup
�� 
(
�� 
gapStart
�� &
.
��& '
Moment
��' -
,
��- .
timeLineMoments
��/ >
[
��> ?
	itemIndex
��? H
+
��I J
$num
��K L
]
��L M
.
��M N
Moment
��N T
)
��T U
;
��U V
gaps
�� 
.
�� 
Add
�� 
(
�� 
gap
��  
)
��  !
;
��! "
}
�� 
	itemIndex
�� 
++
�� 
;
�� 
}
�� 
ITimeLineMoment
�� 
	periodEnd
�� %
=
��& '
timeLineMoments
��( 7
.
��7 8
Max
��8 ;
;
��; <
if
�� 
(
�� 
	periodEnd
�� 
!=
�� 
null
�� !
&&
��" $
range
��% *
.
��* +
End
��+ .
>
��/ 0
	periodEnd
��1 :
.
��: ;
Moment
��; A
)
��A B
{
�� 
T
�� 
	endingGap
�� 
=
�� 
new
�� !
T
��" #
(
��# $
)
��$ %
;
��% &
	endingGap
�� 
.
�� 
Setup
�� 
(
��  
	periodEnd
��  )
.
��) *
Moment
��* 0
,
��0 1
range
��2 7
.
��7 8
End
��8 ;
)
��; <
;
��< =
gaps
�� 
.
�� 
Add
�� 
(
�� 
	endingGap
�� "
)
��" #
;
��# $
}
�� 
return
�� 
gaps
�� 
;
�� 
}
�� 	
private
�� 
DateTime
�� 
MapPeriodStart
�� '
(
��' (
DateTime
��( 0
start
��1 6
)
��6 7
{
�� 	
return
�� 
periodMapper
�� 
!=
��  "
null
��# '
?
��( )
periodMapper
��* 6
.
��6 7

UnmapStart
��7 A
(
��A B
start
��B G
)
��G H
:
��I J
start
��K P
;
��P Q
}
�� 	
private
�� 
DateTime
�� 
MapPeriodEnd
�� %
(
��% &
DateTime
��& .
end
��/ 2
)
��2 3
{
�� 	
return
�� 
periodMapper
�� 
!=
��  "
null
��# '
?
��( )
periodMapper
��* 6
.
��6 7
UnmapEnd
��7 ?
(
��? @
end
��@ C
)
��C D
:
��E F
end
��G J
;
��J K
}
�� 	
private
�� 
readonly
�� 

ITimeRange
�� #
limits
��$ *
;
��* +
private
�� 
readonly
�� "
ITimePeriodContainer
�� -
periods
��. 5
;
��5 6
private
�� 
readonly
�� 
ITimePeriodMapper
�� *
periodMapper
��+ 7
;
��7 8
}
�� 
}�� �
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeLineMoment.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
TimeLineMoment 
:  !
ITimeLineMoment" 1
{ 
public 
TimeLineMoment 
( 
DateTime &
moment' -
)- .
{ 	
this 
. 
moment 
= 
moment  
;  !
} 	
public 
DateTime 
Moment 
{ 	
get 
{ 
return 
moment 
;  
}! "
} 	
public 
int 
BalanceCount 
{ 	
get   
{   
return   

startCount   #
-  $ %
endCount  & .
;  . /
}  0 1
}!! 	
public$$ 
int$$ 

StartCount$$ 
{%% 	
get&& 
{&& 
return&& 

startCount&& #
;&&# $
}&&% &
}'' 	
public** 
int** 
EndCount** 
{++ 	
get,, 
{,, 
return,, 
endCount,, !
;,,! "
},,# $
}-- 	
public00 
bool00 
IsEmpty00 
{11 	
get22 
{22 
return22 

startCount22 #
==22$ &
$num22' (
&&22) +
endCount22, 4
==225 7
$num228 9
;229 :
}22; <
}33 	
public66 
void66 
AddStart66 
(66 
)66 
{77 	

startCount88 
++88 
;88 
}99 	
public<< 
void<< 
RemoveStart<< 
(<<  
)<<  !
{== 	
if>> 
(>> 

startCount>> 
==>> 
$num>> 
)>>  
{?? 
throw@@ 
new@@ %
InvalidOperationException@@ 3
(@@3 4
)@@4 5
;@@5 6
}AA 

startCountBB 
--BB 
;BB 
}CC 	
publicFF 
voidFF 
AddEndFF 
(FF 
)FF 
{GG 	
endCountHH 
++HH 
;HH 
}II 	
publicLL 
voidLL 
	RemoveEndLL 
(LL 
)LL 
{MM 	
ifNN 
(NN 
endCountNN 
==NN 
$numNN 
)NN 
{OO 
throwPP 
newPP %
InvalidOperationExceptionPP 3
(PP3 4
)PP4 5
;PP5 6
}QQ 
endCountRR 
--RR 
;RR 
}SS 	
publicVV 
overrideVV 
stringVV 
ToStringVV '
(VV' (
)VV( )
{WW 	
returnXX 
stringXX 
.XX 
FormatXX  
(XX  !
$strXX! 0
,XX0 1
MomentXX2 8
,XX8 9

StartCountXX: D
,XXD E
EndCountXXF N
)XXN O
;XXO P
}YY 	
private]] 
readonly]] 
DateTime]] !
moment]]" (
;]]( )
private^^ 
int^^ 

startCount^^ 
;^^ 
private__ 
int__ 
endCount__ 
;__ 
}aa 
}cc �
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeLineMomentCollection.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

class $
TimeLineMomentCollection )
:* +%
ITimeLineMomentCollection, E
{ 
public $
TimeLineMomentCollection	 !
(! "
)" #
{ 
} 
public $
TimeLineMomentCollection	 !
(! "
IEnumerable" -
<- .
ITimePeriod. 9
>9 :
periods; B
)B C
{ 
AddAll 	
(	 

periods
 
) 
; 
} 
public 
int	 
Count
{ 
get   
{   
return  	 
timeLineMoments   
.    
Count    %
;  % &
}  ' (
}!! 
public$$ 
bool$$	 
IsEmpty$$ 
{%% 
get&& 
{&& 
return&&	 
Count&& 
==&& 
$num&& 
;&& 
}&& 
}'' 
public** 
ITimeLineMoment**	 
Min** 
{++ 
get,, 
{,, 
return,,	 
!,, 
IsEmpty,, 
?,, 
timeLineMoments,, *
[,,* +
$num,,+ ,
],,, -
:,,. /
null,,0 4
;,,4 5
},,6 7
}-- 
public00 
ITimeLineMoment00	 
Max00 
{11 
get22 
{22 
return22	 
!22 
IsEmpty22 
?22 
timeLineMoments22 *
[22* +
Count22+ 0
-221 2
$num223 4
]224 5
:226 7
null228 <
;22< =
}22> ?
}33 
public66 
ITimeLineMoment66	 
this66 
[66 
int66 !
index66" '
]66' (
{77 
get88 
{88 
return88	 
timeLineMoments88 
[88  
index88  %
]88% &
;88& '
}88( )
}99 
public<< 
ITimeLineMoment<<	 
this<< 
[<< 
DateTime<< &
moment<<' -
]<<- .
{== 
get>> 
{>> 
return>>	  
timeLineMomentLookup>> $
[>>$ %
moment>>% +
]>>+ ,
;>>, -
}>>. /
}?? 
	protectedBB 
IListBB 
<BB 
ITimeLineMomentBB !
>BB! "
MomentsBB# *
{CC 
getDD 
{DD 
returnDD	 
timeLineMomentsDD 
;DD  
}DD! "
}EE 
publicHH 
voidHH	 
ClearHH 
(HH 
)HH 
{II 
timeLineMomentsJJ 
.JJ 
ClearJJ 
(JJ 
)JJ 
;JJ  
timeLineMomentLookupKK 
.KK 
ClearKK 
(KK 
)KK 
;KK  
}LL 
publicOO 
voidOO	 
AddOO 
(OO 
ITimePeriodOO 
periodOO $
)OO$ %
{PP 
ifQQ 
(QQ 
periodQQ 
==QQ 
nullQQ 
)QQ 
{RR 
throwSS 	
newSS
 
ArgumentNullExceptionSS #
(SS# $
$strSS$ ,
)SS, -
;SS- .
}TT 
AddStartUU 
(UU 
periodUU 
.UU 
StartUU 
)UU 
;UU 
AddEndVV 	
(VV	 

periodVV
 
.VV 
EndVV 
)VV 
;VV 
SortWW 
(WW 
)WW 	
;WW	 

}XX 
public[[ 
void[[	 
AddAll[[ 
([[ 
IEnumerable[[  
<[[  !
ITimePeriod[[! ,
>[[, -
periods[[. 5
)[[5 6
{\\ 
if]] 
(]] 
periods]] 
==]] 
null]] 
)]] 
{^^ 
throw__ 	
new__
 
ArgumentNullException__ #
(__# $
$str__$ -
)__- .
;__. /
}`` 
foreachbb 

(bb 
ITimePeriodbb 
periodbb 
inbb !
periodsbb" )
)bb) *
{cc 
AddStartdd 
(dd 
perioddd
.dd 
Startdd 
)dd 
;dd 
AddEndee 

(ee
 
periodee 
.ee 
Endee 
)ee 
;ee 
}ff 
Sortgg 
(gg 
)gg 	
;gg	 

}hh 
publickk 
voidkk	 
Removekk 
(kk 
ITimePeriodkk  
periodkk! '
)kk' (
{ll 
ifmm 
(mm 
periodmm 
==mm 
nullmm 
)mm 
{nn 
throwoo 	
newoo
 
ArgumentNullExceptionoo #
(oo# $
$stroo$ ,
)oo, -
;oo- .
}pp 
RemoveStartrr 
(rr 
periodrr 
.rr 
Startrr 
)rr 
;rr 
	RemoveEndss 
(ss 
periodss
.ss 
Endss 
)ss 
;ss 
Sorttt 
(tt 
)tt 	
;tt	 

}uu 
publicxx 
ITimeLineMomentxx	 
Findxx 
(xx 
DateTimexx &
momentxx' -
)xx- .
{yy 
ITimeLineMomentzz 
timeLineMomentzz !
=zz" #
nullzz$ (
;zz( )
if{{ 
({{ 
Count{{ 
>{{
$num{{ 
){{ 
{||  
timeLineMomentLookup}} 
.}} 
TryGetValue}} $
(}}$ %
moment}}% +
,}}+ ,
out}}- 0
timeLineMoment}}1 ?
)}}? @
;}}@ A
}~~ 
return 	
timeLineMoment
 
; 
}
�� 
public
�� 
bool
��	 
Contains
�� 
(
�� 
DateTime
�� 
moment
��  &
)
��& '
{
�� 
return
�� 	"
timeLineMomentLookup
��
 
.
�� 
ContainsKey
�� *
(
��* +
moment
��+ 1
)
��1 2
;
��2 3
}
�� 
public
�� 
bool
��	 
HasOverlaps
�� 
(
�� 
)
�� 
{
�� 
bool
�� 
hasOverlaps
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
Count
�� 
>
��
$num
�� 
)
�� 
{
�� 
bool
�� 
start
��	 
=
�� 
true
�� 
;
�� 
foreach
�� 
(
�� 
ITimeLineMoment
��
timeLineMoment
�� +
in
��, .
timeLineMoments
��/ >
)
��> ?
{
�� 
int
�� 

startCount
��	 
=
�� 
timeLineMoment
�� $
.
��$ %

StartCount
��% /
;
��/ 0
int
�� 
endCount
��	 
=
�� 
timeLineMoment
�� "
.
��" #
EndCount
��# +
;
��+ ,
if
�� 
(
�� 	
start
��	 
)
�� 
{
�� 
if
�� 
(
��	 


startCount
��
 
!=
�� 
$num
�� 
||
�� 
endCount
�� %
>
��& '
$num
��( )
)
��) *
{
�� 
hasOverlaps
�� 
=
�� 
true
�� 
;
�� 
break
�� 
;
�� 
}
�� 
}
�� 
else
�� 	
{
�� 
if
�� 
(
��	 


startCount
��
 
>
�� 
$num
�� 
||
�� 
endCount
�� $
!=
��% '
$num
��( )
)
��) *
{
�� 
hasOverlaps
�� 
=
�� 
true
�� 
;
�� 
break
�� 
;
�� 
}
�� 
}
�� 
start
�� 

=
�� 
endCount
��
-
�� 

startCount
�� "
>
��# $
$num
��% &
;
��& '
}
�� 
}
�� 
return
�� 	
hasOverlaps
��
 
;
�� 
}
�� 
public
�� 
bool
��	 
HasGaps
�� 
(
�� 
)
�� 
{
�� 
bool
�� 
hasGaps
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
Count
�� 
>
��
$num
�� 
)
�� 
{
�� 
int
�� 
momentCount
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 	
int
��	 
index
��
=
�� 
$num
�� 
;
�� 
index
�� 
<
�� 
timeLineMoments
��  /
.
��/ 0
Count
��0 5
;
��5 6
index
��7 <
++
��< >
)
��> ?
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� #
=
��$ %
timeLineMoments
��& 5
[
��5 6
index
��6 ;
]
��; <
;
��< =
momentCount
�� 
+=
�� 
timeLineMoment
�� "
.
��" #

StartCount
��# -
;
��- .
momentCount
�� 
-=
�� 
timeLineMoment
�� "
.
��" #
EndCount
��# +
;
��+ ,
if
�� 
(
�� 	
momentCount
��	 
==
�� 
$num
�� 
&&
�� 
index
�� "
>
��# $
$num
��% &
&&
��' )
index
��* /
<
��0 1
timeLineMoments
��2 A
.
��A B
Count
��B G
-
��H I
$num
��J K
)
��K L
{
�� 
hasGaps
�� 
=
�� 
true
�� 
;
�� 
break
�� 
;
�� 
}
�� 
}
�� 
}
�� 
return
�� 	
hasGaps
��
 
;
�� 
}
�� 
public
�� 
IEnumerator
��	 
<
�� 
ITimeLineMoment
�� $
>
��$ %

��& 3
(
��3 4
)
��4 5
{
�� 
return
�� 	
timeLineMoments
��
 
.
�� 

�� '
(
��' (
)
��( )
;
��) *
}
�� 
IEnumerator
�� 
IEnumerable
�� 
.
�� 

�� '
(
��' (
)
��( )
{
�� 
return
�� 	

��
 
(
�� 
)
�� 
;
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
AddStart
�� !
(
��! "
DateTime
��" *
moment
��+ 1
)
��1 2
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��) /
)
��/ 0
;
��0 1
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
�� 
{
�� 
timeLineMoment
�� 
=
�� 
new
�� 
TimeLineMoment
�� '
(
��' (
moment
��( .
)
��. /
;
��/ 0
timeLineMoments
�� 
.
�� 
Add
�� 
(
�� 
timeLineMoment
�� &
)
��& '
;
��' ("
timeLineMomentLookup
�� 
.
�� 
Add
�� 
(
�� 
moment
�� #
,
��# $
timeLineMoment
��% 3
)
��3 4
;
��4 5
}
�� 
timeLineMoment
�� 
.
�� 
AddStart
�� 
(
�� 
)
�� 
;
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
AddEnd
�� 
(
��  
DateTime
��  (
moment
��) /
)
��/ 0
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��) /
)
��/ 0
;
��0 1
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
�� 
{
�� 
timeLineMoment
�� 
=
�� 
new
�� 
TimeLineMoment
�� '
(
��' (
moment
��( .
)
��. /
;
��/ 0
timeLineMoments
�� 
.
�� 
Add
�� 
(
�� 
timeLineMoment
�� &
)
��& '
;
��' ("
timeLineMomentLookup
�� 
.
�� 
Add
�� 
(
�� 
moment
�� #
,
��# $
timeLineMoment
��% 3
)
��3 4
;
��4 5
}
�� 
timeLineMoment
�� 
.
�� 
AddEnd
�� 
(
�� 
)
�� 
;
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
RemoveStart
�� $
(
��$ %
DateTime
��% -
moment
��. 4
)
��4 5
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��) /
)
��/ 0
;
��0 1
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 	
new
��
 
InvalidOperationException
�� '
(
��' (
)
��( )
;
��) *
}
�� 
timeLineMoment
�� 
.
�� 
RemoveStart
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
timeLineMoment
�� 
.
�� 
IsEmpty
�� 
)
�� 
{
�� 
timeLineMoments
�� 
.
�� 
Remove
�� 
(
�� 
timeLineMoment
�� )
)
��) *
;
��* +"
timeLineMomentLookup
�� 
.
�� 
Remove
�� 
(
��  
moment
��  &
)
��& '
;
��' (
}
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
	RemoveEnd
�� "
(
��" #
DateTime
��# +
moment
��, 2
)
��2 3
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��) /
)
��/ 0
;
��0 1
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 	
new
��
 
InvalidOperationException
�� '
(
��' (
)
��( )
;
��) *
}
�� 
timeLineMoment
�� 
.
�� 
	RemoveEnd
�� 
(
�� 
)
�� 
;
�� 
if
�� 
(
�� 
timeLineMoment
�� 
.
�� 
IsEmpty
�� 
)
�� 
{
�� 
timeLineMoments
�� 
.
�� 
Remove
�� 
(
�� 
timeLineMoment
�� )
)
��) *
;
��* +"
timeLineMomentLookup
�� 
.
�� 
Remove
�� 
(
��  
moment
��  &
)
��& '
;
��' (
}
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
Sort
�� 
(
�� 
)
�� 
{
�� 
timeLineMoments
�� 
.
�� 
Sort
�� 
(
�� 
(
�� 
left
�� 
,
�� 
right
�� $
)
��$ %
=>
��& (
left
��) -
.
��- .
Moment
��. 4
.
��4 5
	CompareTo
��5 >
(
��> ?
right
��? D
.
��D E
Moment
��E K
)
��K L
)
��L M
;
��M N
}
�� 
private
�� 	
readonly
��
 
List
�� 
<
�� 
ITimeLineMoment
�� '
>
��' (
timeLineMoments
��) 8
=
��9 :
new
��; >
List
��? C
<
��C D
ITimeLineMoment
��D S
>
��S T
(
��T U
)
��U V
;
��V W
private
�� 	
readonly
��
 

Dictionary
�� 
<
�� 
DateTime
�� &
,
��& '
ITimeLineMoment
��( 7
>
��7 8"
timeLineMomentLookup
��9 M
=
��N O
new
��P S

Dictionary
��T ^
<
��^ _
DateTime
��_ g
,
��g h
ITimeLineMoment
��i x
>
��x y
(
��y z
)
��z {
;
��{ |
}
�� 
}�� �|
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeLineMomentCollection.Desktop.cs
	namespace
Itenso
 
.

TimePeriod
{ 
public 

class $
TimeLineMomentCollection )
:* +%
ITimeLineMomentCollection, E
{ 
public $
TimeLineMomentCollection	 !
(! "
)" #
{ 
} 
public $
TimeLineMomentCollection	 !
(! "
IEnumerable# .
<. /
ITimePeriod/ :
>: ;
periods< C
)D E
{ 
AddAll 	
(	 

periods 
) 
; 
} 
public   
int  	 
Count  
{!! 
get"" 
{"" 
return""	 
timeLineMoments"" 
.""  
Count""  %
;""% &
}""' (
}## 
public&& 
bool&&	 
IsEmpty&& 
{'' 
get(( 
{(( 
return((	 
Count(( 
==(( 
$num(( 
;(( 
}(( 
})) 
public,, 
ITimeLineMoment,,	 
Min,, 
{-- 
get.. 
{.. 
return..	 
!.. 
IsEmpty.. 
?.. 
this.. 
[..  
$num..! "
]..# $
:..% &
null..' +
;..+ ,
}..- .
}// 
public22 
ITimeLineMoment22	 
Max22 
{33 
get44 
{44 
return44	 
!44 
IsEmpty44 
?44 
this44 
[44  
Count44! &
-44' (
$num44) *
]44+ ,
:44- .
null44/ 3
;443 4
}445 6
}55 
public88 
ITimeLineMoment88	 
this88 
[88 
int88 "
index88# (
]88) *
{99 
get:: 
{:: 
return::	 
timeLineMoments:: 
.::  
Values::  &
[::& '
index::( -
]::. /
;::/ 0
}::1 2
};; 
public>> 
ITimeLineMoment>>	 
this>> 
[>> 
DateTime>> '
moment>>( .
]>>/ 0
{?? 
get@@ 
{@@ 
return@@	 
timeLineMoments@@ 
[@@  
moment@@! '
]@@( )
;@@) *
}@@+ ,
}AA 
	protectedDD 
IListDD 
<DD 
ITimeLineMomentDD !
>DD! "
MomentsDD# *
{EE 
getFF 
{FF 
returnFF	 
timeLineMomentsFF 
.FF  
ValuesFF  &
;FF& '
}FF( )
}GG 
publicJJ 
voidJJ	 
ClearJJ 
(JJ 
)JJ 
{KK 
timeLineMomentsLL 
.LL 
ClearLL 
(LL 
)LL 
;LL 
}MM 
publicPP 
voidPP	 
AddPP 
(PP 
ITimePeriodPP 
periodPP %
)PP& '
{QQ 
ifRR 
(RR 
periodRR 
==RR 
nullRR 
)RR 
{SS 
throwTT 	
newTT
 
ArgumentNullExceptionTT #
(TT# $
$strTT% -
)TT. /
;TT/ 0
}UU 
AddStartVV 
(VV 
periodVV
.VV 
StartVV 
,VV 
periodVV !
)VV" #
;VV# $
AddEndWW 	
(WW	 

periodWW 
.WW 
EndWW 
,WW 
periodWW 
)WW 
;WW  
}XX 
public[[ 
void[[	 
AddAll[[ 
([[ 
IEnumerable[[ !
<[[! "
ITimePeriod[[" -
>[[- .
periods[[/ 6
)[[7 8
{\\ 
if]] 
(]] 
periods]] 
==]] 
null]] 
)]] 
{^^ 
throw__ 	
new__
 
ArgumentNullException__ #
(__# $
$str__% .
)__/ 0
;__0 1
}`` 
foreachbb 

(bb 
ITimePeriodbb
periodbb 
inbb  "
periodsbb# *
)bb+ ,
{cc 
AddStartdd 
(dd 
perioddd 
.dd 
Startdd 
,dd 
perioddd "
)dd# $
;dd$ %
AddEndee 

(ee
 
periodee 
.ee 
Endee 
,ee 
periodee 
)ee  
;ee  !
}ff 
}gg 
publicjj 
voidjj	 
Removejj 
(jj 
ITimePeriodjj !
periodjj" (
)jj) *
{kk 
ifll 
(ll 
periodll 
==ll 
nullll 
)ll 
{mm 
thrownn 	
newnn
 
ArgumentNullExceptionnn #
(nn# $
$strnn% -
)nn. /
;nn/ 0
}oo 
RemoveStartqq 
(qq 
periodqq 
.qq 
Startqq 
,qq 
periodqq $
)qq% &
;qq& '
	RemoveEndrr 
(rr 
periodrr 
.rr 
Endrr 
,rr 
periodrr  
)rr! "
;rr" #
}ss 
publicvv 
ITimeLineMomentvv	 
Findvv 
(vv 
DateTimevv '
momentvv( .
)vv/ 0
{ww 
ITimeLineMomentxx 
timeLineMomentxx !
;xx! "
timeLineMomentsyy 
.yy 
TryGetValueyy 
(yy 
momentyy  &
,yy& '
outyy( +
timeLineMomentyy, :
)yy; <
;yy< =
returnzz 	
timeLineMomentzz
 
;zz 
}{{ 
public~~ 
bool~~	 
Contains~~ 
(~~ 
DateTime~~  
moment~~! '
)~~( )
{ 
return
�� 	
Find
��
 
(
�� 
moment
�� 
)
�� 
!=
�� 
null
��  
;
��  !
}
�� 
public
�� 
bool
��	 
HasOverlaps
�� 
(
�� 
)
�� 
{
�� 
bool
�� 

hasOverlap
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
Count
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
bool
�� 
start
��	 
=
�� 
true
�� 
;
�� 
foreach
�� 
(
�� 
ITimeLineMoment
�� 
timeLineMoment
�� ,
in
��- /
timeLineMoments
��0 ?
.
��? @
Values
��@ F
)
��G H
{
�� 
if
�� 
(
�� 	
start
��
 
)
�� 
{
�� 
if
�� 
(
��	 

timeLineMoment
�� 
.
�� 

StartCount
�� $
!=
��% '
$num
��( )
||
��* ,
timeLineMoment
��- ;
.
��; <
EndCount
��< D
>
��E F
$num
��G H
)
��I J
{
�� 

hasOverlap
�� 
=
�� 
true
�� 
;
�� 
break
�� 
;
�� 
}
�� 
}
�� 
else
�� 	
{
�� 
if
�� 
(
��	 

timeLineMoment
�� 
.
�� 

StartCount
�� $
>
��% &
$num
��' (
||
��) +
timeLineMoment
��, :
.
��: ;
EndCount
��; C
!=
��D F
$num
��G H
)
��I J
{
�� 

hasOverlap
�� 
=
�� 
true
�� 
;
�� 
break
�� 
;
�� 
}
�� 
}
�� 
start
�� 

=
�� 
(
��
timeLineMoment
�� 
.
�� 
EndCount
�� &
-
��' (
timeLineMoment
��) 7
.
��7 8

StartCount
��8 B
)
��C D
>
��E F
$num
��G H
;
��H I
}
�� 
}
�� 
return
�� 	

hasOverlap
��
 
;
�� 
}
�� 
public
�� 
bool
��	 
HasGaps
�� 
(
�� 
)
�� 
{
�� 
bool
�� 
hasGaps
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
Count
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
int
�� 
momentCount
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 	
int
��
 
index
�� 
=
�� 
$num
�� 
;
�� 
index
�� 
<
��  
timeLineMoments
��! 0
.
��0 1
Count
��1 6
;
��6 7
index
��8 =
++
��= ?
)
��@ A
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� #
=
��$ %
this
��& *
[
��* +
index
��, 1
]
��2 3
;
��3 4
momentCount
�� 
+=
�� 
timeLineMoment
�� "
.
��" #

StartCount
��# -
;
��- .
momentCount
�� 
-=
�� 
timeLineMoment
�� "
.
��" #
EndCount
��# +
;
��+ ,
if
�� 
(
�� 	
momentCount
��
 
==
�� 
$num
�� 
&&
�� 
index
�� #
>
��$ %
$num
��& '
&&
��( *
index
��+ 0
<
��1 2
timeLineMoments
��3 B
.
��B C
Count
��C H
-
��I J
$num
��K L
)
��M N
{
�� 
hasGaps
�� 
=
�� 
true
�� 
;
�� 
break
�� 
;
�� 
}
�� 
}
�� 
}
�� 
return
�� 	
hasGaps
��
 
;
�� 
}
�� 
public
�� 
IEnumerator
��	 
<
�� 
ITimeLineMoment
�� $
>
��$ %

��& 3
(
��3 4
)
��4 5
{
�� 
return
�� 	
timeLineMoments
��
 
.
�� 
Values
��  
.
��  !

��! .
(
��. /
)
��/ 0
;
��0 1
}
�� 
IEnumerator
�� 
IEnumerable
�� 
.
�� 

�� '
(
��' (
)
��( )
{
�� 
return
�� 	

��
 
(
�� 
)
�� 
;
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
AddStart
�� !
(
��! "
DateTime
��# +
moment
��, 2
,
��2 3
ITimePeriod
��4 ?
period
��@ F
)
��G H
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��* 0
)
��1 2
;
��2 3
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
��  
{
�� 
timeLineMoment
�� 
=
�� 
new
�� 
TimeLineMoment
�� '
(
��' (
moment
��) /
)
��0 1
;
��1 2
timeLineMoments
�� 
.
�� 
Add
�� 
(
�� 
moment
�� 
,
��  
timeLineMoment
��! /
)
��0 1
;
��1 2
}
�� 
timeLineMoment
�� 
.
�� 
AddStart
�� 
(
�� 
)
�� 
;
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
AddEnd
�� 
(
��  
DateTime
��! )
moment
��* 0
,
��0 1
ITimePeriod
��2 =
period
��> D
)
��E F
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��* 0
)
��1 2
;
��2 3
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
��  
{
�� 
timeLineMoment
�� 
=
�� 
new
�� 
TimeLineMoment
�� '
(
��' (
moment
��) /
)
��0 1
;
��1 2
timeLineMoments
�� 
.
�� 
Add
�� 
(
�� 
moment
�� 
,
��  
timeLineMoment
��! /
)
��0 1
;
��1 2
}
�� 
timeLineMoment
�� 
.
�� 
AddEnd
�� 
(
�� 
)
�� 
;
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
RemoveStart
�� $
(
��$ %
DateTime
��& .
moment
��/ 5
,
��5 6
ITimePeriod
��7 B
period
��C I
)
��J K
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��* 0
)
��1 2
;
��2 3
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 	
new
��
 
InvalidOperationException
�� '
(
��' (
)
��( )
;
��) *
}
�� 
timeLineMoment
�� 
.
�� 
RemoveStart
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
timeLineMoment
�� 
.
�� 
IsEmpty
�� 
)
�� 
{
�� 
timeLineMoments
�� 
.
�� 
Remove
�� 
(
�� 
moment
�� "
)
��# $
;
��$ %
}
�� 
}
�� 
	protected
�� 
virtual
�� 
void
�� 
	RemoveEnd
�� "
(
��" #
DateTime
��$ ,
moment
��- 3
,
��3 4
ITimePeriod
��5 @
period
��A G
)
��H I
{
�� 
ITimeLineMoment
�� 
timeLineMoment
�� !
=
��" #
Find
��$ (
(
��( )
moment
��* 0
)
��1 2
;
��2 3
if
�� 
(
�� 
timeLineMoment
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 	
new
��
 
InvalidOperationException
�� '
(
��' (
)
��( )
;
��) *
}
�� 
timeLineMoment
�� 
.
�� 
	RemoveEnd
�� 
(
�� 
)
�� 
;
�� 
if
�� 
(
�� 
timeLineMoment
�� 
.
�� 
IsEmpty
�� 
)
��  
{
�� 
timeLineMoments
�� 
.
�� 
Remove
�� 
(
�� 
moment
�� "
)
��# $
;
��$ %
}
�� 
}
�� 
private
�� 	
readonly
��
 

SortedList
�� 
<
�� 
DateTime
�� &
,
��& '
ITimeLineMoment
��( 7
>
��7 8
timeLineMoments
��9 H
=
��I J
new
��K N

SortedList
��O Y
<
��Y Z
DateTime
��Z b
,
��b c
ITimeLineMoment
��d s
>
��s t
(
��t u
)
��u v
;
��v w
}
�� 
}�� �/
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeLinePeriodEvaluator.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class #
TimeLinePeriodEvaluator 1
{ 
	protected #
TimeLinePeriodEvaluator )
() * 
ITimePeriodContainer* >
periods? F
,F G
ITimePeriodMapperH Y
periodMapperZ f
=g h
nulli m
)m n
{ 	
if 
( 
periods 
== 
null 
)  
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 9
)9 :
;: ;
} 
this 
. 
periods 
= 
periods "
;" #
this 
. 
periodMapper 
= 
periodMapper  ,
;, -
} 	
public  
ITimePeriodContainer #
Periods$ +
{ 	
get   
{   
return   
periods    
;    !
}  " #
}!! 	
public$$ 
ITimePeriodMapper$$  
PeriodMapper$$! -
{%% 	
get&& 
{&& 
return&& 
periodMapper&& %
;&&% &
}&&' (
}'' 	
	protected** 
virtual** 
bool** 
IgnoreEmptyPeriods** 1
{++ 	
get,, 
{,, 
return,, 
false,, 
;,, 
},,  !
}-- 	
	protected00 
virtual00 
void00 
StartEvaluation00 .
(00. /
)00/ 0
{11 	
if22 
(22 
periods22 
.22 
Count22 
>22 
$num22  !
)22! "
{33 
TimeLineMomentCollection44 (
timeLineMoments44) 8
=449 :
new44; >$
TimeLineMomentCollection44? W
(44W X
)44X Y
;44Y Z
timeLineMoments55 
.55  
AddAll55  &
(55& '
periods55' .
)55. /
;55/ 0
if66 
(66 
timeLineMoments66 #
.66# $
Count66$ )
>66* +
$num66, -
)66- .
{77 
int88 
periodCount88 #
=88$ %
$num88& '
;88' (
for99 
(99 
int99 
i99 
=99  
$num99! "
;99" #
i99$ %
<99& '
timeLineMoments99( 7
.997 8
Count998 =
-99> ?
$num99@ A
;99A B
i99C D
++99D F
)99F G
{:: 
ITimeLineMoment;; '
start;;( -
=;;. /
timeLineMoments;;0 ?
[;;? @
i;;@ A
];;A B
;;;B C
ITimeLineMoment<< '
end<<( +
=<<, -
timeLineMoments<<. =
[<<= >
i<<> ?
+<<@ A
$num<<B C
]<<C D
;<<D E
if>> 
(>> 
i>> 
==>>  
$num>>! "
)>>" #
{?? 
periodCount@@ '
+=@@( *
start@@+ 0
.@@0 1

StartCount@@1 ;
;@@; <
periodCountAA '
-=AA( *
startAA+ 0
.AA0 1
EndCountAA1 9
;AA9 :
}BB 
ITimePeriodDD #
periodDD$ *
=DD+ ,
newDD- 0
	TimeRangeDD1 :
(DD: ;
MapPeriodStartDD; I
(DDI J
startDDJ O
.DDO P
MomentDDP V
)DDV W
,DDW X
MapPeriodEndDDY e
(DDe f
endDDf i
.DDi j
MomentDDj p
)DDp q
)DDq r
;DDr s
ifEE 
(EE 
!EE 
(EE 
IgnoreEmptyPeriodsEE 0
&&EE1 3
periodEE4 :
.EE: ;
IsMomentEE; C
)EEC D
)EED E
{FF 
ifGG 
(GG  
EvaluatePeriodGG  .
(GG. /
periodGG/ 5
,GG5 6
periodCountGG7 B
)GGB C
==GGD F
falseGGG L
)GGL M
{HH 
breakII  %
;II% &
}JJ 
}KK 
periodCountMM #
+=MM$ &
endMM' *
.MM* +

StartCountMM+ 5
;MM5 6
periodCountNN #
-=NN$ &
endNN' *
.NN* +
EndCountNN+ 3
;NN3 4
}OO 
}PP 
}QQ 
}RR 	
	protectedUU 
abstractUU 
boolUU 
EvaluatePeriodUU  .
(UU. /
ITimePeriodUU/ :
periodUU; A
,UUA B
intUUC F
periodCountUUG R
)UUR S
;UUS T
privateXX 
DateTimeXX 
MapPeriodStartXX '
(XX' (
DateTimeXX( 0
startXX1 6
)XX6 7
{YY 	
returnZZ 
periodMapperZZ 
!=ZZ  "
nullZZ# '
?ZZ( )
periodMapperZZ* 6
.ZZ6 7

UnmapStartZZ7 A
(ZZA B
startZZB G
)ZZG H
:ZZI J
startZZK P
;ZZP Q
}[[ 	
private^^ 
DateTime^^ 
MapPeriodEnd^^ %
(^^% &
DateTime^^& .
end^^/ 2
)^^2 3
{__ 	
return`` 
periodMapper`` 
!=``  "
null``# '
?``( )
periodMapper``* 6
.``6 7
UnmapEnd``7 ?
(``? @
end``@ C
)``C D
:``E F
end``G J
;``J K
}aa 	
privateee 
readonlyee  
ITimePeriodContaineree -
periodsee. 5
;ee5 6
privateff 
readonlyff 
ITimePeriodMapperff *
periodMapperff+ 7
;ff7 8
}hh 
}jj �=
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodCalc.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
internal 
static
class 
TimePeriodCalc (
{ 
public 
static 
bool 
	HasInside $
($ %
ITimePeriod% 0
period1 7
,7 8
DateTime9 A
testB F
)F G
{ 	
return 
test 
>= 
period !
.! "
Start" '
&&( *
test+ /
<=0 2
period3 9
.9 :
End: =
;= >
} 	
public 
static 
bool 
	HasInside $
($ %
ITimePeriod% 0
period1 7
,7 8
ITimePeriod9 D
testE I
)I J
{ 	
return 
	HasInside 
( 
period #
,# $
test% )
.) *
Start* /
)/ 0
&&1 3
	HasInside4 =
(= >
period> D
,D E
testF J
.J K
EndK N
)N O
;O P
} 	
public 
static 
bool 
IntersectsWith )
() *
ITimePeriod* 5
period6 <
,< =
ITimePeriod> I
testJ N
)N O
{ 	
return   
	HasInside!! 
(!! 
period!!  
,!!  !
test!!" &
.!!& '
Start!!' ,
)!!, -
||!!. 0
	HasInside"" 
("" 
period""  
,""  !
test""" &
.""& '
End""' *
)""* +
||"", .
test## 
.## 
Start## 
<## 
period## #
.### $
Start##$ )
&&##* ,
test##- 1
.##1 2
End##2 5
>##6 7
period##8 >
.##> ?
End##? B
;##B C
}$$ 	
public'' 
static'' 
bool'' 
OverlapsWith'' '
(''' (
ITimePeriod''( 3
period''4 :
,'': ;
ITimePeriod''< G
test''H L
)''L M
{(( 	
PeriodRelation)) 
relation)) #
=))$ %
GetRelation))& 1
())1 2
period))2 8
,))8 9
test)): >
)))> ?
;))? @
return** 
relation++ 
!=++ 
PeriodRelation++ *
.++* +
After+++ 0
&&++1 3
relation,, 
!=,, 
PeriodRelation,, *
.,,* +

&&,,9 ;
relation-- 
!=-- 
PeriodRelation-- *
.--* +
EndTouching--+ 6
&&--7 9
relation.. 
!=.. 
PeriodRelation.. *
...* +
Before..+ 1
;..1 2
}// 	
public22 
static22 
PeriodRelation22 $
GetRelation22% 0
(220 1
ITimePeriod221 <
period22= C
,22C D
ITimePeriod22E P
test22Q U
)22U V
{33 	
if44 
(44 
test44 
.44 
End44 
<44 
period44 !
.44! "
Start44" '
)44' (
{55 
return66 
PeriodRelation66 %
.66% &
After66& +
;66+ ,
}77 
if88 
(88 
test88 
.88 
Start88 
>88 
period88 #
.88# $
End88$ '
)88' (
{99 
return:: 
PeriodRelation:: %
.::% &
Before::& ,
;::, -
};; 
if<< 
(<< 
test<< 
.<< 
Start<< 
==<< 
period<< $
.<<$ %
Start<<% *
&&<<+ -
test<<. 2
.<<2 3
End<<3 6
==<<7 9
period<<: @
.<<@ A
End<<A D
)<<D E
{== 
return>> 
PeriodRelation>> %
.>>% &

ExactMatch>>& 0
;>>0 1
}?? 
if@@ 
(@@ 
test@@ 
.@@ 
End@@ 
==@@ 
period@@ "
.@@" #
Start@@# (
)@@( )
{AA 
returnBB 
PeriodRelationBB %
.BB% &

;BB3 4
}CC 
ifDD 
(DD 
testDD 
.DD 
StartDD 
==DD 
periodDD $
.DD$ %
EndDD% (
)DD( )
{EE 
returnFF 
PeriodRelationFF %
.FF% &
EndTouchingFF& 1
;FF1 2
}GG 
ifHH 
(HH 
	HasInsideHH 
(HH 
periodHH  
,HH  !
testHH" &
)HH& '
)HH' (
{II 
ifJJ 
(JJ 
testJJ 
.JJ 
StartJJ 
==JJ !
periodJJ" (
.JJ( )
StartJJ) .
)JJ. /
{KK 
returnLL 
PeriodRelationLL )
.LL) *"
EnclosingStartTouchingLL* @
;LL@ A
}MM 
returnNN 
testNN 
.NN 
EndNN 
==NN  "
periodNN# )
.NN) *
EndNN* -
?NN. /
PeriodRelationNN0 >
.NN> ? 
EnclosingEndTouchingNN? S
:NNT U
PeriodRelationNNV d
.NNd e
	EnclosingNNe n
;NNn o
}OO 
boolPP !
periodContainsMyStartPP &
=PP' (
	HasInsidePP) 2
(PP2 3
testPP3 7
,PP7 8
periodPP9 ?
.PP? @
StartPP@ E
)PPE F
;PPF G
boolQQ 
periodContainsMyEndQQ $
=QQ% &
	HasInsideQQ' 0
(QQ0 1
testQQ1 5
,QQ5 6
periodQQ7 =
.QQ= >
EndQQ> A
)QQA B
;QQB C
ifRR 
(RR !
periodContainsMyStartRR %
&&RR& (
periodContainsMyEndRR) <
)RR< =
{SS 
ifTT 
(TT 
testTT 
.TT 
StartTT 
==TT !
periodTT" (
.TT( )
StartTT) .
)TT. /
{UU 
returnVV 
PeriodRelationVV )
.VV) *
InsideStartTouchingVV* =
;VV= >
}WW 
returnXX 
testXX 
.XX 
EndXX 
==XX  "
periodXX# )
.XX) *
EndXX* -
?XX. /
PeriodRelationXX0 >
.XX> ?
InsideEndTouchingXX? P
:XXQ R
PeriodRelationXXS a
.XXa b
InsideXXb h
;XXh i
}YY 
ifZZ 
(ZZ !
periodContainsMyStartZZ %
)ZZ% &
{[[ 
return\\ 
PeriodRelation\\ %
.\\% &
StartInside\\& 1
;\\1 2
}]] 
if^^ 
(^^ 
periodContainsMyEnd^^ #
)^^# $
{__ 
return`` 
PeriodRelation`` %
.``% &
	EndInside``& /
;``/ 0
}aa 
throwbb 
newbb %
InvalidOperationExceptionbb /
(bb/ 0
$strbb0 N
+bbO P
periodbbQ W
+bbX Y
$strbbZ c
+bbd e
testbbf j
+bbk l
$strbbm p
)bbp q
;bbq r
}cc 	
}ee 
}gg ��
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodChain.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

class 
TimePeriodChain  
:! "
ITimePeriodChain# 3
{ 
public 
TimePeriodChain 
( 
)  
{ 	
} 	
public 
TimePeriodChain 
( 
IEnumerable *
<* +
ITimePeriod+ 6
>6 7
timePeriods8 C
)C D
{ 	
if 
( 
timePeriods 
== 
null #
)# $
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 =
)= >
;> ?
} 
AddAll 
( 
timePeriods 
) 
;  
} 	
public"" 
bool"" 

IsReadOnly"" 
{## 	
get$$ 
{$$ 
return$$ 
false$$ 
;$$ 
}$$  !
}%% 	
public(( 
ITimePeriod(( 
First((  
{)) 	
get** 
{** 
return** 
periods**  
.**  !
Count**! &
>**' (
$num**) *
?**+ ,
periods**- 4
[**4 5
$num**5 6
]**6 7
:**8 9
null**: >
;**> ?
}**@ A
}++ 	
public.. 
ITimePeriod.. 
Last.. 
{// 	
get00 
{00 
return00 
periods00  
.00  !
Count00! &
>00' (
$num00) *
?00+ ,
periods00- 4
[004 5
periods005 <
.00< =
Count00= B
-00C D
$num00E F
]00F G
:00H I
null00J N
;00N O
}00P Q
}11 	
public44 
int44 
Count44 
{55 	
get66 
{66 
return66 
periods66  
.66  !
Count66! &
;66& '
}66( )
}77 	
public:: 
ITimePeriod:: 
this:: 
[::  
int::  #
index::$ )
]::) *
{;; 	
get<< 
{<< 
return<< 
periods<<  
[<<  !
index<<! &
]<<& '
;<<' (
}<<) *
set== 
{>> 
RemoveAt?? 
(?? 
index?? 
)?? 
;??  
Insert@@ 
(@@ 
index@@ 
,@@ 
value@@ #
)@@# $
;@@$ %
}AA 
}BB 	
publicEE 
boolEE 
	IsAnytimeEE 
{FF 	
getGG 
{GG 
returnGG 
!GG 
HasStartGG "
&&GG# %
!GG& '
HasEndGG' -
;GG- .
}GG/ 0
}HH 	
publicKK 
boolKK 
IsMomentKK 
{LL 	
getMM 
{MM 
returnMM 
CountMM 
!=MM !
$numMM" #
&&MM$ &
FirstMM' ,
.MM, -
StartMM- 2
.MM2 3
EqualsMM3 9
(MM9 :
LastMM: >
.MM> ?
EndMM? B
)MMB C
;MMC D
}MME F
}NN 	
publicQQ 
boolQQ 
HasStartQQ 
{RR 	
getSS 
{SS 
returnSS 
StartSS 
!=SS !
TimeSpecSS" *
.SS* +

;SS8 9
}SS: ;
}TT 	
publicWW 
DateTimeWW 
StartWW 
{XX 	
getYY 
{YY 
returnYY 
CountYY 
>YY  
$numYY! "
?YY# $
FirstYY% *
.YY* +
StartYY+ 0
:YY1 2
TimeSpecYY3 ;
.YY; <

;YYI J
}YYK L
setZZ 
{[[ 
if\\ 
(\\ 
Count\\ 
==\\ 
$num\\ 
)\\ 
{]] 
return^^ 
;^^ 
}__ 
Move`` 
(`` 
value`` 
-`` 
Start`` "
)``" #
;``# $
}aa 
}bb 	
publicee 
boolee 
HasEndee 
{ff 	
getgg 
{gg 
returngg 
Endgg 
!=gg 
TimeSpecgg  (
.gg( )

;gg6 7
}gg8 9
}hh 	
publickk 
DateTimekk 
Endkk 
{ll 	
getmm 
{mm 
returnmm 
Countmm 
>mm  
$nummm! "
?mm# $
Lastmm% )
.mm) *
Endmm* -
:mm. /
TimeSpecmm0 8
.mm8 9

;mmF G
}mmH I
setnn 
{oo 
ifpp 
(pp 
Countpp 
==pp 
$numpp 
)pp 
{qq 
returnrr 
;rr 
}ss 
Movett 
(tt 
valuett 
-tt 
Endtt  
)tt  !
;tt! "
}uu 
}vv 	
publicyy 
TimeSpanyy 
Durationyy  
{zz 	
get{{ 
{{{ 
return{{ 
End{{ 
-{{ 
Start{{ $
;{{$ %
}{{& '
}|| 	
public 
string 
DurationDescription )
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
.
��& '
Instance
��' /
.
��/ 0
GetDuration
��0 ;
(
��; <
Duration
��< D
,
��D E 
DurationFormatType
��F X
.
��X Y
Detailed
��Y a
)
��a b
;
��b c
}
��d e
}
�� 	
public
�� 
virtual
�� 
TimeSpan
�� 
GetDuration
��  +
(
��+ ,
IDurationProvider
��, =
provider
��> F
)
��F G
{
�� 	
if
�� 
(
�� 
provider
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
provider
�� 
.
�� 
GetDuration
�� '
(
��' (
Start
��( -
,
��- .
End
��/ 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 
void
�� 
Setup
�� !
(
��! "
DateTime
��" *
newStart
��+ 3
,
��3 4
DateTime
��5 =
newEnd
��> D
)
��D E
{
�� 	
throw
�� 
new
�� '
InvalidOperationException
�� /
(
��/ 0
)
��0 1
;
��1 2
}
�� 	
IEnumerator
�� 
IEnumerable
�� 
.
��  

��  -
(
��- .
)
��. /
{
�� 	
return
�� 

��  
(
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
IEnumerator
�� 
<
�� 
ITimePeriod
�� &
>
��& '

��( 5
(
��5 6
)
��6 7
{
�� 	
return
�� 
periods
�� 
.
�� 

�� (
(
��( )
)
��) *
;
��* +
}
�� 	
public
�� 
virtual
�� 
void
�� 
Move
��  
(
��  !
TimeSpan
��! )
delta
��* /
)
��/ 0
{
�� 	
if
�� 
(
�� 
delta
�� 
==
�� 
TimeSpan
�� !
.
��! "
Zero
��" &
)
��& '
{
�� 
return
�� 
;
�� 
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  

timePeriod
��! +
in
��, .
periods
��/ 6
)
��6 7
{
�� 
DateTime
�� 
start
�� 
=
��  

timePeriod
��! +
.
��+ ,
Start
��, 1
+
��2 3
delta
��4 9
;
��9 :

timePeriod
�� 
.
�� 
Setup
��  
(
��  !
start
��! &
,
��& '
start
��( -
.
��- .
Add
��. 1
(
��1 2

timePeriod
��2 <
.
��< =
Duration
��= E
)
��E F
)
��F G
;
��G H
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
Add
�� 
(
��  
ITimePeriod
��  +
item
��, 0
)
��0 1
{
�� 	
if
�� 
(
�� 
item
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
CheckReadOnlyItem
�� 
(
�� 
item
�� "
)
��" #
;
��# $
ITimePeriod
�� 
last
�� 
=
�� 
Last
�� #
;
��# $
if
�� 
(
�� 
last
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
CheckSpaceAfter
�� 
(
��  
last
��  $
.
��$ %
End
��% (
,
��( )
item
��* .
.
��. /
Duration
��/ 7
)
��7 8
;
��8 9
item
�� 
.
�� 
Setup
�� 
(
�� 
last
�� 
.
��  
End
��  #
,
��# $
last
��% )
.
��) *
End
��* -
.
��- .
Add
��. 1
(
��1 2
item
��2 6
.
��6 7
Duration
��7 ?
)
��? @
)
��@ A
;
��A B
}
�� 
periods
�� 
.
�� 
Add
�� 
(
�� 
item
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
ContainsPeriod
�� "
(
��" #
ITimePeriod
��# .
test
��/ 3
)
��3 4
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
period
�� 
.
�� 
IsSamePeriod
�� '
(
��' (
test
��( ,
)
��, -
)
��- .
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
AddAll
�� 
(
�� 
IEnumerable
�� &
<
��& '
ITimePeriod
��' 2
>
��2 3
timePeriods
��4 ?
)
��? @
{
�� 	
if
�� 
(
�� 
timePeriods
�� 
==
�� 
null
�� #
)
��# $
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 =
)
��= >
;
��> ?
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
timePeriods
��+ 6
)
��6 7
{
�� 
Add
�� 
(
�� 
period
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
Insert
�� "
(
��" #
int
��# &
index
��' ,
,
��, -
ITimePeriod
��. 9
period
��: @
)
��@ A
{
�� 	
if
�� 
(
�� 
index
�� 
<
�� 
$num
�� 
||
�� 
index
�� "
>
��# $
Count
��% *
)
��* +
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 =
)
��= >
;
��> ?
}
�� 
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
CheckReadOnlyItem
�� 
(
�� 
period
�� $
)
��$ %
;
��% &
TimeSpan
�� 
itemDuration
�� !
=
��" #
period
��$ *
.
��* +
Duration
��+ 3
;
��3 4
ITimePeriod
�� 
previous
��  
=
��! "
null
��# '
;
��' (
ITimePeriod
�� 
next
�� 
=
�� 
null
�� #
;
��# $
if
�� 
(
�� 
Count
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
index
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
previous
�� 
=
�� 
this
�� #
[
��# $
index
��$ )
-
��* +
$num
��, -
]
��- .
;
��. /
CheckSpaceAfter
�� #
(
��# $
End
��$ '
,
��' (
itemDuration
��) 5
)
��5 6
;
��6 7
}
�� 
if
�� 
(
�� 
index
�� 
<
�� 
Count
�� !
-
��" #
$num
��$ %
)
��% &
{
�� 
next
�� 
=
�� 
this
�� 
[
��  
index
��  %
]
��% &
;
��& '
CheckSpaceBefore
�� $
(
��$ %
Start
��% *
,
��* +
itemDuration
��, 8
)
��8 9
;
��9 :
}
�� 
}
�� 
periods
�� 
.
�� 
Insert
�� 
(
�� 
index
��  
,
��  !
period
��" (
)
��( )
;
��) *
if
�� 
(
�� 
previous
�� 
!=
�� 
null
��  
)
��  !
{
�� 
period
�� 
.
�� 
Setup
�� 
(
�� 
previous
�� %
.
��% &
End
��& )
,
��) *
previous
��+ 3
.
��3 4
End
��4 7
+
��8 9
period
��: @
.
��@ A
Duration
��A I
)
��I J
;
��J K
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
index
�� "
+
��# $
$num
��% &
;
��& '
i
��( )
<
��* +
Count
��, 1
;
��1 2
i
��3 4
++
��4 6
)
��6 7
{
�� 
DateTime
�� 

�� *
=
��+ ,
this
��- 1
[
��1 2
i
��2 3
]
��3 4
.
��4 5
Start
��5 :
.
��: ;
Add
��; >
(
��> ?
itemDuration
��? K
)
��K L
;
��L M
this
�� 
[
�� 
i
�� 
]
�� 
.
�� 
Setup
�� !
(
��! "

��" /
,
��/ 0

��1 >
.
��> ?
Add
��? B
(
��B C
this
��C G
[
��G H
i
��H I
]
��I J
.
��J K
Duration
��K S
)
��S T
)
��T U
;
��U V
}
�� 
}
�� 
if
�� 
(
�� 
next
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
;
�� 
}
�� 
DateTime
�� 
	nextStart
�� 
=
��  
next
��! %
.
��% &
Start
��& +
.
��+ ,
Subtract
��, 4
(
��4 5
itemDuration
��5 A
)
��A B
;
��B C
period
�� 
.
�� 
Setup
�� 
(
�� 
	nextStart
�� "
,
��" #
	nextStart
��$ -
.
��- .
Add
��. 1
(
��1 2
period
��2 8
.
��8 9
Duration
��9 A
)
��A B
)
��B C
;
��C D
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
index
��  %
-
��& '
$num
��( )
;
��) *
i
��+ ,
++
��, .
)
��. /
{
�� 
	nextStart
�� 
=
�� 
this
��  
[
��  !
i
��! "
]
��" #
.
��# $
Start
��$ )
.
��) *
Subtract
��* 2
(
��2 3
itemDuration
��3 ?
)
��? @
;
��@ A
this
�� 
[
�� 
i
�� 
]
�� 
.
�� 
Setup
�� 
(
�� 
	nextStart
�� '
,
��' (
	nextStart
��) 2
.
��2 3
Add
��3 6
(
��6 7
this
��7 ;
[
��; <
i
��< =
]
��= >
.
��> ?
Duration
��? G
)
��G H
)
��H I
;
��I J
}
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
Contains
�� $
(
��$ %
ITimePeriod
��% 0
period
��1 7
)
��7 8
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
return
�� 
periods
�� 
.
�� 
Contains
�� #
(
��# $
period
��$ *
)
��* +
;
��+ ,
}
�� 	
public
�� 
virtual
�� 
int
�� 
IndexOf
�� "
(
��" #
ITimePeriod
��# .
period
��/ 5
)
��5 6
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
return
�� 
periods
�� 
.
�� 
IndexOf
�� "
(
��" #
period
��# )
)
��) *
;
��* +
}
�� 	
public
�� 
virtual
�� 
void
�� 
CopyTo
�� "
(
��" #
ITimePeriod
��# .
[
��. /
]
��/ 0
array
��1 6
,
��6 7
int
��8 ;

arrayIndex
��< F
)
��F G
{
�� 	
if
�� 
(
�� 
array
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
periods
�� 
.
�� 
CopyTo
�� 
(
�� 
array
��  
,
��  !

arrayIndex
��" ,
)
��, -
;
��- .
}
�� 	
public
�� 
virtual
�� 
void
�� 
Clear
�� !
(
��! "
)
��" #
{
�� 	
periods
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
Remove
�� "
(
��" #
ITimePeriod
��# .
period
��/ 5
)
��5 6
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
TimeSpan
�� 
itemDuration
�� !
=
��" #
period
��$ *
.
��* +
Duration
��+ 3
;
��3 4
int
�� 
index
�� 
=
�� 
IndexOf
�� 
(
��  
period
��  &
)
��& '
;
��' (
ITimePeriod
�� 
next
�� 
=
�� 
null
�� #
;
��# $
if
�� 
(
�� 
itemDuration
�� 
>
�� 
TimeSpan
�� '
.
��' (
Zero
��( ,
&&
��- /
Count
��0 5
>
��6 7
$num
��8 9
&&
��: <
index
��= B
>
��C D
$num
��E F
&&
��G I
index
��J O
<
��P Q
Count
��R W
-
��X Y
$num
��Z [
)
��[ \
{
�� 
next
�� 
=
�� 
this
�� 
[
�� 
index
�� !
]
��! "
;
��" #
}
�� 
bool
�� 
removed
�� 
=
�� 
periods
�� "
.
��" #
Remove
��# )
(
��) *
period
��* 0
)
��0 1
;
��1 2
if
�� 
(
�� 
removed
�� 
&&
�� 
next
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
index
�� "
;
��" #
i
��$ %
<
��& '
Count
��( -
;
��- .
i
��/ 0
++
��0 2
)
��2 3
{
�� 
DateTime
�� 
start
�� "
=
��# $
this
��% )
[
��) *
i
��* +
]
��+ ,
.
��, -
Start
��- 2
.
��2 3
Subtract
��3 ;
(
��; <
itemDuration
��< H
)
��H I
;
��I J
this
�� 
[
�� 
i
�� 
]
�� 
.
�� 
Setup
�� !
(
��! "
start
��" '
,
��' (
start
��) .
.
��. /
Add
��/ 2
(
��2 3
this
��3 7
[
��7 8
i
��8 9
]
��9 :
.
��: ;
Duration
��; C
)
��C D
)
��D E
;
��E F
}
�� 
}
�� 
return
�� 
removed
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
RemoveAt
�� $
(
��$ %
int
��% (
index
��) .
)
��. /
{
�� 	
Remove
�� 
(
�� 
this
�� 
[
�� 
index
�� 
]
�� 
)
�� 
;
��  
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IsSamePeriod
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
Start
�� 
==
�� 
test
��  
.
��  !
Start
��! &
&&
��' )
End
��* -
==
��. 0
test
��1 5
.
��5 6
End
��6 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
DateTime
��& .
test
��/ 3
)
��3 4
{
�� 	
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
ITimePeriod
��& 1
test
��2 6
)
��6 7
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IntersectsWith
�� *
(
��* +
ITimePeriod
��+ 6
test
��7 ;
)
��; <
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
IntersectsWith
��" 0
(
��0 1
this
��1 5
,
��5 6
test
��7 ;
)
��; <
;
��< =
}
�� 	
public
�� 
virtual
�� 
bool
�� 
OverlapsWith
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
OverlapsWith
��" .
(
��. /
this
��/ 3
,
��3 4
test
��5 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
virtual
�� 
PeriodRelation
�� %
GetRelation
��& 1
(
��1 2
ITimePeriod
��2 =
test
��> B
)
��B C
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
GetRelation
��" -
(
��- .
this
��. 2
,
��2 3
test
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
int
�� 
	CompareTo
�� $
(
��$ %
ITimePeriod
��% 0
other
��1 6
,
��6 7!
ITimePeriodComparer
��8 K
comparer
��L T
)
��T U
{
�� 	
if
�� 
(
�� 
other
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
comparer
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
comparer
�� 
.
�� 
Compare
�� #
(
��# $
this
��$ (
,
��( )
other
��* /
)
��/ 0
;
��0 1
}
�� 	
public
�� 
string
�� 
GetDescription
�� $
(
��$ %
ITimeFormatter
��% 3
	formatter
��4 =
=
��> ?
null
��@ D
)
��D E
{
�� 	
return
�� 
Format
�� 
(
�� 
	formatter
�� #
??
��$ &

��' 4
.
��4 5
Instance
��5 =
)
��= >
;
��> ?
}
�� 	
	protected
�� 
virtual
�� 
string
��  
Format
��! '
(
��' (
ITimeFormatter
��( 6
	formatter
��7 @
)
��@ A
{
�� 	
return
�� 
	formatter
�� 
.
�� !
GetCollectionPeriod
�� 0
(
��0 1
Count
��1 6
,
��6 7
Start
��8 =
,
��= >
End
��? B
,
��B C
Duration
��D L
)
��L M
;
��M N
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
GetDescription
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
sealed
�� 
override
�� 
bool
�� #
Equals
��$ *
(
��* +
object
��+ 1
obj
��2 5
)
��5 6
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
this
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
IsEqual
�� 
(
�� 
obj
�� 
)
�� 
;
��  
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsEqual
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
return
�� 
HasSameData
�� 
(
�� 
obj
�� "
as
��# %
TimePeriodChain
��& 5
)
��5 6
;
��6 7
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
IList
��! &
<
��& '
ITimePeriod
��' 2
>
��2 3
comp
��4 8
)
��8 9
{
�� 	
if
�� 
(
�� 
Count
�� 
!=
�� 
comp
�� 
.
�� 
Count
�� #
)
��# $
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
Count
��  %
;
��% &
i
��' (
++
��( *
)
��* +
{
�� 
if
�� 
(
�� 
!
�� 
this
�� 
[
�� 
i
�� 
]
�� 
.
�� 
Equals
�� #
(
��# $
comp
��$ (
[
��( )
i
��) *
]
��* +
)
��+ ,
)
��, -
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 
sealed
�� 
override
�� 
int
�� "
GetHashCode
��# .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
AddHashCode
�� '
(
��' (
GetType
��( /
(
��/ 0
)
��0 1
.
��1 2
GetHashCode
��2 =
(
��= >
)
��> ?
,
��? @
ComputeHashCode
��A P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
�� 	
	protected
�� 
virtual
�� 
int
�� 
ComputeHashCode
�� -
(
��- .
)
��. /
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
periods
��, 3
)
��3 4
;
��4 5
}
�� 	
	protected
�� 
void
�� 
CheckSpaceBefore
�� '
(
��' (
DateTime
��( 0
moment
��1 7
,
��7 8
TimeSpan
��9 A
duration
��B J
)
��J K
{
�� 	
bool
�� 
hasSpace
�� 
=
�� 
moment
�� "
!=
��# %
TimeSpec
��& .
.
��. /

��/ <
;
��< =
if
�� 
(
�� 
hasSpace
�� 
)
�� 
{
�� 
TimeSpan
�� 
	remaining
�� "
=
��# $
moment
��% +
-
��, -
TimeSpec
��. 6
.
��6 7

��7 D
;
��D E
hasSpace
�� 
=
�� 
duration
�� #
<=
��$ &
	remaining
��' 0
;
��0 1
}
�� 
if
�� 
(
�� 
!
�� 
hasSpace
�� 
)
�� 
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 3
(
��3 4
$str
��4 ?
+
��@ A
duration
��B J
+
��K L
$str
��M ]
)
��] ^
;
��^ _
}
�� 
}
�� 	
	protected
�� 
void
�� 
CheckSpaceAfter
�� &
(
��& '
DateTime
��' /
moment
��0 6
,
��6 7
TimeSpan
��8 @
duration
��A I
)
��I J
{
�� 	
bool
�� 
hasSpace
�� 
=
�� 
moment
�� "
!=
��# %
TimeSpec
��& .
.
��. /

��/ <
;
��< =
if
�� 
(
�� 
hasSpace
�� 
)
�� 
{
�� 
TimeSpan
�� 
	remaining
�� "
=
��# $
TimeSpec
��% -
.
��- .

��. ;
-
��< =
moment
��> D
;
��D E
hasSpace
�� 
=
�� 
duration
�� #
<=
��$ &
	remaining
��' 0
;
��0 1
}
�� 
if
�� 
(
�� 
!
�� 
hasSpace
�� 
)
�� 
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 3
(
��3 4
$str
��4 ?
+
��@ A
duration
��B J
+
��K L
$str
��M \
)
��\ ]
;
��] ^
}
�� 
}
�� 	
	protected
�� 
void
�� 
CheckReadOnlyItem
�� (
(
��( )
ITimePeriod
��) 4

timePeriod
��5 ?
)
��? @
{
�� 	
if
�� 
(
�� 

timePeriod
�� 
.
�� 

IsReadOnly
�� %
)
��% &
{
�� 
throw
�� 
new
�� #
NotSupportedException
�� /
(
��/ 0
$str
��0 I
)
��I J
;
��J K
}
�� 
}
�� 	
private
�� 
readonly
�� 
List
�� 
<
�� 
ITimePeriod
�� )
>
��) *
periods
��+ 2
=
��3 4
new
��5 8
List
��9 =
<
��= >
ITimePeriod
��> I
>
��I J
(
��J K
)
��K L
;
��L M
}
�� 
}�� ��
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodCollection.cs
	namespace
Phoenix
 
.
CrossCutting
.

TimePeriod
{ 
public 

class  
TimePeriodCollection %
:& '!
ITimePeriodCollection( =
{ 
public  
TimePeriodCollection #
(# $
)$ %
{ 	
} 	
public  
TimePeriodCollection #
(# $
IEnumerable$ /
</ 0
ITimePeriod0 ;
>; <
timePeriods= H
)H I
:J K
this 
( 
) 
{ 	
if 
( 
timePeriods 
== 
null #
)# $
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 =
)= >
;> ?
}   
AddAll!! 
(!! 
timePeriods!! 
)!! 
;!!  
}"" 	
public%% 
bool%% 

IsReadOnly%% 
{&& 	
get'' 
{'' 
return'' 
false'' 
;'' 
}''  !
}(( 	
public++ 
int++ 
Count++ 
{,, 	
get-- 
{-- 
return-- 
periods--  
.--  !
Count--! &
;--& '
}--( )
}.. 	
public11 
ITimePeriod11 
this11 
[11  
int11  #
index11$ )
]11) *
{22 	
get33 
{33 
return33 
periods33  
[33  !
index33! &
]33& '
;33' (
}33) *
set44 
{44 
periods44 
[44 
index44 
]44  
=44! "
value44# (
;44( )
}44* +
}55 	
public88 
bool88 
	IsAnytime88 
{99 	
get:: 
{:: 
return:: 
!:: 
HasStart:: "
&&::# %
!::& '
HasEnd::' -
;::- .
}::/ 0
};; 	
public>> 
bool>> 
IsMoment>> 
{?? 	
get@@ 
{@@ 
return@@ 
Duration@@ !
==@@" $
TimeSpan@@% -
.@@- .
Zero@@. 2
;@@2 3
}@@4 5
}AA 	
publicDD 
boolDD 
HasStartDD 
{EE 	
getFF 
{FF 
returnFF 
StartFF 
!=FF !
TimeSpecFF" *
.FF* +

;FF8 9
}FF: ;
}GG 	
publicJJ 
DateTimeJJ 
StartJJ 
{KK 	
getLL 
{MM 
DateTimeNN 
?NN 
startNN 
=NN  !
GetStartNN" *
(NN* +
)NN+ ,
;NN, -
returnOO 
startOO 
.OO 
HasValueOO %
?OO& '
startOO( -
.OO- .
ValueOO. 3
:OO4 5
TimeSpecOO6 >
.OO> ?

;OOL M
}PP 
setQQ 
{RR 
ifSS 
(SS 
CountSS 
==SS 
$numSS 
)SS 
{TT 
returnUU 
;UU 
}VV 
MoveWW 
(WW 
valueWW 
-WW 
StartWW "
)WW" #
;WW# $
}XX 
}YY 	
public\\ 
bool\\ 
HasEnd\\ 
{]] 	
get^^ 
{^^ 
return^^ 
End^^ 
!=^^ 
TimeSpec^^  (
.^^( )

;^^6 7
}^^8 9
}__ 	
publicbb 
DateTimebb 
Endbb 
{cc 	
getdd 
{ee 
DateTimeff 
?ff 
endff 
=ff 
GetEndff  &
(ff& '
)ff' (
;ff( )
returngg 
endgg 
.gg 
HasValuegg #
?gg$ %
endgg& )
.gg) *
Valuegg* /
:gg0 1
TimeSpecgg2 :
.gg: ;

;ggH I
}hh 
setii 
{jj 
ifkk 
(kk 
Countkk 
==kk 
$numkk 
)kk 
{ll 
returnmm 
;mm 
}nn 
Moveoo 
(oo 
valueoo 
-oo 
Endoo  
)oo  !
;oo! "
}pp 
}qq 	
publictt 
TimeSpantt 
Durationtt  
{uu 	
getvv 
{ww 
TimeSpanxx 
?xx 
durationxx "
=xx# $
GetDurationxx% 0
(xx0 1
)xx1 2
;xx2 3
returnyy 
durationyy 
.yy  
HasValueyy  (
?yy) *
durationyy+ 3
.yy3 4
Valueyy4 9
:yy: ;
TimeSpecyy< D
.yyD E
MaxPeriodDurationyyE V
;yyV W
}zz 
}{{ 	
public~~ 
virtual~~ 
TimeSpan~~ 

{ 	
get
�� 
{
�� 
TimeSpan
�� 
duration
�� !
=
��" #
TimeSpan
��$ ,
.
��, -
Zero
��- 1
;
��1 2
foreach
�� 
(
�� 
ITimePeriod
�� $

timePeriod
��% /
in
��0 2
periods
��3 :
)
��: ;
{
�� 
duration
�� 
=
�� 
duration
�� '
.
��' (
Add
��( +
(
��+ ,

timePeriod
��, 6
.
��6 7
Duration
��7 ?
)
��? @
;
��@ A
}
�� 
return
�� 
duration
�� 
;
��  
}
�� 
}
�� 	
public
�� 
string
�� !
DurationDescription
�� )
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
.
��& '
Instance
��' /
.
��/ 0
GetDuration
��0 ;
(
��; <
Duration
��< D
,
��D E 
DurationFormatType
��F X
.
��X Y
Detailed
��Y a
)
��a b
;
��b c
}
��d e
}
�� 	
public
�� 
virtual
�� 
TimeSpan
�� 
GetDuration
��  +
(
��+ ,
IDurationProvider
��, =
provider
��> F
)
��F G
{
�� 	
if
�� 
(
�� 
provider
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
provider
�� 
.
�� 
GetDuration
�� '
(
��' (
Start
��( -
,
��- .
End
��/ 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 
TimeSpan
�� 
GetTotalDuration
��  0
(
��0 1
IDurationProvider
��1 B
provider
��C K
)
��K L
{
�� 	
if
�� 
(
�� 
provider
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
TimeSpan
�� 
duration
�� 
=
�� 
TimeSpan
��  (
.
��( )
Zero
��) -
;
��- .
foreach
�� 
(
�� 
ITimePeriod
��  

timePeriod
��! +
in
��, .
periods
��/ 6
)
��6 7
{
�� 
duration
�� 
=
�� 
duration
�� #
.
��# $
Add
��$ '
(
��' (

timePeriod
��( 2
.
��2 3
GetDuration
��3 >
(
��> ?
provider
��? G
)
��G H
)
��H I
;
��I J
}
�� 
return
�� 
duration
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
Setup
�� !
(
��! "
DateTime
��" *
newStart
��+ 3
,
��3 4
DateTime
��5 =
newEnd
��> D
)
��D E
{
�� 	
throw
�� 
new
�� '
InvalidOperationException
�� /
(
��/ 0
)
��0 1
;
��1 2
}
�� 	
IEnumerator
�� 
IEnumerable
�� 
.
��  

��  -
(
��- .
)
��. /
{
�� 	
return
�� 

��  
(
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
IEnumerator
�� 
<
�� 
ITimePeriod
�� &
>
��& '

��( 5
(
��5 6
)
��6 7
{
�� 	
return
�� 
periods
�� 
.
�� 

�� (
(
��( )
)
��) *
;
��* +
}
�� 	
public
�� 
virtual
�� 
void
�� 
Move
��  
(
��  !
TimeSpan
��! )
delta
��* /
)
��/ 0
{
�� 	
if
�� 
(
�� 
delta
�� 
==
�� 
TimeSpan
�� !
.
��! "
Zero
��" &
)
��& '
{
�� 
return
�� 
;
�� 
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  

timePeriod
��! +
in
��, .
periods
��/ 6
)
��6 7
{
�� 
DateTime
�� 
start
�� 
=
��  

timePeriod
��! +
.
��+ ,
Start
��, 1
+
��2 3
delta
��4 9
;
��9 :

timePeriod
�� 
.
�� 
Setup
��  
(
��  !
start
��! &
,
��& '
start
��( -
.
��- .
Add
��. 1
(
��1 2

timePeriod
��2 <
.
��< =
Duration
��= E
)
��E F
)
��F G
;
��G H
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
SortBy
�� "
(
��" #!
ITimePeriodComparer
��# 6
comparer
��7 ?
)
��? @
{
�� 	
if
�� 
(
�� 
comparer
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
periods
�� 
.
�� 
Sort
�� 
(
�� 
comparer
�� !
)
��! "
;
��" #
}
�� 	
public
�� 
virtual
�� 
void
�� 

�� )
(
��) *!
ITimePeriodComparer
��* =
comparer
��> F
)
��F G
{
�� 	
if
�� 
(
�� 
comparer
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
SortBy
�� 
(
�� 
new
�� &
TimePeriodReversComparer
�� /
(
��/ 0
comparer
��0 8
)
��8 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
virtual
�� 
void
�� 
SortByStart
�� '
(
��' (
ListSortDirection
��( 9

��: G
=
��H I
ListSortDirection
��J [
.
��[ \
	Ascending
��\ e
)
��e f
{
�� 	
switch
�� 
(
�� 

�� !
)
��! "
{
�� 
case
�� 
ListSortDirection
�� &
.
��& '
	Ascending
��' 0
:
��0 1
SortBy
�� 
(
�� %
TimePeriodStartComparer
�� 2
.
��2 3
Comparer
��3 ;
)
��; <
;
��< =
break
�� 
;
�� 
case
�� 
ListSortDirection
�� &
.
��& '

Descending
��' 1
:
��1 2
SortBy
�� 
(
�� %
TimePeriodStartComparer
�� 2
.
��2 3
ReverseComparer
��3 B
)
��B C
;
��C D
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 9
(
��9 :
$str
��: I
)
��I J
;
��J K
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
	SortByEnd
�� %
(
��% &
ListSortDirection
��& 7

��8 E
=
��F G
ListSortDirection
��H Y
.
��Y Z
	Ascending
��Z c
)
��c d
{
�� 	
switch
�� 
(
�� 

�� !
)
��! "
{
�� 
case
�� 
ListSortDirection
�� &
.
��& '
	Ascending
��' 0
:
��0 1
SortBy
�� 
(
�� #
TimePeriodEndComparer
�� 0
.
��0 1
Comparer
��1 9
)
��9 :
;
��: ;
break
�� 
;
�� 
case
�� 
ListSortDirection
�� &
.
��& '

Descending
��' 1
:
��1 2
SortBy
�� 
(
�� #
TimePeriodEndComparer
�� 0
.
��0 1
ReverseComparer
��1 @
)
��@ A
;
��A B
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 9
(
��9 :
$str
��: I
)
��I J
;
��J K
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
SortByDuration
�� *
(
��* +
ListSortDirection
��+ <

��= J
=
��K L
ListSortDirection
��M ^
.
��^ _
	Ascending
��_ h
)
��h i
{
�� 	
switch
�� 
(
�� 

�� !
)
��! "
{
�� 
case
�� 
ListSortDirection
�� &
.
��& '
	Ascending
��' 0
:
��0 1
SortBy
�� 
(
�� (
TimePeriodDurationComparer
�� 5
.
��5 6
Comparer
��6 >
)
��> ?
;
��? @
break
�� 
;
�� 
case
�� 
ListSortDirection
�� &
.
��& '

Descending
��' 1
:
��1 2
SortBy
�� 
(
�� (
TimePeriodDurationComparer
�� 5
.
��5 6
ReverseComparer
��6 E
)
��E F
;
��F G
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 9
(
��9 :
$str
��: I
)
��I J
;
��J K
}
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
HasInsidePeriods
�� ,
(
��, -
ITimePeriod
��- 8
test
��9 =
)
��= >
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
test
�� 
.
�� 
	HasInside
�� "
(
��" #
period
��# )
)
��) *
)
��* +
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� #
ITimePeriodCollection
�� ,

��- :
(
��: ;
ITimePeriod
��; F
test
��G K
)
��K L
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
TimePeriodCollection
��  

��! .
=
��/ 0
new
��1 4"
TimePeriodCollection
��5 I
(
��I J
)
��J K
;
��K L
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
test
�� 
.
�� 
	HasInside
�� "
(
��" #
period
��# )
)
��) *
)
��* +
{
�� 

�� !
.
��! "
Add
��" %
(
��% &
period
��& ,
)
��, -
;
��- .
}
�� 
}
�� 
return
�� 

��  
;
��  !
}
�� 	
public
�� 
virtual
�� 
bool
�� 
HasOverlaps
�� '
(
��' (
)
��( )
{
�� 	
bool
�� 
hasOverlaps
�� 
=
�� 
false
�� $
;
��$ %
if
�� 
(
�� 
Count
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
hasOverlaps
�� 
=
�� 
this
�� "
[
��" #
$num
��# $
]
��$ %
.
��% &
OverlapsWith
��& 2
(
��2 3
this
��3 7
[
��7 8
$num
��8 9
]
��9 :
)
��: ;
;
��; <
}
�� 
else
�� 
if
�� 
(
�� 
Count
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
hasOverlaps
�� 
=
�� 
new
�� !&
TimeLineMomentCollection
��" :
(
��: ;
this
��; ?
)
��? @
.
��@ A
HasOverlaps
��A L
(
��L M
)
��M N
;
��N O
}
�� 
return
�� 
hasOverlaps
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
HasGaps
�� #
(
��# $
)
��$ %
{
�� 	
bool
�� 
hasGaps
�� 
=
�� 
false
��  
;
��  !
if
�� 
(
�� 
Count
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
hasGaps
�� 
=
�� 
new
�� &
TimeLineMomentCollection
�� 6
(
��6 7
this
��7 ;
)
��; <
.
��< =
HasGaps
��= D
(
��D E
)
��E F
;
��F G
}
�� 
return
�� 
hasGaps
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
HasOverlapPeriods
�� -
(
��- .
ITimePeriod
��. 9
test
��: >
)
��> ?
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
test
�� 
.
�� 
OverlapsWith
�� %
(
��% &
period
��& ,
)
��, -
)
��- .
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� #
ITimePeriodCollection
�� ,
OverlapPeriods
��- ;
(
��; <
ITimePeriod
��< G
test
��H L
)
��L M
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
TimePeriodCollection
��  
overlapPeriods
��! /
=
��0 1
new
��2 5"
TimePeriodCollection
��6 J
(
��J K
)
��K L
;
��L M
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
test
�� 
.
�� 
OverlapsWith
�� %
(
��% &
period
��& ,
)
��, -
)
��- .
{
�� 
overlapPeriods
�� "
.
��" #
Add
��# &
(
��& '
period
��' -
)
��- .
;
��. /
}
�� 
}
�� 
return
�� 
overlapPeriods
�� !
;
��! "
}
�� 	
public
�� 
virtual
�� 
bool
�� $
HasIntersectionPeriods
�� 2
(
��2 3
DateTime
��3 ;
test
��< @
)
��@ A
{
�� 	
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
period
�� 
.
�� 
	HasInside
�� $
(
��$ %
test
��% )
)
��) *
)
��* +
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� #
ITimePeriodCollection
�� ,!
IntersectionPeriods
��- @
(
��@ A
DateTime
��A I
test
��J N
)
��N O
{
�� 	"
TimePeriodCollection
��  !
intersectionPeriods
��! 4
=
��5 6
new
��7 :"
TimePeriodCollection
��; O
(
��O P
)
��P Q
;
��Q R
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
period
�� 
.
�� 
	HasInside
�� $
(
��$ %
test
��% )
)
��) *
)
��* +
{
�� !
intersectionPeriods
�� '
.
��' (
Add
��( +
(
��+ ,
period
��, 2
)
��2 3
;
��3 4
}
�� 
}
�� 
return
�� !
intersectionPeriods
�� &
;
��& '
}
�� 	
public
�� 
virtual
�� 
bool
�� $
HasIntersectionPeriods
�� 2
(
��2 3
ITimePeriod
��3 >
test
��? C
)
��C D
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
period
�� 
.
�� 
IntersectsWith
�� )
(
��) *
test
��* .
)
��. /
)
��/ 0
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� #
ITimePeriodCollection
�� ,!
IntersectionPeriods
��- @
(
��@ A
ITimePeriod
��A L
test
��M Q
)
��Q R
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
TimePeriodCollection
��  !
intersectionPeriods
��! 4
=
��5 6
new
��7 :"
TimePeriodCollection
��; O
(
��O P
)
��P Q
;
��Q R
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
test
�� 
.
�� 
IntersectsWith
�� '
(
��' (
period
��( .
)
��. /
)
��/ 0
{
�� !
intersectionPeriods
�� '
.
��' (
Add
��( +
(
��+ ,
period
��, 2
)
��2 3
;
��3 4
}
�� 
}
�� 
return
�� !
intersectionPeriods
�� &
;
��& '
}
�� 	
public
�� 
virtual
�� #
ITimePeriodCollection
�� ,
RelationPeriods
��- <
(
��< =
ITimePeriod
��= H
test
��I M
,
��M N
PeriodRelation
��O ]
relation
��^ f
)
��f g
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
TimePeriodCollection
��  
relationPeriods
��! 0
=
��1 2
new
��3 6"
TimePeriodCollection
��7 K
(
��K L
)
��L M
;
��M N
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
test
�� 
.
�� 
GetRelation
�� $
(
��$ %
period
��% +
)
��+ ,
==
��- /
relation
��0 8
)
��8 9
{
�� 
relationPeriods
�� #
.
��# $
Add
��$ '
(
��' (
period
��( .
)
��. /
;
��/ 0
}
�� 
}
�� 
return
�� 
relationPeriods
�� "
;
��" #
}
�� 	
public
�� 
virtual
�� 
void
�� 
Add
�� 
(
��  
ITimePeriod
��  +
item
��, 0
)
��0 1
{
�� 	
if
�� 
(
�� 
item
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
periods
�� 
.
�� 
Add
�� 
(
�� 
item
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
ContainsPeriod
�� "
(
��" #
ITimePeriod
��# .
test
��/ 3
)
��3 4
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
periods
��+ 2
)
��2 3
{
�� 
if
�� 
(
�� 
period
�� 
.
�� 
IsSamePeriod
�� '
(
��' (
test
��( ,
)
��, -
)
��- .
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
AddAll
�� 
(
�� 
IEnumerable
�� &
<
��& '
ITimePeriod
��' 2
>
��2 3
timePeriods
��4 ?
)
��? @
{
�� 	
if
�� 
(
�� 
timePeriods
�� 
==
�� 
null
�� #
)
��# $
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 =
)
��= >
;
��> ?
}
�� 
foreach
�� 
(
�� 
ITimePeriod
��  
period
��! '
in
��( *
timePeriods
��+ 6
)
��6 7
{
�� 
Add
�� 
(
�� 
period
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
Insert
�� "
(
��" #
int
��# &
index
��' ,
,
��, -
ITimePeriod
��. 9
item
��: >
)
��> ?
{
�� 	
if
�� 
(
�� 
index
�� 
<
�� 
$num
�� 
||
�� 
index
�� "
>
��# $
Count
��% *
)
��* +
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 =
)
��= >
;
��> ?
}
�� 
if
�� 
(
�� 
item
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
periods
�� 
.
�� 
Insert
�� 
(
�� 
index
��  
,
��  !
item
��" &
)
��& '
;
��' (
}
�� 	
public
�� 
virtual
�� 
bool
�� 
Contains
�� $
(
��$ %
ITimePeriod
��% 0
item
��1 5
)
��5 6
{
�� 	
if
�� 
(
�� 
item
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
periods
�� 
.
�� 
Contains
�� #
(
��# $
item
��$ (
)
��( )
;
��) *
}
�� 	
public
�� 
virtual
�� 
int
�� 
IndexOf
�� "
(
��" #
ITimePeriod
��# .
item
��/ 3
)
��3 4
{
�� 	
if
�� 
(
�� 
item
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
periods
�� 
.
�� 
IndexOf
�� "
(
��" #
item
��# '
)
��' (
;
��( )
}
�� 	
public
�� 
virtual
�� 
void
�� 
CopyTo
�� "
(
��" #
ITimePeriod
��# .
[
��. /
]
��/ 0
array
��1 6
,
��6 7
int
��8 ;

arrayIndex
��< F
)
��F G
{
�� 	
if
�� 
(
�� 
array
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
periods
�� 
.
�� 
CopyTo
�� 
(
�� 
array
��  
,
��  !

arrayIndex
��" ,
)
��, -
;
��- .
}
�� 	
public
�� 
virtual
�� 
void
�� 
Clear
�� !
(
��! "
)
��" #
{
�� 	
periods
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
Remove
�� "
(
��" #
ITimePeriod
��# .
item
��/ 3
)
��3 4
{
�� 	
if
�� 
(
�� 
item
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
periods
�� 
.
�� 
Remove
�� !
(
��! "
item
��" &
)
��& '
;
��' (
}
�� 	
public
�� 
virtual
�� 
void
�� 
RemoveAt
�� $
(
��$ %
int
��% (
index
��) .
)
��. /
{
�� 	
periods
�� 
.
�� 
RemoveAt
�� 
(
�� 
index
�� "
)
��" #
;
��# $
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IsSamePeriod
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
Start
�� 
==
�� 
test
��  
.
��  !
Start
��! &
&&
��' )
End
��* -
==
��. 0
test
��1 5
.
��5 6
End
��6 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
DateTime
��& .
test
��/ 3
)
��3 4
{
�� 	
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
ITimePeriod
��& 1
test
��2 6
)
��6 7
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IntersectsWith
�� *
(
��* +
ITimePeriod
��+ 6
test
��7 ;
)
��; <
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
IntersectsWith
��" 0
(
��0 1
this
��1 5
,
��5 6
test
��7 ;
)
��; <
;
��< =
}
�� 	
public
�� 
virtual
�� 
bool
�� 
OverlapsWith
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
OverlapsWith
��" .
(
��. /
this
��/ 3
,
��3 4
test
��5 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
virtual
�� 
PeriodRelation
�� %
GetRelation
��& 1
(
��1 2
ITimePeriod
��2 =
test
��> B
)
��B C
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
GetRelation
��" -
(
��- .
this
��. 2
,
��2 3
test
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
int
�� 
	CompareTo
�� $
(
��$ %
ITimePeriod
��% 0
other
��1 6
,
��6 7!
ITimePeriodComparer
��8 K
comparer
��L T
)
��T U
{
�� 	
if
�� 
(
�� 
other
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
comparer
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
comparer
�� 
.
�� 
Compare
�� #
(
��# $
this
��$ (
,
��( )
other
��* /
)
��/ 0
;
��0 1
}
�� 	
public
�� 
string
�� 
GetDescription
�� $
(
��$ %
ITimeFormatter
��% 3
	formatter
��4 =
=
��> ?
null
��@ D
)
��D E
{
�� 	
return
�� 
Format
�� 
(
�� 
	formatter
�� #
??
��$ &

��' 4
.
��4 5
Instance
��5 =
)
��= >
;
��> ?
}
�� 	
	protected
�� 
virtual
�� 
string
��  
Format
��! '
(
��' (
ITimeFormatter
��( 6
	formatter
��7 @
)
��@ A
{
�� 	
return
�� 
	formatter
�� 
.
�� !
GetCollectionPeriod
�� 0
(
��0 1
Count
��1 6
,
��6 7
Start
��8 =
,
��= >
End
��? B
,
��B C
Duration
��D L
)
��L M
;
��M N
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
GetDescription
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
sealed
�� 
override
�� 
bool
�� #
Equals
��$ *
(
��* +
object
��+ 1
obj
��2 5
)
��5 6
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
this
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
IsEqual
�� 
(
�� 
obj
�� 
)
�� 
;
��  
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsEqual
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
return
�� 
HasSameData
�� 
(
�� 
obj
�� "
as
��# %"
TimePeriodCollection
��& :
)
��: ;
;
��; <
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
IList
��! &
<
��& '
ITimePeriod
��' 2
>
��2 3
comp
��4 8
)
��8 9
{
�� 	
if
�� 
(
�� 
Count
�� 
!=
�� 
comp
�� 
.
�� 
Count
�� #
)
��# $
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
Count
��  %
;
��% &
i
��' (
++
��( *
)
��* +
{
�� 
if
�� 
(
�� 
!
�� 
this
�� 
[
�� 
i
�� 
]
�� 
.
�� 
Equals
�� #
(
��# $
comp
��$ (
[
��( )
i
��) *
]
��* +
)
��+ ,
)
��, -
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 
sealed
�� 
override
�� 
int
�� "
GetHashCode
��# .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
AddHashCode
�� '
(
��' (
GetType
��( /
(
��/ 0
)
��0 1
.
��1 2
GetHashCode
��2 =
(
��= >
)
��> ?
,
��? @
ComputeHashCode
��A P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
�� 	
	protected
�� 
virtual
�� 
int
�� 
ComputeHashCode
�� -
(
��- .
)
��. /
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,
periods
��, 3
)
��3 4
;
��4 5
}
�� 	
	protected
�� 
virtual
�� 
DateTime
�� "
?
��" #
GetStart
��$ ,
(
��, -
)
��- .
{
�� 	
if
�� 
(
�� 
Count
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
DateTime
�� 
start
�� 
=
�� 
TimeSpec
�� %
.
��% &

��& 3
;
��3 4
foreach
�� 
(
�� 
ITimePeriod
��  

timePeriod
��! +
in
��, .
periods
��/ 6
)
��6 7
{
�� 
if
�� 
(
�� 

timePeriod
�� 
.
�� 
Start
�� $
<
��% &
start
��' ,
)
��, -
{
�� 
start
�� 
=
�� 

timePeriod
�� &
.
��& '
Start
��' ,
;
��, -
}
�� 
}
�� 
return
�� 
start
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
DateTime
�� "
?
��" #
GetEnd
��$ *
(
��* +
)
��+ ,
{
�� 	
if
�� 
(
�� 
Count
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
DateTime
�� 
end
�� 
=
�� 
TimeSpec
�� #
.
��# $

��$ 1
;
��1 2
foreach
�� 
(
�� 
ITimePeriod
��  

timePeriod
��! +
in
��, .
periods
��/ 6
)
��6 7
{
�� 
if
�� 
(
�� 

timePeriod
�� 
.
�� 
End
�� "
>
��# $
end
��% (
)
��( )
{
�� 
end
�� 
=
�� 

timePeriod
�� $
.
��$ %
End
��% (
;
��( )
}
�� 
}
�� 
return
�� 
end
�� 
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
void
�� 
GetStartEnd
�� *
(
��* +
out
��+ .
DateTime
��/ 7
?
��7 8
start
��9 >
,
��> ?
out
��@ C
DateTime
��D L
?
��L M
end
��N Q
)
��Q R
{
�� 	
if
�� 
(
�� 
Count
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
start
�� 
=
�� 
null
�� 
;
�� 
end
�� 
=
�� 
null
�� 
;
�� 
return
�� 
;
�� 
}
�� 
start
�� 
=
�� 
TimeSpec
�� 
.
�� 

�� *
;
��* +
end
�� 
=
�� 
TimeSpec
�� 
.
�� 

�� (
;
��( )
foreach
�� 
(
�� 
ITimePeriod
��  

timePeriod
��! +
in
��, .
periods
��/ 6
)
��6 7
{
�� 
if
�� 
(
�� 

timePeriod
�� 
.
�� 
Start
�� $
<
��% &
start
��' ,
)
��, -
{
�� 
start
�� 
=
�� 

timePeriod
�� &
.
��& '
Start
��' ,
;
��, -
}
�� 
if
�� 
(
�� 

timePeriod
�� 
.
�� 
End
�� "
>
��# $
end
��% (
)
��( )
{
�� 
end
�� 
=
�� 

timePeriod
�� $
.
��$ %
End
��% (
;
��( )
}
�� 
}
�� 
}
�� 	
	protected
�� 
virtual
�� 
TimeSpan
�� "
?
��" #
GetDuration
��$ /
(
��/ 0
)
��0 1
{
�� 	
DateTime
�� 
?
�� 
start
�� 
;
�� 
DateTime
�� 
?
�� 
end
�� 
;
�� 
GetStartEnd
�� 
(
�� 
out
�� 
start
�� !
,
��! "
out
��# &
end
��' *
)
��* +
;
��+ ,
if
�� 
(
�� 
start
�� 
==
�� 
null
�� 
||
��  
end
��! $
==
��% '
null
��( ,
)
��, -
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
return
�� 
end
�� 
.
�� 
Value
�� 
-
�� 
start
�� $
.
��$ %
Value
��% *
;
��* +
}
�� 	
private
�� 
readonly
�� 
List
�� 
<
�� 
ITimePeriod
�� )
>
��) *
periods
��+ 2
=
��3 4
new
��5 8
List
��9 =
<
��= >
ITimePeriod
��> I
>
��I J
(
��J K
)
��K L
;
��L M
}
�� 
}�� �
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodCombiner.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
TimePeriodCombiner #
<# $
T$ %
>% &
where' ,
T- .
:/ 0
ITimePeriod1 <
,< =
new> A
(A B
)B C
{ 
public 
TimePeriodCombiner !
(! "
)" #
:$ %
this 
( 
null 
) 
{ 	
} 	
public 
TimePeriodCombiner !
(! "
ITimePeriodMapper" 3
periodMapper4 @
)@ A
{ 	
this 
. 
periodMapper 
= 
periodMapper  ,
;, -
} 	
public 
ITimePeriodMapper  
PeriodMapper! -
{ 	
get   
{   
return   
periodMapper   %
;  % &
}  ' (
}!! 	
public$$ 
virtual$$ !
ITimePeriodCollection$$ ,
CombinePeriods$$- ;
($$; < 
ITimePeriodContainer$$< P
periods$$Q X
)$$X Y
{%% 	
if&& 
(&& 
periods&& 
==&& 
null&& 
)&&  
{'' 
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
$str((0 9
)((9 :
;((: ;
})) 
TimeLine** 
<** 
T** 
>** 
timeLine**  
=**! "
new**# &
TimeLine**' /
<**/ 0
T**0 1
>**1 2
(**2 3
periods**3 :
,**: ;
periodMapper**< H
)**H I
;**I J
return++ 
timeLine++ 
.++ 
CombinePeriods++ *
(++* +
)+++ ,
;++, -
},, 	
private00 
readonly00 
ITimePeriodMapper00 *
periodMapper00+ 7
;007 8
}22 
}44 �

{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodDurationComparer.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class &
TimePeriodDurationComparer 2
:3 4
ITimePeriodComparer5 H
{ 
public 
static 
ITimePeriodComparer )
Comparer* 2
=3 4
new5 8&
TimePeriodDurationComparer9 S
(S T
)T U
;U V
public 
static 
ITimePeriodComparer )
ReverseComparer* 9
=: ;
new< ?$
TimePeriodReversComparer@ X
(X Y
newY \&
TimePeriodDurationComparer] w
(w x
)x y
)y z
;z {
public 
int 
Compare 
( 
ITimePeriod &
left' +
,+ ,
ITimePeriod- 8
right9 >
)> ?
{ 	
return 
left 
. 
Duration  
.  !
	CompareTo! *
(* +
right+ 0
.0 1
Duration1 9
)9 :
;: ;
} 	
} 
} �

vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodEndComparer.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class !
TimePeriodEndComparer -
:. /
ITimePeriodComparer0 C
{ 
public 
static 
ITimePeriodComparer )
Comparer* 2
=3 4
new5 8!
TimePeriodEndComparer9 N
(N O
)O P
;P Q
public 
static 
ITimePeriodComparer )
ReverseComparer* 9
=: ;
new< ?$
TimePeriodReversComparer@ X
(X Y
newY \!
TimePeriodEndComparer] r
(r s
)s t
)t u
;u v
public 
int 
Compare 
( 
ITimePeriod &
left' +
,+ ,
ITimePeriod- 8
right9 >
)> ?
{ 	
return 
left 
. 
End 
. 
	CompareTo %
(% &
right& +
.+ ,
End, /
)/ 0
;0 1
} 	
} 
} �
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodIntersector.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class !
TimePeriodIntersector &
<& '
T' (
>( )
where* /
T0 1
:2 3
ITimePeriod4 ?
,? @
newA D
(D E
)E F
{ 
public !
TimePeriodIntersector $
($ %
)% &
:' (
this 
( 
null 
) 
{ 	
} 	
public !
TimePeriodIntersector $
($ %
ITimePeriodMapper% 6
periodMapper7 C
)C D
{ 	
this 
. 
periodMapper 
= 
periodMapper  ,
;, -
} 	
public 
ITimePeriodMapper  
PeriodMapper! -
{ 	
get   
{   
return   
periodMapper   %
;  % &
}  ' (
}!! 	
public$$ 
virtual$$ !
ITimePeriodCollection$$ ,
IntersectPeriods$$- =
($$= > 
ITimePeriodContainer$$> R
periods$$S Z
,$$Z [
bool$$\ `
combinePeriods$$a o
=$$p q
true$$r v
)$$v w
{%% 	
if&& 
(&& 
periods&& 
==&& 
null&& 
)&&  
{'' 
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
$str((0 9
)((9 :
;((: ;
})) 
TimeLine** 
<** 
T** 
>** 
timeLine**  
=**! "
new**# &
TimeLine**' /
<**/ 0
T**0 1
>**1 2
(**2 3
periods**3 :
,**: ;
periodMapper**< H
)**H I
;**I J
return++ 
timeLine++ 
.++ 
IntersectPeriods++ ,
(++, -
combinePeriods++- ;
)++; <
;++< =
},, 	
private00 
readonly00 
ITimePeriodMapper00 *
periodMapper00+ 7
;007 8
}22 
}44 �
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodReversComparer.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class $
TimePeriodReversComparer 0
:1 2
ITimePeriodComparer3 F
{ 
public $
TimePeriodReversComparer '
(' (
ITimePeriodComparer( ;
baseComparer< H
)H I
{ 	
this 
. 
baseComparer 
= 
baseComparer  ,
;, -
} 	
public 
ITimePeriodComparer "
BaseComparer# /
{ 	
get 
{ 
return 
baseComparer %
;% &
}' (
} 	
public 
int 
Compare 
( 
ITimePeriod &
left' +
,+ ,
ITimePeriod- 8
right9 >
)> ?
{ 	
return   
-   
baseComparer    
.    !
Compare  ! (
(  ( )
left  ) -
,  - .
right  / 4
)  4 5
;  5 6
}!! 	
private%% 
readonly%% 
ITimePeriodComparer%% ,
baseComparer%%- 9
;%%9 :
}'' 
})) �

xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodStartComparer.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class #
TimePeriodStartComparer /
:0 1
ITimePeriodComparer2 E
{ 
public 
static 
ITimePeriodComparer )
Comparer* 2
=3 4
new5 8#
TimePeriodStartComparer9 P
(P Q
)Q R
;R S
public 
static 
ITimePeriodComparer )
ReverseComparer* 9
=: ;
new< ?$
TimePeriodReversComparer@ X
(X Y
newY \#
TimePeriodStartComparer] t
(t u
)u v
)v w
;w x
public 
int 
Compare 
( 
ITimePeriod &
left' +
,+ ,
ITimePeriod- 8
right9 >
)> ?
{ 	
return 
left 
. 
Start 
. 
	CompareTo '
(' (
right( -
.- .
Start. 3
)3 4
;4 5
} 	
} 
} �+
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimePeriodSubtractor.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class  
TimePeriodSubtractor %
<% &
T& '
>' (
where) .
T/ 0
:1 2
ITimePeriod3 >
,> ?
new@ C
(C D
)D E
{ 
public  
TimePeriodSubtractor #
(# $
)$ %
:& '
this 
( 
null 
) 
{ 	
} 	
public  
TimePeriodSubtractor #
(# $
ITimePeriodMapper$ 5
periodMapper6 B
)B C
{ 	
this 
. 
periodMapper 
= 
periodMapper  ,
;, -
timePeriodCombiner 
=  
new! $
TimePeriodCombiner% 7
<7 8
T8 9
>9 :
(: ;
periodMapper; G
)G H
;H I
timeGapCalculator 
= 
new  #
TimeGapCalculator$ 5
<5 6
T6 7
>7 8
(8 9
periodMapper9 E
)E F
;F G!
timePeriodIntersector !
=" #
new$ '!
TimePeriodIntersector( =
<= >
T> ?
>? @
(@ A
periodMapperA M
)M N
;N O
} 	
public!! 
ITimePeriodMapper!!  
PeriodMapper!!! -
{"" 	
get## 
{## 
return## 
periodMapper## %
;##% &
}##' (
}$$ 	
public'' 
virtual'' !
ITimePeriodCollection'' ,
SubtractPeriods''- <
(''< = 
ITimePeriodContainer''= Q

,''_ `!
ITimePeriodCollection''a v
subtractingPeriods	''w �
,
''� �
bool(( 
combinePeriods(( 
=((  !
true((" &
)((& '
{)) 	
if** 
(** 

==**  
null**! %
)**% &
{++ 
throw,, 
new,, !
ArgumentNullException,, /
(,,/ 0
$str,,0 ?
),,? @
;,,@ A
}-- 
if.. 
(.. 
subtractingPeriods.. "
==..# %
null..& *
)..* +
{// 
throw00 
new00 !
ArgumentNullException00 /
(00/ 0
$str000 D
)00D E
;00E F
}11 
if33 
(33 

.33 
Count33 #
==33$ &
$num33' (
)33( )
{44 
return55 
new55  
TimePeriodCollection55 /
(55/ 0
)550 1
;551 2
}66 
if88 
(88 
subtractingPeriods88 "
.88" #
Count88# (
==88) +
$num88, -
&&88. 0
!881 2
combinePeriods882 @
)88@ A
{99 
return:: 
new::  
TimePeriodCollection:: /
(::/ 0

)::= >
;::> ?
};; 

=>> 
timePeriodCombiner>> .
.>>. /
CombinePeriods>>/ =
(>>= >

)>>K L
;>>L M
ifAA 
(AA 
subtractingPeriodsAA "
.AA" #
CountAA# (
==AA) +
$numAA, -
)AA- .
{BB 
returnCC 
newCC  
TimePeriodCollectionCC /
(CC/ 0

)CC= >
;CC> ?
}DD 
subtractingPeriodsEE 
=EE  
timePeriodCombinerEE! 3
.EE3 4
CombinePeriodsEE4 B
(EEB C
subtractingPeriodsEEC U
)EEU V
;EEV W

.HH 
AddAllHH  
(HH  !
timeGapCalculatorHH! 2
.HH2 3
GetGapsHH3 :
(HH: ;
subtractingPeriodsHH; M
,HHM N
newHHO R
	TimeRangeHHS \
(HH\ ]

.HHj k
StartHHk p
,HHp q

.	HH �
End
HH� �
)
HH� �
)
HH� �
)
HH� �
;
HH� �
returnJJ !
timePeriodIntersectorJJ (
.JJ( )
IntersectPeriodsJJ) 9
(JJ9 :

,JJG H
combinePeriodsJJI W
)JJW X
;JJX Y
}KK 	
privateOO 
readonlyOO 
ITimePeriodMapperOO *
periodMapperOO+ 7
;OO7 8
privatePP 
readonlyPP 
TimePeriodCombinerPP +
<PP+ ,
TPP, -
>PP- .
timePeriodCombinerPP/ A
;PPA B
privateQQ 
readonlyQQ 
TimeGapCalculatorQQ *
<QQ* +
TQQ+ ,
>QQ, -
timeGapCalculatorQQ. ?
;QQ? @
privateRR 
readonlyRR !
TimePeriodIntersectorRR .
<RR. /
TRR/ 0
>RR0 1!
timePeriodIntersectorRR2 G
;RRG H
}TT 
}VV ��
jF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class 
	TimeRange 
: 

ITimeRange '
{ 
public 
static 
readonly 
	TimeRange (
Anytime) 0
=1 2
new3 6
	TimeRange7 @
(@ A
trueA E
)E F
;F G
public 
	TimeRange 
( 
) 
: 
this 
( 
TimeSpec 
. 

,' (
TimeSpec) 1
.1 2

)? @
{ 	
} 	
internal 
	TimeRange 
( 
bool 

isReadOnly  *
=+ ,
false- 2
)2 3
:4 5
this 
( 
TimeSpec 
. 

,' (
TimeSpec) 1
.1 2

,? @

isReadOnlyA K
)K L
{ 	
} 	
public!! 
	TimeRange!! 
(!! 
DateTime!! !
moment!!" (
,!!( )
bool!!* .

isReadOnly!!/ 9
=!!: ;
false!!< A
)!!A B
:!!C D
this"" 
("" 
moment"" 
,"" 
moment"" 
,""  

isReadOnly""! +
)""+ ,
{## 	
}$$ 	
public'' 
	TimeRange'' 
('' 
DateTime'' !
start''" '
,''' (
DateTime'') 1
end''2 5
,''5 6
bool''7 ;

isReadOnly''< F
=''G H
false''I N
)''N O
{(( 	
if)) 
()) 
start)) 
<=)) 
end)) 
))) 
{** 
this++ 
.++ 
start++ 
=++ 
start++ "
;++" #
this,, 
.,, 
end,, 
=,, 
end,, 
;,, 
}-- 
else.. 
{// 
this00 
.00 
end00 
=00 
start00  
;00  !
this11 
.11 
start11 
=11 
end11  
;11  !
}22 
this33 
.33 

isReadOnly33 
=33 

isReadOnly33 (
;33( )
}44 	
public77 
	TimeRange77 
(77 
DateTime77 !
start77" '
,77' (
TimeSpan77) 1
duration772 :
,77: ;
bool77< @

isReadOnly77A K
=77L M
false77N S
)77S T
{88 	
if99 
(99 
duration99 
>=99 
TimeSpan99 $
.99$ %
Zero99% )
)99) *
{:: 
this;; 
.;; 
start;; 
=;; 
start;; "
;;;" #
end<< 
=<< 
start<< 
.<< 
Add<< 
(<<  
duration<<  (
)<<( )
;<<) *
}== 
else>> 
{?? 
this@@ 
.@@ 
start@@ 
=@@ 
start@@ "
.@@" #
Add@@# &
(@@& '
duration@@' /
)@@/ 0
;@@0 1
endAA 
=AA 
startAA 
;AA 
}BB 
thisCC 
.CC 

isReadOnlyCC 
=CC 

isReadOnlyCC (
;CC( )
}DD 	
publicGG 
	TimeRangeGG 
(GG 
ITimePeriodGG $
copyGG% )
)GG) *
{HH 	
ifII 
(II 
copyII 
==II 
nullII 
)II 
{JJ 
throwKK 
newKK !
ArgumentNullExceptionKK /
(KK/ 0
$strKK0 6
)KK6 7
;KK7 8
}LL 
startMM 
=MM 
copyMM 
.MM 
StartMM 
;MM 
endNN 
=NN 
copyNN 
.NN 
EndNN 
;NN 

isReadOnlyOO 
=OO 
copyOO 
.OO 

IsReadOnlyOO (
;OO( )
}PP 	
	protectedSS 
	TimeRangeSS 
(SS 
ITimePeriodSS '
copySS( ,
,SS, -
boolSS. 2

isReadOnlySS3 =
)SS= >
{TT 	
ifUU 
(UU 
copyUU 
==UU 
nullUU 
)UU 
{VV 
throwWW 
newWW !
ArgumentNullExceptionWW /
(WW/ 0
$strWW0 6
)WW6 7
;WW7 8
}XX 
startYY 
=YY 
copyYY 
.YY 
StartYY 
;YY 
endZZ 
=ZZ 
copyZZ 
.ZZ 
EndZZ 
;ZZ 
this[[ 
.[[ 

isReadOnly[[ 
=[[ 

isReadOnly[[ (
;[[( )
}\\ 	
public__ 
bool__ 

IsReadOnly__ 
{`` 	
getaa 
{aa 
returnaa 

isReadOnlyaa #
;aa# $
}aa% &
}bb 	
publicee 
boolee 
	IsAnytimeee 
{ff 	
getgg 
{gg 
returngg 
!gg 
HasStartgg "
&&gg# %
!gg& '
HasEndgg' -
;gg- .
}gg/ 0
}hh 	
publickk 
boolkk 
IsMomentkk 
{ll 	
getmm 
{mm 
returnmm 
startmm 
.mm 
Equalsmm %
(mm% &
endmm& )
)mm) *
;mm* +
}mm, -
}nn 	
publicqq 
boolqq 
HasStartqq 
{rr 	
getss 
{ss 
returnss 
startss 
!=ss !
TimeSpecss" *
.ss* +

;ss8 9
}ss: ;
}tt 	
publicww 
DateTimeww 
Startww 
{xx 	
getyy 
{yy 
returnyy 
startyy 
;yy 
}yy  !
setzz 
{{{ 
CheckModification|| !
(||! "
)||" #
;||# $
if}} 
(}} 
value}} 
>}} 
end}} 
)}}  
{~~ 
throw 
new '
ArgumentOutOfRangeException 9
(9 :
$str: A
)A B
;B C
}
�� 
start
�� 
=
�� 
value
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
bool
�� 
HasEnd
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
end
�� 
!=
�� 
TimeSpec
��  (
.
��( )

��) 6
;
��6 7
}
��8 9
}
�� 	
public
�� 
DateTime
�� 
End
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
end
�� 
;
�� 
}
�� 
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
if
�� 
(
�� 
value
�� 
<
�� 
start
�� !
)
��! "
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 9
(
��9 :
$str
��: A
)
��A B
;
��B C
}
�� 
end
�� 
=
�� 
value
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
TimeSpan
�� 
Duration
��  
{
�� 	
get
�� 
{
�� 
return
�� 
end
�� 
.
�� 
Subtract
�� %
(
��% &
start
��& +
)
��+ ,
;
��, -
}
��. /
set
�� 
{
�� 
CheckModification
�� !
(
��! "
)
��" #
;
��# $
end
�� 
=
�� 
start
�� 
.
�� 
Add
�� 
(
��  
value
��  %
)
��% &
;
��& '
}
�� 
}
�� 	
public
�� 
string
�� !
DurationDescription
�� )
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
.
��& '
Instance
��' /
.
��/ 0
GetDuration
��0 ;
(
��; <
Duration
��< D
,
��D E 
DurationFormatType
��F X
.
��X Y
Detailed
��Y a
)
��a b
;
��b c
}
��d e
}
�� 	
public
�� 
virtual
�� 
TimeSpan
�� 
GetDuration
��  +
(
��+ ,
IDurationProvider
��, =
provider
��> F
)
��F G
{
�� 	
if
�� 
(
�� 
provider
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
provider
�� 
.
�� 
GetDuration
�� '
(
��' (
Start
��( -
,
��- .
End
��/ 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 
void
�� 
Setup
�� !
(
��! "
DateTime
��" *
newStart
��+ 3
,
��3 4
DateTime
��5 =
newEnd
��> D
)
��D E
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
newStart
�� 
<=
�� 
newEnd
�� "
)
��" #
{
�� 
start
�� 
=
�� 
newStart
��  
;
��  !
end
�� 
=
�� 
newEnd
�� 
;
�� 
}
�� 
else
�� 
{
�� 
end
�� 
=
�� 
newStart
�� 
;
�� 
start
�� 
=
�� 
newEnd
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IsSamePeriod
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
start
�� 
==
�� 
test
��  
.
��  !
Start
��! &
&&
��' )
end
��* -
==
��. 0
test
��1 5
.
��5 6
End
��6 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
DateTime
��& .
test
��/ 3
)
��3 4
{
�� 	
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	HasInside
�� %
(
��% &
ITimePeriod
��& 1
test
��2 6
)
��6 7
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
	HasInside
��" +
(
��+ ,
this
��, 0
,
��0 1
test
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 

ITimeRange
�� 
Copy
�� 
(
�� 
)
��  
{
�� 	
return
�� 
Copy
�� 
(
�� 
TimeSpan
��  
.
��  !
Zero
��! %
)
��% &
;
��& '
}
�� 	
public
�� 
virtual
�� 

ITimeRange
�� !
Copy
��" &
(
��& '
TimeSpan
��' /
offset
��0 6
)
��6 7
{
�� 	
return
�� 
new
�� 
	TimeRange
��  
(
��  !
start
��! &
.
��& '
Add
��' *
(
��* +
offset
��+ 1
)
��1 2
,
��2 3
end
��4 7
.
��7 8
Add
��8 ;
(
��; <
offset
��< B
)
��B C
,
��C D

IsReadOnly
��E O
)
��O P
;
��P Q
}
�� 	
public
�� 
virtual
�� 
void
�� 
Move
��  
(
��  !
TimeSpan
��! )
offset
��* 0
)
��0 1
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
offset
�� 
==
�� 
TimeSpan
�� "
.
��" #
Zero
��# '
)
��' (
{
�� 
return
�� 
;
�� 
}
�� 
start
�� 
=
�� 
start
�� 
.
�� 
Add
�� 
(
�� 
offset
�� $
)
��$ %
;
��% &
end
�� 
=
�� 
end
�� 
.
�� 
Add
�� 
(
�� 
offset
��  
)
��  !
;
��! "
}
�� 	
public
�� 
virtual
�� 
void
�� 

�� )
(
��) *
DateTime
��* 2
moment
��3 9
)
��9 :
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
start
�� 
>
�� 
moment
�� 
)
�� 
{
�� 
start
�� 
=
�� 
moment
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
ExpandEndTo
�� '
(
��' (
DateTime
��( 0
moment
��1 7
)
��7 8
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
end
�� 
<
�� 
moment
�� 
)
�� 
{
�� 
end
�� 
=
�� 
moment
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
ExpandTo
�� 
(
�� 
DateTime
�� %
moment
��& ,
)
��, -
{
�� 	

�� 
(
�� 
moment
��  
)
��  !
;
��! "
ExpandEndTo
�� 
(
�� 
moment
�� 
)
�� 
;
��  
}
�� 	
public
�� 
void
�� 
ExpandTo
�� 
(
�� 
ITimePeriod
�� (
period
��) /
)
��/ 0
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 

�� 
(
�� 
period
��  
.
��  !
Start
��! &
)
��& '
;
��' (
ExpandEndTo
�� 
(
�� 
period
�� 
.
�� 
End
�� "
)
��" #
;
��# $
}
�� 	
public
�� 
virtual
�� 
void
�� 

�� )
(
��) *
DateTime
��* 2
moment
��3 9
)
��9 :
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
	HasInside
�� 
(
�� 
moment
��  
)
��  !
&&
��" $
start
��% *
<
��+ ,
moment
��- 3
)
��3 4
{
�� 
start
�� 
=
�� 
moment
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
ShrinkEndTo
�� '
(
��' (
DateTime
��( 0
moment
��1 7
)
��7 8
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
	HasInside
�� 
(
�� 
moment
��  
)
��  !
&&
��" $
end
��% (
>
��) *
moment
��+ 1
)
��1 2
{
�� 
end
�� 
=
�� 
moment
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
ShrinkTo
�� 
(
�� 
ITimePeriod
�� (
period
��) /
)
��/ 0
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 

�� 
(
�� 
period
��  
.
��  !
Start
��! &
)
��& '
;
��' (
ShrinkEndTo
�� 
(
�� 
period
�� 
.
�� 
End
�� "
)
��" #
;
��# $
}
�� 	
public
�� 
virtual
�� 
bool
�� 
IntersectsWith
�� *
(
��* +
ITimePeriod
��+ 6
test
��7 ;
)
��; <
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
IntersectsWith
��" 0
(
��0 1
this
��1 5
,
��5 6
test
��7 ;
)
��; <
;
��< =
}
�� 	
public
�� 
virtual
�� 

ITimeRange
�� !
GetIntersection
��" 1
(
��1 2
ITimePeriod
��2 =
period
��> D
)
��D E
{
�� 	
if
�� 
(
�� 
period
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
!
�� 
IntersectsWith
�� 
(
��  
period
��  &
)
��& '
)
��' (
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
DateTime
�� 
periodStart
��  
=
��! "
period
��# )
.
��) *
Start
��* /
;
��/ 0
DateTime
�� 
	periodEnd
�� 
=
��  
period
��! '
.
��' (
End
��( +
;
��+ ,
return
�� 
new
�� 
	TimeRange
��  
(
��  !
periodStart
�� 
>
�� 
start
�� #
?
��$ %
periodStart
��& 1
:
��2 3
start
��4 9
,
��9 :
	periodEnd
�� 
<
�� 
end
�� 
?
��  !
	periodEnd
��" +
:
��, -
end
��. 1
,
��1 2

IsReadOnly
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
OverlapsWith
�� (
(
��( )
ITimePeriod
��) 4
test
��5 9
)
��9 :
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
OverlapsWith
��" .
(
��. /
this
��/ 3
,
��3 4
test
��5 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
virtual
�� 
PeriodRelation
�� %
GetRelation
��& 1
(
��1 2
ITimePeriod
��2 =
test
��> B
)
��B C
{
�� 	
if
�� 
(
�� 
test
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 6
)
��6 7
;
��7 8
}
�� 
return
�� 
TimePeriodCalc
�� !
.
��! "
GetRelation
��" -
(
��- .
this
��. 2
,
��2 3
test
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
virtual
�� 
int
�� 
	CompareTo
�� $
(
��$ %
ITimePeriod
��% 0
other
��1 6
,
��6 7!
ITimePeriodComparer
��8 K
comparer
��L T
)
��T U
{
�� 	
if
�� 
(
�� 
other
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
comparer
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 :
)
��: ;
;
��; <
}
�� 
return
�� 
comparer
�� 
.
�� 
Compare
�� #
(
��# $
this
��$ (
,
��( )
other
��* /
)
��/ 0
;
��0 1
}
�� 	
public
�� 
virtual
�� 
void
�� 
Reset
�� !
(
��! "
)
��" #
{
�� 	
CheckModification
�� 
(
�� 
)
�� 
;
��  
start
�� 
=
�� 
TimeSpec
�� 
.
�� 

�� *
;
��* +
end
�� 
=
�� 
TimeSpec
�� 
.
�� 

�� (
;
��( )
}
�� 	
public
�� 
string
�� 
GetDescription
�� $
(
��$ %
ITimeFormatter
��% 3
	formatter
��4 =
=
��> ?
null
��@ D
)
��D E
{
�� 	
return
�� 
Format
�� 
(
�� 
	formatter
�� #
??
��$ &

��' 4
.
��4 5
Instance
��5 =
)
��= >
;
��> ?
}
�� 	
	protected
�� 
virtual
�� 
string
��  
Format
��! '
(
��' (
ITimeFormatter
��( 6
	formatter
��7 @
)
��@ A
{
�� 	
return
�� 
	formatter
�� 
.
�� 
	GetPeriod
�� &
(
��& '
start
��' ,
,
��, -
end
��. 1
,
��1 2
Duration
��3 ;
)
��; <
;
��< =
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
GetDescription
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
sealed
�� 
override
�� 
bool
�� #
Equals
��$ *
(
��* +
object
��+ 1
obj
��2 5
)
��5 6
{
�� 	
if
�� 
(
�� 
obj
�� 
==
�� 
this
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
if
�� 
(
�� 
obj
�� 
==
�� 
null
�� 
||
�� 
GetType
�� &
(
��& '
)
��' (
!=
��) +
obj
��, /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
IsEqual
�� 
(
�� 
obj
�� 
)
�� 
;
��  
}
�� 	
	protected
�� 
virtual
�� 
bool
�� 
IsEqual
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
return
�� 
HasSameData
�� 
(
�� 
obj
�� "
as
��# %
	TimeRange
��& /
)
��/ 0
;
��0 1
}
�� 	
private
�� 
bool
�� 
HasSameData
��  
(
��  !
	TimeRange
��! *
comp
��+ /
)
��/ 0
{
�� 	
return
�� 
start
�� 
==
�� 
comp
��  
.
��  !
start
��! &
&&
��' )
end
��* -
==
��. 0
comp
��1 5
.
��5 6
end
��6 9
&&
��: <

isReadOnly
��= G
==
��H J
comp
��K O
.
��O P

isReadOnly
��P Z
;
��Z [
}
�� 	
public
�� 
sealed
�� 
override
�� 
int
�� "
GetHashCode
��# .
(
��. /
)
��/ 0
{
�� 	
return
�� 
HashTool
�� 
.
�� 
AddHashCode
�� '
(
��' (
GetType
��( /
(
��/ 0
)
��0 1
.
��1 2
GetHashCode
��2 =
(
��= >
)
��> ?
,
��? @
ComputeHashCode
��A P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
�� 	
	protected
�� 
virtual
�� 
int
�� 
ComputeHashCode
�� -
(
��- .
)
��. /
{
�� 	
return
�� 
HashTool
�� 
.
�� 
ComputeHashCode
�� +
(
��+ ,

isReadOnly
��, 6
,
��6 7
start
��8 =
,
��= >
end
��? B
)
��B C
;
��C D
}
�� 	
	protected
�� 
void
�� 
CheckModification
�� (
(
��( )
)
��) *
{
�� 	
if
�� 
(
�� 

IsReadOnly
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
NotSupportedException
�� /
(
��/ 0
$str
��0 H
)
��H I
;
��I J
}
�� 
}
�� 	
private
�� 
readonly
�� 
bool
�� 

isReadOnly
�� (
;
��( )
private
�� 
DateTime
�� 
start
�� 
;
�� 
private
�� 
DateTime
�� 
end
�� 
;
�� 
}
�� 
}�� �Z
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeSpec.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

static 
class 
TimeSpec  
{ 
public 
const 
int 

=' (
$num) +
;+ ,
public 
const 
int 
HalfyearsPerYear )
=* +
$num, -
;- .
public 
const 
int 
QuartersPerYear (
=) *
$num+ ,
;, -
public 
const 
int 
QuartersPerHalfyear ,
=- .
QuartersPerYear/ >
/? @
HalfyearsPerYearA Q
;Q R
public 
const 
int 
MaxWeeksPerYear (
=) *
$num+ -
;- .
public 
const 
int 
MonthsPerHalfyear *
=+ ,

/; <
HalfyearsPerYear= M
;M N
public 
const 
int 
MonthsPerQuarter )
=* +

/: ;
QuartersPerYear< K
;K L
public 
const 
int 
MaxDaysPerMonth (
=) *
$num+ -
;- .
public 
const 
int 
DaysPerWeek $
=% &
$num' (
;( )
public 
const 
int 
HoursPerDay $
=% &
$num' )
;) *
public 
const 
int 
MinutesPerHour '
=( )
$num* ,
;, -
public 
const 
int 
SecondsPerMinute )
=* +
$num, .
;. /
public 
const 
int !
MillisecondsPerSecond .
=/ 0
$num1 5
;5 6
public!! 
const!! 
	YearMonth!! "
CalendarYearStartMonth!! 5
=!!6 7
	YearMonth!!8 A
.!!A B
January!!B I
;!!I J
public"" 
const"" 
	DayOfWeek"" !
FirstWorkingDayOfWeek"" 4
=""5 6
	DayOfWeek""7 @
.""@ A
Monday""A G
;""G H
public&& 
const&& 
	YearMonth&& 
FiscalYearBaseMonth&& 2
=&&3 4
	YearMonth&&5 >
.&&> ?
July&&? C
;&&C D
public'' 
const'' 
int'' $
FiscalWeeksPerShortMonth'' 1
=''2 3
$num''4 5
;''5 6
public(( 
const(( 
int(( #
FiscalWeeksPerLongMonth(( 0
=((1 2
$num((3 4
;((4 5
public)) 
const)) 
int)) #
FiscalWeeksPerLeapMonth)) 0
=))1 2
$num))3 4
;))4 5
public** 
const** 
int** !
FiscalWeeksPerQuarter** .
=**/ 0
$num**1 2
***3 4$
FiscalWeeksPerShortMonth**5 M
+**N O#
FiscalWeeksPerLongMonth**P g
;**g h
public++ 
const++ 
int++ %
FiscalWeeksPerLeapQuarter++ 2
=++3 4!
FiscalWeeksPerQuarter++5 J
+++K L
$num++M N
;++N O
public,, 
const,, 
int,, "
FiscalWeeksPerHalfyear,, /
=,,0 1!
FiscalWeeksPerQuarter,,2 G
*,,H I
QuartersPerHalfyear,,J ]
;,,] ^
public-- 
const-- 
int-- &
FiscalWeeksPerLeapHalfyear-- 3
=--4 5"
FiscalWeeksPerHalfyear--6 L
+--M N
$num--O P
;--P Q
public.. 
const.. 
int.. 
FiscalWeeksPerYear.. +
=.., -!
FiscalWeeksPerQuarter... C
*..D E
QuartersPerYear..F U
;..U V
public// 
const// 
int// "
FiscalWeeksPerLeapYear// /
=//0 1
FiscalWeeksPerYear//2 D
+//E F
$num//G H
;//H I
public11 
const11 
int11 #
FiscalDaysPerShortMonth11 0
=111 2$
FiscalWeeksPerShortMonth113 K
*11L M
DaysPerWeek11N Y
;11Y Z
public22 
const22 
int22 "
FiscalDaysPerLongMonth22 /
=220 1#
FiscalWeeksPerLongMonth222 I
*22J K
DaysPerWeek22L W
;22W X
public33 
const33 
int33 "
FiscalDaysPerLeapMonth33 /
=330 1#
FiscalWeeksPerLeapMonth332 I
*33J K
DaysPerWeek33L W
;33W X
public44 
const44 
int44  
FiscalDaysPerQuarter44 -
=44. /
$num440 1
*442 3#
FiscalDaysPerShortMonth444 K
+44L M"
FiscalDaysPerLongMonth44N d
;44d e
public55 
const55 
int55 $
FiscalDaysPerLeapQuarter55 1
=552 3 
FiscalDaysPerQuarter554 H
+55I J
DaysPerWeek55K V
;55V W
public66 
const66 
int66 !
FiscalDaysPerHalfyear66 .
=66/ 0 
FiscalDaysPerQuarter661 E
*66F G
QuartersPerHalfyear66H [
;66[ \
public77 
const77 
int77 %
FiscalDaysPerLeapHalfyear77 2
=773 4!
FiscalDaysPerHalfyear775 J
+77K L
DaysPerWeek77M X
;77X Y
public88 
const88 
int88 
FiscalDaysPerYear88 *
=88+ , 
FiscalDaysPerQuarter88- A
*88B C
QuartersPerYear88D S
;88S T
public99 
const99 
int99 !
FiscalDaysPerLeapYear99 .
=99/ 0
FiscalDaysPerYear991 B
+99C D
DaysPerWeek99E P
;99P Q
public== 
static== 
	YearMonth== 
[==  
]==  !
FirstHalfyearMonths==" 5
===6 7
new==8 ;
[==; <
]==< =
{==> ?
	YearMonth==@ I
.==I J
January==J Q
,==Q R
	YearMonth==S \
.==\ ]
February==] e
,==e f
	YearMonth==g p
.==p q
March==q v
,==v w
	YearMonth	==x �
.
==� �
April
==� �
,
==� �
	YearMonth
==� �
.
==� �
May
==� �
,
==� �
	YearMonth
==� �
.
==� �
June
==� �
}
==� �
;
==� �
public>> 
static>> 
	YearMonth>> 
[>>  
]>>  ! 
SecondHalfyearMonths>>" 6
=>>7 8
new>>9 <
[>>< =
]>>= >
{>>? @
	YearMonth>>A J
.>>J K
July>>K O
,>>O P
	YearMonth>>Q Z
.>>Z [
August>>[ a
,>>a b
	YearMonth>>c l
.>>l m
	September>>m v
,>>v w
	YearMonth	>>x �
.
>>� �
October
>>� �
,
>>� �
	YearMonth
>>� �
.
>>� �
November
>>� �
,
>>� �
	YearMonth
>>� �
.
>>� �
December
>>� �
}
>>� �
;
>>� �
publicBB 
constBB 
intBB "
FirstQuarterMonthIndexBB /
=BB0 1
$numBB2 3
;BB3 4
publicCC 
constCC 
intCC #
SecondQuarterMonthIndexCC 0
=CC1 2"
FirstQuarterMonthIndexCC3 I
+CCJ K
MonthsPerQuarterCCL \
;CC\ ]
publicDD 
constDD 
intDD "
ThirdQuarterMonthIndexDD /
=DD0 1#
SecondQuarterMonthIndexDD2 I
+DDJ K
MonthsPerQuarterDDL \
;DD\ ]
publicEE 
constEE 
intEE #
FourthQuarterMonthIndexEE 0
=EE1 2"
ThirdQuarterMonthIndexEE3 I
+EEJ K
MonthsPerQuarterEEL \
;EE\ ]
publicGG 
staticGG 
	YearMonthGG 
[GG  
]GG  !
FirstQuarterMonthsGG" 4
=GG5 6
newGG7 :
[GG: ;
]GG; <
{GG= >
	YearMonthGG? H
.GGH I
JanuaryGGI P
,GGP Q
	YearMonthGGR [
.GG[ \
FebruaryGG\ d
,GGd e
	YearMonthGGf o
.GGo p
MarchGGp u
}GGv w
;GGw x
publicHH 
staticHH 
	YearMonthHH 
[HH  
]HH  !
SecondQuarterMonthsHH" 5
=HH6 7
newHH8 ;
[HH; <
]HH< =
{HH> ?
	YearMonthHH@ I
.HHI J
AprilHHJ O
,HHO P
	YearMonthHHQ Z
.HHZ [
MayHH[ ^
,HH^ _
	YearMonthHH` i
.HHi j
JuneHHj n
}HHo p
;HHp q
publicII 
staticII 
	YearMonthII 
[II  
]II  !
ThirdQuarterMonthsII" 4
=II5 6
newII7 :
[II: ;
]II; <
{II= >
	YearMonthII? H
.IIH I
JulyIII M
,IIM N
	YearMonthIIO X
.IIX Y
AugustIIY _
,II_ `
	YearMonthIIa j
.IIj k
	SeptemberIIk t
}IIu v
;IIv w
publicJJ 
staticJJ 
	YearMonthJJ 
[JJ  
]JJ  !
FourthQuarterMonthsJJ" 5
=JJ6 7
newJJ8 ;
[JJ; <
]JJ< =
{JJ> ?
	YearMonthJJ@ I
.JJI J
OctoberJJJ Q
,JJQ R
	YearMonthJJS \
.JJ\ ]
NovemberJJ] e
,JJe f
	YearMonthJJg p
.JJp q
DecemberJJq y
}JJz {
;JJ{ |
publicNN 
staticNN 
readonlyNN 
TimeSpanNN '

NoDurationNN( 2
=NN3 4
TimeSpanNN5 =
.NN= >
ZeroNN> B
;NNB C
publicOO 
staticOO 
readonlyOO 
TimeSpanOO '
MinPositiveDurationOO( ;
=OO< =
newOO> A
TimeSpanOOB J
(OOJ K
$numOOK L
)OOL M
;OOM N
publicPP 
staticPP 
readonlyPP 
TimeSpanPP '
MinNegativeDurationPP( ;
=PP< =
newPP> A
TimeSpanPPB J
(PPJ K
-PPK L
$numPPL M
)PPM N
;PPN O
publicTT 
staticTT 
readonlyTT 
DateTimeTT '

=TT6 7
DateTimeTT8 @
.TT@ A
MinValueTTA I
;TTI J
publicUU 
staticUU 
readonlyUU 
DateTimeUU '

=UU6 7
DateTimeUU8 @
.UU@ A
MaxValueUUA I
;UUI J
publicVV 
staticVV 
readonlyVV 
TimeSpanVV '
MinPeriodDurationVV( 9
=VV: ;
TimeSpanVV< D
.VVD E
ZeroVVE I
;VVI J
publicWW 
staticWW 
readonlyWW 
TimeSpanWW '
MaxPeriodDurationWW( 9
=WW: ;

-WWJ K

;WWY Z
}YY 
}[[ ȱ
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeTool.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 

TimePeriod )
{ 
public 

static 
class 
TimeTool  
{ 
public 
static 
DateTime 
GetDate &
(& '
DateTime' /
dateTime0 8
)8 9
{ 	
return 
dateTime 
. 
Date  
;  !
} 	
public 
static 
DateTime 
SetDate &
(& '
DateTime' /
from0 4
,4 5
DateTime6 >
to? A
)A B
{ 	
return 
SetDate 
( 
from 
,  
to! #
.# $
Year$ (
,( )
to* ,
., -
Month- 2
,2 3
to4 6
.6 7
Day7 :
): ;
;; <
} 	
public!! 
static!! 
DateTime!! 
SetDate!! &
(!!& '
DateTime!!' /
from!!0 4
,!!4 5
int!!6 9
year!!: >
,!!> ?
int!!@ C
month!!D I
=!!J K
$num!!L M
,!!M N
int!!O R
day!!S V
=!!W X
$num!!Y Z
)!!Z [
{"" 	
return## 
new## 
DateTime## 
(##  
year##  $
,##$ %
month##& +
,##+ ,
day##- 0
,##0 1
from##2 6
.##6 7
Hour##7 ;
,##; <
from##= A
.##A B
Minute##B H
,##H I
from##J N
.##N O
Second##O U
,##U V
from##W [
.##[ \
Millisecond##\ g
)##g h
;##h i
}$$ 	
public'' 
static'' 
bool'' 
HasTimeOfDay'' '
(''' (
DateTime''( 0
dateTime''1 9
)''9 :
{(( 	
return)) 
dateTime)) 
.)) 
	TimeOfDay)) %
>))& '
TimeSpan))( 0
.))0 1
Zero))1 5
;))5 6
}** 	
public-- 
static-- 
DateTime-- 
SetTimeOfDay-- +
(--+ ,
DateTime--, 4
from--5 9
,--9 :
DateTime--; C
to--D F
)--F G
{.. 	
return// 
SetTimeOfDay// 
(//  
from//  $
,//$ %
to//& (
.//( )
Hour//) -
,//- .
to/// 1
.//1 2
Minute//2 8
,//8 9
to//: <
.//< =
Second//= C
,//C D
to//E G
.//G H
Millisecond//H S
)//S T
;//T U
}00 	
public33 
static33 
DateTime33 
SetTimeOfDay33 +
(33+ ,
DateTime33, 4
from335 9
,339 :
int33; >
hour33? C
=33D E
$num33F G
,33G H
int33I L
minute33M S
=33T U
$num33V W
,33W X
int33Y \
second33] c
=33d e
$num33f g
,33g h
int33i l
millisecond33m x
=33y z
$num33{ |
)33| }
{44 	
return55 
new55 
DateTime55 
(55  
from55  $
.55$ %
Year55% )
,55) *
from55+ /
.55/ 0
Month550 5
,555 6
from557 ;
.55; <
Day55< ?
,55? @
hour55A E
,55E F
minute55G M
,55M N
second55O U
,55U V
millisecond55W b
)55b c
;55c d
}66 	
public== 
static== 
int== 
	GetYearOf== #
(==# $
	YearMonth==$ -

,==; <
DateTime=== E
moment==F L
)==L M
{>> 	
return?? 
	GetYearOf?? 
(?? 

,??* +
moment??, 2
.??2 3
Year??3 7
,??7 8
moment??9 ?
.??? @
Month??@ E
)??E F
;??F G
}@@ 	
publicCC 
staticCC 
intCC 
	GetYearOfCC #
(CC# $
	YearMonthCC$ -

,CC; <
intCC= @
yearCCA E
,CCE F
intCCG J
monthCCK P
)CCP Q
{DD 	
returnEE 
monthEE 
>=EE 
(EE 
intEE  
)EE  !

?EE/ 0
yearEE1 5
:EE6 7
yearEE8 <
-EE= >
$numEE? @
;EE@ A
}FF 	
publicMM 
staticMM 
voidMM 
NextHalfyearMM '
(MM' (
YearHalfyearMM( 4

,MMB C
outMMD G
intMMH K
yearMML P
,MMP Q
outMMR U
YearHalfyearMMV b
halfyearMMc k
)MMk l
{NN 	
AddHalfyearOO 
(OO 

,OO% &
$numOO' (
,OO( )
outOO* -
yearOO. 2
,OO2 3
outOO4 7
halfyearOO8 @
)OO@ A
;OOA B
}PP 	
publicSS 
staticSS 
voidSS 
PreviousHalfyearSS +
(SS+ ,
YearHalfyearSS, 8

,SSF G
outSSH K
intSSL O
yearSSP T
,SST U
outSSV Y
YearHalfyearSSZ f
halfyearSSg o
)SSo p
{TT 	
AddHalfyearUU 
(UU 

,UU% &
-UU' (
$numUU( )
,UU) *
outUU+ .
yearUU/ 3
,UU3 4
outUU5 8
halfyearUU9 A
)UUA B
;UUB C
}VV 	
publicYY 
staticYY 
voidYY 
AddHalfyearYY &
(YY& '
YearHalfyearYY' 3

,YYA B
intYYC F
countYYG L
,YYL M
outYYN Q
intYYR U
yearYYV Z
,YYZ [
outYY\ _
YearHalfyearYY` l
halfyearYYm u
)YYu v
{ZZ 	
AddHalfyear[[ 
([[ 
$num[[ 
,[[ 

,[[( )
count[[* /
,[[/ 0
out[[1 4
year[[5 9
,[[9 :
out[[; >
halfyear[[? G
)[[G H
;[[H I
}\\ 	
public__ 
static__ 
void__ 
AddHalfyear__ &
(__& '
int__' *
	startYear__+ 4
,__4 5
YearHalfyear__6 B

,__P Q
int__R U
count__V [
,__[ \
out__] `
int__a d
year__e i
,__i j
out__k n
YearHalfyear__o {
halfyear	__| �
)
__� �
{`` 	
intaa 

offsetYearaa 
=aa 
Mathaa !
.aa! "
Absaa" %
(aa% &
countaa& +
)aa+ ,
/aa- .
TimeSpecaa/ 7
.aa7 8
HalfyearsPerYearaa8 H
+aaI J
$numaaK L
;aaL M
intbb 
startHalfyearCountbb "
=bb# $
(bb% &
	startYearbb& /
+bb0 1

offsetYearbb2 <
)bb< =
*bb> ?
TimeSpecbb@ H
.bbH I
HalfyearsPerYearbbI Y
+bbZ [
(bb\ ]
(bb] ^
intbb^ a
)bba b

-bbp q
$numbbr s
)bbs t
;bbt u
intcc 
targetHalfyearCountcc #
=cc$ %
startHalfyearCountcc& 8
+cc9 :
countcc; @
;cc@ A
yearee 
=ee 
targetHalfyearCountee &
/ee' (
TimeSpecee) 1
.ee1 2
HalfyearsPerYearee2 B
-eeC D

offsetYeareeE O
;eeO P
halfyearff 
=ff 
(ff 
YearHalfyearff $
)ff$ %
(ff% &
targetHalfyearCountff& 9
%ff: ;
TimeSpecff< D
.ffD E
HalfyearsPerYearffE U
+ffV W
$numffX Y
)ffY Z
;ffZ [
}gg 	
publicjj 
staticjj 
YearHalfyearjj "
GetHalfyearOfMonthjj# 5
(jj5 6
	YearMonthjj6 ?
	yearMonthjj@ I
)jjI J
{kk 	
returnll 
GetHalfyearOfMonthll %
(ll% &
TimeSpecll& .
.ll. /"
CalendarYearStartMonthll/ E
,llE F
	yearMonthllG P
)llP Q
;llQ R
}mm 	
publicpp 
staticpp 
YearHalfyearpp "
GetHalfyearOfMonthpp# 5
(pp5 6
	YearMonthpp6 ?

,ppM N
	YearMonthppO X
	yearMonthppY b
)ppb c
{qq 	
intrr 
yearMonthIndexrr 
=rr  
(rr! "
intrr" %
)rr% &
	yearMonthrr& /
-rr0 1
$numrr2 3
;rr3 4
intss 
yearStartMonthIndexss #
=ss$ %
(ss& '
intss' *
)ss* +

-ss9 :
$numss; <
;ss< =
iftt 
(tt 
yearMonthIndextt 
<tt  
yearStartMonthIndextt! 4
)tt4 5
{uu 
yearMonthIndexvv 
+=vv !
TimeSpecvv" *
.vv* +

;vv8 9
}ww 
intxx 
deltaMonthsxx 
=xx 
yearMonthIndexxx ,
-xx- .
yearStartMonthIndexxx/ B
;xxB C
returnyy 
(yy 
YearHalfyearyy  
)yy  !
(yy! "
deltaMonthsyy" -
/yy. /
TimeSpecyy0 8
.yy8 9
MonthsPerHalfyearyy9 J
+yyK L
$numyyM N
)yyN O
;yyO P
}zz 	
public}} 
static}} 
	YearMonth}} 
[}}  
]}}  !
GetMonthsOfHalfyear}}" 5
(}}5 6
YearHalfyear}}6 B
yearHalfyear}}C O
)}}O P
{~~ 	
switch 
( 
yearHalfyear  
)  !
{
�� 
case
�� 
YearHalfyear
�� !
.
��! "
First
��" '
:
��' (
return
�� 
TimeSpec
�� #
.
��# $!
FirstHalfyearMonths
��$ 7
;
��7 8
case
�� 
YearHalfyear
�� !
.
��! "
Second
��" (
:
��( )
return
�� 
TimeSpec
�� #
.
��# $"
SecondHalfyearMonths
��$ 8
;
��8 9
}
�� 
throw
�� 
new
�� '
InvalidOperationException
�� /
(
��/ 0
$str
��0 H
+
��I J
yearHalfyear
��K W
)
��W X
;
��X Y
}
�� 	
public
�� 
static
�� 
void
�� 
NextQuarter
�� &
(
��& '
YearQuarter
��' 2
startQuarter
��3 ?
,
��? @
out
��A D
int
��E H
year
��I M
,
��M N
out
��O R
YearQuarter
��S ^
quarter
��_ f
)
��f g
{
�� 	

AddQuarter
�� 
(
�� 
startQuarter
�� #
,
��# $
$num
��% &
,
��& '
out
��( +
year
��, 0
,
��0 1
out
��2 5
quarter
��6 =
)
��= >
;
��> ?
}
�� 	
public
�� 
static
�� 
void
�� 
PreviousQuarter
�� *
(
��* +
YearQuarter
��+ 6
startQuarter
��7 C
,
��C D
out
��E H
int
��I L
year
��M Q
,
��Q R
out
��S V
YearQuarter
��W b
quarter
��c j
)
��j k
{
�� 	

AddQuarter
�� 
(
�� 
startQuarter
�� #
,
��# $
-
��% &
$num
��& '
,
��' (
out
��) ,
year
��- 1
,
��1 2
out
��3 6
quarter
��7 >
)
��> ?
;
��? @
}
�� 	
public
�� 
static
�� 
void
�� 

AddQuarter
�� %
(
��% &
YearQuarter
��& 1
startQuarter
��2 >
,
��> ?
int
��@ C
count
��D I
,
��I J
out
��K N
int
��O R
year
��S W
,
��W X
out
��Y \
YearQuarter
��] h
quarter
��i p
)
��p q
{
�� 	

AddQuarter
�� 
(
�� 
$num
�� 
,
�� 
startQuarter
�� &
,
��& '
count
��( -
,
��- .
out
��/ 2
year
��3 7
,
��7 8
out
��9 <
quarter
��= D
)
��D E
;
��E F
}
�� 	
public
�� 
static
�� 
void
�� 

AddQuarter
�� %
(
��% &
int
��& )
	startYear
��* 3
,
��3 4
YearQuarter
��5 @
startQuarter
��A M
,
��M N
int
��O R
count
��S X
,
��X Y
out
��Z ]
int
��^ a
year
��b f
,
��f g
out
��h k
YearQuarter
��l w
quarter
��x 
)�� �
{
�� 	
int
�� 

offsetYear
�� 
=
�� 
Math
�� !
.
��! "
Abs
��" %
(
��% &
count
��& +
)
��+ ,
/
��- .
TimeSpec
��/ 7
.
��7 8
QuartersPerYear
��8 G
+
��H I
$num
��J K
;
��K L
int
�� 
startQuarterCount
�� !
=
��" #
(
��$ %
	startYear
��% .
+
��/ 0

offsetYear
��1 ;
)
��; <
*
��= >
TimeSpec
��? G
.
��G H
QuartersPerYear
��H W
+
��X Y
(
��Z [
(
��[ \
int
��\ _
)
��_ `
startQuarter
��` l
-
��m n
$num
��o p
)
��p q
;
��q r
int
��  
targetQuarterCount
�� "
=
��# $
startQuarterCount
��% 6
+
��7 8
count
��9 >
;
��> ?
year
�� 
=
��  
targetQuarterCount
�� %
/
��& '
TimeSpec
��( 0
.
��0 1
QuartersPerYear
��1 @
-
��A B

offsetYear
��C M
;
��M N
quarter
�� 
=
�� 
(
�� 
YearQuarter
�� "
)
��" #
(
��# $ 
targetQuarterCount
��$ 6
%
��7 8
TimeSpec
��9 A
.
��A B
QuartersPerYear
��B Q
+
��R S
$num
��T U
)
��U V
;
��V W
}
�� 	
public
�� 
static
�� 
YearQuarter
�� !
GetQuarterOfMonth
��" 3
(
��3 4
	YearMonth
��4 =
	yearMonth
��> G
)
��G H
{
�� 	
return
�� 
GetQuarterOfMonth
�� $
(
��$ %
TimeSpec
��% -
.
��- .$
CalendarYearStartMonth
��. D
,
��D E
	yearMonth
��F O
)
��O P
;
��P Q
}
�� 	
public
�� 
static
�� 
YearQuarter
�� !
GetQuarterOfMonth
��" 3
(
��3 4
	YearMonth
��4 =

��> K
,
��K L
	YearMonth
��M V
	yearMonth
��W `
)
��` a
{
�� 	
int
�� 
yearMonthIndex
�� 
=
��  
(
��! "
int
��" %
)
��% &
	yearMonth
��& /
-
��0 1
$num
��2 3
;
��3 4
int
�� !
yearStartMonthIndex
�� #
=
��$ %
(
��& '
int
��' *
)
��* +

��+ 8
-
��9 :
$num
��; <
;
��< =
if
�� 
(
�� 
yearMonthIndex
�� 
<
��  !
yearStartMonthIndex
��! 4
)
��4 5
{
�� 
yearMonthIndex
�� 
+=
�� !
TimeSpec
��" *
.
��* +

��+ 8
;
��8 9
}
�� 
int
�� 
deltaMonths
�� 
=
�� 
yearMonthIndex
�� ,
-
��- .!
yearStartMonthIndex
��/ B
;
��B C
return
�� 
(
�� 
YearQuarter
�� 
)
��  
(
��  !
deltaMonths
��! ,
/
��- .
TimeSpec
��/ 7
.
��7 8
MonthsPerQuarter
��8 H
+
��I J
$num
��K L
)
��L M
;
��M N
}
�� 	
public
�� 
static
�� 
	YearMonth
�� 
[
��  
]
��  ! 
GetMonthsOfQuarter
��" 4
(
��4 5
YearQuarter
��5 @
yearQuarter
��A L
)
��L M
{
�� 	
switch
�� 
(
�� 
yearQuarter
�� 
)
��  
{
�� 
case
�� 
YearQuarter
��  
.
��  !
First
��! &
:
��& '
return
�� 
TimeSpec
�� #
.
��# $ 
FirstQuarterMonths
��$ 6
;
��6 7
case
�� 
YearQuarter
��  
.
��  !
Second
��! '
:
��' (
return
�� 
TimeSpec
�� #
.
��# $!
SecondQuarterMonths
��$ 7
;
��7 8
case
�� 
YearQuarter
��  
.
��  !
Third
��! &
:
��& '
return
�� 
TimeSpec
�� #
.
��# $ 
ThirdQuarterMonths
��$ 6
;
��6 7
case
�� 
YearQuarter
��  
.
��  !
Fourth
��! '
:
��' (
return
�� 
TimeSpec
�� #
.
��# $!
FourthQuarterMonths
��$ 7
;
��7 8
}
�� 
throw
�� 
new
�� '
InvalidOperationException
�� /
(
��/ 0
$str
��0 G
+
��H I
yearQuarter
��J U
)
��U V
;
��V W
}
�� 	
public
�� 
static
�� 
void
�� 
	NextMonth
�� $
(
��$ %
	YearMonth
��% .

startMonth
��/ 9
,
��9 :
out
��; >
int
��? B
year
��C G
,
��G H
out
��I L
	YearMonth
��M V
month
��W \
)
��\ ]
{
�� 	
AddMonth
�� 
(
�� 

startMonth
�� 
,
��  
$num
��! "
,
��" #
out
��$ '
year
��( ,
,
��, -
out
��. 1
month
��2 7
)
��7 8
;
��8 9
}
�� 	
public
�� 
static
�� 
void
�� 

�� (
(
��( )
	YearMonth
��) 2

startMonth
��3 =
,
��= >
out
��? B
int
��C F
year
��G K
,
��K L
out
��M P
	YearMonth
��Q Z
month
��[ `
)
��` a
{
�� 	
AddMonth
�� 
(
�� 

startMonth
�� 
,
��  
-
��! "
$num
��" #
,
��# $
out
��% (
year
��) -
,
��- .
out
��/ 2
month
��3 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
static
�� 
void
�� 
AddMonth
�� #
(
��# $
	YearMonth
��$ -

startMonth
��. 8
,
��8 9
int
��: =
count
��> C
,
��C D
out
��E H
int
��I L
year
��M Q
,
��Q R
out
��S V
	YearMonth
��W `
month
��a f
)
��f g
{
�� 	
AddMonth
�� 
(
�� 
$num
�� 
,
�� 

startMonth
�� "
,
��" #
count
��$ )
,
��) *
out
��+ .
year
��/ 3
,
��3 4
out
��5 8
month
��9 >
)
��> ?
;
��? @
}
�� 	
public
�� 
static
�� 
void
�� 
AddMonth
�� #
(
��# $
int
��$ '
	startYear
��( 1
,
��1 2
	YearMonth
��3 <

startMonth
��= G
,
��G H
int
��I L
count
��M R
,
��R S
out
��T W
int
��X [
year
��\ `
,
��` a
out
��b e
	YearMonth
��f o
month
��p u
)
��u v
{
�� 	
int
�� 

offsetYear
�� 
=
�� 
Math
�� !
.
��! "
Abs
��" %
(
��% &
count
��& +
)
��+ ,
/
��- .
TimeSpec
��/ 7
.
��7 8

��8 E
+
��F G
$num
��H I
;
��I J
int
�� 
startMonthCount
�� 
=
��  !
(
��" #
	startYear
��# ,
+
��- .

offsetYear
��/ 9
)
��9 :
*
��; <
TimeSpec
��= E
.
��E F

��F S
+
��T U
(
��V W
(
��W X
int
��X [
)
��[ \

startMonth
��\ f
-
��g h
$num
��i j
)
��j k
;
��k l
int
�� 
targetMonthCount
��  
=
��! "
startMonthCount
��# 2
+
��3 4
count
��5 :
;
��: ;
year
�� 
=
�� 
targetMonthCount
�� #
/
��$ %
TimeSpec
��& .
.
��. /

��/ <
-
��= >

offsetYear
��? I
;
��I J
month
�� 
=
�� 
(
�� 
	YearMonth
�� 
)
�� 
(
��  
targetMonthCount
��  0
%
��1 2
TimeSpec
��3 ;
.
��; <

��< I
+
��J K
$num
��L M
)
��M N
;
��N O
}
�� 	
public
�� 
static
�� 
int
�� 
GetDaysInMonth
�� (
(
��( )
int
��) ,
year
��- 1
,
��1 2
int
��3 6
month
��7 <
)
��< =
{
�� 	
DateTime
�� 
firstDay
�� 
=
�� 
new
��  #
DateTime
��$ ,
(
��, -
year
��- 1
,
��1 2
month
��3 8
,
��8 9
$num
��: ;
)
��; <
;
��< =
return
�� 
firstDay
�� 
.
�� 
	AddMonths
�� %
(
��% &
$num
��& '
)
��' (
.
��( )
AddDays
��) 0
(
��0 1
-
��1 2
$num
��2 3
)
��3 4
.
��4 5
Day
��5 8
;
��8 9
}
�� 	
public
�� 
static
�� 
DateTime
�� 
GetStartOfWeek
�� -
(
��- .
DateTime
��. 6
time
��7 ;
,
��; <
	DayOfWeek
��= F
firstDayOfWeek
��G U
)
��U V
{
�� 	
DateTime
�� 

currentDay
�� 
=
��  !
new
��" %
DateTime
��& .
(
��. /
time
��/ 3
.
��3 4
Year
��4 8
,
��8 9
time
��: >
.
��> ?
Month
��? D
,
��D E
time
��F J
.
��J K
Day
��K N
)
��N O
;
��O P
while
�� 
(
�� 

currentDay
�� 
.
�� 
	DayOfWeek
�� '
!=
��( *
firstDayOfWeek
��+ 9
)
��9 :
{
�� 

currentDay
�� 
=
�� 

currentDay
�� '
.
��' (
AddDays
��( /
(
��/ 0
-
��0 1
$num
��1 2
)
��2 3
;
��3 4
}
�� 
return
�� 

currentDay
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� 

�� (
(
��( )
DateTime
��) 1
moment
��2 8
,
��8 9
CultureInfo
��: E
culture
��F M
,
��M N
YearWeekType
��O [
yearWeekType
��\ h
,
��h i
out
�� 
int
�� 
year
�� 
,
�� 
out
�� 
int
�� !

weekOfYear
��" ,
)
��, -
{
�� 	

�� 
(
�� 
moment
��  
,
��  !
culture
��" )
,
��) *
culture
��+ 2
.
��2 3
DateTimeFormat
��3 A
.
��A B
CalendarWeekRule
��B R
,
��R S
culture
��T [
.
��[ \
DateTimeFormat
��\ j
.
��j k
FirstDayOfWeek
��k y
,
��y z
yearWeekType��{ �
,��� �
out
�� 
year
�� 
,
�� 
out
�� 

weekOfYear
�� (
)
��( )
;
��) *
}
�� 	
public
�� 
static
�� 
void
�� 

�� (
(
��( )
DateTime
��) 1
moment
��2 8
,
��8 9
CultureInfo
��: E
culture
��F M
,
��M N
CalendarWeekRule
�� 
weekRule
�� %
,
��% &
	DayOfWeek
��' 0
firstDayOfWeek
��1 ?
,
��? @
YearWeekType
��A M
yearWeekType
��N Z
,
��Z [
out
��\ _
int
��` c
year
��d h
,
��h i
out
��j m
int
��n q

weekOfYear
��r |
)
��| }
{
�� 	
if
�� 
(
�� 
culture
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 9
)
��9 :
;
��: ;
}
�� 
if
�� 
(
�� 
yearWeekType
�� 
==
�� 
YearWeekType
��  ,
.
��, -
Iso8601
��- 4
&&
��5 7
weekRule
��8 @
==
��A C
CalendarWeekRule
��D T
.
��T U
FirstFourDayWeek
��U e
)
��e f
{
�� 
	DayOfWeek
�� 
day
�� 
=
�� 
culture
��  '
.
��' (
Calendar
��( 0
.
��0 1
GetDayOfWeek
��1 =
(
��= >
moment
��> D
)
��D E
;
��E F
if
�� 
(
�� 
day
�� 
>=
�� 
firstDayOfWeek
�� )
&&
��* ,
(
��- .
int
��. 1
)
��1 2
day
��2 5
<=
��6 8
(
��9 :
int
��: =
)
��= >
(
��> ?
firstDayOfWeek
��? M
+
��N O
$num
��P Q
)
��Q R
%
��S T
$num
��U V
)
��V W
{
�� 
moment
�� 
=
�� 
moment
�� #
.
��# $
AddDays
��$ +
(
��+ ,
$num
��, -
)
��- .
;
��. /
}
�� 
}
�� 

weekOfYear
�� 
=
�� 
culture
��  
.
��  !
Calendar
��! )
.
��) *

��* 7
(
��7 8
moment
��8 >
,
��> ?
weekRule
��@ H
,
��H I
firstDayOfWeek
��J X
)
��X Y
;
��Y Z
year
�� 
=
�� 
moment
�� 
.
�� 
Year
�� 
;
�� 
if
�� 
(
�� 

weekOfYear
�� 
>=
�� 
$num
��  
&&
��! #
moment
��$ *
.
��* +
Month
��+ 0
<
��1 2
$num
��3 5
)
��5 6
{
�� 
year
�� 
--
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
int
�� 
GetWeeksOfYear
�� (
(
��( )
int
��) ,
year
��- 1
,
��1 2
CultureInfo
��3 >
culture
��? F
,
��F G
YearWeekType
��H T
yearWeekType
��U a
)
��a b
{
�� 	
return
�� 
GetWeeksOfYear
�� !
(
��! "
year
��" &
,
��& '
culture
��( /
,
��/ 0
culture
��1 8
.
��8 9
DateTimeFormat
��9 G
.
��G H
CalendarWeekRule
��H X
,
��X Y
culture
��Z a
.
��a b
DateTimeFormat
��b p
.
��p q
FirstDayOfWeek
��q 
,�� �
yearWeekType��� �
)��� �
;��� �
}
�� 	
public
�� 
static
�� 
int
�� 
GetWeeksOfYear
�� (
(
��( )
int
��) ,
year
��- 1
,
��1 2
CultureInfo
��3 >
culture
��? F
,
��F G
CalendarWeekRule
�� 
weekRule
�� %
,
��% &
	DayOfWeek
��' 0
firstDayOfWeek
��1 ?
,
��? @
YearWeekType
��A M
yearWeekType
��N Z
)
��Z [
{
�� 	
if
�� 
(
�� 
culture
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 9
)
��9 :
;
��: ;
}
�� 
int
�� 
currentYear
�� 
;
�� 
int
�� 
currentWeek
�� 
;
�� 
DateTime
�� 

currentDay
�� 
=
��  !
new
��" %
DateTime
��& .
(
��. /
year
��/ 3
,
��3 4
$num
��5 7
,
��7 8
$num
��9 ;
)
��; <
;
��< =

�� 
(
�� 

currentDay
�� $
,
��$ %
culture
��& -
,
��- .
weekRule
��/ 7
,
��7 8
firstDayOfWeek
��9 G
,
��G H
yearWeekType
��I U
,
��U V
out
��W Z
currentYear
��[ f
,
��f g
out
��h k
currentWeek
��l w
)
��w x
;
��x y
while
�� 
(
�� 
currentYear
�� 
!=
�� !
year
��" &
)
��& '
{
�� 

currentDay
�� 
=
�� 

currentDay
�� '
.
��' (
AddDays
��( /
(
��/ 0
-
��0 1
$num
��1 2
)
��2 3
;
��3 4

�� 
(
�� 

currentDay
�� (
,
��( )
culture
��* 1
,
��1 2
weekRule
��3 ;
,
��; <
firstDayOfWeek
��= K
,
��K L
yearWeekType
��M Y
,
��Y Z
out
��[ ^
currentYear
��_ j
,
��j k
out
��l o
currentWeek
��p {
)
��{ |
;
��| }
}
�� 
return
�� 
currentWeek
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
DateTime
��  
GetStartOfYearWeek
�� 1
(
��1 2
int
��2 5
year
��6 :
,
��: ;
int
��< ?

weekOfYear
��@ J
,
��J K
CultureInfo
��L W
culture
��X _
,
��_ `
YearWeekType
��a m
yearWeekType
��n z
)
��z {
{
�� 	
if
�� 
(
�� 
culture
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 9
)
��9 :
;
��: ;
}
�� 
return
��  
GetStartOfYearWeek
�� %
(
��% &
year
��& *
,
��* +

weekOfYear
��, 6
,
��6 7
culture
��8 ?
,
��? @
culture
�� 
.
�� 
DateTimeFormat
�� &
.
��& '
CalendarWeekRule
��' 7
,
��7 8
culture
��9 @
.
��@ A
DateTimeFormat
��A O
.
��O P
FirstDayOfWeek
��P ^
,
��^ _
yearWeekType
��` l
)
��l m
;
��m n
}
�� 	
public
�� 
static
�� 
DateTime
��  
GetStartOfYearWeek
�� 1
(
��1 2
int
��2 5
year
��6 :
,
��: ;
int
��< ?

weekOfYear
��@ J
,
��J K
CultureInfo
��L W
culture
��X _
,
��_ `
CalendarWeekRule
�� 
weekRule
�� %
,
��% &
	DayOfWeek
��' 0
firstDayOfWeek
��1 ?
,
��? @
YearWeekType
��A M
yearWeekType
��N Z
)
��Z [
{
�� 	
if
�� 
(
�� 
culture
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 9
)
��9 :
;
��: ;
}
�� 
if
�� 
(
�� 

weekOfYear
�� 
<
�� 
$num
�� 
)
�� 
{
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 5
(
��5 6
$str
��6 B
)
��B C
;
��C D
}
�� 
DateTime
�� 
dateTime
�� 
=
�� 
new
��  #
DateTime
��$ ,
(
��, -
year
��- 1
,
��1 2
$num
��3 4
,
��4 5
$num
��6 7
)
��7 8
.
��8 9
AddDays
��9 @
(
��@ A

weekOfYear
��A K
*
��L M
TimeSpec
��N V
.
��V W
DaysPerWeek
��W b
)
��b c
;
��c d
int
�� 
currentYear
�� 
;
�� 
int
�� 
currentWeek
�� 
;
�� 

�� 
(
�� 
dateTime
�� "
,
��" #
culture
��$ +
,
��+ ,
weekRule
��- 5
,
��5 6
firstDayOfWeek
��7 E
,
��E F
yearWeekType
��G S
,
��S T
out
��U X
currentYear
��Y d
,
��d e
out
��f i
currentWeek
��j u
)
��u v
;
��v w
while
�� 
(
�� 
currentWeek
�� 
!=
�� !

weekOfYear
��" ,
)
��, -
{
�� 
dateTime
�� 
=
�� 
dateTime
�� #
.
��# $
AddDays
��$ +
(
��+ ,
-
��, -
$num
��- .
)
��. /
;
��/ 0

�� 
(
�� 
dateTime
�� &
,
��& '
culture
��( /
,
��/ 0
weekRule
��1 9
,
��9 :
firstDayOfWeek
��; I
,
��I J
yearWeekType
��K W
,
��W X
out
��Y \
currentYear
��] h
,
��h i
out
��j m
currentWeek
��n y
)
��y z
;
��z {
}
�� 
while
�� 
(
�� 
currentWeek
�� 
==
�� !

weekOfYear
��" ,
)
��, -
{
�� 
dateTime
�� 
=
�� 
dateTime
�� #
.
��# $
AddDays
��$ +
(
��+ ,
-
��, -
$num
��- .
)
��. /
;
��/ 0

�� 
(
�� 
dateTime
�� &
,
��& '
culture
��( /
,
��/ 0
weekRule
��1 9
,
��9 :
firstDayOfWeek
��; I
,
��I J
yearWeekType
��K W
,
��W X
out
��Y \
currentYear
��] h
,
��h i
out
��j m
currentWeek
��n y
)
��y z
;
��z {
}
�� 
return
�� 
dateTime
�� 
.
�� 
AddDays
�� #
(
��# $
$num
��$ %
)
��% &
;
��& '
}
�� 	
public
�� 
static
�� 
DateTime
�� 
DayStart
�� '
(
��' (
DateTime
��( 0
dateTime
��1 9
)
��9 :
{
�� 	
return
�� 
dateTime
�� 
.
�� 
Date
��  
;
��  !
}
�� 	
public
�� 
static
�� 
	DayOfWeek
�� 
NextDay
��  '
(
��' (
	DayOfWeek
��( 1
day
��2 5
)
��5 6
{
�� 	
return
�� 
AddDays
�� 
(
�� 
day
�� 
,
�� 
$num
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
static
�� 
	DayOfWeek
�� 
PreviousDay
��  +
(
��+ ,
	DayOfWeek
��, 5
day
��6 9
)
��9 :
{
�� 	
return
�� 
AddDays
�� 
(
�� 
day
�� 
,
�� 
-
��  !
$num
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
static
�� 
	DayOfWeek
�� 
AddDays
��  '
(
��' (
	DayOfWeek
��( 1
day
��2 5
,
��5 6
int
��7 :
days
��; ?
)
��? @
{
�� 	
if
�� 
(
�� 
days
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
return
�� 
day
�� 
;
�� 
}
�� 
int
�� 
weeks
�� 
=
�� 
Math
�� 
.
�� 
Abs
��  
(
��  !
days
��! %
)
��% &
/
��' (
TimeSpec
��) 1
.
��1 2
DaysPerWeek
��2 =
+
��> ?
$num
��@ A
;
��A B
int
�� 
offset
�� 
=
�� 
weeks
�� 
*
��  
TimeSpec
��! )
.
��) *
DaysPerWeek
��* 5
+
��6 7
(
��8 9
int
��9 <
)
��< =
day
��= @
;
��@ A
int
�� 
targetOffset
�� 
=
�� 
offset
�� %
+
��& '
days
��( ,
;
��, -
return
�� 
(
�� 
	DayOfWeek
�� 
)
�� 
(
�� 
targetOffset
�� +
%
��, -
TimeSpec
��. 6
.
��6 7
DaysPerWeek
��7 B
)
��B C
;
��C D
}
�� 	
}
�� 
}�� �/
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeTrim.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

static 
class 
TimeTrim  
{ 
public 
static 
DateTime 
Month $
($ %
DateTime% -
dateTime. 6
,6 7
int8 ;
month< A
=B C
$numD E
,E F
intG J
dayK N
=O P
$numQ R
,R S
int 
hour 
= 
$num 
, 
int 
minute $
=% &
$num' (
,( )
int* -
second. 4
=5 6
$num7 8
,8 9
int: =
millisecond> I
=J K
$numL M
)M N
{ 	
return 
new 
DateTime 
(  
dateTime  (
.( )
Year) -
,- .
month/ 4
,4 5
day6 9
,9 :
hour; ?
,? @
minuteA G
,G H
secondI O
,O P
millisecondQ \
)\ ]
;] ^
} 	
public 
static 
DateTime 
Day "
(" #
DateTime# +
dateTime, 4
,4 5
int6 9
day: =
=> ?
$num@ A
,A B
int   
hour   
=   
$num   
,   
int   
minute   $
=  % &
$num  ' (
,  ( )
int  * -
second  . 4
=  5 6
$num  7 8
,  8 9
int  : =
millisecond  > I
=  J K
$num  L M
)  M N
{!! 	
return"" 
new"" 
DateTime"" 
(""  
dateTime""  (
.""( )
Year"") -
,""- .
dateTime""/ 7
.""7 8
Month""8 =
,""= >
day""? B
,""B C
hour""D H
,""H I
minute""J P
,""P Q
second""R X
,""X Y
millisecond""Z e
)""e f
;""f g
}## 	
public** 
static** 
DateTime** 
Hour** #
(**# $
DateTime**$ ,
dateTime**- 5
,**5 6
int**7 :
hour**; ?
=**@ A
$num**B C
,**C D
int++ 
minute++ 
=++ 
$num++ 
,++ 
int++ 
second++  &
=++' (
$num++) *
,++* +
int++, /
millisecond++0 ;
=++< =
$num++> ?
)++? @
{,, 	
return-- 
new-- 
DateTime-- 
(--  
dateTime--  (
.--( )
Year--) -
,--- .
dateTime--/ 7
.--7 8
Month--8 =
,--= >
dateTime--? G
.--G H
Day--H K
,--K L
hour--M Q
,--Q R
minute--S Y
,--Y Z
second--[ a
,--a b
millisecond--c n
)--n o
;--o p
}.. 	
public55 
static55 
DateTime55 
Minute55 %
(55% &
DateTime55& .
dateTime55/ 7
,557 8
int559 <
minute55= C
=55D E
$num55F G
,55G H
int55I L
second55M S
=55T U
$num55V W
,55W X
int55Y \
millisecond55] h
=55i j
$num55k l
)55l m
{66 	
return77 
new77 
DateTime77 
(77  
dateTime77  (
.77( )
Year77) -
,77- .
dateTime77/ 7
.777 8
Month778 =
,77= >
dateTime77? G
.77G H
Day77H K
,77K L
dateTime77M U
.77U V
Hour77V Z
,77Z [
minute77\ b
,77b c
second77d j
,77j k
millisecond77l w
)77w x
;77x y
}88 	
public?? 
static?? 
DateTime?? 
Second?? %
(??% &
DateTime??& .
dateTime??/ 7
,??7 8
int??9 <
second??= C
=??D E
$num??F G
,??G H
int??I L
millisecond??M X
=??Y Z
$num??[ \
)??\ ]
{@@ 	
returnAA 
newAA 
DateTimeAA 
(AA  
dateTimeAA  (
.AA( )
YearAA) -
,AA- .
dateTimeAA/ 7
.AA7 8
MonthAA8 =
,AA= >
dateTimeAA? G
.AAG H
DayAAH K
,AAK L
dateTimeAAM U
.AAU V
HourAAV Z
,AAZ [
dateTimeAA\ d
.AAd e
MinuteAAe k
,AAk l
secondAAm s
,AAs t
millisecond	AAu �
)
AA� �
;
AA� �
}BB 	
publicII 
staticII 
DateTimeII 
MillisecondII *
(II* +
DateTimeII+ 3
dateTimeII4 <
,II< =
intII> A
millisecondIIB M
=IIN O
$numIIP Q
)IIQ R
{JJ 	
returnKK 
newKK 
DateTimeKK 
(KK  
dateTimeKK  (
.KK( )
YearKK) -
,KK- .
dateTimeKK/ 7
.KK7 8
MonthKK8 =
,KK= >
dateTimeKK? G
.KKG H
DayKKH K
,KKK L
dateTimeKKM U
.KKU V
HourKKV Z
,KKZ [
dateTimeKK\ d
.KKd e
MinuteKKe k
,KKk l
dateTimeKKm u
.KKu v
SecondKKv |
,KK| }
millisecond	KK~ �
)
KK� �
;
KK� �
}LL 	
}PP 
}RR �3
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\TimeZoneDurationProvider.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

class $
TimeZoneDurationProvider )
:* +
DurationProvider, <
{ 
public $
TimeZoneDurationProvider '
(' (
TimeZoneInfo( 4
timeZone5 =
=> ?
null@ D
,D E
Func 
< 
TimeZoneInfo 
, 
DateTime '
,' (
TimeSpan) 1
[1 2
]2 3
,3 4
DateTime5 =
>= >
ambigiousMoment? N
=O P
nullQ U
,U V
Func 
< 
TimeZoneInfo 
, 
DateTime '
,' (
DateTime) 1
>1 2

=A B
nullC G
)G H
{ 	
if 
( 
timeZone 
== 
null  
)  !
{ 
timeZone 
= 
TimeZoneInfo '
.' (
Local( -
;- .
} 
this 
. 
timeZone 
= 
timeZone $
;$ %
this 
. 
ambigiousMoment  
=! "
ambigiousMoment# 2
;2 3
this 
. 

=  

;. /
} 	
public!! 
TimeZoneInfo!! 
TimeZone!! $
{"" 	
get## 
{## 
return## 
timeZone## !
;##! "
}### $
}$$ 	
public'' 
Func'' 
<'' 
TimeZoneInfo''  
,''  !
DateTime''" *
,''* +
TimeSpan'', 4
[''4 5
]''5 6
,''6 7
DateTime''8 @
>''@ A
AmbigiousMoment''B Q
{(( 	
get)) 
{)) 
return)) 
ambigiousMoment)) (
;))( )
}))* +
}** 	
public-- 
Func-- 
<-- 
TimeZoneInfo--  
,--  !
DateTime--" *
,--* +
DateTime--, 4
>--4 5

{.. 	
get// 
{// 
return// 

;//& '
}//( )
}00 	
public33 
override33 
TimeSpan33  
GetDuration33! ,
(33, -
DateTime33- 5
start336 ;
,33; <
DateTime33= E
end33F I
)33I J
{44 	
if55 
(55 
timeZone55 
.55 &
SupportsDaylightSavingTime55 3
)553 4
{66 
if88 
(88 
timeZone88 
.88 
IsAmbiguousTime88 ,
(88, -
start88- 2
)882 3
)883 4
{99 
start:: 
=:: 
OnAmbiguousMoment:: -
(::- .
start::. 3
)::3 4
;::4 5
};; 
else<< 
if<< 
(<< 
timeZone<< !
.<<! "

(<</ 0
start<<0 5
)<<5 6
)<<6 7
{== 
start>> 
=>> 
OnInvalidMoment>> +
(>>+ ,
start>>, 1
)>>1 2
;>>2 3
}?? 
ifBB 
(BB 
timeZoneBB 
.BB 
IsAmbiguousTimeBB ,
(BB, -
endBB- 0
)BB0 1
)BB1 2
{CC 
endDD 
=DD 
OnAmbiguousMomentDD +
(DD+ ,
endDD, /
)DD/ 0
;DD0 1
}EE 
elseFF 
ifFF 
(FF 
timeZoneFF !
.FF! "

(FF/ 0
endFF0 3
)FF3 4
)FF4 5
{GG 
endHH 
=HH 
OnInvalidMomentHH )
(HH) *
endHH* -
)HH- .
;HH. /
}II 
}JJ 
returnLL 
baseLL 
.LL 
GetDurationLL #
(LL# $
startLL$ )
,LL) *
endLL+ .
)LL. /
;LL/ 0
}MM 	
	protectedPP 
virtualPP 
DateTimePP "
OnAmbiguousMomentPP# 4
(PP4 5
DateTimePP5 =
momentPP> D
)PPD E
{QQ 	
ifRR 
(RR 
ambigiousMomentRR 
==RR  "
nullRR# '
)RR' (
{SS 
throwTT 
newTT $
AmbiguousMomentExceptionTT 2
(TT2 3
momentTT3 9
)TT9 :
;TT: ;
}UU 
returnVV 
ambigiousMomentVV "
(VV" #
timeZoneVV# +
,VV+ ,
momentVV- 3
,VV3 4
timeZoneVV5 =
.VV= >#
GetAmbiguousTimeOffsetsVV> U
(VVU V
momentVVV \
)VV\ ]
)VV] ^
;VV^ _
}WW 	
	protectedZZ 
virtualZZ 
DateTimeZZ "
OnInvalidMomentZZ# 2
(ZZ2 3
DateTimeZZ3 ;
momentZZ< B
)ZZB C
{[[ 	
if\\ 
(\\ 

==\\  
null\\! %
)\\% &
{]] 
throw^^ 
new^^ "
InvalidMomentException^^ 0
(^^0 1
moment^^1 7
)^^7 8
;^^8 9
}__ 
return`` 

(``  !
timeZone``! )
,``) *
moment``+ 1
)``1 2
;``2 3
}aa 	
privateee 
readonlyee 
TimeZoneInfoee %
timeZoneee& .
;ee. /
privateff 
readonlyff 
Funcff 
<ff 
TimeZoneInfoff *
,ff* +
DateTimeff, 4
,ff4 5
TimeSpanff6 >
[ff> ?
]ff? @
,ff@ A
DateTimeffB J
>ffJ K
ambigiousMomentffL [
;ff[ \
privategg 
readonlygg 
Funcgg 
<gg 
TimeZoneInfogg *
,gg* +
DateTimegg, 4
,gg4 5
DateTimegg6 >
>gg> ?

;ggM N
}ii 
}kk �-
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Week.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Week 
: 

{ 
public 
Week 
( 
) 
: 
this 
( 
new 
TimeCalendar !
(! "
)" #
)# $
{ 	
} 	
public 
Week 
( 

calendar" *
)* +
:, -
this 
( 

ClockProxy 
. 
Clock !
.! "
Now" %
,% &
calendar' /
)/ 0
{ 	
} 	
public 
Week 
( 
DateTime 
moment #
)# $
:% &
this 
( 
moment 
, 
new 
TimeCalendar )
() *
)* +
)+ ,
{   	
}!! 	
public$$ 
Week$$ 
($$ 
DateTime$$ 
moment$$ #
,$$# $

calendar$$3 ;
)$$; <
:$$= >
base%% 
(%% 
moment%% 
,%% 
$num%% 
,%% 
calendar%% $
)%%$ %
{&& 	
}'' 	
public** 
Week** 
(** 
int** 
year** 
,** 
int** !

weekOfYear**" ,
)**, -
:**. /
this++ 
(++ 
year++ 
,++ 

weekOfYear++ !
,++! "
new++# &
TimeCalendar++' 3
(++3 4
)++4 5
)++5 6
{,, 	
}-- 	
public00 
Week00 
(00 
int00 
year00 
,00 
int00 !

weekOfYear00" ,
,00, -

calendar00< D
)00D E
:00F G
base11 
(11 
year11 
,11 

weekOfYear11 !
,11! "
$num11# $
,11$ %
calendar11& .
)11. /
{22 	
}33 	
public66 
int66 

WeekOfYear66 
{77 	
get88 
{88 
return88 
	StartWeek88 "
;88" #
}88$ %
}99 	
public<< 
string<< 
WeekOfYearName<< $
{== 	
get>> 
{>> 
return>> 
StartWeekOfYearName>> ,
;>>, -
}>>. /
}?? 	
publicBB 
DateTimeBB 
FirstDayOfWeekBB &
{CC 	
getDD 
{DD 
returnDD 
StartDD 
;DD 
}DD  !
}EE 	
publicHH 
DateTimeHH 

{II 	
getJJ 
{JJ 
returnJJ 
FirstDayOfWeekJJ '
.JJ' (
AddDaysJJ( /
(JJ/ 0
TimeSpecJJ0 8
.JJ8 9
DaysPerWeekJJ9 D
-JJE F
$numJJG H
)JJH I
;JJI J
}JJK L
}KK 	
publicNN 
boolNN !
MultipleCalendarYearsNN )
{OO 	
getPP 
{PP 
returnPP 
FirstDayOfWeekPP '
.PP' (
YearPP( ,
!=PP- /

.PP= >
YearPP> B
;PPB C
}PPD E
}QQ 	
publicTT 
WeekTT 
GetPreviousWeekTT #
(TT# $
)TT$ %
{UU 	
returnVV 
AddWeeksVV 
(VV 
-VV 
$numVV 
)VV 
;VV  
}WW 	
publicZZ 
WeekZZ 
GetNextWeekZZ 
(ZZ  
)ZZ  !
{[[ 	
return\\ 
AddWeeks\\ 
(\\ 
$num\\ 
)\\ 
;\\ 
}]] 	
public`` 
Week`` 
AddWeeks`` 
(`` 
int``  
weeks``! &
)``& '
{aa 	
DateTimebb 
	startDatebb 
=bb  
TimeToolbb! )
.bb) *
GetStartOfYearWeekbb* <
(bb< =
Yearbb= A
,bbA B
	StartWeekbbC L
,bbL M
CalendarbbN V
.bbV W
CulturebbW ^
,bb^ _
Calendarbb` h
.bbh i
YearWeekTypebbi u
)bbu v
;bbv w
returncc 
newcc 
Weekcc 
(cc 
	startDatecc %
.cc% &
AddDayscc& -
(cc- .
weekscc. 3
*cc4 5
TimeSpeccc6 >
.cc> ?
DaysPerWeekcc? J
)ccJ K
,ccK L
CalendarccM U
)ccU V
;ccV W
}dd 	
	protectedgg 
overridegg 
stringgg !
Formatgg" (
(gg( )
ITimeFormattergg) 7
	formattergg8 A
)ggA B
{hh 	
returnii 
	formatterii 
.ii 
GetCalendarPeriodii .
(ii. /
WeekOfYearNameii/ =
,ii= >
	formatterjj 
.jj 
GetShortDatejj &
(jj& '
Startjj' ,
)jj, -
,jj- .
	formatterjj/ 8
.jj8 9
GetShortDatejj9 E
(jjE F
EndjjF I
)jjI J
,jjJ K
DurationjjL T
)jjT U
;jjU V
}kk 	
}mm 
}oo �
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\Weeks.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

sealed 
class 
Weeks 
: 

{ 
public 
Weeks 
( 
DateTime 
moment $
,$ %
int& )
count* /
)/ 0
:1 2
this 
( 
moment 
, 
count 
, 
new  #
TimeCalendar$ 0
(0 1
)1 2
)2 3
{ 	
} 	
public 
Weeks 
( 
DateTime 
moment $
,$ %
int& )
count* /
,/ 0

calendar? G
)G H
:I J
base 
( 
moment 
, 
count 
, 
calendar  (
)( )
{ 	
} 	
public 
Weeks 
( 
int 
year 
, 
int "
	startWeek# ,
,, -
int. 1
count2 7
)7 8
:9 :
this 
( 
year 
, 
	startWeek  
,  !
count" '
,' (
new) ,
TimeCalendar- 9
(9 :
): ;
); <
{   	
}!! 	
public$$ 
Weeks$$ 
($$ 
int$$ 
year$$ 
,$$ 
int$$ "
	startWeek$$# ,
,$$, -
int$$. 1
count$$2 7
,$$7 8

calendar$$G O
)$$O P
:$$Q R
base%% 
(%% 
year%% 
,%% 
	startWeek%%  
,%%  !
count%%" '
,%%' (
calendar%%) 1
)%%1 2
{&& 	
}'' 	
public** !
ITimePeriodCollection** $
GetWeeks**% -
(**- .
)**. /
{++ 	 
TimePeriodCollection,,  
weeks,,! &
=,,' (
new,,) , 
TimePeriodCollection,,- A
(,,A B
),,B C
;,,C D
for-- 
(-- 
int-- 
i-- 
=-- 
$num-- 
;-- 
i-- 
<-- 
	WeekCount--  )
;--) *
i--+ ,
++--, .
)--. /
{.. 
weeks// 
.// 
Add// 
(// 
new// 
Week// "
(//" #
Year//# '
,//' (
	StartWeek//) 2
+//3 4
i//5 6
,//6 7
Calendar//8 @
)//@ A
)//A B
;//B C
}00 
return11 
weeks11 
;11 
}22 	
	protected55 
override55 
string55 !
Format55" (
(55( )
ITimeFormatter55) 7
	formatter558 A
)55A B
{66 	
return77 
	formatter77 
.77 
GetCalendarPeriod77 .
(77. /
StartWeekOfYearName77/ B
,77B C
EndWeekOfYearName77D U
,77U V
	formatter88 
.88 
GetShortDate88 &
(88& '
Start88' ,
)88, -
,88- .
	formatter88/ 8
.888 9
GetShortDate889 E
(88E F
End88F I
)88I J
,88J K
Duration88L T
)88T U
;88U V
}99 	
};; 
}== �\
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.TimePeriod\WeekTimeRange.cs
	namespace

 	
Phoenix


 
.

 
CrossCutting

 
.

 

TimePeriod

 )
{ 
public 

abstract 
class 

:( )
CalendarTimeRange* ;
{ 
	protected 

(  
int  #
year$ (
,( )
int* -
	startWeek. 7
,7 8
int9 <
	weekCount= F
)F G
:H I
this 
( 
year 
, 
	startWeek  
,  !
	weekCount" +
,+ ,
new- 0
TimeCalendar1 =
(= >
)> ?
)? @
{ 	
} 	
	protected 

(  
int  #
year$ (
,( )
int* -
	startWeek. 7
,7 8
int9 <
	weekCount= F
,F G

calendarV ^
)^ _
:` a
base 
( 
GetPeriodOf 
( 
year !
,! "
	startWeek# ,
,, -
	weekCount. 7
,7 8
calendar9 A
)A B
,B C
calendarD L
)L M
{ 	
this 
. 
year 
= 
year 
; 
this 
. 
	startWeek 
= 
	startWeek &
;& '
this 
. 
	weekCount 
= 
	weekCount &
;& '
} 	
	protected!! 

(!!  
DateTime!!  (
moment!!) /
,!!/ 0
int!!1 4
	weekCount!!5 >
)!!> ?
:!!@ A
this"" 
("" 
moment"" 
,"" 
	weekCount"" "
,""" #
new""$ '
TimeCalendar""( 4
(""4 5
)""5 6
)""6 7
{## 	
}$$ 	
	protected'' 

(''  
DateTime''  (
moment'') /
,''/ 0
int''1 4
	weekCount''5 >
,''> ?

calendar''N V
)''V W
:''X Y
base(( 
((( 
GetPeriodOf(( 
((( 
moment(( #
,((# $
	weekCount((% .
,((. /
calendar((0 8
)((8 9
,((9 :
calendar((; C
)((C D
{)) 	
TimeTool** 
.** 

(**" #
moment**# )
,**) *
calendar**+ 3
.**3 4
Culture**4 ;
,**; <
calendar**= E
.**E F
YearWeekType**F R
,**R S
out**T W
year**X \
,**\ ]
out**^ a
	startWeek**b k
)**k l
;**l m
this++ 
.++ 
	weekCount++ 
=++ 
	weekCount++ &
;++& '
},, 	
public// 
int// 
Year// 
{00 	
get11 
{11 
return11 
year11 
;11 
}11  
}22 	
public55 
int55 
	WeekCount55 
{66 	
get77 
{77 
return77 
	weekCount77 "
;77" #
}77$ %
}88 	
public;; 
int;; 
	StartWeek;; 
{<< 	
get== 
{== 
return== 
	startWeek== "
;==" #
}==$ %
}>> 	
publicAA 
intAA 
EndWeekAA 
{BB 	
getCC 
{CC 
returnCC 
	startWeekCC "
+CC# $
	weekCountCC% .
-CC/ 0
$numCC1 2
;CC2 3
}CC4 5
}DD 	
publicGG 
stringGG 
StartWeekOfYearNameGG )
{HH 	
getII 
{II 
returnII 
CalendarII !
.II! "
GetWeekOfYearNameII" 3
(II3 4
YearII4 8
,II8 9
	StartWeekII: C
)IIC D
;IID E
}IIF G
}JJ 	
publicMM 
stringMM 
EndWeekOfYearNameMM '
{NN 	
getOO 
{OO 
returnOO 
CalendarOO !
.OO! "
GetWeekOfYearNameOO" 3
(OO3 4
YearOO4 8
,OO8 9
EndWeekOO: A
)OOA B
;OOB C
}OOD E
}PP 	
publicSS 
DateTimeSS 
GetStartOfWeekSS &
(SS& '
intSS' *
	weekIndexSS+ 4
)SS4 5
{TT 	
ifUU 
(UU 
	weekIndexUU 
<UU 
$numUU 
||UU  
	weekIndexUU! *
>=UU+ -
	weekCountUU. 7
)UU7 8
{VV 
throwWW 
newWW '
ArgumentOutOfRangeExceptionWW 5
(WW5 6
$strWW6 A
)WWA B
;WWB C
}XX 
DateTimeZZ 
	startDateZZ 
=ZZ  
TimeToolZZ! )
.ZZ) *
GetStartOfYearWeekZZ* <
(ZZ< =
yearZZ= A
,ZZA B
	startWeekZZC L
,ZZL M
CalendarZZN V
.ZZV W
CultureZZW ^
,ZZ^ _
CalendarZZ` h
.ZZh i
YearWeekTypeZZi u
)ZZu v
;ZZv w
return[[ 
	startDate[[ 
.[[ 
AddDays[[ $
([[$ %
	weekIndex[[% .
*[[/ 0
TimeSpec[[1 9
.[[9 :
DaysPerWeek[[: E
)[[E F
;[[F G
}\\ 	
public__ !
ITimePeriodCollection__ $
GetDays__% ,
(__, -
)__- .
{`` 	 
TimePeriodCollectionaa  
daysaa! %
=aa& '
newaa( + 
TimePeriodCollectionaa, @
(aa@ A
)aaA B
;aaB C
DateTimebb 
	startDatebb 
=bb  
TimeToolbb! )
.bb) *
GetStartOfYearWeekbb* <
(bb< =
yearbb= A
,bbA B
	startWeekbbC L
,bbL M
CalendarbbN V
.bbV W
CulturebbW ^
,bb^ _
Calendarbb` h
.bbh i
YearWeekTypebbi u
)bbu v
;bbv w
intcc 
dayCountcc 
=cc 
	weekCountcc $
*cc% &
TimeSpeccc' /
.cc/ 0
DaysPerWeekcc0 ;
;cc; <
fordd 
(dd 
intdd 
idd 
=dd 
$numdd 
;dd 
idd 
<dd 
dayCountdd  (
;dd( )
idd* +
++dd+ -
)dd- .
{ee 
daysff 
.ff 
Addff 
(ff 
newff 
Dayff  
(ff  !
	startDateff! *
.ff* +
AddDaysff+ 2
(ff2 3
iff3 4
)ff4 5
,ff5 6
Calendarff7 ?
)ff? @
)ff@ A
;ffA B
}gg 
returnhh 
dayshh 
;hh 
}ii 	
	protectedll 
overridell 
boolll 
IsEqualll  '
(ll' (
objectll( .
objll/ 2
)ll2 3
{mm 	
returnnn 
basenn 
.nn 
IsEqualnn 
(nn  
objnn  #
)nn# $
&&nn% '
HasSameDatann( 3
(nn3 4
objnn4 7
asnn8 :

)nnH I
;nnI J
}oo 	
privaterr 
boolrr 
HasSameDatarr  
(rr  !

comprr/ 3
)rr3 4
{ss 	
returntt 
yeartt 
==tt 