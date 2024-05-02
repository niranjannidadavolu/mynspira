Ý
eF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Mapping\IMapper.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Mapping %
{ 
public 

	interface 
IMapper 
{ 
TSource 
Clone 
< 
TSource 
> 
( 
TSource &
source' -
)- .
;. /
TDestination 
Map 
< 
TDestination %
>% &
(& '
object' -
source. 4
)4 5
;5 6
TDestination		 
Map		 
<		 
TSource		  
,		  !
TDestination		" .
>		. /
(		/ 0
TSource		0 7
source		8 >
,		> ?
TDestination		@ L
destination		M X
)		X Y
;		Y Z
}

 
} ÿ
dF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Mapping\Mapper.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
Mapping %
{ 
public 

class 
Mapper 
: 
IMapper !
{ 
public 
Mapper 
( 
) 
{ 	
	Configure 
( 
) 
; 
} 	
public

 
TSource

 
Clone

 
<

 
TSource

 $
>

$ %
(

% &
TSource

& -
source

. 4
)

4 5
{ 	
return 
AgileObjects 
.  
AgileMapper  +
.+ ,
Mapper, 2
.2 3
	DeepClone3 <
(< =
source= C
)C D
;D E
} 	
public 
TDestination 
Map 
<  
TDestination  ,
>, -
(- .
object. 4
source5 ;
); <
{ 	
return 
AgileObjects 
.  
AgileMapper  +
.+ ,
Mapper, 2
.2 3
Map3 6
(6 7
source7 =
)= >
.> ?
ToANew? E
<E F
TDestinationF R
>R S
(S T
)T U
;U V
} 	
public 
TDestination 
Map 
<  
TSource  '
,' (
TDestination) 5
>5 6
(6 7
TSource7 >
source? E
,E F
TDestinationG S
destinationT _
)_ `
{ 	
return 
AgileObjects 
.  
AgileMapper  +
.+ ,
Mapper, 2
.2 3
Map3 6
(6 7
source7 =
)= >
.> ?
OnTo? C
(C D
destinationD O
)O P
;P Q
} 	
private 
static 
void 
	Configure %
(% &
)& '
{ 	
} 	
} 
}   