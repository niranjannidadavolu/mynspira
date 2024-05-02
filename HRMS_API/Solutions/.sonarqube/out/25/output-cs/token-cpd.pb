∏∑
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.DependencyInjection\DependencyInjector.cs
	namespaceii 	
Phonixii
 
.ii 
CrossCuttingii 
.ii 
DependencyInjectionii 1
{jj 
publickk 

statickk 
classkk 
DependencyInjectorkk *
{ll 
privatemm 
staticmm 
IServiceProvidermm '
ServiceProvidermm( 7
{mm8 9
getmm: =
;mm= >
setmm? B
;mmB C
}mmD E
privateoo 
staticoo 
IServiceCollectionoo )
Servicesoo* 2
{oo3 4
getoo5 8
;oo8 9
setoo: =
;oo= >
}oo? @
publicqq 
staticqq 
Tqq 

GetServiceqq "
<qq" #
Tqq# $
>qq$ %
(qq% &
)qq& '
{rr 	
Servicesss 
??=ss 
RegisterServicesss )
(ss) *
)ss* +
;ss+ ,
ServiceProvidertt 
??=tt 
Servicestt  (
.tt( ) 
BuildServiceProvidertt) =
(tt= >
)tt> ?
;tt? @
returnuu 
ServiceProvideruu "
.uu" #

GetServiceuu# -
<uu- .
Tuu. /
>uu/ 0
(uu0 1
)uu1 2
;uu2 3
}vv 	
publicxx 
staticxx 
IServiceCollectionxx (
RegisterServicesxx) 9
(xx9 :
)xx: ;
{yy 	
returnzz 
RegisterServiceszz #
(zz# $
newzz$ '
ServiceCollectionzz( 9
(zz9 :
)zz: ;
)zz; <
;zz< =
}{{ 	
public}} 
static}} 
IServiceCollection}} (
RegisterServices}}) 9
(}}9 :
IServiceCollection}}: L
services}}M U
)}}U V
{~~ 	
Services 
= 
services 
;  
Services
ÄÄ 
=
ÄÄ "
RegisterApplications
ÄÄ +
(
ÄÄ+ ,
Services
ÄÄ, 4
)
ÄÄ4 5
;
ÄÄ5 6
Services
ÇÇ 
=
ÇÇ #
RegisterCrossCuttings
ÇÇ ,
(
ÇÇ, -
Services
ÇÇ- 5
)
ÇÇ5 6
;
ÇÇ6 7
Services
ÑÑ 
=
ÑÑ 
RegisterDomains
ÑÑ &
(
ÑÑ& '
Services
ÑÑ' /
)
ÑÑ/ 0
;
ÑÑ0 1
Services
ÜÜ 
=
ÜÜ #
RegisterDapperContext
ÜÜ ,
(
ÜÜ, -
Services
ÜÜ- 5
)
ÜÜ5 6
;
ÜÜ6 7
return
àà 
Services
àà 
;
àà 
}
ââ 	
private
ãã 
static
ãã  
IServiceCollection
ãã )#
RegisterDapperContext
ãã* ?
(
ãã? @ 
IServiceCollection
ãã@ R
services
ããS [
)
ãã[ \
{
åå 	
Services
çç 
=
çç 
services
çç 
;
çç  
return
èè 
Services
èè 
;
èè 
}
êê 	
private
íí 
static
íí  
IServiceCollection
íí )"
RegisterApplications
íí* >
(
íí> ? 
IServiceCollection
íí? Q
services
ííR Z
)
ííZ [
{
ìì 	
Services
îî 
=
îî 
services
îî 
;
îî  
Services
ïï 
.
ïï 
	AddScoped
ïï 
<
ïï (
IAuthenticationApplication
ïï 9
,
ïï9 :'
AuthenticationApplication
ïï; T
>
ïïT U
(
ïïU V
)
ïïV W
;
ïïW X
Services
ññ 
.
ññ 
	AddScoped
ññ 
<
ññ $
IInvestmentApplication
ññ 5
,
ññ5 6#
InvestmentApplication
ññ7 L
>
ññL M
(
ññM N
)
ññN O
;
ññO P
Services
óó 
.
óó 
	AddScoped
óó 
<
óó  
IStatesApplication
óó 1
,
óó1 2
StatesApplication
óó3 D
>
óóD E
(
óóE F
)
óóF G
;
óóG H
Services
òò 
.
òò 
	AddScoped
òò 
<
òò #
IDistrictsApplication
òò 4
,
òò4 5"
DistrictsApplication
òò6 J
>
òòJ K
(
òòK L
)
òòL M
;
òòM N
Services
ôô 
.
ôô 
	AddScoped
ôô 
<
ôô !
IMandalsApplication
ôô 2
,
ôô2 3 
MandalsApplication
ôô4 F
>
ôôF G
(
ôôG H
)
ôôH I
;
ôôI J
Services
öö 
.
öö 
	AddScoped
öö 
<
öö -
IEmployeeInformationApplication
öö >
,
öö> ?,
EmployeeInformationApplication
öö@ ^
>
öö^ _
(
öö_ `
)
öö` a
;
ööa b
Services
õõ 
.
õõ 
	AddScoped
õõ 
<
õõ '
IReimbursementApplication
õõ 8
,
õõ8 9&
ReimbursementApplication
õõ: R
>
õõR S
(
õõS T
)
õõT U
;
õõU V
Services
úú 
.
úú 
	AddScoped
úú 
<
úú )
IUserInformationApplication
úú :
,
úú: ;(
UserInformationApplication
úú< V
>
úúV W
(
úúW X
)
úúX Y
;
úúY Z
Services
ùù 
.
ùù 
	AddScoped
ùù 
<
ùù  
IForm16Application
ùù 1
,
ùù1 2
Form16Application
ùù3 D
>
ùùD E
(
ùùE F
)
ùùF G
;
ùùG H
Services
ûû 
.
ûû 
	AddScoped
ûû 
<
ûû "
IPayslipsApplication
ûû 3
,
ûû3 4!
PayslipsApplication
ûû5 H
>
ûûH I
(
ûûI J
)
ûûJ K
;
ûûK L
Services
üü 
.
üü 
	AddScoped
üü 
<
üü '
IHelpDocumentsApplication
üü 8
,
üü8 9&
HelpDocumentsApplication
üü: R
>
üüR S
(
üüS T
)
üüT U
;
üüU V
Services
†† 
.
†† 
	AddScoped
†† 
<
†† )
IRoleInformationApplication
†† :
,
††: ;(
RoleInformationApplication
††< V
>
††V W
(
††W X
)
††X Y
;
††Y Z
Services
°° 
.
°° 
	AddScoped
°° 
<
°° "
ICarLeaseApplication
°° 3
,
°°3 4!
CarLeaseApplication
°°5 H
>
°°H I
(
°°I J
)
°°J K
;
°°K L
Services
¢¢ 
.
¢¢ 
	AddScoped
¢¢ 
<
¢¢ +
IModuleInformationApplication
¢¢ <
,
¢¢< =*
ModuleInformationApplication
¢¢> Z
>
¢¢Z [
(
¢¢[ \
)
¢¢\ ]
;
¢¢] ^
Services
££ 
.
££ 
	AddScoped
££ 
<
££ (
ISecurityModuleApplication
££ 9
,
££9 :'
SecurityModuleApplication
££; T
>
££T U
(
££U V
)
££V W
;
££W X
Services
§§ 
.
§§ 
	AddScoped
§§ 
<
§§ *
IInvestmentProofsApplication
§§ ;
,
§§; <)
InvestmentProofsApplication
§§= X
>
§§X Y
(
§§Y Z
)
§§Z [
;
§§[ \
Services
•• 
.
•• 
	AddScoped
•• 
<
•• )
ILeaveManagementApplication
•• :
,
••: ;(
LeaveManagementApplication
••< V
>
••V W
(
••W X
)
••X Y
;
••Y Z
Services
¶¶ 
.
¶¶ 
AddSingleton
¶¶ !
<
¶¶! "&
INotificationApplication
¶¶" :
,
¶¶: ;%
NotificationApplication
¶¶< S
>
¶¶S T
(
¶¶T U
)
¶¶U V
;
¶¶V W
Services
ßß 
.
ßß 
AddSingleton
ßß !
<
ßß! "*
ISiteNotificationApplication
ßß" >
,
ßß> ?)
SiteNotificationApplication
ßß@ [
>
ßß[ \
(
ßß\ ]
)
ßß] ^
;
ßß^ _
Services
®® 
.
®® 
	AddScoped
®® 
<
®® #
ILeaveTypeApplication
®® 4
,
®®4 5"
LeaveTypeApplication
®®6 J
>
®®J K
(
®®K L
)
®®L M
;
®®M N
Services
©© 
.
©© 
	AddScoped
©© 
<
©© .
 IAttendanceReportTypeApplication
©© ?
,
©©? @-
AttendanceReportTypeApplication
©©A `
>
©©` a
(
©©a b
)
©©b c
;
©©c d
Services
™™ 
.
™™ 
	AddScoped
™™ 
<
™™ &
ILeaveDayTypeApplication
™™ 7
,
™™7 8%
LeaveDayTypeApplication
™™9 P
>
™™P Q
(
™™Q R
)
™™R S
;
™™S T
Services
´´ 
.
´´ 
	AddScoped
´´ 
<
´´ %
ILeaveStatusApplication
´´ 6
,
´´6 7$
LeaveStatusApplication
´´8 N
>
´´N O
(
´´O P
)
´´P Q
;
´´Q R
Services
¨¨ 
.
¨¨ 
	AddScoped
¨¨ 
<
¨¨ *
ILeaveInformationApplication
¨¨ ;
,
¨¨; <)
LeaveInformationApplication
¨¨= X
>
¨¨X Y
(
¨¨Y Z
)
¨¨Z [
;
¨¨[ \
Services
≠≠ 
.
≠≠ 
	AddScoped
≠≠ 
<
≠≠ 0
"ILeavePolicyInformationApplication
≠≠ A
,
≠≠A B/
!LeavePolicyInformationApplication
≠≠C d
>
≠≠d e
(
≠≠e f
)
≠≠f g
;
≠≠g h
Services
ÆÆ 
.
ÆÆ 
AddSingleton
ÆÆ !
<
ÆÆ! "+
ILeaveAutoApprovalApplication
ÆÆ" ?
,
ÆÆ? @%
AutoApprovalApplication
ÆÆA X
>
ÆÆX Y
(
ÆÆY Z
)
ÆÆZ [
;
ÆÆ[ \
Services
ØØ 
.
ØØ 
AddSingleton
ØØ !
<
ØØ! "#
ISendEmailApplication
ØØ" 7
,
ØØ7 8"
SendEmailApplication
ØØ9 M
>
ØØM N
(
ØØN O
)
ØØO P
;
ØØP Q
Services
∞∞ 
.
∞∞ 
	AddScoped
∞∞ 
<
∞∞ #
ITimeSheetApplication
∞∞ 4
,
∞∞4 5"
TimeSheetApplication
∞∞6 J
>
∞∞J K
(
∞∞K L
)
∞∞L M
;
∞∞M N
Services
±± 
.
±± 
	AddScoped
±± 
<
±± ,
INslEmployeeProfileApplication
±± =
,
±±= >+
NslEmployeeProfileApplication
±±? \
>
±±\ ]
(
±±] ^
)
±±^ _
;
±±_ `
Services
≤≤ 
.
≤≤ 
	AddScoped
≤≤ 
<
≤≤  
IBranchApplication
≤≤ 1
,
≤≤1 2
BranchApplication
≤≤3 D
>
≤≤D E
(
≤≤E F
)
≤≤F G
;
≤≤G H
Services
≥≥ 
.
≥≥ 
	AddScoped
≥≥ 
<
≥≥ !
IReportsApplication
≥≥ 2
,
≥≥2 3 
ReportsApplication
≥≥4 F
>
≥≥F G
(
≥≥G H
)
≥≥H I
;
≥≥I J
Services
¥¥ 
.
¥¥ 
	AddScoped
¥¥ 
<
¥¥ *
ILeaveEntitlementApplication
¥¥ ;
,
¥¥; <)
LeaveEntitlementApplication
¥¥= X
>
¥¥X Y
(
¥¥Y Z
)
¥¥Z [
;
¥¥[ \
Services
µµ 
.
µµ 
AddSingleton
µµ !
<
µµ! "*
IResignedEmployeeApplication
µµ" >
,
µµ> ?)
ResignedEmployeeApplication
µµ@ [
>
µµ[ \
(
µµ\ ]
)
µµ] ^
;
µµ^ _
Services
∂∂ 
.
∂∂ 
	AddScoped
∂∂ 
<
∂∂ )
ILeaveEncashmentApplication
∂∂ :
,
∂∂: ;(
LeaveEncashmentApplication
∂∂< V
>
∂∂V W
(
∂∂W X
)
∂∂X Y
;
∂∂Y Z
Services
∑∑ 
.
∑∑ 
	AddScoped
∑∑ 
<
∑∑ .
 IEmployeeVerificationApplication
∑∑ ?
,
∑∑? @-
EmployeeVerificationApplication
∑∑A `
>
∑∑` a
(
∑∑a b
)
∑∑b c
;
∑∑c d
Services
∏∏ 
.
∏∏ 
AddSingleton
∏∏ !
<
∏∏! "+
IAppointmentLetterApplication
∏∏" ?
,
∏∏? @*
AppointmentLetterApplication
∏∏A ]
>
∏∏] ^
(
∏∏^ _
)
∏∏_ `
;
∏∏` a
Services
ªª 
.
ªª 
AddSingleton
ªª !
<
ªª! "%
IVistorCountApplication
ªª" 9
,
ªª9 :$
VistorCountApplication
ªª; Q
>
ªªQ R
(
ªªR S
)
ªªS T
;
ªªT U
return
ΩΩ 
Services
ΩΩ 
;
ΩΩ 
}
ææ 	
private
¿¿ 
static
¿¿  
IServiceCollection
¿¿ )#
RegisterCrossCuttings
¿¿* ?
(
¿¿? @ 
IServiceCollection
¿¿@ R
services
¿¿S [
)
¿¿[ \
{
¡¡ 	
Services
¬¬ 
=
¬¬ 
services
¬¬ 
;
¬¬  
Services
√√ 
.
√√ 
	AddScoped
√√ 
<
√√ 
ICryptography
√√ ,
,
√√, -
Cryptography
√√. :
>
√√: ;
(
√√; <
)
√√< =
;
√√= >
Services
ƒƒ 
.
ƒƒ 
	AddScoped
ƒƒ 
<
ƒƒ 
IHash
ƒƒ $
,
ƒƒ$ %
Hash
ƒƒ& *
>
ƒƒ* +
(
ƒƒ+ ,
)
ƒƒ, -
;
ƒƒ- .
Services
≈≈ 
.
≈≈ 
	AddScoped
≈≈ 
<
≈≈ 
IJsonWebToken
≈≈ ,
,
≈≈, -
JsonWebToken
≈≈. :
>
≈≈: ;
(
≈≈; <
)
≈≈< =
;
≈≈= >
Services
∆∆ 
.
∆∆ 
AddSingleton
∆∆ !
<
∆∆! "
ILoggerManager
∆∆" 0
,
∆∆0 1
LoggerManager
∆∆2 ?
>
∆∆? @
(
∆∆@ A
)
∆∆A B
;
∆∆B C
Services
«« 
.
«« 
AddSingleton
«« !
<
««! "
IJwtAuthManager
««" 1
,
««1 2
JwtAuthManager
««3 A
>
««A B
(
««B C
)
««C D
;
««D E
return
»» 
Services
»» 
;
»» 
}
…… 	
private
ÀÀ 
static
ÀÀ  
IServiceCollection
ÀÀ )
RegisterDomains
ÀÀ* 9
(
ÀÀ9 : 
IServiceCollection
ÀÀ: L
services
ÀÀM U
)
ÀÀU V
{
ÃÃ 	
Services
ÕÕ 
=
ÕÕ 
services
ÕÕ 
;
ÕÕ  
Services
ŒŒ 
.
ŒŒ 
	AddScoped
ŒŒ 
<
ŒŒ #
IAuthenticationDomain
ŒŒ 4
,
ŒŒ4 5"
AuthenticationDomain
ŒŒ6 J
>
ŒŒJ K
(
ŒŒK L
)
ŒŒL M
;
ŒŒM N
Services
œœ 
.
œœ 
	AddScoped
œœ 
<
œœ 
IInvestmentDomain
œœ 0
,
œœ0 1
InvestmentDomain
œœ2 B
>
œœB C
(
œœC D
)
œœD E
;
œœE F
Services
–– 
.
–– 
	AddScoped
–– 
<
–– 
IStatesDomain
–– ,
,
––, -
StatesDomain
––. :
>
––: ;
(
––; <
)
––< =
;
––= >
Services
—— 
.
—— 
	AddScoped
—— 
<
—— 
IDistrictsDomain
—— /
,
——/ 0
DistrictsDomain
——1 @
>
——@ A
(
——A B
)
——B C
;
——C D
Services
““ 
.
““ 
	AddScoped
““ 
<
““ 
IMandalsDomain
““ -
,
““- .
MandalsDomain
““/ <
>
““< =
(
““= >
)
““> ?
;
““? @
Services
”” 
.
”” 
	AddScoped
”” 
<
”” (
IEmployeeInformationDomain
”” 9
,
””9 :'
EmployeeInformationDomain
””; T
>
””T U
(
””U V
)
””V W
;
””W X
Services
‘‘ 
.
‘‘ 
	AddScoped
‘‘ 
<
‘‘ "
IReimbursementDomain
‘‘ 3
,
‘‘3 4!
ReimbursementDomain
‘‘5 H
>
‘‘H I
(
‘‘I J
)
‘‘J K
;
‘‘K L
Services
’’ 
.
’’ 
	AddScoped
’’ 
<
’’ $
IUserInformationDomain
’’ 5
,
’’5 6#
UserInformationDomain
’’7 L
>
’’L M
(
’’M N
)
’’N O
;
’’O P
Services
÷÷ 
.
÷÷ 
	AddScoped
÷÷ 
<
÷÷ 
IPayslipsDomain
÷÷ .
,
÷÷. /
PayslipsDomain
÷÷0 >
>
÷÷> ?
(
÷÷? @
)
÷÷@ A
;
÷÷A B
Services
◊◊ 
.
◊◊ 
	AddScoped
◊◊ 
<
◊◊ 
IForm16Domain
◊◊ ,
,
◊◊, -
Form16Domain
◊◊. :
>
◊◊: ;
(
◊◊; <
)
◊◊< =
;
◊◊= >
Services
ÿÿ 
.
ÿÿ 
	AddScoped
ÿÿ 
<
ÿÿ "
IHelpDocumentsDomain
ÿÿ 3
,
ÿÿ3 4!
HelpDocumentsDomain
ÿÿ5 H
>
ÿÿH I
(
ÿÿI J
)
ÿÿJ K
;
ÿÿK L
Services
ŸŸ 
.
ŸŸ 
	AddScoped
ŸŸ 
<
ŸŸ $
IRoleInformationDomain
ŸŸ 5
,
ŸŸ5 6#
RoleInformationDomain
ŸŸ7 L
>
ŸŸL M
(
ŸŸM N
)
ŸŸN O
;
ŸŸO P
Services
⁄⁄ 
.
⁄⁄ 
	AddScoped
⁄⁄ 
<
⁄⁄ 
ICarLeaseDomain
⁄⁄ .
,
⁄⁄. /
CarLeaseDomain
⁄⁄0 >
>
⁄⁄> ?
(
⁄⁄? @
)
⁄⁄@ A
;
⁄⁄A B
Services
€€ 
.
€€ 
	AddScoped
€€ 
<
€€ &
IModuleInformationDomain
€€ 7
,
€€7 8%
ModuleInformationDomain
€€9 P
>
€€P Q
(
€€Q R
)
€€R S
;
€€S T
Services
‹‹ 
.
‹‹ 
	AddScoped
‹‹ 
<
‹‹ #
ISecurityModuleDomain
‹‹ 4
,
‹‹4 5"
SecurityModuleDomain
‹‹6 J
>
‹‹J K
(
‹‹K L
)
‹‹L M
;
‹‹M N
Services
›› 
.
›› 
	AddScoped
›› 
<
›› %
IInvestmentProofsDomain
›› 6
,
››6 7$
InvestmentProofsDomain
››8 N
>
››N O
(
››O P
)
››P Q
;
››Q R
Services
ﬁﬁ 
.
ﬁﬁ 
	AddScoped
ﬁﬁ 
<
ﬁﬁ $
ILeaveManagementDomain
ﬁﬁ 5
,
ﬁﬁ5 6#
LeaveManagementDomain
ﬁﬁ7 L
>
ﬁﬁL M
(
ﬁﬁM N
)
ﬁﬁN O
;
ﬁﬁO P
Services
ﬂﬂ 
.
ﬂﬂ 
AddSingleton
ﬂﬂ !
<
ﬂﬂ! "!
INotificationDomain
ﬂﬂ" 5
,
ﬂﬂ5 6 
NotificationDomain
ﬂﬂ7 I
>
ﬂﬂI J
(
ﬂﬂJ K
)
ﬂﬂK L
;
ﬂﬂL M
Services
‡‡ 
.
‡‡ 
AddSingleton
‡‡ !
<
‡‡! "%
ISiteNotificationDomain
‡‡" 9
,
‡‡9 :$
SiteNotificationDomain
‡‡; Q
>
‡‡Q R
(
‡‡R S
)
‡‡S T
;
‡‡T U
Services
·· 
.
·· 
	AddScoped
·· 
<
·· 
ILeaveTypeDomain
·· /
,
··/ 0
LeaveTypeDomain
··1 @
>
··@ A
(
··A B
)
··B C
;
··C D
Services
‚‚ 
.
‚‚ 
	AddScoped
‚‚ 
<
‚‚ )
IAttendanceReportTypeDomain
‚‚ :
,
‚‚: ;(
AttendanceReportTypeDomain
‚‚< V
>
‚‚V W
(
‚‚W X
)
‚‚X Y
;
‚‚Y Z
Services
„„ 
.
„„ 
	AddScoped
„„ 
<
„„ !
ILeaveDayTypeDomain
„„ 2
,
„„2 3 
LeaveDayTypeDomain
„„4 F
>
„„F G
(
„„G H
)
„„H I
;
„„I J
Services
‰‰ 
.
‰‰ 
	AddScoped
‰‰ 
<
‰‰  
ILeaveStatusDomain
‰‰ 1
,
‰‰1 2
LeaveStatusDomain
‰‰3 D
>
‰‰D E
(
‰‰E F
)
‰‰F G
;
‰‰G H
Services
ÂÂ 
.
ÂÂ 
	AddScoped
ÂÂ 
<
ÂÂ %
ILeaveInformationDomain
ÂÂ 6
,
ÂÂ6 7$
LeaveInformationDomain
ÂÂ8 N
>
ÂÂN O
(
ÂÂO P
)
ÂÂP Q
;
ÂÂQ R
Services
ÊÊ 
.
ÊÊ 
	AddScoped
ÊÊ 
<
ÊÊ +
ILeavePolicyInformationDomain
ÊÊ <
,
ÊÊ< =*
LeavePolicyInformationDomain
ÊÊ> Z
>
ÊÊZ [
(
ÊÊ[ \
)
ÊÊ\ ]
;
ÊÊ] ^
Services
ÁÁ 
.
ÁÁ 
AddSingleton
ÁÁ !
<
ÁÁ! "!
IAutoApprovalDomain
ÁÁ" 5
,
ÁÁ5 6 
AutoApprovalDomain
ÁÁ7 I
>
ÁÁI J
(
ÁÁJ K
)
ÁÁK L
;
ÁÁL M
Services
ËË 
.
ËË 
AddSingleton
ËË !
<
ËË! "
ISendEmailDomain
ËË" 2
,
ËË2 3
SendEmailDomain
ËË4 C
>
ËËC D
(
ËËD E
)
ËËE F
;
ËËF G
Services
ÈÈ 
.
ÈÈ 
	AddScoped
ÈÈ 
<
ÈÈ 
ITimeSheetDomain
ÈÈ /
,
ÈÈ/ 0
TimeSheetDomain
ÈÈ1 @
>
ÈÈ@ A
(
ÈÈA B
)
ÈÈB C
;
ÈÈC D
Services
ÍÍ 
.
ÍÍ 
	AddScoped
ÍÍ 
<
ÍÍ '
INslEmployeeProfileDomain
ÍÍ 8
,
ÍÍ8 9&
NslEmployeeProfileDomain
ÍÍ: R
>
ÍÍR S
(
ÍÍS T
)
ÍÍT U
;
ÍÍU V
Services
ÎÎ 
.
ÎÎ 
	AddScoped
ÎÎ 
<
ÎÎ 
IBranchDomain
ÎÎ ,
,
ÎÎ, -
BranchDomain
ÎÎ. :
>
ÎÎ: ;
(
ÎÎ; <
)
ÎÎ< =
;
ÎÎ= >
Services
ÏÏ 
.
ÏÏ 
	AddScoped
ÏÏ 
<
ÏÏ 
IReportsDomain
ÏÏ -
,
ÏÏ- .
ReportsDomain
ÏÏ/ <
>
ÏÏ< =
(
ÏÏ= >
)
ÏÏ> ?
;
ÏÏ? @
Services
ÌÌ 
.
ÌÌ 
	AddScoped
ÌÌ 
<
ÌÌ %
ILeaveEntitlementDomain
ÌÌ 6
,
ÌÌ6 7$
LeaveEntitlementDomain
ÌÌ8 N
>
ÌÌN O
(
ÌÌO P
)
ÌÌP Q
;
ÌÌQ R
Services
ÓÓ 
.
ÓÓ 
AddSingleton
ÓÓ !
<
ÓÓ! "%
IResignedEmployeeDomain
ÓÓ" 9
,
ÓÓ9 :$
ResignedEmployeeDomain
ÓÓ; Q
>
ÓÓQ R
(
ÓÓR S
)
ÓÓS T
;
ÓÓT U
Services
ÔÔ 
.
ÔÔ 
	AddScoped
ÔÔ 
<
ÔÔ $
ILeaveEncashmentDomain
ÔÔ 5
,
ÔÔ5 6#
LeaveEncashmentDomain
ÔÔ7 L
>
ÔÔL M
(
ÔÔM N
)
ÔÔN O
;
ÔÔO P
Services
 
.
 
	AddScoped
 
<
 )
IEmployeeVerificationDomain
 :
,
: ;(
EmployeeVerificationDomain
< V
>
V W
(
W X
)
X Y
;
Y Z
Services
ÒÒ 
.
ÒÒ 
AddSingleton
ÒÒ !
<
ÒÒ! "&
IAppointmentLetterDomain
ÒÒ" :
,
ÒÒ: ;%
AppointmentLetterDomain
ÒÒ< S
>
ÒÒS T
(
ÒÒT U
)
ÒÒU V
;
ÒÒV W
Services
ÛÛ 
.
ÛÛ 
AddSingleton
ÛÛ !
<
ÛÛ! " 
IVistorCountDomain
ÛÛ" 4
,
ÛÛ4 5
VistorCountDomain
ÛÛ6 G
>
ÛÛG H
(
ÛÛH I
)
ÛÛI J
;
ÛÛJ K
return
ÙÙ 
Services
ÙÙ 
;
ÙÙ 
}
ıı 	
}
ˆˆ 
}˜˜ 