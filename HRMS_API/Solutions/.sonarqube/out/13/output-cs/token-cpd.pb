é
fF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\AppHelper.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
{ 
public 

class 
	AppHelper 
{ 
public 
int "
CalculateChecksumDigit )
() *
string* 0
barCode1 8
)8 9
{		 	
var 
degits 
= 
barCode  
.  !
Take! %
(% &
$num& (
)( )
.) *
Select* 0
(0 1
x1 2
=>3 5
x6 7
-8 9
$char: =
)= >
.> ?
Reverse? F
(F G
)G H
;H I
var 
even 
= 
degits 
. 
Where #
(# $
($ %
x% &
,& '
i( )
)) *
=>+ -
i. /
%0 1
$num2 3
==4 6
$num7 8
)8 9
.9 :
Sum: =
(= >
)> ?
*@ A
$numB C
;C D
var 
odd 
= 
degits 
. 
Where "
(" #
(# $
x$ %
,% &
i' (
)( )
=>* ,
i- .
%/ 0
$num1 2
!=3 5
$num6 7
)7 8
.8 9
Sum9 <
(< =
)= >
;> ?
int 

checkDegit 
= 
( 
$num  
-! "
(# $
($ %
even% )
+* +
odd, /
)/ 0
%1 2
$num3 5
)5 6
)6 7
%8 9
$num: <
;< =
return 

checkDegit 
; 
} 	
} 
} ö1
ÑF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\ApplicationSettings.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
.$ %
ApplicationSettings% 8
{ 
public 

class 
ApplicationSettings $
{ 
public 
static 
ApplicationSettings )
Current* 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
ApplicationSettings "
(" #
)# $
{ 	
Current		 
=		 
this		 
;		 
}

 	
public 
string 
	ImagePath 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
ProfilePath !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
NoPhoto 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ReimbursementPath '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int 
FinancialYearId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
HrmsOtpTemplate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
OTPMailTemplateId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int 

OtpTimeOut 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 

OTPMessage  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
OTPMailSubject $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string "
CarLeaseAgreementsPath ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
string #
CarLeaseMaintenancePath -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
string #
HRAInvestmentProofsPath -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
string (
Chapter6InvestmentProofsPath 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
string ,
 HouseIncomeInvestmentProofsfPath 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
string +
OtherIncomeInvestmentProofsPath 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
string 
[ 
] 
CorsUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
PayrollPeriodStart %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
PayrollPeriodEnd #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public   
bool   
IntegratePolicy   #
{  $ %
get  & )
;  ) *
set  + .
;  . /
}  0 1
public"" 
string"" 
LeaveFilePath"" #
{""$ %
get""& )
;"") *
set""+ .
;"". /
}""0 1
public$$ 
string$$ 
Environment$$ !
{$$" #
get$$$ '
;$$' (
set$$) ,
;$$, -
}$$. /
public%% 
string%% 
VerifyProofsMessage%% )
{%%* +
get%%, /
;%%/ 0
set%%1 4
;%%4 5
}%%6 7
public&& 
string&&  
VerifyProofsTemplate&& *
{&&+ ,
get&&- 0
;&&0 1
set&&2 5
;&&5 6
}&&7 8
public(( 
string(( 
FeedbackSubject(( %
{((& '
get((( +
;((+ ,
set((- 0
;((0 1
}((2 3
public** 
string** 
FeedbackEmail** #
{**$ %
get**& )
;**) *
set**+ .
;**. /
}**0 1
public,, 
string,, 
LogFilePath,, !
{,," #
get,,$ '
;,,' (
set,,) ,
;,,, -
},,. /
public-- 
string-- 
TemplateFilesPath-- '
{--( )
get--* -
;--- .
set--/ 2
;--2 3
}--4 5
public.. 
string.. 
DailyOutPutFilePath.. )
{..* +
get.., /
;../ 0
set..1 4
;..4 5
}..6 7
public// 
bool// 
RunJobs// 
{// 
get// !
;//! "
set//# &
;//& '
}//( )
public00 
int00 
[00 
]00 
GetAllBranchesFor00 &
{00' (
get00) ,
;00, -
set00. 1
;001 2
}003 4
public11 
bool11 %
AllowEmployeeVerification11 -
{11. /
get110 3
;113 4
set115 8
;118 9
}11: ;
public22 
string22 
[22 
]22  
AllowedLegalBranches22 ,
{22- .
get22/ 2
;222 3
set224 7
;227 8
}229 :
}33 
}44 ∆
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\AwsEmailSettings.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
.% &
ApplicationSettings& 9
{ 
public		 

class		 
AwsEmailSettings		 !
{

 
public 
static 
AwsEmailSettings &
Current' .
;. /
public 
AwsEmailSettings 
(  
)  !
{ 	
Current 
= 
this 
; 
} 	
public 
string 
	FromEmail 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
Port 
{ 
get 
; 
set "
;" #
}$ %
public 
string 
Host 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ≥	
ÉF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\EmailConfiguration.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
.$ %
ApplicationSettings% 8
{ 
public 

class 
EmailConfiguration #
{ 
public 
static 
EmailConfiguration (
Current) 0
;0 1
public 
EmailConfiguration !
(! "
)" #
{ 	
Current		 
=		 
this		 
;		 
}

 	
public 
string 
FromEmailAddress &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
ToEmailAddress $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
CcEmailAddress $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} Ä
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\EqualSettings.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
.% &
ApplicationSettings& 9
{ 
public 

class 
EqualSettings 
{ 
public 
static 
EqualSettings #
Current$ +
;+ ,
public

 
EqualSettings

 
(

 
)

 
{ 	
Current 
= 
this 
; 
} 	
public 
string 
ClientId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
ClientSecret "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
GateWayInstance %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
EqualGateWayUrl %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ExperiencedPerson '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
Fresher 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Driver 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string !
InitializeTransaction +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
	FetchData 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
EqualInitGateWayUrl )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} Ç
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\JobSettings.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
.% &
ApplicationSettings& 9
{ 
public 

class 
JobSettings 
{ 
public 
static 
JobSettings !
Current" )
;) *
public

 
JobSettings

 
(

 
)

 
{ 	
Current 
= 
this 
; 
} 	
public 
bool 
SendEmialJob  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
AutoApprovalJob #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
ResignedEmployeeJob '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
bool 
SendOTPEmail  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool !
SendResignedEmployees )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool $
CreateAppointmentLetters ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} å
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\JwtTokenConfig.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
.% &
ApplicationSettings& 9
{ 
public		 

class		 !
JwtTokenConfiguration		 &
{

 
public 
static !
JwtTokenConfiguration +
Current, 3
;3 4
public !
JwtTokenConfiguration $
($ %
)% &
{ 	
Current 
= 
this 
; 
} 	
public 
string 
JwtKey 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	JwtIssuer 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Jwtaudience !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	JwtExpire 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string "
refreshTokenExpiration ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
string 
securityKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ˜
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\MailSettings.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
.$ %
ApplicationSettings% 8
{ 
public 

class 
MailSettings 
{ 
public 
static 
MailSettings "
Current# *
;* +
public 
MailSettings 
( 
) 
{ 	
Current		 
=		 
this		 
;		 
}

 	
public 
string 
	FromEmail 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
Port 
{ 
get 
; 
set "
;" #
}$ %
public 
string 
Host 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
	EnableSsl 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int !
UseDefaultCredentials (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
int 
DeliveryMethod !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} —
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\NConnectSettings.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
.$ %
ApplicationSettings% 8
{ 
public 

class 
NConnectSettings !
{ 
public 
static 
NConnectSettings &
Current' .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
NConnectSettings 
(  
)  !
{ 	
Current		 
=		 
this		 
;		 
}

 	
public 
string 
SecurityKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
SecuritySalt "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ˚
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\OracleSettings.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
.$ %
ApplicationSettings% 8
{ 
public 

class 
OracleSettings 
{ 
public 
static 
OracleSettings $
Current% ,
;, -
public

 
List

 
<

 
OracleSettings

 "
>

" #
Settings

$ ,
;

, -
public 
OracleSettings 
( 
) 
{ 	
Current 
= 
this 
; 
} 	
public 
string 
Host 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Port 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Database 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
ConnectionString &
{ 	
get 
{ 
string 
connectionString '
=( )
string* 0
.0 1
Empty1 6
;6 7
connectionString    
=  ! "
$str  # Q
;  Q R
connectionString!!  
=!!! "
string!!# )
.!!) *
Format!!* 0
(!!0 1
connectionString!!1 A
,!!A B
Host!!C G
,!!G H
Port!!I M
)!!M N
;!!N O
return"" 
connectionString"" '
;""' (
}## 
}$$ 	
}&& 
public(( 

class(( 
OracleSettingValues(( $
{)) 
public** 
static** 
List** 
<** 
OracleSettings** )
>**) *
settings**+ 3
;**3 4
public++ 
OracleSettingValues++ "
(++" #
)++# $
{,, 	
settings-- 
=-- 
new-- 
List-- 
<--  
OracleSettings--  .
>--. /
(--/ 0
)--0 1
;--1 2
}.. 	
}// 
}00 ™
ãF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\ResignedEmailConfiguration.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
.% &
ApplicationSettings& 9
{		 
public

 

class

 &
ResignedEmailConfiguration

 +
{ 
public 
static &
ResignedEmailConfiguration 0
Current1 8
;8 9
public &
ResignedEmailConfiguration )
() *
)* +
{ 	
Current 
= 
this 
; 
} 	
public 
string 
FromEmailAddress &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
ToEmailAddress $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
CcEmailAddress $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
MailSubject !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	Emailbody 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
SentTo 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ß
ÅF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ApplicationSettings\S3BucketSettings.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
.$ %
ApplicationSettings% 8
{ 
public 

class 
S3BucketSettings !
{ 
public 
static 
S3BucketSettings &
Current' .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
S3BucketSettings 
(  
)  !
{ 	
Current		 
=		 
this		 
;		 
}

 	
public 
string 

BucketName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
	AccessKey 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	SecretKey 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Region 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
EmployeesFolder %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ∞
pF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\Constants\Constants.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
.% &
	Constants& /
{ 
public 

static 
class 
	Constants !
{ 
publicLL 
constLL 
stringLL 
PDFMIMETYPELL '
=LL( )
$strLL* ;
;LL; <
publicMM 
constMM 
stringMM 
WORDMIMETYPEMM (
=MM) *
$strMM+ ?
;MM? @
publicNN 
constNN 
stringNN 
IMGMIMETYPENN '
=NN( )
$strNN* 6
;NN6 7
publicPP 
constPP 
stringPP 
PDFEXTENSIONPP (
=PP) *
$strPP+ 1
;PP1 2
publicQQ 
constQQ 
stringQQ 
WORDEXTENSIONQQ )
=QQ* +
$strQQ, 2
;QQ2 3
}RR 
}SS ÿ
oF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\ConvertToUpparCase.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
{ 
public 

static 
class 
ConvertToUpparCase *
{ 
public 
static 
void 
StringToUpparCase -
<- .
t. /
>/ 0
(0 1
t1 2
classObj3 ;
); <
{ 	
classObj		 
.		 
GetType		 
(		 
)		 
.		 
GetProperties		 ,
(		, -
)		- .
.		. /
ForEach		/ 6
(		6 7
p		7 8
=>		9 ;
{

 
if 
( 
p 
. 
PropertyType "
==# %
typeof& ,
(, -
string- 3
)3 4
&&5 7
p8 9
.9 :
GetValue: B
(B C
classObjC K
)K L
!=M O
nullP T
)T U
p 
. 
SetValue 
( 
classObj '
,' (
p) *
.* +
GetValue+ 3
(3 4
classObj4 <
)< =
.= >
ToString> F
(F G
)G H
.H I
ToUpperI P
(P Q
)Q R
)R S
;S T
} 
) 
; 
} 	
} 
} Ω
rF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\DisplayValueAttribute.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
Helper %
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Field% *
)* +
]+ ,
public 

class !
DisplayValueAttribute &
:' (
	Attribute) 2
{ 
public 
string 
StringifiedValue &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public

 !
DisplayValueAttribute

 $
(

$ %
string

% +
strValue

, 4
)

4 5
{ 	
StringifiedValue 
= 
strValue '
;' (
} 	
} 
} ›
tF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\FileService\FileService.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
.$ %
FileService% 0
{ 
public 

class 
FileService 
{ 
private 
string 
	_rootPath  
;  !
public

 
FileService

 
(

 
string

 !
rootPath

" *
)

* +
{ 	
	_rootPath 
= 
rootPath  
;  !
} 	
public 
string #
GetEmailTemplateContent -
(- .
string. 4
emailTemplateName5 F
)F G
{ 	
string 
[ 
] 
allFiles 
= 
	Directory  )
.) *
GetFiles* 2
(2 3
	_rootPath3 <
)< =
;= >
string 
templateFileName #
=$ %
allFiles& .
.. /
FirstOrDefault/ =
(= >
x> ?
=>@ B
xC D
.D E
ContainsE M
(M N
emailTemplateNameN _
)_ `
)` a
;a b
string 
emailContent 
=  !
File" &
.& '
ReadAllText' 2
(2 3
Path3 7
.7 8
Combine8 ?
(? @
templateFileName@ P
)P Q
)Q R
;R S
return 
emailContent 
;  
} 	
} 
} ΩA
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\MyCryptography.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
{ 
public 

static 
class 
MyCryptography &
{		 
public

 
static

 
string

 
Encrypt

 $
(

$ %
string

% +
	plainText

, 5
,

5 6
string

7 =
key

> A
,

A B
string

C I
iv

J L
)

L M
{ 	
byte 
[ 
] 
	encrypted 
; 
using 
( 
RijndaelManaged "
rijndaelAlg# .
=/ 0
new1 4
(4 5
)5 6
)6 7
{ $
MD5CryptoServiceProvider (
hashMD5) 0
=1 2
new3 6
(6 7
)7 8
;8 9
rijndaelAlg 
. 
Key 
=  !
hashMD5" )
.) *
ComputeHash* 5
(5 6
Encoding6 >
.> ?
ASCII? D
.D E
GetBytesE M
(M N
keyN Q
)Q R
)R S
;S T
rijndaelAlg 
. 
IV 
=  
hashMD5! (
.( )
ComputeHash) 4
(4 5
Encoding5 =
.= >
ASCII> C
.C D
GetBytesD L
(L M
ivM O
)O P
)P Q
;Q R
rijndaelAlg 
. 
Mode  
=! "

CipherMode# -
.- .
CBC. 1
;1 2
rijndaelAlg 
. 
Padding #
=$ %
PaddingMode& 1
.1 2
PKCS72 7
;7 8
ICryptoTransform  
	encryptor! *
=+ ,
rijndaelAlg- 8
.8 9
CreateEncryptor9 H
(H I
rijndaelAlgI T
.T U
KeyU X
,X Y
rijndaelAlgZ e
.e f
IVf h
)h i
;i j
using 
MemoryStream "
	msEncrypt# ,
=- .
new/ 2
(2 3
)3 4
;4 5
using 
CryptoStream "
	csEncrypt# ,
=- .
new/ 2
(2 3
	msEncrypt3 <
,< =
	encryptor> G
,G H
CryptoStreamModeI Y
.Y Z
WriteZ _
)_ `
;` a
using 
( 
StreamWriter #
	swEncrypt$ -
=. /
new0 3
(3 4
	csEncrypt4 =
)= >
)> ?
{ 
	swEncrypt 
. 
Write #
(# $
	plainText$ -
)- .
;. /
} 
	encrypted 
= 
	msEncrypt %
.% &
ToArray& -
(- .
). /
;/ 0
} 
return  
ByteArrayToHexString '
(' (
	encrypted( 1
)1 2
.2 3
ToUpper3 :
(: ;
); <
;< =
}   	
public"" 
static"" 
string"" 
Decrypt"" $
(""$ %
string""% +

cipherText"", 6
,""6 7
string""8 >
key""? B
,""B C
string""D J
iv""K M
)""M N
{## 	
string$$ 
	plaintext$$ 
=$$ 
null$$ #
;$$# $
using%% 
(%% 
RijndaelManaged%% "
rijndaelAlg%%# .
=%%/ 0
new%%1 4
(%%4 5
)%%5 6
)%%6 7
{&& $
MD5CryptoServiceProvider'' (
hashMD5'') 0
=''1 2
new''3 6
(''6 7
)''7 8
;''8 9
rijndaelAlg(( 
.(( 
Key(( 
=((  !
hashMD5((" )
.(() *
ComputeHash((* 5
(((5 6
Encoding((6 >
.((> ?
ASCII((? D
.((D E
GetBytes((E M
(((M N
key((N Q
)((Q R
)((R S
;((S T
rijndaelAlg)) 
.)) 
IV)) 
=))  
hashMD5))! (
.))( )
ComputeHash))) 4
())4 5
Encoding))5 =
.))= >
ASCII))> C
.))C D
GetBytes))D L
())L M
iv))M O
)))O P
)))P Q
;))Q R
rijndaelAlg** 
.** 
Mode**  
=**! "

CipherMode**# -
.**- .
CBC**. 1
;**1 2
rijndaelAlg++ 
.++ 
Padding++ #
=++$ %
PaddingMode++& 1
.++1 2
PKCS7++2 7
;++7 8
ICryptoTransform,,  
	decryptor,,! *
=,,+ ,
rijndaelAlg,,- 8
.,,8 9
CreateDecryptor,,9 H
(,,H I
rijndaelAlg,,I T
.,,T U
Key,,U X
,,,X Y
rijndaelAlg,,Z e
.,,e f
IV,,f h
),,h i
;,,i j
byte-- 
[-- 
]-- 
bytes-- 
=--  
HexStringToByteArray-- 3
(--3 4

cipherText--4 >
)--> ?
;--? @
using.. 
MemoryStream.. "
	msDecrypt..# ,
=..- .
new../ 2
(..2 3
bytes..3 8
)..8 9
;..9 :
using// 
CryptoStream// "
	csDecrypt//# ,
=//- .
new/// 2
(//2 3
	msDecrypt//3 <
,//< =
	decryptor//> G
,//G H
CryptoStreamMode//I Y
.//Y Z
Read//Z ^
)//^ _
;//_ `
using00 
StreamReader00 "
	srDecrypt00# ,
=00- .
new00/ 2
(002 3
	csDecrypt003 <
)00< =
;00= >
	plaintext11 
=11 
	srDecrypt11 %
.11% &
	ReadToEnd11& /
(11/ 0
)110 1
;111 2
}22 
return44 
	plaintext44 
;44 
}55 	
private77 
static77 
string77  
ByteArrayToHexString77 2
(772 3
byte773 7
[777 8
]778 9
	byteArray77: C
)77C D
{88 	
string99 
result99 
=99 
string99 "
.99" #
Empty99# (
;99( )
foreach:: 
(:: 
byte:: 

outputByte:: $
in::% '
	byteArray::( 1
)::1 2
{;; 
result<< 
+=<< 

outputByte<< $
.<<$ %
ToString<<% -
(<<- .
$str<<. 2
)<<2 3
;<<3 4
}== 
return?? 
result?? 
;?? 
}@@ 	
privateBB 
staticBB 
byteBB 
[BB 
]BB  
HexStringToByteArrayBB 2
(BB2 3
stringBB3 9
	hexStringBB: C
)BBC D
{CC 	
intDD 
stringLengthDD 
=DD 
	hexStringDD (
.DD( )
LengthDD) /
;DD/ 0
byteEE 
[EE 
]EE 
bytesEE 
=EE 
newEE 
byteEE #
[EE# $
stringLengthEE$ 0
/EE1 2
$numEE3 4
]EE4 5
;EE5 6
forFF 
(FF 
intFF 
iFF 
=FF 
$numFF 
;FF 
iFF 
<FF 
stringLengthFF  ,
;FF, -
iFF. /
+=FF0 2
$numFF3 4
)FF4 5
{GG 
bytesHH 
[HH 
iHH 
/HH 
$numHH 
]HH 
=HH 
ConvertHH &
.HH& '
ToByteHH' -
(HH- .
	hexStringHH. 7
.HH7 8
	SubstringHH8 A
(HHA B
iHHB C
,HHC D
$numHHE F
)HHF G
,HHG H
$numHHI K
)HHK L
;HHL M
}II 
returnKK 
bytesKK 
;KK 
}LL 	
}MM 
}NN ±B
nF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\PasswordGenerator.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
{ 
public 

static 
class 
PasswordGenerator )
{ 
public 
static 
string 
GeneratePassword -
(- .
bool. 2
includeLowercase3 C
,C D
boolE I
includeUppercaseJ Z
,Z [
bool\ `
includeNumerica o
,o p
boolq u
includeSpecial	v Ñ
,
Ñ Ö
bool
Ü ä
includeSpaces
ã ò
,
ò ô
int
ö ù
lengthOfPassword
û Æ
)
Æ Ø
{ 	
const 
int /
#MAXIMUM_IDENTICAL_CONSECUTIVE_CHARS 9
=: ;
$num< =
;= >
const 
string  
LOWERCASE_CHARACTERS -
=. /
$str0 L
;L M
const 
string  
UPPERCASE_CHARACTERS -
=. /
$str0 L
;L M
const 
string 
NUMERIC_CHARACTERS +
=, -
$str. :
;: ;
const 
string 
SPECIAL_CHARACTERS +
=, -
$str. 9
;9 :
const 
string 
SPACE_CHARACTER (
=) *
$str+ .
;. /
const 
int 
PASSWORD_LENGTH_MIN )
=* +
$num, -
;- .
const 
int 
PASSWORD_LENGTH_MAX )
=* +
$num, /
;/ 0
if 
( 
lengthOfPassword  
<! "
PASSWORD_LENGTH_MIN# 6
||7 9
lengthOfPassword: J
>K L
PASSWORD_LENGTH_MAXM `
)` a
{ 
return 
$str C
;C D
} 
string!! 
characterSet!! 
=!!  !
$str!!" $
;!!$ %
if## 
(## 
includeLowercase##  
)##  !
{$$ 
characterSet%% 
+=%%  
LOWERCASE_CHARACTERS%%  4
;%%4 5
}&& 
if(( 
((( 
includeUppercase((  
)((  !
{)) 
characterSet** 
+=**  
UPPERCASE_CHARACTERS**  4
;**4 5
}++ 
if-- 
(-- 
includeNumeric-- 
)-- 
{.. 
characterSet// 
+=// 
NUMERIC_CHARACTERS//  2
;//2 3
}00 
if22 
(22 
includeSpecial22 
)22 
{33 
characterSet44 
+=44 
SPECIAL_CHARACTERS44  2
;442 3
}55 
if77 
(77 
includeSpaces77 
)77 
{88 
characterSet99 
+=99 
SPACE_CHARACTER99  /
;99/ 0
}:: 
char<< 
[<< 
]<< 
password<< 
=<< 
new<< !
char<<" &
[<<& '
lengthOfPassword<<' 7
]<<7 8
;<<8 9
int== 
characterSetLength== "
===# $
characterSet==% 1
.==1 2
Length==2 8
;==8 9
System?? 
.?? 
Random?? 
random??  
=??! "
new??# &
(??& '
)??' (
;??( )
for@@ 
(@@ 
int@@ 
characterPosition@@ &
=@@' (
$num@@) *
;@@* +
characterPosition@@, =
<@@> ?
lengthOfPassword@@@ P
;@@P Q
characterPosition@@R c
++@@c e
)@@e f
{AA 
passwordBB 
[BB 
characterPositionBB *
]BB* +
=BB, -
characterSetBB. :
[BB: ;
randomBB; A
.BBA B
NextBBB F
(BBF G
characterSetLengthBBG Y
-BBZ [
$numBB\ ]
)BB] ^
]BB^ _
;BB_ `
boolDD &
moreThanTwoIdenticalInARowDD /
=DD0 1
characterPositionEE %
>EE& '/
#MAXIMUM_IDENTICAL_CONSECUTIVE_CHARSEE( K
&&FF 
passwordFF 
[FF  
characterPositionFF  1
]FF1 2
==FF3 5
passwordFF6 >
[FF> ?
characterPositionFF? P
-FFQ R
$numFFS T
]FFT U
&&GG 
passwordGG 
[GG  
characterPositionGG  1
-GG2 3
$numGG4 5
]GG5 6
==GG7 9
passwordGG: B
[GGB C
characterPositionGGC T
-GGU V
$numGGW X
]GGX Y
;GGY Z
ifII 
(II &
moreThanTwoIdenticalInARowII .
)II. /
{JJ 
characterPositionKK %
--KK% '
;KK' (
}LL 
}MM 
returnOO 
stringOO 
.OO 
JoinOO 
(OO 
nullOO #
,OO# $
passwordOO% -
)OO- .
;OO. /
}PP 	
public\\ 
static\\ 
bool\\ 
PasswordIsValid\\ *
(\\* +
bool\\+ /
includeLowercase\\0 @
,\\@ A
bool\\B F
includeUppercase\\G W
,\\W X
bool\\Y ]
includeNumeric\\^ l
,\\l m
bool\\n r
includeSpecial	\\s Å
,
\\Å Ç
bool
\\É á
includeSpaces
\\à ï
,
\\ï ñ
string
\\ó ù
password
\\û ¶
)
\\¶ ß
{]] 	
const^^ 
string^^ 
REGEX_LOWERCASE^^ (
=^^) *
$str^^+ 3
;^^3 4
const__ 
string__ 
REGEX_UPPERCASE__ (
=__) *
$str__+ 3
;__3 4
const`` 
string`` 
REGEX_NUMERIC`` &
=``' (
$str``) 0
;``0 1
constaa 
stringaa 
REGEX_SPECIALaa &
=aa' (
$straa) :
;aa: ;
constbb 
stringbb 
REGEX_SPACEbb $
=bb% &
$strbb' 0
;bb0 1
booldd 
lowerCaseIsValiddd !
=dd" #
!dd$ %
includeLowercasedd% 5
||dd6 8
(dd9 :
includeLowercasedd: J
&&ddK M
RegexddN S
.ddS T
IsMatchddT [
(dd[ \
passworddd\ d
,ddd e
REGEX_LOWERCASEddf u
)ddu v
)ddv w
;ddw x
boolee 
upperCaseIsValidee !
=ee" #
!ee$ %
includeUppercaseee% 5
||ee6 8
(ee9 :
includeUppercaseee: J
&&eeK M
RegexeeN S
.eeS T
IsMatcheeT [
(ee[ \
passwordee\ d
,eed e
REGEX_UPPERCASEeef u
)eeu v
)eev w
;eew x
boolff 
numericIsValidff 
=ff  !
!ff" #
includeNumericff# 1
||ff2 4
(ff5 6
includeNumericff6 D
&&ffE G
RegexffH M
.ffM N
IsMatchffN U
(ffU V
passwordffV ^
,ff^ _
REGEX_NUMERICff` m
)ffm n
)ffn o
;ffo p
boolgg 
symbolsAreValidgg  
=gg! "
!gg# $
includeSpecialgg$ 2
||gg3 5
(gg6 7
includeSpecialgg7 E
&&ggF H
RegexggI N
.ggN O
IsMatchggO V
(ggV W
passwordggW _
,gg_ `
REGEX_SPECIALgga n
)ggn o
)ggo p
;ggp q
boolhh 
spacesAreValidhh 
=hh  !
!hh" #
includeSpaceshh# 0
||hh1 3
(hh4 5
includeSpaceshh5 B
&&hhC E
RegexhhF K
.hhK L
IsMatchhhL S
(hhS T
passwordhhT \
,hh\ ]
REGEX_SPACEhh^ i
)hhi j
)hhj k
;hhk l
returnjj 
lowerCaseIsValidjj #
&&jj$ &
upperCaseIsValidjj' 7
&&jj8 :
numericIsValidjj; I
&&jjJ L
symbolsAreValidjjM \
&&jj] _
spacesAreValidjj` n
;jjn o
}kk 	
}ll 
}mm ŒH
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\SqlTableCopier.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
{ 
public 

class 
SqlTableCopier 
{ 
private 
SqlConnection 

connection (
;( )
private 
SqlTransaction 
transaction *
;* +
private 
string  
destinationTableName +
;+ ,
public 
SqlTableCopier 
( 
) 
{  !
}" #
public 
SqlTableCopier 
( 
SqlConnection +

connection, 6
)6 7
: 
this 
( 

connection 
, 
null #
,# $
string% +
.+ ,
Empty, 1
)1 2
{3 4
}5 6
public!! 
SqlTableCopier!! 
(!! 
SqlConnection!! +

connection!!, 6
,!!6 7
SqlTransaction!!8 F
transaction!!G R
,!!R S
string!!T Z 
destinationTableName!![ o
)!!o p
{"" 	
this## 
.## 

connection## 
=## 

connection## (
;##( )
this$$ 
.$$ 
transaction$$ 
=$$ 
transaction$$ *
;$$* +
this%% 
.%%  
destinationTableName%% %
=%%& ' 
destinationTableName%%( <
;%%< =
}&& 	
	protected(( 
string(( &
GetBulkCopyColumnException(( 3
(((3 4
	Exception((4 =
ex((> @
,((@ A
SqlBulkCopy((B M
bulkcopy((N V
)((V W
{** 	
string++ 
message++ 
=++ 
string++ #
.++# $
Empty++$ )
;++) *
if,, 
(,, 
ex,, 
.,, 
Message,, 
.,, 
Contains,, #
(,,# $
$str,,$ e
),,e f
),,f g
{.. 
string// 
pattern// 
=//  
$str//! '
;//' (
Match00 
match00 
=00 
Regex00 #
.00# $
Match00$ )
(00) *
ex00* ,
.00, -
Message00- 4
.004 5
ToString005 =
(00= >
)00> ?
,00? @
pattern00A H
)00H I
;00I J
var11 
index11 
=11 
Convert11 #
.11# $
ToInt3211$ +
(11+ ,
match11, 1
.111 2
Value112 7
)117 8
-119 :
$num11; <
;11< =
	FieldInfo33 
fi33 
=33 
typeof33 %
(33% &
SqlBulkCopy33& 1
)331 2
.332 3
GetField333 ;
(33; <
$str33< S
,33S T
BindingFlags33U a
.33a b
	NonPublic33b k
|33l m
BindingFlags33n z
.33z {
Instance	33{ É
)
33É Ñ
;
33Ñ Ö
var44 
sortedColumns44 !
=44" #
fi44$ &
.44& '
GetValue44' /
(44/ 0
bulkcopy440 8
)448 9
;449 :
var55 
items55 
=55 
(55 
Object55 #
[55# $
]55$ %
)55% &
sortedColumns55& 3
.553 4
GetType554 ;
(55; <
)55< =
.55= >
GetField55> F
(55F G
$str55G O
,55O P
BindingFlags55Q ]
.55] ^
	NonPublic55^ g
|55h i
BindingFlags55j v
.55v w
Instance55w 
)	55 Ä
.
55Ä Å
GetValue
55Å â
(
55â ä
sortedColumns
55ä ó
)
55ó ò
;
55ò ô
	FieldInfo77 
itemdata77 "
=77# $
items77% *
[77* +
index77+ 0
]770 1
.771 2
GetType772 9
(779 :
)77: ;
.77; <
GetField77< D
(77D E
$str77E P
,77P Q
BindingFlags77R ^
.77^ _
	NonPublic77_ h
|77i j
BindingFlags77k w
.77w x
Instance	77x Ä
)
77Ä Å
;
77Å Ç
var88 
metadata88 
=88 
itemdata88 '
.88' (
GetValue88( 0
(880 1
items881 6
[886 7
index887 <
]88< =
)88= >
;88> ?
var99 
column99 
=99 
metadata99 %
.99% &
GetType99& -
(99- .
)99. /
.99/ 0
GetField990 8
(998 9
$str999 A
,99A B
BindingFlags99C O
.99O P
Public99P V
|99W X
BindingFlags99Y e
.99e f
	NonPublic99f o
|99p q
BindingFlags99r ~
.99~ 
Instance	99 á
)
99á à
.
99à â
GetValue
99â ë
(
99ë í
metadata
99í ö
)
99ö õ
;
99õ ú
var:: 
length:: 
=:: 
metadata:: %
.::% &
GetType::& -
(::- .
)::. /
.::/ 0
GetField::0 8
(::8 9
$str::9 A
,::A B
BindingFlags::C O
.::O P
Public::P V
|::W X
BindingFlags::Y e
.::e f
	NonPublic::f o
|::p q
BindingFlags::r ~
.::~ 
Instance	:: á
)
::á à
.
::à â
GetValue
::â ë
(
::ë í
metadata
::í ö
)
::ö õ
;
::õ ú
message;; 
=;; 
string;;  
.;;  !
Format;;! '
(;;' (
$str;;( c
,;;c d
column;;e k
,;;k l
length;;m s
);;s t
;;;t u
}<< 
return>> 
message>> 
;>> 
}?? 	
publicAA 
voidAA 
CopyDataAA 
(AA 
	DataTableAA &

sourceDataAA' 1
,AA1 2
stringAA3 9

schemaNameAA: D
,AAD E
stringAAF L
	tableNameAAM V
)AAV W
{BB 	
SqlBulkCopyCC 
bulkCopyCC  
=CC! "
nullCC# '
;CC' (
tryDD 
{EE 
ifFF 
(FF 
thisFF 
.FF 

connectionFF #
.FF# $
StateFF$ )
==FF* ,
ConnectionStateFF- <
.FF< =
OpenFF= A
)FFA B
{GG 
thisHH 
.HH 

connectionHH #
.HH# $
CloseHH$ )
(HH) *
)HH* +
;HH+ ,
thisII 
.II 

connectionII #
.II# $
OpenII$ (
(II( )
)II) *
;II* +
}JJ 
elseKK 
{LL 
thisMM 
.MM 

connectionMM #
.MM# $
OpenMM$ (
(MM( )
)MM) *
;MM* +
}NN 
usingPP 
(PP 
bulkCopyPP 
=PP  !
newPP" %
SqlBulkCopyPP& 1
(PP1 2
thisPP2 6
.PP6 7

connectionPP7 A
)PPA B
)PPB C
{QQ 
thisRR 
.RR  
destinationTableNameRR -
=RR. /
stringRR0 6
.RR6 7
EmptyRR7 <
;RR< =
ifSS 
(SS 
stringSS 
.SS 
IsNullOrEmptySS ,
(SS, -
thisSS- 1
.SS1 2 
destinationTableNameSS2 F
)SSF G
)SSG H
{TT 
thisUU 
.UU  
destinationTableNameUU 1
=UU2 3
stringUU4 :
.UU: ;
FormatUU; A
(UUA B
$strUUB O
,UUO P

schemaNameUUQ [
,UU[ \
	tableNameUU] f
)UUf g
;UUg h
}VV 
bulkCopyXX 
.XX  
DestinationTableNameXX 1
=XX2 3
thisXX4 8
.XX8 9 
destinationTableNameXX9 M
;XXM N
bulkCopyYY 
.YY 
WriteToServerYY *
(YY* +

sourceDataYY+ 5
)YY5 6
;YY6 7
}ZZ 
}[[ 
catch\\ 
(\\ 
	Exception\\ 
ex\\ 
)\\  
{]] 
if^^ 
(^^ 
ex^^ 
.^^ 
Message^^ 
.^^ 
Contains^^ '
(^^' (
$str^^( i
)^^i j
)^^j k
{__ 
stringaa 
errorMessageaa '
=aa( )
thisaa* .
.aa. /&
GetBulkCopyColumnExceptionaa/ I
(aaI J
exaaJ L
,aaL M
bulkCopyaaN V
)aaV W
;aaW X
	Exceptioncc 
exInvlidColumncc ,
=cc- .
newcc/ 2
(cc2 3
errorMessagecc3 ?
,cc? @
exccA C
)ccC D
;ccD E
}ee 
}ff 
}gg 	
}hh 
}ii À±
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Helper\SqlTableCreator.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Helper $
{ 
public 

class 
SqlTableCreator  
{ 
private 
SqlConnection 
_connection )
;) *
public 
SqlConnection 

Connection '
{ 	
get 
{ 
return 
this 
. 
_connection )
;) *
}+ ,
set 
{ 
this 
. 
_connection "
=# $
value% *
;* +
}, -
} 	
private 
SqlTransaction 
_transaction +
;+ ,
public!! 
SqlTransaction!! 
Transaction!! )
{"" 	
get## 
{## 
return## 
this## 
.## 
_transaction## *
;##* +
}##, -
set$$ 
{$$ 
this$$ 
.$$ 
_transaction$$ #
=$$$ %
value$$& +
;$$+ ,
}$$- .
}%% 	
private'' 
string'' 

_tableName'' !
;''! "
public)) 
string))  
DestinationTableName)) *
{** 	
get++ 
{++ 
return++ 
this++ 
.++ 

_tableName++ (
;++( )
}++* +
set,, 
{,, 
this,, 
.,, 

_tableName,, !
=,," #
value,,$ )
;,,) *
},,+ ,
}-- 	
public// 
SqlTableCreator// 
(// 
)//  
{//! "
}//# $
public11 
SqlTableCreator11 
(11 
SqlConnection11 ,

connection11- 7
)117 8
:22 
this22 
(22 

connection22 
,22 
null22 #
)22# $
{22% &
}22' (
public44 
SqlTableCreator44 
(44 
SqlConnection44 ,

connection44- 7
,447 8
SqlTransaction449 G
transaction44H S
)44S T
{55 	
this66 
.66 
_connection66 
=66 

connection66 )
;66) *
this77 
.77 
_transaction77 
=77 
transaction77  +
;77+ ,
}88 	
public:: 
object:: 
Create:: 
(:: 
	DataTable:: &
schema::' -
)::- .
{;; 	
return<< 
this<< 
.<< 
Create<< 
(<< 
schema<< %
,<<% &
null<<' +
)<<+ ,
;<<, -
}== 	
public?? 
object?? 
Create?? 
(?? 
	DataTable?? &
schema??' -
,??- .
int??/ 2
numKeys??3 :
)??: ;
{@@ 	
intAA 
[AA 
]AA 
primaryKeysAA 
=AA 
newAA  #
intAA$ '
[AA' (
numKeysAA( /
]AA/ 0
;AA0 1
forBB 
(BB 
intBB 
iBB 
=BB 
$numBB 
;BB 
iBB 
<BB 
numKeysBB  '
;BB' (
iBB) *
++BB* ,
)BB, -
{CC 
primaryKeysDD 
[DD 
iDD 
]DD 
=DD  
iDD! "
;DD" #
}EE 
returnGG 
thisGG 
.GG 
CreateGG 
(GG 
schemaGG %
,GG% &
primaryKeysGG' 2
)GG2 3
;GG3 4
}HH 	
publicJJ 
objectJJ 
CreateJJ 
(JJ 
	DataTableJJ &
schemaJJ' -
,JJ- .
intJJ/ 2
[JJ2 3
]JJ3 4
primaryKeysJJ5 @
)JJ@ A
{KK 	
primaryKeysLL 
=LL 
newLL 
intLL !
[LL! "
$numLL" #
]LL# $
;LL$ %
stringMM 
sqlMM 
=MM 
GetCreateSQLMM %
(MM% &
thisMM& *
.MM* +

_tableNameMM+ 5
,MM5 6
schemaMM7 =
,MM= >
primaryKeysMM? J
)MMJ K
;MMK L

SqlCommandOO 
cmdOO 
;OO 
ifPP 
(PP 
thisPP 
.PP 
_transactionPP !
!=PP" $
nullPP% )
&&PP* ,
thisPP- 1
.PP1 2
_transactionPP2 >
.PP> ?

ConnectionPP? I
!=PPJ L
nullPPM Q
)PPQ R
{QQ 
cmdRR 
=RR 
newRR 

SqlCommandRR $
(RR$ %
sqlRR% (
,RR( )
thisRR* .
.RR. /
_connectionRR/ :
,RR: ;
thisRR< @
.RR@ A
_transactionRRA M
)RRM N
;RRN O
}SS 
elseTT 
{UU 
cmdVV 
=VV 
newVV 

SqlCommandVV $
(VV$ %
sqlVV% (
,VV( )
thisVV* .
.VV. /
_connectionVV/ :
)VV: ;
;VV; <
}WW 
returnYY 
cmdYY 
.YY 
ExecuteNonQueryYY &
(YY& '
)YY' (
;YY( )
}ZZ 	
public\\ 
object\\ 
CreateFromDataTable\\ )
(\\) *
	DataTable\\* 3
table\\4 9
,\\9 :
string\\; A

schemaName\\B L
,\\L M
string\\N T
	tableName\\U ^
)\\^ _
{]] 	
if^^ 
(^^ 
string^^ 
.^^ 
IsNullOrEmpty^^ $
(^^$ %
	tableName^^% .
)^^. /
)^^/ 0
{__ 
	tableName`` 
=`` 
this``  
.``  !

_tableName``! +
;``+ ,
}aa 
stringcc 
sqlcc 
=cc %
GetCreateFromDataTableSQLcc 2
(cc2 3

schemaNamecc3 =
,cc= >
	tableNamecc? H
,ccH I
tableccJ O
)ccO P
;ccP Q

SqlCommandee 
cmdee 
;ee 
ifff 
(ff 
thisff 
.ff 
_connectionff  
.ff  !
Stateff! &
==ff' )
ConnectionStateff* 9
.ff9 :
Openff: >
)ff> ?
{gg 
thishh 
.hh 
_connectionhh  
.hh  !
Closehh! &
(hh& '
)hh' (
;hh( )
thisii 
.ii 
_connectionii  
.ii  !
Openii! %
(ii% &
)ii& '
;ii' (
}jj 
elsekk 
{ll 
thismm 
.mm 
_connectionmm  
.mm  !
Openmm! %
(mm% &
)mm& '
;mm' (
}nn 
ifpp 
(pp 
thispp 
.pp 
_transactionpp !
!=pp" $
nullpp% )
&&pp* ,
thispp- 1
.pp1 2
_transactionpp2 >
.pp> ?

Connectionpp? I
!=ppJ L
nullppM Q
)ppQ R
{qq 
cmdrr 
=rr 
newrr 

SqlCommandrr $
(rr$ %
sqlrr% (
,rr( )
thisrr* .
.rr. /
_connectionrr/ :
,rr: ;
thisrr< @
.rr@ A
_transactionrrA M
)rrM N
;rrN O
}ss 
elsett 
{uu 
cmdvv 
=vv 
newvv 

SqlCommandvv $
(vv$ %
sqlvv% (
,vv( )
thisvv* .
.vv. /
_connectionvv/ :
)vv: ;
;vv; <
}ww 
ifyy 
(yy 
sqlyy 
!=yy 
stringyy 
.yy 
Emptyyy #
)yy# $
{zz 
return{{ 
cmd{{ 
.{{ 
ExecuteNonQuery{{ *
({{* +
){{+ ,
;{{, -
}|| 
this~~ 
.~~ 
_connection~~ 
.~~ 
Close~~ "
(~~" #
)~~# $
;~~$ %
return 
null 
; 
}
ÄÄ 	
public
ÇÇ 
void
ÇÇ 
CopyDataToTable
ÇÇ #
(
ÇÇ# $
	DataTable
ÇÇ$ -
table
ÇÇ. 3
,
ÇÇ3 4
string
ÇÇ5 ;

schemaName
ÇÇ< F
,
ÇÇF G
string
ÇÇH N
	tableName
ÇÇO X
)
ÇÇX Y
{
ÉÉ 	
if
ÑÑ 
(
ÑÑ 
this
ÑÑ 
.
ÑÑ 
_connection
ÑÑ  
.
ÑÑ  !
State
ÑÑ! &
==
ÑÑ' )
ConnectionState
ÑÑ* 9
.
ÑÑ9 :
Open
ÑÑ: >
)
ÑÑ> ?
{
ÖÖ 
this
ÜÜ 
.
ÜÜ 
_connection
ÜÜ  
.
ÜÜ  !
Close
ÜÜ! &
(
ÜÜ& '
)
ÜÜ' (
;
ÜÜ( )
this
áá 
.
áá 
_connection
áá  
.
áá  !
Open
áá! %
(
áá% &
)
áá& '
;
áá' (
}
àà 
else
ââ 
{
ää 
this
ãã 
.
ãã 
_connection
ãã  
.
ãã  !
Open
ãã! %
(
ãã% &
)
ãã& '
;
ãã' (
}
åå 
SqlTableCopier
éé 
copier
éé !
=
éé" #
new
éé$ '
(
éé' (
this
éé( ,
.
éé, -
_connection
éé- 8
,
éé8 9
this
éé: >
.
éé> ?
_transaction
éé? K
,
ééK L
this
ééM Q
.
ééQ R

_tableName
ééR \
)
éé\ ]
;
éé] ^
copier
èè 
.
èè 
CopyData
èè 
(
èè 
table
èè !
,
èè! "

schemaName
èè# -
,
èè- .
	tableName
èè/ 8
)
èè8 9
;
èè9 :
this
êê 
.
êê 
_connection
êê 
.
êê 
Close
êê "
(
êê" #
)
êê# $
;
êê$ %
}
ëë 	
public
ìì 
static
ìì 
string
ìì 
GetCreateSQL
ìì )
(
ìì) *
string
ìì* 0
	tableName
ìì1 :
,
ìì: ;
	DataTable
ìì< E
schema
ììF L
,
ììL M
int
ììN Q
[
ììQ R
]
ììR S
primaryKeys
ììT _
)
ìì_ `
{
îî 	
primaryKeys
ïï 
=
ïï 
new
ïï 
int
ïï !
[
ïï! "
$num
ïï" #
]
ïï# $
;
ïï$ %
string
ññ 
sql
ññ 
=
ññ 
$str
ññ (
+
ññ) *
	tableName
ññ+ 4
+
ññ5 6
$str
ññ7 =
;
ññ= >
foreach
ôô 
(
ôô 
DataRow
ôô 
column
ôô #
in
ôô$ &
schema
ôô' -
.
ôô- .
Rows
ôô. 2
)
ôô2 3
{
öö 
if
õõ 
(
õõ 
!
õõ 
(
õõ 
schema
õõ 
.
õõ 
Columns
õõ $
.
õõ$ %
Contains
õõ% -
(
õõ- .
$str
õõ. 8
)
õõ8 9
&&
õõ: <
(
õõ= >
bool
õõ> B
)
õõB C
column
õõC I
[
õõI J
$str
õõJ T
]
õõT U
)
õõU V
)
õõV W
{
úú 
sql
ùù 
+=
ùù 
column
ùù !
[
ùù! "
$str
ùù" .
]
ùù. /
.
ùù/ 0
ToString
ùù0 8
(
ùù8 9
)
ùù9 :
+
ùù; <
$str
ùù= @
+
ùùA B

SQLGetType
ùùC M
(
ùùM N
column
ùùN T
)
ùùT U
+
ùùV W
$str
ùùX ]
;
ùù] ^
}
ûû 
}
üü 
sql
°° 
=
°° 
sql
°° 
.
°° 
TrimEnd
°° 
(
°° 
new
°° !
char
°°" &
[
°°& '
]
°°' (
{
°°) *
$char
°°+ .
,
°°. /
$char
°°0 4
}
°°5 6
)
°°6 7
+
°°8 9
$str
°°: >
;
°°> ?
string
§§ 
pk
§§ 
=
§§ 
$str
§§ (
+
§§) *
	tableName
§§+ 4
+
§§5 6
$str
§§7 Q
;
§§Q R
bool
•• 
hasKeys
•• 
=
•• 
primaryKeys
•• &
!=
••' )
null
••* .
&&
••/ 1
primaryKeys
••2 =
.
••= >
Length
••> D
>
••E F
$num
••G H
;
••H I
if
¶¶ 
(
¶¶ 
hasKeys
¶¶ 
)
¶¶ 
{
ßß 
foreach
©© 
(
©© 
int
©© 
key
©©  
in
©©! #
primaryKeys
©©$ /
)
©©/ 0
{
™™ 
pk
´´ 
+=
´´ 
schema
´´  
.
´´  !
Rows
´´! %
[
´´% &
key
´´& )
]
´´) *
[
´´* +
$str
´´+ 7
]
´´7 8
.
´´8 9
ToString
´´9 A
(
´´A B
)
´´B C
+
´´D E
$str
´´F J
;
´´J K
}
¨¨ 
}
≠≠ 
else
ÆÆ 
{
ØØ 
string
±± 
keys
±± 
=
±± 
string
±± $
.
±±$ %
Join
±±% )
(
±±) *
$str
±±* .
,
±±. /
GetPrimaryKeys
±±0 >
(
±±> ?
schema
±±? E
)
±±E F
)
±±F G
;
±±G H
pk
≤≤ 
+=
≤≤ 
keys
≤≤ 
;
≤≤ 
hasKeys
≥≥ 
=
≥≥ 
keys
≥≥ 
.
≥≥ 
Length
≥≥ %
>
≥≥& '
$num
≥≥( )
;
≥≥) *
}
¥¥ 
pk
∂∂ 
=
∂∂ 
pk
∂∂ 
.
∂∂ 
TrimEnd
∂∂ 
(
∂∂ 
new
∂∂ 
char
∂∂  $
[
∂∂$ %
]
∂∂% &
{
∂∂' (
$char
∂∂) ,
,
∂∂, -
$char
∂∂. 1
,
∂∂1 2
$char
∂∂3 7
}
∂∂8 9
)
∂∂9 :
+
∂∂; <
$str
∂∂= B
;
∂∂B C
if
∑∑ 
(
∑∑ 
hasKeys
∑∑ 
)
∑∑ 
{
∏∏ 
sql
ππ 
+=
ππ 
pk
ππ 
;
ππ 
}
∫∫ 
sql
ºº 
+=
ºº 
$str
ºº 
;
ºº 
return
ææ 
sql
ææ 
;
ææ 
}
øø 	
public
¡¡ 
static
¡¡ 
string
¡¡ '
GetCreateFromDataTableSQL
¡¡ 6
(
¡¡6 7
string
¡¡7 =

schemaName
¡¡> H
,
¡¡H I
string
¡¡J P
	tableName
¡¡Q Z
,
¡¡Z [
	DataTable
¡¡\ e
table
¡¡f k
)
¡¡k l
{
¬¬ 	
string
√√ 
sql
√√ 
=
√√ 
string
√√ 
.
√√  
Empty
√√  %
;
√√% &
if
ƒƒ 
(
ƒƒ 
table
ƒƒ 
!=
ƒƒ 
null
ƒƒ 
)
ƒƒ 
{
≈≈ 
sql
∆∆ 
=
∆∆ 
$str
∆∆ a
+
∆∆b c

schemaName
∆∆d n
+
∆∆o p
$str
∆∆q v
+
∆∆w x
	tableName∆∆y Ç
+∆∆É Ñ
$str∆∆Ö ö
+∆∆õ ú

schemaName∆∆ù ß
+∆∆® ©
$str∆∆™ Ø
+∆∆∞ ±
	tableName∆∆≤ ª
+∆∆º Ω
$str∆∆æ ≈
;∆∆≈ ∆
foreach
»» 
(
»» 

DataColumn
»» #
column
»»$ *
in
»»+ -
table
»». 3
.
»»3 4
Columns
»»4 ;
)
»»; <
{
…… 
sql
   
+=
   
$str
   
+
    
column
  ! '
.
  ' (

ColumnName
  ( 2
+
  3 4
$str
  5 9
+
  : ;

SQLGetType
  < F
(
  F G
column
  G M
)
  M N
+
  O P
$str
  Q V
;
  V W
}
ÀÀ 
sql
ÕÕ 
=
ÕÕ 
sql
ÕÕ 
.
ÕÕ 
TrimEnd
ÕÕ !
(
ÕÕ! "
new
ÕÕ" %
char
ÕÕ& *
[
ÕÕ* +
]
ÕÕ+ ,
{
ÕÕ- .
$char
ÕÕ/ 2
,
ÕÕ2 3
$char
ÕÕ4 8
}
ÕÕ9 :
)
ÕÕ: ;
+
ÕÕ< =
$str
ÕÕ> B
;
ÕÕB C
sql
€€ 
=
€€ 
sql
€€ 
.
€€ 
TrimEnd
€€ !
(
€€! "
new
€€" %
char
€€& *
[
€€* +
]
€€+ ,
{
€€- .
$char
€€/ 2
}
€€3 4
)
€€4 5
+
€€6 7
$str
€€8 =
;
€€= >
}
›› 
return
ﬂﬂ 
sql
ﬂﬂ 
;
ﬂﬂ 
}
‡‡ 	
public
‚‚ 
static
‚‚ 
string
‚‚ 
[
‚‚ 
]
‚‚ 
GetPrimaryKeys
‚‚ -
(
‚‚- .
	DataTable
‚‚. 7
schema
‚‚8 >
)
‚‚> ?
{
„„ 	
List
‰‰ 
<
‰‰ 
string
‰‰ 
>
‰‰ 
keys
‰‰ 
=
‰‰ 
new
‰‰  #
(
‰‰# $
)
‰‰$ %
;
‰‰% &
foreach
ÊÊ 
(
ÊÊ 
DataRow
ÊÊ 
column
ÊÊ #
in
ÊÊ$ &
schema
ÊÊ' -
.
ÊÊ- .
Rows
ÊÊ. 2
)
ÊÊ2 3
{
ÁÁ 
if
ËË 
(
ËË 
schema
ËË 
.
ËË 
Columns
ËË "
.
ËË" #
Contains
ËË# +
(
ËË+ ,
$str
ËË, 3
)
ËË3 4
&&
ËË5 7
(
ËË8 9
bool
ËË9 =
)
ËË= >
column
ËË> D
[
ËËD E
$str
ËËE L
]
ËËL M
)
ËËM N
{
ÈÈ 
keys
ÍÍ 
.
ÍÍ 
Add
ÍÍ 
(
ÍÍ 
column
ÍÍ #
[
ÍÍ# $
$str
ÍÍ$ 0
]
ÍÍ0 1
.
ÍÍ1 2
ToString
ÍÍ2 :
(
ÍÍ: ;
)
ÍÍ; <
)
ÍÍ< =
;
ÍÍ= >
}
ÎÎ 
}
ÏÏ 
return
ÓÓ 
keys
ÓÓ 
.
ÓÓ 
ToArray
ÓÓ 
(
ÓÓ  
)
ÓÓ  !
;
ÓÓ! "
}
ÔÔ 	
public
ÚÚ 
static
ÚÚ 
string
ÚÚ 

SQLGetType
ÚÚ '
(
ÚÚ' (
object
ÚÚ( .
type
ÚÚ/ 3
,
ÚÚ3 4
int
ÚÚ5 8

columnSize
ÚÚ9 C
,
ÚÚC D
int
ÚÚE H
numericPrecision
ÚÚI Y
,
ÚÚY Z
int
ÚÚ[ ^
numericScale
ÚÚ_ k
)
ÚÚk l
{
ÛÛ 	
switch
ÙÙ 
(
ÙÙ 
type
ÙÙ 
.
ÙÙ 
ToString
ÙÙ !
(
ÙÙ! "
)
ÙÙ" #
)
ÙÙ# $
{
ıı 
case
ˆˆ 
$str
ˆˆ $
:
ˆˆ$ %
return
˜˜ 
$str
˜˜ %
+
˜˜& '
(
˜˜( )
(
˜˜) *

columnSize
˜˜* 4
==
˜˜5 7
-
˜˜8 9
$num
˜˜9 :
)
˜˜: ;
?
˜˜< =
$str
˜˜> C
:
˜˜D E

columnSize
˜˜F P
.
˜˜P Q
ToString
˜˜Q Y
(
˜˜Y Z
)
˜˜Z [
)
˜˜[ \
+
˜˜] ^
$str
˜˜_ b
;
˜˜b c
case
˘˘ 
$str
˘˘ %
:
˘˘% &
if
˙˙ 
(
˙˙ 
numericScale
˙˙ $
>
˙˙% &
$num
˙˙' (
)
˙˙( )
{
˚˚ 
return
¸¸ 
$str
¸¸ %
;
¸¸% &
}
˝˝ 
else
˛˛ 
if
˛˛ 
(
˛˛ 
numericPrecision
˛˛ -
>
˛˛. /
$num
˛˛0 2
)
˛˛2 3
{
ˇˇ 
return
ÄÄ 
$str
ÄÄ '
;
ÄÄ' (
}
ÅÅ 
else
ÇÇ 
{
ÉÉ 
return
ÑÑ 
$str
ÑÑ $
;
ÑÑ$ %
}
ÖÖ 
case
áá 
$str
áá $
:
áá$ %
case
àà 
$str
àà $
:
àà$ %
return
ââ 
$str
ââ !
;
ââ! "
case
ãã 
$str
ãã #
:
ãã# $
return
åå 
$str
åå #
;
åå# $
case
éé 
$str
éé #
:
éé# $
case
èè 
$str
èè #
:
èè# $
return
êê 
$str
êê  
;
êê  !
case
íí 
$str
íí &
:
íí& '
return
ìì 
$str
ìì %
;
ìì% &
default
ïï 
:
ïï 
throw
ññ 
new
ññ 
	Exception
ññ '
(
ññ' (
type
ññ( ,
.
ññ, -
ToString
ññ- 5
(
ññ5 6
)
ññ6 7
+
ññ8 9
$str
ññ: M
)
ññM N
;
ññN O
}
óó 
}
òò 	
public
õõ 
static
õõ 
string
õõ 

SQLGetType
õõ '
(
õõ' (
DataRow
õõ( /
	schemaRow
õõ0 9
)
õõ9 :
{
úú 	
return
ùù 

SQLGetType
ùù 
(
ùù 
	schemaRow
ùù '
[
ùù' (
$str
ùù( 2
]
ùù2 3
,
ùù3 4
int
ûû  #
.
ûû# $
Parse
ûû$ )
(
ûû) *
	schemaRow
ûû* 3
[
ûû3 4
$str
ûû4 @
]
ûû@ A
.
ûûA B
ToString
ûûB J
(
ûûJ K
)
ûûK L
)
ûûL M
,
ûûM N
int
üü  #
.
üü# $
Parse
üü$ )
(
üü) *
	schemaRow
üü* 3
[
üü3 4
$str
üü4 F
]
üüF G
.
üüG H
ToString
üüH P
(
üüP Q
)
üüQ R
)
üüR S
,
üüS T
int
††  #
.
††# $
Parse
††$ )
(
††) *
	schemaRow
††* 3
[
††3 4
$str
††4 B
]
††B C
.
††C D
ToString
††D L
(
††L M
)
††M N
)
††N O
)
††O P
;
††P Q
}
°° 	
public
§§ 
static
§§ 
string
§§ 

SQLGetType
§§ '
(
§§' (

DataColumn
§§( 2
column
§§3 9
)
§§9 :
{
•• 	
return
¶¶ 

SQLGetType
¶¶ 
(
¶¶ 
column
¶¶ $
.
¶¶$ %
DataType
¶¶% -
,
¶¶- .
column
¶¶/ 5
.
¶¶5 6
	MaxLength
¶¶6 ?
,
¶¶? @
$num
¶¶A C
,
¶¶C D
$num
¶¶E F
)
¶¶F G
;
¶¶G H
}
ßß 	
}
®® 
}©© 