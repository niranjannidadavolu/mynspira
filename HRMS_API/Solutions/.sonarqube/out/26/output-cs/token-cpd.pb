Ê
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Session\SessionBuilderExtensions.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Session %
{ 
public 

static 
class $
SessionBuilderExtensions 0
{ 
public		 
static		 
void		 
UseCorsCustom		 (
(		( )
this		) -
IApplicationBuilder		. A
application		B M
)		M N
{

 	
application 
. 
UseCors 
(  
$str  ,
), -
;- .
} 	
public 
static 
void #
UseCustomAuthentication 2
(2 3
this3 7
IApplicationBuilder8 K
applicationL W
)W X
{ 	
application 
. 
UseCors 
(  
cors  $
=>% '
cors( ,
., -
AllowAnyOrigin- ;
(; <
)< =
.= >
AllowAnyMethod> L
(L M
)M N
.N O
AllowAnyHeaderO ]
(] ^
)^ _
._ `
AllowCredentials` p
(p q
)q r
)r s
;s t
} 	
public 
static 
void 
UseExceptionCustom -
(- .
this. 2
IApplicationBuilder3 F
applicationG R
)R S
{ 	
} 	
public 
static 
void 
UseHstsCustom (
(( )
this) -
IApplicationBuilder. A
applicationB M
)M N
{ 	
}"" 	
}## 
}$$ 