��
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
�� 
=
�� "
RegisterApplications
�� +
(
��+ ,
Services
��, 4
)
��4 5
;
��5 6
Services
�� 
=
�� #
RegisterCrossCuttings
�� ,
(
��, -
Services
��- 5
)
��5 6
;
��6 7
Services
�� 
=
�� 
RegisterDomains
�� &
(
��& '
Services
��' /
)
��/ 0
;
��0 1
Services
�� 
=
�� #
RegisterDapperContext
�� ,
(
��, -
Services
��- 5
)
��5 6
;
��6 7
return
�� 
Services
�� 
;
�� 
}
�� 	
private
�� 
static
��  
IServiceCollection
�� )#
RegisterDapperContext
��* ?
(
��? @ 
IServiceCollection
��@ R
services
��S [
)
��[ \
{
�� 	
Services
�� 
=
�� 
services
�� 
;
��  
return
�� 
Services
�� 
;
�� 
}
�� 	
private
�� 
static
��  
IServiceCollection
�� )"
RegisterApplications
��* >
(
��> ? 
IServiceCollection
��? Q
services
��R Z
)
��Z [
{
�� 	
Services
�� 
=
�� 
services
�� 
;
��  
Services
�� 
.
�� 
	AddScoped
�� 
<
�� (
IAuthenticationApplication
�� 9
,
��9 :'
AuthenticationApplication
��; T
>
��T U
(
��U V
)
��V W
;
��W X
Services
�� 
.
�� 
	AddScoped
�� 
<
�� $
IInvestmentApplication
�� 5
,
��5 6#
InvestmentApplication
��7 L
>
��L M
(
��M N
)
��N O
;
��O P
Services
�� 
.
�� 
	AddScoped
�� 
<
��  
IStatesApplication
�� 1
,
��1 2
StatesApplication
��3 D
>
��D E
(
��E F
)
��F G
;
��G H
Services
�� 
.
�� 
	AddScoped
�� 
<
�� #
IDistrictsApplication
�� 4
,
��4 5"
DistrictsApplication
��6 J
>
��J K
(
��K L
)
��L M
;
��M N
Services
�� 
.
�� 
	AddScoped
�� 
<
�� !
IMandalsApplication
�� 2
,
��2 3 
MandalsApplication
��4 F
>
��F G
(
��G H
)
��H I
;
��I J
Services
�� 
.
�� 
	AddScoped
�� 
<
�� -
IEmployeeInformationApplication
�� >
,
��> ?,
EmployeeInformationApplication
��@ ^
>
��^ _
(
��_ `
)
��` a
;
��a b
Services
�� 
.
�� 
	AddScoped
�� 
<
�� '
IReimbursementApplication
�� 8
,
��8 9&
ReimbursementApplication
��: R
>
��R S
(
��S T
)
��T U
;
��U V
Services
�� 
.
�� 
	AddScoped
�� 
<
�� )
IUserInformationApplication
�� :
,
��: ;(
UserInformationApplication
��< V
>
��V W
(
��W X
)
��X Y
;
��Y Z
Services
�� 
.
�� 
	AddScoped
�� 
<
��  
IForm16Application
�� 1
,
��1 2
Form16Application
��3 D
>
��D E
(
��E F
)
��F G
;
��G H
Services
�� 
.
�� 
	AddScoped
�� 
<
�� "
IPayslipsApplication
�� 3
,
��3 4!
PayslipsApplication
��5 H
>
��H I
(
��I J
)
��J K
;
��K L
Services
�� 
.
�� 
	AddScoped
�� 
<
�� '
IHelpDocumentsApplication
�� 8
,
��8 9&
HelpDocumentsApplication
��: R
>
��R S
(
��S T
)
��T U
;
��U V
Services
�� 
.
�� 
	AddScoped
�� 
<
�� )
IRoleInformationApplication
�� :
,
��: ;(
RoleInformationApplication
��< V
>
��V W
(
��W X
)
��X Y
;
��Y Z
Services
�� 
.
�� 
	AddScoped
�� 
<
�� "
ICarLeaseApplication
�� 3
,
��3 4!
CarLeaseApplication
��5 H
>
��H I
(
��I J
)
��J K
;
��K L
Services
�� 
.
�� 
	AddScoped
�� 
<
�� +
IModuleInformationApplication
�� <
,
��< =*
ModuleInformationApplication
��> Z
>
��Z [
(
��[ \
)
��\ ]
;
��] ^
Services
�� 
.
�� 
	AddScoped
�� 
<
�� (
ISecurityModuleApplication
�� 9
,
��9 :'
SecurityModuleApplication
��; T
>
��T U
(
��U V
)
��V W
;
��W X
Services
�� 
.
�� 
	AddScoped
�� 
<
�� *
IInvestmentProofsApplication
�� ;
,
��; <)
InvestmentProofsApplication
��= X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
Services
�� 
.
�� 
	AddScoped
�� 
<
�� )
ILeaveManagementApplication
�� :
,
��: ;(
LeaveManagementApplication
��< V
>
��V W
(
��W X
)
��X Y
;
��Y Z
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "&
INotificationApplication
��" :
,
��: ;%
NotificationApplication
��< S
>
��S T
(
��T U
)
��U V
;
��V W
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "*
ISiteNotificationApplication
��" >
,
��> ?)
SiteNotificationApplication
��@ [
>
��[ \
(
��\ ]
)
��] ^
;
��^ _
Services
�� 
.
�� 
	AddScoped
�� 
<
�� #
ILeaveTypeApplication
�� 4
,
��4 5"
LeaveTypeApplication
��6 J
>
��J K
(
��K L
)
��L M
;
��M N
Services
�� 
.
�� 
	AddScoped
�� 
<
�� .
 IAttendanceReportTypeApplication
�� ?
,
��? @-
AttendanceReportTypeApplication
��A `
>
��` a
(
��a b
)
��b c
;
��c d
Services
�� 
.
�� 
	AddScoped
�� 
<
�� &
ILeaveDayTypeApplication
�� 7
,
��7 8%
LeaveDayTypeApplication
��9 P
>
��P Q
(
��Q R
)
��R S
;
��S T
Services
�� 
.
�� 
	AddScoped
�� 
<
�� %
ILeaveStatusApplication
�� 6
,
��6 7$
LeaveStatusApplication
��8 N
>
��N O
(
��O P
)
��P Q
;
��Q R
Services
�� 
.
�� 
	AddScoped
�� 
<
�� *
ILeaveInformationApplication
�� ;
,
��; <)
LeaveInformationApplication
��= X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 0
"ILeavePolicyInformationApplication
�� A
,
��A B/
!LeavePolicyInformationApplication
��C d
>
��d e
(
��e f
)
��f g
;
��g h
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "+
ILeaveAutoApprovalApplication
��" ?
,
��? @%
AutoApprovalApplication
��A X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "#
ISendEmailApplication
��" 7
,
��7 8"
SendEmailApplication
��9 M
>
��M N
(
��N O
)
��O P
;
��P Q
Services
�� 
.
�� 
	AddScoped
�� 
<
�� #
ITimeSheetApplication
�� 4
,
��4 5"
TimeSheetApplication
��6 J
>
��J K
(
��K L
)
��L M
;
��M N
Services
�� 
.
�� 
	AddScoped
�� 
<
�� ,
INslEmployeeProfileApplication
�� =
,
��= >+
NslEmployeeProfileApplication
��? \
>
��\ ]
(
��] ^
)
��^ _
;
��_ `
Services
�� 
.
�� 
	AddScoped
�� 
<
��  
IBranchApplication
�� 1
,
��1 2
BranchApplication
��3 D
>
��D E
(
��E F
)
��F G
;
��G H
Services
�� 
.
�� 
	AddScoped
�� 
<
�� !
IReportsApplication
�� 2
,
��2 3 
ReportsApplication
��4 F
>
��F G
(
��G H
)
��H I
;
��I J
Services
�� 
.
�� 
	AddScoped
�� 
<
�� *
ILeaveEntitlementApplication
�� ;
,
��; <)
LeaveEntitlementApplication
��= X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "*
IResignedEmployeeApplication
��" >
,
��> ?)
ResignedEmployeeApplication
��@ [
>
��[ \
(
��\ ]
)
��] ^
;
��^ _
Services
�� 
.
�� 
	AddScoped
�� 
<
�� )
ILeaveEncashmentApplication
�� :
,
��: ;(
LeaveEncashmentApplication
��< V
>
��V W
(
��W X
)
��X Y
;
��Y Z
Services
�� 
.
�� 
	AddScoped
�� 
<
�� .
 IEmployeeVerificationApplication
�� ?
,
��? @-
EmployeeVerificationApplication
��A `
>
��` a
(
��a b
)
��b c
;
��c d
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "+
IAppointmentLetterApplication
��" ?
,
��? @*
AppointmentLetterApplication
��A ]
>
��] ^
(
��^ _
)
��_ `
;
��` a
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "%
IVistorCountApplication
��" 9
,
��9 :$
VistorCountApplication
��; Q
>
��Q R
(
��R S
)
��S T
;
��T U
return
�� 
Services
�� 
;
�� 
}
�� 	
private
�� 
static
��  
IServiceCollection
�� )#
RegisterCrossCuttings
��* ?
(
��? @ 
IServiceCollection
��@ R
services
��S [
)
��[ \
{
�� 	
Services
�� 
=
�� 
services
�� 
;
��  
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
ICryptography
�� ,
,
��, -
Cryptography
��. :
>
��: ;
(
��; <
)
��< =
;
��= >
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IHash
�� $
,
��$ %
Hash
��& *
>
��* +
(
��+ ,
)
��, -
;
��- .
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IJsonWebToken
�� ,
,
��, -
JsonWebToken
��. :
>
��: ;
(
��; <
)
��< =
;
��= >
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "
ILoggerManager
��" 0
,
��0 1
LoggerManager
��2 ?
>
��? @
(
��@ A
)
��A B
;
��B C
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "
IJwtAuthManager
��" 1
,
��1 2
JwtAuthManager
��3 A
>
��A B
(
��B C
)
��C D
;
��D E
return
�� 
Services
�� 
;
�� 
}
�� 	
private
�� 
static
��  
IServiceCollection
�� )
RegisterDomains
��* 9
(
��9 : 
IServiceCollection
��: L
services
��M U
)
��U V
{
�� 	
Services
�� 
=
�� 
services
�� 
;
��  
Services
�� 
.
�� 
	AddScoped
�� 
<
�� #
IAuthenticationDomain
�� 4
,
��4 5"
AuthenticationDomain
��6 J
>
��J K
(
��K L
)
��L M
;
��M N
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IInvestmentDomain
�� 0
,
��0 1
InvestmentDomain
��2 B
>
��B C
(
��C D
)
��D E
;
��E F
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IStatesDomain
�� ,
,
��, -
StatesDomain
��. :
>
��: ;
(
��; <
)
��< =
;
��= >
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IDistrictsDomain
�� /
,
��/ 0
DistrictsDomain
��1 @
>
��@ A
(
��A B
)
��B C
;
��C D
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IMandalsDomain
�� -
,
��- .
MandalsDomain
��/ <
>
��< =
(
��= >
)
��> ?
;
��? @
Services
�� 
.
�� 
	AddScoped
�� 
<
�� (
IEmployeeInformationDomain
�� 9
,
��9 :'
EmployeeInformationDomain
��; T
>
��T U
(
��U V
)
��V W
;
��W X
Services
�� 
.
�� 
	AddScoped
�� 
<
�� "
IReimbursementDomain
�� 3
,
��3 4!
ReimbursementDomain
��5 H
>
��H I
(
��I J
)
��J K
;
��K L
Services
�� 
.
�� 
	AddScoped
�� 
<
�� $
IUserInformationDomain
�� 5
,
��5 6#
UserInformationDomain
��7 L
>
��L M
(
��M N
)
��N O
;
��O P
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IPayslipsDomain
�� .
,
��. /
PayslipsDomain
��0 >
>
��> ?
(
��? @
)
��@ A
;
��A B
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IForm16Domain
�� ,
,
��, -
Form16Domain
��. :
>
��: ;
(
��; <
)
��< =
;
��= >
Services
�� 
.
�� 
	AddScoped
�� 
<
�� "
IHelpDocumentsDomain
�� 3
,
��3 4!
HelpDocumentsDomain
��5 H
>
��H I
(
��I J
)
��J K
;
��K L
Services
�� 
.
�� 
	AddScoped
�� 
<
�� $
IRoleInformationDomain
�� 5
,
��5 6#
RoleInformationDomain
��7 L
>
��L M
(
��M N
)
��N O
;
��O P
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
ICarLeaseDomain
�� .
,
��. /
CarLeaseDomain
��0 >
>
��> ?
(
��? @
)
��@ A
;
��A B
Services
�� 
.
�� 
	AddScoped
�� 
<
�� &
IModuleInformationDomain
�� 7
,
��7 8%
ModuleInformationDomain
��9 P
>
��P Q
(
��Q R
)
��R S
;
��S T
Services
�� 
.
�� 
	AddScoped
�� 
<
�� #
ISecurityModuleDomain
�� 4
,
��4 5"
SecurityModuleDomain
��6 J
>
��J K
(
��K L
)
��L M
;
��M N
Services
�� 
.
�� 
	AddScoped
�� 
<
�� %
IInvestmentProofsDomain
�� 6
,
��6 7$
InvestmentProofsDomain
��8 N
>
��N O
(
��O P
)
��P Q
;
��Q R
Services
�� 
.
�� 
	AddScoped
�� 
<
�� $
ILeaveManagementDomain
�� 5
,
��5 6#
LeaveManagementDomain
��7 L
>
��L M
(
��M N
)
��N O
;
��O P
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "!
INotificationDomain
��" 5
,
��5 6 
NotificationDomain
��7 I
>
��I J
(
��J K
)
��K L
;
��L M
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "%
ISiteNotificationDomain
��" 9
,
��9 :$
SiteNotificationDomain
��; Q
>
��Q R
(
��R S
)
��S T
;
��T U
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
ILeaveTypeDomain
�� /
,
��/ 0
LeaveTypeDomain
��1 @
>
��@ A
(
��A B
)
��B C
;
��C D
Services
�� 
.
�� 
	AddScoped
�� 
<
�� )
IAttendanceReportTypeDomain
�� :
,
��: ;(
AttendanceReportTypeDomain
��< V
>
��V W
(
��W X
)
��X Y
;
��Y Z
Services
�� 
.
�� 
	AddScoped
�� 
<
�� !
ILeaveDayTypeDomain
�� 2
,
��2 3 
LeaveDayTypeDomain
��4 F
>
��F G
(
��G H
)
��H I
;
��I J
Services
�� 
.
�� 
	AddScoped
�� 
<
��  
ILeaveStatusDomain
�� 1
,
��1 2
LeaveStatusDomain
��3 D
>
��D E
(
��E F
)
��F G
;
��G H
Services
�� 
.
�� 
	AddScoped
�� 
<
�� %
ILeaveInformationDomain
�� 6
,
��6 7$
LeaveInformationDomain
��8 N
>
��N O
(
��O P
)
��P Q
;
��Q R
Services
�� 
.
�� 
	AddScoped
�� 
<
�� +
ILeavePolicyInformationDomain
�� <
,
��< =*
LeavePolicyInformationDomain
��> Z
>
��Z [
(
��[ \
)
��\ ]
;
��] ^
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "!
IAutoApprovalDomain
��" 5
,
��5 6 
AutoApprovalDomain
��7 I
>
��I J
(
��J K
)
��K L
;
��L M
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "
ISendEmailDomain
��" 2
,
��2 3
SendEmailDomain
��4 C
>
��C D
(
��D E
)
��E F
;
��F G
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
ITimeSheetDomain
�� /
,
��/ 0
TimeSheetDomain
��1 @
>
��@ A
(
��A B
)
��B C
;
��C D
Services
�� 
.
�� 
	AddScoped
�� 
<
�� '
INslEmployeeProfileDomain
�� 8
,
��8 9&
NslEmployeeProfileDomain
��: R
>
��R S
(
��S T
)
��T U
;
��U V
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IBranchDomain
�� ,
,
��, -
BranchDomain
��. :
>
��: ;
(
��; <
)
��< =
;
��= >
Services
�� 
.
�� 
	AddScoped
�� 
<
�� 
IReportsDomain
�� -
,
��- .
ReportsDomain
��/ <
>
��< =
(
��= >
)
��> ?
;
��? @
Services
�� 
.
�� 
	AddScoped
�� 
<
�� %
ILeaveEntitlementDomain
�� 6
,
��6 7$
LeaveEntitlementDomain
��8 N
>
��N O
(
��O P
)
��P Q
;
��Q R
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "%
IResignedEmployeeDomain
��" 9
,
��9 :$
ResignedEmployeeDomain
��; Q
>
��Q R
(
��R S
)
��S T
;
��T U
Services
�� 
.
�� 
	AddScoped
�� 
<
�� $
ILeaveEncashmentDomain
�� 5
,
��5 6#
LeaveEncashmentDomain
��7 L
>
��L M
(
��M N
)
��N O
;
��O P
Services
�� 
.
�� 
	AddScoped
�� 
<
�� )
IEmployeeVerificationDomain
�� :
,
��: ;(
EmployeeVerificationDomain
��< V
>
��V W
(
��W X
)
��X Y
;
��Y Z
Services
�� 
.
�� 
AddSingleton
�� !
<
��! "&
IAppointmentLetterDomain
��" :
,
��: ;%
AppointmentLetterDomain
��< S
>
��S T
(
��T U
)
��U V
;
��V W
Services
�� 
.
�� 
AddSingleton
�� !
<
��! " 
IVistorCountDomain
��" 4
,
��4 5
VistorCountDomain
��6 G
>
��G H
(
��H I
)
��I J
;
��J K
return
�� 
Services
�� 
;
�� 
}
�� 	
}
�� 
}�� 