�
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\Criptography\Cryptography.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{		 
public

 

class

 
Cryptography

 
:

 
ICryptography

  -
{ 
public 
string 
Encrypt 
( 
string $
source% +
,+ ,
string- 3
key4 7
)7 8
{ 	
string 
encryptedString "
=# $
string% +
.+ ,
Empty, 1
;1 2
encryptedString 
= 
AES !
.! "
Encrypt" )
() *
source* 0
,0 1
key2 5
,5 6
$str7 N
,N O
keySizeP W
:W X
AESKeySizeFlagsY h
.h i
L128i m
)m n
;n o
return 
encryptedString "
;" #
} 	
public 
string 
Decrypt 
( 
string $
encodedText% 0
,0 1
string2 8
key9 <
)< =
{ 	
string 
	plainText 
= 
string %
.% &
Empty& +
;+ ,
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
encodedText& 1
)1 2
)2 3
{ 
	plainText 
= 
AES 
.  
Decrypt  '
(' (
encodedText( 3
,3 4
key5 8
,8 9
$str: Q
,Q R
keySizeS Z
:Z [
AESKeySizeFlags\ k
.k l
L128l p
)p q
;q r
} 
return 
	plainText 
; 
} 	
} 
} �
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\Criptography\ICryptography.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{ 
public 

	interface 
ICryptography "
{ 
string 
Encrypt 
( 
string 
source $
,$ %
string& ,
key- 0
)0 1
;1 2
string 
Decrypt 
( 
string 
encodedText )
,) *
string+ 1
key2 5
)5 6
;6 7
} 
}		 �
hF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\Hash\Hash.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{ 
public 

class 
Hash 
: 
IHash 
{ 
public		 
string		 
Create		 
(		 
string		 #
value		$ )
)		) *
{

 	
if 
( 
string 
. 
IsNullOrWhiteSpace )
() *
value* /
)/ 0
)0 1
{ 
throw 
new !
ArgumentNullException /
(/ 0
value0 5
)5 6
;6 7
} 
using 
var 
	algorithm 
=  !
new" %
SHA512Managed& 3
(3 4
)4 5
;5 6
var 
bytes 
= 
	algorithm !
.! "
ComputeHash" -
(- .
Encoding. 6
.6 7
Unicode7 >
.> ?
GetBytes? G
(G H
valueH M
)M N
)N O
;O P
return 
Convert 
. 
ToBase64String )
() *
bytes* /
,/ 0
$num1 2
,2 3
bytes4 9
.9 :
Length: @
)@ A
;A B
} 	
} 
} �
iF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\Hash\IHash.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{ 
public 

	interface 
IHash 
{ 
string 
Create 
( 
string 
value "
)" #
;# $
} 
} �
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\JsonWebToken\IJsonWebToken.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{ 
public 

	interface 
IJsonWebToken "
{ %
TokenValidationParameters		 !%
TokenValidationParameters		" ;
{		< =
get		> A
;		A B
}		C D

Dictionary 
< 
string 
, 
object !
>! "
Decode# )
() *
string* 0
token1 6
)6 7
;7 8
string 
Encode 
( 
string 
sub  
,  !
string" (
[( )
]) *
roles+ 0
)0 1
;1 2
} 
} �
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\JsonWebToken\JsonWebToken.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{		 
public

 

class

 
JsonWebToken

 
:

 
IJsonWebToken

  -
{ 
public %
TokenValidationParameters (%
TokenValidationParameters) B
=>C E
newF I
(I J
)J K
{ 	
IssuerSigningKey 
=  
JsonWebTokenSettings 3
.3 4
SecurityKey4 ?
,? @
ValidateActor 
= 
true  
,  !
ValidateAudience 
= 
true #
,# $$
ValidateIssuerSigningKey $
=% &
true' +
,+ ,
ValidateLifetime 
= 
true #
,# $
ValidAudience 
=  
JsonWebTokenSettings 0
.0 1
Audience1 9
,9 :
ValidIssuer 
=  
JsonWebTokenSettings .
.. /
Issuer/ 5
,5 6
} 	
;	 

public 

Dictionary 
< 
string  
,  !
object" (
>( )
Decode* 0
(0 1
string1 7
token8 =
)= >
{ 	
return 
new #
JwtSecurityTokenHandler .
(. /
)/ 0
.0 1
ReadJwtToken1 =
(= >
token> C
)C D
.D E
PayloadE L
;L M
} 	
public 
string 
Encode 
( 
string #
sub$ '
,' (
string) /
[/ 0
]0 1
roles2 7
)7 8
{ 	
var 
claims 
= 
new 
List !
<! "
Claim" '
>' (
(( )
)) *
;* +
claims 
. 
AddJti 
( 
) 
; 
claims   
.   
AddSub   
(   
sub   
)   
;   
claims!! 
.!! 
AddRoles!! 
(!! 
roles!! !
)!!! "
;!!" #
return## 
new## #
JwtSecurityTokenHandler## .
(##. /
)##/ 0
.##0 1

WriteToken##1 ;
(##; <
GetJwtSecurityToken##< O
(##O P
claims##P V
)##V W
)##W X
;##X Y
}$$ 	
private&& 
static&& 
JwtSecurityToken&& '
GetJwtSecurityToken&&( ;
(&&; <
IEnumerable&&< G
<&&G H
Claim&&H M
>&&M N
claims&&O U
)&&U V
{'' 	
return(( 
new(( 
JwtSecurityToken(( '
())  
JsonWebTokenSettings** $
.**$ %
Issuer**% +
,**+ , 
JsonWebTokenSettings++ $
.++$ %
Audience++% -
,++- .
claims,, 
,,, 
DateTime-- 
.-- 
Now-- 
,--  
JsonWebTokenSettings.. $
...$ %
Expires..% ,
,.., - 
JsonWebTokenSettings// $
.//$ %
SigningCredentials//% 7
)00 
;00 
}11 	
}22 
}33 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\JsonWebToken\JsonWebTokenExtensions.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{ 
public		 

static		 
class		 "
JsonWebTokenExtensions		 .
{

 
public 
static 
void 
AddJti !
(! "
this" &
ICollection' 2
<2 3
Claim3 8
>8 9
claims: @
)@ A
{ 	
claims 
. 
Add 
( 
new 
Claim  
(  !#
JwtRegisteredClaimNames! 8
.8 9
Jti9 <
,< =
Guid> B
.B C
NewGuidC J
(J K
)K L
.L M
ToStringM U
(U V
)V W
)W X
)X Y
;Y Z
} 	
public 
static 
void 
AddRoles #
(# $
this$ (
ICollection) 4
<4 5
Claim5 :
>: ;
claims< B
,B C
stringD J
[J K
]K L
rolesM R
)R S
{ 	
roles 
. 
ToList 
( 
) 
. 
ForEach "
(" #
role# '
=>( *
claims+ 1
.1 2
Add2 5
(5 6
new6 9
Claim: ?
(? @

ClaimTypes@ J
.J K
RoleK O
,O P
roleQ U
)U V
)V W
)W X
;X Y
} 	
public 
static 
void 
AddSub !
(! "
this" &
ICollection' 2
<2 3
Claim3 8
>8 9
claims: @
,@ A
stringB H
subI L
)L M
{ 	
claims 
. 
Add 
( 
new 
Claim  
(  !#
JwtRegisteredClaimNames! 8
.8 9
Sub9 <
,< =
sub> A
)A B
)B C
;C D
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\JsonWebToken\JsonWebTokenSettings.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Security &
{ 
public 

static 
class  
JsonWebTokenSettings ,
{		 
private

 
static

 
SecurityKey

 "
_securityKey

# /
;

/ 0
public 
static 
string 
Audience %
=>& (
nameof) /
(/ 0
Audience0 8
)8 9
;9 :
public 
static 
DateTime 
Expires &
=>' )
DateTime* 2
.2 3
Now3 6
.6 7
AddDays7 >
(> ?
$num? @
)@ A
;A B
public 
static 
string 
Issuer #
=>$ &
nameof' -
(- .
Issuer. 4
)4 5
;5 6
public 
static 
string 
Key  
=>! #
Guid$ (
.( )
NewGuid) 0
(0 1
)1 2
+3 4
DateTime5 =
.= >
Now> A
.A B
ToStringB J
(J K
)K L
;L M
public 
static 
SecurityKey !
SecurityKey" -
=>. 0
_securityKey1 =
??> @
(A B
_securityKeyB N
=O P
newQ T 
SymmetricSecurityKeyU i
(i j
Encodingj r
.r s
UTF8s w
.w x
GetBytes	x �
(
� �
Key
� �
)
� �
)
� �
)
� �
;
� �
public 
static 
SigningCredentials (
SigningCredentials) ;
=>< >
new? B
(B C
SecurityKeyC N
,N O
SecurityAlgorithmsP b
.b c

HmacSha512c m
)m n
;n o
} 
} �:
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Asymmetric\RSA.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;

Asymmetric; E
{ 
public 

static 
class 
RSA 
{ 
public 
static 

RSAOpenSsl  
OpenSsl! (
=>) +(
RSAOpenSslSingletonContainer, H
.H I
InstanceI Q
;Q R
public 
static 
void 
CreateXmlKey '
(' (
out( +
string, 2
xmlPrivateKey3 @
,@ A
outB E
stringF L
xmlPublicKeyM Y
,Y Z
RSASizeTypes[ g
sizeh l
=m n
RSASizeTypeso {
.{ |
L2048	| �
)
� �
{ 	
using 
( $
RSACryptoServiceProvider +
rsa, /
=0 1
new2 5$
RSACryptoServiceProvider6 N
(N O
(O P
intP S
)S T
sizeT X
)X Y
)Y Z
{   
xmlPrivateKey!! 
=!! 
rsa!!  #
.!!# $
ToXmlString!!$ /
(!!/ 0
true!!0 4
)!!4 5
;!!5 6
xmlPublicKey"" 
="" 
rsa"" "
.""" #
ToXmlString""# .
("". /
false""/ 4
)""4 5
;""5 6
}## 
}$$ 	
public.. 
static.. 
string.. 
GetPrivateKey.. *
(..* +
string..+ 1
certFile..2 :
,..: ;
string..< B
password..C K
)..K L
{// 	
X509Certificate200 
cert00 !
=00" #
GetX509Certificate200$ 7
(007 8
certFile008 @
)00@ A
;00A B
return22 
cert22 
.22 

PrivateKey22 "
.22" #
ToXmlString22# .
(22. /
true22/ 3
)223 4
;224 5
}33 	
public:: 
static:: 
string:: 
GetPublicKey:: )
(::) *
string::* 0
certFile::1 9
)::9 :
{;; 	
X509Certificate2<< 
cert<< !
=<<" #
GetX509Certificate2<<$ 7
(<<7 8
certFile<<8 @
)<<@ A
;<<A B
return>> 
cert>> 
.>> 
	PublicKey>> !
.>>! "
Key>>" %
.>>% &
ToXmlString>>& 1
(>>1 2
false>>2 7
)>>7 8
;>>8 9
}?? 	
privateGG 
staticGG 
X509Certificate2GG '
GetX509Certificate2GG( ;
(GG; <
stringGG< B
certFileGGC K
)GGK L
{HH 	
ifII 
(II 
!II 
FileII 
.II 
ExistsII 
(II 
certFileII %
)II% &
)II& '
throwII( -
newII. 1!
FileNotFoundExceptionII2 G
(IIG H
nameofIIH N
(IIN O
certFileIIO W
)IIW X
)IIX Y
;IIY Z
returnKK 
newKK 
X509Certificate2KK '
(KK' (
certFileKK( 0
)KK0 1
;KK1 2
}LL 	
publicWW 
staticWW 
stringWW 
EncryptWW $
(WW$ %
stringWW% +
dataWW, 0
,WW0 1
stringWW2 8
xmlPublicKeyWW9 E
,WWE F
EncodingWWG O
encodingWWP X
=WWY Z
nullWW[ _
)WW_ `
{XX 	
ifYY 
(YY 
encodingYY 
==YY 
nullYY  
)YY  !
encodingYY" *
=YY+ ,
EncodingYY- 5
.YY5 6
UTF8YY6 :
;YY: ;
return[[ 
Encrypt[[ 
([[ 
encoding[[ #
.[[# $
GetBytes[[$ ,
([[, -
data[[- 1
)[[1 2
,[[2 3
xmlPublicKey[[4 @
)[[@ A
;[[A B
}\\ 	
publicdd 
staticdd 
stringdd 
Encryptdd $
(dd$ %
bytedd% )
[dd) *
]dd* +
	dataBytesdd, 5
,dd5 6
stringdd7 =
xmlPublicKeydd> J
)ddJ K
{ee 	
usingff 
(ff $
RSACryptoServiceProviderff +
rsaff, /
=ff0 1
newff2 5$
RSACryptoServiceProviderff6 N
(ffN O
)ffO P
)ffP Q
{gg 
rsahh 
.hh 
FromXmlStringhh !
(hh! "
xmlPublicKeyhh" .
)hh. /
;hh/ 0
byteii 
[ii 
]ii 
bytesii 
=ii 
rsaii "
.ii" #
Encryptii# *
(ii* +
	dataBytesii+ 4
,ii4 5
falseii6 ;
)ii; <
;ii< =
returnjj 
Convertjj 
.jj 
ToBase64Stringjj -
(jj- .
bytesjj. 3
)jj3 4
;jj4 5
}kk 
}ll 	
publicuu 
staticuu 
stringuu 
Decryptuu $
(uu$ %
stringuu% +
datauu, 0
,uu0 1
stringuu2 8
xmlPrivateKeyuu9 F
,uuF G
EncodinguuH P
encodinguuQ Y
=uuZ [
nulluu\ `
)uu` a
{vv 	
returnww 
Decryptww 
(ww 
Convertww "
.ww" #
FromBase64Stringww# 3
(ww3 4
dataww4 8
)ww8 9
,ww9 :
xmlPrivateKeyww; H
,wwH I
encodingwwJ R
)wwR S
;wwS T
}xx 	
public
�� 
static
�� 
string
�� 
Decrypt
�� $
(
��$ %
byte
��% )
[
��) *
]
��* +
	dataBytes
��, 5
,
��5 6
string
��7 =
xmlPrivateKey
��> K
,
��K L
Encoding
��M U
encoding
��V ^
=
��_ `
null
��a e
)
��e f
{
�� 	
if
�� 
(
�� 
encoding
�� 
==
�� 
null
��  
)
��  !
encoding
��" *
=
��+ ,
Encoding
��- 5
.
��5 6
UTF8
��6 :
;
��: ;
using
�� 
(
�� &
RSACryptoServiceProvider
�� +
rsa
��, /
=
��0 1
new
��2 5&
RSACryptoServiceProvider
��6 N
(
��N O
)
��O P
)
��P Q
{
�� 
rsa
�� 
.
�� 
FromXmlString
�� !
(
��! "
xmlPrivateKey
��" /
)
��/ 0
;
��0 1
byte
�� 
[
�� 
]
�� 
bytes
�� 
=
�� 
rsa
�� "
.
��" #
Decrypt
��# *
(
��* +
	dataBytes
��+ 4
,
��4 5
false
��6 ;
)
��; <
;
��< =
return
�� 
encoding
�� 
.
��  
	GetString
��  )
(
��) *
bytes
��* /
)
��/ 0
;
��0 1
}
�� 
}
�� 	
}
�� 
}�� ��
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Asymmetric\RSAOpenSsl.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;

Asymmetric; E
{		 
public 

sealed 
class 

RSAOpenSsl "
{ 
internal 

RSAOpenSsl 
( 
) 
{ 	
} 	
public!! 
static!! 
string!! #
ImportPublicKeyFromFile!! 4
(!!4 5
string!!5 ;
file!!< @
,!!@ A
string!!B H
beginString!!I T
=!!U V
null!!W [
,!![ \
string!!] c
	endString!!d m
=!!n o
null!!p t
,!!t u
Encoding!!v ~
encoding	!! �
=
!!� �
null
!!� �
)
!!� �
{"" 	
return## 
GetKeyFromFile## !
(##! "
file##" &
,##& '
beginString##( 3
,##3 4
	endString##5 >
,##> ?
GetPublicKeyString##@ R
,##R S
encoding##T \
)##\ ]
;##] ^
}$$ 	
public.. 
static.. 
string.. $
ImportPrivateKeyFromFile.. 5
(..5 6
string..6 <
file..= A
,..A B
string..C I
beginString..J U
=..V W
null..X \
,..\ ]
string..^ d
	endString..e n
=..o p
null..q u
,..u v
Encoding..w 
encoding
..� �
=
..� �
null
..� �
)
..� �
{// 	
return00 
GetKeyFromFile00 !
(00! "
file00" &
,00& '
beginString00( 3
,003 4
	endString005 >
,00> ?
GetPrivateKeyString00@ S
,00S T
encoding00U ]
)00] ^
;00^ _
}11 	
public:: 
static:: 
string:: %
ImportPublicKeyFromString:: 6
(::6 7
string::7 =
text::> B
,::B C
string::D J
beginString::K V
=::W X
null::Y ]
,::] ^
string::_ e
	endString::f o
=::p q
null::r v
)::v w
{;; 	
ArgumentValidator<< 
.<< 
Validate<< &
(<<& '
text<<' +
)<<+ ,
;<<, -
return>> 
GetPublicKeyString>> %
(>>% &
text>>& *
,>>* +
beginString>>, 7
,>>7 8
	endString>>9 B
)>>B C
;>>C D
}?? 	
publicHH 
staticHH 
stringHH &
ImportPrivateKeyFromStringHH 7
(HH7 8
stringHH8 >
textHH? C
,HHC D
stringHHE K
beginStringHHL W
=HHX Y
nullHHZ ^
,HH^ _
stringHH` f
	endStringHHg p
=HHq r
nullHHs w
)HHw x
{II 	
ArgumentValidatorJJ 
.JJ 
ValidateJJ &
(JJ& '
textJJ' +
)JJ+ ,
;JJ, -
returnLL 
GetPrivateKeyStringLL &
(LL& '
textLL' +
,LL+ ,
beginStringLL- 8
,LL8 9
	endStringLL: C
)LLC D
;LLD E
}MM 	
privateOO 
staticOO 
FuncOO 
<OO 
stringOO "
,OO" #
stringOO$ *
,OO* +
stringOO, 2
,OO2 3
stringOO4 :
>OO: ;
GetPublicKeyStringOO< N
=>OOO Q
(OOR S
textOOS W
,OOW X
beginOOY ^
,OO^ _
endOO` c
)OOc d
=>OOe g
{PP 	
ifQQ 
(QQ 
beginQQ 
==QQ 
nullQQ 
)QQ 
beginQQ $
=QQ% &
$strQQ' C
;QQC D
ifRR 
(RR 
endRR 
==RR 
nullRR 
)RR 
endRR  
=RR! "
$strRR# =
;RR= >
returnSS 
textSS 
.SS 
ReplaceSS 
(SS  
beginSS  %
,SS% &
$strSS' )
)SS) *
.SS* +
ReplaceSS+ 2
(SS2 3
endSS3 6
,SS6 7
$strSS8 :
)SS: ;
;SS; <
;SS= >
}TT 	
;TT	 

privateVV 
staticVV 
FuncVV 
<VV 
stringVV "
,VV" #
stringVV$ *
,VV* +
stringVV, 2
,VV2 3
stringVV4 :
>VV: ;
GetPrivateKeyStringVV< O
=>VVP R
(VVS T
textVVT X
,VVX Y
beginVVZ _
,VV_ `
endVVa d
)VVd e
=>VVf h
{WW 	
ifXX 
(XX 
beginXX 
==XX 
nullXX 
)XX 
beginXX $
=XX% &
$strXX' H
;XXH I
ifYY 
(YY 
endYY 
==YY 
nullYY 
)YY 
endYY  
=YY! "
$strYY# B
;YYB C
returnZZ 
textZZ 
.ZZ 
ReplaceZZ 
(ZZ  
beginZZ  %
,ZZ% &
$strZZ' )
)ZZ) *
.ZZ* +
ReplaceZZ+ 2
(ZZ2 3
endZZ3 6
,ZZ6 7
$strZZ8 :
)ZZ: ;
;ZZ; <
}[[ 	
;[[	 

private]] 
static]] 
string]] 
GetKeyFromFile]] ,
(]], -
string]]- 3
file]]4 8
,]]8 9
string]]: @
beginString]]A L
,]]L M
string]]N T
	endString]]U ^
,]]^ _
Func]]` d
<]]d e
string]]e k
,]]k l
string]]m s
,]]s t
string]]u {
,]]{ |
string	]]} �
>
]]� �
func
]]� �
,
]]� �
Encoding
]]� �
encoding
]]� �
=
]]� �
null
]]� �
)
]]� �
{^^ 	
ArgumentValidator__ 
.__ 
Validate__ &
(__& '
file__' +
)__+ ,
;__, -
ifaa 
(aa 
encodingaa 
==aa 
nullaa  
)aa  !
encodingaa" *
=aa+ ,
Encodingaa- 5
.aa5 6
UTF8aa6 :
;aa: ;
stringcc 
textcc 
=cc 
Filecc 
.cc 
ReadAllTextcc *
(cc* +
filecc+ /
,cc/ 0
encodingcc1 9
)cc9 :
;cc: ;
returnee 
funcee 
(ee 
textee 
,ee 
beginStringee )
,ee) *
	endStringee+ 4
)ee4 5
;ee5 6
}ff 	
publicoo 
stringoo 
Encryptoo 
(oo 
stringoo $
dataoo% )
,oo) *
stringoo+ 1
	publicKeyoo2 ;
,oo; <
Encodingoo= E
encodingooF N
=ooO P
nullooQ U
)ooU V
{pp 	
ArgumentValidatorqq 
.qq 
Validateqq &
(qq& '
dataqq' +
,qq+ ,
	publicKeyqq- 6
)qq6 7
;qq7 8
usingss 
(ss $
RSACryptoServiceProviderss +
rsass, /
=ss0 1*
CreateRsaProviderFromPublicKeyss2 P
(ssP Q
	publicKeyssQ Z
)ssZ [
)ss[ \
{tt 
returnuu 
Convertuu 
.uu 
ToBase64Stringuu -
(uu- .
rsauu. 1
.uu1 2
Encryptuu2 9
(uu9 :
encodinguu: B
.uuB C
GetBytesuuC K
(uuK L
datauuL P
)uuP Q
,uuQ R
falseuuS X
)uuX Y
)uuY Z
;uuZ [
}vv 
}ww 	
public
�� 
string
�� 
Decrypt
�� 
(
�� 
string
�� $
cipher
��% +
,
��+ ,
string
��- 3

privateKey
��4 >
,
��> ?
Encoding
��@ H
encoding
��I Q
=
��R S
null
��T X
)
��X Y
{
�� 	
ArgumentValidator
�� 
.
�� 
Validate
�� &
(
��& '
cipher
��' -
,
��- .

privateKey
��/ 9
)
��9 :
;
��: ;
if
�� 
(
�� 
encoding
�� 
==
�� 
null
��  
)
��  !
encoding
��" *
=
��+ ,
Encoding
��- 5
.
��5 6
UTF8
��6 :
;
��: ;
using
�� 
(
�� &
RSACryptoServiceProvider
�� +
rsa
��, /
=
��0 1-
CreateRsaProviderFromPrivateKey
��2 Q
(
��Q R

privateKey
��R \
)
��\ ]
)
��] ^
{
�� 
return
�� 
encoding
�� 
.
��  
	GetString
��  )
(
��) *
rsa
��* -
.
��- .
Decrypt
��. 5
(
��5 6
Convert
��6 =
.
��= >
FromBase64String
��> N
(
��N O
cipher
��O U
)
��U V
,
��V W
false
��X ]
)
��] ^
)
��^ _
;
��_ `
}
�� 
}
�� 	
private
�� &
RSACryptoServiceProvider
�� (-
CreateRsaProviderFromPrivateKey
��) H
(
��H I
string
��I O

privateKey
��P Z
)
��Z [
{
�� 	
var
�� 
privateKeyBits
�� 
=
��  
Convert
��! (
.
��( )
FromBase64String
��) 9
(
��9 :

privateKey
��: D
)
��D E
;
��E F
var
�� 
	parameter
�� 
=
�� 
new
�� 
RSAParameters
��  -
(
��- .
)
��. /
;
��/ 0
using
�� 
(
�� 
BinaryReader
�� 
reader
��  &
=
��' (
new
��) ,
BinaryReader
��- 9
(
��9 :
new
��: =
MemoryStream
��> J
(
��J K
privateKeyBits
��K Y
)
��Y Z
)
��Z [
)
��[ \
{
�� 
byte
�� 
bt
�� 
=
�� 
$num
�� 
;
�� 
ushort
�� 
twobytes
�� 
=
��  !
$num
��" #
;
��# $
twobytes
�� 
=
�� 
reader
�� !
.
��! "

ReadUInt16
��" ,
(
��, -
)
��- .
;
��. /
if
�� 
(
�� 
twobytes
�� 
==
�� 
$num
��  &
)
��& '
reader
��( .
.
��. /
ReadByte
��/ 7
(
��7 8
)
��8 9
;
��9 :
else
�� 
if
�� 
(
�� 
twobytes
�� !
==
��" $
$num
��% +
)
��+ ,
reader
��- 3
.
��3 4
	ReadInt16
��4 =
(
��= >
)
��> ?
;
��? @
else
�� 
throw
�� 
new
�� 
	Exception
�� (
(
��( )
$str
��) R
)
��R S
;
��S T
twobytes
�� 
=
�� 
reader
�� !
.
��! "

ReadUInt16
��" ,
(
��, -
)
��- .
;
��. /
if
�� 
(
�� 
twobytes
�� 
!=
�� 
$num
��  &
)
��& '
throw
��( -
new
��. 1
	Exception
��2 ;
(
��; <
$str
��< P
)
��P Q
;
��Q R
bt
�� 
=
�� 
reader
�� 
.
�� 
ReadByte
�� $
(
��$ %
)
��% &
;
��& '
if
�� 
(
�� 
bt
�� 
!=
�� 
$num
�� 
)
�� 
throw
��  %
new
��& )
	Exception
��* 3
(
��3 4
$str
��4 [
)
��[ \
;
��\ ]
	parameter
�� 
.
�� 
Modulus
�� !
=
��" #
reader
��$ *
.
��* +
	ReadBytes
��+ 4
(
��4 5
GetIntegerSize
��5 C
(
��C D
reader
��D J
)
��J K
)
��K L
;
��L M
	parameter
�� 
.
�� 
Exponent
�� "
=
��# $
reader
��% +
.
��+ ,
	ReadBytes
��, 5
(
��5 6
GetIntegerSize
��6 D
(
��D E
reader
��E K
)
��K L
)
��L M
;
��M N
	parameter
�� 
.
�� 
D
�� 
=
�� 
reader
�� $
.
��$ %
	ReadBytes
��% .
(
��. /
GetIntegerSize
��/ =
(
��= >
reader
��> D
)
��D E
)
��E F
;
��F G
	parameter
�� 
.
�� 
P
�� 
=
�� 
reader
�� $
.
��$ %
	ReadBytes
��% .
(
��. /
GetIntegerSize
��/ =
(
��= >
reader
��> D
)
��D E
)
��E F
;
��F G
	parameter
�� 
.
�� 
Q
�� 
=
�� 
reader
�� $
.
��$ %
	ReadBytes
��% .
(
��. /
GetIntegerSize
��/ =
(
��= >
reader
��> D
)
��D E
)
��E F
;
��F G
	parameter
�� 
.
�� 
DP
�� 
=
�� 
reader
�� %
.
��% &
	ReadBytes
��& /
(
��/ 0
GetIntegerSize
��0 >
(
��> ?
reader
��? E
)
��E F
)
��F G
;
��G H
	parameter
�� 
.
�� 
DQ
�� 
=
�� 
reader
�� %
.
��% &
	ReadBytes
��& /
(
��/ 0
GetIntegerSize
��0 >
(
��> ?
reader
��? E
)
��E F
)
��F G
;
��G H
	parameter
�� 
.
�� 
InverseQ
�� "
=
��# $
reader
��% +
.
��+ ,
	ReadBytes
��, 5
(
��5 6
GetIntegerSize
��6 D
(
��D E
reader
��E K
)
��K L
)
��L M
;
��M N
}
�� 
using
�� 
(
�� &
RSACryptoServiceProvider
�� +
rsa
��, /
=
��0 1
new
��2 5&
RSACryptoServiceProvider
��6 N
(
��N O
)
��O P
)
��P Q
{
�� 
rsa
�� 
.
�� 
ImportParameters
�� $
(
��$ %
	parameter
��% .
)
��. /
;
��/ 0
return
�� 
rsa
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
int
�� 
GetIntegerSize
�� "
(
��" #
BinaryReader
��# /
binr
��0 4
)
��4 5
{
�� 	
byte
�� 
bt
�� 
=
�� 
$num
�� 
;
�� 
byte
�� 
lowbyte
�� 
=
�� 
$num
�� 
;
��  
byte
�� 
highbyte
�� 
=
�� 
$num
��  
;
��  !
int
�� 
count
�� 
=
�� 
$num
�� 
;
�� 
bt
�� 
=
�� 
binr
�� 
.
�� 
ReadByte
�� 
(
�� 
)
��  
;
��  !
if
�� 
(
�� 
bt
�� 
!=
�� 
$num
�� 
)
�� 
return
�� "
$num
��# $
;
��$ %
bt
�� 
=
�� 
binr
�� 
.
�� 
ReadByte
�� 
(
�� 
)
��  
;
��  !
if
�� 
(
�� 
bt
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
count
�� 
=
�� 
binr
�� 
.
�� 
ReadByte
�� %
(
��% &
)
��& '
;
��' (
}
�� 
else
�� 
if
�� 
(
�� 
bt
�� 
==
�� 
$num
�� 
)
��  
{
�� 
highbyte
�� 
=
�� 
binr
�� 
.
��  
ReadByte
��  (
(
��( )
)
��) *
;
��* +
lowbyte
�� 
=
�� 
binr
�� 
.
�� 
ReadByte
�� '
(
��' (
)
��( )
;
��) *
byte
�� 
[
�� 
]
�� 
modint
�� 
=
�� 
{
��  !
lowbyte
��" )
,
��) *
highbyte
��+ 3
,
��3 4
$num
��5 9
,
��9 :
$num
��; ?
}
��@ A
;
��A B
count
�� 
=
�� 
BitConverter
�� $
.
��$ %
ToInt32
��% ,
(
��, -
modint
��- 3
,
��3 4
$num
��5 6
)
��6 7
;
��7 8
}
�� 
else
�� 
{
�� 
count
�� 
=
�� 
bt
�� 
;
�� 
}
�� 
while
�� 
(
�� 
binr
�� 
.
�� 
ReadByte
��  
(
��  !
)
��! "
==
��# %
$num
��& *
)
��* +
{
�� 
count
�� 
-=
�� 
$num
�� 
;
�� 
}
�� 
binr
�� 
.
�� 

BaseStream
�� 
.
�� 
Seek
��  
(
��  !
-
��! "
$num
��" #
,
��# $

SeekOrigin
��% /
.
��/ 0
Current
��0 7
)
��7 8
;
��8 9
return
�� 
count
�� 
;
�� 
}
�� 	
private
�� &
RSACryptoServiceProvider
�� (,
CreateRsaProviderFromPublicKey
��) G
(
��G H
string
��H N
publicKeyString
��O ^
)
��^ _
{
�� 	
byte
�� 
[
�� 
]
�� 
SeqOID
�� 
=
�� 
{
�� 
$num
�� "
,
��" #
$num
��$ (
,
��( )
$num
��* .
,
��. /
$num
��0 4
,
��4 5
$num
��6 :
,
��: ;
$num
��< @
,
��@ A
$num
��B F
,
��F G
$num
��H L
,
��L M
$num
��N R
,
��R S
$num
��T X
,
��X Y
$num
��Z ^
,
��^ _
$num
��` d
,
��d e
$num
��f j
,
��j k
$num
��l p
,
��p q
$num
��r v
}
��w x
;
��x y
byte
�� 
[
�� 
]
�� 
x509key
�� 
;
�� 
byte
�� 
[
�� 
]
�� 
seq
�� 
=
�� 
new
�� 
byte
�� !
[
��! "
$num
��" $
]
��$ %
;
��% &
int
�� 
x509size
�� 
;
�� 
x509key
�� 
=
�� 
Convert
�� 
.
�� 
FromBase64String
�� .
(
��. /
publicKeyString
��/ >
)
��> ?
;
��? @
x509size
�� 
=
�� 
x509key
�� 
.
�� 
Length
�� %
;
��% &
using
�� 
(
�� 
MemoryStream
�� 
mem
��  #
=
��$ %
new
��& )
MemoryStream
��* 6
(
��6 7
x509key
��7 >
)
��> ?
)
��? @
{
�� 
using
�� 
(
�� 
BinaryReader
�� #
binr
��$ (
=
��) *
new
��+ .
BinaryReader
��/ ;
(
��; <
mem
��< ?
)
��? @
)
��@ A
{
�� 
byte
�� 
bt
�� 
=
�� 
$num
�� 
;
��  
ushort
�� 
twobytes
�� #
=
��$ %
$num
��& '
;
��' (
twobytes
�� 
=
�� 
binr
�� #
.
��# $

ReadUInt16
��$ .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
twobytes
��  
==
��! #
$num
��$ *
)
��* +
binr
�� 
.
�� 
ReadByte
�� %
(
��% &
)
��& '
;
��' (
else
�� 
if
�� 
(
�� 
twobytes
�� %
==
��& (
$num
��) /
)
��/ 0
binr
�� 
.
�� 
	ReadInt16
�� &
(
��& '
)
��' (
;
��( )
else
�� 
return
�� 
null
�� #
;
��# $
seq
�� 
=
�� 
binr
�� 
.
�� 
	ReadBytes
�� (
(
��( )
$num
��) +
)
��+ ,
;
��, -
if
�� 
(
�� 
!
�� 
CompareByteArrays
�� *
(
��* +
seq
��+ .
,
��. /
SeqOID
��0 6
)
��6 7
)
��7 8
return
�� 
null
�� #
;
��# $
twobytes
�� 
=
�� 
binr
�� #
.
��# $

ReadUInt16
��$ .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
twobytes
��  
==
��! #
$num
��$ *
)
��* +
binr
�� 
.
�� 
ReadByte
�� %
(
��% &
)
��& '
;
��' (
else
�� 
if
�� 
(
�� 
twobytes
�� %
==
��& (
$num
��) /
)
��/ 0
binr
�� 
.
�� 
	ReadInt16
�� &
(
��& '
)
��' (
;
��( )
else
�� 
return
�� 
null
�� #
;
��# $
bt
�� 
=
�� 
binr
�� 
.
�� 
ReadByte
�� &
(
��& '
)
��' (
;
��( )
if
�� 
(
�� 
bt
�� 
!=
�� 
$num
�� "
)
��" #
return
�� 
null
�� #
;
��# $
twobytes
�� 
=
�� 
binr
�� #
.
��# $

ReadUInt16
��$ .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
twobytes
��  
==
��! #
$num
��$ *
)
��* +
binr
�� 
.
�� 
ReadByte
�� %
(
��% &
)
��& '
;
��' (
else
�� 
if
�� 
(
�� 
twobytes
�� %
==
��& (
$num
��) /
)
��/ 0
binr
�� 
.
�� 
	ReadInt16
�� &
(
��& '
)
��' (
;
��( )
else
�� 
return
�� 
null
�� #
;
��# $
twobytes
�� 
=
�� 
binr
�� #
.
��# $

ReadUInt16
��$ .
(
��. /
)
��/ 0
;
��0 1
byte
�� 
lowbyte
��  
=
��! "
$num
��# '
;
��' (
byte
�� 
highbyte
�� !
=
��" #
$num
��$ (
;
��( )
if
�� 
(
�� 
twobytes
��  
==
��! #
$num
��$ *
)
��* +
lowbyte
�� 
=
��  !
binr
��" &
.
��& '
ReadByte
��' /
(
��/ 0
)
��0 1
;
��1 2
else
�� 
if
�� 
(
�� 
twobytes
�� %
==
��& (
$num
��) /
)
��/ 0
{
�� 
highbyte
��  
=
��! "
binr
��# '
.
��' (
ReadByte
��( 0
(
��0 1
)
��1 2
;
��2 3
lowbyte
�� 
=
��  !
binr
��" &
.
��& '
ReadByte
��' /
(
��/ 0
)
��0 1
;
��1 2
}
�� 
else
�� 
return
�� 
null
�� #
;
��# $
byte
�� 
[
�� 
]
�� 
modint
�� !
=
��" #
{
��$ %
lowbyte
��& -
,
��- .
highbyte
��/ 7
,
��7 8
$num
��9 =
,
��= >
$num
��? C
}
��D E
;
��E F
int
�� 
modsize
�� 
=
��  !
BitConverter
��" .
.
��. /
ToInt32
��/ 6
(
��6 7
modint
��7 =
,
��= >
$num
��? @
)
��@ A
;
��A B
int
�� 
	firstbyte
�� !
=
��" #
binr
��$ (
.
��( )
PeekChar
��) 1
(
��1 2
)
��2 3
;
��3 4
if
�� 
(
�� 
	firstbyte
�� !
==
��" $
$num
��% )
)
��) *
{
�� 
binr
�� 
.
�� 
ReadByte
�� %
(
��% &
)
��& '
;
��' (
modsize
�� 
-=
��  "
$num
��# $
;
��$ %
}
�� 
byte
�� 
[
�� 
]
�� 
modulus
�� "
=
��# $
binr
��% )
.
��) *
	ReadBytes
��* 3
(
��3 4
modsize
��4 ;
)
��; <
;
��< =
if
�� 
(
�� 
binr
�� 
.
�� 
ReadByte
�� %
(
��% &
)
��& '
!=
��( *
$num
��+ /
)
��/ 0
return
�� 
null
�� #
;
��# $
int
�� 
expbytes
��  
=
��! "
binr
��# '
.
��' (
ReadByte
��( 0
(
��0 1
)
��1 2
;
��2 3
byte
�� 
[
�� 
]
�� 
exponent
�� #
=
��$ %
binr
��& *
.
��* +
	ReadBytes
��+ 4
(
��4 5
expbytes
��5 =
)
��= >
;
��> ?
using
�� 
(
�� &
RSACryptoServiceProvider
�� 3
RSA
��4 7
=
��8 9
new
��: =&
RSACryptoServiceProvider
��> V
(
��V W
)
��W X
)
��X Y
{
�� 
RSAParameters
�� %

RSAKeyInfo
��& 0
=
��1 2
new
��3 6
RSAParameters
��7 D
(
��D E
)
��E F
;
��F G

RSAKeyInfo
�� "
.
��" #
Modulus
��# *
=
��+ ,
modulus
��- 4
;
��4 5

RSAKeyInfo
�� "
.
��" #
Exponent
��# +
=
��, -
exponent
��. 6
;
��6 7
RSA
�� 
.
�� 
ImportParameters
�� ,
(
��, -

RSAKeyInfo
��- 7
)
��7 8
;
��8 9
return
�� 
RSA
�� "
;
��" #
}
�� 
}
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 
CompareByteArrays
�� &
(
��& '
byte
��' +
[
��+ ,
]
��, -
a
��. /
,
��/ 0
byte
��1 5
[
��5 6
]
��6 7
b
��8 9
)
��9 :
{
�� 	
if
�� 
(
�� 
a
�� 
.
�� 
Length
�� 
!=
�� 
b
�� 
.
�� 
Length
�� $
)
��$ %
return
��& ,
false
��- 2
;
��2 3
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
foreach
�� 
(
�� 
byte
�� 
c
�� 
in
�� 
a
��  
)
��  !
{
�� 
if
�� 
(
�� 
c
�� 
!=
�� 
b
�� 
[
�� 
i
�� 
]
�� 
)
�� 
return
�� %
false
��& +
;
��+ ,
i
�� 
++
�� 
;
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
}
�� 
internal
�� 
static
�� 
class
�� *
RSAOpenSslSingletonContainer
�� 6
{
�� 
internal
�� 
static
�� 

RSAOpenSsl
�� "
Instance
��# +
=
��, -
new
��. 1

RSAOpenSsl
��2 <
(
��< =
)
��= >
;
��> ?
}
�� 
}�� �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Asymmetric\RSASizeTypes.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;

Asymmetric; E
{ 
[ 
DefaultValue 
( 
L2048 
) 
] 
public		 

enum		 
RSASizeTypes		 
{

 
L1024 
= 
$num 
, 
L2048 
= 
$num 
, 
L3072 
= 
$num 
, 
L4096 
= 
$num 
} 
} �
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Base64.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
{ 
public		 

class		 
Base64		 
{

 
public 
static 
string 
Encrypt $
($ %
string% +
data, 0
,0 1
Encoding2 :
encoding; C
=D E
nullF J
)J K
{ 	
if 
( 
data 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
data7 ;
); <
)< =
;= >
} 
if 
( 
encoding 
== 
null  
)  !
{ 
encoding 
= 
Encoding #
.# $
UTF8$ (
;( )
} 
return 
Convert 
. 
ToBase64String )
() *
encoding* 2
.2 3
GetBytes3 ;
(; <
data< @
)@ A
)A B
;B C
} 	
public%% 
static%% 
string%% 
Decrypt%% $
(%%$ %
string%%% +
data%%, 0
,%%0 1
Encoding%%2 :
encoding%%; C
=%%D E
null%%F J
)%%J K
{&& 	
if'' 
('' 
data'' 
=='' 
null'' 
)'' 
{(( 
throw)) 
new)) !
ArgumentNullException)) /
())/ 0
nameof))0 6
())6 7
data))7 ;
))); <
)))< =
;))= >
}** 
if++ 
(++ 
encoding++ 
==++ 
null++  
)++  !
{,, 
encoding-- 
=-- 
Encoding-- #
.--# $
UTF8--$ (
;--( )
}.. 
return00 
encoding00 
.00 
	GetString00 %
(00% &
Convert00& -
.00- .
FromBase64String00. >
(00> ?
data00? C
)00C D
)00D E
;00E F
}11 	
}22 
}33 �0
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\Abstraction\CrcHashAlgorithm.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
.D E
AbstractionE P
{		 
public 

abstract 
class 
CrcHashAlgorithm *
<* +
TTable+ 1
>1 2
:3 4
HashAlgorithm5 B
whereC H
TTableI O
:P Q
structR X
{ 
	protected 
static 

Dictionary #
<# $
string$ *
,* +
TTable, 2
[2 3
]3 4
>4 5
Tables6 <
== >
null? C
;C D
internal 
static 

Dictionary "
<" #
string# )
,) *
CrcParamter+ 6
<6 7
TTable7 =
>= >
>> ?
	Paramters@ I
=J K
nullL P
;P Q
	protected 
TTable 
Mask 
; 
	protected"" 
TTable"" 
["" 
]"" 
Table""  
=""! "
null""# '
;""' (
internal'' 
CrcParamter'' 
<'' 
TTable'' #
>''# $
Paramter''% -
=''. /
null''0 4
;''4 5
	protected,, 
TTable,, 

FinalValue,, #
;,,# $
public44 
CRCTypes44 
CrcType44 
{44  !
get44" %
;44% &
set44' *
;44* +
}44, -
public<< 
string<< 
CrcName<< 
{<< 
get<<  #
;<<# $
private<<% ,
set<<- 0
;<<0 1
}<<2 3
publicAA 
overrideAA 
intAA 
HashSizeAA $
=>AA% '
ParamterAA( 0
.AA0 1
WidthAA1 6
;AA6 7
privateCC 
boolCC 
computedCC 
=CC 
falseCC  %
;CC% &
publicII 
CrcHashAlgorithmII 
(II  
CRCTypesII  (
typeII) -
)II- .
{JJ 	
	FieldInfoKK 
fiKK 
=KK 
typeKK 
.KK  
GetTypeKK  '
(KK' (
)KK( )
.KK) *
GetFieldKK* 2
(KK2 3
typeKK3 7
.KK7 8
ToStringKK8 @
(KK@ A
)KKA B
)KKB C
;KKC D 
DescriptionAttributeLL  
mLL! "
=LL# $
fiLL% '
.LL' (
GetCustomAttributesLL( ;
(LL; <
typeofLL< B
(LLB C 
DescriptionAttributeLLC W
)LLW X
,LLX Y
falseLLZ _
)LL_ `
.LL` a
SingleLLa g
(LLg h
)LLh i
asLLj l!
DescriptionAttribute	LLm �
;
LL� �
ifMM 
(MM 
mMM 
==MM 
nullMM 
)MM 
throwMM  
newMM! $!
ArgumentNullExceptionMM% :
(MM: ;
$strMM; ]
)MM] ^
;MM^ _
CrcNameOO 
=OO 
mOO 
.OO 
DescriptionOO #
;OO# $
ifQQ 
(QQ 
!QQ 
	ParamtersQQ 
.QQ 
ContainsKeyQQ &
(QQ& '
CrcNameQQ' .
)QQ. /
)QQ/ 0
throwQQ1 6
newQQ7 :
ArgumentExceptionQQ; L
(QQL M
)QQM N
;QQN O
ParamterSS 
=SS 
	ParamtersSS  
[SS  !
CrcNameSS! (
]SS( )
;SS) *
CrcTypeTT 
=TT 
typeTT 
;TT 
}UU 	
publicZZ 
overrideZZ 
voidZZ 

InitializeZZ '
(ZZ' (
)ZZ( )
{[[ 	
if\\ 
(\\ 
!\\ 
Tables\\ 
.\\ 
ContainsKey\\ #
(\\# $
CrcName\\$ +
)\\+ ,
)\\, -
Tables\\. 4
.\\4 5
Add\\5 8
(\\8 9
CrcName\\9 @
,\\@ A
Generate\\B J
(\\J K
Paramter\\K S
)\\S T
)\\T U
;\\U V
Table^^ 
=^^ 
Tables^^ 
[^^ 
CrcName^^ "
]^^" #
;^^# $
}__ 	
	protectedgg 
overridegg 
voidgg 
HashCoregg  (
(gg( )
bytegg) -
[gg- .
]gg. /
arraygg0 5
,gg5 6
intgg7 :
offsetgg; A
,ggA B
intggC F
lengthggG M
)ggM N
{hh 	
HashCoreImplementii 
(ii 
arrayii #
,ii# $
offsetii% +
,ii+ ,
lengthii- 3
)ii3 4
;ii4 5
computedkk 
=kk 
truekk 
;kk 
}ll 	
publicss 
TTabless 
ComputeChecksumss %
(ss% &
)ss& '
{tt 	
ifuu 
(uu 
!uu 
computeduu 
)uu 
throwuu  
newuu! $%
InvalidOperationExceptionuu% >
(uu> ?
$struu? ]
)uu] ^
;uu^ _
returnww 

FinalValueww 
;ww 
}xx 	
internal 
abstract 
TTable  
[  !
]! "
Generate# +
(+ ,
CrcParamter, 7
<7 8
TTable8 >
>> ?
paramter@ H
)H I
;I J
internal
�� 
abstract
�� 
void
�� 
HashCoreImplement
�� 0
(
��0 1
byte
��1 5
[
��5 6
]
��6 7
array
��8 =
,
��= >
int
��? B
offset
��C I
,
��I J
int
��K N
length
��O U
)
��U V
;
��V W
}
�� 
}�� ��
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\Abstraction\CrcHashAlgorithmHelper.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
.D E
AbstractionE P
{ 
internal 
class "
CrcHashAlgorithmHelper )
{ 
public 
static 
ulong 
[ 
] 
GenerateTable +
(+ ,
ulong, 1
poly2 6
,6 7
int8 ;
width< A
,A B
boolC G
inputH M
,M N
ulongO T
maskU Y
)Y Z
{ 	
ulong		 
[		 
]		 
array		 
=		 
new		 
ulong		  %
[		% &
$num		& )
]		) *
;		* +
for 
( 
ulong 
i 
= 
$num 
; 
i 
<  !
$num" %
;% &
i' (
++( *
)* +
{ 
array 
[ 
i 
] 
= 
GenerateTableItem ,
(, -
i- .
,. /
poly0 4
,4 5
width6 ;
,; <
input= B
,B C
maskD H
)H I
;I J
} 
return 
array 
; 
} 	
public 
static 
uint 
[ 
] 
GenerateTable *
(* +
uint+ /
poly0 4
,4 5
int6 9
width: ?
,? @
boolA E
inputF K
,K L
uintM Q
maskR V
)V W
{ 	
uint 
[ 
] 
array 
= 
new 
uint #
[# $
$num$ '
]' (
;( )
for 
( 
uint 
i 
= 
$num 
; 
i 
<  
$num! $
;$ %
i& '
++' )
)) *
{ 
array 
[ 
i 
] 
= 
GenerateTableItem ,
(, -
i- .
,. /
poly0 4
,4 5
width6 ;
,; <
input= B
,B C
maskD H
)H I
;I J
} 
return 
array 
; 
} 	
public 
static 
ushort 
[ 
] 
GenerateTable ,
(, -
ushort- 3
poly4 8
,8 9
int: =
width> C
,C D
boolE I
inputJ O
,O P
ushortQ W
maskX \
)\ ]
{ 	
ushort 
[ 
] 
array 
= 
new  
ushort! '
[' (
$num( +
]+ ,
;, -
for!! 
(!! 
ushort!! 
i!! 
=!! 
$num!! 
;!! 
i!!  
<!!! "
$num!!# &
;!!& '
i!!( )
++!!) +
)!!+ ,
{"" 
array## 
[## 
i## 
]## 
=## 
GenerateTableItem## ,
(##, -
i##- .
,##. /
poly##0 4
,##4 5
width##6 ;
,##; <
input##= B
,##B C
mask##D H
)##H I
;##I J
}$$ 
return&& 
array&& 
;&& 
}'' 	
public(( 
static(( 
byte(( 
[(( 
](( 
GenerateTable(( *
(((* +
byte((+ /
poly((0 4
,((4 5
int((6 9
width((: ?
,((? @
bool((A E
input((F K
,((K L
byte((M Q
mask((R V
)((V W
{)) 	
byte** 
[** 
]** 
array** 
=** 
new** 
byte** #
[**# $
$num**$ '
]**' (
;**( )
for,, 
(,, 
byte,, 
i,, 
=,, 
$num,, 
;,, 
i,, 
<=,, !
$num,," %
;,,% &
i,,' (
++,,( *
),,* +
{-- 
array.. 
[.. 
i.. 
].. 
=.. 
GenerateTableItem.. ,
(.., -
i..- .
,... /
poly..0 4
,..4 5
width..6 ;
,..; <
input..= B
,..B C
mask..D H
)..H I
;..I J
}// 
return11 
array11 
;11 
}22 	
public44 
static44 
ulong44 
GenerateTableItem44 -
(44- .
ulong44. 3
index444 9
,449 :
ulong44; @
poly44A E
,44E F
int44G J
width44K P
,44P Q
bool44R V
input44W \
,44\ ]
ulong44^ c
mask44d h
)44h i
{55 	
ulong66 
r66 
=66 
index66 
;66 
if88 
(88 
input88 
)88 
r88 
=88 
ReverseBits88 &
(88& '
r88' (
,88( )
width88* /
)88/ 0
;880 1
else99 
if99 
(99 
width99 
>99 
$num99 
)99 
r99  !
<<=99" %
width99& +
-99, -
$num99. /
;99/ 0
ulong;; 
lastBit;; 
=;; 
(;; 
ulong;; "
);;" #
(;;# $
$num;;$ %
<<;;& (
(;;) *
byte;;* .
);;. /
(;;/ 0
width;;0 5
-;;6 7
$num;;8 9
);;9 :
);;: ;
;;;; <
for== 
(== 
int== 
i== 
=== 
$num== 
;== 
i== 
<== 
$num==  !
;==! "
i==# $
++==$ &
)==& '
{>> 
if?? 
(?? 
(?? 
r?? 
&?? 
lastBit??  
)??  !
!=??" $
$num??% &
)??& '
r??( )
=??* +
r??, -
<<??. 0
$num??1 2
^??3 4
poly??5 9
;??9 :
else@@ 
r@@ 
<<=@@ 
$num@@ 
;@@ 
}AA 
ifCC 
(CC 
inputCC 
)CC 
rCC 
=CC 
ReverseBitsCC &
(CC& '
rCC' (
,CC( )
widthCC* /
)CC/ 0
;CC0 1
returnEE 
rEE 
&EE 
maskEE 
;EE 
}FF 	
publicHH 
staticHH 
uintHH 
GenerateTableItemHH ,
(HH, -
uintHH- 1
indexHH2 7
,HH7 8
uintHH9 =
polyHH> B
,HHB C
intHHD G
widthHHH M
,HHM N
boolHHO S
inputHHT Y
,HHY Z
uintHH[ _
maskHH` d
)HHd e
{II 	
uintJJ 
rJJ 
=JJ 
indexJJ 
;JJ 
ifLL 
(LL 
inputLL 
)LL 
rLL 
=LL 
ReverseBitsLL &
(LL& '
rLL' (
,LL( )
widthLL* /
)LL/ 0
;LL0 1
elseMM 
ifMM 
(MM 
widthMM 
>MM 
$numMM 
)MM 
rMM  !
<<=MM" %
widthMM& +
-MM, -
$numMM. /
;MM/ 0
uintOO 
lastBitOO 
=OO 
(OO 
uintOO  
)OO  !
(OO! "
$numOO" #
<<OO$ &
(OO' (
byteOO( ,
)OO, -
(OO- .
widthOO. 3
-OO4 5
$numOO6 7
)OO7 8
)OO8 9
;OO9 :
forQQ 
(QQ 
intQQ 
iQQ 
=QQ 
$numQQ 
;QQ 
iQQ 
<QQ 
$numQQ  !
;QQ! "
iQQ# $
++QQ$ &
)QQ& '
{RR 
ifSS 
(SS 
(SS 
rSS 
&SS 
lastBitSS  
)SS  !
!=SS" $
$numSS% &
)SS& '
rSS( )
=SS* +
rSS, -
<<SS. 0
$numSS1 2
^SS3 4
polySS5 9
;SS9 :
elseTT 
rTT 
<<=TT 
$numTT 
;TT 
}UU 
ifWW 
(WW 
inputWW 
)WW 
rWW 
=WW 
ReverseBitsWW &
(WW& '
rWW' (
,WW( )
widthWW* /
)WW/ 0
;WW0 1
returnYY 
rYY 
&YY 
maskYY 
;YY 
}ZZ 	
public\\ 
static\\ 
ushort\\ 
GenerateTableItem\\ .
(\\. /
ushort\\/ 5
index\\6 ;
,\\; <
ushort\\= C
poly\\D H
,\\H I
int\\J M
width\\N S
,\\S T
bool\\U Y
input\\Z _
,\\_ `
ushort\\a g
mask\\h l
)\\l m
{]] 	
ushort^^ 
r^^ 
=^^ 
index^^ 
;^^ 
if`` 
(`` 
input`` 
)`` 
r`` 
=`` 
ReverseBits`` &
(``& '
r``' (
,``( )
width``* /
)``/ 0
;``0 1
elseaa 
ifaa 
(aa 
widthaa 
>aa 
$numaa 
)aa 
raa  !
<<=aa" %
widthaa& +
-aa, -
$numaa. /
;aa/ 0
ushortcc 
lastBitcc 
=cc 
(cc 
ushortcc $
)cc$ %
(cc% &
$numcc& '
<<cc( *
(cc+ ,
bytecc, 0
)cc0 1
(cc1 2
widthcc2 7
-cc8 9
$numcc: ;
)cc; <
)cc< =
;cc= >
foree 
(ee 
intee 
iee 
=ee 
$numee 
;ee 
iee 
<ee 
$numee  !
;ee! "
iee# $
++ee$ &
)ee& '
{ff 
ifgg 
(gg 
(gg 
rgg 
&gg 
lastBitgg  
)gg  !
!=gg" $
$numgg% &
)gg& '
rgg( )
=gg* +
(gg, -
ushortgg- 3
)gg3 4
(gg4 5
rgg5 6
<<gg7 9
$numgg: ;
^gg< =
polygg> B
)ggB C
;ggC D
elsehh 
rhh 
<<=hh 
$numhh 
;hh 
}ii 
ifkk 
(kk 
inputkk 
)kk 
rkk 
=kk 
ReverseBitskk &
(kk& '
rkk' (
,kk( )
widthkk* /
)kk/ 0
;kk0 1
returnmm 
(mm 
ushortmm 
)mm 
(mm 
rmm 
&mm 
maskmm  $
)mm$ %
;mm% &
}nn 	
publicpp 
staticpp 
bytepp 
GenerateTableItempp ,
(pp, -
bytepp- 1
indexpp2 7
,pp7 8
bytepp9 =
polypp> B
,ppB C
intppD G
widthppH M
,ppM N
boolppO S
inputppT Y
,ppY Z
bytepp[ _
maskpp` d
)ppd e
{qq 	
byterr 
rrr 
=rr 
indexrr 
;rr 
iftt 
(tt 
inputtt 
)tt 
rtt 
=tt 
ReverseBitstt &
(tt& '
rtt' (
,tt( )
widthtt* /
)tt/ 0
;tt0 1
elseuu 
ifuu 
(uu 
widthuu 
>uu 
$numuu 
)uu 
ruu  !
<<=uu" %
widthuu& +
-uu, -
$numuu. /
;uu/ 0
byteww 
lastBitww 
=ww 
(ww 
byteww  
)ww  !
(ww! "
$numww" #
<<ww$ &
(ww' (
byteww( ,
)ww, -
(ww- .
widthww. 3
-ww4 5
$numww6 7
)ww7 8
)ww8 9
;ww9 :
foryy 
(yy 
intyy 
iyy 
=yy 
$numyy 
;yy 
iyy 
<yy 
$numyy  !
;yy! "
iyy# $
++yy$ &
)yy& '
{zz 
if{{ 
({{ 
({{ 
r{{ 
&{{ 
lastBit{{  
){{  !
!={{" $
$num{{% &
){{& '
r{{( )
={{* +
({{, -
byte{{- 1
){{1 2
({{2 3
r{{3 4
<<{{5 7
$num{{8 9
^{{: ;
poly{{< @
){{@ A
;{{A B
else|| 
r|| 
<<=|| 
$num|| 
;|| 
}}} 
if 
( 
input 
) 
r 
= 
ReverseBits &
(& '
r' (
,( )
width* /
)/ 0
;0 1
return
�� 
(
�� 
byte
�� 
)
�� 
(
�� 
r
�� 
&
�� 
mask
�� "
)
��" #
;
��# $
}
�� 	
internal
�� 
static
�� 
byte
�� 
ReverseBits
�� (
(
��( )
byte
��) -
value
��. 3
,
��3 4
int
��5 8
length
��9 ?
)
��? @
{
�� 	
byte
�� 
output
�� 
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
�� 
length
�� 
-
��  !
$num
��" #
;
��# $
i
��% &
>=
��' )
$num
��* +
;
��+ ,
i
��- .
--
��. 0
)
��0 1
{
�� 
output
�� 
|=
�� 
(
�� 
byte
�� 
)
��  
(
��  !
(
��! "
value
��" '
&
��( )
$num
��* +
)
��+ ,
<<
��- /
i
��0 1
)
��1 2
;
��2 3
value
�� 
>>=
�� 
$num
�� 
;
�� 
}
�� 
return
�� 
output
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
ushort
�� 
ReverseBits
�� *
(
��* +
ushort
��+ 1
value
��2 7
,
��7 8
int
��9 <
length
��= C
)
��C D
{
�� 	
ushort
�� 
output
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
length
�� 
-
��  !
$num
��" #
;
��# $
i
��% &
>=
��' )
$num
��* +
;
��+ ,
i
��- .
--
��. 0
)
��0 1
{
�� 
output
�� 
|=
�� 
(
�� 
ushort
�� !
)
��! "
(
��" #
(
��# $
value
��$ )
&
��* +
$num
��, -
)
��- .
<<
��/ 1
i
��2 3
)
��3 4
;
��4 5
value
�� 
>>=
�� 
$num
�� 
;
�� 
}
�� 
return
�� 
output
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
uint
�� 
ReverseBits
�� (
(
��( )
uint
��) -
value
��. 3
,
��3 4
int
��5 8
length
��9 ?
)
��? @
{
�� 	
uint
�� 
output
�� 
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
�� 
length
�� 
-
��  !
$num
��" #
;
��# $
i
��% &
>=
��' )
$num
��* +
;
��+ ,
i
��- .
--
��. 0
)
��0 1
{
�� 
output
�� 
|=
�� 
(
�� 
value
��  
&
��! "
$num
��# $
)
��$ %
<<
��& (
i
��) *
;
��* +
value
�� 
>>=
�� 
$num
�� 
;
�� 
}
�� 
return
�� 
output
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
ulong
�� 
ReverseBits
�� )
(
��) *
ulong
��* /
value
��0 5
,
��5 6
int
��7 :
length
��; A
)
��A B
{
�� 	
ulong
�� 
output
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
length
�� 
-
��  !
$num
��" #
;
��# $
i
��% &
>=
��' )
$num
��* +
;
��+ ,
i
��- .
--
��. 0
)
��0 1
{
�� 
output
�� 
|=
�� 
(
�� 
value
��  
&
��! "
$num
��# $
)
��$ %
<<
��& (
i
��) *
;
��* +
value
�� 
>>=
�� 
$num
�� 
;
�� 
}
�� 
return
�� 
output
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� 
ToBigEndianBytes
�� /
(
��/ 0
byte
��0 4
value
��5 :
)
��: ;
=>
��< >"
ToBigEndianBytesFunc
��? S
(
��S T
BitConverter
��T `
.
��` a
GetBytes
��a i
(
��i j
value
��j o
)
��o p
)
��p q
;
��q r
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� 
ToBigEndianBytes
�� /
(
��/ 0
ushort
��0 6
value
��7 <
)
��< =
=>
��> @"
ToBigEndianBytesFunc
��A U
(
��U V
BitConverter
��V b
.
��b c
GetBytes
��c k
(
��k l
value
��l q
)
��q r
)
��r s
;
��s t
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� 
ToBigEndianBytes
�� /
(
��/ 0
uint
��0 4
value
��5 :
)
��: ;
=>
��< >"
ToBigEndianBytesFunc
��? S
(
��S T
BitConverter
��T `
.
��` a
GetBytes
��a i
(
��i j
value
��j o
)
��o p
)
��p q
;
��q r
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� 
ToBigEndianBytes
�� /
(
��/ 0
ulong
��0 5
value
��6 ;
)
��; <
=>
��= ?"
ToBigEndianBytesFunc
��@ T
(
��T U
BitConverter
��U a
.
��a b
GetBytes
��b j
(
��j k
value
��k p
)
��p q
)
��q r
;
��r s
private
�� 
static
�� 
byte
�� 
[
�� 
]
�� "
ToBigEndianBytesFunc
�� 2
(
��2 3
byte
��3 7
[
��7 8
]
��8 9
result
��: @
)
��@ A
{
�� 	
if
�� 
(
�� 
BitConverter
�� 
.
�� 
IsLittleEndian
�� +
)
��+ ,
Array
��- 2
.
��2 3
Reverse
��3 :
(
��: ;
result
��; A
)
��A B
;
��B C
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\Abstraction\CrcParamter.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
.D E
AbstractionE P
{ 
internal 
class 
CrcParamter 
< 
TTable %
>% &
where' ,
TTable- 3
:4 5
struct6 <
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
TTable 

Polynomial  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
TTable 
XorValue 
{  
get! $
;$ %
set& )
;) *
}+ ,
public'' 
TTable'' !
RemainderInitialValue'' +
{'', -
get''. 1
;''1 2
set''3 6
;''6 7
}''8 9
public// 
TTable// 
XorResultValue// $
{//% &
get//' *
;//* +
set//, /
;/// 0
}//1 2
public77 
int77 
Width77 
{77 
get77 
;77 
set77  #
;77# $
}77% &
public?? 
bool?? 
RefInput?? 
{?? 
get?? "
;??" #
set??$ '
;??' (
}??) *
publicGG 
boolGG 
	RefOutputGG 
{GG 
getGG  #
;GG# $
setGG% (
;GG( )
}GG* +
publicLL 
CrcParamterLL 
(LL 
)LL 
{MM 	
}NN 	
publicZZ 
CrcParamterZZ 
(ZZ 
stringZZ !
nameZZ" &
,ZZ& '
TTableZZ( .

polynomialZZ/ 9
,ZZ9 :
TTableZZ; A
	remainderZZB K
,ZZK L
TTableZZM S
xorZZT W
,ZZW X
intZZY \
widthZZ] b
,ZZb c
boolZZd h
inputZZi n
,ZZn o
boolZZp t
outputZZu {
)ZZ{ |
{[[ 	
Name\\ 
=\\ 
name\\ 
;\\ 

Polynomial]] 
=]] 

polynomial]] #
;]]# $!
RemainderInitialValue^^ !
=^^" #
	remainder^^$ -
;^^- .
XorResultValue__ 
=__ 
xor__  
;__  !
Width`` 
=`` 
width`` 
;`` 
RefInputaa 
=aa 
inputaa 
;aa 
	RefOutputbb 
=bb 
outputbb 
;bb 
}cc 	
}dd 
}ee �L
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\CRCTypes.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
{ 
[ 
DefaultValue 
( 
	CRC16_ARC 
) 
] 
public		 

enum		 
CRCTypes		 
{

 
[ 	
Description	 
( 
$str 
) 
] 
CRC8 
, 
[ 	
Description	 
( 
$str %
)% &
]& '
CRC8_CDMA2000 
, 
[ 	
Description	 
( 
$str !
)! "
]" #
	CRC8_DARC 
, 
[ 	
Description	 
( 
$str #
)# $
]$ %
CRC8_DVB_S2 
, 
["" 	
Description""	 
("" 
$str""  
)""  !
]""! "
CRC8_EBU## 
,## 
['' 	
Description''	 
('' 
$str'' #
)''# $
]''$ %
CRC8_I_CODE(( 
,(( 
[,, 	
Description,,	 
(,, 
$str,,  
),,  !
],,! "
CRC8_ITU-- 
,-- 
[11 	
Description11	 
(11 
$str11 "
)11" #
]11# $

CRC8_MAXIM22 
,22 
[66 	
Description66	 
(66 
$str66 !
)66! "
]66" #
	CRC8_ROHC77 
,77 
[;; 	
Description;;	 
(;; 
$str;; "
);;" #
];;# $

CRC8_WCDMA<< 
,<< 
[AA 	
DescriptionAA	 
(AA 
$strAA 
)AA 
]AA 
CRC10BB 
,BB 
[FF 	
DescriptionFF	 
(FF 
$strFF &
)FF& '
]FF' (
CRC10_CDMA2000GG 
,GG 
[LL 	
DescriptionLL	 
(LL 
$strLL 
)LL 
]LL 
CRC11MM 
,MM 
[RR 	
DescriptionRR	 
(RR 
$strRR "
)RR" #
]RR# $

CRC12_3GPPSS 
,SS 
[WW 	
DescriptionWW	 
(WW 
$strWW &
)WW& '
]WW' (
CRC12_CDMA2000XX 
,XX 
[\\ 	
Description\\	 
(\\ 
$str\\ "
)\\" #
]\\# $

CRC12_DECT]] 
,]] 
[bb 	
Descriptionbb	 
(bb 
$strbb 
)bb 
]bb 
CRC13cc 
,cc 
[hh 	
Descriptionhh	 
(hh 
$strhh "
)hh" #
]hh# $

CRC14_DARCii 
,ii 
[nn 	
Descriptionnn	 
(nn 
$strnn 
)nn 
]nn 
CRC15oo 
,oo 
[ss 	
Descriptionss	 
(ss 
$strss %
)ss% &
]ss& '
CRC15_MPT1327tt 
,tt 
[yy 	
Descriptionyy	 
(yy 
$stryy $
)yy$ %
]yy% &
CRC16_DECT_Rzz 
,zz 
[~~ 	
Description~~	 
(~~ 
$str~~ $
)~~$ %
]~~% &
CRC16_DECT_X 
, 
[
�� 	
Description
��	 
(
�� 
$str
�� $
)
��$ %
]
��% &
CRC16_KERMIT
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
�� $
)
��$ %
]
��% &
CRC16_XMODEM
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
�� &
)
��& '
]
��' (
CRC16_TMS37157
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� '
)
��' (
]
��( )
CRC16_AUG_CCITT
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� $
)
��$ %
]
��% &
CRC16_RIELLO
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
�� 
)
��  
]
��  !
CRC16_A
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
CRC16_MCRF4XX
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
�� )
)
��) *
]
��* +
CRC16_CCITT_FALSE
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� "
)
��" #
]
��# $
	CRC16_X25
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
CRC16_GENIBUS
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
�� !
)
��! "
]
��" #
	CRC16_DNP
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� &
)
��& '
]
��' (
CRC16_EN13757
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
�� !
)
��! "
]
��" #
	CRC16_ARC
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
CRC16_BUYPASS
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
�� #
)
��# $
]
��$ %
CRC16_MAXIM
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
�� %
)
��% &
]
��& '
CRC16_DDS110
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
�� $
)
��$ %
]
��% &
CRC16_MODBUS
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
�� !
)
��! "
]
��" #
	CRC16_USB
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
CRC16_T10_DIF
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
�� &
)
��& '
]
��' (
CRC16_TELEDISK
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� &
)
��& '
]
��' (
CRC16_CDMA2000
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
CRC24
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� '
)
��' (
]
��( )
CRC24_FLEXRAY_A
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� '
)
��' (
]
��( )
CRC24_FLEXRAY_B
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
CRC31_PHILIPS
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
CRC32
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
CRC32_PHILIPS
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� "
)
��" #
]
��# $

CRC32_XFER
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� #
)
��# $
]
��$ %
CRC32_POSIX
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� $
)
��$ %
]
��% &
CRC32_JAMCRC
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� $
)
��$ %
]
��% &
CRC32_MPEG2
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� #
)
��# $
]
��$ %
CRC32_BZIP2
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� 
)
��  
]
��  !
CRC32_Q
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� 
)
��  
]
��  !
CRC32_D
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
	CRC40_GSM
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
CRC64
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
��  
)
��  !
]
��! "
CRC64_XZ
�� 
,
�� 
[
�� 	
Description
��	 
(
�� 
$str
��  
)
��  !
]
��! "
CRC64_WE
�� 
,
�� 
}
�� 
}�� ��
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\Implement\CRC16.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
.D E
	ImplementE N
{ 
public

 

sealed

 
class

 
CRC16

 
:

 
CrcHashAlgorithm

  0
<

0 1
ushort

1 7
>

7 8
{ 
static 
CRC16 
( 
) 
{ 	
Tables 
= 
new 

Dictionary #
<# $
string$ *
,* +
ushort, 2
[2 3
]3 4
>4 5
(5 6
)6 7
;7 8
	Paramters 
= 
new 

Dictionary &
<& '
string' -
,- .
CrcParamter/ :
<: ;
ushort; A
>A B
>B C
(C D
)D E
{F G
{ 
$str 
, 
new 
CrcParamter *
<* +
ushort+ 1
>1 2
(2 3
$str3 ;
,; <
$num= B
,B C
$numD I
,I J
$numJ O
,O P
$numP R
,R S
falseT Y
,Y Z
false[ `
)` a
}a b
,b c
{ 
$str #
,# $
new$ '
CrcParamter( 3
<3 4
ushort4 :
>: ;
(; <
$str< M
,M N
$numO T
,T U
$numV [
,[ \
$num\ a
,a b
$numb d
,d e
falsef k
,k l
falsem r
)r s
}s t
,t u
{ 
$str 
, 
new 
CrcParamter *
<* +
ushort+ 1
>1 2
(2 3
$str3 ;
,; <
$num= B
,B C
$numD I
,I J
$numJ O
,O P
$numP R
,R S
falseT Y
,Y Z
false[ `
)` a
}b c
,c d
{ 
$str 
,  
new  #
CrcParamter$ /
</ 0
ushort0 6
>6 7
(7 8
$str8 E
,E F
$numG L
,L M
$numN S
,S T
$numU Z
,Z [
$num\ ^
,^ _
false` e
,e f
trueg k
)k l
}m n
,n o
{ 
$str #
,# $
new$ '
CrcParamter( 3
<3 4
ushort4 :
>: ;
(; <
$str< M
,M N
$numO T
,T U
$numV [
,[ \
$num] c
,c d
$numd f
,f g
falseh m
,m n
falseo t
)t u
}u v
,v w
{ 
$str 
,  
new  #
CrcParamter$ /
</ 0
ushort0 6
>6 7
(7 8
$str8 E
,E F
$numG L
,L M
$numN S
,S T
$numU [
,[ \
$num] _
,_ `
falsea f
,f g
falseh m
)m n
}n o
,o p
{ 
$str 
, 
new "
CrcParamter# .
<. /
ushort/ 5
>5 6
(6 7
$str7 C
,C D
$numE K
,K L
$numM S
,S T
$numT Z
,Z [
$num[ ]
,] ^
false_ d
,d e
falsef k
)k l
}l m
,m n
{ 
$str 
,  
new  #
CrcParamter$ /
</ 0
ushort0 6
>6 7
(7 8
$str8 E
,E F
$numG M
,M N
$numO U
,U V
$numV \
,\ ]
$num] _
,_ `
truea e
,e f
trueg k
)k l
}l m
,m n
{!! 
$str!! 
,!! 
new!! 
CrcParamter!! *
<!!* +
ushort!!+ 1
>!!1 2
(!!2 3
$str!!3 ;
,!!; <
$num!!= C
,!!C D
$num!!E K
,!!K L
$num!!L R
,!!R S
$num!!S U
,!!U V
false!!W \
,!!\ ]
false!!^ c
)!!c d
}!!d e
,!!e f
{"" 
$str"" "
,""" #
new""# &
CrcParamter""' 2
<""2 3
ushort""3 9
>""9 :
("": ;
$str""; K
,""K L
$num""M S
,""S T
$num""U [
,""[ \
$num""\ b
,""b c
$num""c e
,""e f
false""g l
,""l m
false""n s
)""s t
}""t u
,""u v
{$$ 
$str$$ !
,$$! "
new$$" %
CrcParamter$$& 1
<$$1 2
ushort$$2 8
>$$8 9
($$9 :
$str$$: I
,$$I J
$num$$K Q
,$$Q R
$num$$S Y
,$$Y Z
$num$$Z `
,$$` a
$num$$a c
,$$c d
false$$e j
,$$j k
false$$l q
)$$q r
}$$r s
,$$s t
{%% 
$str%% !
,%%! "
new%%" %
CrcParamter%%& 1
<%%1 2
ushort%%2 8
>%%8 9
(%%9 :
$str%%: I
,%%I J
$num%%K Q
,%%Q R
$num%%S Y
,%%Y Z
$num%%Z `
,%%` a
$num%%a c
,%%c d
false%%e j
,%%j k
false%%l q
)%%q r
}%%r s
,%%s t
{'' 
$str'' !
,''! "
new''" %
CrcParamter''& 1
<''1 2
ushort''2 8
>''8 9
(''9 :
$str'': I
,''I J
$num''K Q
,''Q R
$num''S Y
,''Y Z
$num''[ a
,''a b
$num''c e
,''e f
true''g k
,''k l
true''m q
)''q r
}''r s
,''s t
{(( 
$str(( !
,((! "
new((" %
CrcParamter((& 1
<((1 2
ushort((2 8
>((8 9
(((9 :
$str((: I
,((I J
$num((K Q
,((Q R
$num((S Y
,((Y Z
$num(([ a
,((a b
$num((c e
,((e f
false((g l
,((l m
false((n s
)((s t
}((t u
,((u v
{)) 
$str)) #
,))# $
new))$ '
CrcParamter))( 3
<))3 4
ushort))4 :
>)): ;
()); <
$str))< M
,))M N
$num))O U
,))U V
$num))W ]
,))] ^
$num))^ d
,))d e
$num))e g
,))g h
true))i m
,))m n
true))o s
)))s t
}))t u
,))u v
{** 
$str** $
,**$ %
new**% (
CrcParamter**) 4
<**4 5
ushort**5 ;
>**; <
(**< =
$str**= O
,**O P
$num**Q W
,**W X
$num**Y _
,**_ `
$num**` f
,**f g
$num**g i
,**i j
false**k p
,**p q
false**r w
)**w x
}**x y
,**y z
{++ 
$str++ !
,++! "
new++" %
CrcParamter++& 1
<++1 2
ushort++2 8
>++8 9
(++9 :
$str++: I
,++I J
$num++K Q
,++Q R
$num++S Y
,++Y Z
$num++[ a
,++a b
$num++b d
,++d e
true++e i
,++i j
true++k o
)++o p
}++p q
,++q r
{,, 
$str,, 
,,, 
new,,  
CrcParamter,,! ,
<,,, -
ushort,,- 3
>,,3 4
(,,4 5
$str,,5 ?
,,,? @
$num,,A G
,,,G H
$num,,I O
,,,O P
$num,,P V
,,,V W
$num,,W Y
,,,Y Z
true,,[ _
,,,_ `
true,,a e
),,e f
},,f g
,,,g h
{-- 
$str-- "
,--" #
new--# &
CrcParamter--' 2
<--2 3
ushort--3 9
>--9 :
(--: ;
$str--; K
,--K L
$num--M S
,--S T
$num--U [
,--[ \
$num--\ b
,--b c
$num--c e
,--e f
true--g k
,--k l
true--m q
)--q r
}--r s
,--s t
{.. 
$str.. &
,..& '
new..' *
CrcParamter..+ 6
<..6 7
ushort..7 =
>..= >
(..> ?
$str..? S
,..S T
$num..U [
,..[ \
$num..] c
,..c d
$num..e k
,..k l
$num..l n
,..n o
false..p u
,..u v
false..w |
)..| }
}..} ~
,..~ 
{// 
$str// 
,//  
new//  #
CrcParamter//$ /
</// 0
ushort//0 6
>//6 7
(//7 8
$str//8 E
,//E F
$num//G M
,//M N
$num//O U
,//U V
$num//W ]
,//] ^
$num//^ `
,//` a
true//a e
,//e f
true//g k
)//k l
}//l m
,//m n
{00 
$str00 "
,00" #
new00# &
CrcParamter00' 2
<002 3
ushort003 9
>009 :
(00: ;
$str00; K
,00K L
$num00M S
,00S T
$num00U [
,00[ \
$num00] c
,00c d
$num00d f
,00f g
false00g l
,00l m
false00n s
)00s t
}00t u
,00u v
{22 
$str22 
,22 
new22 "
CrcParamter22# .
<22. /
ushort22/ 5
>225 6
(226 7
$str227 C
,22C D
$num22E K
,22K L
$num22M S
,22S T
$num22T Z
,22Z [
$num22[ ]
,22] ^
true22_ c
,22c d
true22e i
)22i j
}22j k
,22k l
{44 
$str44 #
,44# $
new44$ '
CrcParamter44( 3
<443 4
ushort444 :
>44: ;
(44; <
$str44< M
,44M N
$num44O U
,44U V
$num44W ]
,44] ^
$num44_ e
,44e f
$num44f h
,44h i
false44i n
,44n o
false44p u
)44u v
}44v w
,44w x
{66 
$str66 
,66 
new66 "
CrcParamter66# .
<66. /
ushort66/ 5
>665 6
(666 7
$str667 C
,66C D
$num66E K
,66K L
$num66M S
,66S T
$num66U [
,66[ \
$num66] _
,66_ `
true66` d
,66d e
true66f j
)66j k
}66k l
,66l m
{77 
$str77 "
,77" #
new77# &
CrcParamter77' 2
<772 3
ushort773 9
>779 :
(77: ;
$str77; K
,77K L
$num77M S
,77S T
$num77U [
,77[ \
$num77\ b
,77b c
$num77c e
,77e f
false77g l
,77l m
false77n s
)77s t
}77u v
,77v w
{88 
$str88  
,88  !
new88! $
CrcParamter88% 0
<880 1
ushort881 7
>887 8
(888 9
$str889 G
,88G H
$num88I O
,88O P
$num88Q W
,88W X
$num88Y _
,88_ `
$num88` b
,88b c
true88c g
,88g h
true88i m
)88m n
}88n o
,88o p
{99 
$str99 "
,99" #
new99# &
CrcParamter99' 2
<992 3
ushort993 9
>999 :
(99: ;
$str99; K
,99K L
$num99M S
,99S T
$num99U [
,99[ \
$num99\ b
,99b c
$num99c e
,99e f
false99g l
,99l m
false99n s
)99s t
}99t u
,99u v
{:: 
$str:: !
,::! "
new::" %
CrcParamter::& 1
<::1 2
ushort::2 8
>::8 9
(::9 :
$str::: I
,::I J
$num::K Q
,::Q R
$num::S Y
,::Y Z
$num::Z `
,::` a
$num::a c
,::c d
true::e i
,::i j
true::k o
)::o p
}::p q
,::q r
{;; 
$str;; 
,;; 
new;; "
CrcParamter;;# .
<;;. /
ushort;;/ 5
>;;5 6
(;;6 7
$str;;7 C
,;;C D
$num;;E K
,;;K L
$num;;M S
,;;S T
$num;;U [
,;;[ \
$num;;\ ^
,;;^ _
true;;` d
,;;d e
true;;f j
);;j k
};;k l
,;;l m
{== 
$str== "
,==" #
new==# &
CrcParamter==' 2
<==2 3
ushort==3 9
>==9 :
(==: ;
$str==; K
,==K L
$num==M S
,==S T
$num==U [
,==[ \
$num==\ b
,==b c
$num==c e
,==e f
false==g l
,==l m
false==n s
)==s t
}==t u
,==u v
{?? 
$str?? #
,??# $
new??$ '
CrcParamter??( 3
<??3 4
ushort??4 :
>??: ;
(??; <
$str??< M
,??M N
$num??O U
,??U V
$num??W ]
,??] ^
$num??^ d
,??d e
$num??e g
,??g h
false??i n
,??n o
false??p u
)??u v
}??v w
,??w x
{AA 
$strAA #
,AA# $
newAA$ '
CrcParamterAA( 3
<AA3 4
ushortAA4 :
>AA: ;
(AA; <
$strAA< M
,AAM N
$numAAO U
,AAU V
$numAAW ]
,AA] ^
$numAA^ d
,AAd e
$numAAe g
,AAg h
falseAAi n
,AAn o
falseAAp u
)AAu v
}AAw x
}BB 
;BB 
}CC 	
publicII 
CRC16II 
(II 
CRCTypesII 
typeII "
)II" #
:II$ %
baseII& *
(II* +
typeII+ /
)II/ 0
{JJ 	
MaskKK 
=KK 
(KK 
ushortKK 
)KK 
(KK 
ushortKK "
.KK" #
MaxValueKK# +
>>KK, .
(KK/ 0
byteKK0 4
)KK4 5
(KK5 6
$numKK6 8
-KK9 :
ParamterKK; C
.KKC D
WidthKKD I
)KKI J
)KKJ K
;KKK L

InitializeLL 
(LL 
)LL 
;LL 
}MM 	
internalUU 
overrideUU 
voidUU 
HashCoreImplementUU 0
(UU0 1
byteUU1 5
[UU5 6
]UU6 7
arrayUU8 =
,UU= >
intUU? B
offsetUUC I
,UUI J
intUUK N
lengthUUO U
)UUU V
{VV 	
intWW 
crcWW 
=WW 
ParamterWW 
.WW 
	RefOutputWW (
?WW) *"
CrcHashAlgorithmHelperWW+ A
.WWA B
ReverseBitsWWB M
(WWM N
ParamterWWN V
.WWV W!
RemainderInitialValueWWW l
,WWl m
ParamterWWn v
.WWv w
WidthWWw |
)WW| }
:WW~ 
Paramter
WW� �
.
WW� �#
RemainderInitialValue
WW� �
;
WW� �
ifYY 
(YY 
ParamterYY 
.YY 
	RefOutputYY "
)YY" #
{ZZ 
for[[ 
([[ 
int[[ 
i[[ 
=[[ 
offset[[ #
;[[# $
i[[% &
<[[' (
offset[[) /
+[[0 1
length[[2 8
;[[8 9
i[[: ;
++[[; =
)[[= >
{\\ 
crc]] 
=]] 
Table]] 
[]]  
(]]  !
crc]]! $
^]]% &
array]]' ,
[]], -
i]]- .
]]]. /
)]]/ 0
&]]1 2
$num]]3 7
]]]7 8
^]]9 :
crc]]; >
>>]]? A
$num]]B C
;]]C D
crc^^ 
&=^^ 
Mask^^ 
;^^  
}__ 
}`` 
elseaa 
{bb 
intcc 
toRightcc 
=cc 
HashSizecc &
-cc' (
$numcc) *
;cc* +
toRightdd 
=dd 
toRightdd !
<dd" #
$numdd$ %
?dd& '
$numdd( )
:dd* +
toRightdd, 3
;dd3 4
foree 
(ee 
intee 
iee 
=ee 
offsetee #
;ee# $
iee% &
<ee' (
offsetee) /
+ee0 1
lengthee2 8
;ee8 9
iee: ;
++ee; =
)ee= >
{ff 
crcgg 
=gg 
Tablegg 
[gg  
(gg  !
crcgg! $
>>gg% '
toRightgg( /
^gg0 1
arraygg2 7
[gg7 8
igg8 9
]gg9 :
)gg: ;
&gg< =
$numgg> B
]ggB C
^ggD E
crcggF I
<<ggJ L
$numggM N
;ggN O
crchh 
&=hh 
Maskhh 
;hh  
}ii 
}jj 

FinalValuell 
=ll 
(ll 
ushortll  
)ll  !
crcll! $
;ll$ %
}mm 	
	protecteduu 
overrideuu 
byteuu 
[uu  
]uu  !
	HashFinaluu" +
(uu+ ,
)uu, -
=>uu. 0"
CrcHashAlgorithmHelperuu1 G
.uuG H
ToBigEndianBytesuuH X
(uuX Y
(uuY Z
ushortuuZ `
)uu` a
(uua b

FinalValueuub l
^uum n
Paramteruuo w
.uuw x
XorResultValue	uux �
)
uu� �
)
uu� �
;
uu� �
internal|| 
override|| 
ushort||  
[||  !
]||! "
Generate||# +
(||+ ,
CrcParamter||, 7
<||7 8
ushort||8 >
>||> ?
paramter||@ H
)||H I
=>||J L"
CrcHashAlgorithmHelper||M c
.||c d
GenerateTable||d q
(||q r
paramter||r z
.||z {

Polynomial	||{ �
,
||� �
paramter
||� �
.
||� �
Width
||� �
,
||� �
paramter
||� �
.
||� �
RefInput
||� �
,
||� �
Mask
||� �
)
||� �
;
||� �
}}} 
}~~ �V
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\Implement\CRC32.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
.D E
	ImplementE N
{ 
public

 

sealed

 
class

 
CRC32

 
:

 
CrcHashAlgorithm

  0
<

0 1
uint

1 5
>

5 6
{ 
static 
CRC32 
( 
) 
{ 	
Tables 
= 
new 

Dictionary #
<# $
string$ *
,* +
uint, 0
[0 1
]1 2
>2 3
(3 4
)4 5
;5 6
	Paramters 
= 
new 

Dictionary &
<& '
string' -
,- .
CrcParamter/ :
<: ;
uint; ?
>? @
>@ A
(A B
)B C
{D E
{ 
$str #
,# $
new$ '
CrcParamter( 3
<3 4
uint4 8
>8 9
(9 :
$str: L
,L M
$numM U
,U V
$numV ^
,^ _
$num_ g
,g h
$numh j
,j k
falsek p
,p q
falseq v
)v w
}x y
,y z
{ 
$str #
,# $
new$ '
CrcParamter( 3
<3 4
uint4 8
>8 9
(9 :
$str: L
,L M
$numM U
,U V
$numV ^
,^ _
$num_ g
,g h
$numh j
,j k
falsek p
,p q
falseq v
)v w
}x y
,y z
{ 
$str 
, 
new 
CrcParamter )
<) *
uint* .
>. /
(/ 0
$str0 8
,8 9
$num9 A
,A B
$numB J
,J K
$numK S
,S T
$numT V
,V W
falseW \
,\ ]
false] b
)b c
}d e
,e f
{ 
$str !
,! "
new" %
CrcParamter& 1
<1 2
uint2 6
>6 7
(7 8
$str8 H
,H I
$numI R
,R S
$numS ]
,] ^
$num^ h
,h i
$numi k
,k l
falsel q
,q r
falser w
)w x
}y z
,z {
{ 
$str 
, 
new "
CrcParamter# .
<. /
uint/ 3
>3 4
(4 5
$str5 B
,B C
$numC M
,M N
$numN X
,X Y
$numY c
,c d
$numd f
,f g
falseg l
,l m
falsem r
)r s
}t u
,u v
{ 
$str 
,  
new  #
CrcParamter$ /
</ 0
uint0 4
>4 5
(5 6
$str6 D
,D E
$numE O
,O P
$numP Z
,Z [
$num[ e
,e f
$numf h
,h i
falsei n
,n o
falseo t
)t u
}v w
,w x
{ 
$str  
,  !
new! $
CrcParamter% 0
<0 1
uint1 5
>5 6
(6 7
$str7 F
,F G
$numG Q
,Q R
$numR \
,\ ]
$num] g
,g h
$numh j
,j k
truek o
,o p
truep t
)t u
}v w
,w x
{ 
$str  
,  !
new! $
CrcParamter% 0
<0 1
uint1 5
>5 6
(6 7
$str7 F
,F G
$numG Q
,Q R
$numR \
,\ ]
$num] g
,g h
$numh j
,j k
falsek p
,p q
falseq v
)v w
}x y
,y z
{ 
$str 
, 
new 
CrcParamter )
<) *
uint* .
>. /
(/ 0
$str0 8
,8 9
$num9 C
,C D
$numD N
,N O
$numO Y
,Y Z
$numZ \
,\ ]
true] a
,a b
trueb f
)f g
}h i
,i j
{ 
$str 
,  
new  #
CrcParamter$ /
</ 0
uint0 4
>4 5
(5 6
$str6 D
,D E
$numE O
,O P
$numP Z
,Z [
$num[ e
,e f
$numf h
,h i
falsei n
,n o
falseo t
)t u
}v w
,w x
{   
$str   
,   
new   
CrcParamter    +
<  + ,
uint  , 0
>  0 1
(  1 2
$str  2 <
,  < =
$num  = G
,  G H
$num  H R
,  R S
$num  S ]
,  ] ^
$num  ^ `
,  ` a
true  a e
,  e f
true  f j
)  j k
}  l m
,  m n
{!! 
$str!! 
,!! 
new!! 
CrcParamter!!  +
<!!+ ,
uint!!, 0
>!!0 1
(!!1 2
$str!!2 <
,!!< =
$num!!= G
,!!G H
$num!!H R
,!!R S
$num!!S ]
,!!] ^
$num!!^ `
,!!` a
false!!a f
,!!f g
false!!g l
)!!l m
}!!n o
,!!o p
{"" 
$str"" 
,"" 
new"" 
CrcParamter""  +
<""+ ,
uint"", 0
>""0 1
(""1 2
$str""2 <
,""< =
$num""= G
,""G H
$num""H R
,""R S
$num""S ]
,""] ^
$num""^ `
,""` a
true""a e
,""e f
true""f j
)""j k
}""l m
,""m n
}## 
;## 
}$$ 	
public** 
CRC32** 
(** 
CRCTypes** 
type** "
)**" #
:**$ %
base**& *
(*** +
type**+ /
)**/ 0
{++ 	
Mask,, 
=,, 
uint,, 
.,, 
MaxValue,,  
>>,,! #
(,,$ %
byte,,% )
),,) *
(,,* +
$num,,+ -
-,,. /
Paramter,,0 8
.,,8 9
Width,,9 >
),,> ?
;,,? @

Initialize-- 
(-- 
)-- 
;-- 
}.. 	
internal66 
override66 
void66 
HashCoreImplement66 0
(660 1
byte661 5
[665 6
]666 7
array668 =
,66= >
int66? B
offset66C I
,66I J
int66K N
length66O U
)66U V
{77 	
uint88 
crc88 
=88 
Paramter88 
.88  
	RefOutput88  )
?88* +"
CrcHashAlgorithmHelper88, B
.88B C
ReverseBits88C N
(88N O
Paramter88O W
.88W X!
RemainderInitialValue88X m
,88m n
Paramter88o w
.88w x
Width88x }
)88} ~
:	88 �
Paramter
88� �
.
88� �#
RemainderInitialValue
88� �
;
88� �
if:: 
(:: 
Paramter:: 
.:: 
	RefOutput:: "
)::" #
{;; 
for<< 
(<< 
int<< 
i<< 
=<< 
offset<< #
;<<# $
i<<% &
<<<' (
offset<<) /
+<<0 1
length<<2 8
;<<8 9
i<<: ;
++<<; =
)<<= >
{== 
crc>> 
=>> 
Table>> 
[>>  
(>>  !
crc>>! $
^>>% &
array>>' ,
[>>, -
i>>- .
]>>. /
)>>/ 0
&>>1 2
$num>>3 7
]>>7 8
^>>9 :
crc>>; >
>>>>? A
$num>>B C
;>>C D
crc?? 
&=?? 
Mask?? 
;??  
}@@ 
}AA 
elseBB 
{CC 
intDD 
toRightDD 
=DD 
HashSizeDD &
-DD' (
$numDD) *
;DD* +
toRightEE 
=EE 
toRightEE !
<EE" #
$numEE$ %
?EE& '
$numEE( )
:EE* +
toRightEE, 3
;EE3 4
forFF 
(FF 
intFF 
iFF 
=FF 
offsetFF #
;FF# $
iFF% &
<FF' (
offsetFF) /
+FF0 1
lengthFF2 8
;FF8 9
iFF: ;
++FF; =
)FF= >
{GG 
crcHH 
=HH 
TableHH 
[HH  
(HH  !
crcHH! $
>>HH% '
toRightHH( /
^HH0 1
arrayHH2 7
[HH7 8
iHH8 9
]HH9 :
)HH: ;
&HH< =
$numHH> B
]HHB C
^HHD E
crcHHF I
<<HHJ L
$numHHM N
;HHN O
crcII 
&=II 
MaskII 
;II  
}JJ 
}KK 

FinalValueMM 
=MM 
crcMM 
;MM 
}NN 	
	protectedVV 
overrideVV 
byteVV 
[VV  
]VV  !
	HashFinalVV" +
(VV+ ,
)VV, -
=>VV. 0"
CrcHashAlgorithmHelperVV1 G
.VVG H
ToBigEndianBytesVVH X
(VVX Y

FinalValueVVY c
^VVd e
ParamterVVf n
.VVn o
XorResultValueVVo }
)VV} ~
;VV~ 
internal]] 
override]] 
uint]] 
[]] 
]]]  
Generate]]! )
(]]) *
CrcParamter]]* 5
<]]5 6
uint]]6 :
>]]: ;
paramter]]< D
)]]D E
=>]]F H"
CrcHashAlgorithmHelper]]I _
.]]_ `
GenerateTable]]` m
(]]m n
paramter]]n v
.]]v w

Polynomial	]]w �
,
]]� �
paramter
]]� �
.
]]� �
Width
]]� �
,
]]� �
paramter
]]� �
.
]]� �
RefInput
]]� �
,
]]� �
Mask
]]� �
)
]]� �
;
]]� �
}^^ 
}__ �9
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\Implement\CRC64.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
.D E
	ImplementE N
{ 
public

 

sealed

 
class

 
CRC64

 
:

 
CrcHashAlgorithm

  0
<

0 1
ulong

1 6
>

6 7
{ 
static 
CRC64 
( 
) 
{ 	
Tables 
= 
new 

Dictionary #
<# $
string$ *
,* +
ulong, 1
[1 2
]2 3
>3 4
(4 5
)5 6
;6 7
	Paramters 
= 
new 

Dictionary &
<& '
string' -
,- .
CrcParamter/ :
<: ;
ulong; @
>@ A
>A B
(B C
)C D
{E F
{ 
$str 
, 
new !
CrcParamter" -
<- .
ulong. 3
>3 4
(4 5
$str5 A
,A B
$numB K
,K L
$numL X
,X Y
$numY e
,e f
$numf h
,h i
falsei n
,n o
falseo t
)t u
}v w
,w x
{ 
$str 
, 
new 
CrcParamter )
<) *
ulong* /
>/ 0
(0 1
$str1 9
,9 :
$num: L
,L M
$numM _
,_ `
$num` p
,p q
$numq s
,s t
falset y
,y z
falsez 
)	 �
}
� �
,
� �
{ 
$str 
, 
new  
CrcParamter! ,
<, -
ulong- 2
>2 3
(3 4
$str4 ?
,? @
$num@ R
,R S
$numS e
,e f
$numf x
,x y
$numy {
,{ |
true	| �
,
� �
true
� �
)
� �
}
� �
,
� �
{ 
$str 
, 
new  
CrcParamter! ,
<, -
ulong- 2
>2 3
(3 4
$str4 ?
,? @
$num@ R
,R S
$numS e
,e f
$numf x
,x y
$numy {
,{ |
false	| �
,
� �
false
� �
)
� �
}
� �
,
� �
} 
; 
} 	
public   
CRC64   
(   
CRCTypes   
type   "
)  " #
:  $ %
base  & *
(  * +
type  + /
)  / 0
{!! 	
Mask"" 
="" 
ulong"" 
."" 
MaxValue"" !
>>""" $
(""% &
byte""& *
)""* +
(""+ ,
$num"", .
-""/ 0
Paramter""1 9
.""9 :
Width"": ?
)""? @
;""@ A

Initialize## 
(## 
)## 
;## 
}$$ 	
internal,, 
override,, 
void,, 
HashCoreImplement,, 0
(,,0 1
byte,,1 5
[,,5 6
],,6 7
array,,8 =
,,,= >
int,,? B
offset,,C I
,,,I J
int,,K N
length,,O U
),,U V
{-- 	
ulong.. 
crc.. 
=.. 
Paramter..  
...  !
	RefOutput..! *
?..+ ,"
CrcHashAlgorithmHelper..- C
...C D
ReverseBits..D O
(..O P
Paramter..P X
...X Y!
RemainderInitialValue..Y n
,..n o
Paramter..p x
...x y
Width..y ~
)..~ 
:
..� �
Paramter
..� �
.
..� �#
RemainderInitialValue
..� �
;
..� �
if00 
(00 
Paramter00 
.00 
	RefOutput00 "
)00" #
{11 
for22 
(22 
int22 
i22 
=22 
offset22 #
;22# $
i22% &
<22' (
offset22) /
+220 1
length222 8
;228 9
i22: ;
++22; =
)22= >
{33 
crc44 
=44 
Table44 
[44  
(44  !
crc44! $
^44% &
array44' ,
[44, -
i44- .
]44. /
)44/ 0
&441 2
$num443 7
]447 8
^449 :
crc44; >
>>44? A
$num44B C
;44C D
crc55 
&=55 
Mask55 
;55  
}66 
}77 
else88 
{99 
int:: 
toRight:: 
=:: 
HashSize:: &
-::' (
$num::) *
;::* +
toRight;; 
=;; 
toRight;; !
<;;" #
$num;;$ %
?;;& '
$num;;( )
:;;* +
toRight;;, 3
;;;3 4
for<< 
(<< 
int<< 
i<< 
=<< 
offset<< #
;<<# $
i<<% &
<<<' (
offset<<) /
+<<0 1
length<<2 8
;<<8 9
i<<: ;
++<<; =
)<<= >
{== 
crc>> 
=>> 
Table>> 
[>>  
(>>  !
crc>>! $
>>>>% '
toRight>>( /
^>>0 1
array>>2 7
[>>7 8
i>>8 9
]>>9 :
)>>: ;
&>>< =
$num>>> B
]>>B C
^>>D E
crc>>F I
<<>>J L
$num>>M N
;>>N O
crc?? 
&=?? 
Mask?? 
;??  
}@@ 
}AA 

FinalValueCC 
=CC 
crcCC 
;CC 
}DD 	
	protectedLL 
overrideLL 
byteLL 
[LL  
]LL  !
	HashFinalLL" +
(LL+ ,
)LL, -
=>LL. 0"
CrcHashAlgorithmHelperLL1 G
.LLG H
ToBigEndianBytesLLH X
(LLX Y

FinalValueLLY c
^LLd e
ParamterLLf n
.LLn o
XorResultValueLLo }
)LL} ~
;LL~ 
internalSS 
overrideSS 
ulongSS 
[SS  
]SS  !
GenerateSS" *
(SS* +
CrcParamterSS+ 6
<SS6 7
ulongSS7 <
>SS< =
paramterSS> F
)SSF G
=>SSH J"
CrcHashAlgorithmHelperSSK a
.SSa b
GenerateTableSSb o
(SSo p
paramterSSp x
.SSx y

Polynomial	SSy �
,
SS� �
paramter
SS� �
.
SS� �
Width
SS� �
,
SS� �
paramter
SS� �
.
SS� �
RefInput
SS� �
,
SS� �
Mask
SS� �
)
SS� �
;
SS� �
}TT 
}UU �M
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\CRC\Implement\CRC8.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
.@ A
CRCA D
.D E
	ImplementE N
{ 
public

 

sealed

 
class

 
CRC8

 
:

 
CrcHashAlgorithm

 /
<

/ 0
byte

0 4
>

4 5
{ 
static 
CRC8 
( 
) 
{ 	
Tables 
= 
new 

Dictionary #
<# $
string$ *
,* +
byte, 0
[0 1
]1 2
>2 3
(3 4
)4 5
;5 6
	Paramters 
= 
new 

Dictionary &
<& '
string' -
,- .
CrcParamter/ :
<: ;
byte; ?
>? @
>@ A
(A B
)B C
{D E
{ 
$str 
, 
new 
CrcParamter (
<( )
byte) -
>- .
(. /
$str/ 6
,6 7
$num7 :
,: ;
$num; >
,> ?
$num? B
,B C
$numC D
,D E
falseE J
,J K
falseK P
)P Q
}R S
,S T
{ 
$str 
, 
new  
CrcParamter! ,
<, -
byte- 1
>1 2
(2 3
$str3 >
,> ?
$num? B
,B C
$numC F
,F G
$numG K
,K L
$numL M
,M N
falseN S
,S T
falseT Y
)Y Z
}[ \
,\ ]
{ 
$str 
, 
new !
CrcParamter" -
<- .
byte. 2
>2 3
(3 4
$str4 @
,@ A
$numA D
,D E
$numE I
,I J
$numJ M
,M N
$numN O
,O P
trueP T
,T U
trueU Y
)Y Z
}[ \
,\ ]
{ 
$str 
,  
new  #
CrcParamter$ /
</ 0
byte0 4
>4 5
(5 6
$str6 D
,D E
$numE I
,I J
$numJ N
,N O
$numO R
,R S
$numS T
,T U
falseU Z
,Z [
false[ `
)` a
}b c
,c d
{ 
$str 
, 
new  
CrcParamter! ,
<, -
byte- 1
>1 2
(2 3
$str3 >
,> ?
$num? C
,C D
$numD H
,H I
$numI L
,L M
$numM N
,N O
trueO S
,S T
trueT X
)X Y
}Z [
,[ \
{ 
$str 
, 
new "
CrcParamter# .
<. /
byte/ 3
>3 4
(4 5
$str5 B
,B C
$numC G
,G H
$numH K
,K L
$numL O
,O P
$numP Q
,Q R
trueR V
,V W
trueW [
)[ \
}] ^
,^ _
{ 
$str 
, 
new !
CrcParamter" -
<- .
byte. 2
>2 3
(3 4
$str4 @
,@ A
$numA E
,E F
$numF I
,I J
$numJ M
,M N
$numN O
,O P
trueP T
,T U
trueU Y
)Y Z
}[ \
,\ ]
{ 
$str 
, 
new "
CrcParamter# .
<. /
byte/ 3
>3 4
(4 5
$str5 B
,B C
$numC G
,G H
$numH K
,K L
$numL O
,O P
$numP Q
,Q R
trueR V
,V W
trueW [
)[ \
}] ^
,^ _
{ 
$str !
,! "
new" %
CrcParamter& 1
<1 2
byte2 6
>6 7
(7 8
$str8 H
,H I
$numI M
,M N
$numN R
,R S
$numS V
,V W
$numW X
,X Y
falseY ^
,^ _
false_ d
)d e
}f g
,g h
{ 
$str 
,  
new  #
CrcParamter$ /
</ 0
byte0 4
>4 5
(5 6
$str6 D
,D E
$numE I
,I J
$numJ M
,M N
$numN Q
,Q R
$numR S
,S T
falseT Y
,Y Z
falseZ _
)_ `
}a b
} 
; 
} 	
public$$ 
CRC8$$ 
($$ 
CRCTypes$$ 
type$$ !
)$$! "
:$$# $
base$$% )
($$) *
type$$* .
)$$. /
{%% 	
Mask&& 
=&& 
(&& 
byte&& 
)&& 
(&& 
byte&& 
.&& 
MaxValue&& '
>>&&( *
(&&+ ,
byte&&, 0
)&&0 1
(&&1 2
$num&&2 4
-&&5 6
Paramter&&7 ?
.&&? @
Width&&@ E
)&&E F
)&&F G
;&&G H

Initialize'' 
('' 
)'' 
;'' 
}(( 	
internal00 
override00 
void00 
HashCoreImplement00 0
(000 1
byte001 5
[005 6
]006 7
array008 =
,00= >
int00? B
offset00C I
,00I J
int00K N
length00O U
)00U V
{11 	
int22 
crc22 
=22 
Paramter22 
.22 
	RefOutput22 (
?22) *"
CrcHashAlgorithmHelper22+ A
.22A B
ReverseBits22B M
(22M N
Paramter22N V
.22V W!
RemainderInitialValue22W l
,22l m
Paramter22n v
.22v w
Width22w |
)22| }
:22~ 
Paramter
22� �
.
22� �#
RemainderInitialValue
22� �
;
22� �
if44 
(44 
Paramter44 
.44 
	RefOutput44 "
)44" #
{55 
for66 
(66 
int66 
i66 
=66 
offset66 #
;66# $
i66% &
<66' (
offset66) /
+660 1
length662 8
;668 9
i66: ;
++66; =
)66= >
{77 
crc88 
=88 
Table88 
[88  
(88  !
crc88! $
^88% &
array88' ,
[88, -
i88- .
]88. /
)88/ 0
&881 2
$num883 7
]887 8
^889 :
crc88; >
>>88? A
$num88B C
;88C D
crc99 
&=99 
Mask99 
;99  
}:: 
};; 
else<< 
{== 
int>> 
toRight>> 
=>> 
HashSize>> &
->>' (
$num>>) *
;>>* +
toRight?? 
=?? 
toRight?? !
<??" #
$num??$ %
???& '
$num??( )
:??* +
toRight??, 3
;??3 4
for@@ 
(@@ 
int@@ 
i@@ 
=@@ 
offset@@ #
;@@# $
i@@% &
<@@' (
offset@@) /
+@@0 1
length@@2 8
;@@8 9
i@@: ;
++@@; =
)@@= >
{AA 
crcBB 
=BB 
TableBB 
[BB  
(BB  !
crcBB! $
>>BB% '
toRightBB( /
^BB0 1
arrayBB2 7
[BB7 8
iBB8 9
]BB9 :
)BB: ;
&BB< =
$numBB> B
]BBB C
^BBD E
crcBBF I
<<BBJ L
$numBBM N
;BBN O
crcCC 
&=CC 
MaskCC 
;CC  
}DD 
}EE 

FinalValueGG 
=GG 
(GG 
byteGG 
)GG 
crcGG "
;GG" #
}HH 	
	protectedPP 
overridePP 
bytePP 
[PP  
]PP  !
	HashFinalPP" +
(PP+ ,
)PP, -
=>PP. 0"
CrcHashAlgorithmHelperPP1 G
.PPG H
ToBigEndianBytesPPH X
(PPX Y
(PPY Z
bytePPZ ^
)PP^ _
(PP_ `

FinalValuePP` j
^PPk l
ParamterPPm u
.PPu v
XorResultValue	PPv �
)
PP� �
)
PP� �
;
PP� �
internalWW 
overrideWW 
byteWW 
[WW 
]WW  
GenerateWW! )
(WW) *
CrcParamterWW* 5
<WW5 6
byteWW6 :
>WW: ;
paramterWW< D
)WWD E
=>WWF H"
CrcHashAlgorithmHelperWWI _
.WW_ `
GenerateTableWW` m
(WWm n
paramterWWn v
.WWv w

Polynomial	WWw �
,
WW� �
paramter
WW� �
.
WW� �
Width
WW� �
,
WW� �
paramter
WW� �
.
WW� �
RefInput
WW� �
,
WW� �
Mask
WW� �
)
WW� �
;
WW� �
}XX 
}YY �"
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Check\Xor.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Check; @
{ 
public		 

class		 
Xor		 
{

 
public 
static 
byte 
Compute "
(" #
string# )
val* -
,- .
Encoding/ 7
encoding8 @
=A B
nullC G
)G H
{ 	
if 
( 
encoding 
== 
null  
)  !
encoding" *
=+ ,
Encoding- 5
.5 6
UTF86 :
;: ;
byte 
[ 
] 
buffer 
= 
encoding $
.$ %
GetBytes% -
(- .
val. 1
)1 2
;2 3
return 
Compute 
( 
buffer !
,! "
$num# $
,$ %
buffer& ,
., -
Length- 3
)3 4
;4 5
} 	
public"" 
static"" 
byte"" 
Compute"" "
(""" #
byte""# '
[""' (
]""( )
buffer""* 0
,""0 1
int""2 5
index""6 ;
=""< =
$num""> ?
)""? @
=>""A C
Compute""D K
(""K L
buffer""L R
,""R S
index""T Y
,""Y Z
buffer""[ a
.""a b
Length""b h
)""h i
;""i j
public.. 
static.. 
byte.. 
Compute.. "
(.." #
byte..# '
[..' (
]..( )
buffer..* 0
,..0 1
int..2 5
index..6 ;
,..; <
int..= @
length..A G
)..G H
{// 	
if00 
(00 
buffer00 
==00 
null00 
||00 !
buffer00" (
.00( )
Length00) /
==000 2
$num003 4
)004 5
throw006 ;
new00< ?!
ArgumentNullException00@ U
(00U V
nameof00V \
(00\ ]
buffer00] c
)00c d
)00d e
;00e f
int22 
_length22 
=22 
buffer22  
.22  !
Length22! '
;22' (
if44 
(44 
index44 
>44 
_length44 
-44  !
$num44" #
||44$ &
index44' ,
<44- .
$num44/ 0
)440 1
throw442 7
new448 ;'
ArgumentOutOfRangeException44< W
(44W X
nameof44X ^
(44^ _
index44_ d
)44d e
)44e f
;44f g
if66 
(66 
length66 
>66 
_length66  
||66! #
length66$ *
<66+ ,
$num66- .
)66. /
throw660 5
new666 9'
ArgumentOutOfRangeException66: U
(66U V
nameof66V \
(66\ ]
length66] c
)66c d
)66d e
;66e f
if88 
(88 
index88 
+88 
length88 
>88  
_length88! (
)88( )
throw88* /
new880 3'
ArgumentOutOfRangeException884 O
(88O P
$"88P R
{88R S
nameof88S Y
(88Y Z
index88Z _
)88_ `
}88` a
$str88a d
{88d e
nameof88e k
(88k l
length88l r
)88r s
}88s t
"88t u
)88u v
;88v w
byte:: 
output:: 
=:: 
$num:: 
;:: 
for<< 
(<< 
int<< 
i<< 
=<< 
index<< 
;<< 
i<<  !
<<<" #
length<<$ *
;<<* +
i<<, -
++<<- /
)<</ 0
output<<1 7
^=<<8 :
buffer<<; A
[<<A B
i<<B C
]<<C D
;<<D E
return>> 
output>> 
;>> 
}?? 	
}@@ 
}AA � 
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HashResult.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
{ 
public		 

class		 

HashResult		 
{

 
public 
byte 
[ 
] 
	HashBytes 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
string 
HashBase64String &
{' (
get) ,
;, -
private. 5
set6 9
;9 :
}; <
public!! 
string!! 
HexUpperString!! $
{!!% &
get!!' *
;!!* +
private!!, 3
set!!4 7
;!!7 8
}!!9 :
public)) 
byte)) 
[)) 
])) 
HexUpperBytes)) #
{))$ %
get))& )
;))) *
private))+ 2
set))3 6
;))6 7
}))8 9
public11 
string11  
HexUpperBase64String11 *
{11+ ,
get11- 0
;110 1
private112 9
set11: =
;11= >
}11? @
public99 
string99 
HexLowerString99 $
{99% &
get99' *
;99* +
private99, 3
set994 7
;997 8
}999 :
publicAA 
byteAA 
[AA 
]AA 
HexLowerBytesAA #
{AA$ %
getAA& )
;AA) *
privateAA+ 2
setAA3 6
;AA6 7
}AA8 9
publicII 
stringII  
HexLowerBase64StringII *
{II+ ,
getII- 0
;II0 1
privateII2 9
setII: =
;II= >
}II? @
publicPP 

HashResultPP 
(PP 
bytePP 
[PP 
]PP  
bytesPP! &
,PP& '
EncodingPP( 0
encodingPP1 9
=PP: ;
nullPP< @
)PP@ A
{QQ 	
ifRR 
(RR 
bytesRR 
==RR 
nullRR 
)RR 
returnRR %
;RR% &
ifTT 
(TT 
encodingTT 
==TT 
nullTT  
)TT  !
encodingTT" *
=TT+ ,
EncodingTT- 5
.TT5 6
UTF8TT6 :
;TT: ;
	HashBytesVV 
=VV 
bytesVV 
;VV 
HashBase64StringXX 
=XX 
ConvertXX &
.XX& '
ToBase64StringXX' 5
(XX5 6
bytesXX6 ;
)XX; <
;XX< =
stringZZ 
hexZZ 
=ZZ 
BitConverterZZ %
.ZZ% &
ToStringZZ& .
(ZZ. /
bytesZZ/ 4
)ZZ4 5
;ZZ5 6
HexUpperString\\ 
=\\ 
hex\\  
.\\  !
Replace\\! (
(\\( )
$str\\) ,
,\\, -
$str\\. 0
)\\0 1
;\\1 2
HexUpperBytes^^ 
=^^ 
encoding^^ $
.^^$ %
GetBytes^^% -
(^^- .
HexUpperString^^. <
)^^< =
;^^= > 
HexUpperBase64String``  
=``! "
Convert``# *
.``* +
ToBase64String``+ 9
(``9 :
HexUpperBytes``: G
)``G H
;``H I
HexLowerStringbb 
=bb 
HexUpperStringbb +
?bb+ ,
.bb, -
ToLowerbb- 4
(bb4 5
)bb5 6
;bb6 7
HexLowerBytesdd 
=dd 
encodingdd $
.dd$ %
GetBytesdd% -
(dd- .
HexLowerStringdd. <
)dd< =
;dd= > 
HexLowerBase64Stringff  
=ff! "
Convertff# *
.ff* +
ToBase64Stringff+ 9
(ff9 :
HexLowerBytesff: G
)ffG H
;ffH I
}gg 	
}hh 
}ii �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Enum\HMACAlgorithmTypes.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
EnumE I
{ 
[ 
DefaultValue 
( 
MD5 
) 
] 
public		 

enum		 
HMACAlgorithmTypes		 "
{

 
MD5 
, 
SHA1 
, 
SHA256 
, 
SHA384 
, 
SHA512 
, 
	RIPEMD160(( 
})) 
}** �,
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\HMAC.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
{		 
public 

class 
HMAC 
{ 
public 
static 

HashResult  
Encrypt! (
(( )
HMACAlgorithmTypes) ;
type< @
,@ A
stringB H
dataI M
,M N
stringO U
keyV Y
,Y Z
Encoding[ c
encodingd l
=m n
nullo s
)s t
{ 	
switch 
( 
type 
) 
{ 
case 
HMACAlgorithmTypes '
.' (
MD5( +
:+ ,
return !
EncryptResultInternal 0
<0 1
HMACMD51 8
>8 9
(9 :
data: >
,> ?
key@ C
,C D
encodingE M
)M N
;N O
case!! 
HMACAlgorithmTypes!! '
.!!' (
SHA1!!( ,
:!!, -
return"" !
EncryptResultInternal"" 0
<""0 1
HMACSHA1""1 9
>""9 :
("": ;
data""; ?
,""? @
key""A D
,""D E
encoding""F N
)""N O
;""O P
case## 
HMACAlgorithmTypes## '
.##' (
SHA256##( .
:##. /
return$$ !
EncryptResultInternal$$ 0
<$$0 1

HMACSHA256$$1 ;
>$$; <
($$< =
data$$= A
,$$A B
key$$C F
,$$F G
encoding$$H P
)$$P Q
;$$Q R
case%% 
HMACAlgorithmTypes%% '
.%%' (
SHA384%%( .
:%%. /
return&& !
EncryptResultInternal&& 0
<&&0 1

HMACSHA384&&1 ;
>&&; <
(&&< =
data&&= A
,&&A B
key&&C F
,&&F G
encoding&&H P
)&&P Q
;&&Q R
case'' 
HMACAlgorithmTypes'' '
.''' (
SHA512''( .
:''. /
return(( !
EncryptResultInternal(( 0
<((0 1

HMACSHA512((1 ;
>((; <
(((< =
data((= A
,((A B
key((C F
,((F G
encoding((H P
)((P Q
;((Q R
default)) 
:)) 
throw** 
new** 
ArgumentException** /
(**/ 0
$str**0 C
,**C D
nameof**E K
(**K L
type**L P
)**P Q
)**Q R
;**R S
}++ 
},, 	
internal55 
static55 

HashResult55 "!
EncryptResultInternal55# 8
<558 9
TKeyedHashAlgorithm559 L
>55L M
(55M N
string55N T
data55U Y
,55Y Z
string55[ a
key55b e
,55e f
Encoding55g o
encoding55p x
=55y z
null55{ 
)	55 �
where
55� �!
TKeyedHashAlgorithm
55� �
:
55� � 
KeyedHashAlgorithm
55� �
,
55� �
new
55� �
(
55� �
)
55� �
{66 	
return77 
new77 

HashResult77 !
(77! " 
EncryptBytesInternal77" 6
<776 7
TKeyedHashAlgorithm777 J
>77J K
(77K L
data77L P
,77P Q
key77R U
,77U V
encoding77W _
)77_ `
,77` a
encoding77b j
)77j k
;77k l
}88 	
privateAA 
staticAA 
byteAA 
[AA 
]AA  
EncryptBytesInternalAA 2
<AA2 3
TKeyedHashAlgorithmAA3 F
>AAF G
(AAG H
stringAAH N
dataAAO S
,AAS T
stringAAU [
keyAA\ _
,AA_ `
EncodingAAa i
encodingAAj r
=AAs t
nullAAu y
)AAy z
where	AA{ �!
TKeyedHashAlgorithm
AA� �
:
AA� � 
KeyedHashAlgorithm
AA� �
,
AA� �
new
AA� �
(
AA� �
)
AA� �
{BB 	
ArgumentValidatorCC 
.CC 
ValidateCC &
(CC& '
dataCC' +
,CC+ ,
keyCC- 0
)CC0 1
;CC1 2
ifEE 
(EE 
encodingEE 
==EE 
nullEE  
)EE  !
encodingEE" *
=EE+ ,
EncodingEE- 5
.EE5 6
UTF8EE6 :
;EE: ;
byteGG 
[GG 
]GG 
keysGG 
=GG 
encodingGG "
.GG" #
GetBytesGG# +
(GG+ ,
keyGG, /
)GG/ 0
;GG0 1
byteHH 
[HH 
]HH 
datasHH 
=HH 
encodingHH #
.HH# $
GetBytesHH$ ,
(HH, -
dataHH- 1
)HH1 2
;HH2 3
usingJJ 
(JJ 
TKeyedHashAlgorithmJJ &
hashJJ' +
=JJ, -
newJJ. 1
TKeyedHashAlgorithmJJ2 E
(JJE F
)JJF G
{JJH I
KeyJJJ M
=JJN O
keysJJP T
}JJU V
)JJV W
{KK 
returnLL 
hashLL 
.LL 
ComputeHashLL '
(LL' (
datasLL( -
)LL- .
;LL. /
}MM 
}NN 	
}OO 
}PP �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Obsolete\HMACBase.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
ObsoleteE M
{ 
public		 

abstract		 
class		 
HMACBase		 "
<		" #
TKeyedHashAlgorithm		# 6
>		6 7
where		8 =
TKeyedHashAlgorithm		> Q
:		R S
KeyedHashAlgorithm		T f
,		f g
new		h k
(		k l
)		l m
{

 
public 
static 

HashResult  
Encrypt! (
(( )
string) /
data0 4
,4 5
string6 <
key= @
,@ A
EncodingB J
encodingK S
=T U
nullV Z
)Z [
{ 	
return 
HMAC 
. !
EncryptResultInternal -
<- .
TKeyedHashAlgorithm. A
>A B
(B C
dataC G
,G H
keyI L
,L M
encodingN V
)V W
;W X
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Obsolete\HMACMD5.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
ObsoleteE M
{ 
public 

class 
HMACMD5 
: 
HMACBase #
<# $
System$ *
.* +
Security+ 3
.3 4
Cryptography4 @
.@ A
HMACMD5A H
>H I
{ 
} 
}		 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Obsolete\HMACRIPEMD160.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
ObsoleteE M
{ 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Obsolete\HMACSHA1.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
ObsoleteE M
{ 
public 

class 
HMACSHA1 
: 
HMACBase $
<$ %
System% +
.+ ,
Security, 4
.4 5
Cryptography5 A
.A B
HMACSHA1B J
>J K
{ 
} 
}		 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Obsolete\HMACSHA256.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
ObsoleteE M
{ 
public 

class 

HMACSHA256 
: 
HMACBase &
<& '
System' -
.- .
Security. 6
.6 7
Cryptography7 C
.C D

HMACSHA256D N
>N O
{ 
} 
}		 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Obsolete\HMACSHA384.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
ObsoleteE M
{ 
public 

class 

HMACSHA384 
: 
HMACBase &
<& '
System' -
.- .
Security. 6
.6 7
Cryptography7 C
.C D

HMACSHA384D N
>N O
{ 
} 
}		 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\HMAC\Obsolete\HMACSHA512.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
HMAC@ D
.D E
ObsoleteE M
{ 
public 

class 

HMACSHA512 
: 
HMACBase &
<& '
System' -
.- .
Security. 6
.6 7
Cryptography7 C
.C D

HMACSHA512D N
>N O
{ 
} 
}		 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\MD5\Enum\MD5Types.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
MD5@ C
.C D
EnumD H
{ 
[ 
DefaultValue 
( 
L32 
) 
] 
public		 

enum		 
MD5Types		 
{

 
L16 
, 
L32 
, 
L64 
} 
} �&
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\MD5\MD5.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
MD5@ C
{ 
public 

class 
MD5 
{ 
public 
static 
string 
Encrypt $
($ %
string% +
data, 0
,0 1
Encoding2 :
encoding; C
=D E
nullF J
,J K
MD5TypesL T
bitU X
=Y Z
MD5Types[ c
.c d
L32d g
)g h
{ 	
return 
EncryptInternal "
(" #
bit# &
,& '
data( ,
,, -
encoding. 6
)6 7
;7 8
} 	
public   
static   
byte   
[   
]   
EncryptBytes   )
(  ) *
string  * 0
data  1 5
,  5 6
Encoding  7 ?
encoding  @ H
=  I J
null  K O
)  O P
{!! 	
return""  
EncryptBytesInternal"" '
(""' (
data""( ,
,"", -
encoding"". 6
)""6 7
;""7 8
}## 	
private,, 
static,, 
string,, 
EncryptInternal,, -
(,,- .
MD5Types,,. 6
bit,,7 :
,,,: ;
string,,< B
data,,C G
,,,G H
Encoding,,I Q
encoding,,R Z
),,Z [
{-- 	
byte.. 
[.. 
].. 
output.. 
=..  
EncryptBytesInternal.. 0
(..0 1
data..1 5
,..5 6
encoding..7 ?
)..? @
;..@ A
switch00 
(00 
bit00 
)00 
{11 
case22 
MD5Types22 
.22 
L1622 !
:22! "
return33 
BitConverter33 '
.33' (
ToString33( 0
(330 1
output331 7
,337 8
$num339 :
,33: ;
$num33< =
)33= >
.33> ?
Replace33? F
(33F G
$str33G J
,33J K
$str33L N
)33N O
;33O P
case44 
MD5Types44 
.44 
L3244 !
:44! "
{55 
StringBuilder66 %
builder66& -
=66. /
new660 3
StringBuilder664 A
(66A B
$num66B D
)66D E
;66E F
foreach88 
(88  !
var88! $
item88% )
in88* ,
output88- 3
)883 4
{99 
builder:: #
.::# $
Append::$ *
(::* +
item::+ /
.::/ 0
ToString::0 8
(::8 9
$str::9 =
)::= >
)::> ?
;::? @
};; 
return== 
builder== &
.==& '
ToString==' /
(==/ 0
)==0 1
;==1 2
}>> 
case?? 
MD5Types?? 
.?? 
L64?? !
:??! "
return@@ 
Convert@@ "
.@@" #
ToBase64String@@# 1
(@@1 2
output@@2 8
)@@8 9
;@@9 :
defaultAA 
:AA 
throwBB 
newBB '
ArgumentOutOfRangeExceptionBB 9
(BB9 :
nameofBB: @
(BB@ A
bitBBA D
)BBD E
,BBE F
$strBBG Z
)BBZ [
;BB[ \
}CC 
}DD 	
privateLL 
staticLL 
byteLL 
[LL 
]LL  
EncryptBytesInternalLL 2
(LL2 3
stringLL3 9
dataLL: >
,LL> ?
EncodingLL@ H
encodingLLI Q
)LLQ R
{MM 	
ArgumentValidatorNN 
.NN 
ValidateNN &
(NN& '
dataNN' +
)NN+ ,
;NN, -
ifPP 
(PP 
encodingPP 
==PP 
nullPP  
)PP  !
{QQ 
encodingRR 
=RR 
EncodingRR #
.RR# $
UTF8RR$ (
;RR( )
}SS 
usingUU 
(UU $
MD5CryptoServiceProviderUU +
providerUU, 4
=UU5 6
newUU7 :$
MD5CryptoServiceProviderUU; S
(UUS T
)UUT U
)UUU V
{VV 
returnWW 
providerWW 
.WW  
ComputeHashWW  +
(WW+ ,
encodingWW, 4
.WW4 5
GetBytesWW5 =
(WW= >
dataWW> B
)WWB C
)WWC D
;WWD E
}XX 
}YY 	
}ZZ 
}[[ �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\SHA\Enum\SHAAlgorithmTypes.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
SHA@ C
.C D
EnumD H
{ 
[ 
DefaultValue 
( 
SHA1 
) 
] 
public		 

enum		 
SHAAlgorithmTypes		 !
{

 
SHA1 
, 
SHA256 
, 
SHA384 
, 
SHA512 
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\SHA\Obsolete\SHA1.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
SHA@ C
.C D
ObsoleteD L
{ 
public 

class 
SHA1 
: 
SHABase 
<  %
SHA1CryptoServiceProvider  9
>9 :
{		 
}

 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\SHA\Obsolete\SHA256.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
SHA@ C
.C D
ObsoleteD L
{ 
public 

class 
SHA256 
: 
SHABase !
<! "'
SHA256CryptoServiceProvider" =
>= >
{		 
}

 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\SHA\Obsolete\SHA384.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
SHA@ C
.C D
ObsoleteD L
{ 
public 

class 
SHA384 
: 
SHABase !
<! "'
SHA384CryptoServiceProvider" =
>= >
{		 
}

 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\SHA\Obsolete\SHA512.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
SHA@ C
.C D
ObsoleteD L
{ 
public 

class 
SHA512 
: 
SHABase !
<! "'
SHA512CryptoServiceProvider" =
>= >
{		 
}

 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\SHA\Obsolete\SHABase.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
SHA@ C
.C D
ObsoleteD L
{ 
public		 

abstract		 
class		 
SHABase		 !
<		! "
THashAlgorithm		" 0
>		0 1
where		2 7
THashAlgorithm		8 F
:		G H
HashAlgorithm		I V
,		V W
new		X [
(		[ \
)		\ ]
{

 
public 
static 

HashResult  
Encrypt! (
(( )
string) /
data0 4
,4 5
Encoding6 >
encoding? G
=H I
nullJ N
)N O
{ 	
return 
SHA 
. !
EncryptResultInternal ,
<, -
THashAlgorithm- ;
>; <
(< =
data= A
,A B
encodingC K
)K L
;L M
} 	
} 
} �$
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Hash\SHA\SHA.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Hash; ?
.? @
SHA@ C
{		 
public 

class 
SHA 
{ 
public 
static 

HashResult  
Encrypt! (
(( )
SHAAlgorithmTypes) :
type; ?
,? @
stringA G
dataH L
,L M
EncodingN V
encodingW _
=` a
nullb f
)f g
{ 	
switch 
( 
type 
) 
{ 
case 
SHAAlgorithmTypes &
.& '
SHA1' +
:+ ,
return !
EncryptResultInternal 0
<0 1%
SHA1CryptoServiceProvider1 J
>J K
(K L
dataL P
,P Q
encodingR Z
)Z [
;[ \
case 
SHAAlgorithmTypes &
.& '
SHA256' -
:- .
return !
EncryptResultInternal 0
<0 1'
SHA256CryptoServiceProvider1 L
>L M
(M N
dataN R
,R S
encodingT \
)\ ]
;] ^
case 
SHAAlgorithmTypes &
.& '
SHA384' -
:- .
return !
EncryptResultInternal 0
<0 1'
SHA384CryptoServiceProvider1 L
>L M
(M N
dataN R
,R S
encodingT \
)\ ]
;] ^
case   
SHAAlgorithmTypes   &
.  & '
SHA512  ' -
:  - .
return!! !
EncryptResultInternal!! 0
<!!0 1'
SHA512CryptoServiceProvider!!1 L
>!!L M
(!!M N
data!!N R
,!!R S
encoding!!T \
)!!\ ]
;!!] ^
default"" 
:"" 
throw## 
new## 
ArgumentException## /
(##/ 0
$str##0 C
,##C D
nameof##E K
(##K L
type##L P
)##P Q
)##Q R
;##R S
}$$ 
}%% 	
internal.. 
static.. 

HashResult.. "!
EncryptResultInternal..# 8
<..8 9
T..9 :
>..: ;
(..; <
string..< B
data..C G
,..G H
Encoding..I Q
encoding..R Z
=..[ \
null..] a
)..a b
where..c h
T..i j
:..k l
HashAlgorithm..m z
,..z {
new..| 
(	.. �
)
..� �
{// 	
return00 
new00 

HashResult00 !
(00! " 
EncryptBytesInternal00" 6
<006 7
T007 8
>008 9
(009 :
data00: >
,00> ?
encoding00@ H
)00H I
,00I J
encoding00K S
)00S T
;00T U
}11 	
internal:: 
static:: 
byte:: 
[:: 
]::  
EncryptBytesInternal:: 3
<::3 4
T::4 5
>::5 6
(::6 7
string::7 =
data::> B
,::B C
Encoding::D L
encoding::M U
=::V W
null::X \
)::\ ]
where::^ c
T::d e
:::f g
HashAlgorithm::h u
,::u v
new::w z
(::z {
)::{ |
{;; 	
ArgumentValidator<< 
.<< 
Validate<< &
(<<& '
data<<' +
)<<+ ,
;<<, -
if>> 
(>> 
encoding>> 
==>> 
null>>  
)>>  !
encoding>>" *
=>>+ ,
Encoding>>- 5
.>>5 6
UTF8>>6 :
;>>: ;
byte@@ 
[@@ 
]@@ 
bytes@@ 
=@@ 
encoding@@ #
.@@# $
GetBytes@@$ ,
(@@, -
data@@- 1
)@@1 2
;@@2 3
usingBB 
(BB 
HashAlgorithmBB  
hashBB! %
=BB& '
newBB( +
TBB, -
(BB- .
)BB. /
)BB/ 0
{CC 
returnDD 
hashDD 
.DD 
ComputeHashDD '
(DD' (
bytesDD( -
)DD- .
;DD. /
}EE 
}FF 	
}GG 
}HH �:
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\AES.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
{ 
public 

class 
AES 
: 
SymmetricBase $
<$ %$
AesCryptoServiceProvider% =
>= >
{ 
public 
static 
string 
Encrypt $
($ %
string
 
data 
, 
string
 
password 
, 
string
 
vector 
= 
null 
, 
string
 
salt 
= 
null 
, 
AESKeySizeFlags
 
keySize !
=" #
AESKeySizeFlags$ 3
.3 4
L2564 8
,8 9
Encoding
 
encoding 
= 
null "
," #
int
 

iterations 
= 
$num 
,  

CipherMode
 
mode 
= 

CipherMode &
.& '
ECB' *
,* +
PaddingMode
 
padding 
= 
PaddingMode  +
.+ ,
PKCS7, 1
)1 2
{ 	
return "
EncryptOrDecryptString )
() *
EncryptionTypes* 9
.9 :
Encrypt: A
,A B
dataC G
,G H
passwordI Q
,Q R
saltS W
,W X
vectorY _
,_ `
(a b
intb e
)e f
keySizef m
,m n
encodingo w
:w x
encoding	y �
,
� �

iterations
� �
:
� �

iterations
� �
,
� �
mode
� �
:
� �
mode
� �
,
� �
padding
� �
:
� �
padding
� �
)
� �
;
� �
} 	
public 
static 
string 
Decrypt $
($ %
string  
 
data   
,   
string!!
 
password!! 
,!! 
string""
 
vector"" 
="" 
null"" 
,"" 
string##
 
salt## 
=## 
null## 
,## 
AESKeySizeFlags$$
 
keySize$$ !
=$$" #
AESKeySizeFlags$$$ 3
.$$3 4
L256$$4 8
,$$8 9
Encoding%%
 
encoding%% 
=%% 
null%% "
,%%" #
int&&
 

iterations&& 
=&& 
$num&& 
,&&  

CipherMode''
 
mode'' 
='' 

CipherMode'' &
.''& '
ECB''' *
,''* +
PaddingMode((
 
padding(( 
=(( 
PaddingMode((  +
.((+ ,
PKCS7((, 1
)((1 2
{)) 	
return** "
EncryptOrDecryptString** )
(**) *
EncryptionTypes*** 9
.**9 :
Decrypt**: A
,**A B
data**C G
,**G H
password**I Q
,**Q R
salt**S W
,**W X
vector**Y _
,**_ `
(**a b
int**b e
)**e f
keySize**f m
,**m n
encoding**o w
:**w x
encoding	**y �
,
**� �

iterations
**� �
:
**� �

iterations
**� �
,
**� �
mode
**� �
:
**� �
mode
**� �
,
**� �
padding
**� �
:
**� �
padding
**� �
)
**� �
;
**� �
}++ 	
public-- 
static-- 
byte-- 
[-- 
]-- 
EncryptBytes-- )
(--) *
string..
 
data.. 
,.. 
string//
 
password// 
,// 
string00
 
vector00 
=00 
null00 
,00 
string11
 
salt11 
=11 
null11 
,11 
AESKeySizeFlags22
 
keySize22 !
=22" #
AESKeySizeFlags22$ 3
.223 4
L256224 8
,228 9
Encoding33
 
encoding33 
=33 
null33 "
,33" #
int44
 

iterations44 
=44 
$num44 
,44  

CipherMode55
 
mode55 
=55 

CipherMode55 &
.55& '
ECB55' *
,55* +
PaddingMode66
 
padding66 
=66 
PaddingMode66  +
.66+ ,
PKCS766, 1
)661 2
{77 	
return88 !
EncryptOrDecryptBytes88 (
(88( )
EncryptionTypes88) 8
.888 9
Encrypt889 @
,88@ A
data88B F
,88F G
password88H P
,88P Q
salt88R V
,88V W
vector88X ^
,88^ _
(88` a
int88a d
)88d e
keySize88e l
,88l m
encoding88n v
:88v w
encoding	88x �
,
88� �

iterations
88� �
:
88� �

iterations
88� �
,
88� �
mode
88� �
:
88� �
mode
88� �
,
88� �
padding
88� �
:
88� �
padding
88� �
)
88� �
;
88� �
}99 	
public;; 
static;; 
byte;; 
[;; 
];; 
DecryptBytes;; )
(;;) *
string<<
 
data<< 
,<< 
string==
 
password== 
,== 
string>>
 
vector>> 
=>> 
null>> 
,>> 
string??
 
salt?? 
=?? 
null?? 
,?? 
AESKeySizeFlags@@
 
keySize@@ !
=@@" #
AESKeySizeFlags@@$ 3
.@@3 4
L256@@4 8
,@@8 9
EncodingAA
 
encodingAA 
=AA 
nullAA "
,AA" #
intBB
 

iterationsBB 
=BB 
$numBB 
,BB  

CipherModeCC
 
modeCC 
=CC 

CipherModeCC &
.CC& '
ECBCC' *
,CC* +
PaddingModeDD
 
paddingDD 
=DD 
PaddingModeDD  +
.DD+ ,
PKCS7DD, 1
)DD1 2
{EE 	
returnFF !
EncryptOrDecryptBytesFF (
(FF( )
EncryptionTypesFF) 8
.FF8 9
DecryptFF9 @
,FF@ A
dataFFB F
,FFF G
passwordFFH P
,FFP Q
saltFFR V
,FFV W
vectorFFX ^
,FF^ _
(FF` a
intFFa d
)FFd e
keySizeFFe l
,FFl m
encodingFFn v
:FFv w
encoding	FFx �
,
FF� �

iterations
FF� �
:
FF� �

iterations
FF� �
,
FF� �
mode
FF� �
:
FF� �
mode
FF� �
,
FF� �
padding
FF� �
:
FF� �
padding
FF� �
)
FF� �
;
FF� �
}GG 	
}HH 
}II �1
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\DES.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
{ 
public

 

class

 
DES

 
:

 
SymmetricBase

 $
<

$ %$
DESCryptoServiceProvider

% =
>

= >
{ 
public 
static 
string 
Encrypt $
($ %
string% +
data, 0
,0 1
string2 8
password9 A
,A B
stringC I
vectorJ P
=Q R
nullS W
,W X
stringY _
salt` d
=e f
nullg k
,k l
Encodingm u
encodingv ~
=	 �
null
� �
,
� �
int
� �

iterations
� �
=
� �
$num
� �
,
� �

CipherMode
� �
mode
� �
=
� �

CipherMode
� �
.
� �
ECB
� �
,
� �
PaddingMode
� �
padding
� �
=
� �
PaddingMode
� �
.
� �
PKCS7
� �
)
� �
{ 	
return "
EncryptOrDecryptString )
() *
EncryptionTypes* 9
.9 :
Encrypt: A
,A B
dataC G
,G H
passwordI Q
,Q R
saltS W
,W X
vectorY _
,_ `
$numa c
,c d
$nume g
,g h
encodingi q
,q r

iterationss }
,} ~
mode	 �
,
� �
padding
� �
)
� �
;
� �
} 	
public)) 
static)) 
string)) 
Decrypt)) $
())$ %
string))% +
data)), 0
,))0 1
string))2 8
password))9 A
,))A B
string))C I
vector))J P
=))Q R
null))S W
,))W X
string))Y _
salt))` d
=))e f
null))g k
,))k l
Encoding))m u
encoding))v ~
=	)) �
null
))� �
,
))� �
int
))� �

iterations
))� �
=
))� �
$num
))� �
,
))� �

CipherMode
))� �
mode
))� �
=
))� �

CipherMode
))� �
.
))� �
ECB
))� �
,
))� �
PaddingMode
))� �
padding
))� �
=
))� �
PaddingMode
))� �
.
))� �
PKCS7
))� �
)
))� �
{** 	
return++ "
EncryptOrDecryptString++ )
(++) *
EncryptionTypes++* 9
.++9 :
Decrypt++: A
,++A B
data++C G
,++G H
password++I Q
,++Q R
salt++S W
,++W X
vector++Y _
,++_ `
$num++a c
,++c d
$num++e g
,++g h
encoding++i q
,++q r

iterations++s }
,++} ~
mode	++ �
,
++� �
padding
++� �
)
++� �
;
++� �
},, 	
public:: 
static:: 
byte:: 
[:: 
]:: 
EncryptBytes:: )
(::) *
string::* 0
data::1 5
,::5 6
string::7 =
password::> F
,::F G
string::H N
vector::O U
=::V W
null::X \
,::\ ]
string::^ d
salt::e i
=::j k
null::l p
,::p q
Encoding::r z
encoding	::{ �
=
::� �
null
::� �
,
::� �
int
::� �

iterations
::� �
=
::� �
$num
::� �
,
::� �

CipherMode
::� �
mode
::� �
=
::� �

CipherMode
::� �
.
::� �
ECB
::� �
,
::� �
PaddingMode
::� �
padding
::� �
=
::� �
PaddingMode
::� �
.
::� �
PKCS7
::� �
)
::� �
{;; 	
return<< !
EncryptOrDecryptBytes<< (
(<<( )
EncryptionTypes<<) 8
.<<8 9
Encrypt<<9 @
,<<@ A
data<<B F
,<<F G
password<<H P
,<<P Q
salt<<R V
,<<V W
vector<<X ^
,<<^ _
$num<<` b
,<<b c
$num<<d f
,<<f g
encoding<<h p
,<<p q

iterations<<r |
,<<| }
mode	<<~ �
,
<<� �
padding
<<� �
)
<<� �
;
<<� �
}== 	
publicKK 
staticKK 
byteKK 
[KK 
]KK 
DecryptBytesKK )
(KK) *
stringKK* 0
dataKK1 5
,KK5 6
stringKK7 =
passwordKK> F
,KKF G
stringKKH N
vectorKKO U
=KKV W
nullKKX \
,KK\ ]
stringKK^ d
saltKKe i
=KKj k
nullKKl p
,KKp q
EncodingKKr z
encoding	KK{ �
=
KK� �
null
KK� �
,
KK� �
int
KK� �

iterations
KK� �
=
KK� �
$num
KK� �
,
KK� �

CipherMode
KK� �
mode
KK� �
=
KK� �

CipherMode
KK� �
.
KK� �
ECB
KK� �
,
KK� �
PaddingMode
KK� �
padding
KK� �
=
KK� �
PaddingMode
KK� �
.
KK� �
PKCS7
KK� �
)
KK� �
{LL 	
returnMM !
EncryptOrDecryptBytesMM (
(MM( )
EncryptionTypesMM) 8
.MM8 9
DecryptMM9 @
,MM@ A
dataMMB F
,MMF G
passwordMMH P
,MMP Q
saltMMR V
,MMV W
vectorMMX ^
,MM^ _
$numMM` b
,MMb c
$numMMd f
,MMf g
encodingMMh p
,MMp q

iterationsMMr |
,MM| }
mode	MM~ �
,
MM� �
padding
MM� �
)
MM� �
;
MM� �
}NN 	
}OO 
}PP �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\Enum\AESKeySizeFlags.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
.D E
EnumE I
{ 
[ 
DefaultValue 
( 
L256 
) 
] 
public		 

enum		 
AESKeySizeFlags		 
{

 
L128 
= 
$num 
, 
L192 
= 
$num 
, 
L256 
= 
$num 
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\Enum\TripleDESKeySizeFlags.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
.D E
EnumE I
{ 
[ 
DefaultValue 
( 
L128 
) 
] 
public		 

enum		 !
TripleDESKeySizeFlags		 %
{

 
L128 
= 
$num 
, 
L192 
= 
$num 
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\Internal\EncryptionTypes.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
.D E
InternalE M
{ 
internal 
enum 
EncryptionTypes !
{ 
Encrypt 
, 
Decrypt 
} 
} �7
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\Rijndael.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
{ 
public 

class 
Rijndael 
: 
SymmetricBase )
<) *
RijndaelManaged* 9
>9 :
{ 
public 
static 
string 
Encrypt $
($ %
string% +
data, 0
,0 1
string2 8
password9 A
,A B
stringC I
vectorJ P
=Q R
nullS W
,W X
stringY _
salt` d
=e f
nullg k
,k l
AESKeySizeFlagsm |
keySize	} �
=
� �
AESKeySizeFlags
� �
.
� �
L256
� �
,
� �
Encoding
� �
encoding
� �
=
� �
null
� �
,
� �
int
� �

iterations
� �
=
� �
$num
� �
,
� �

CipherMode
� �
mode
� �
=
� �

CipherMode
� �
.
� �
ECB
� �
,
� �
PaddingMode
� �
padding
� �
=
� �
PaddingMode
� �
.
� �
PKCS7
� �
)
� �
{ 	
return "
EncryptOrDecryptString )
() *
EncryptionTypes* 9
.9 :
Encrypt: A
,A B
dataC G
,G H
passwordI Q
,Q R
saltS W
,W X
vectorY _
,_ `
(a b
intb e
)e f
keySizef m
,m n
$numo r
,r s
encodingt |
,| }

iterations	~ �
,
� �
mode
� �
,
� �
padding
� �
)
� �
;
� �
} 	
public-- 
static-- 
string-- 
Decrypt-- $
(--$ %
string--% +
data--, 0
,--0 1
string--2 8
password--9 A
,--A B
string--C I
vector--J P
=--Q R
null--S W
,--W X
string--Y _
salt--` d
=--e f
null--g k
,--k l
AESKeySizeFlags--m |
keySize	--} �
=
--� �
AESKeySizeFlags
--� �
.
--� �
L256
--� �
,
--� �
Encoding
--� �
encoding
--� �
=
--� �
null
--� �
,
--� �
int
--� �

iterations
--� �
=
--� �
$num
--� �
,
--� �

CipherMode
--� �
mode
--� �
=
--� �

CipherMode
--� �
.
--� �
ECB
--� �
,
--� �
PaddingMode
--� �
padding
--� �
=
--� �
PaddingMode
--� �
.
--� �
PKCS7
--� �
)
--� �
{.. 	
return// "
EncryptOrDecryptString// )
(//) *
EncryptionTypes//* 9
.//9 :
Decrypt//: A
,//A B
data//C G
,//G H
password//I Q
,//Q R
salt//S W
,//W X
vector//Y _
,//_ `
(//a b
int//b e
)//e f
keySize//f m
,//m n
$num//o r
,//r s
encoding//t |
,//| }

iterations	//~ �
,
//� �
mode
//� �
,
//� �
padding
//� �
)
//� �
;
//� �
}00 	
public?? 
static?? 
byte?? 
[?? 
]?? 
EncryptBytes?? )
(??) *
string??* 0
data??1 5
,??5 6
string??7 =
password??> F
,??F G
string??H N
vector??O U
=??V W
null??X \
,??\ ]
string??^ d
salt??e i
=??j k
null??l p
,??p q
AESKeySizeFlags	??r �
keySize
??� �
=
??� �
AESKeySizeFlags
??� �
.
??� �
L256
??� �
,
??� �
Encoding
??� �
encoding
??� �
=
??� �
null
??� �
,
??� �
int
??� �

iterations
??� �
=
??� �
$num
??� �
,
??� �

CipherMode
??� �
mode
??� �
=
??� �

CipherMode
??� �
.
??� �
ECB
??� �
,
??� �
PaddingMode
??� �
padding
??� �
=
??� �
PaddingMode
??� �
.
??� �
PKCS7
??� �
)
??� �
{@@ 	
returnAA !
EncryptOrDecryptBytesAA (
(AA( )
EncryptionTypesAA) 8
.AA8 9
EncryptAA9 @
,AA@ A
dataAAB F
,AAF G
passwordAAH P
,AAP Q
saltAAR V
,AAV W
vectorAAX ^
,AA^ _
(AA` a
intAAa d
)AAd e
keySizeAAe l
,AAl m
$numAAn q
,AAq r
encodingAAs {
,AA{ |

iterations	AA} �
,
AA� �
mode
AA� �
,
AA� �
padding
AA� �
)
AA� �
;
AA� �
}BB 	
publicQQ 
staticQQ 
byteQQ 
[QQ 
]QQ 
DecryptBytesQQ )
(QQ) *
stringQQ* 0
dataQQ1 5
,QQ5 6
stringQQ7 =
passwordQQ> F
,QQF G
stringQQH N
vectorQQO U
=QQV W
nullQQX \
,QQ\ ]
stringQQ^ d
saltQQe i
=QQj k
nullQQl p
,QQp q
AESKeySizeFlags	QQr �
keySize
QQ� �
=
QQ� �
AESKeySizeFlags
QQ� �
.
QQ� �
L256
QQ� �
,
QQ� �
Encoding
QQ� �
encoding
QQ� �
=
QQ� �
null
QQ� �
,
QQ� �
int
QQ� �

iterations
QQ� �
=
QQ� �
$num
QQ� �
,
QQ� �

CipherMode
QQ� �
mode
QQ� �
=
QQ� �

CipherMode
QQ� �
.
QQ� �
ECB
QQ� �
,
QQ� �
PaddingMode
QQ� �
padding
QQ� �
=
QQ� �
PaddingMode
QQ� �
.
QQ� �
PKCS7
QQ� �
)
QQ� �
{RR 	
returnSS !
EncryptOrDecryptBytesSS (
(SS( )
EncryptionTypesSS) 8
.SS8 9
DecryptSS9 @
,SS@ A
dataSSB F
,SSF G
passwordSSH P
,SSP Q
saltSSR V
,SSV W
vectorSSX ^
,SS^ _
(SS` a
intSSa d
)SSd e
keySizeSSe l
,SSl m
$numSSn q
,SSq r
encodingSSs {
,SS{ |

iterations	SS} �
,
SS� �
mode
SS� �
,
SS� �
padding
SS� �
)
SS� �
;
SS� �
}TT 	
}UU 
}VV �b
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\SymmetricBase.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
{		 
public 

abstract 
class 
SymmetricBase '
<' (
TSymmetricAlgorithm( ;
>; <
where= B
TSymmetricAlgorithmC V
:W X
SymmetricAlgorithmY k
,k l
newm p
(p q
)q r
{ 
internal 
static 
string "
EncryptOrDecryptString 5
(5 6
EncryptionTypes6 E
typeF J
,J K
stringL R
dataS W
,W X
stringY _
password` h
,h i
stringj p
vectorq w
=x y
nullz ~
,~ 
string
� �
salt
� �
=
� �
null
� �
,
� �
int
� �
keySize
� �
=
� �
$num
� �
,
� �
int
� �
	blockSize
� �
=
� �
$num
� �
,
� �
Encoding
� �
encoding
� �
=
� �
null
� �
,
� �
int
� �

iterations
� �
=
� �
$num
� �
,
� �

CipherMode
� �
mode
� �
=
� �

CipherMode
� �
.
� �
ECB
� �
,
� �
PaddingMode
� �
padding
� �
=
� �
PaddingMode
� �
.
� �
PKCS7
� �
)
� �
{ 	
ArgumentValidator   
.   
Validate   &
(  & '
data  ' +
,  + ,
password  - 5
)  5 6
;  6 7
if"" 
("" 
encoding"" 
=="" 
null""  
)""  !
encoding""" *
=""+ ,
Encoding""- 5
.""5 6
UTF8""6 :
;"": ;
byte$$ 
[$$ 
]$$ 
output$$ 
=$$ 
EncryptOrDecrypt$$ ,
($$, -
type$$- 1
,$$1 2
type%% 
==%% 
EncryptionTypes%% '
.%%' (
Encrypt%%( /
?%%0 1
encoding%%2 :
.%%: ;
GetBytes%%; C
(%%C D
data%%D H
)%%H I
:%%J K
Convert%%L S
.%%S T
FromBase64String%%T d
(%%d e
data%%e i
)%%i j
,%%j k
GetKeyBytes&& 
(&& 
password&& $
,&&$ %
salt&&& *
,&&* +
keySize&&, 3
,&&3 4
encoding&&5 =
,&&= >

iterations&&? I
)&&I J
,&&J K
GetVectorBytes'' 
('' 
vector'' %
,''% &
	blockSize''' 0
,''0 1
encoding''2 :
)'': ;
,(( 
keySize(( 
,(( 
mode(( 
,((  
padding((! (
)((( )
;(() *
return** 
type** 
==** 
EncryptionTypes** *
.*** +
Encrypt**+ 2
?**3 4
Convert**5 <
.**< =
ToBase64String**= K
(**K L
output**L R
)**R S
:**T U
encoding**V ^
.**^ _
	GetString**_ h
(**h i
output**i o
)**o p
;**p q
}++ 	
internal<< 
static<< 
byte<< 
[<< 
]<< !
EncryptOrDecryptBytes<< 4
(<<4 5
EncryptionTypes<<5 D
type<<E I
,<<I J
string<<K Q
data<<R V
,<<V W
string<<X ^
password<<_ g
,<<g h
string<<i o
vector<<p v
=<<w x
null<<y }
,<<} ~
string	<< �
salt
<<� �
=
<<� �
null
<<� �
,
<<� �
int
<<� �
keySize
<<� �
=
<<� �
$num
<<� �
,
<<� �
int
<<� �
	blockSize
<<� �
=
<<� �
$num
<<� �
,
<<� �
Encoding
<<� �
encoding
<<� �
=
<<� �
null
<<� �
,
<<� �
int
<<� �

iterations
<<� �
=
<<� �
$num
<<� �
,
<<� �

CipherMode
<<� �
mode
<<� �
=
<<� �

CipherMode
<<� �
.
<<� �
ECB
<<� �
,
<<� �
PaddingMode
<<� �
padding
<<� �
=
<<� �
PaddingMode
<<� �
.
<<� �
PKCS7
<<� �
)
<<� �
{== 	
ArgumentValidator>> 
.>> 
Validate>> &
(>>& '
data>>' +
,>>+ ,
password>>- 5
)>>5 6
;>>6 7
if@@ 
(@@ 
encoding@@ 
==@@ 
null@@  
)@@  !
encoding@@" *
=@@+ ,
Encoding@@- 5
.@@5 6
UTF8@@6 :
;@@: ;
returnBB 
EncryptOrDecryptBB #
(BB# $
typeBB$ (
,BB( )
typeCC 
==CC 
EncryptionTypesCC '
.CC' (
EncryptCC( /
?CC0 1
encodingCC2 :
.CC: ;
GetBytesCC; C
(CCC D
dataCCD H
)CCH I
:CCJ K
ConvertCCL S
.CCS T
FromBase64StringCCT d
(CCd e
dataCCe i
)CCi j
,CCj k
GetKeyBytesDD 
(DD 
passwordDD $
,DD$ %
saltDD& *
,DD* +
keySizeDD, 3
,DD3 4
encodingDD5 =
,DD= >

iterationsDD? I
)DDI J
,DDJ K
GetVectorBytesEE 
(EE 
vectorEE %
,EE% &
	blockSizeEE' 0
,EE0 1
encodingEE2 :
)EE: ;
,FF 
keySizeFF 
,FF 
modeFF 
,FF  
paddingFF! (
)FF( )
;FF) *
}GG 	
internalRR 
staticRR 
byteRR 
[RR 
]RR 
GetKeyBytesRR *
(RR* +
stringRR+ 1
passwordRR2 :
,RR: ;
stringRR< B
saltRRC G
=RRH I
nullRRJ N
,RRN O
intRRP S
sizeRRT X
=RRY Z
$numRR[ ^
,RR^ _
EncodingRR` h
encodingRRi q
=RRr s
nullRRt x
,RRx y
intRRz }

iterations	RR~ �
=
RR� �
$num
RR� �
)
RR� �
{SS 	
ArgumentValidatorTT 
.TT 
ValidateTT &
(TT& '
passwordTT' /
)TT/ 0
;TT0 1
ifVV 
(VV 
encodingVV 
==VV 
nullVV  
)VV  !
encodingVV" *
=VV+ ,
EncodingVV- 5
.VV5 6
UTF8VV6 :
;VV: ;
intXX 
lengthXX 
=XX 
sizeXX 
/XX 
$numXX  !
;XX! "
byteZZ 
[ZZ 
]ZZ 
bufferZZ 
=ZZ 
saltZZ  
==ZZ! #
nullZZ$ (
?ZZ) *
encodingZZ+ 3
.ZZ3 4
GetBytesZZ4 <
(ZZ< =
passwordZZ= E
)ZZE F
:ZZG H
encodingZZI Q
.ZZQ R
GetBytesZZR Z
(ZZZ [
saltZZ[ _
)ZZ_ `
;ZZ` a
Rfc2898DeriveBytes\\ 
derive\\ %
=\\& '
new\\( +
Rfc2898DeriveBytes\\, >
(\\> ?
password\\? G
,\\G H
buffer\\I O
,\\O P

iterations\\Q [
)\\[ \
;\\\ ]
return^^ 
derive^^ 
.^^ 
GetBytes^^ "
(^^" #
length^^# )
)^^) *
;^^* +
}__ 	
publichh 
statichh 
bytehh 
[hh 
]hh 
GetVectorByteshh +
(hh+ ,
stringhh, 2
vectorhh3 9
,hh9 :
inthh; >
sizehh? C
=hhD E
$numhhF I
,hhI J
EncodinghhK S
encodinghhT \
=hh] ^
nullhh_ c
)hhc d
{ii 	
ifjj 
(jj 
vectorjj 
==jj 
nulljj 
)jj 
returnjj  &
nulljj' +
;jj+ ,
ifll 
(ll 
encodingll 
==ll 
nullll  
)ll  !
encodingll" *
=ll+ ,
Encodingll- 5
.ll5 6
UTF8ll6 :
;ll: ;
intnn 
lengthnn 
=nn 
sizenn 
/nn 
$numnn  !
;nn! "
bytepp 
[pp 
]pp 
bufferpp 
=pp 
newpp 
bytepp  $
[pp$ %
lengthpp% +
]pp+ ,
;pp, -
Arrayrr 
.rr 
Copyrr 
(rr 
encodingrr 
.rr  
GetBytesrr  (
(rr( )
vectorrr) /
.rr/ 0
PadRightrr0 8
(rr8 9
lengthrr9 ?
)rr? @
)rr@ A
,rrA B
bufferrrC I
,rrI J
lengthrrK Q
)rrQ R
;rrR S
returntt 
buffertt 
;tt 
}uu 	
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� 
EncryptOrDecrypt
�� /
(
��/ 0
EncryptionTypes
��0 ?
type
��@ D
,
��D E
byte
��F J
[
��J K
]
��K L
source
��M S
,
��S T
byte
��U Y
[
��Y Z
]
��Z [
key
��\ _
,
��_ `
byte
��a e
[
��e f
]
��f g
iv
��h j
,
��j k
int
��l o
keySize
��p w
=
��x y
$num
��z }
,
��} ~

CipherMode�� �
mode��� �
=��� �

CipherMode��� �
.��� �
ECB��� �
,��� �
PaddingMode��� �
padding��� �
=��� �
PaddingMode��� �
.��� �
PKCS7��� �
)��� �
{
�� 	
ArgumentValidator
�� 
.
�� 
Validate
�� &
(
��& '
source
��' -
,
��- .
key
��/ 2
)
��2 3
;
��3 4
byte
�� 
[
�� 
]
�� 
output
�� 
=
�� 
null
��  
;
��  !
using
�� 
(
�� !
TSymmetricAlgorithm
�� &
provider
��' /
=
��0 1
new
��2 5!
TSymmetricAlgorithm
��6 I
(
��I J
)
��J K
{
��L M
KeySize
��N U
=
��V W
keySize
��X _
,
��_ `
Mode
��a e
=
��f g
mode
��h l
,
��l m
Padding
��n u
=
��v w
padding
��x 
,�� �
Key��� �
=��� �
key��� �
}��� �
)��� �
{
�� 
if
�� 
(
�� 
iv
�� 
!=
�� 
null
�� 
)
�� 
provider
��  (
.
��( )
IV
��) +
=
��, -
iv
��. 0
;
��0 1
using
�� 
(
�� 
ICryptoTransform
�� '
	encryptor
��( 1
=
��2 3
type
��4 8
==
��9 ;
EncryptionTypes
��< K
.
��K L
Encrypt
��L S
?
��T U
provider
��V ^
.
��^ _
CreateEncryptor
��_ n
(
��n o
)
��o p
:
��q r
provider
��s {
.
��{ |
CreateDecryptor��| �
(��� �
)��� �
)��� �
{
�� 
output
�� 
=
�� 
	encryptor
�� &
.
��& '!
TransformFinalBlock
��' :
(
��: ;
source
��; A
,
��A B
$num
��C D
,
��D E
source
��F L
.
��L M
Length
��M S
)
��S T
;
��T U
}
�� 
provider
�� 
.
�� 
Clear
�� 
(
�� 
)
��  
;
��  !
}
�� 
return
�� 
output
�� 
;
�� 
}
�� 	
}
�� 
}�� �8
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Symmetric\TripleDES.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
	Symmetric; D
{ 
public 

class 
	TripleDES 
: 
SymmetricBase *
<* +*
TripleDESCryptoServiceProvider+ I
>I J
{ 
public 
static 
string 
Encrypt $
($ %
string% +
data, 0
,0 1
string2 8
password9 A
,A B
stringC I
vectorJ P
=Q R
nullS W
,W X
stringY _
salt` d
=e f
nullg k
,k l"
TripleDESKeySizeFlags	m �
keySize
� �
=
� �#
TripleDESKeySizeFlags
� �
.
� �
L192
� �
,
� �
Encoding
� �
encoding
� �
=
� �
null
� �
,
� �
int
� �

iterations
� �
=
� �
$num
� �
,
� �

CipherMode
� �
mode
� �
=
� �

CipherMode
� �
.
� �
ECB
� �
,
� �
PaddingMode
� �
padding
� �
=
� �
PaddingMode
� �
.
� �
PKCS7
� �
)
� �
{ 	
return "
EncryptOrDecryptString )
() *
EncryptionTypes* 9
.9 :
Encrypt: A
,A B
dataC G
,G H
passwordI Q
,Q R
saltS W
,W X
vectorY _
,_ `
(a b
intb e
)e f
keySizef m
,m n
$numo q
,q r
encodings {
,{ |

iterations	} �
,
� �
mode
� �
,
� �
padding
� �
)
� �
;
� �
} 	
public-- 
static-- 
string-- 
Decrypt-- $
(--$ %
string--% +
data--, 0
,--0 1
string--2 8
password--9 A
,--A B
string--C I
vector--J P
=--Q R
null--S W
,--W X
string--Y _
salt--` d
=--e f
null--g k
,--k l"
TripleDESKeySizeFlags	--m �
keySize
--� �
=
--� �#
TripleDESKeySizeFlags
--� �
.
--� �
L192
--� �
,
--� �
Encoding
--� �
encoding
--� �
=
--� �
null
--� �
,
--� �
int
--� �

iterations
--� �
=
--� �
$num
--� �
,
--� �

CipherMode
--� �
mode
--� �
=
--� �

CipherMode
--� �
.
--� �
ECB
--� �
,
--� �
PaddingMode
--� �
padding
--� �
=
--� �
PaddingMode
--� �
.
--� �
PKCS7
--� �
)
--� �
{.. 	
return// "
EncryptOrDecryptString// )
(//) *
EncryptionTypes//* 9
.//9 :
Decrypt//: A
,//A B
data//C G
,//G H
password//I Q
,//Q R
salt//S W
,//W X
vector//Y _
,//_ `
(//a b
int//b e
)//e f
keySize//f m
,//m n
$num//o q
,//q r
encoding//s {
,//{ |

iterations	//} �
,
//� �
mode
//� �
,
//� �
padding
//� �
)
//� �
;
//� �
}00 	
public?? 
static?? 
byte?? 
[?? 
]?? 
EncryptBytes?? )
(??) *
string??* 0
data??1 5
,??5 6
string??7 =
password??> F
,??F G
string??H N
vector??O U
=??V W
null??X \
,??\ ]
string??^ d
salt??e i
=??j k
null??l p
,??p q"
TripleDESKeySizeFlags	??r �
keySize
??� �
=
??� �#
TripleDESKeySizeFlags
??� �
.
??� �
L192
??� �
,
??� �
Encoding
??� �
encoding
??� �
=
??� �
null
??� �
,
??� �
int
??� �

iterations
??� �
=
??� �
$num
??� �
,
??� �

CipherMode
??� �
mode
??� �
=
??� �

CipherMode
??� �
.
??� �
ECB
??� �
,
??� �
PaddingMode
??� �
padding
??� �
=
??� �
PaddingMode
??� �
.
??� �
PKCS7
??� �
)
??� �
{@@ 	
returnAA !
EncryptOrDecryptBytesAA (
(AA( )
EncryptionTypesAA) 8
.AA8 9
EncryptAA9 @
,AA@ A
dataAAB F
,AAF G
passwordAAH P
,AAP Q
saltAAR V
,AAV W
vectorAAX ^
,AA^ _
(AA` a
intAAa d
)AAd e
keySizeAAe l
,AAl m
$numAAn p
,AAp q
encodingAAr z
,AAz {

iterations	AA| �
,
AA� �
mode
AA� �
,
AA� �
padding
AA� �
)
AA� �
;
AA� �
}BB 	
publicQQ 
staticQQ 
byteQQ 
[QQ 
]QQ 
DecryptBytesQQ )
(QQ) *
stringQQ* 0
dataQQ1 5
,QQ5 6
stringQQ7 =
passwordQQ> F
,QQF G
stringQQH N
vectorQQO U
=QQV W
nullQQX \
,QQ\ ]
stringQQ^ d
saltQQe i
=QQj k
nullQQl p
,QQp q"
TripleDESKeySizeFlags	QQr �
keySize
QQ� �
=
QQ� �#
TripleDESKeySizeFlags
QQ� �
.
QQ� �
L192
QQ� �
,
QQ� �
Encoding
QQ� �
encoding
QQ� �
=
QQ� �
null
QQ� �
,
QQ� �
int
QQ� �

iterations
QQ� �
=
QQ� �
$num
QQ� �
,
QQ� �

CipherMode
QQ� �
mode
QQ� �
=
QQ� �

CipherMode
QQ� �
.
QQ� �
ECB
QQ� �
,
QQ� �
PaddingMode
QQ� �
padding
QQ� �
=
QQ� �
PaddingMode
QQ� �
.
QQ� �
PKCS7
QQ� �
)
QQ� �
{RR 	
returnSS !
EncryptOrDecryptBytesSS (
(SS( )
EncryptionTypesSS) 8
.SS8 9
DecryptSS9 @
,SS@ A
dataSSB F
,SSF G
passwordSSH P
,SSP Q
saltSSR V
,SSV W
vectorSSX ^
,SS^ _
(SS` a
intSSa d
)SSd e
keySizeSSe l
,SSl m
$numSSn p
,SSp q
encodingSSr z
,SSz {

iterations	SS| �
,
SS� �
mode
SS� �
,
SS� �
padding
SS� �
)
SS� �
;
SS� �
}TT 	
}UU 
}VV �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Util\ArgumentValidator.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Util; ?
{ 
internal 
class 
ArgumentValidator $
{		 
public 
static 
void 
Validate #
(# $
params$ *
object+ 1
[1 2
]2 3
args4 8
)8 9
{ 	
if 
( 
args 
. 
Length 
== 
$num  
)  !
return" (
;( )
foreach 
( 
object 
item  
in! #
args$ (
)( )
{ 
if 
( 
item 
== 
null  
)  !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
itemI M
)M N
)N O
;O P
} 
} 	
} 
} �$
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Security\PhonixCryptography\Util\RandomGenerator.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Security '
.' (
PhonixCryptography( :
.: ;
Util; ?
{ 
public 

static 
class 
RandomGenerator '
{ 
private 
const 
string 
StringCharacters -
=. /
$str	0 �
;
� �
private 
static 
readonly 
int  #"
StringCharactersLength$ :
=; <
StringCharacters= M
.M N
LengthN T
;T U
public 
static 
int 
[ 
] 
GetIntArray '
(' (
int( +
bits, 0
,0 1
int2 5
min6 9
=: ;
int< ?
.? @
MinValue@ H
,H I
intJ M
maxN Q
=R S
intT W
.W X
MaxValueX `
)` a
{ 	
if 
( 
bits 
< 
$num 
) 
throw 
new  #'
ArgumentOutOfRangeException$ ?
(? @
nameof@ F
(F G
bitsG K
)K L
,L M
$strN k
)k l
;l m
if!! 
(!! 
min!! 
>!! 
max!! 
)!! 
throw!!  
new!!! $'
ArgumentOutOfRangeException!!% @
(!!@ A
nameof!!A G
(!!G H
max!!H K
)!!K L
,!!L M
$str!!N x
)!!x y
;!!y z
byte## 
[## 
]## 
b## 
=## 
new## 
byte## 
[##  
$num##  !
]##! "
;##" #
using(( 
((( $
RNGCryptoServiceProvider(( +
provider((, 4
=((5 6
new((7 :$
RNGCryptoServiceProvider((; S
(((S T
)((T U
)((U V
{)) 
provider** 
.** 
GetBytes** !
(**! "
b**" #
)**# $
;**$ %
}++ 
Random.. 
random.. 
=.. 
new.. 
Random..  &
(..& '
BitConverter..' 3
...3 4
ToInt32..4 ;
(..; <
b..< =
,..= >
$num..? @
)..@ A
)..A B
;..B C
int00 
[00 
]00 
val00 
=00 
new00 
int00 
[00  
bits00  $
]00$ %
;00% &
for22 
(22 
int22 
i22 
=22 
$num22 
;22 
i22 
<22 
bits22  $
;22$ %
i22& '
++22' )
)22) *
{33 
val44 
[44 
i44 
]44 
=44 
random44 
.44  
Next44  $
(44$ %
min44% (
,44( )
max44* -
)44- .
;44. /
}55 
return77 
val77 
;77 
}88 	
public?? 
static?? 
string?? 
	GetString?? &
(??& '
int??' *
bits??+ /
=??0 1
$num??2 3
)??3 4
{@@ 	
intAA 
[AA 
]AA 
indexsAA 
=AA 
GetIntArrayAA &
(AA& '
bitsAA' +
,AA+ ,
$numAA- .
,AA. /"
StringCharactersLengthAA0 F
)AAF G
;AAG H
StringBuilderCC 
builderCC !
=CC" #
newCC$ '
StringBuilderCC( 5
(CC5 6
)CC6 7
;CC7 8
forEE 
(EE 
intEE 
iEE 
=EE 
$numEE 
;EE 
iEE 
<EE 
bitsEE  $
;EE$ %
iEE& '
++EE' )
)EE) *
{FF 
builderGG 
.GG 
AppendGG 
(GG 
StringCharactersGG /
.GG/ 0
	SubstringGG0 9
(GG9 :
indexsGG: @
[GG@ A
iGGA B
]GGB C
,GGC D
$numGGE F
)GGF G
)GGG H
;GGH I
}HH 
returnJJ 
builderJJ 
.JJ 
ToStringJJ #
(JJ# $
)JJ$ %
;JJ% &
}KK 	
}LL 
}MM 