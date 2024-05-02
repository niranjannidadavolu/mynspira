Ù
lF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Logging\ILoggerManager.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Logging %
{ 
public 

	interface 
ILoggerManager #
{ 
void 
LogInfo 
( 
string 
message #
)# $
;$ %
void 
LogWarn 
( 
string 
message #
)# $
;$ %
void		 
LogDebug		 
(		 
string		 
message		 $
)		$ %
;		% &
void 
LogError 
( 
string 
message $
)$ %
;% &
} 
} «
kF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Logging\LoggerManager.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Logging %
{ 
public 

class 
LoggerManager 
:  
ILoggerManager! /
{ 
private 
static 
ILogger 
logger %
=& '

LogManager( 2
.2 3!
GetCurrentClassLogger3 H
(H I
)I J
;J K
public		 
LoggerManager		 
(		 
)		 
{

 	
} 	
public 
void 
LogDebug 
( 
string #
message$ +
)+ ,
{ 	
logger 
. 
Debug 
( 
message  
)  !
;! "
} 	
public 
void 
LogError 
( 
string #
message$ +
)+ ,
{ 	
logger 
. 
Error 
( 
message  
)  !
;! "
} 	
public 
void 
LogInfo 
( 
string "
message# *
)* +
{ 	
logger 
. 
Info 
( 
message 
)  
;  !
} 	
public 
void 
LogWarn 
( 
string "
message# *
)* +
{ 	
logger 
. 
Warn 
( 
message 
)  
;  !
} 	
}   
}!! 