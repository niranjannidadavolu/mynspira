ÿ
‚F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.JwtGenerator\Abstractions\IJwtTokenGenerator.cs
	namespace 	
JwtGenerator
 
. 
Abstractions #
{ 
public 

	interface 
IJwtTokenGenerator '
{ $
TokenWithClaimsPrincipal  2
&GenerateAccessTokenWithClaimsPrincipal! G
(G H
stringH N
userNameO W
,W X
IEnumerable 
< 
Claim 
> 

userClaims )
)) *
;* +
string 
GenerateAccessToken "
(" #
string# )
userName* 2
,2 3
IEnumerable4 ?
<? @
Claim@ E
>E F

userClaimsG Q
)Q R
;R S
} 
} ›
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.JwtGenerator\ClaimsPrincipalFactory.cs
	namespace 	
JwtGenerator
 
{ 
public 

sealed 
class "
ClaimsPrincipalFactory .
{ 
public 
static 
ClaimsPrincipal %
CreatePrincipal& 5
(5 6
IEnumerable 
< 
Claim 
> 
claims %
,% &
string 
authenticationType %
=& '
null( ,
,, -
string 
roleType 
= 
null "
)" #
{ 	
var 
claimsPrincipal 
=  !
new" %
ClaimsPrincipal& 5
(5 6
)6 7
;7 8
claimsPrincipal 
. 
AddIdentity '
(' (
new( +
ClaimsIdentity, :
(: ;
claims; A
,A B
string; A
.A B
IsNullOrWhiteSpaceB T
(T U
authenticationTypeU g
)g h
?i j
$strk u
:v w
authenticationType	x Š
,
Š ‹

ClaimTypes; E
.E F
NameF J
,J K
string; A
.A B
IsNullOrWhiteSpaceB T
(T U
roleTypeU ]
)] ^
?_ `
$stra l
:m n
roleTypeo w
)w x
)x y
;y z
return 
claimsPrincipal "
;" #
} 	
} 
} ²
‘F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.JwtGenerator\Extensions\TokenValidationParametersExtensions.cs
	namespace 	
JwtGenerator
 
. 

Extensions !
{ 
public 

static 
class /
#TokenValidationParametersExtensions ;
{ 
public		 
static		 %
TokenValidationParameters		 /#
ToTokenValidationParams		0 G
(		G H
this

 
TokenOptions

 
tokenOptions

 *
)

* +
=>

, .
new %
TokenValidationParameters )
{ 
	ClockSkew 
= 
TimeSpan $
.$ %
Zero% )
,) *
ValidateAudience  
=! "
true# '
,' (
ValidAudience 
= 
tokenOptions  ,
., -
Audience- 5
,5 6
ValidateIssuer 
=  
true! %
,% &
ValidIssuer 
= 
tokenOptions *
.* +
Issuer+ 1
,1 2
IssuerSigningKey  
=! "
tokenOptions# /
./ 0

SigningKey0 :
,: ;$
ValidateIssuerSigningKey (
=) *
true+ /
,/ 0!
RequireExpirationTime %
=& '
true( ,
,, -
ValidateLifetime  
=! "
true# '
} 
; 
} 
} Ÿ2
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.JwtGenerator\JwtAuthTicketFormat.cs
	namespace 	
JwtGenerator
 
{		 
public 

sealed 
class 
JwtAuthTicketFormat +
:, -
ISecureDataFormat. ?
<? @ 
AuthenticationTicket@ T
>T U
{ 
private 
const 
string 
	Algorithm &
=' (
SecurityAlgorithms) ;
.; <

HmacSha256< F
;F G
private 
readonly %
TokenValidationParameters 2 
validationParameters3 G
;G H
private 
readonly 
IDataSerializer (
<( ) 
AuthenticationTicket) =
>= >
ticketSerializer? O
;O P
private 
readonly 
IDataProtector '
dataProtector( 5
;5 6
public$$ 
JwtAuthTicketFormat$$ "
($$" #%
TokenValidationParameters$$# < 
validationParameters$$= Q
,$$Q R
IDataSerializer%% 
<%%  
AuthenticationTicket%% 0
>%%0 1
ticketSerializer%%2 B
,%%B C
IDataProtector&& 
dataProtector&& (
)&&( )
{'' 	
this(( 
.((  
validationParameters(( %
=((& ' 
validationParameters((( <
??((= ?
throw)) 
new)) !
ArgumentNullException)) /
())/ 0
$"))0 2
{))2 3
nameof))3 9
())9 : 
validationParameters)): N
)))N O
}))O P
$str))P _
"))_ `
)))` a
;))a b
this** 
.** 
ticketSerializer** !
=**" #
ticketSerializer**$ 4
??**5 7
throw++ 
new++ !
ArgumentNullException++ /
(++/ 0
$"++0 2
{++2 3
nameof++3 9
(++9 :
ticketSerializer++: J
)++J K
}++K L
$str++L [
"++[ \
)++\ ]
;++] ^
;++_ `
this,, 
.,, 
dataProtector,, 
=,,  
dataProtector,,! .
??,,/ 1
throw-- 
new-- !
ArgumentNullException-- /
(--/ 0
$"--0 2
{--2 3
nameof--3 9
(--9 :
dataProtector--: G
)--G H
}--H I
$str--I X
"--X Y
)--Y Z
;--Z [
}.. 	
public66  
AuthenticationTicket66 #
	Unprotect66$ -
(66- .
string66. 4
protectedText665 B
)66B C
=>77 
	Unprotect77 
(77 
protectedText77 &
,77& '
null77( ,
)77, -
;77- .
publicAA  
AuthenticationTicketAA #
	UnprotectAA$ -
(AA- .
stringAA. 4
protectedTextAA5 B
,AAB C
stringAAD J
purposeAAK R
)AAR S
{BB 	
varCC 

authTicketCC 
=CC 
defaultCC $
(CC$ % 
AuthenticationTicketCC% 9
)CC9 :
;CC: ;
tryEE 
{FF 

authTicketGG 
=GG 
ticketSerializerGG -
.GG- .
DeserializeGG. 9
(GG9 :
dataProtectorHH 
.HH 
	UnprotectHH '
(HH' ( 
Base64UrlTextEncoderII (
.II( )
DecodeII) /
(II/ 0
protectedTextII0 =
)II= >
)II> ?
)II? @
;II@ A
varKK 
embeddedJwtKK 
=KK  !

authTicketKK" ,
.LL 

PropertiesLL 
?LL  
.MM 
GetTokenValueMM "
(MM" #
TokenConstantsMM# 1
.MM1 2
	TokenNameMM2 ;
)MM; <
;MM< =
newNN #
JwtSecurityTokenHandlerNN +
(NN+ ,
)NN, -
.OO 
ValidateTokenOO "
(OO" #
embeddedJwtOO# .
,OO. / 
validationParametersOO0 D
,OOD E
outOOF I
varOOJ M
tokenOON S
)OOS T
;OOT U
ifQQ 
(QQ 
!QQ 
(QQ 
tokenQQ 
isQQ 
JwtSecurityTokenQQ /
jwtQQ0 3
)QQ3 4
)QQ4 5
{RR 
throwSS 
newSS ,
 SecurityTokenValidationExceptionSS >
(SS> ?
$strSS? b
)SSb c
;SSc d
}TT 
ifVV 
(VV 
!VV 
jwtVV 
.VV 
HeaderVV 
.VV  
AlgVV  #
.VV# $
EqualsVV$ *
(VV* +
	AlgorithmVV+ 4
,VV4 5
StringComparisonVV6 F
.VVF G
OrdinalVVG N
)VVN O
)VVO P
{WW 
throwXX 
newXX 
ArgumentExceptionXX /
(XX/ 0
$"XX0 2
$strXX2 E
{XXE F
	AlgorithmXXF O
}XXO P
$strXXP Q
"XXQ R
)XXR S
;XXS T
}YY 
}ZZ 
catch[[ 
([[ 
	Exception[[ 
)[[ 
{\\ 
return]] 
null]] 
;]] 
}^^ 
return`` 

authTicket`` 
;`` 
}aa 	
publicii 
stringii 
Protectii 
(ii  
AuthenticationTicketii 2
dataii3 7
)ii7 8
=>ii9 ;
Protectii< C
(iiC D
dataiiD H
,iiH I
nulliiJ N
)iiN O
;iiO P
publicrr 
stringrr 
Protectrr 
(rr  
AuthenticationTicketrr 2
datarr3 7
,rr7 8
stringrr9 ?
purposerr@ G
)rrG H
{ss 	
vartt 
arraytt 
=tt 
ticketSerializertt (
.tt( )
	Serializett) 2
(tt2 3
datatt3 7
)tt7 8
;tt8 9
returnvv  
Base64UrlTextEncodervv '
.vv' (
Encodevv( .
(vv. /
dataProtectorvv/ <
.vv< =
Protectvv= D
(vvD E
arrayvvE J
)vvJ K
)vvK L
;vvL M
}ww 	
}xx 
}yy 7
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.JwtGenerator\JwtTokenGenerator.cs
	namespace 	
JwtGenerator
 
{ 
public 

sealed 
class 
JwtTokenGenerator )
:* +
IJwtTokenGenerator, >
{ 
private 
readonly 
TokenOptions %
tokenOptions& 2
;2 3
public 
JwtTokenGenerator  
(  !
TokenOptions! -
tokenOptions. :
): ;
{ 	
this 
. 
tokenOptions 
= 
tokenOptions  ,
??- /
throw 
new !
ArgumentNullException /
(/ 0
$" 
$str +
{+ ,
nameof, 2
(2 3
TokenOptions3 ?
)? @
}@ A
$strA l
"l m
)m n
;n o
;p q
} 	
public   
string   
GenerateAccessToken   )
(  ) *
string  * 0
userName  1 9
,  9 :
IEnumerable  ; F
<  F G
Claim  G L
>  L M

userClaims  N X
)  X Y
{!! 	
var"" 

expiration"" 
="" 
TimeSpan"" %
.""% &
FromMinutes""& 1
(""1 2
tokenOptions""2 >
.""> ? 
TokenExpiryInMinutes""? S
)""S T
;""T U
var## 
jwt## 
=## 
new## 
JwtSecurityToken## *
(##* +
issuer##+ 1
:##1 2
tokenOptions##3 ?
.##? @
Issuer##@ F
,##F G
audience$$+ 3
:$$3 4
tokenOptions$$5 A
.$$A B
Audience$$B J
,$$J K
claims%%+ 1
:%%1 2,
 MergeUserClaimsWithDefaultClaims%%3 S
(%%S T
userName%%T \
,%%\ ]

userClaims%%^ h
)%%h i
,%%i j
	notBefore&&+ 4
:&&4 5
DateTime&&6 >
.&&> ?
UtcNow&&? E
,&&E F
expires''+ 2
:''2 3
DateTime''4 <
.''< =
UtcNow''= C
.''C D
Add''D G
(''G H

expiration''H R
)''R S
,''S T
signingCredentials((+ =
:((= >
new((? B
SigningCredentials((C U
(((U V
tokenOptions))/ ;
.)); <

SigningKey))< F
,))F G
SecurityAlgorithms**/ A
.**A B

HmacSha256**B L
)**L M
)**M N
;**N O
var,, 
accessToken,, 
=,, 
new,, !#
JwtSecurityTokenHandler,," 9
(,,9 :
),,: ;
.,,; <

WriteToken,,< F
(,,F G
jwt,,G J
),,J K
;,,K L
return.. 
accessToken.. 
;.. 
}// 	
public11 $
TokenWithClaimsPrincipal11 '2
&GenerateAccessTokenWithClaimsPrincipal11( N
(11N O
string11O U
userName11V ^
,11^ _
IEnumerable22 
<22 
Claim22 
>22 

userClaims22 )
)22) *
{33 	
var44 
userClaimList44 
=44 

userClaims44  *
.44* +
ToList44+ 1
(441 2
)442 3
;443 4
var55 
accessToken55 
=55 
GenerateAccessToken55 1
(551 2
userName552 :
,55: ;
userClaimList55< I
)55I J
;55J K
return77 
new77 $
TokenWithClaimsPrincipal77 /
(77/ 0
)770 1
{88 
AccessToken99 
=99 
accessToken99 )
,99) *
ClaimsPrincipal:: 
=::  !"
ClaimsPrincipalFactory::" 8
.::8 9
CreatePrincipal::9 H
(::H I,
 MergeUserClaimsWithDefaultClaims;; 4
(;;4 5
userName;;5 =
,;;= >
userClaimList;;? L
);;L M
);;M N
,;;N O
AuthProperties<< 
=<<   
CreateAuthProperties<<! 5
(<<5 6
accessToken<<6 A
)<<A B
}== 
;== 
}>> 	
private@@ 
static@@ $
AuthenticationProperties@@ / 
CreateAuthProperties@@0 D
(@@D E
string@@E K
accessToken@@L W
)@@W X
{AA 	
varBB 
	authPropsBB 
=BB 
newBB $
AuthenticationPropertiesBB  8
(BB8 9
)BB9 :
;BB: ;
	authPropsCC 
.CC 
StoreTokensCC !
(CC! "
newDD 
[DD 
]DD 
{EE 
newFF 
AuthenticationTokenFF +
(FF+ ,
)FF, -
{GG 
NameHH 
=HH 
TokenConstantsHH -
.HH- .
	TokenNameHH. 7
,HH7 8
ValueII 
=II 
accessTokenII  +
}JJ 
}KK 
)KK 
;KK 
returnMM 
	authPropsMM 
;MM 
}NN 	
privatePP 
staticPP 
IEnumerablePP "
<PP" #
ClaimPP# (
>PP( ),
 MergeUserClaimsWithDefaultClaimsPP* J
(PPJ K
stringPPK Q
userNamePPR Z
,PPZ [
IEnumerableQQ 
<QQ 
ClaimQQ 
>QQ 

userClaimsQQ )
)QQ) *
{RR 	
varSS 
claimsSS 
=SS 
newSS 
ListSS !
<SS! "
ClaimSS" '
>SS' (
(SS( )

userClaimsSS) 3
)SS3 4
{TT 
newUU 
ClaimUU 
(UU 

ClaimTypesUU $
.UU$ %
NameUU% )
,UU) *
userNameUU+ 3
)UU3 4
,UU4 5
newVV 
ClaimVV 
(VV #
JwtRegisteredClaimNamesVV 1
.VV1 2
SubVV2 5
,VV5 6
userNameVV7 ?
)VV? @
,VV@ A
newWW 
ClaimWW 
(WW #
JwtRegisteredClaimNamesWW 1
.WW1 2
JtiWW2 5
,WW5 6
GuidWW7 ;
.WW; <
NewGuidWW< C
(WWC D
)WWD E
.WWE F
ToStringWWF N
(WWN O
)WWO P
)WWP Q
,WWQ R
newXX 
ClaimXX 
(XX #
JwtRegisteredClaimNamesXX 1
.XX1 2
IatXX2 5
,XX5 6
DateTimeOffsetYY "
.YY" #
UtcNowYY# )
.YY) *
ToUnixTimeSecondsYY* ;
(YY; <
)YY< =
.YY= >
ToStringYY> F
(YYF G
)YYG H
,YYH I
ClaimValueTypesZZ #
.ZZ# $
	Integer64ZZ$ -
)ZZ- .
}[[ 
;[[ 
return]] 
claims]] 
;]] 
}^^ 	
}__ 
}`` Ø
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.JwtGenerator\Types\TokenOptions.cs
	namespace 	
JwtGenerator
 
. 
Types 
{ 
public 

sealed 
class 
TokenOptions $
{ 
public 
TokenOptions 
( 
string "
issuer# )
,) *
string   "
audience  # +
,  + ,
string!! "
rawSigningKey!!# 0
,!!0 1
int""  
tokenExpiryInMinutes""  4
=""5 6
$num""7 8
)""8 9
{## 	
if$$ 
($$ 
string$$ 
.$$ 
IsNullOrWhiteSpace$$ )
($$) *
audience$$* 2
)$$2 3
)$$3 4
{%% 
throw&& 
new&& !
ArgumentNullException&& /
(&&/ 0
$"'' 
{'' 
nameof'' 
('' 
Audience'' &
)''& '
}''' (
$str''( Q
"''Q R
)''R S
;''S T
}(( 
if** 
(** 
string** 
.** 
IsNullOrWhiteSpace** )
(**) *
issuer*** 0
)**0 1
)**1 2
{++ 
throw,, 
new,, !
ArgumentNullException,, /
(,,/ 0
$"-- 
{-- 
nameof-- 
(-- 
Issuer-- $
)--$ %
}--% &
$str--& O
"--O P
)--P Q
;--Q R
}.. 
Audience00 
=00 
audience00 
;00  
Issuer11 
=11 
issuer11 
;11 

SigningKey22 
=22 
new22  
SymmetricSecurityKey22 1
(221 2
Encoding33 
.33 
ASCII33 
.33 
GetBytes33 '
(33' (
rawSigningKey33( 5
)335 6
)336 7
??338 :
throw44 
new44 !
ArgumentNullException44 /
(44/ 0
$"55 
{55 
nameof55 
(55 

SigningKey55 (
)55( )
}55) *
$str55* S
"55S T
)55T U
;55U V 
TokenExpiryInMinutes77  
=77! " 
tokenExpiryInMinutes77# 7
;777 8
}88 	
public:: 
SecurityKey:: 

SigningKey:: %
{::& '
get::( +
;::+ ,
}::- .
public<< 
string<< 
Issuer<< 
{<< 
get<< "
;<<" #
}<<$ %
public>> 
string>> 
Audience>> 
{>>  
get>>! $
;>>$ %
}>>& '
public@@ 
int@@  
TokenExpiryInMinutes@@ '
{@@( )
get@@* -
;@@- .
}@@/ 0
}AA 
publicCC 

structCC 
TokenConstantsCC  
{DD 
publicEE 
constEE 
stringEE 
	TokenNameEE %
=EE& '
$strEE( -
;EE- .
}FF 
}GG ¯
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.JwtGenerator\Types\TokenWithClaimsPrincipal.cs
	namespace 	
JwtGenerator
 
. 
Types 
{ 
public 

sealed 
class $
TokenWithClaimsPrincipal 0
{ 
public 
string 
AccessToken !
{" #
get$ '
;' (
internal) 1
set2 5
;5 6
}7 8
public

 
ClaimsPrincipal

 
ClaimsPrincipal

 .
{

/ 0
get

1 4
;

4 5
internal

6 >
set

? B
;

B C
}

D E
public $
AuthenticationProperties '
AuthProperties( 6
{7 8
get9 <
;< =
internal> F
setG J
;J K
}L M
} 
} 