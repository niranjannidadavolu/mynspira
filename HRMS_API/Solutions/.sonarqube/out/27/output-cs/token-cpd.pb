ž
‚F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.AspNetCore\Attributes\AuthorizationAttribute.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 

AspNetCore (
.( )

Attributes) 3
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
,D E
AllowMultipleF S
=T U
trueV Z
)Z [
][ \
public		 

sealed		 
class		 "
AuthorizationAttribute		 .
:		/ 0
AuthorizeAttribute		1 C
{

 
} 
} –
ˆF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.AspNetCore\Extensions\ApplicationBuilderExtensions.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 

AspNetCore (
.( )

Extensions) 3
{ 
public		 

static		 
class		 (
ApplicationBuilderExtensions		 4
{

 
private 
static 
readonly 
IWebHostEnvironment  3
_environment4 @
=A B
DependencyInjectorC U
.U V

GetServiceV `
<` a
IWebHostEnvironmenta t
>t u
(u v
)v w
;w x
public 
static 
void 
UseCorsCustom (
(( )
this) -
IApplicationBuilder. A
applicationB M
)M N
{ 	
application 
. 
UseCors 
(  
$str  ,
), -
;- .
application 
. 
UseCors 
(  
$str  )
)) *
;* +
application 
. 
UseCors 
(  
$str  1
)1 2
;2 3
} 	
public 
static 
void #
UseCustomAuthentication 2
(2 3
this3 7
IApplicationBuilder8 K
applicationL W
)W X
{ 	
application 
. 
UseCors 
(  
cors  $
=>% '
cors( ,
., -
WithOrigins- 8
(8 9
$str9 P
)P Q
.Q R
AllowAnyMethodR `
(` a
)a b
.b c
AllowAnyHeaderc q
(q r
)r s
.s t
AllowCredentials	t „
(
„ …
)
… †
.
† ‡9
+SetIsOriginAllowedToAllowWildcardSubdomains
‡ ²
(
² ³
)
³ ´
)
´ µ
;
µ ¶
} 	
public 
static 
void 
UseExceptionCustom -
(- .
this. 2
IApplicationBuilder3 F
applicationG R
)R S
{ 	
if 
( 
_environment 
. 
IsDevelopment *
(* +
)+ ,
), -
{ 
application 
. %
UseDeveloperExceptionPage 5
(5 6
)6 7
;7 8
} 
}   	
public"" 
static"" 
void"" 
UseHstsCustom"" (
(""( )
this"") -
IApplicationBuilder"". A
application""B M
)""M N
{## 	
if$$ 
($$ 
!$$ 
_environment$$ 
.$$ 
IsDevelopment$$ +
($$+ ,
)$$, -
)$$- .
{%% 
application&& 
.&& 
UseHsts&& #
(&&# $
)&&$ %
;&&% &
}'' 
}(( 	
})) 
}** ¢-
‡F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.AspNetCore\Extensions\ServiceCollectionExtensions.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 

AspNetCore (
.( )

Extensions) 3
{ 
public 

static 
class '
ServiceCollectionExtensions 3
{ 
public 
static 
void #
AddAuthenticationCustom 2
(2 3
this3 7
IServiceCollection8 J
servicesK S
)S T
{ 	
} 	
public 
static 
void 
AddMvcCustom '
(' (
this( ,
IServiceCollection- ?
services@ H
)H I
{ 	
void 
Json 
( $
MvcNewtonsoftJsonOptions .
json/ 3
)3 4
{ 
json 
. 
SerializerSettings '
.' (
NullValueHandling( 9
=: ;
NullValueHandling< M
.M N
IncludeN U
;U V
json 
. 
SerializerSettings '
.' (
ContractResolver( 8
=9 :
new; >#
DefaultContractResolver? V
(V W
)W X
;X Y
} 
; 
services 
. 
AddControllers #
(# $
)$ %
.% &
AddNewtonsoftJson& 7
(7 8
opts8 <
=>= ?
{ 
opts 
. 
SerializerSettings '
.' (
NullValueHandling( 9
=: ;
NullValueHandling< M
.M N
IncludeN U
;U V
opts 
. 
SerializerSettings '
.' (
ContractResolver( 8
=9 :
new; >#
DefaultContractResolver? V
(V W
)W X
;X Y
} 
) 
; 
services%% 
.%% 
AddMvc%% 
(%% 
opts%%  
=>%%! #
{&& 
opts'' 
.'' !
EnableEndpointRouting'' *
=''+ ,
false''- 2
;''2 3
opts(( 
.(( 
Filters(( 
.(( 
Add((  
(((  !
new((! $ 
AllowAnonymousFilter((% 9
(((9 :
)((: ;
)((; <
;((< =
})) 
))) 
;)) 
}** 	
public++ 
static++ 
void++ 

AddMvcJson++ %
(++% &
this++& *
IServiceCollection+++ =
services++> F
)++F G
{,, 	
void-- 
Json-- 
(-- $
MvcNewtonsoftJsonOptions-- .
json--/ 3
)--3 4
{.. 
json// 
.// 
SerializerSettings// '
.//' (
NullValueHandling//( 9
=//: ;
NullValueHandling//< M
.//M N
Include//N U
;//U V
json00 
.00 
SerializerSettings00 '
.00' (
ContractResolver00( 8
=009 :
new00; >#
DefaultContractResolver00? V
(00V W
)00W X
;00X Y
}11 
;11 
services22 
.22 
AddControllers22 #
(22# $
)22$ %
.22% &
AddNewtonsoftJson22& 7
(227 8
opts228 <
=>22= ?
{33 
opts44 
.44 
SerializerSettings44 '
.44' (
NullValueHandling44( 9
=44: ;
NullValueHandling44< M
.44M N
Include44N U
;44U V
opts55 
.55 
SerializerSettings55 '
.55' (
ContractResolver55( 8
=559 :
new55; >#
DefaultContractResolver55? V
(55V W
)55W X
;55X Y
}66 
)66 
;66 
services== 
.== 
AddMvc== 
(== 
opts==  
=>==! #
{>> 
opts?? 
.?? !
EnableEndpointRouting?? *
=??+ ,
false??- 2
;??2 3
opts@@ 
.@@ 
Filters@@ 
.@@ 
Add@@  
(@@  !
new@@! $ 
AllowAnonymousFilter@@% 9
(@@9 :
)@@: ;
)@@; <
;@@< =
}AA 
)AA 
;AA 
}BB 	
publicDD 
staticDD 
voidDD 

AddSessionDD %
(DD% &
thisDD& *
IServiceCollectionDD+ =
servicesDD> F
)DDF G
{EE 	
servicesFF 
.FF %
AddDistributedMemoryCacheFF .
(FF. /
)FF/ 0
;FF0 1
servicesGG 
.GG 

AddSessionGG 
(GG  
optionsGG  '
=>GG( *
{HH 
optionsII 
.II 
CookieII 
.II 
NameII #
=II$ %
$strII& 7
;II7 8
optionsJJ 
.JJ 
IdleTimeoutJJ #
=JJ$ %
TimeSpanJJ& .
.JJ. /
FromMinutesJJ/ :
(JJ: ;
$numJJ; =
)JJ= >
;JJ> ?
optionsKK 
.KK 
CookieKK 
.KK 
HttpOnlyKK '
=KK( )
trueKK* .
;KK. /
optionsLL 
.LL 
CookieLL 
.LL 
IsEssentialLL *
=LL+ ,
trueLL- 1
;LL1 2
}MM 
)MM 
;MM 
}NN 	
}OO 
}PP 