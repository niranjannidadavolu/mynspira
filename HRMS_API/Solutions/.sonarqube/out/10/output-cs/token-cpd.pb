›
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.AppException\CustomExceptionMiddleware\ExceptionMiddleware.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
AppException *
.* +%
CustomExceptionMiddleware+ D
{ 
public 

class 
ExceptionMiddleware $
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
ILoggerManager '
_logger( /
;/ 0
public 
ExceptionMiddleware "
(" #
RequestDelegate# 2
next3 7
,7 8
ILoggerManager9 G
loggerH N
)N O
{ 	
this 
. 
_logger 
= 
logger !
;! "
this 
. 
_next 
= 
next 
; 
} 	
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
httpContext2 =
)= >
{ 	
try 
{ 
await 
this 
. 
_next  
(  !
httpContext! ,
), -
;- .
} 
catch 
( 
	Exception 
ex 
)  
{ 
this   
.   
_logger   
.   
LogError   %
(  % &
$"  & (
$str  ( >
{  > ?
ex  ? A
}  A B
"  B C
)  C D
;  D E
await!! 
this!! 
.!!  
HandleExceptionAsync!! /
(!!/ 0
httpContext!!0 ;
,!!; <
ex!!= ?
)!!? @
;!!@ A
}"" 
}## 	
private%% 
Task%%  
HandleExceptionAsync%% )
(%%) *
HttpContext%%* 5
context%%6 =
,%%= >
	Exception%%? H
	exception%%I R
)%%R S
{&& 	
context'' 
.'' 
Response'' 
.'' 
ContentType'' (
='') *
$str''+ =
;''= >
context(( 
.(( 
Response(( 
.(( 

StatusCode(( '
=((( )
(((* +
int((+ .
)((. /
HttpStatusCode((/ =
.((= >
InternalServerError((> Q
;((Q R
return** 
context** 
.** 
Response** #
.**# $

WriteAsync**$ .
(**. /
new**/ 2
ErrorDetails**3 ?
(**? @
)**@ A
{++ 

StatusCode,, 
=,, 
context,, $
.,,$ %
Response,,% -
.,,- .

StatusCode,,. 8
,,,8 9
Message-- 
=-- 
string--  
.--  !
Format--! '
(--' (
$str--( d
,--d e
	exception--f o
.--o p
Message--p w
)--w x
,--x y
}.. 
... 
ToString.. 
(.. 
).. 
).. 
;.. 
}// 	
}00 
}11 ¡
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.AppException\ErrorDetails.cs
	namespace 	
GlobalErrorHandling
 
. 
Models $
{ 
public 

class 
ErrorDetails 
{ 
public 
int 

StatusCode 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
Message		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public 
override 
string 
ToString '
(' (
)( )
{ 	
return 
JsonConvert 
. 
SerializeObject .
(. /
this/ 3
)3 4
;4 5
} 	
} 
} ¡
‹F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.AppException\Extensions\ExceptionMiddlewareExtensions.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
AppException *
.* +

Extensions+ 5
{ 
public 

static 
class )
ExceptionMiddlewareExtensions 5
{ 
public 
static 
void %
ConfigureExceptionHandler 4
(4 5
this5 9
IApplicationBuilder: M
appN Q
,Q R
ILoggerManagerS a
loggerb h
)h i
{ 	
app 
. 
UseExceptionHandler #
(# $
appError$ ,
=>- /
{ 
appError 
. 
Run 
( 
async "
context# *
=>+ -
{ 
context 
. 
Response $
.$ %

StatusCode% /
=0 1
(2 3
int3 6
)6 7
HttpStatusCode7 E
.E F
InternalServerErrorF Y
;Y Z
context 
. 
Response $
.$ %
ContentType% 0
=1 2
$str3 E
;E F
var 
contextFeature &
=' (
context) 0
.0 1
Features1 9
.9 :
Get: =
<= >$
IExceptionHandlerFeature> V
>V W
(W X
)X Y
;Y Z
if 
( 
contextFeature &
!=' )
null* .
). /
{ 
logger 
. 
LogError '
(' (
$"( *
$str* @
{@ A
contextFeatureA O
.O P
ErrorP U
}U V
"V W
)W X
;X Y
await 
context %
.% &
Response& .
.. /

WriteAsync/ 9
(9 :
new: =
ErrorDetails> J
(J K
)K L
{ 

StatusCode   &
=  ' (
context  ) 0
.  0 1
Response  1 9
.  9 :

StatusCode  : D
,  D E
Message!! #
=!!$ %
$str!!& >
,!!> ?
}"" 
."" 
ToString"" "
(""" #
)""# $
)""$ %
;""% &
}## 
}$$ 
)$$ 
;$$ 
}%% 
)%% 
;%% 
}&& 	
public(( 
static(( 
void(( .
"ConfigureCustomExceptionMiddleware(( =
(((= >
this((> B
IApplicationBuilder((C V
app((W Z
)((Z [
{)) 	
app** 
.** 
UseMiddleware** 
<** 
ExceptionMiddleware** 1
>**1 2
(**2 3
)**3 4
;**4 5
}++ 	
},, 
}-- 