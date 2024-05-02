Õ2
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\4-Infrastructure\Dapper\Phoenix.Infrastructure.Dapper\BaseRepository.cs
	namespace 	
Phoenix
 
. 
Infrastructure  
.  !
Dapper! '
{ 
public		 

class		 
BaseRepository		 
:		  !
IDisposable		" -
,		- .
IBaseRepository		/ >
{

 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly 
string 
_connectionString  1
;1 2
public 
BaseRepository 
( 
IConfiguration ,
configuration- :
): ;
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
_connectionString 
= #
PrepareConnectionString  7
(7 8
)8 9
;9 :
} 	
private 
string #
PrepareConnectionString .
(. /
)/ 0
{ 	
string 
conn1 
= 
string !
.! "
Empty" '
;' (
string 
conn2 
= 
string !
.! "
Empty" '
;' (
string 
userName 
= 
string $
.$ %
Empty% *
;* +
string 
password 
= 
string $
.$ %
Empty% *
;* +
string 
serviceName 
=  
string! '
.' (
Empty( -
;- .
List 
< 
OracleSettings 
>  
settings! )
=* +
OracleSettings, :
.: ;
Current; B
.B C
SettingsC K
;K L
if 
( 
settings 
!= 
null  
)  !
{ 
if 
( 
settings 
. 
Count "
>=# %
$num& '
)' (
{ 
conn1 
= 
OracleSettings *
.* +
Current+ 2
.2 3
Settings3 ;
[; <
$num< =
]= >
.> ?
ConnectionString? O
;O P
conn2   
=   
OracleSettings   *
.  * +
Current  + 2
.  2 3
Settings  3 ;
[  ; <
$num  < =
]  = >
.  > ?
ConnectionString  ? O
;  O P
userName!! 
=!! 
OracleSettings!! -
.!!- .
Current!!. 5
.!!5 6
Settings!!6 >
[!!> ?
$num!!? @
]!!@ A
.!!A B
Username!!B J
;!!J K
password"" 
="" 
OracleSettings"" -
.""- .
Current"". 5
.""5 6
Settings""6 >
[""> ?
$num""? @
]""@ A
.""A B
Password""B J
;""J K
serviceName## 
=##  !
OracleSettings##" 0
.##0 1
Current##1 8
.##8 9
Settings##9 A
[##A B
$num##B C
]##C D
.##D E
Database##E M
;##M N
}%% 
else&& 
if&& 
(&& 
settings&& !
.&&! "
Count&&" '
==&&( *
$num&&+ ,
)&&, -
{'' 
conn1(( 
=(( 
OracleSettings(( *
.((* +
Current((+ 2
.((2 3
Settings((3 ;
[((; <
$num((< =
]((= >
.((> ?
ConnectionString((? O
;((O P
conn2)) 
=)) 
string)) "
.))" #
Empty))# (
;))( )
userName** 
=** 
OracleSettings** -
.**- .
Current**. 5
.**5 6
Settings**6 >
[**> ?
$num**? @
]**@ A
.**A B
Username**B J
;**J K
password++ 
=++ 
OracleSettings++ -
.++- .
Current++. 5
.++5 6
Settings++6 >
[++> ?
$num++? @
]++@ A
.++A B
Password++B J
;++J K
serviceName,, 
=,,  !
OracleSettings,," 0
.,,0 1
Current,,1 8
.,,8 9
Settings,,9 A
[,,A B
$num,,B C
],,C D
.,,D E
Database,,E M
;,,M N
}-- 
}.. 
string// 
connectionString// #
=//$ %
$str	//& ¶
;
//¶ ·
connectionString00 
=00 
string00 %
.00% &
Format00& ,
(00, -
connectionString00- =
,00= >
conn100? D
,00D E
conn200F K
,00K L
userName00M U
,00U V
password00W _
,00_ `
serviceName00a l
)00l m
;00m n
return11 
connectionString11 #
;11# $
}33 	
public55 
async55 
Task55 
<55 
IDbConnection55 '
>55' (
CreateConnection55) 9
(559 :
DbSchema55: B
schema55C I
)55I J
{66 	
IDbConnection88 
con88 
=88 
null88  $
;88$ %
con:: 
=:: 
new:: 
OracleConnection:: &
(::& '
_connectionString::' 8
)::8 9
;::9 :
ifCC 
(CC 
conCC 
.CC 
StateCC 
==CC 
ConnectionStateCC ,
.CC, -
ClosedCC- 3
)CC3 4
conCC5 8
.CC8 9
OpenCC9 =
(CC= >
)CC> ?
;CC? @
returnDD 
conDD 
;DD 
}EE 	
publicFF 
objectFF #
LoggedInUserInformationFF -
{GG 	
getHH 
{II 
returnUU 
nullUU 
;UU 
}WW 
}XX 	
public[[ 
void[[ 
Dispose[[ 
([[ 
)[[ 
{\\ 	
}]] 	
}^^ 
}__ õ
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\4-Infrastructure\Dapper\Phoenix.Infrastructure.Dapper\IBaseRepository.cs
	namespace 	
Phoenix
 
. 
Infrastructure  
.  !
Dapper! '
{ 
public 

	interface 
IBaseRepository $
{ 
}
¼¼ 
}½½ 