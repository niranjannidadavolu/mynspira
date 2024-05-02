�*
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\Dapper\Dapper.SqlMapper.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
	Extension (
.( )
Dapper) /
{		 
public

 

static

 
partial

 
class

 

Extensions

  *
{ 
public 
static 
	SqlMapper 
.  !
ICustomQueryParameter  5"
ToTableValuedParameter6 L
<L M
TM N
>N O
( 
this
IEnumerable 
< 
T 
>  

enumerable! +
,+ ,
string 
typeName 
, 
IEnumerable (
<( )
string) /
>/ 0
orderedColumnNames1 C
=D E
nullF J
)J K
{ 	
var 
	dataTable 
= 
new 
	DataTable  )
() *
)* +
;+ ,
if 
( 
typeof 
( 
T 
) 
. 
IsValueType %
||& (
typeof) /
(/ 0
T0 1
)1 2
.2 3
FullName3 ;
.; <
Equals< B
(B C
$strC R
)R S
)S T
{ 
	dataTable 
. 
Columns !
.! "
Add" %
(% &
orderedColumnNames& 8
==9 ;
null< @
?A B
$str 
: 
orderedColumnNames 1
.1 2
First2 7
(7 8
)8 9
,9 :
typeof; A
(A B
TB C
)C D
)D E
;E F
foreach 
( 
T 
obj 
in !

enumerable" ,
), -
{ 
	dataTable   
.   
Rows   "
.  " #
Add  # &
(  & '
obj  ' *
)  * +
;  + ,
}!! 
}"" 
else## 
{$$ 
PropertyInfo%% 
[%% 
]%% 

properties%% )
=%%* +
typeof%%, 2
(%%2 3
T%%3 4
)%%4 5
.%%5 6

(&& 
BindingFlags&& !
.&&! "
Public&&" (
|&&) *
BindingFlags&&+ 7
.&&7 8
Instance&&8 @
)&&@ A
;&&A B
PropertyInfo'' 
['' 
]'' 
readableProperties'' 1
=''2 3

properties''4 >
.''> ?
Where''? D
((( 
w(( 
=>(( 
w(( 
.(( 
CanRead(( #
)((# $
.(($ %
ToArray((% ,
(((, -
)((- .
;((. /
if)) 
()) 
readableProperties)) &
.))& '
Length))' -
>)). /
$num))0 1
&&))2 4
orderedColumnNames))5 G
==))H J
null))K O
)))O P
throw** 
new** 
ArgumentException** /
(**/ 0
$str	**0 �
)
**� �
;
**� �
var-- 
columnNames-- 
=--  !
(--" #
orderedColumnNames--# 5
??--6 8
readableProperties.. &
...& '
Select..' -
(..- .
s... /
=>..0 2
s..3 4
...4 5
Name..5 9
)..9 :
)..: ;
...; <
ToArray..< C
(..C D
)..D E
;..E F
foreach// 
(// 
string// 
name//  $
in//% '
columnNames//( 3
)//3 4
{00 
	dataTable11 
.11 
Columns11 %
.11% &
Add11& )
(11) *
name11* .
,11. /
readableProperties110 B
.11B C
Single11C I
(22 
s22 
=>22 
s22 
.22  
Name22  $
.22$ %
Equals22% +
(22+ ,
name22, 0
)220 1
)221 2
.222 3
PropertyType223 ?
)22? @
;22@ A
}33 
foreach55 
(55 
T55 
obj55 
in55 !

enumerable55" ,
)55, -
{66 
	dataTable77 
.77 
Rows77 "
.77" #
Add77# &
(77& '
columnNames88 #
.88# $
Select88$ *
(88* +
s88+ ,
=>88- /
readableProperties880 B
.88B C
Single88C I
(99 
s299 
=>99  "
s299# %
.99% &
Name99& *
.99* +
Equals99+ 1
(991 2
s992 3
)993 4
)994 5
.995 6
GetValue996 >
(99> ?
obj99? B
)99B C
)99C D
.:: 
ToArray:: $
(::$ %
)::% &
)::& '
;::' (
};; 
}<< 
return== 
	dataTable== 
.== "
AsTableValuedParameter== 3
(==3 4
typeName==4 <
)==< =
;=== >
}>> 	
}?? 
}@@ �
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\File\Convert.Stream.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
File( ,
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ConvertToBase64 ,
(, -
this- 1
Stream2 8
stream9 ?
)? @
{		 	
byte

 
[

 
]

 
bytes

 
;

 
using 
( 
var 
memoryStream #
=$ %
new& )
MemoryStream* 6
(6 7
)7 8
)8 9
{ 
stream
.
CopyTo
(
memoryStream
)
;
bytes 
= 
memoryStream $
.$ %
ToArray% ,
(, -
)- .
;. /
} 
string 
base64 
= 
Convert #
.# $
ToBase64String$ 2
(2 3
bytes3 8
)8 9
;9 :
return 
base64 
; 
} 	
} 
} �
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\Array.ClearAll.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public		 
static		 
void		 
ClearAll		 #
(		# $
this		$ (
global		) /
::		/ 1
System		1 7
.		7 8
Array		8 =
@this		> C
)		C D
{

 	
global 
:: 
System 
. 
Array  
.  !
Clear! &
(& '
@this' ,
,, -
$num. /
,/ 0
@this1 6
.6 7
Length7 =
)= >
;> ?
} 	
}
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\Array.WithinIndex.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
WithinIndex &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
Array; @
@thisA F
,F G
intH K
indexL Q
)Q R
{ 	
return
index
>=
$num
&&
index
<
@this
.
Length
;
} 	
public 
static 
bool 
WithinIndex &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
Array; @
@thisA F
,F G
intH K
indexL Q
,Q R
intS V
	dimensionW `
=a b
$numc d
)d e
{ 	
return 
index 
>= 
@this !
.! "

(/ 0
	dimension0 9
)9 :
&&; =
index> C
<=D F
@thisG L
.L M

(Z [
	dimension[ d
)d e
;e f
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.BinarySearch.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
BinarySearch &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
Array; @
arrayA F
,F G
objectH N
valueO T
)T U
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
BinarySearch( 4
(4 5
array5 :
,: ;
value< A
)A B
;B C
} 	
public&& 
static&& 
int&& 
BinarySearch&& &
(&&& '
this&&' +
global&&, 2
::&&2 4
System&&4 :
.&&: ;
Array&&; @
array&&A F
,&&F G
int&&H K
index&&L Q
,&&Q R
int&&S V
length&&W ]
,&&] ^
object&&_ e
value&&f k
)&&k l
{'' 	
return(( 
global(( 
::(( 
System(( !
.((! "
Array((" '
.((' (
BinarySearch((( 4
(((4 5
array((5 :
,((: ;
index((< A
,((A B
length((C I
,((I J
value((K P
)((P Q
;((Q R
})) 	
public:: 
static:: 
int:: 
BinarySearch:: &
(::& '
this::' +
global::, 2
::::2 4
System::4 :
.::: ;
Array::; @
array::A F
,::F G
object::H N
value::O T
,::T U
	IComparer::V _
comparer::` h
)::h i
{;; 	
return<< 
global<< 
::<< 
System<< !
.<<! "
Array<<" '
.<<' (
BinarySearch<<( 4
(<<4 5
array<<5 :
,<<: ;
value<<< A
,<<A B
comparer<<C K
)<<K L
;<<L M
}== 	
publicPP 
staticPP 
intPP 
BinarySearchPP &
(PP& '
thisPP' +
globalPP, 2
::PP2 4
SystemPP4 :
.PP: ;
ArrayPP; @
arrayPPA F
,PPF G
intPPH K
indexPPL Q
,PPQ R
intPPS V
lengthPPW ]
,PP] ^
objectPP_ e
valuePPf k
,PPk l
	IComparerPPm v
comparerPPw 
)	PP �
{QQ 	
returnRR 
globalRR 
::RR 
SystemRR !
.RR! "
ArrayRR" '
.RR' (
BinarySearchRR( 4
(RR4 5
arrayRR5 :
,RR: ;
indexRR< A
,RRA B
lengthRRC I
,RRI J
valueRRK P
,RRP Q
comparerRRR Z
)RRZ [
;RR[ \
}SS 	
}TT 
}UU �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.Clear.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
Clear  
(  !
this! %
global& ,
::, .
System. 4
.4 5
Array5 :
array; @
,@ A
intB E
indexF K
,K L
intM P
lengthQ W
)W X
{ 	
global
::
System
.
Array
.
Clear
(
array
,
index
,
length
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.ConstrainedCopy.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
ConstrainedCopy *
(* +
this+ /
global0 6
::6 8
System8 >
.> ?
Array? D
sourceArrayE P
,P Q
intR U
sourceIndexV a
,a b
globalc i
::i k
Systemk q
.q r
Arrayr w
destinationArray	x �
,
� �
int
� �
destinationIndex
� �
,
� �
int
� �
length
� �
)
� �
{ 	
global 
:: 
System 
. 
Array  
.  !
ConstrainedCopy! 0
(0 1
sourceArray1 <
,< =
sourceIndex> I
,I J
destinationArrayK [
,[ \
destinationIndex] m
,m n
lengtho u
)u v
;v w
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.Copy.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
Copy 
(  
this  $
global% +
::+ -
System- 3
.3 4
Array4 9
sourceArray: E
,E F
globalG M
::M O
SystemO U
.U V
ArrayV [
destinationArray\ l
,l m
intn q
lengthr x
)x y
{
global 
:: 
System 
. 
Array  
.  !
Copy! %
(% &
sourceArray& 1
,1 2
destinationArray3 C
,C D
lengthE K
)K L
;L M
} 	
public 
static 
void 
Copy 
(  
this  $
global% +
::+ -
System- 3
.3 4
Array4 9
sourceArray: E
,E F
intG J
sourceIndexK V
,V W
globalX ^
::^ `
System` f
.f g
Arrayg l
destinationArraym }
,} ~
int	 �
destinationIndex
� �
,
� �
int
� �
length
� �
)
� �
{ 	
global 
:: 
System 
. 
Array  
.  !
Copy! %
(% &
sourceArray& 1
,1 2
sourceIndex3 >
,> ?
destinationArray@ P
,P Q
destinationIndexR b
,b c
lengthd j
)j k
;k l
} 	
public)) 
static)) 
void)) 
Copy)) 
())  
this))  $
global))% +
::))+ -
System))- 3
.))3 4
Array))4 9
sourceArray)): E
,))E F
global))G M
::))M O
System))O U
.))U V
Array))V [
destinationArray))\ l
,))l m
long))n r
length))s y
)))y z
{** 	
global++ 
::++ 
System++ 
.++ 
Array++  
.++  !
Copy++! %
(++% &
sourceArray++& 1
,++1 2
destinationArray++3 C
,++C D
length++E K
)++K L
;++L M
},, 	
public:: 
static:: 
void:: 
Copy:: 
(::  
this::  $
global::% +
::::+ -
System::- 3
.::3 4
Array::4 9
sourceArray::: E
,::E F
long::G K
sourceIndex::L W
,::W X
global::Y _
::::_ a
System::a g
.::g h
Array::h m
destinationArray::n ~
,::~ 
long
::� �
destinationIndex
::� �
,
::� �
long
::� �
length
::� �
)
::� �
{;; 	
global<< 
::<< 
System<< 
.<< 
Array<<  
.<<  !
Copy<<! %
(<<% &
sourceArray<<& 1
,<<1 2
sourceIndex<<3 >
,<<> ?
destinationArray<<@ P
,<<P Q
destinationIndex<<R b
,<<b c
length<<d j
)<<j k
;<<k l
}== 	
}>> 
}?? �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.IndexOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
IndexOf !
(! "
this" &
global' -
::- /
System/ 5
.5 6
Array6 ;
array< A
,A B
objectC I
valueJ O
)O P
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
array0 5
,5 6
value7 <
)< =
;= >
} 	
public 
static 
int 
IndexOf !
(! "
this" &
global' -
::- /
System/ 5
.5 6
Array6 ;
array< A
,A B
objectC I
valueJ O
,O P
intQ T

startIndexU _
)_ `
{   	
return!! 
global!! 
::!! 
System!! !
.!!! "
Array!!" '
.!!' (
IndexOf!!( /
(!!/ 0
array!!0 5
,!!5 6
value!!7 <
,!!< =

startIndex!!> H
)!!H I
;!!I J
}"" 	
public00 
static00 
int00 
IndexOf00 !
(00! "
this00" &
global00' -
::00- /
System00/ 5
.005 6
Array006 ;
array00< A
,00A B
object00C I
value00J O
,00O P
int00Q T

startIndex00U _
,00_ `
int00a d
count00e j
)00j k
{11 	
return22 
global22 
::22 
System22 !
.22! "
Array22" '
.22' (
IndexOf22( /
(22/ 0
array220 5
,225 6
value227 <
,22< =

startIndex22> H
,22H I
count22J O
)22O P
;22P Q
}33 	
}44 
}55 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.LastIndexOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
LastIndexOf %
(% &
this& *
global+ 1
::1 3
System3 9
.9 :
Array: ?
array@ E
,E F
objectG M
valueN S
)S T
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
LastIndexOf( 3
(3 4
array4 9
,9 :
value; @
)@ A
;A B
} 	
public 
static 
int 
LastIndexOf %
(% &
this& *
global+ 1
::1 3
System3 9
.9 :
Array: ?
array@ E
,E F
objectG M
valueN S
,S T
intU X

startIndexY c
)c d
{   	
return!! 
global!! 
::!! 
System!! !
.!!! "
Array!!" '
.!!' (
LastIndexOf!!( 3
(!!3 4
array!!4 9
,!!9 :
value!!; @
,!!@ A

startIndex!!B L
)!!L M
;!!M N
}"" 	
public00 
static00 
int00 
LastIndexOf00 %
(00% &
this00& *
global00+ 1
::001 3
System003 9
.009 :
Array00: ?
array00@ E
,00E F
object00G M
value00N S
,00S T
int00U X

startIndex00Y c
,00c d
int00e h
count00i n
)00n o
{11 	
return22 
global22 
::22 
System22 !
.22! "
Array22" '
.22' (
LastIndexOf22( 3
(223 4
array224 9
,229 :
value22; @
,22@ A

startIndex22B L
,22L M
count22N S
)22S T
;22T U
}33 	
}44 
}55 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.Reverse.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public		 
static		 
void		 
Reverse		 "
(		" #
this		# '
global		( .
::		. 0
System		0 6
.		6 7
Array		7 <
array		= B
)		B C
{

 	
global 
:: 
System 
. 
Array  
.  !
Reverse! (
(( )
array) .
). /
;/ 0
} 	
public 
static 
void 
Reverse "
(" #
this# '
global( .
::. 0
System0 6
.6 7
Array7 <
array= B
,B C
intD G
indexH M
,M N
intO R
lengthS Y
)Y Z
{ 	
global 
:: 
System 
. 
Array  
.  !
Reverse! (
(( )
array) .
,. /
index0 5
,5 6
length7 =
)= >
;> ?
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.Sequence.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 

(( )
this) -
int. 1
[1 2
]2 3
ints4 8
)8 9
{ 	
int 
start 
= 
ints 
. 
First "
(" #
)# $
;$ %
return
!
ints
.
Where
(
(
x
,
i
)
=>
x
!=
i
+
start
)
.
Any
(
)
;
} 	
} 
} �.
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Array\Array.Sort.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Array< A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
Sort 
(  
this  $
global% +
::+ -
System- 3
.3 4
Array4 9
array: ?
)? @
{ 	
global
::
System
.
Array
.
Sort
(
array
)
;
} 	
public 
static 
void 
Sort 
(  
this  $
global% +
::+ -
System- 3
.3 4
Array4 9
array: ?
,? @
globalA G
::G I
SystemI O
.O P
ArrayP U
itemsV [
)[ \
{ 	
global 
:: 
System 
. 
Array  
.  !
Sort! %
(% &
array& +
,+ ,
items- 2
)2 3
;3 4
} 	
public'' 
static'' 
void'' 
Sort'' 
(''  
this''  $
global''% +
::''+ -
System''- 3
.''3 4
Array''4 9
array'': ?
,''? @
int''A D
index''E J
,''J K
int''L O
length''P V
)''V W
{(( 	
global)) 
::)) 
System)) 
.)) 
Array))  
.))  !
Sort))! %
())% &
array))& +
,))+ ,
index))- 2
,))2 3
length))4 :
))): ;
;)); <
}** 	
public99 
static99 
void99 
Sort99 
(99  
this99  $
global99% +
::99+ -
System99- 3
.993 4
Array994 9
array99: ?
,99? @
global99A G
::99G I
System99I O
.99O P
Array99P U
items99V [
,99[ \
int99] `
index99a f
,99f g
int99h k
length99l r
)99r s
{:: 	
global;; 
::;; 
System;; 
.;; 
Array;;  
.;;  !
Sort;;! %
(;;% &
array;;& +
,;;+ ,
items;;- 2
,;;2 3
index;;4 9
,;;9 :
length;;; A
);;A B
;;;B C
}<< 	
publicFF 
staticFF 
voidFF 
SortFF 
(FF  
thisFF  $
globalFF% +
::FF+ -
SystemFF- 3
.FF3 4
ArrayFF4 9
arrayFF: ?
,FF? @
	IComparerFFA J
comparerFFK S
)FFS T
{GG 	
globalHH 
::HH 
SystemHH 
.HH 
ArrayHH  
.HH  !
SortHH! %
(HH% &
arrayHH& +
,HH+ ,
comparerHH- 5
)HH5 6
;HH6 7
}II 	
publicZZ 
staticZZ 
voidZZ 
SortZZ 
(ZZ  
thisZZ  $
globalZZ% +
::ZZ+ -
SystemZZ- 3
.ZZ3 4
ArrayZZ4 9
arrayZZ: ?
,ZZ? @
globalZZA G
::ZZG I
SystemZZI O
.ZZO P
ArrayZZP U
itemsZZV [
,ZZ[ \
	IComparerZZ] f
comparerZZg o
)ZZo p
{[[ 	
global\\ 
::\\ 
System\\ 
.\\ 
Array\\  
.\\  !
Sort\\! %
(\\% &
array\\& +
,\\+ ,
items\\- 2
,\\2 3
comparer\\4 <
)\\< =
;\\= >
}]] 	
publicii 
staticii 
voidii 
Sortii 
(ii  
thisii  $
globalii% +
::ii+ -
Systemii- 3
.ii3 4
Arrayii4 9
arrayii: ?
,ii? @
intiiA D
indexiiE J
,iiJ K
intiiL O
lengthiiP V
,iiV W
	ICompareriiX a
compareriib j
)iij k
{jj 	
globalkk 
::kk 
Systemkk 
.kk 
Arraykk  
.kk  !
Sortkk! %
(kk% &
arraykk& +
,kk+ ,
indexkk- 2
,kk2 3
lengthkk4 :
,kk: ;
comparerkk< D
)kkD E
;kkE F
}ll 	
public 
static 
void 
Sort 
(  
this  $
global% +
::+ -
System- 3
.3 4
Array4 9
array: ?
,? @
globalA G
::G I
SystemI O
.O P
ArrayP U
itemsV [
,[ \
int] `
indexa f
,f g
inth k
lengthl r
,r s
	IComparert }
comparer	~ �
)
� �
{
�� 	
global
�� 
::
�� 
System
�� 
.
�� 
Array
��  
.
��  !
Sort
��! %
(
��% &
array
��& +
,
��+ ,
items
��- 2
,
��2 3
index
��4 9
,
��9 :
length
��; A
,
��A B
comparer
��C K
)
��K L
;
��L M
}
�� 	
}
�� 
}�� �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Buffer\Array.BlockCopy.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Buffer< B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
	BlockCopy $
($ %
this% )
global* 0
::0 2
System2 8
.8 9
Array9 >
src? B
,B C
intD G
	srcOffsetH Q
,Q R
globalS Y
::Y [
System[ a
.a b
Arrayb g
dsth k
,k l
intm p
	dstOffsetq z
,z {
int| 
count
� �
)
� �
{ 	
global 
:: 
System 
. 
Buffer !
.! "
	BlockCopy" +
(+ ,
src, /
,/ 0
	srcOffset1 :
,: ;
dst< ?
,? @
	dstOffsetA J
,J K
countL Q
)Q R
;R S
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Buffer\Array.ByteLength.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Buffer< B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 

ByteLength

 $
(

$ %
this

% )
global

* 0
::

0 2
System

2 8
.

8 9
Array

9 >
array

? D
)

D E
{ 	
return 
global 
:: 
System !
.! "
Buffer" (
.( )

ByteLength) 3
(3 4
array4 9
)9 :
;: ;
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Buffer\Array.GetByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Buffer< B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
GetByte "
(" #
this# '
global( .
::. 0
System0 6
.6 7
Array7 <
array= B
,B C
intD G
indexH M
)M N
{ 	
return
global
::
System
.
Buffer
.
GetByte
(
array
,
index
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Array\System.Buffer\Array.SetByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Array/ 4
.4 5
System5 ;
.; <
Buffer< B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
SetByte "
(" #
this# '
global( .
::. 0
System0 6
.6 7
Array7 <
array= B
,B C
intD G
indexH M
,M N
byteO S
valueT Y
)Y Z
{ 	
global
::
System
.
Buffer
.
SetByte
(
array
,
index
,
value
)
;
} 	
} 
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Boolean\Boolean.IfFalse.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Boolean/ 6
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
IfFalse "
(" #
this# '
bool( ,
@this- 2
,2 3
Action4 :
action; A
)A B
{
if 
( 
! 
@this 
) 
{ 
action 
( 
) 
; 
} 
} 	
} 
} �
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Boolean\Boolean.IfTrue.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Boolean/ 6
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
IfTrue !
(! "
this" &
bool' +
@this, 1
,1 2
Action3 9
action: @
)@ A
{
if 
( 
@this 
) 
{ 
action 
( 
) 
; 
} 
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Boolean\Boolean.ToBinary.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Boolean/ 6
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
ToBinary #
(# $
this$ (
bool) -
@this. 3
)3 4
{
return 
Convert 
. 
ToByte !
(! "
@this" '
)' (
;( )
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Boolean\Boolean.ToString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Boolean/ 6
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToString %
(% &
this& *
bool+ /
@this0 5
,5 6
string7 =
	trueValue> G
,G H
stringI O

falseValueP Z
)Z [
{
return 
@this 
? 
	trueValue $
:% &

falseValue' 1
;1 2
} 	
} 
} �"
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Byte\Byte.SqlSystemTypeToSqlDbType.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Byte/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public		 
static		 
	SqlDbType		 $
SqlSystemTypeToSqlDbType		  8
(		8 9
this		9 =
byte		> B
@this		C H
)		H I
{

 	
return 
@this 
switch 
{ 
$num 
=> 
	SqlDbType 
.  
Image  %
,% &
$num 
=> 
	SqlDbType 
.  
Text  $
,$ %
$num 
=> 
	SqlDbType 
.  
UniqueIdentifier  0
,0 1
$num 
=> 
	SqlDbType 
.  
Date  $
,$ %
$num 
=> 
	SqlDbType 
.  
Time  $
,$ %
$num 
=> 
	SqlDbType 
.  
	DateTime2  )
,) *
$num 
=> 
	SqlDbType 
.  
DateTimeOffset  .
,. /
$num 
=> 
	SqlDbType 
.  
TinyInt  '
,' (
$num 
=> 
	SqlDbType 
.  
SmallInt  (
,( )
$num   
=>   
	SqlDbType   
.    
Int    #
,  # $
$num"" 
=>"" 
	SqlDbType"" 
.""  

,""- .
$num$$ 
=>$$ 
	SqlDbType$$ 
.$$  
Real$$  $
,$$$ %
$num&& 
=>&& 
	SqlDbType&& 
.&&  
Money&&  %
,&&% &
$num(( 
=>(( 
	SqlDbType(( 
.((  
DateTime((  (
,((( )
$num** 
=>** 
	SqlDbType** 
.**  
Float**  %
,**% &
$num,, 
=>,, 
	SqlDbType,, 
.,,  
Variant,,  '
,,,' (
$num.. 
=>.. 
	SqlDbType.. 
...  
NText..  %
,..% &
$num00 
=>00 
	SqlDbType00  
.00  !
Bit00! $
,00$ %
$num22 
=>22 
	SqlDbType22  
.22  !
Decimal22! (
,22( )
$num44 
=>44 
	SqlDbType44  
.44  !
Decimal44! (
,44( )
$num66 
=>66 
	SqlDbType66  
.66  !

SmallMoney66! +
,66+ ,
$num88 
=>88 
	SqlDbType88  
.88  !
BigInt88! '
,88' (
$num:: 
=>:: 
	SqlDbType::  
.::  !
	VarBinary::! *
,::* +
$num<< 
=><< 
	SqlDbType<<  
.<<  !
VarChar<<! (
,<<( )
$num>> 
=>>> 
	SqlDbType>>  
.>>  !
Binary>>! '
,>>' (
$num@@ 
=>@@ 
	SqlDbType@@  
.@@  !
Char@@! %
,@@% &
$numBB 
=>BB 
	SqlDbTypeBB  
.BB  !
	TimestampBB! *
,BB* +
$numDD 
=>DD 
	SqlDbTypeDD  
.DD  !
NVarCharDD! )
,DD) *
$numFF 
=>FF 
	SqlDbTypeFF  
.FF  !
NCharFF! &
,FF& '
$numHH 
=>HH 
	SqlDbTypeHH  
.HH  !
UdtHH! $
,HH$ %
$numJJ 
=>JJ 
	SqlDbTypeJJ  
.JJ  !
XmlJJ! $
,JJ$ %
_KK 
=>KK 
throwKK 
newKK 
	ExceptionKK (
(KK( )
stringKK) /
.KK/ 0
FormatKK0 6
(KK6 7
$str	KK7 �
,
KK� �
@this
KK� �
)
KK� �
)
KK� �
,
KK� �
}LL 
;LL
}MM 	
}NN 
}OO �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Byte\System.Math\Byte.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Byte/ 3
.3 4
System4 :
.: ;
Math; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
Max 
( 
this #
byte$ (
val1) -
,- .
byte/ 3
val24 8
)8 9
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Byte\System.Math\Byte.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Byte/ 3
.3 4
System4 :
.: ;
Math; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
Min 
( 
this #
byte$ (
val1) -
,- .
byte/ 3
val24 8
)8 9
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
wF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\Char.Repeat.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Repeat #
(# $
this$ (
char) -
@this. 3
,3 4
int5 8
repeatCount9 D
)D E
{ 	
return
new
string
(
@this
,
repeatCount
)
;
} 	
} 
} �
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\Char.To.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{		 
public 
static 
IEnumerable !
<! "
char" &
>& '
To( *
(* +
this+ /
char0 4
@this5 :
,: ;
char< @
toCharacterA L
)L M
{ 	
bool 
reverseRequired  
=! "
@this# (
>) *
toCharacter+ 6
;6 7
char 
first 
= 
reverseRequired (
?) *
toCharacter+ 6
:7 8
@this9 >
;> ?
char 
last 
= 
reverseRequired '
?( )
@this* /
:0 1
toCharacter2 =
;= >
IEnumerable 
< 
char 
> 
result $
=% &

Enumerable' 1
.1 2
Range2 7
(7 8
first8 =
,= >
last? C
-D E
firstF K
+L M
$numN O
)O P
.P Q
SelectQ W
(W X
charCodeX `
=>a c
(d e
chare i
)i j
charCodej r
)r s
;s t
if 
( 
reverseRequired 
)  
{ 
result 
= 
result 
.  
Reverse  '
(' (
)( )
;) *
} 
return 
result 
; 
} 	
}   
}!! �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.ConvertToUtf32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
ConvertToUtf32 (
(( )
this) -
char. 2

,@ A
charB F
lowSurrogateG S
)S T
{ 	
return
char
.
ConvertToUtf32
(

,
lowSurrogate
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.GetNumericValue.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
GetNumericValue

 ,
(

, -
this

- 1
char

2 6
c

7 8
)

8 9
{ 	
return 
char 
. 
GetNumericValue '
(' (
c( )
)) *
;* +
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.GetUnicodeCategory.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
UnicodeCategory %
GetUnicodeCategory& 8
(8 9
this9 =
char> B
cC D
)D E
{
return 
char 
. 
GetUnicodeCategory *
(* +
c+ ,
), -
;- .
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsControl.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
	IsControl

 $
(

$ %
this

% )
char

* .
c

/ 0
)

0 1
{ 	
return 
char 
. 
	IsControl !
(! "
c" #
)# $
;$ %
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsDigit.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsDigit

 "
(

" #
this

# '
char

( ,
c

- .
)

. /
{ 	
return 
char 
. 
IsDigit 
(  
c  !
)! "
;" #
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsHighSurrogate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsHighSurrogate *
(* +
this+ /
char0 4
c5 6
)6 7
{
return 
char 
. 
IsHighSurrogate '
(' (
c( )
)) *
;* +
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsLetter.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsLetter

 #
(

# $
this

$ (
char

) -
c

. /
)

/ 0
{ 	
return 
char 
. 
IsLetter  
(  !
c! "
)" #
;# $
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsLetterOrDigit.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsLetterOrDigit

 *
(

* +
this

+ /
char

0 4
c

5 6
)

6 7
{ 	
return 
char 
. 
IsLetterOrDigit '
(' (
c( )
)) *
;* +
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsLower.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsLower

 "
(

" #
this

# '
char

( ,
c

- .
)

. /
{ 	
return 
char 
. 
IsLower 
(  
c  !
)! "
;" #
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsLowSurrogate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsLowSurrogate )
() *
this* .
char/ 3
c4 5
)5 6
{
return 
char 
. 
IsLowSurrogate &
(& '
c' (
)( )
;) *
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsNumber.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNumber

 #
(

# $
this

$ (
char

) -
c

. /
)

/ 0
{ 	
return 
char 
. 
IsNumber  
(  !
c! "
)" #
;# $
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsPunctuation.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
char

. 2
c

3 4
)

4 5
{ 	
return 
char 
. 

(% &
c& '
)' (
;( )
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsSeparator.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsSeparator

 &
(

& '
this

' +
char

, 0
c

1 2
)

2 3
{ 	
return 
char 
. 
IsSeparator #
(# $
c$ %
)% &
;& '
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsSurrogate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsSurrogate

 &
(

& '
this

' +
char

, 0
c

1 2
)

2 3
{ 	
return 
char 
. 
IsSurrogate #
(# $
c$ %
)% &
;& '
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsSurrogatePair.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsSurrogatePair *
(* +
this+ /
char0 4

,B C
charD H
lowSurrogateI U
)U V
{ 	
return 
char 
. 
IsSurrogatePair '
(' (

,5 6
lowSurrogate7 C
)C D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsSymbol.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsSymbol

 #
(

# $
this

$ (
char

) -
c

. /
)

/ 0
{ 	
return 
char 
. 
IsSymbol  
(  !
c! "
)" #
;# $
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsUpper.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsUpper

 "
(

" #
this

# '
char

( ,
c

- .
)

. /
{ 	
return 
char 
. 
IsUpper 
(  
c  !
)! "
;" #
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.IsWhiteSpace.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsWhiteSpace

 '
(

' (
this

( ,
char

- 1
c

2 3
)

3 4
{ 	
return 
char 
. 
IsWhiteSpace $
($ %
c% &
)& '
;' (
}
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.ToLower.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
char 
ToLower "
(" #
this# '
char( ,
c- .
,. /
CultureInfo0 ;
culture< C
)C D
{ 	
return 
char 
. 
ToLower 
(  
c  !
,! "
culture# *
)* +
;+ ,
} 	
public 
static 
char 
ToLower "
(" #
this# '
char( ,
c- .
). /
{ 	
return 
char 
. 
ToLower 
(  
c  !
)! "
;" #
}   	
}!! 
}"" �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.ToLowerInvariant.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
char 
ToLowerInvariant +
(+ ,
this, 0
char1 5
c6 7
)7 8
{ 	
return 
char 
. 
ToLowerInvariant (
(( )
c) *
)* +
;+ ,
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.ToString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
ToString

 %
(

% &
this

& *
char

+ /
c

0 1
)

1 2
{ 	
return 
char 
. 
ToString  
(  !
c! "
)" #
;# $
}
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.ToUpper.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
char 
ToUpper "
(" #
this# '
char( ,
c- .
,. /
CultureInfo0 ;
culture< C
)C D
{ 	
return 
char 
. 
ToUpper 
(  
c  !
,! "
culture# *
)* +
;+ ,
} 	
public 
static 
char 
ToUpper "
(" #
this# '
char( ,
c- .
). /
{ 	
return   
char   
.   
ToUpper   
(    
c    !
)  ! "
;  " #
}!! 	
}"" 
}## �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\System.Char\Char.ToUpperInvariant.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
System4 :
.: ;
Char; ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
char 
ToUpperInvariant +
(+ ,
this, 0
char1 5
c6 7
)7 8
{ 	
return 
char 
. 
ToUpperInvariant (
(( )
c) *
)* +
;+ ,
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\_CoreObject\Char.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
_CoreObject4 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
char
@this
,
params
char
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Char\_CoreObject\Char.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Char/ 3
.3 4
_CoreObject4 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
char
@this
,
params
char
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Collection\System.Collection.Chunks.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /

Collection/ 9
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
List 
< 
List 
<  
T  !
>! "
>" #
	SplitData$ -
<- .
T. /
>/ 0
(0 1
this1 5
List6 :
<: ;
T; <
>< =

collection> H
,H I
intJ M
sizeN R
)R S
{		 	
List

 
<

 
List

 
<

 
T

 
>

 
>

 
chunks

  
=

! "
new

# &
(

& '
)

' (
;

( )
int 

chunkCount 
= 

collection '
.' (
Count( -
/. /
size0 4
;4 5
if
(

collection
.
Count
%
size
>
$num
)
{ 

chunkCount 
++ 
; 
} 
for 
( 
int 
i 
= 
$num 
; 
i 
< 

chunkCount  *
;* +
i, -
++- /
)/ 0
{ 
chunks 
. 
Add 
( 

collection %
.% &
Skip& *
(* +
i+ ,
*- .
size/ 3
)3 4
.4 5
Take5 9
(9 :
size: >
)> ?
.? @
ToList@ F
(F G
)G H
)H I
;I J
} 
return 
chunks 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Collection\System.Collection.Sequence.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /

Collection/ 9
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 

(( )
this) -
List. 2
<2 3
int3 6
>6 7
ints8 <
)< =
{		 	
if
(
ints
.
Count
>
$num
)
{ 
int 
start 
= 
ints  
.  !
First! &
(& '
)' (
;( )
return 
! 
ints 
. 
Where "
(" #
(# $
x$ %
,% &
i' (
)( )
=>* ,
x- .
!=/ 1
i2 3
+4 5
start6 ;
); <
.< =
Any= @
(@ A
)A B
;B C
} 
else 
return 
false 
; 
} 	
} 
} �I
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Database\System.Database.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Database/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{		 
public 
static 
Tuple 
< 
bool  
,  !
List" &
<& '
string' -
>- .
,. /
List0 4
<4 5
T5 6
>6 7
>7 8
DataTableToList9 H
<H I
TI J
>J K
(K L
thisL P
	DataTableQ Z
table[ `
,` a
stringb h
configValuei t
,t u
charv z
	separator	{ �
)
� �
where
� �
T
� �
:
� �
class
� �
,
� �
new
� �
(
� �
)
� �
{ 	
try 
{ 
T 
tempT 
= 
new 
( 
) 
;  
Type 
tType 
= 
tempT "
." #
GetType# *
(* +
)+ ,
;, -
List 
< 
T 
> 
dataList  
=! "
new# &
(& '
)' (
;( )
Tuple 
< 
bool 
, 
List  
<  !
string! '
>' (
,( )
List* .
<. /
T/ 0
>0 1
>1 2&
dataTableWithErrorMessages3 M
;M N
List 
< 
string 
> 
inValidColumns +
=, -
new. 1
(1 2
)2 3
;3 4
List 
< 
string 
> 
missingColumns +
=, -
new. 1
(1 2
)2 3
;3 4
var 
dataTblFieldNames %
=& '
(( )
from) -

DataColumn. 8
aHeader9 @
inA C
tableD I
.I J
ColumnsJ Q
select) /
new0 3
{) *
Name- 1
=2 3
aHeader4 ;
.; <

ColumnName< F
.F G
ReplaceG N
(N O
$strO R
,R S
$strT V
)V W
,W X
Type  - 1
=  2 3
aHeader  4 ;
.  ; <
DataType  < D
,  D E
}!!) *
)!!* +
.!!+ ,
ToList!!, 2
(!!2 3
)!!3 4
;!!4 5
List"" 
<"" 
string"" 
>"" 
configValues"" )
=""* +
configValue"", 7
.""7 8
Split""8 =
(""= >
	separator""> G
)""G H
.""H I
ToList""I O
(""O P
)""P Q
;""Q R
missingColumns## 
=##  
configValues##! -
.##- .
Except##. 4
(##4 5
dataTblFieldNames##5 F
.##F G
Select##G M
(##M N
f##N O
=>##P R
f##S T
.##T U
Name##U Y
)##Y Z
)##Z [
.##[ \
ToList##\ b
(##b c
)##c d
;##d e
inValidColumns$$ 
=$$  
dataTblFieldNames$$! 2
.$$2 3
Select$$3 9
($$9 :
f$$: ;
=>$$< >
f$$? @
.$$@ A
Name$$A E
)$$E F
.$$F G
Except$$G M
($$M N
configValues$$N Z
)$$Z [
.$$[ \
ToList$$\ b
($$b c
)$$c d
;$$d e
if%% 
(%% 
inValidColumns%% "
.%%" #
Count%%# (
==%%) +
$num%%, -
&&%%. 0
missingColumns%%1 ?
.%%? @
Count%%@ E
==%%F H
$num%%I J
)%%J K
{&& 
foreach'' 
('' 

DataColumn'' '
col''( +
in'', .
table''/ 4
.''4 5
Columns''5 <
)''< =
{(( 
col)) 
.)) 

ColumnName)) &
=))' (
col))) ,
.)), -

ColumnName))- 7
.))7 8
Replace))8 ?
())? @
$str))@ C
,))C D
$str))E G
)))G H
;))H I
}** 
foreach,, 
(,, 
DataRow,, $
row,,% (
in,,) +
table,,, 1
.,,1 2
Rows,,2 6
.,,6 7
Cast,,7 ;
<,,; <
DataRow,,< C
>,,C D
(,,D E
),,E F
),,F G
{-- 
T.. 
	tableData.. #
=..$ %
new..& )
(..) *
)..* +
;..+ ,
foreach// 
(//  !
global//! '
:://' )
System//) /
./// 0

Reflection//0 :
.//: ;
PropertyInfo//; G
prop//H L
in//M O
	tableData//P Y
.//Y Z
GetType//Z a
(//a b
)//b c
.//c d

(//q r
)//r s
)//s t
{00 
if11 
(11  
row11  #
.11# $
Table11$ )
.11) *
Columns11* 1
.111 2
Contains112 :
(11: ;
prop11; ?
.11? @
Name11@ D
)11D E
)11E F
{22 
global33  &
::33& (
System33( .
.33. /

Reflection33/ 9
.339 :
PropertyInfo33: F
propertyInfo33G S
=33T U
tType33V [
.33[ \
GetProperty33\ g
(33g h
prop33h l
.33l m
Name33m q
)33q r
;33r s
object44  &
rowValue44' /
=440 1
row442 5
[445 6
prop446 :
.44: ;
Name44; ?
]44? @
;44@ A
Type55  $
t55% &
=55' (
Nullable55) 1
.551 2
GetUnderlyingType552 C
(55C D
propertyInfo55D P
.55P Q
PropertyType55Q ]
)55] ^
??55_ a
propertyInfo55b n
.55n o
PropertyType55o {
;55{ |
try66  #
{77  !
object88$ *
	safeValue88+ 4
=885 6
(887 8
rowValue888 @
==88A C
null88D H
||88I K
DBNull88L R
.88R S
Value88S X
.88X Y
Equals88Y _
(88_ `
rowValue88` h
)88h i
)88i j
?88k l
null88m q
:88r s
Convert88t {
.88{ |

ChangeType	88| �
(
88� �
rowValue
88� �
,
88� �
t
88� �
)
88� �
;
88� �
propertyInfo99$ 0
.990 1
SetValue991 9
(999 :
	tableData99: C
,99C D
	safeValue99E N
,99N O
null99P T
)99T U
;99U V
}::  !
catch;;  %
(;;& '
	Exception;;' 0
ex;;1 3
);;3 4
{<<  !
throw==$ )
ex==* ,
;==, -
}>>  !
}?? 
}@@ 
dataListBB  
.BB  !
AddBB! $
(BB$ %
	tableDataBB% .
)BB. /
;BB/ 0
}CC &
dataTableWithErrorMessagesEE .
=EE/ 0
TupleEE1 6
.EE6 7
CreateEE7 =
(EE= >
trueEE> B
,EEB C
inValidColumnsEED R
,EER S
dataListEET \
)EE\ ]
;EE] ^
}FF 
elseGG 
{HH 
inValidColumnsII "
=II# $
inValidColumnsII% 3
.II3 4
SelectII4 :
(II: ;
xII; <
=>II= ?
{II@ A
xIIB C
+=IID F
$strIIG [
;II[ \
returnII] c
xIId e
;IIe f
}IIg h
)IIh i
.IIi j
ToListIIj p
(IIp q
)IIq r
;IIr s
missingColumnsJJ "
=JJ# $
missingColumnsJJ% 3
.JJ3 4
SelectJJ4 :
(JJ: ;
xJJ; <
=>JJ= ?
{JJ@ A
xJJB C
+=JJD F
$strJJG [
;JJ[ \
returnJJ] c
xJJd e
;JJe f
}JJg h
)JJh i
.JJi j
ToListJJj p
(JJp q
)JJq r
;JJr s
inValidColumnsKK "
.KK" #
AddRangeKK# +
(KK+ ,
missingColumnsKK, :
)KK: ;
;KK; <&
dataTableWithErrorMessagesLL .
=LL/ 0
TupleLL1 6
.LL6 7
CreateLL7 =
(LL= >
falseLL> C
,LLC D
inValidColumnsLLE S
,LLS T
dataListLLU ]
)LL] ^
;LL^ _
}MM 
returnOO &
dataTableWithErrorMessagesOO 1
;OO1 2
}PP 
catchQQ 
{RR 
returnSS 
nullSS 
;SS 
}TT 
}UU 	
}VV 
}WW �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTimeOffset\DateTimeOffset.SetTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTimeOffset/ =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3
SetTime4 ;
(; <
this< @
globalA G
::G I
SystemI O
.O P
DateTimeOffsetP ^
current_ f
,f g
inth k
hourl p
)p q
{ 	
return
SetTime
(
current
,
hour
,
$num
,
$num
,
$num
)
;
} 	
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3
SetTime4 ;
(; <
this< @
globalA G
::G I
SystemI O
.O P
DateTimeOffsetP ^
current_ f
,f g
inth k
hourl p
,p q
intr u
minutev |
)| }
{ 	
return 
SetTime 
( 
current "
," #
hour$ (
,( )
minute* 0
,0 1
$num2 3
,3 4
$num5 6
)6 7
;7 8
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
DateTimeOffset$$% 3
SetTime$$4 ;
($$; <
this$$< @
global$$A G
::$$G I
System$$I O
.$$O P
DateTimeOffset$$P ^
current$$_ f
,$$f g
int$$h k
hour$$l p
,$$p q
int$$r u
minute$$v |
,$$| }
int	$$~ �
second
$$� �
)
$$� �
{%% 	
return&& 
SetTime&& 
(&& 
current&& "
,&&" #
hour&&$ (
,&&( )
minute&&* 0
,&&0 1
second&&2 8
,&&8 9
$num&&: ;
)&&; <
;&&< =
}'' 	
public22 
static22 
global22 
::22 
System22 $
.22$ %
DateTimeOffset22% 3
SetTime224 ;
(22; <
this22< @
global22A G
::22G I
System22I O
.22O P
DateTimeOffset22P ^
current22_ f
,22f g
int22h k
hour22l p
,22p q
int22r u
minute22v |
,22| }
int	22~ �
second
22� �
,
22� �
int
22� �
millisecond
22� �
)
22� �
{33 	
return44 
new44 
global44 
::44 
System44 %
.44% &
DateTime44& .
(44. /
current44/ 6
.446 7
Year447 ;
,44; <
current44= D
.44D E
Month44E J
,44J K
current44L S
.44S T
Day44T W
,44W X
hour44Y ]
,44] ^
minute44_ e
,44e f
second44g m
,44m n
millisecond44o z
)44z {
;44{ |
}55 	
}66 
}77 �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTimeOffset\System.TimeZoneInfo\DateTimeOffset.ConvertTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTimeOffset/ =
.= >
System> D
.D E
TimeZoneInfoE Q
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3
ConvertTime4 ?
(? @
this@ D
globalE K
::K M
SystemM S
.S T
DateTimeOffsetT b
dateTimeOffsetc q
,q r
globals y
::y {
System	{ �
.
� �
TimeZoneInfo
� �!
destinationTimeZone
� �
)
� �
{ 	
return
global
::
System
.
TimeZoneInfo
.
ConvertTime
(
dateTimeOffset
,
destinationTimeZone
)
;
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTimeOffset\System.TimeZoneInfo\DateTimeOffset.ConvertTimeBySystemTimeZoneId.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTimeOffset/ =
.= >
System> D
.D E
TimeZoneInfoE Q
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3)
ConvertTimeBySystemTimeZoneId4 Q
(Q R
thisR V
globalW ]
::] _
System_ e
.e f
DateTimeOffsetf t
dateTimeOffset	u �
,
� �
string
� �#
destinationTimeZoneId
� �
)
� �
{ 	
return
global
::
System
.
TimeZoneInfo
.
ConvertTimeBySystemTimeZoneId
(
dateTimeOffset
,
destinationTimeZoneId
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTimeOffset\_CoreObject\DateTimeOffset.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTimeOffset/ =
.= >
_CoreObject> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
global( .
::. 0
System0 6
.6 7
DateTimeOffset7 E
@thisF K
,K L
globalM S
::S U
SystemU [
.[ \
DateTimeOffset\ j
minValuek s
,s t
globalu {
::{ }
System	} �
.
� �
DateTimeOffset
� �
maxValue
� �
)
� �
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTimeOffset\_CoreObject\DateTimeOffset.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTimeOffset/ =
.= >
_CoreObject> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
global
::
System
.
DateTimeOffset
@this
,
params
global
::
System
.
DateTimeOffset
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTimeOffset\_CoreObject\DateTimeOffset.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTimeOffset/ =
.= >
_CoreObject> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
global( .
::. 0
System0 6
.6 7
DateTimeOffset7 E
@thisF K
,K L
globalM S
::S U
SystemU [
.[ \
DateTimeOffset\ j
minValuek s
,s t
globalu {
::{ }
System	} �
.
� �
DateTimeOffset
� �
maxValue
� �
)
� �
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTimeOffset\_CoreObject\DateTimeOffset.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTimeOffset/ =
.= >
_CoreObject> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
global
::
System
.
DateTimeOffset
@this
,
params
global
::
System
.
DateTimeOffset
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.Age.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 
Age

 
(

 
this

 "
global

# )
::

) +
System

+ 1
.

1 2
DateTime

2 :
@this

; @
)

@ A
{ 	
if 
( 
global 
:: 
System 
. 
DateTime '
.' (
Today( -
.- .
Month. 3
<4 5
@this6 ;
.; <
Month< A
||B D
global
::
System
.
DateTime
.
Today
.
Month
==
@this
.
Month
&&
global 
:: 
System 
. 
DateTime '
.' (
Today( -
.- .
Day. 1
<2 3
@this4 9
.9 :
Day: =
)= >
{ 
return 
global 
:: 
System %
.% &
DateTime& .
.. /
Today/ 4
.4 5
Year5 9
-: ;
@this< A
.A B
YearB F
-G H
$numI J
;J K
} 
return 
global 
:: 
System !
.! "
DateTime" *
.* +
Today+ 0
.0 1
Year1 5
-6 7
@this8 =
.= >
Year> B
;B C
} 	
} 
} �%
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.Ago.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
Ago

  
(

  !
this

! %
global

& ,
::

, .
System

. 4
.

4 5
DateTime

5 =
@this

> C
)

C D
{ 	
var 
timeSpan 
= 
global !
::! #
System# )
.) *
DateTime* 2
.2 3
Now3 6
.6 7
Subtract7 ?
(? @
@this@ E
)E F
;F G
string 
result 
; 
if 
( 
timeSpan 
<= 
global "
::" $
System$ *
.* +
TimeSpan+ 3
.3 4
FromSeconds4 ?
(? @
$num@ B
)B C
)C D
{ 
result 
= 
string 
.  
Format  &
(& '
$str' 8
,8 9
timeSpan: B
.B C
SecondsC J
)J K
;K L
} 
else 
if 
( 
timeSpan 
<=  
global! '
::' )
System) /
./ 0
TimeSpan0 8
.8 9
FromMinutes9 D
(D E
$numE G
)G H
)H I
{ 
result 
= 
timeSpan !
.! "
Minutes" )
>* +
$num, -
?. /
string 
. 
Format !
(! "
$str" 9
,9 :
timeSpan; C
.C D
MinutesD K
)K L
:M N
$str (
;( )
} 
else 
if 
( 
timeSpan 
<=  
global! '
::' )
System) /
./ 0
TimeSpan0 8
.8 9
	FromHours9 B
(B C
$numC E
)E F
)F G
{ 
result 
= 
timeSpan !
.! "
Hours" '
>( )
$num* +
?, -
string 
. 
Format !
(! "
$str" 7
,7 8
timeSpan9 A
.A B
HoursB G
)G H
:I J
$str '
;' (
} 
else 
if 
( 
timeSpan 
<=  
global! '
::' )
System) /
./ 0
TimeSpan0 8
.8 9
FromDays9 A
(A B
$numB D
)D E
)E F
{   
result!! 
=!! 
timeSpan!! !
.!!! "
Days!!" &
>!!' (
$num!!) *
?!!+ ,
string"" 
."" 
Format"" !
(""! "
$str""" 6
,""6 7
timeSpan""8 @
.""@ A
Days""A E
)""E F
:""G H
$str## 
;##  
}$$ 
else%% 
if%% 
(%% 
timeSpan%% 
<=%%  
global%%! '
::%%' )
System%%) /
.%%/ 0
TimeSpan%%0 8
.%%8 9
FromDays%%9 A
(%%A B
$num%%B E
)%%E F
)%%F G
{&& 
result'' 
='' 
timeSpan'' !
.''! "
Days''" &
>''' (
$num'') +
?'', -
string(( 
.(( 
Format(( !
(((! "
$str((" 8
,((8 9
timeSpan((: B
.((B C
Days((C G
/((H I
$num((J L
)((L M
:((N O
$str)) '
;))' (
}** 
else++ 
{,, 
result-- 
=-- 
timeSpan-- !
.--! "
Days--" &
>--' (
$num--) ,
?--- .
string.. 
... 
Format.. !
(..! "
$str.." 7
,..7 8
timeSpan..9 A
...A B
Days..B F
/..G H
$num..I L
)..L M
:..N O
$str// &
;//& '
}00 
return22 
result22 
;22 
}44 	
}55 
}66 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.Elapsed.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Elapsed

. 5
(

5 6
this

6 :
global

; A
::

A C
System

C I
.

I J
DateTime

J R
datetime

S [
)

[ \
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +
Now+ .
-/ 0
datetime1 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.EndOfDay.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
EndOfDay. 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
DateTimeK S
@thisT Y
)Y Z
{ 	
return
new
global
::
System
.
DateTime
(
@this
.
Year
,
@this
.
Month
,
@this
.
Day
)
.
AddDays
(
$num
)
.
Subtract
(
new
global
::
System
.
TimeSpan	
(

$num

,

$num

,

$num

,

$num

,

$num

)

)

;

} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.EndOfMonth.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -

EndOfMonth. 8
(8 9
this9 =
global> D
::D F
SystemF L
.L M
DateTimeM U
@thisV [
)[ \
{
return 
new 
global 
:: 
System %
.% &
DateTime& .
(. /
@this/ 4
.4 5
Year5 9
,9 :
@this; @
.@ A
MonthA F
,F G
$numH I
)I J
.J K
	AddMonthsK T
(T U
$numU V
)V W
.W X
SubtractX `
(` a
newa d
globale k
::k m
Systemm s
.s t
TimeSpant |
(| }
$num} ~
,~ 
$num
� �
,
� �
$num
� �
,
� �
$num
� �
,
� �
$num
� �
)
� �
)
� �
;
� �
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.EndOfWeek.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
DateTime
	EndOfWeek
(
this
global
::
System
.
DateTime
dt
,
	DayOfWeek
startDayOfWeek
=
	DayOfWeek
.
Sunday	
)

{ 	
global 
:: 
System 
. 
DateTime #
end$ '
=( )
dt* ,
;, -
	DayOfWeek 
endDayOfWeek "
=# $
startDayOfWeek% 3
-4 5
$num6 7
;7 8
if 
( 
endDayOfWeek 
< 
$num  
)  !
{ 
endDayOfWeek 
= 
	DayOfWeek (
.( )
Saturday) 1
;1 2
} 
if 
( 
end 
. 
	DayOfWeek 
!=  
endDayOfWeek! -
)- .
{ 
if 
( 
endDayOfWeek  
<! "
end# &
.& '
	DayOfWeek' 0
)0 1
{ 
end 
= 
end 
. 
AddDays %
(% &
$num& '
-( )
(* +
end+ .
.. /
	DayOfWeek/ 8
-9 :
endDayOfWeek; G
)G H
)H I
;I J
} 
else 
{ 
end 
= 
end 
. 
AddDays %
(% &
endDayOfWeek& 2
-3 4
end5 8
.8 9
	DayOfWeek9 B
)B C
;C D
} 
}   
return"" 
new"" 
global"" 
::"" 
System"" %
.""% &
DateTime""& .
("". /
end""/ 2
.""2 3
Year""3 7
,""7 8
end""9 <
.""< =
Month""= B
,""B C
end""D G
.""G H
Day""H K
,""K L
$num""M O
,""O P
$num""Q S
,""S T
$num""U W
,""W X
$num""Y \
)""\ ]
;""] ^
}## 	
}$$ 
}%% �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.EndOfYear.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
	EndOfYear. 7
(7 8
this8 <
global= C
::C E
SystemE K
.K L
DateTimeL T
@thisU Z
)Z [
{
return 
new 
global 
:: 
System %
.% &
DateTime& .
(. /
@this/ 4
.4 5
Year5 9
,9 :
$num; <
,< =
$num> ?
)? @
.@ A
AddYearsA I
(I J
$numJ K
)K L
.L M
SubtractM U
(U V
newV Y
globalZ `
::` b
Systemb h
.h i
TimeSpani q
(q r
$numr s
,s t
$numu v
,v w
$numx y
,y z
$num{ |
,| }
$num~ 
)	 �
)
� �
;
� �
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.FinancialYear.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToFinancialYear ,
(, -
this- 1
global2 8
::8 :
System: @
.@ A
DateTimeA I
dateTimeJ R
)R S
{ 	
return		 
$str		 $
+		% &
(		' (
dateTime		( 0
.		0 1
Month		1 6
>=		7 9
$num		: ;
?		< =
dateTime		> F
.		F G
Year		G K
+		L M
$num		N O
:		P Q
dateTime		R Z
.		Z [
Year		[ _
)		_ `
;		` a
}

 	
public 
static 
string  
ToFinancialYearShort 1
(1 2
this2 6
global7 =
::= ?
System? E
.E F
DateTimeF N
dateTimeO W
)W X
{
return 
$str 
+ 
( 
dateTime #
.# $
Month$ )
>=* ,
$num- .
?/ 0
dateTime1 9
.9 :
AddYears: B
(B C
$numC D
)D E
.E F
ToStringF N
(N O
$strO S
)S T
:U V
dateTimeW _
._ `
ToString` h
(h i
$stri m
)m n
)n o
;o p
} 	
public 
static 
string 
ToFinancialYearLong 0
(0 1
this1 5
global6 <
::< >
System> D
.D E
DateTimeE M
dateTimeN V
)V W
{ 	
int 
finacialStartYear !
;! "
int 
finacialEndYear 
;  
finacialStartYear 
= 
dateTime  (
.( )
Month) .
</ 0
$num1 2
?3 4
dateTime5 =
.= >
Year> B
-C D
$numE F
:G H
dateTimeI Q
.Q R
YearR V
;V W
finacialEndYear 
= 
dateTime &
.& '
Month' ,
>=- /
$num0 1
?2 3
dateTime4 <
.< =
AddYears= E
(E F
$numF G
)G H
.H I
YearI M
:N O
dateTimeP X
.X Y
YearY ]
;] ^

sbFinancialYear )
=* +
new, /
(/ 0
)0 1
;1 2
sbFinancialYear 
. 
AppendFormat (
(( )
$str) 2
,2 3
finacialStartYear4 E
.E F
ToStringF N
(N O
$strO S
)S T
,T U
finacialEndYearV e
.e f
ToStringf n
(n o
$stro s
)s t
)t u
;u v
return 
sbFinancialYear "
." #
ToString# +
(+ ,
), -
;- .
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.FirstDayOfWeek.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -
FirstDayOfWeek

. <
(

< =
this

= A
global

B H
::

H J
System

J P
.

P Q
DateTime

Q Y
@this

Z _
)

_ `
{ 	
return 
new 
global 
:: 
System %
.% &
DateTime& .
(. /
@this/ 4
.4 5
Year5 9
,9 :
@this; @
.@ A
MonthA F
,F G
@thisH M
.M N
DayN Q
)Q R
.R S
AddDaysS Z
(Z [
-[ \
(\ ]
int] `
)` a
@thisa f
.f g
	DayOfWeekg p
)p q
;q r
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.GetDateRage.cs
	namespace 	
Phoenix
 
. 
CrossCutting 
. 
	Extension (
.( )
System) /
./ 0
DateTime0 8
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
IEnumerable !
<! "
global" (
::( *
System* 0
.0 1
DateTime1 9
>9 :
GetDateRange; G
(G H
thisH L
globalM S
::S U
SystemU [
.[ \
DateTime\ d

@startDatee o
,o p
globalq w
::w y
Systemy 
.	 �
DateTime
� �
endDate
� �
)
� �
{		 	
if

 
(

 
endDate

 
<

 

@startDate

 $
)

$ %
throw 
new 
ArgumentException +
(+ ,
$str, `
)` a
;a b
while
(

@startDate
<=
endDate
)
{ 
yield 
return 
	startDate &
;& '
	startDate 
= 
	startDate %
.% &
AddDays& -
(- .
$num. /
)/ 0
;0 1
} 
} 	
} 
} �A
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.GetFriendlyRelativeTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
private 
const 
int 
Second  
=! "
$num# $
;$ %
private 
const 
int 
Minute  
=! "
$num# %
*& '
Second( .
;. /
private		 
const		 
int		 
Hour		 
=		  
$num		! #
*		$ %
Minute		& ,
;		, -
private

 
const

 
int

 
Day

 
=

 
$num

  "
*

# $
Hour

% )
;

) *
private 
const 
int 
Month 
=  !
$num" $
*% &
Day' *
;* +
public 
static 
string #
GetFriendlyRelativeTime 4
(4 5
this5 9
global: @
::@ B
SystemB H
.H I
DateTimeI Q
dateTimeR Z
)Z [
{ 	
if 
( 
global 
:: 
System 
. 
DateTime '
.' (
Now( +
.+ ,
Ticks, 1
==2 4
dateTime5 =
.= >
Ticks> C
)C D
{ 
return 
$str #
;# $
} 
bool 
isFuture 
= 
global "
::" $
System$ *
.* +
DateTime+ 3
.3 4
Now4 7
.7 8
Ticks8 =
<> ?
dateTime@ H
.H I
TicksI N
;N O
global 
:: 
System 
. 
TimeSpan #
ts$ &
=' (
global) /
::/ 1
System1 7
.7 8
DateTime8 @
.@ A
NowA D
.D E
TicksE J
<K L
dateTimeM U
.U V
TicksV [
?\ ]
new^ a
globalb h
::h j
Systemj p
.p q
TimeSpanq y
(y z
dateTime	z �
.
� �
Ticks
� �
-
� �
global
� �
::
� �
System
� �
.
� �
DateTime
� �
.
� �
Now
� �
.
� �
Ticks
� �
)
� �
:
� �
new
� �
global
� �
::
� �
System
� �
.
� �
TimeSpan
� �
(
� �
global
� �
::
� �
System
� �
.
� �
DateTime
� �
.
� �
Now
� �
.
� �
Ticks
� �
-
� �
dateTime
� �
.
� �
Ticks
� �
)
� �
;
� �
double 
delta 
= 
ts 
. 
TotalSeconds *
;* +
if 
( 
delta 
< 
$num 
* 
Minute "
)" #
{ 
return   
isFuture   
?    !
$str  " '
+  ( )
(  * +
ts  + -
.  - .
Seconds  . 5
==  6 8
$num  9 :
?  ; <
$str  = I
:  J K
ts  L N
.  N O
Seconds  O V
+  W X
$str  Y c
)  c d
:  e f
ts  g i
.  i j
Seconds  j q
==  r t
$num  u v
?  w x
$str	  y �
:
  � �
ts
  � �
.
  � �
Seconds
  � �
+
  � �
$str
  � �
;
  � �
}!! 
if## 
(## 
delta## 
<## 
$num## 
*## 
Minute## "
)##" #
{$$ 
return%% 
isFuture%% 
?%%  !
$str%%" /
:%%0 1
$str%%2 @
;%%@ A
}&& 
if(( 
((( 
delta(( 
<(( 
$num(( 
*(( 
Minute(( #
)((# $
{)) 
return** 
isFuture** 
?**  !
$str**" '
+**( )
ts*** ,
.**, -
Minutes**- 4
+**5 6
$str**7 A
:**B C
ts**D F
.**F G
Minutes**G N
+**O P
$str**Q _
;**_ `
}++ 
if-- 
(-- 
delta-- 
<-- 
$num-- 
*-- 
Minute-- #
)--# $
{.. 
return// 
isFuture// 
?//  !
$str//" .
:/// 0
$str//1 >
;//> ?
}00 
if22 
(22 
delta22 
<22 
$num22 
*22 
Hour22 !
)22! "
{33 
return44 
isFuture44 
?44  !
$str44" '
+44( )
ts44* ,
.44, -
Hours44- 2
+443 4
$str445 =
:44> ?
ts44@ B
.44B C
Hours44C H
+44I J
$str44K W
;44W X
}55 
if77 
(77 
delta77 
<77 
$num77 
*77 
Hour77 !
)77! "
{88 
return99 
isFuture99 
?99  !
$str99" ,
:99- .
$str99/ :
;99: ;
}:: 
if<< 
(<< 
delta<< 
<<< 
$num<< 
*<< 
Day<<  
)<<  !
{== 
return>> 
isFuture>> 
?>>  !
$str>>" '
+>>( )
ts>>* ,
.>>, -
Days>>- 1
+>>2 3
$str>>4 ;
:>>< =
ts>>> @
.>>@ A
Days>>A E
+>>F G
$str>>H S
;>>S T
}?? 
ifAA 
(AA 
deltaAA 
<AA 
$numAA 
*AA 
MonthAA "
)AA" #
{BB 
intCC 
monthsCC 
=CC 
ConvertCC $
.CC$ %
ToInt32CC% ,
(CC, -
MathCC- 1
.CC1 2
FloorCC2 7
(CC7 8
(CC8 9
doubleCC9 ?
)CC? @
tsCC@ B
.CCB C
DaysCCC G
/CCH I
$numCCJ L
)CCL M
)CCM N
;CCN O
returnDD 
isFutureDD 
?DD  !
$strDD" '
+DD( )
(DD* +
monthsDD+ 1
<=DD2 4
$numDD5 6
?DD7 8
$strDD9 D
:DDE F
monthsDDG M
+DDN O
$strDDP Y
)DDY Z
:DD[ \
monthsDD] c
<=DDd f
$numDDg h
?DDi j
$strDDk z
:DD{ |
months	DD} �
+
DD� �
$str
DD� �
;
DD� �
}EE 
elseFF 
{GG 
intHH 
yearsHH 
=HH 
ConvertHH #
.HH# $
ToInt32HH$ +
(HH+ ,
MathHH, 0
.HH0 1
FloorHH1 6
(HH6 7
(HH7 8
doubleHH8 >
)HH> ?
tsHH? A
.HHA B
DaysHHB F
/HHG H
$numHHI L
)HHL M
)HHM N
;HHN O
returnII 
isFutureII 
?II  !
$strII" '
+II( )
(II* +
yearsII+ 0
<=II1 3
$numII4 5
?II6 7
$strII8 B
:IIC D
yearsIIE J
+IIK L
$strIIM U
)IIU V
:IIW X
yearsIIY ^
<=II_ a
$numIIb c
?IId e
$strIIf t
:IIu v
yearsIIw |
+II} ~
$str	II �
;
II� �
}JJ 
}KK 	
}LL 
}MM �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsAfternoon.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsAfternoon

 &
(

& '
this

' +
global

, 2
::

2 4
System

4 :
.

: ;
DateTime

; C
@this

D I
)

I J
{ 	
return 
@this 
. 
	TimeOfDay "
>=# %
new& )
global* 0
::0 2
System2 8
.8 9
DateTime9 A
(A B
$numB F
,F G
$numH I
,I J
$numK L
,L M
$numN P
,P Q
$numR S
,S T
$numU V
)V W
.W X
	TimeOfDayX a
;a b
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsDateEqual.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsDateEqual &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
DateTime; C
dateD H
,H I
globalJ P
::P R
SystemR X
.X Y
DateTimeY a

)o p
{ 	
return
date
.
Date
==

.
Date
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsFuture.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsFuture

 #
(

# $
this

$ (
global

) /
::

/ 1
System

1 7
.

7 8
DateTime

8 @
@this

A F
)

F G
{ 	
return 
@this 
> 
global !
::! #
System# )
.) *
DateTime* 2
.2 3
Now3 6
;6 7
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsMorning.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
	IsMorning

 $
(

$ %
this

% )
global

* 0
::

0 2
System

2 8
.

8 9
DateTime

9 A
@this

B G
)

G H
{ 	
return 
@this 
. 
	TimeOfDay "
<# $
new% (
global) /
::/ 1
System1 7
.7 8
DateTime8 @
(@ A
$numA E
,E F
$numG H
,H I
$numJ K
,K L
$numM O
,O P
$numQ R
,R S
$numT U
)U V
.V W
	TimeOfDayW `
;` a
}
} 
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsNow.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNow

  
(

  !
this

! %
global

& ,
::

, .
System

. 4
.

4 5
DateTime

5 =
@this

> C
)

C D
{ 	
return 
@this 
== 
global "
::" $
System$ *
.* +
DateTime+ 3
.3 4
Now4 7
;7 8
}
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsPast.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsPast

 !
(

! "
this

" &
global

' -
::

- /
System

/ 5
.

5 6
DateTime

6 >
@this

? D
)

D E
{ 	
return 
@this 
< 
global !
::! #
System# )
.) *
DateTime* 2
.2 3
Now3 6
;6 7
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsTimeEqual.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsTimeEqual &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
DateTime; C
timeD H
,H I
globalJ P
::P R
SystemR X
.X Y
DateTimeY a

)o p
{ 	
return
time
.
	TimeOfDay
==

.
	TimeOfDay
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsToday.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsToday

 "
(

" #
this

# '
global

( .
::

. 0
System

0 6
.

6 7
DateTime

7 ?
@this

@ E
)

E F
{ 	
return 
@this 
. 
Date 
==  
global! '
::' )
System) /
./ 0
DateTime0 8
.8 9
Today9 >
;> ?
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsWeekDay.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
	IsWeekDay $
($ %
this% )
global* 0
::0 2
System2 8
.8 9
DateTime9 A
@thisB G
)G H
{
return 
! 
( 
@this 
. 
	DayOfWeek $
==% '
	DayOfWeek( 1
.1 2
Saturday2 :
||; =
@this> C
.C D
	DayOfWeekD M
==N P
	DayOfWeekQ Z
.Z [
Sunday[ a
)a b
;b c
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.IsWeekendDay.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsWeekendDay '
(' (
this( ,
global- 3
::3 5
System5 ;
.; <
DateTime< D
@thisE J
)J K
{
return 
@this 
. 
	DayOfWeek "
==# %
	DayOfWeek& /
./ 0
Saturday0 8
||9 ;
@this< A
.A B
	DayOfWeekB K
==L N
	DayOfWeekO X
.X Y
SundayY _
;_ `
} 	
public 
static 
bool 
IsSingleWeekEnd *
(* +
this+ /
global0 6
::6 8
System8 >
.> ?
DateTime? G
@thisH M
)M N
{ 	
return 
@this 
. 
	DayOfWeek "
==# %
	DayOfWeek& /
./ 0
Sunday0 6
;6 7
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.LastDayOfWeek.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -


. ;
(

; <
this

< @
global

A G
::

G I
System

I O
.

O P
DateTime

P X
@this

Y ^
)

^ _
{ 	
return 
new 
global 
:: 
System %
.% &
DateTime& .
(. /
@this/ 4
.4 5
Year5 9
,9 :
@this; @
.@ A
MonthA F
,F G
@thisH M
.M N
DayN Q
)Q R
.R S
AddDaysS Z
(Z [
$num[ \
-] ^
(_ `
int` c
)c d
@thisd i
.i j
	DayOfWeekj s
)s t
;t u
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.SetTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
SetTime. 5
(5 6
this6 :
global; A
::A C
SystemC I
.I J
DateTimeJ R
currentS Z
,Z [
int\ _
hour` d
)d e
{ 	
return
SetTime
(
current
,
hour
,
$num
,
$num
,
$num
)
;
} 	
public 
static 
global 
:: 
System $
.$ %
DateTime% -
SetTime. 5
(5 6
this6 :
global; A
::A C
SystemC I
.I J
DateTimeJ R
currentS Z
,Z [
int\ _
hour` d
,d e
intf i
minutej p
)p q
{ 	
return 
SetTime 
( 
current "
," #
hour$ (
,( )
minute* 0
,0 1
$num2 3
,3 4
$num5 6
)6 7
;7 8
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
DateTime$$% -
SetTime$$. 5
($$5 6
this$$6 :
global$$; A
::$$A C
System$$C I
.$$I J
DateTime$$J R
current$$S Z
,$$Z [
int$$\ _
hour$$` d
,$$d e
int$$f i
minute$$j p
,$$p q
int$$r u
second$$v |
)$$| }
{%% 	
return&& 
SetTime&& 
(&& 
current&& "
,&&" #
hour&&$ (
,&&( )
minute&&* 0
,&&0 1
second&&2 8
,&&8 9
$num&&: ;
)&&; <
;&&< =
}'' 	
public22 
static22 
global22 
::22 
System22 $
.22$ %
DateTime22% -
SetTime22. 5
(225 6
this226 :
global22; A
::22A C
System22C I
.22I J
DateTime22J R
current22S Z
,22Z [
int22\ _
hour22` d
,22d e
int22f i
minute22j p
,22p q
int22r u
second22v |
,22| }
int	22~ �
millisecond
22� �
)
22� �
{33 	
return44 
new44 
global44 
::44 
System44 %
.44% &
DateTime44& .
(44. /
current44/ 6
.446 7
Year447 ;
,44; <
current44= D
.44D E
Month44E J
,44J K
current44L S
.44S T
Day44T W
,44W X
hour44Y ]
,44] ^
minute44_ e
,44e f
second44g m
,44m n
millisecond44o z
)44z {
;44{ |
}55 	
}66 
}77 �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.StartOfDay.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -

StartOfDay. 8
(8 9
this9 =
global> D
::D F
SystemF L
.L M
DateTimeM U
@thisV [
)[ \
{ 	
return
new
global
::
System
.
DateTime
(
@this
.
Year
,
@this
.
Month
,
@this
.
Day
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.StartOfMonth.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
StartOfMonth. :
(: ;
this; ?
global@ F
::F H
SystemH N
.N O
DateTimeO W
@thisX ]
)] ^
{ 	
return
new
global
::
System
.
DateTime
(
@this
.
Year
,
@this
.
Month
,
$num
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.StartOfWeek.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
DateTime
StartOfWeek
(
this
global
::
System
.
DateTime
dt
,
	DayOfWeek
startDayOfWeek
=
	DayOfWeek
.	
Sunday

)

{ 	
global 
:: 
System 
. 
DateTime #
start$ )
=* +
new, /
(/ 0
dt0 2
.2 3
Year3 7
,7 8
dt9 ;
.; <
Month< A
,A B
dtC E
.E F
DayF I
)I J
;J K
if 
( 
start 
. 
	DayOfWeek 
!=  "
startDayOfWeek# 1
)1 2
{ 
int 
d 
= 
startDayOfWeek &
-' (
start) .
.. /
	DayOfWeek/ 8
;8 9
if 
( 
startDayOfWeek "
<=# %
start& +
.+ ,
	DayOfWeek, 5
)5 6
{ 
return 
start  
.  !
AddDays! (
(( )
d) *
)* +
;+ ,
} 
return 
start 
. 
AddDays $
($ %
-% &
$num& '
+( )
d* +
)+ ,
;, -
} 
return 
start 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.StartOfYear.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
StartOfYear. 9
(9 :
this: >
global? E
::E G
SystemG M
.M N
DateTimeN V
@thisW \
)\ ]
{ 	
return
new
global
::
System
.
DateTime
(
@this
.
Year
,
$num
,
$num
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.ToEpochTimeSpan.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
ToEpochTimeSpan

. =
(

= >
this

> B
global

C I
::

I K
System

K Q
.

Q R
DateTime

R Z
@this

[ `
)

` a
{ 	
return 
@this 
. 
Subtract !
(! "
new" %
global& ,
::, .
System. 4
.4 5
DateTime5 =
(= >
$num> B
,B C
$numD E
,E F
$numG H
)H I
)I J
;J K
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.Tomorrow.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -
Tomorrow

. 6
(

6 7
this

7 ;
global

< B
::

B D
System

D J
.

J K
DateTime

K S
@this

T Y
)

Y Z
{ 	
return 
@this 
. 
AddDays  
(  !
$num! "
)" #
;# $
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.ToOracleDate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
ToOracleDate. :
(: ;
this; ?
global@ F
::F H
SystemH N
.N O
DateTimeO W
@thisX ]
)] ^
{
string 
datetimeInString #
=$ %
@this& +
.+ ,
ToString, 4
(4 5
$str5 J
)J K
;K L
return 
Convert 
. 

ToDateTime %
(% &
datetimeInString& 6
)6 7
;7 8
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\DateTime.Yesterday.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -
	Yesterday

. 7
(

7 8
this

8 <
global

= C
::

C E
System

E K
.

K L
DateTime

L T
@this

U Z
)

Z [
{ 	
return 
@this 
. 
AddDays  
(  !
-! "
$num" #
)# $
;$ %
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\System.TimeZoneInfo\DateTime.ConvertTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
System8 >
.> ?
TimeZoneInfo? K
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
ConvertTime. 9
(9 :
this: >
global? E
::E G
SystemG M
.M N
DateTimeN V
dateTimeW _
,_ `
globala g
::g i
Systemi o
.o p
TimeZoneInfop | 
destinationTimeZone	} �
)
� �
{ 	
return
global
::
System
.
TimeZoneInfo
.
ConvertTime
(
dateTime
,
destinationTimeZone
)
;
} 	
public 
static 
global 
:: 
System $
.$ %
DateTime% -
ConvertTime. 9
(9 :
this: >
global? E
::E G
SystemG M
.M N
DateTimeN V
dateTimeW _
,_ `
globala g
::g i
Systemi o
.o p
TimeZoneInfop |
sourceTimeZone	} �
,
� �
global
� �
::
� �
System
� �
.
� �
TimeZoneInfo
� �!
destinationTimeZone
� �
)
� �
{ 	
return 
global 
:: 
System !
.! "
TimeZoneInfo" .
.. /
ConvertTime/ :
(: ;
dateTime; C
,C D
sourceTimeZoneE S
,S T
destinationTimeZoneU h
)h i
;i j
} 	
public(( 
static(( 
global(( 
::(( 
System(( $
.(($ %
DateTime((% -
ConvertTime((. 9
(((9 :
this((: >
global((? E
::((E G
System((G M
.((M N
DateTime((N V
dateTime((W _
,((_ `
string((a g
targetTimeZone((h v
)((v w
{)) 	
global** 
::** 
System** 
.** 
TimeZoneInfo** '
destinationTimeZone**( ;
=**< =
global**> D
::**D F
System**F L
.**L M
TimeZoneInfo**M Y
.**Y Z"
FindSystemTimeZoneById**Z p
(**p q
targetTimeZone**q 
)	** �
;
**� �
return,, 
global,, 
::,, 
System,, !
.,,! "
TimeZoneInfo,," .
.,,. /
ConvertTime,,/ :
(,,: ;
dateTime,,; C
,,,C D
destinationTimeZone,,E X
),,X Y
;,,Y Z
}-- 	
}// 
}00 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\System.TimeZoneInfo\DateTime.ConvertTimeBySystemTimeZoneId.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
System8 >
.> ?
TimeZoneInfo? K
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -)
ConvertTimeBySystemTimeZoneId. K
(K L
thisL P
globalQ W
::W Y
SystemY _
._ `
DateTime` h
dateTimei q
,q r
strings y"
destinationTimeZoneId	z �
)
� �
{ 	
return
global
::
System
.
TimeZoneInfo
.
ConvertTimeBySystemTimeZoneId
(
dateTime
,
destinationTimeZoneId
)
;
} 	
public 
static 
global 
:: 
System $
.$ %
DateTime% -)
ConvertTimeBySystemTimeZoneId. K
(K L
thisL P
globalQ W
::W Y
SystemY _
._ `
DateTime` h
dateTimei q
,q r
strings y
sourceTimeZoneId	z �
,
� �
string
� �#
destinationTimeZoneId
� �
)
� �
{ 	
return 
global 
:: 
System !
.! "
TimeZoneInfo" .
.. /)
ConvertTimeBySystemTimeZoneId/ L
(L M
dateTimeM U
,U V
sourceTimeZoneIdW g
,g h!
destinationTimeZoneIdi ~
)~ 
;	 �
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\System.TimeZoneInfo\DateTime.ConvertTimeFromUtc.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
System8 >
.> ?
TimeZoneInfo? K
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
DateTime
ConvertTimeFromUtc
(
this
global
::
System
.
DateTime
dateTime
,
global
::
System
.
TimeZoneInfo	
destinationTimeZone

)

{ 	
return 
global 
:: 
System !
.! "
TimeZoneInfo" .
.. /
ConvertTimeFromUtc/ A
(A B
dateTimeB J
,J K
destinationTimeZoneL _
)_ `
;` a
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\System.TimeZoneInfo\DateTime.ConvertTimeToUtc.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
System8 >
.> ?
TimeZoneInfo? K
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
DateTime
ConvertTimeToUtc
(
this
global
::
System
.
DateTime
dateTime
)
{ 	
return 
global 
:: 
System !
.! "
TimeZoneInfo" .
.. /
ConvertTimeToUtc/ ?
(? @
dateTime@ H
)H I
;I J
} 	
public 
static 
global 
:: 
System $
.$ %
DateTime% -
ConvertTimeToUtc. >
(> ?
this? C
globalD J
::J L
SystemL R
.R S
DateTimeS [
dateTime\ d
,d e
globalf l
::l n
Systemn t
.t u
TimeZoneInfo	u �
sourceTimeZone
� �
)
� �
{ 	
return 
global 
:: 
System !
.! "
TimeZoneInfo" .
.. /
ConvertTimeToUtc/ ?
(? @
dateTime@ H
,H I
sourceTimeZoneJ X
)X Y
;Y Z
} 	
} 
}   �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\System.TimeZone\DateTime.IsDaylightSavingTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
System8 >
.> ?
TimeZone? G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool  
IsDaylightSavingTime /
(/ 0
this0 4
global5 ;
::; =
System= C
.C D
DateTimeD L
timeM Q
,Q R
DaylightTimeS _

)m n
{ 	
return 
global 
:: 
System !
.! "
TimeZone" *
.* + 
IsDaylightSavingTime+ ?
(? @
time@ D
,D E

)S T
;T U
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToFullDateTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string  
ToFullDateTimeString 1
(1 2
this2 6
global7 =
::= ?
System? E
.E F
DateTimeF N
@thisO T
)T U
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string  
ToFullDateTimeString 1
(1 2
this2 6
global7 =
::= ?
System? E
.E F
DateTimeF N
@thisO T
,T U
stringV \
culture] d
)d e
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string""  
ToFullDateTimeString"" 1
(""1 2
this""2 6
global""7 =
::""= ?
System""? E
.""E F
DateTime""F N
@this""O T
,""T U
CultureInfo""V a
culture""b i
)""i j
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
public-- 
static-- 
global-- 
::-- 
System-- $
.--$ %
DateTime--% -
?--- .
ToNguideDate--/ ;
(--; <
this--< @
string--A G
@this--H M
)--M N
{.. 	
global// 
::// 
System// 
.// 
DateTime// #
?//# $
date//% )
=//* +
null//, 0
;//0 1
if00 
(00 
!00 
string00 
.00 

(00% &
@this00& +
)00+ ,
)00, -
{11 
date22 
=22 
global22 
::22 
System22 %
.22% &
DateTime22& .
.22. /

ParseExact22/ 9
(229 :
@this22: ?
,22? @
$str22A L
,22L M
global22N T
::22T V
System22V \
.22\ ]

.22j k
CultureInfo22k v
.22v w
InvariantCulture	22w �
)
22� �
;
22� �
}33 
return55 
date55 
;55 
}66 	
}77 
}88 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToLongDateShortTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string %
ToLongDateShortTimeString 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
DateTimeK S
@thisT Y
)Y Z
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string %
ToLongDateShortTimeString 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
DateTimeK S
@thisT Y
,Y Z
string[ a
cultureb i
)i j
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" %
ToLongDateShortTimeString"" 6
(""6 7
this""7 ;
global""< B
::""B D
System""D J
.""J K
DateTime""K S
@this""T Y
,""Y Z
CultureInfo""[ f
culture""g n
)""n o
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToLongDateString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToLongDateString -
(- .
this. 2
global3 9
::9 ;
System; A
.A B
DateTimeB J
@thisK P
)P Q
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 
ToLongDateString -
(- .
this. 2
global3 9
::9 ;
System; A
.A B
DateTimeB J
@thisK P
,P Q
stringR X
cultureY `
)` a
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 
ToLongDateString"" -
(""- .
this"". 2
global""3 9
::""9 ;
System""; A
.""A B
DateTime""B J
@this""K P
,""P Q
CultureInfo""R ]
culture""^ e
)""e f
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToLongDateTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string  
ToLongDateTimeString 1
(1 2
this2 6
global7 =
::= ?
System? E
.E F
DateTimeF N
@thisO T
)T U
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string  
ToLongDateTimeString 1
(1 2
this2 6
global7 =
::= ?
System? E
.E F
DateTimeF N
@thisO T
,T U
stringV \
culture] d
)d e
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string""  
ToLongDateTimeString"" 1
(""1 2
this""2 6
global""7 =
::""= ?
System""? E
.""E F
DateTime""F N
@this""O T
,""T U
CultureInfo""V a
culture""b i
)""i j
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToLongTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToLongTimeString -
(- .
this. 2
global3 9
::9 ;
System; A
.A B
DateTimeB J
@thisK P
)P Q
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 
ToLongTimeString -
(- .
this. 2
global3 9
::9 ;
System; A
.A B
DateTimeB J
@thisK P
,P Q
stringR X
cultureY `
)` a
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 
ToLongTimeString"" -
(""- .
this"". 2
global""3 9
::""9 ;
System""; A
.""A B
DateTime""B J
@this""K P
,""P Q
CultureInfo""R ]
culture""^ e
)""e f
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToMonthDayString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToMonthDayString -
(- .
this. 2
global3 9
::9 ;
System; A
.A B
DateTimeB J
@thisK P
)P Q
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 
ToMonthDayString -
(- .
this. 2
global3 9
::9 ;
System; A
.A B
DateTimeB J
@thisK P
,P Q
stringR X
cultureY `
)` a
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 
ToMonthDayString"" -
(""- .
this"". 2
global""3 9
::""9 ;
System""; A
.""A B
DateTime""B J
@this""K P
,""P Q
CultureInfo""R ]
culture""^ e
)""e f
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToRFC1123String.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToRFC1123String ,
(, -
this- 1
global2 8
::8 :
System: @
.@ A
DateTimeA I
@thisJ O
)O P
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 
ToRFC1123String ,
(, -
this- 1
global2 8
::8 :
System: @
.@ A
DateTimeA I
@thisJ O
,O P
stringQ W
cultureX _
)_ `
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 
ToRFC1123String"" ,
("", -
this""- 1
global""2 8
::""8 :
System"": @
.""@ A
DateTime""A I
@this""J O
,""O P
CultureInfo""Q \
culture""] d
)""d e
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToShortDateLongTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string %
ToShortDateLongTimeString 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
DateTimeK S
@thisT Y
)Y Z
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string %
ToShortDateLongTimeString 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
DateTimeK S
@thisT Y
,Y Z
string[ a
cultureb i
)i j
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" %
ToShortDateLongTimeString"" 6
(""6 7
this""7 ;
global""< B
::""B D
System""D J
.""J K
DateTime""K S
@this""T Y
,""Y Z
CultureInfo""[ f
culture""g n
)""n o
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToShortDateString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToShortDateString .
(. /
this/ 3
global4 :
::: <
System< B
.B C
DateTimeC K
@thisL Q
)Q R
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 
ToShortDateString .
(. /
this/ 3
global4 :
::: <
System< B
.B C
DateTimeC K
@thisL Q
,Q R
stringS Y
cultureZ a
)a b
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 
ToShortDateString"" .
("". /
this""/ 3
global""4 :
::"": <
System""< B
.""B C
DateTime""C K
@this""L Q
,""Q R
CultureInfo""S ^
culture""_ f
)""f g
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToShortDateTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string !
ToShortDateTimeString 2
(2 3
this3 7
global8 >
::> @
System@ F
.F G
DateTimeG O
@thisP U
)U V
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string !
ToShortDateTimeString 2
(2 3
this3 7
global8 >
::> @
System@ F
.F G
DateTimeG O
@thisP U
,U V
stringW ]
culture^ e
)e f
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" !
ToShortDateTimeString"" 2
(""2 3
this""3 7
global""8 >
::""> @
System""@ F
.""F G
DateTime""G O
@this""P U
,""U V
CultureInfo""W b
culture""c j
)""j k
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToShortTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToShortTimeString .
(. /
this/ 3
global4 :
::: <
System< B
.B C
DateTimeC K
@thisL Q
)Q R
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 
ToShortTimeString .
(. /
this/ 3
global4 :
::: <
System< B
.B C
DateTimeC K
@thisL Q
,Q R
stringS Y
cultureZ a
)a b
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 
ToShortTimeString"" .
("". /
this""/ 3
global""4 :
::"": <
System""< B
.""B C
DateTime""C K
@this""L Q
,""Q R
CultureInfo""S ^
culture""_ f
)""f g
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToSortableDateTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string $
ToSortableDateTimeString 5
(5 6
this6 :
global; A
::A C
SystemC I
.I J
DateTimeJ R
@thisS X
)X Y
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string $
ToSortableDateTimeString 5
(5 6
this6 :
global; A
::A C
SystemC I
.I J
DateTimeJ R
@thisS X
,X Y
stringZ `
culturea h
)h i
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" $
ToSortableDateTimeString"" 5
(""5 6
this""6 :
global""; A
::""A C
System""C I
.""I J
DateTime""J R
@this""S X
,""X Y
CultureInfo""Z e
culture""f m
)""m n
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToUniversalSortableDateTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string -
!ToUniversalSortableDateTimeString >
(> ?
this? C
globalD J
::J L
SystemL R
.R S
DateTimeS [
@this\ a
)a b
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string -
!ToUniversalSortableDateTimeString >
(> ?
this? C
globalD J
::J L
SystemL R
.R S
DateTimeS [
@this\ a
,a b
stringc i
culturej q
)q r
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" -
!ToUniversalSortableDateTimeString"" >
(""> ?
this""? C
global""D J
::""J L
System""L R
.""R S
DateTime""S [
@this""\ a
,""a b
CultureInfo""c n
culture""o v
)""v w
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToUniversalSortableLongDateTimeString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 1
%ToUniversalSortableLongDateTimeString B
(B C
thisC G
globalH N
::N P
SystemP V
.V W
DateTimeW _
@this` e
)e f
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 1
%ToUniversalSortableLongDateTimeString B
(B C
thisC G
globalH N
::N P
SystemP V
.V W
DateTimeW _
@this` e
,e f
stringg m
culturen u
)u v
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 1
%ToUniversalSortableLongDateTimeString"" B
(""B C
this""C G
global""H N
::""N P
System""P V
.""V W
DateTime""W _
@this""` e
,""e f
CultureInfo""g r
culture""s z
)""z {
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\ToDateTimeFormat\DateTime.ToYearMonthString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
ToDateTimeFormat8 H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToYearMonthString .
(. /
this/ 3
global4 :
::: <
System< B
.B C
DateTimeC K
@thisL Q
)Q R
{
return 
@this 
. 
ToString !
(! "
$str" %
,% &
DateTimeFormatInfo' 9
.9 :
CurrentInfo: E
)E F
;F G
} 	
public 
static 
string 
ToYearMonthString .
(. /
this/ 3
global4 :
::: <
System< B
.B C
DateTimeC K
@thisL Q
,Q R
stringS Y
cultureZ a
)a b
{ 	
return 
@this 
. 
ToString !
(! "
$str" %
,% &
new' *
CultureInfo+ 6
(6 7
culture7 >
)> ?
)? @
;@ A
} 	
public"" 
static"" 
string"" 
ToYearMonthString"" .
("". /
this""/ 3
global""4 :
::"": <
System""< B
.""B C
DateTime""C K
@this""L Q
,""Q R
CultureInfo""S ^
culture""_ f
)""f g
{## 	
return$$ 
@this$$ 
.$$ 
ToString$$ !
($$! "
$str$$" %
,$$% &
culture$$' .
)$$. /
;$$/ 0
}%% 	
}&& 
}'' �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\_CoreObject\DateTime.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
_CoreObject8 C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
global( .
::. 0
System0 6
.6 7
DateTime7 ?
@this@ E
,E F
globalG M
::M O
SystemO U
.U V
DateTimeV ^
minValue_ g
,g h
globali o
::o q
Systemq w
.w x
DateTime	x �
maxValue
� �
)
� �
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\_CoreObject\DateTime.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
_CoreObject8 C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
global
::
System
.
DateTime
@this
,
params
global
::
System
.
DateTime
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\_CoreObject\DateTime.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
_CoreObject8 C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
global( .
::. 0
System0 6
.6 7
DateTime7 ?
@this@ E
,E F
globalG M
::M O
SystemO U
.U V
DateTimeV ^
minValue_ g
,g h
globali o
::o q
Systemq w
.w x
DateTime	x �
maxValue
� �
)
� �
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.DateTime\_CoreObject\DateTime.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
DateTime/ 7
.7 8
_CoreObject8 C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
global
::
System
.
DateTime
@this
,
params
global
::
System
.
DateTime
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\Decimal.ToMoney.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
ToMoney %
(% &
this& *
decimal+ 2
@this3 8
)8 9
{
return 
Math 
. 
Round 
( 
@this #
,# $
$num% &
)& '
;' (
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.Divide.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Divide $
($ %
this% )
decimal* 1
d12 4
,4 5
decimal6 =
d2> @
)@ A
{ 	
return
decimal
.
Divide
(
d1
,
d2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.GetBits.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 
[

 
]

 
GetBits

 #
(

# $
this

$ (
decimal

) 0
d

1 2
)

2 3
{ 	
return 
decimal 
. 
GetBits "
(" #
d# $
)$ %
;% &
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.Multiply.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Multiply &
(& '
this' +
decimal, 3
d14 6
,6 7
decimal8 ?
d2@ B
)B C
{ 	
return
decimal
.
Multiply
(
d1
,
d2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.Negate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
decimal

 
Negate

 $
(

$ %
this

% )
decimal

* 1
d

2 3
)

3 4
{ 	
return 
decimal 
. 
Negate !
(! "
d" #
)# $
;$ %
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.Remainder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
	Remainder '
(' (
this( ,
decimal- 4
d15 7
,7 8
decimal9 @
d2A C
)C D
{ 	
return
decimal
.
	Remainder
(
d1
,
d2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.Subtract.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Subtract &
(& '
this' +
decimal, 3
d14 6
,6 7
decimal8 ?
d2@ B
)B C
{ 	
return
decimal
.
Subtract
(
d1
,
d2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
byte

 
ToByte

 !
(

! "
this

" &
decimal

' .
value

/ 4
)

4 5
{ 	
return 
decimal 
. 
ToByte !
(! "
value" '
)' (
;( )
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToDouble.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
ToDouble

 %
(

% &
this

& *
decimal

+ 2
d

3 4
)

4 5
{ 	
return 
decimal 
. 
ToDouble #
(# $
d$ %
)% &
;& '
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
short

 
ToInt16

 #
(

# $
this

$ (
decimal

) 0
value

1 6
)

6 7
{ 	
return 
decimal 
. 
ToInt16 "
(" #
value# (
)( )
;) *
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 
ToInt32

 !
(

! "
this

" &
decimal

' .
d

/ 0
)

0 1
{ 	
return 
decimal 
. 
ToInt32 "
(" #
d# $
)$ %
;% &
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
long

 
ToInt64

 "
(

" #
this

# '
decimal

( /
d

0 1
)

1 2
{ 	
return 
decimal 
. 
ToInt64 "
(" #
d# $
)$ %
;% &
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToOACurrency.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
ToOACurrency '
(' (
this( ,
decimal- 4
value5 :
): ;
{ 	
return
decimal
.
ToOACurrency
(
value
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToSByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
sbyte

 
ToSByte

 #
(

# $
this

$ (
decimal

) 0
value

1 6
)

6 7
{ 	
return 
decimal 
. 
ToSByte "
(" #
value# (
)( )
;) *
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToSingle.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
float

 
ToSingle

 $
(

$ %
this

% )
decimal

* 1
d

2 3
)

3 4
{ 	
return 
decimal 
. 
ToSingle #
(# $
d$ %
)% &
;& '
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToUInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
ushort

 
ToUInt16

 %
(

% &
this

& *
decimal

+ 2
value

3 8
)

8 9
{ 	
return 
decimal 
. 
ToUInt16 #
(# $
value$ )
)) *
;* +
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToUInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
uint

 
ToUInt32

 #
(

# $
this

$ (
decimal

) 0
d

1 2
)

2 3
{ 	
return 
decimal 
. 
ToUInt32 #
(# $
d$ %
)% &
;& '
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToUInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
ulong

 
ToUInt64

 $
(

$ %
this

% )
decimal

* 1
d

2 3
)

3 4
{ 	
return 
decimal 
. 
ToUInt64 #
(# $
d$ %
)% &
;& '
}
} 
} �:
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Decimal\Decimal.ToWords.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Decimal> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string "
ConvertCurrencyToWords 3
(3 4
this4 8
decimal9 @
currencyA I
)I J
{ 	
if 
( 
currency 
== 
$num 
) 
return %
$str& 3
;3 4
int		 
rupees		 
=		 
(		 
int		 
)		 
currency		 &
;		& '
int

 
paise

 
=

 
(

 
int

 
)

 
(

 
(

 
currency

 '
-

( )
rupees

* 0
)

0 1
*

2 3
$num

4 7
)

7 8
;

8 9
string 
rupeesWords 
=   
ConvertNumberToWords! 5
(5 6
rupees6 <
)< =
;= >
string

paiseWords
=
ConvertNumberToWords
(
paise
)
;
string 
currencyInWords "
=# $
rupeesWords% 0
+1 2
$str3 ;
+< =
(> ?
rupees? E
==F H
$numI J
?K L
$strM O
:P Q
$strR U
)U V
;V W
if 
( 
paise 
> 
$num 
) 
{ 
currencyInWords 
+=  "
$str# *
++ ,

paiseWords- 7
+8 9
$str: B
;B C
} 
return 
currencyInWords "
;" #
} 	
public 
static 
string  
ConvertNumberToWords 1
(1 2
long2 6
number7 =
)= >
{ 	
if 
( 
number 
== 
$num 
) 
return #
$str$ *
;* +
string 
[ 
] 
ones 
= 
new 
string  &
[& '
]' (
{) *
$str+ -
,- .
$str/ 4
,4 5
$str6 ;
,; <
$str= D
,D E
$strF L
,L M
$strN T
,T U
$strV [
,[ \
$str] d
,d e
$strf m
,m n
$stro u
,u v
$strw |
,| }
$str	~ �
,
� �
$str
� �
,
� �
$str
� �
,
� �
$str
� �
,
� �
$str
� �
,
� �
$str
� �
,
� �
$str
� �
,
� �
$str
� �
,
� �
$str
� �
}
� �
;
� �
string 
[ 
] 
tens 
= 
new 
string  &
[& '
]' (
{) *
$str+ -
,- .
$str/ 1
,1 2
$str3 ;
,; <
$str= E
,E F
$strG O
,O P
$strQ X
,X Y
$strZ a
,a b
$strc l
,l m
$strn v
,v w
$str	x �
}
� �
;
� �
if!! 
(!! 
number!! 
<!! 
$num!! 
)!! 
return"" 
ones"" 
["" 
number"" "
]""" #
;""# $
if$$ 
($$ 
number$$ 
<$$ 
$num$$ 
)$$ 
return%% 
tens%% 
[%% 
number%% "
/%%# $
$num%%% '
]%%' (
+%%) *
(%%+ ,
(%%, -
number%%- 3
%%%4 5
$num%%6 8
>%%9 :
$num%%; <
)%%< =
?%%> ?
$str%%@ C
+%%D E
ones%%F J
[%%J K
number%%K Q
%%%R S
$num%%T V
]%%V W
:%%X Y
$str%%Z \
)%%\ ]
;%%] ^
if'' 
('' 
number'' 
<'' 
$num'' 
)'' 
return(( 
ones(( 
[(( 
number(( "
/((# $
$num((% (
]((( )
+((* +
$str((, 6
+((7 8
(((9 :
(((: ;
number((; A
%((B C
$num((D G
>((H I
$num((J K
)((K L
?((M N
$str((O V
+((W X 
ConvertNumberToWords((Y m
(((m n
number((n t
%((u v
$num((w z
)((z {
:((| }
$str	((~ �
)
((� �
;
((� �
if** 
(** 
number** 
<** 
$num** 
)**  
return++  
ConvertNumberToWords++ +
(+++ ,
number++, 2
/++3 4
$num++5 9
)++9 :
+++; <
$str++= H
+++I J
(++K L
(++L M
number++M S
%++T U
$num++V Z
>++[ \
$num++] ^
)++^ _
?++` a
$str++b f
+++g h 
ConvertNumberToWords++i }
(++} ~
number	++~ �
%
++� �
$num
++� �
)
++� �
:
++� �
$str
++� �
)
++� �
;
++� �
if-- 
(-- 
number-- 
<-- 
$num-- !
)--! "
return..  
ConvertNumberToWords.. +
(..+ ,
number.., 2
/..3 4
$num..5 ;
)..; <
+..= >
$str..? F
+..G H
(..I J
(..J K
number..K Q
%..R S
$num..T Z
>..[ \
$num..] ^
)..^ _
?..` a
$str..b f
+..g h 
ConvertNumberToWords..i }
(..} ~
number	..~ �
%
..� �
$num
..� �
)
..� �
:
..� �
$str
..� �
)
..� �
;
..� �
if00 
(00 
number00 
<00 
$num00 #
)00# $
return11  
ConvertNumberToWords11 +
(11+ ,
number11, 2
/113 4
$num115 =
)11= >
+11? @
$str11A I
+11J K
(11L M
(11M N
number11N T
%11U V
$num11W _
>11` a
$num11b c
)11c d
?11e f
$str11g k
+11l m!
ConvertNumberToWords	11n �
(
11� �
number
11� �
%
11� �
$num
11� �
)
11� �
:
11� �
$str
11� �
)
11� �
;
11� �
return33 
$str33 
;33 
}44 	
}55 
}66 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Abs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
decimal

 
Abs

 !
(

! "
this

" &
decimal

' .
value

/ 4
)

4 5
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Abs' *
(* +
value+ 0
)0 1
;1 2
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Ceiling.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
decimal
Ceiling
(
this
decimal
d
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Ceiling' .
(. /
d/ 0
)0 1
;1 2
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Floor.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Floor #
(# $
this$ (
decimal) 0
d1 2
)2 3
{
return 
global 
:: 
System !
.! "
Math" &
.& '
Floor' ,
(, -
d- .
). /
;/ 0
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Max !
(! "
this" &
decimal' .
val1/ 3
,3 4
decimal5 <
val2= A
)A B
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Min !
(! "
this" &
decimal' .
val1/ 3
,3 4
decimal5 <
val2= A
)A B
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Round.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Round #
(# $
this$ (
decimal) 0
d1 2
)2 3
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Round' ,
(, -
d- .
). /
;/ 0
} 	
public 
static 
decimal 
Round #
(# $
this$ (
decimal) 0
d1 2
,2 3
int4 7
decimals8 @
)@ A
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Round' ,
(, -
d- .
,. /
decimals0 8
)8 9
;9 :
} 	
public** 
static** 
decimal** 
Round** #
(**# $
this**$ (
decimal**) 0
d**1 2
,**2 3
MidpointRounding**4 D
mode**E I
)**I J
{++ 	
return,, 
global,, 
::,, 
System,, !
.,,! "
Math,," &
.,,& '
Round,,' ,
(,,, -
d,,- .
,,,. /
mode,,0 4
),,4 5
;,,5 6
}-- 	
public:: 
static:: 
decimal:: 
Round:: #
(::# $
this::$ (
decimal::) 0
d::1 2
,::2 3
int::4 7
decimals::8 @
,::@ A
MidpointRounding::B R
mode::S W
)::W X
{;; 	
return<< 
global<< 
::<< 
System<< !
.<<! "
Math<<" &
.<<& '
Round<<' ,
(<<, -
d<<- .
,<<. /
decimals<<0 8
,<<8 9
mode<<: >
)<<> ?
;<<? @
}== 	
}>> 
}?? �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Sign.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
Sign
(
this
decimal
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sign' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\System.Math\Decimal.Truncate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
System7 =
.= >
Math> B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
Truncate &
(& '
this' +
decimal, 3
d4 5
)5 6
{
return 
global 
:: 
System !
.! "
Math" &
.& '
Truncate' /
(/ 0
d0 1
)1 2
;2 3
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\_CoreObject\Decimal.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
_CoreObject7 B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
decimal( /
@this0 5
,5 6
decimal7 >
minValue? G
,G H
decimalI P
maxValueQ Y
)Y Z
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\_CoreObject\Decimal.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
_CoreObject7 B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
decimal
@this
,
params
decimal
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\_CoreObject\Decimal.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
_CoreObject7 B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
decimal( /
@this0 5
,5 6
decimal7 >
minValue? G
,G H
decimalI P
maxValueQ Y
)Y Z
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Decimal\_CoreObject\Decimal.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Decimal/ 6
.6 7
_CoreObject7 B
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
decimal
@this
,
params
decimal
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Delegate\System.Delegate\Delegate.Combine.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Delegate/ 7
.7 8
System8 >
.> ?
Delegate? G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Delegate% -
Combine. 5
(5 6
this6 :
global; A
::A C
SystemC I
.I J
DelegateJ R
aS T
,T U
globalV \
::\ ^
System^ d
.d e
Delegatee m
bn o
)o p
{ 	
return 
global 
:: 
System !
.! "
Delegate" *
.* +
Combine+ 2
(2 3
a3 4
,4 5
b6 7
)7 8
;8 9
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Delegate\System.Delegate\Delegate.Remove.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Delegate/ 7
.7 8
System8 >
.> ?
Delegate? G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Delegate% -
Remove. 4
(4 5
this5 9
global: @
::@ B
SystemB H
.H I
DelegateI Q
sourceR X
,X Y
globalZ `
::` b
Systemb h
.h i
Delegatei q
valuer w
)w x
{ 	
return 
global 
:: 
System !
.! "
Delegate" *
.* +
Remove+ 1
(1 2
source2 8
,8 9
value: ?
)? @
;@ A
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Delegate\System.Delegate\Delegate.RemoveAll.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Delegate/ 7
.7 8
System8 >
.> ?
Delegate? G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Delegate% -
	RemoveAll. 7
(7 8
this8 <
global= C
::C E
SystemE K
.K L
DelegateL T
sourceU [
,[ \
global] c
::c e
Systeme k
.k l
Delegatel t
valueu z
)z {
{ 	
return 
global 
:: 
System !
.! "
Delegate" *
.* +
	RemoveAll+ 4
(4 5
source5 ;
,; <
value= B
)B C
;C D
} 	
} 
} �B
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\Double.ToIndianRupees.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
ToIndianRupees
(
this
double
@this
)
{ 	
string 
words 
= 

(( )
@this) .
). /
;/ 0
return 
words 
; 
} 	
private 
static 
string 

(+ ,
double, 2
amount3 9
)9 :
{ 	
long 

amount_int 
= 
( 
long #
)# $
amount$ *
;* +
long 

amount_dec 
= 
( 
long #
)# $
Math$ (
.( )
Round) .
(. /
(/ 0
amount0 6
-7 8
(9 :
double: @
)@ A
(A B

amount_intB L
)L M
)M N
*O P
$numQ T
)T U
;U V

sbWords !
;! "
if 
( 

amount_dec 
== 
$num 
)  
{ 
sbWords 
= 
new 

(+ ,
), -
;- .
sbWords 
= 
sbWords !
.! "
AppendFormat" .
(. /
$str/ 9
,9 :
ConvertToRupees; J
(J K

amount_intK U
)U V
)V W
;W X
return 
sbWords 
. 
ToString '
(' (
)( )
;) *
} 
else 
{ 
sbWords   
=   
new   

(  + ,
)  , -
;  - .
sbWords!! 
=!! 
sbWords!! !
.!!! "
AppendFormat!!" .
(!!. /
$str!!/ A
,!!A B
ConvertToRupees!!C R
(!!R S

amount_int!!S ]
)!!] ^
,!!^ _
ConvertToRupees!!` o
(!!o p

amount_dec!!p z
)!!z {
)!!{ |
;!!| }
return"" 
sbWords"" 
."" 
ToString"" '
(""' (
)""( )
;"") *
}## 
}$$ 	
private&& 
static&& 
string&& 
ConvertToRupees&& -
(&&- .
long&&. 2
amount&&3 9
)&&9 :
{'' 	
if(( 
((( 
amount(( 
<(( 
$num(( 
)(( 
{)) 
return** 
units** 
[** 
amount** #
]**# $
;**$ %
}++ 
if,, 
(,, 
amount,, 
<,, 
$num,, 
),, 
{-- 
return.. 
tens.. 
[.. 
amount.. "
/..# $
$num..% '
]..' (
+..) *
(..+ ,
(.., -
amount..- 3
%..4 5
$num..6 8
>..9 :
$num..; <
)..< =
?..> ?
$str..@ C
+..D E
ConvertToRupees..F U
(..U V
amount..V \
%..] ^
$num.._ a
)..a b
:..c d
$str..e g
)..g h
;..h i
}// 
if00 
(00 
amount00 
<00 
$num00 
)00 
{11 
return22 
units22 
[22 
amount22 #
/22$ %
$num22& )
]22) *
+22+ ,
$str22- 7
+33 
(33 
(33 
amount33 "
%33# $
$num33% (
>33) *
$num33+ ,
)33, -
?33. /
$str330 7
+338 9
ConvertToRupees33: I
(33I J
amount33J P
%33Q R
$num33S V
)33V W
:33X Y
$str33Z \
)33\ ]
;33] ^
}44 
if55 
(55 
amount55 
<55 
$num55 
)55  
{66 
return77 
ConvertToRupees77 &
(77& '
amount77' -
/77. /
$num770 4
)774 5
+776 7
$str778 D
+88 
(88 
(88 
amount88 
%88 
$num88 !
>88" #
$num88$ %
)88% &
?88' (
$str88) ,
+88- .
ConvertToRupees88/ >
(88> ?
amount88? E
%88F G
$num88H L
)88L M
:88N O
$str88P R
)88R S
;88S T
}99 
if:: 
(:: 
amount:: 
<:: 
$num:: !
)::! "
{;; 
return<< 
ConvertToRupees<< &
(<<& '
amount<<' -
/<<. /
$num<<0 6
)<<6 7
+<<8 9
$str<<: B
+== 
(== 
(== 
amount== "
%==# $
$num==% +
>==, -
$num==. /
)==/ 0
?==1 2
$str==3 6
+==7 8
ConvertToRupees==9 H
(==H I
amount==I O
%==P Q
$num==R X
)==X Y
:==Z [
$str==\ ^
)==^ _
;==_ `
}>> 
if?? 
(?? 
amount?? 
<?? 
$num?? #
)??# $
{@@ 
returnAA 
ConvertToRupeesAA &
(AA& '
amountAA' -
/AA. /
$numAA0 8
)AA8 9
+AA: ;
$strAA< E
+BB 
(BB 
(BB 
amountBB "
%BB# $
$numBB% -
>BB. /
$numBB0 1
)BB1 2
?BB3 4
$strBB5 8
+BB9 :
ConvertToRupeesBB; J
(BBJ K
amountBBK Q
%BBR S
$numBBT \
)BB\ ]
:BB^ _
$strBB` b
)BBb c
;BBc d
}CC 
returnDD 
ConvertToRupeesDD "
(DD" #
amountDD# )
/DD* +
$numDD, 6
)DD6 7
+DD8 9
$strDD: B
+EE 
(EE 
(EE 
amountEE 
%EE  
$numEE! +
>EE, -
$numEE. /
)EE/ 0
?EE1 2
$strEE3 6
+EE7 8
ConvertToRupeesEE9 H
(EEH I
amountEEI O
%EEP Q
$numEER \
)EE\ ]
:EE^ _
$strEE` b
)EEb c
;EEc d
}FF 	
privateHH 
staticHH 
stringHH 
[HH 
]HH 
unitsHH  %
=HH& '
{HH( )
$strHH* 0
,HH0 1
$strHH2 7
,HH7 8
$strHH9 >
,HH> ?
$strHH@ G
,HHG H
$strII 
,II 
$strII 
,II 
$strII 
,II 
$strII &
,II& '
$strII( /
,II/ 0
$strII1 7
,II7 8
$strII9 >
,II> ?
$strII@ H
,IIH I
$strJJ 
,JJ 
$strJJ 
,JJ 
$strJJ (
,JJ( )
$strJJ* 3
,JJ3 4
$strJJ5 >
,JJ> ?
$strKK 
,KK 
$strKK 
,KK  
$strKK! +
}KK, -
;KK- .
privateNN 
staticNN 
stringNN 
[NN 
]NN 
tensNN  $
=NN% &
{NN' (
$strNN) +
,NN+ ,
$strNN- /
,NN/ 0
$strNN1 9
,NN9 :
$strNN; C
,NNC D
$strNNE L
,NNL M
$strOO 
,OO 
$strOO 
,OO 
$strOO #
,OO# $
$strOO% -
,OO- .
$strOO/ 7
}OO8 9
;OO9 :
}PP 
}QQ �
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\Double.ToMoney.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
ToMoney $
($ %
this% )
double* 0
@this1 6
)6 7
{
return 
Math 
. 
Round 
( 
@this #
,# $
$num% &
)& '
;' (
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.DateTime\Double.FromOADate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
DateTime= E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -

FromOADate

. 8
(

8 9
this

9 =
double

> D
d

E F
)

F G
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +

FromOADate+ 5
(5 6
d6 7
)7 8
;8 9
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Double\Double.IsInfinity.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Double= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 

IsInfinity

 %
(

% &
this

& *
double

+ 1
d

2 3
)

3 4
{ 	
return 
double 
. 

IsInfinity $
($ %
d% &
)& '
;' (
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Double\Double.IsNaN.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Double= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNaN

  
(

  !
this

! %
double

& ,
d

- .
)

. /
{ 	
return 
double 
. 
IsNaN 
(  
d  !
)! "
;" #
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Double\Double.IsNegativeInfinity.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Double= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNegativeInfinity

 -
(

- .
this

. 2
double

3 9
d

: ;
)

; <
{ 	
return 
double 
. 
IsNegativeInfinity ,
(, -
d- .
). /
;/ 0
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Double\Double.IsPositiveInfinity.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Double= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsPositiveInfinity

 -
(

- .
this

. 2
double

3 9
d

: ;
)

; <
{ 	
return 
double 
. 
IsPositiveInfinity ,
(, -
d- .
). /
;/ 0
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Abs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Abs

  
(

  !
this

! %
double

& ,
value

- 2
)

2 3
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Abs' *
(* +
value+ 0
)0 1
;1 2
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Acos.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double
Acos
(
this
double
d
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Acos' +
(+ ,
d, -
)- .
;. /
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Asin.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Asin !
(! "
this" &
double' -
d. /
)/ 0
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Asin' +
(+ ,
d, -
)- .
;. /
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Atan.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double
Atan
(
this
double
d
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Atan' +
(+ ,
d, -
)- .
;. /
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Atan2.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Atan2 "
(" #
this# '
double( .
y/ 0
,0 1
double2 8
x9 :
): ;
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Atan2' ,
(, -
y- .
,. /
x0 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Ceiling.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Ceiling $
($ %
this% )
double* 0
a1 2
)2 3
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Ceiling' .
(. /
a/ 0
)0 1
;1 2
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Cos.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Cos

  
(

  !
this

! %
double

& ,
d

- .
)

. /
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Cos' *
(* +
d+ ,
), -
;- .
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Cosh.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Cosh

 !
(

! "
this

" &
double

' -
value

. 3
)

3 4
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Cosh' +
(+ ,
value, 1
)1 2
;2 3
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Exp.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Exp  
(  !
this! %
double& ,
d- .
). /
{
return 
global 
:: 
System !
.! "
Math" &
.& '
Exp' *
(* +
d+ ,
), -
;- .
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Floor.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Floor

 "
(

" #
this

# '
double

( .
d

/ 0
)

0 1
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Floor' ,
(, -
d- .
). /
;/ 0
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.IEEERemainder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 

(* +
this+ /
double0 6
x7 8
,8 9
double: @
yA B
)B C
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '

(4 5
x5 6
,6 7
y8 9
)9 :
;: ;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Log.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double
Log
(
this
double
d
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Log' *
(* +
d+ ,
), -
;- .
} 	
public 
static 
double 
Log  
(  !
this! %
double& ,
d- .
,. /
double0 6
newBase7 >
)> ?
{   	
return!! 
global!! 
::!! 
System!! !
.!!! "
Math!!" &
.!!& '
Log!!' *
(!!* +
d!!+ ,
,!!, -
newBase!!. 5
)!!5 6
;!!6 7
}"" 	
}## 
}$$ �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Log10.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double
Log10
(
this
double
d
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Log10' ,
(, -
d- .
). /
;/ 0
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Max  
(  !
this! %
double& ,
val1- 1
,1 2
double3 9
val2: >
)> ?
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Min  
(  !
this! %
double& ,
val1- 1
,1 2
double3 9
val2: >
)> ?
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Pow.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Pow  
(  !
this! %
double& ,
x- .
,. /
double0 6
y7 8
)8 9
{ 	
return
global
::
System
.
Math
.
Pow
(
x
,
y
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Round.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
Round "
(" #
this# '
double( .
a/ 0
)0 1
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Round' ,
(, -
a- .
). /
;/ 0
} 	
public 
static 
double 
Round "
(" #
this# '
double( .
a/ 0
,0 1
int2 5
digits6 <
)< =
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Round' ,
(, -
a- .
,. /
digits0 6
)6 7
;7 8
}   	
public.. 
static.. 
double.. 
Round.. "
(.." #
this..# '
double..( .
a../ 0
,..0 1
MidpointRounding..2 B
mode..C G
)..G H
{// 	
return00 
global00 
::00 
System00 !
.00! "
Math00" &
.00& '
Round00' ,
(00, -
a00- .
,00. /
mode000 4
)004 5
;005 6
}11 	
public@@ 
static@@ 
double@@ 
Round@@ "
(@@" #
this@@# '
double@@( .
a@@/ 0
,@@0 1
int@@2 5
digits@@6 <
,@@< =
MidpointRounding@@> N
mode@@O S
)@@S T
{AA 	
returnBB 
globalBB 
::BB 
SystemBB !
.BB! "
MathBB" &
.BB& '
RoundBB' ,
(BB, -
aBB- .
,BB. /
digitsBB0 6
,BB6 7
modeBB8 <
)BB< =
;BB= >
}CC 	
}DD 
}EE �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Sign.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
Sign
(
this
double
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sign' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Sin.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Sin

  
(

  !
this

! %
double

& ,
a

- .
)

. /
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sin' *
(* +
a+ ,
), -
;- .
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Sinh.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Sinh

 !
(

! "
this

" &
double

' -
value

. 3
)

3 4
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sinh' +
(+ ,
value, 1
)1 2
;2 3
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Sqrt.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double
Sqrt
(
this
double
d
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sqrt' +
(+ ,
d, -
)- .
;. /
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Tan.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Tan

  
(

  !
this

! %
double

& ,
a

- .
)

. /
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Tan' *
(* +
a+ ,
), -
;- .
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Tanh.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double
Tanh
(
this
double
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Tanh' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.Math\Double.Truncate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double
Truncate
(
this
double
d
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Truncate' /
(/ 0
d0 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.TimeSpan\Double.FromDays.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
TimeSpan= E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
TimeSpan% -
FromDays. 6
(6 7
this7 ;
double< B
valueC H
)H I
{ 	
return
global
::
System
.
TimeSpan
.
FromDays
(
value
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.TimeSpan\Double.FromHours.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
TimeSpan= E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
TimeSpan% -
	FromHours. 7
(7 8
this8 <
double= C
valueD I
)I J
{ 	
return
global
::
System
.
TimeSpan
.
	FromHours
(
value
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.TimeSpan\Double.FromMilliseconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
TimeSpan= E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
FromMilliseconds

. >
(

> ?
this

? C
double

D J
value

K P
)

P Q
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromMilliseconds+ ;
(; <
value< A
)A B
;B C
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.TimeSpan\Double.FromMinutes.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
TimeSpan= E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
TimeSpan% -
FromMinutes. 9
(9 :
this: >
double? E
valueF K
)K L
{ 	
return
global
::
System
.
TimeSpan
.
FromMinutes
(
value
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\System.TimeSpan\Double.FromSeconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
System6 <
.< =
TimeSpan= E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
TimeSpan% -
FromSeconds. 9
(9 :
this: >
double? E
valueF K
)K L
{ 	
return
global
::
System
.
TimeSpan
.
FromSeconds
(
value
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\_CoreObject\Double.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
double( .
@this/ 4
,4 5
double6 <
minValue= E
,E F
doubleG M
maxValueN V
)V W
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\_CoreObject\Double.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
double
@this
,
params
double
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\_CoreObject\Double.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
double( .
@this/ 4
,4 5
double6 <
minValue= E
,E F
doubleG M
maxValueN V
)V W
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Double\_CoreObject\Double.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Double/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
double
@this
,
params
double
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Enum\Enum.GetCustomAttributeDescription.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Enum/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string )
GetCustomAttributeDescription :
(: ;
this; ?
global@ F
::F H
SystemH N
.N O
EnumO S
valueT Y
)Y Z
{
var 
type 
= 
value 
. 
GetType $
($ %
)% &
;& '
var 
name 
= 
global 
:: 
System %
.% &
Enum& *
.* +
GetName+ 2
(2 3
type3 7
,7 8
value9 >
)> ?
;? @
var 

attribute1 
= 
type !
.! "
GetField" *
(* +
name+ /
)/ 0
.0 1
CustomAttributes1 A
.A B
FirstOrDefaultB P
(P Q
)Q R
;R S
string 
description 
=  

attribute1! +
.+ , 
ConstructorArguments, @
.@ A
FirstOrDefaultA O
(O P
)P Q
.Q R
ValueR W
.W X
ToStringX `
(` a
)a b
;b c
return 
description 
; 
} 	
} 
} �	
sF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Enum\Enum.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Enum/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
In 
( 
this "
global# )
::) +
System+ 1
.1 2
Enum2 6
@this7 <
,< =
params> D
globalE K
::K M
SystemM S
.S T
EnumT X
[X Y
]Y Z
values[ a
)a b
{ 	
return
global
::
System
.
Array
.
IndexOf
(
values
,
@this
)
!=
-
$num
;
} 	
} 
} �	
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Enum\Enum.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Enum/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
NotIn  
(  !
this! %
global& ,
::, .
System. 4
.4 5
Enum5 9
@this: ?
,? @
paramsA G
globalH N
::N P
SystemP V
.V W
EnumW [
[[ \
]\ ]
values^ d
)d e
{ 	
return
global
::
System
.
Array
.
IndexOf
(
values
,
@this
)
==
-
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Environment\SpecialFolder.GetFolderPath.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Environment/ :
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 

(* +
this+ /
global0 6
::6 8
System8 >
.> ?
Environment? J
.J K

@thisY ^
)^ _
{		 	
return

 
global

 
::

 
System

 !
.

! "
Environment

" -
.

- .


. ;
(

; <
@this

< A
)

A B
;

B C
} 	
public 
static 
string 

(* +
this+ /
global0 6
::6 8
System8 >
.> ?
Environment? J
.J K

@thisY ^
,^ _
global` f
::f h
Systemh n
.n o
Environmento z
.z { 
SpecialFolderOption	{ �
option
� �
)
� �
{ 	
return 
global 
:: 
System !
.! "
Environment" -
.- .

(; <
@this< A
,A B
optionC I
)I J
;J K
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.EventHandler\EventHandler.RaiseEvent.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
EventHandler/ ;
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 

RaiseEvent %
(% &
this& *
global+ 1
::1 3
System3 9
.9 :
EventHandler: F
@thisG L
,L M
objectN T
senderU [
)[ \
{
@this 
? 
. 
Invoke 
( 
sender  
,  !
null" &
)& '
;' (
} 	
public 
static 
void 
Raise  
(  !
this! %
global& ,
::, .
System. 4
.4 5
EventHandler5 A
handlerB I
,I J
objectK Q
senderR X
,X Y
	EventArgsZ c
ed e
)e f
{ 	
handler 
? 
. 
Invoke 
( 
sender "
," #
e$ %
)% &
;& '
} 	
public"" 
static"" 
void"" 

RaiseEvent"" %
<""% &

TEventArgs""& 0
>""0 1
(""1 2
this""2 6
EventHandler""7 C
<""C D

TEventArgs""D N
>""N O
@this""P U
,""U V
object""W ]
sender""^ d
)""d e
where""f k

TEventArgs""l v
:""w x
	EventArgs	""y �
{## 	
@this$$ 
?$$ 
.$$ 
Invoke$$ 
($$ 
sender$$  
,$$  !
	Activator$$" +
.$$+ ,
CreateInstance$$, :
<$$: ;

TEventArgs$$; E
>$$E F
($$F G
)$$G H
)$$H I
;$$I J
}%% 	
public.. 
static.. 
void.. 

RaiseEvent.. %
<..% &

TEventArgs..& 0
>..0 1
(..1 2
this..2 6
EventHandler..7 C
<..C D

TEventArgs..D N
>..N O
@this..P U
,..U V
object..W ]
sender..^ d
,..d e

TEventArgs..f p
e..q r
)..r s
where..t y

TEventArgs	..z �
:
..� �
	EventArgs
..� �
{// 	
@this00 
?00 
.00 
Invoke00 
(00 
sender00  
,00  !
e00" #
)00# $
;00$ %
}11 	
}22 
}33 �
xF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Guid\Guid.IsEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Guid/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsEmpty "
(" #
this# '
global( .
::. 0
System0 6
.6 7
Guid7 ;
@this< A
)A B
{		 	
return

 
@this

 
==

 
global

 "
::

" $
System

$ *
.

* +
Guid

+ /
.

/ 0
Empty

0 5
;

5 6
} 	
} 
}
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Guid\Guid.IsNotEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Guid/ 3
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 

IsNotEmpty %
(% &
this& *
global+ 1
::1 3
System3 9
.9 :
Guid: >
@this? D
)D E
{		 	
return

 
@this

 
!=

 
global

 "
::

" $
System

$ *
.

* +
Guid

+ /
.

/ 0
Empty

0 5
;

5 6
} 	
} 
}
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Guid\_CoreObject\Guid.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Guid/ 3
.3 4
_CoreObject4 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
global
::
System
.
Guid
@this
,
params
global
::
System
.
Guid
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Guid\_CoreObject\Guid.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Guid/ 3
.3 4
_CoreObject4 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
global
::
System
.
Guid
@this
,
params
global
::
System
.
Guid
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.Days.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Days

. 2
(

2 3
this

3 7
short

8 =
@this

> C
)

C D
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromDays+ 3
(3 4
@this4 9
)9 :
;: ;
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.FactorOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
FactorOf #
(# $
this$ (
short) .
@this/ 4
,4 5
short6 ;
factorNumer< G
)G H
{ 	
return
factorNumer
%
@this
==
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.Hours.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Hours

. 3
(

3 4
this

4 8
short

9 >
@this

? D
)

D E
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
	FromHours+ 4
(4 5
@this5 :
): ;
;; <
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.IsEven.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsEven

 !
(

! "
this

" &
short

' ,
@this

- 2
)

2 3
{ 	
return 
@this 
% 
$num 
== 
$num  !
;! "
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.IsMultipleOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsMultipleOf '
(' (
this( ,
short- 2
@this3 8
,8 9
short: ?
factor@ F
)F G
{ 	
return
@this
%
factor
==
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.IsOdd.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsOdd

  
(

  !
this

! %
short

& +
@this

, 1
)

1 2
{ 	
return 
@this 
% 
$num 
!= 
$num  !
;! "
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.IsPrime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsPrime "
(" #
this# '
short( -
@this. 3
)3 4
{
if 
( 
@this 
== 
$num 
|| 
@this #
==$ &
$num' (
)( )
{ 
return 
true 
; 
} 
if 
( 
@this 
% 
$num 
== 
$num 
) 
{ 
return 
false 
; 
} 
short 
sqrt 
= 
( 
short 
)  
Math  $
.$ %
Sqrt% )
() *
@this* /
)/ 0
;0 1
for 
( 
long 
t 
= 
$num 
; 
t 
<= !
sqrt" &
;& '
t( )
+=* ,
$num- .
). /
{ 
if 
( 
@this 
% 
t 
==  
$num! "
)" #
{ 
return 
false  
;  !
} 
} 
return!! 
true!! 
;!! 
}"" 	
}## 
}$$ �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.Milliseconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Milliseconds

. :
(

: ;
this

; ?
short

@ E
@this

F K
)

K L
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromMilliseconds+ ;
(; <
@this< A
)A B
;B C
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.Minutes.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Minutes

. 5
(

5 6
this

6 :
short

; @
@this

A F
)

F G
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromMinutes+ 6
(6 7
@this7 <
)< =
;= >
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.Seconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Seconds

. 5
(

5 6
this

6 :
short

; @
@this

A F
)

F G
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromSeconds+ 6
(6 7
@this7 <
)< =
;= >
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\GenericInt\Int16.Weeks.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Weeks

. 3
(

3 4
this

4 8
short

9 >
@this

? D
)

D E
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromDays+ 3
(3 4
@this4 9
*: ;
$num< =
)= >
;> ?
}
} 
} �"
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\Int16.SqlSystemTypeToSqlDbType.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
	SqlDbType $
SqlSystemTypeToSqlDbType  8
(8 9
this9 =
short> C
@thisD I
)I J
{		 	
return

 
@this

 
switch

 
{ 
$num
=>
	SqlDbType
.
Image
,
$num 
=> 
	SqlDbType 
.  
Text  $
,$ %
$num 
=> 
	SqlDbType 
.  
UniqueIdentifier  0
,0 1
$num 
=> 
	SqlDbType 
.  
Date  $
,$ %
$num 
=> 
	SqlDbType 
.  
Time  $
,$ %
$num 
=> 
	SqlDbType 
.  
	DateTime2  )
,) *
$num 
=> 
	SqlDbType 
.  
DateTimeOffset  .
,. /
$num 
=> 
	SqlDbType 
.  
TinyInt  '
,' (
$num 
=> 
	SqlDbType 
.  
SmallInt  (
,( )
$num 
=> 
	SqlDbType 
.  
Int  #
,# $
$num!! 
=>!! 
	SqlDbType!! 
.!!  

,!!- .
$num## 
=>## 
	SqlDbType## 
.##  
Real##  $
,##$ %
$num%% 
=>%% 
	SqlDbType%% 
.%%  
Money%%  %
,%%% &
$num'' 
=>'' 
	SqlDbType'' 
.''  
DateTime''  (
,''( )
$num)) 
=>)) 
	SqlDbType)) 
.))  
Float))  %
,))% &
$num++ 
=>++ 
	SqlDbType++ 
.++  
Variant++  '
,++' (
$num-- 
=>-- 
	SqlDbType-- 
.--  
NText--  %
,--% &
$num// 
=>// 
	SqlDbType//  
.//  !
Bit//! $
,//$ %
$num11 
=>11 
	SqlDbType11  
.11  !
Decimal11! (
,11( )
$num33 
=>33 
	SqlDbType33  
.33  !
Decimal33! (
,33( )
$num55 
=>55 
	SqlDbType55  
.55  !

SmallMoney55! +
,55+ ,
$num77 
=>77 
	SqlDbType77  
.77  !
BigInt77! '
,77' (
$num99 
=>99 
	SqlDbType99  
.99  !
	VarBinary99! *
,99* +
$num;; 
=>;; 
	SqlDbType;;  
.;;  !
VarChar;;! (
,;;( )
$num== 
=>== 
	SqlDbType==  
.==  !
Binary==! '
,==' (
$num?? 
=>?? 
	SqlDbType??  
.??  !
Char??! %
,??% &
$numAA 
=>AA 
	SqlDbTypeAA  
.AA  !
	TimestampAA! *
,AA* +
$numCC 
=>CC 
	SqlDbTypeCC  
.CC  !
NVarCharCC! )
,CC) *
$numEE 
=>EE 
	SqlDbTypeEE  
.EE  !
NCharEE! &
,EE& '
$numGG 
=>GG 
	SqlDbTypeGG  
.GG  !
UdtGG! $
,GG$ %
$numII 
=>II 
	SqlDbTypeII  
.II  !
XmlII! $
,II$ %
_JJ 
=>JJ 
throwJJ 
newJJ 
	ExceptionJJ (
(JJ( )
stringJJ) /
.JJ/ 0
FormatJJ0 6
(JJ6 7
$str	JJ7 �
,
JJ� �
@this
JJ� �
)
JJ� �
)
JJ� �
,
JJ� �
}KK 
;KK
}LL 	
}MM 
}NN �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\System.BitConverter\Int16.GetBytes.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
System5 ;
.; <
BitConverter< H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
byte

 
[

 
]

 
GetBytes

 %
(

% &
this

& *
short

+ 0
value

1 6
)

6 7
{ 	
return 
global 
:: 
System !
.! "
BitConverter" .
.. /
GetBytes/ 7
(7 8
value8 =
)= >
;> ?
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\System.Math\Int16.Abs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
short

 
Abs

 
(

  
this

  $
short

% *
value

+ 0
)

0 1
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Abs' *
(* +
value+ 0
)0 1
;1 2
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\System.Math\Int16.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
Max 
(  
this  $
short% *
val1+ /
,/ 0
short1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\System.Math\Int16.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
Min 
(  
this  $
short% *
val1+ /
,/ 0
short1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\System.Math\Int16.Sign.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
Sign
(
this
short
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sign' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\System.Net.IPAddress\Int16.HostToNetworkOrder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
System5 ;
.; <
Net< ?
.? @
	IPAddress@ I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
short

 
HostToNetworkOrder

 .
(

. /
this

/ 3
short

4 9
host

: >
)

> ?
{ 	
return 
global 
:: 
System !
.! "
Net" %
.% &
	IPAddress& /
./ 0
HostToNetworkOrder0 B
(B C
hostC G
)G H
;H I
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\System.Net.IPAddress\Int16.NetworkToHostOrder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
System5 ;
.; <
Net< ?
.? @
	IPAddress@ I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
short

 
NetworkToHostOrder

 .
(

. /
this

/ 3
short

4 9
network

: A
)

A B
{ 	
return 
global 
:: 
System !
.! "
Net" %
.% &
	IPAddress& /
./ 0
NetworkToHostOrder0 B
(B C
networkC J
)J K
;K L
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\_CoreObject\Int16.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
short( -
@this. 3
,3 4
short5 :
minValue; C
,C D
shortE J
maxValueK S
)S T
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\_CoreObject\Int16.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
short
@this
,
params
short
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\_CoreObject\Int16.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
short( -
@this. 3
,3 4
short5 :
minValue; C
,C D
shortE J
maxValueK S
)S T
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int16\_CoreObject\Int16.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int16/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
short
@this
,
params
short
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.Days.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Days

. 2
(

2 3
this

3 7
int

8 ;
@this

< A
)

A B
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromDays+ 3
(3 4
@this4 9
)9 :
;: ;
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.FactorOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
FactorOf #
(# $
this$ (
int) ,
@this- 2
,2 3
int4 7
factorNumer8 C
)C D
{ 	
return
factorNumer
%
@this
==
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.Hours.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Hours

. 3
(

3 4
this

4 8
int

9 <
@this

= B
)

B C
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
	FromHours+ 4
(4 5
@this5 :
): ;
;; <
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.IsEven.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsEven

 !
(

! "
this

" &
int

' *
@this

+ 0
)

0 1
{ 	
return 
@this 
% 
$num 
== 
$num  !
;! "
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.IsMultipleOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsMultipleOf '
(' (
this( ,
int- 0
@this1 6
,6 7
int8 ;
factor< B
)B C
{ 	
return
@this
%
factor
==
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.IsOdd.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsOdd

  
(

  !
this

! %
int

& )
@this

* /
)

/ 0
{ 	
return 
@this 
% 
$num 
!= 
$num  !
;! "
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.IsPrime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsPrime "
(" #
this# '
int( +
@this, 1
)1 2
{
if 
( 
@this 
== 
$num 
|| 
@this #
==$ &
$num' (
)( )
{ 
return 
true 
; 
} 
if 
( 
@this 
% 
$num 
== 
$num 
) 
{ 
return 
false 
; 
} 
int 
sqrt 
= 
( 
int 
) 
Math  
.  !
Sqrt! %
(% &
@this& +
)+ ,
;, -
for 
( 
long 
t 
= 
$num 
; 
t 
<= !
sqrt" &
;& '
t( )
+=* ,
$num- .
). /
{ 
if 
( 
@this 
% 
t 
==  
$num! "
)" #
{ 
return 
false  
;  !
} 
} 
return!! 
true!! 
;!! 
}"" 	
}## 
}$$ �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.Milliseconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Milliseconds

. :
(

: ;
this

; ?
int

@ C
@this

D I
)

I J
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromMilliseconds+ ;
(; <
@this< A
)A B
;B C
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.Minutes.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Minutes

. 5
(

5 6
this

6 :
int

; >
@this

? D
)

D E
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromMinutes+ 6
(6 7
@this7 <
)< =
;= >
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.Seconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Seconds

. 5
(

5 6
this

6 :
int

; >
@this

? D
)

D E
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromSeconds+ 6
(6 7
@this7 <
)< =
;= >
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\GenericInt\Int32.Weeks.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Weeks

. 3
(

3 4
this

4 8
int

9 <
@this

= B
)

B C
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromDays+ 3
(3 4
@this4 9
*: ;
$num< =
)= >
;> ?
}
} 
} �"
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\Int.SqlSystemTypeToSqlDbType.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
	SqlDbType $
SqlSystemTypeToSqlDbType  8
(8 9
this9 =
int> A
@thisB G
)G H
{		 	
return

 
@this

 
switch

 
{ 
$num
=>
	SqlDbType
.
Image
,
$num 
=> 
	SqlDbType 
.  
Text  $
,$ %
$num 
=> 
	SqlDbType 
.  
UniqueIdentifier  0
,0 1
$num 
=> 
	SqlDbType 
.  
Date  $
,$ %
$num 
=> 
	SqlDbType 
.  
Time  $
,$ %
$num 
=> 
	SqlDbType 
.  
	DateTime2  )
,) *
$num 
=> 
	SqlDbType 
.  
DateTimeOffset  .
,. /
$num 
=> 
	SqlDbType 
.  
TinyInt  '
,' (
$num 
=> 
	SqlDbType 
.  
SmallInt  (
,( )
$num 
=> 
	SqlDbType 
.  
Int  #
,# $
$num!! 
=>!! 
	SqlDbType!! 
.!!  

,!!- .
$num## 
=>## 
	SqlDbType## 
.##  
Real##  $
,##$ %
$num%% 
=>%% 
	SqlDbType%% 
.%%  
Money%%  %
,%%% &
$num'' 
=>'' 
	SqlDbType'' 
.''  
DateTime''  (
,''( )
$num)) 
=>)) 
	SqlDbType)) 
.))  
Float))  %
,))% &
$num++ 
=>++ 
	SqlDbType++ 
.++  
Variant++  '
,++' (
$num-- 
=>-- 
	SqlDbType-- 
.--  
NText--  %
,--% &
$num// 
=>// 
	SqlDbType//  
.//  !
Bit//! $
,//$ %
$num11 
=>11 
	SqlDbType11  
.11  !
Decimal11! (
,11( )
$num33 
=>33 
	SqlDbType33  
.33  !
Decimal33! (
,33( )
$num55 
=>55 
	SqlDbType55  
.55  !

SmallMoney55! +
,55+ ,
$num77 
=>77 
	SqlDbType77  
.77  !
BigInt77! '
,77' (
$num99 
=>99 
	SqlDbType99  
.99  !
	VarBinary99! *
,99* +
$num;; 
=>;; 
	SqlDbType;;  
.;;  !
VarChar;;! (
,;;( )
$num== 
=>== 
	SqlDbType==  
.==  !
Binary==! '
,==' (
$num?? 
=>?? 
	SqlDbType??  
.??  !
Char??! %
,??% &
$numAA 
=>AA 
	SqlDbTypeAA  
.AA  !
	TimestampAA! *
,AA* +
$numCC 
=>CC 
	SqlDbTypeCC  
.CC  !
NVarCharCC! )
,CC) *
$numEE 
=>EE 
	SqlDbTypeEE  
.EE  !
NCharEE! &
,EE& '
$numGG 
=>GG 
	SqlDbTypeGG  
.GG  !
UdtGG! $
,GG$ %
$numII 
=>II 
	SqlDbTypeII  
.II  !
XmlII! $
,II$ %
_JJ 
=>JJ 
throwJJ 
newJJ 
	ExceptionJJ (
(JJ( )
stringJJ) /
.JJ/ 0
FormatJJ0 6
(JJ6 7
$str	JJ7 �
,
JJ� �
@this
JJ� �
)
JJ� �
)
JJ� �
,
JJ� �
}KK 
;KK
}LL 	
}MM 
}NN �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.BitConverter\Int32.GetBytes.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
BitConverter< H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
byte

 
[

 
]

 
GetBytes

 %
(

% &
this

& *
int

+ .
value

/ 4
)

4 5
{ 	
return 
global 
:: 
System !
.! "
BitConverter" .
.. /
GetBytes/ 7
(7 8
value8 =
)= >
;> ?
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Char\Int32.ConvertFromUtf32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Char< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
ConvertFromUtf32
(
this
int
utf32
)
{ 	
return 
char 
. 
ConvertFromUtf32 (
(( )
utf32) .
). /
;/ 0
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.DateTime\Int32.DaysInMonth.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
DateTime< D
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
DaysInMonth %
(% &
this& *
int+ .
year/ 3
,3 4
int5 8
month9 >
)> ?
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +
DaysInMonth+ 6
(6 7
year7 ;
,; <
month= B
)B C
;C D
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.DateTime\Int32.IsLeapYear.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
DateTime< D
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 

IsLeapYear

 %
(

% &
this

& *
int

+ .
year

/ 3
)

3 4
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +

IsLeapYear+ 5
(5 6
year6 :
): ;
;; <
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Math\Int32.Abs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 
Abs

 
(

 
this

 "
int

# &
value

' ,
)

, -
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Abs' *
(* +
value+ 0
)0 1
;1 2
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Math\Int32.BigMul.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
BigMul !
(! "
this" &
int' *
a+ ,
,, -
int. 1
b2 3
)3 4
{ 	
return
global
::
System
.
Math
.
BigMul
(
a
,
b
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Math\Int32.DivRem.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
DivRem  
(  !
this! %
int& )
a* +
,+ ,
int- 0
b1 2
,2 3
out4 7
int8 ;
result< B
)B C
{
return 
global 
:: 
System !
.! "
Math" &
.& '
DivRem' -
(- .
a. /
,/ 0
b1 2
,2 3
out4 7
result8 >
)> ?
;? @
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Math\Int32.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
Max 
( 
this "
int# &
val1' +
,+ ,
int- 0
val21 5
)5 6
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Math\Int32.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
Min 
( 
this "
int# &
val1' +
,+ ,
int- 0
val21 5
)5 6
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Math\Int32.Sign.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
Sign
(
this
int
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sign' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Net.IPAddress\Int32.HostToNetworkOrder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Net< ?
.? @
	IPAddress@ I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 
HostToNetworkOrder

 ,
(

, -
this

- 1
int

2 5
host

6 :
)

: ;
{ 	
return 
global 
:: 
System !
.! "
Net" %
.% &
	IPAddress& /
./ 0
HostToNetworkOrder0 B
(B C
hostC G
)G H
;H I
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\System.Net.IPAddress\Int32.NetworkToHostOrder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
System5 ;
.; <
Net< ?
.? @
	IPAddress@ I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 
NetworkToHostOrder

 ,
(

, -
this

- 1
int

2 5
network

6 =
)

= >
{ 	
return 
global 
:: 
System !
.! "
Net" %
.% &
	IPAddress& /
./ 0
NetworkToHostOrder0 B
(B C
networkC J
)J K
;K L
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\_CoreObject\Int32.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
int( +
@this, 1
,1 2
int3 6
minValue7 ?
,? @
intA D
maxValueE M
)M N
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\_CoreObject\Int32.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
int
@this
,
params
int
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\_CoreObject\Int32.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
int( +
@this, 1
,1 2
int3 6
minValue7 ?
,? @
intA D
maxValueE M
)M N
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int32\_CoreObject\Int32.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int32/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
int
@this
,
params
int
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.Days.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Days

. 2
(

2 3
this

3 7
long

8 <
@this

= B
)

B C
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromDays+ 3
(3 4
@this4 9
)9 :
;: ;
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.FactorOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
FactorOf #
(# $
this$ (
long) -
@this. 3
,3 4
long5 9
factorNumer: E
)E F
{ 	
return
factorNumer
%
@this
==
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.Hours.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Hours

. 3
(

3 4
this

4 8
long

9 =
@this

> C
)

C D
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
	FromHours+ 4
(4 5
@this5 :
): ;
;; <
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.IsEven.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsEven

 !
(

! "
this

" &
long

' +
@this

, 1
)

1 2
{ 	
return 
@this 
% 
$num 
== 
$num  !
;! "
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.IsMultipleOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsMultipleOf '
(' (
this( ,
long- 1
@this2 7
,7 8
long9 =
factor> D
)D E
{ 	
return
@this
%
factor
==
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.IsOdd.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsOdd

  
(

  !
this

! %
long

& *
@this

+ 0
)

0 1
{ 	
return 
@this 
% 
$num 
!= 
$num  !
;! "
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.IsPrime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsPrime "
(" #
this# '
long( ,
@this- 2
)2 3
{
if 
( 
@this 
== 
$num 
|| 
@this #
==$ &
$num' (
)( )
{ 
return 
true 
; 
} 
if 
( 
@this 
% 
$num 
== 
$num 
) 
{ 
return 
false 
; 
} 
long 
sqrt 
= 
( 
long 
) 
Math "
." #
Sqrt# '
(' (
@this( -
)- .
;. /
for 
( 
long 
t 
= 
$num 
; 
t 
<= !
sqrt" &
;& '
t( )
+=* ,
$num- .
). /
{ 
if 
( 
@this 
% 
t 
==  
$num! "
)" #
{ 
return 
false  
;  !
} 
} 
return!! 
true!! 
;!! 
}"" 	
}## 
}$$ �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.Milliseconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Milliseconds

. :
(

: ;
this

; ?
long

@ D
@this

E J
)

J K
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromMilliseconds+ ;
(; <
@this< A
)A B
;B C
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.Minutes.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Minutes

. 5
(

5 6
this

6 :
long

; ?
@this

@ E
)

E F
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromMinutes+ 6
(6 7
@this7 <
)< =
;= >
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.Seconds.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Seconds

. 5
(

5 6
this

6 :
long

; ?
@this

@ E
)

E F
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromSeconds+ 6
(6 7
@this7 <
)< =
;= >
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\GenericInt\Int64.Weeks.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5

GenericInt5 ?
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
Weeks

. 3
(

3 4
this

4 8
long

9 =
@this

> C
)

C D
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
FromDays+ 3
(3 4
@this4 9
*: ;
$num< =
)= >
;> ?
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.BitConverter\Int64.GetBytes.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
BitConverter< H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
byte

 
[

 
]

 
GetBytes

 %
(

% &
this

& *
long

+ /
value

0 5
)

5 6
{ 	
return 
global 
:: 
System !
.! "
BitConverter" .
.. /
GetBytes/ 7
(7 8
value8 =
)= >
;> ?
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.BitConverter\Int64.Int64BitsToDouble.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
BitConverter< H
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
Int64BitsToDouble

 .
(

. /
this

/ 3
long

4 8
value

9 >
)

> ?
{ 	
return 
global 
:: 
System !
.! "
BitConverter" .
.. /
Int64BitsToDouble/ @
(@ A
valueA F
)F G
;G H
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.DateTime\Int64.FromBinary.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
DateTime< D
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
DateTime

FromBinary
(
this
long
dateData
)
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +

FromBinary+ 5
(5 6
dateData6 >
)> ?
;? @
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.DateTime\Int64.FromFileTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
DateTime< D
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
FromFileTime. :
(: ;
this; ?
long@ D
fileTimeE M
)M N
{
return 
global 
:: 
System !
.! "
DateTime" *
.* +
FromFileTime+ 7
(7 8
fileTime8 @
)@ A
;A B
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.DateTime\Int64.FromFileTimeUtc.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
DateTime< D
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
FromFileTimeUtc. =
(= >
this> B
longC G
fileTimeH P
)P Q
{
return 
global 
:: 
System !
.! "
DateTime" *
.* +
FromFileTimeUtc+ :
(: ;
fileTime; C
)C D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Decimal\Int64.FromOACurrency.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Decimal< C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
FromOACurrency ,
(, -
this- 1
long2 6
cy7 9
)9 :
{ 	
return
decimal
.
FromOACurrency
(
cy
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Math\Int64.Abs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
long

 
Abs

 
(

 
this

 #
long

$ (
value

) .
)

. /
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Abs' *
(* +
value+ 0
)0 1
;1 2
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Math\Int64.DivRem.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
DivRem !
(! "
this" &
long' +
a, -
,- .
long/ 3
b4 5
,5 6
out7 :
long; ?
result@ F
)F G
{
return 
global 
:: 
System !
.! "
Math" &
.& '
DivRem' -
(- .
a. /
,/ 0
b1 2
,2 3
out4 7
result8 >
)> ?
;? @
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Math\Int64.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
Max 
( 
this #
long$ (
val1) -
,- .
long/ 3
val24 8
)8 9
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Math\Int64.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
Min 
( 
this #
long$ (
val1) -
,- .
long/ 3
val24 8
)8 9
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Math\Int64.Sign.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
Sign
(
this
long
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sign' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Net.IPAddress\Int64.HostToNetworkOrder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Net< ?
.? @
	IPAddress@ I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
long

 
HostToNetworkOrder

 -
(

- .
this

. 2
long

3 7
host

8 <
)

< =
{ 	
return 
global 
:: 
System !
.! "
Net" %
.% &
	IPAddress& /
./ 0
HostToNetworkOrder0 B
(B C
hostC G
)G H
;H I
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.Net.IPAddress\Int64.NetworkToHostOrder.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
Net< ?
.? @
	IPAddress@ I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
long

 
NetworkToHostOrder

 -
(

- .
this

. 2
long

3 7
network

8 ?
)

? @
{ 	
return 
global 
:: 
System !
.! "
Net" %
.% &
	IPAddress& /
./ 0
NetworkToHostOrder0 B
(B C
networkC J
)J K
;K L
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\System.TimeSpan\Int64.FromTicks.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
System5 ;
.; <
TimeSpan< D
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
TimeSpan

% -
	FromTicks

. 7
(

7 8
this

8 <
long

= A
value

B G
)

G H
{ 	
return 
global 
:: 
System !
.! "
TimeSpan" *
.* +
	FromTicks+ 4
(4 5
value5 :
): ;
;; <
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\_CoreObject\Int64.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
long( ,
@this- 2
,2 3
long4 8
minValue9 A
,A B
longC G
maxValueH P
)P Q
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\_CoreObject\Int64.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
long
@this
,
params
long
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\_CoreObject\Int64.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
long( ,
@this- 2
,2 3
long4 8
minValue9 A
,A B
longC G
maxValueH P
)P Q
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Int64\_CoreObject\Int64.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Int64/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
long
@this
,
params
long
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �#
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.IO\StreamExtension.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
IO/ 1
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
[ 
] 
	ReadToEnd &
(& '
this' +
Stream, 2
stream3 9
)9 :
{		 	
long

 
originalPosition

 !
=

" #
$num

$ %
;

% &
if 
( 
stream 
. 
CanSeek 
) 
{
originalPosition  
=! "
stream# )
.) *
Position* 2
;2 3
stream 
. 
Position 
=  !
$num" #
;# $
} 
try 
{ 
byte 
[ 
] 

readBuffer !
=" #
new$ '
byte( ,
[, -
$num- 1
]1 2
;2 3
int 
totalBytesRead "
=# $
$num% &
;& '
int 
	bytesRead 
; 
while 
( 
( 
	bytesRead !
=" #
stream$ *
.* +
Read+ /
(/ 0

readBuffer0 :
,: ;
totalBytesRead< J
,J K

readBufferL V
.V W
LengthW ]
-^ _
totalBytesRead` n
)n o
)o p
>q r
$nums t
)t u
{ 
totalBytesRead "
+=# %
	bytesRead& /
;/ 0
if 
( 
totalBytesRead &
==' )

readBuffer* 4
.4 5
Length5 ;
); <
{ 
int 
nextByte $
=% &
stream' -
.- .
ReadByte. 6
(6 7
)7 8
;8 9
if   
(   
nextByte   $
!=  % '
-  ( )
$num  ) *
)  * +
{!! 
byte""  
[""  !
]""! "
temp""# '
=""( )
new""* -
byte"". 2
[""2 3

readBuffer""3 =
.""= >
Length""> D
*""E F
$num""G H
]""H I
;""I J
Buffer## "
.##" #
	BlockCopy### ,
(##, -

readBuffer##- 7
,##7 8
$num##9 :
,##: ;
temp##< @
,##@ A
$num##B C
,##C D

readBuffer##E O
.##O P
Length##P V
)##V W
;##W X
Buffer$$ "
.$$" #
SetByte$$# *
($$* +
temp$$+ /
,$$/ 0
totalBytesRead$$1 ?
,$$? @
($$A B
byte$$B F
)$$F G
nextByte$$G O
)$$O P
;$$P Q

readBuffer%% &
=%%' (
temp%%) -
;%%- .
totalBytesRead&& *
++&&* ,
;&&, -
}'' 
}(( 
})) 
byte++ 
[++ 
]++ 
buffer++ 
=++ 

readBuffer++  *
;++* +
if,, 
(,, 

readBuffer,, 
.,, 
Length,, %
!=,,& (
totalBytesRead,,) 7
),,7 8
{-- 
buffer.. 
=.. 
new..  
byte..! %
[..% &
totalBytesRead..& 4
]..4 5
;..5 6
Buffer// 
.// 
	BlockCopy// $
(//$ %

readBuffer//% /
,/// 0
$num//1 2
,//2 3
buffer//4 :
,//: ;
$num//< =
,//= >
totalBytesRead//? M
)//M N
;//N O
}00 
return11 
buffer11 
;11 
}22 
finally33 
{44 
if55 
(55 
stream55 
.55 
CanSeek55 "
)55" #
{66 
stream77 
.77 
Position77 #
=77$ %
originalPosition77& 6
;776 7
}88 
}99 
}:: 	
};; 
}<< �
vF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Linq\DistinctBy.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
{ 
public 

static 
class 

{ 
public 
static 
IEnumerable !
<! "
TSource" )
>) *

DistinctBy+ 5
<5 6
TSource6 =
,= >
TKey? C
>C D
(		 
this		
IEnumerable		 
<		 
TSource		 %
>		% &
source		' -
,		- .
Func		/ 3
<		3 4
TSource		4 ;
,		; <
TKey		= A
>		A B
keySelector		C N
)		N O
{

 	
HashSet 
< 
TKey 
> 
seenKeys "
=# $
new% (
(( )
)) *
;* +
foreach 
( 
TSource 
element $
in% '
source( .
). /
{
if 
( 
seenKeys 
. 
Add  
(  !
keySelector! ,
(, -
element- 4
)4 5
)5 6
)6 7
{ 
yield 
return  
element! (
;( )
} 
} 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object[]\System.Type\Object[].GetTypeArray.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
System/ 5
.5 6
Type6 :
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
Type

% )
[

) *
]

* +
GetTypeArray

, 8
(

8 9
this

9 =
object

> D
[

D E
]

E F
args

G K
)

K L
{ 	
return 
global 
:: 
System !
.! "
Type" &
.& '
GetTypeArray' 3
(3 4
args4 8
)8 9
;9 :
}
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Casting\Object.As.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Casting6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
As 
< 
T 
> 
( 
this "
object# )
@this* /
)/ 0
{ 	
return
(
T
)
@this
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Casting\Object.AsOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Casting6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
T
AsOrDefault
<
T
>
(
this
object
@this
)
{ 	
try 
{ 
return 
( 
T 
) 
@this 
;  
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public   
static   
T   
AsOrDefault   #
<  # $
T  $ %
>  % &
(  & '
this  ' +
object  , 2
@this  3 8
,  8 9
T  : ;
defaultValue  < H
)  H I
{!! 	
try"" 
{## 
return$$ 
($$ 
T$$ 
)$$ 
@this$$ 
;$$  
}%% 
catch&& 
(&& 
	Exception&& 
)&& 
{'' 
return(( 
defaultValue(( #
;((# $
})) 
}** 	
public
�� 
static
�� 
T
�� 
AsOrDefault
�� #
<
��# $
T
��$ %
>
��% &
(
��& '
this
��' +
object
��, 2
@this
��3 8
,
��8 9
Func
��: >
<
��> ?
T
��? @
>
��@ A!
defaultValueFactory
��B U
)
��U V
{
�� 	
try
�� 
{
�� 
return
�� 
(
�� 
T
�� 
)
�� 
@this
�� 
;
��  
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� !
defaultValueFactory
�� *
(
��* +
)
��+ ,
;
��, -
}
�� 
}
�� 	
public
�� 
static
�� 
T
�� 
AsOrDefault
�� #
<
��# $
T
��$ %
>
��% &
(
��& '
this
��' +
object
��, 2
@this
��3 8
,
��8 9
Func
��: >
<
��> ?
object
��? E
,
��E F
T
��G H
>
��H I!
defaultValueFactory
��J ]
)
��] ^
{
�� 	
try
�� 
{
�� 
return
�� 
(
�� 
T
�� 
)
�� 
@this
�� 
;
��  
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� !
defaultValueFactory
�� *
(
��* +
@this
��+ 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
}
�� 
}�� �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Casting\Object.IsAssignableFrom.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Casting6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsAssignableFrom +
<+ ,
T, -
>- .
(. /
this/ 3
object4 :
@this; @
)@ A
{ 	
global
::
System
.
Type
type
=
@this
.
GetType
(
)
;
return 
type 
. 
IsAssignableFrom (
(( )
typeof) /
(/ 0
T0 1
)1 2
)2 3
;3 4
} 	
public 
static 
bool 
IsAssignableFrom +
(+ ,
this, 0
object1 7
@this8 =
,= >
global? E
::E G
SystemG M
.M N
TypeN R

targetTypeS ]
)] ^
{ 	
global 
:: 
System 
. 
Type 
type  $
=% &
@this' ,
., -
GetType- 4
(4 5
)5 6
;6 7
return 
type 
. 
IsAssignableFrom (
(( )

targetType) 3
)3 4
;4 5
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Chaining\Object.Chain.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Chaining6 >
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
Chain 
< 
T 
>  
(  !
this! %
T& '
@this( -
,- .
Action/ 5
<5 6
T6 7
>7 8
action9 ?
)? @
{ 	
action 
( 
@this 
) 
; 
return 
@this 
; 
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Cloning\Object.DeepClone.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Cloning6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
	DeepClone !
<! "
T" #
># $
($ %
this% )
T* +
@this, 1
)1 2
{ 	
var 

serialized 
= 
JsonConvert (
.( )
SerializeObject) 8
(8 9
@this9 >
)> ?
;? @
return 
JsonConvert 
. 
DeserializeObject 0
<0 1
T1 2
>2 3
(3 4

serialized4 >
)> ?
;? @
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Cloning\Object.ShallowCopy.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Cloning6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
T
ShallowCopy
<
T
>
(
this
T
@this
)
{ 	

MethodInfo 
method 
= 
@this  %
.% &
GetType& -
(- .
). /
./ 0
	GetMethod0 9
(9 :
$str: K
,K L
BindingFlagsM Y
.Y Z
	NonPublicZ c
|d e
BindingFlagsf r
.r s
Instances {
){ |
;| }
return 
( 
T 
) 
method 
. 
Invoke #
(# $
@this$ )
,) *
null+ /
)/ 0
;0 1
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidBoolean.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidBoolean

 )
(

) *
this

* .
object

/ 5
@this

6 ;
)

; <
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
bool 
. 
TryParse  
(  !
@this! &
.& '
ToString' /
(/ 0
)0 1
,1 2
out3 6
bool7 ;
result< B
)B C
;C D
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidByte

 &
(

& '
this

' +
object

, 2
@this

3 8
)

8 9
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
byte 
. 
TryParse  
(  !
@this! &
.& '
ToString' /
(/ 0
)0 1
,1 2
out3 6
byte7 ;
result< B
)B C
;C D
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidChar.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidChar

 &
(

& '
this

' +
object

, 2
@this

3 8
)

8 9
{ 	
return 
char 
. 
TryParse  
(  !
@this! &
.& '
ToString' /
(/ 0
)0 1
,1 2
out3 6
char7 ;
result< B
)B C
;C D
}
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidDateTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidDateTime

 *
(

* +
this

+ /
object

0 6
@this

7 <
)

< =
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
global 
:: 
System !
.! "
DateTime" *
.* +
TryParse+ 3
(3 4
@this4 9
.9 :
ToString: B
(B C
)C D
,D E
outF I
globalJ P
::P R
SystemR X
.X Y
DateTimeY a
resultb h
)h i
;i j
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidDateTimeOffSet.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 !
IsValidDateTimeOffSet

 0
(

0 1
this

1 5
object

6 <
@this

= B
)

B C
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
global 
:: 
System !
.! "
DateTimeOffset" 0
.0 1
TryParse1 9
(9 :
@this: ?
.? @
ToString@ H
(H I
)I J
,J K
outL O
globalP V
::V X
SystemX ^
.^ _
DateTimeOffset_ m
resultn t
)t u
;u v
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidDecimal.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidDecimal

 )
(

) *
this

* .
object

/ 5
@this

6 ;
)

; <
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
decimal 
. 
TryParse #
(# $
@this$ )
.) *
ToString* 2
(2 3
)3 4
,4 5
out6 9
decimal: A
resultB H
)H I
;I J
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidDouble.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
object

. 4
@this

5 :
)

: ;
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
double 
. 
TryParse "
(" #
@this# (
.( )
ToString) 1
(1 2
)2 3
,3 4
out5 8
double9 ?
result@ F
)F G
;G H
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidFloat.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidFloat

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
float 
. 
TryParse !
(! "
@this" '
.' (
ToString( 0
(0 1
)1 2
,2 3
out4 7
float8 =
result> D
)D E
;E F
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidGuid.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidGuid

 &
(

& '
this

' +
object

, 2
@this

3 8
)

8 9
{ 	
return 
global 
:: 
System !
.! "
Guid" &
.& '
TryParse' /
(/ 0
@this0 5
.5 6
ToString6 >
(> ?
)? @
,@ A
outB E
globalF L
::L N
SystemN T
.T U
GuidU Y
resultZ `
)` a
;a b
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidInt16

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
short 
. 
TryParse !
(! "
@this" '
.' (
ToString( 0
(0 1
)1 2
,2 3
out4 7
short8 =
result> D
)D E
;E F
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidInt32

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
int 
. 
TryParse 
(  
@this  %
.% &
ToString& .
(. /
)/ 0
,0 1
out2 5
int6 9
result: @
)@ A
;A B
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidInt64

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
long 
. 
TryParse  
(  !
@this! &
.& '
ToString' /
(/ 0
)0 1
,1 2
out3 6
long7 ;
result< B
)B C
;C D
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidLong.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidLong

 &
(

& '
this

' +
object

, 2
@this

3 8
)

8 9
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
long 
. 
TryParse  
(  !
@this! &
.& '
ToString' /
(/ 0
)0 1
,1 2
out3 6
long7 ;
result< B
)B C
;C D
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidSByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidSByte

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
sbyte 
. 
TryParse !
(! "
@this" '
.' (
ToString( 0
(0 1
)1 2
,2 3
out4 7
sbyte8 =
result> D
)D E
;E F
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidShort.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidShort

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
short 
. 
TryParse !
(! "
@this" '
.' (
ToString( 0
(0 1
)1 2
,2 3
out4 7
short8 =
result> D
)D E
;E F
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidSingle.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
object

. 4
@this

5 :
)

: ;
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
float 
. 
TryParse !
(! "
@this" '
.' (
ToString( 0
(0 1
)1 2
,2 3
out4 7
float8 =
result> D
)D E
;E F
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
object

. 4
@this

5 :
)

: ;
{ 	
return 
true 
; 
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidUInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
object

. 4
@this

5 :
)

: ;
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
ushort 
. 
TryParse "
(" #
@this# (
.( )
ToString) 1
(1 2
)2 3
,3 4
out5 8
ushort9 ?
result@ F
)F G
;G H
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidUInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
object

. 4
@this

5 :
)

: ;
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
uint 
. 
TryParse  
(  !
@this! &
.& '
ToString' /
(/ 0
)0 1
,1 2
out3 6
uint7 ;
result< B
)B C
;C D
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidUInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
object

. 4
@this

5 :
)

: ;
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
ulong 
. 
TryParse !
(! "
@this" '
.' (
ToString( 0
(0 1
)1 2
,2 3
out4 7
ulong8 =
result> D
)D E
;E F
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidULong.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsValidULong

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
ulong 
. 
TryParse !
(! "
@this" '
.' (
ToString( 0
(0 1
)1 2
,2 3
out4 7
ulong8 =
result> D
)D E
;E F
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\IsValidValueType\Object.IsValidUShort.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
IsValidValueType> N
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
object

. 4
@this

5 :
)

: ;
{ 	
if 
( 
@this 
== 
null 
) 
{
return 
true 
; 
} 
return 
ushort 
. 
TryParse "
(" #
@this# (
.( )
ToString) 1
(1 2
)2 3
,3 4
out5 8
ushort9 ?
result@ F
)F G
;G H
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\Object.ChangeType.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
object 

ChangeType '
(' (
this( ,
object- 3
value4 9
,9 :
TypeCode; C
typeCodeD L
)L M
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *

ChangeType* 4
(4 5
value5 :
,: ;
typeCode< D
)D E
;E F
} 	
public   
static   
object   

ChangeType   '
(  ' (
this  ( ,
object  - 3
value  4 9
,  9 :
TypeCode  ; C
typeCode  D L
,  L M
IFormatProvider  N ]
provider  ^ f
)  f g
{!! 	
return"" 
global"" 
::"" 
System"" !
.""! "
Convert""" )
."") *

ChangeType""* 4
(""4 5
value""5 :
,"": ;
typeCode""< D
,""D E
provider""F N
)""N O
;""O P
}## 	
public.. 
static.. 
object.. 

ChangeType.. '
(..' (
this..( ,
object..- 3
value..4 9
,..9 :
Type..; ?
conversionType..@ N
)..N O
{// 	
return00 
global00 
::00 
System00 !
.00! "
Convert00" )
.00) *

ChangeType00* 4
(004 5
value005 :
,00: ;
conversionType00< J
)00J K
;00K L
}11 	
public>> 
static>> 
object>> 

ChangeType>> '
(>>' (
this>>( ,
object>>- 3
value>>4 9
,>>9 :
Type>>; ?
conversionType>>@ N
,>>N O
IFormatProvider>>P _
provider>>` h
)>>h i
{?? 	
return@@ 
global@@ 
::@@ 
System@@ !
.@@! "
Convert@@" )
.@@) *

ChangeType@@* 4
(@@4 5
value@@5 :
,@@: ;
conversionType@@< J
,@@J K
provider@@L T
)@@T U
;@@U V
}AA 	
publicLL 
staticLL 
objectLL 

ChangeTypeLL '
<LL' (
TLL( )
>LL) *
(LL* +
thisLL+ /
objectLL0 6
valueLL7 <
)LL< =
{MM 	
returnNN 
(NN 
TNN 
)NN 
globalNN 
::NN 
SystemNN $
.NN$ %
ConvertNN% ,
.NN, -

ChangeTypeNN- 7
(NN7 8
valueNN8 =
,NN= >
typeofNN? E
(NNE F
TNNF G
)NNG H
)NNH I
;NNI J
}OO 	
public\\ 
static\\ 
object\\ 

ChangeType\\ '
<\\' (
T\\( )
>\\) *
(\\* +
this\\+ /
object\\0 6
value\\7 <
,\\< =
IFormatProvider\\> M
provider\\N V
)\\V W
{]] 	
return^^ 
(^^ 
T^^ 
)^^ 
global^^ 
::^^ 
System^^ $
.^^$ %
Convert^^% ,
.^^, -

ChangeType^^- 7
(^^7 8
value^^8 =
,^^= >
typeof^^? E
(^^E F
T^^F G
)^^G H
,^^H I
provider^^J R
)^^R S
;^^S T
}__ 	
}`` 
}aa �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\Object.GetTypeCode.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
TypeCode 
GetTypeCode *
(* +
this+ /
object0 6
value7 <
)< =
{
return 
global 
:: 
System !
.! "
Convert" )
.) *
GetTypeCode* 5
(5 6
value6 ;
); <
;< =
} 	
} 
} �.
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\Object.To.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
publicRR 
staticRR 
TRR 
ToRR 
<RR 
TRR 
>RR 
(RR 
thisRR "
objectRR# )
@thisRR* /
)RR/ 0
{SS 	
ifTT 
(TT 
@thisTT 
!=TT 
nullTT 
)TT 
{UU 
TypeVV 

targetTypeVV 
=VV  !
typeofVV" (
(VV( )
TVV) *
)VV* +
;VV+ ,
ifXX 
(XX 
@thisXX 
.XX 
GetTypeXX !
(XX! "
)XX" #
==XX$ &

targetTypeXX' 1
)XX1 2
{YY 
returnZZ 
(ZZ 
TZZ 
)ZZ 
@thisZZ #
;ZZ# $
}[[ 

	converter]] '
=]]( )
TypeDescriptor]]* 8
.]]8 9
GetConverter]]9 E
(]]E F
@this]]F K
)]]K L
;]]L M
if^^ 
(^^ 
	converter^^ 
!=^^  
null^^! %
)^^% &
{__ 
if`` 
(`` 
	converter`` !
.``! "
CanConvertTo``" .
(``. /

targetType``/ 9
)``9 :
)``: ;
{aa 
returnbb 
(bb  
Tbb  !
)bb! "
	converterbb" +
.bb+ ,
	ConvertTobb, 5
(bb5 6
@thisbb6 ;
,bb; <

targetTypebb= G
)bbG H
;bbH I
}cc 
}dd 
	converterff 
=ff 
TypeDescriptorff *
.ff* +
GetConverterff+ 7
(ff7 8

targetTypeff8 B
)ffB C
;ffC D
ifgg 
(gg 
	convertergg 
!=gg  
nullgg! %
)gg% &
{hh 
ifii 
(ii 
	converterii !
.ii! "
CanConvertFromii" 0
(ii0 1
@thisii1 6
.ii6 7
GetTypeii7 >
(ii> ?
)ii? @
)ii@ A
)iiA B
{jj 
returnkk 
(kk  
Tkk  !
)kk! "
	converterkk" +
.kk+ ,
ConvertFromkk, 7
(kk7 8
@thiskk8 =
)kk= >
;kk> ?
}ll 
}mm 
ifoo 
(oo 
@thisoo 
==oo 
DBNulloo #
.oo# $
Valueoo$ )
)oo) *
{pp 
returnqq 
(qq 
Tqq 
)qq 
(qq 
objectqq %
)qq% &
nullqq& *
;qq* +
}rr 
}ss 
returnuu 
(uu 
Tuu 
)uu 
@thisuu 
;uu 
}vv 	
public
�� 
static
�� 
object
�� 
To
�� 
(
��  
this
��  $
object
��% +
@this
��, 1
,
��1 2
Type
��3 7
type
��8 <
)
��< =
{
�� 	
if
�� 
(
�� 
@this
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
Type
�� 

targetType
�� 
=
��  !
type
��" &
;
��& '
if
�� 
(
�� 
@this
�� 
.
�� 
GetType
�� !
(
��! "
)
��" #
==
��$ &

targetType
��' 1
)
��1 2
{
�� 
return
�� 
@this
��  
;
��  !
}
�� 

�� 
	converter
�� '
=
��( )
TypeDescriptor
��* 8
.
��8 9
GetConverter
��9 E
(
��E F
@this
��F K
)
��K L
;
��L M
if
�� 
(
�� 
	converter
�� 
!=
��  
null
��! %
)
��% &
{
�� 
if
�� 
(
�� 
	converter
�� !
.
��! "
CanConvertTo
��" .
(
��. /

targetType
��/ 9
)
��9 :
)
��: ;
{
�� 
return
�� 
	converter
�� (
.
��( )
	ConvertTo
��) 2
(
��2 3
@this
��3 8
,
��8 9

targetType
��: D
)
��D E
;
��E F
}
�� 
}
�� 
	converter
�� 
=
�� 
TypeDescriptor
�� *
.
��* +
GetConverter
��+ 7
(
��7 8

targetType
��8 B
)
��B C
;
��C D
if
�� 
(
�� 
	converter
�� 
!=
��  
null
��! %
)
��% &
{
�� 
if
�� 
(
�� 
	converter
�� !
.
��! "
CanConvertFrom
��" 0
(
��0 1
@this
��1 6
.
��6 7
GetType
��7 >
(
��> ?
)
��? @
)
��@ A
)
��A B
{
�� 
return
�� 
	converter
�� (
.
��( )
ConvertFrom
��) 4
(
��4 5
@this
��5 :
)
��: ;
;
��; <
}
�� 
}
�� 
if
�� 
(
�� 
@this
�� 
==
�� 
DBNull
�� #
.
��# $
Value
��$ )
)
��) *
{
�� 
return
�� 
null
�� 
;
��  
}
�� 
}
�� 
return
�� 
@this
�� 
;
�� 
}
�� 	
}
�� 
}�� �+
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\Object.ToOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
publicrr 
staticrr 
Trr 
ToOrDefaultrr #
<rr# $
Trr$ %
>rr% &
(rr& '
thisrr' +
objectrr, 2
@thisrr3 8
,rr8 9
Funcrr: >
<rr> ?
objectrr? E
,rrE F
TrrG H
>rrH I
defaultValueFactoryrrJ ]
)rr] ^
{ss 	
trytt 
{uu 
ifvv 
(vv 
@thisvv 
!=vv 
nullvv !
)vv! "
{ww 
Typexx 

targetTypexx #
=xx$ %
typeofxx& ,
(xx, -
Txx- .
)xx. /
;xx/ 0
ifzz 
(zz 
@thiszz 
.zz 
GetTypezz %
(zz% &
)zz& '
==zz( *

targetTypezz+ 5
)zz5 6
{{{ 
return|| 
(||  
T||  !
)||! "
@this||" '
;||' (
}}} 

	converter" +
=, -
TypeDescriptor. <
.< =
GetConverter= I
(I J
@thisJ O
)O P
;P Q
if
�� 
(
�� 
	converter
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
if
�� 
(
�� 
	converter
�� %
.
��% &
CanConvertTo
��& 2
(
��2 3

targetType
��3 =
)
��= >
)
��> ?
{
�� 
return
�� "
(
��# $
T
��$ %
)
��% &
	converter
��& /
.
��/ 0
	ConvertTo
��0 9
(
��9 :
@this
��: ?
,
��? @

targetType
��A K
)
��K L
;
��L M
}
�� 
}
�� 
	converter
�� 
=
�� 
TypeDescriptor
��  .
.
��. /
GetConverter
��/ ;
(
��; <

targetType
��< F
)
��F G
;
��G H
if
�� 
(
�� 
	converter
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
if
�� 
(
�� 
	converter
�� %
.
��% &
CanConvertFrom
��& 4
(
��4 5
@this
��5 :
.
��: ;
GetType
��; B
(
��B C
)
��C D
)
��D E
)
��E F
{
�� 
return
�� "
(
��# $
T
��$ %
)
��% &
	converter
��& /
.
��/ 0
ConvertFrom
��0 ;
(
��; <
@this
��< A
)
��A B
;
��B C
}
�� 
}
�� 
if
�� 
(
�� 
@this
�� 
==
��  
DBNull
��! '
.
��' (
Value
��( -
)
��- .
{
�� 
return
�� 
(
��  
T
��  !
)
��! "
(
��" #
object
��# )
)
��) *
null
��* .
;
��. /
}
�� 
}
�� 
return
�� 
(
�� 
T
�� 
)
�� 
@this
�� 
;
��  
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� !
defaultValueFactory
�� *
(
��* +
@this
��+ 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
public
�� 
static
�� 
T
�� 
ToOrDefault
�� #
<
��# $
T
��$ %
>
��% &
(
��& '
this
��' +
object
��, 2
@this
��3 8
,
��8 9
Func
��: >
<
��> ?
T
��? @
>
��@ A!
defaultValueFactory
��B U
)
��U V
{
�� 	
return
�� 
@this
�� 
.
�� 
ToOrDefault
�� $
(
��$ %
x
��% &
=>
��' )!
defaultValueFactory
��* =
(
��= >
)
��> ?
)
��? @
;
��@ A
}
�� 	
public
�� 
static
�� 
T
�� 
ToOrDefault
�� #
<
��# $
T
��$ %
>
��% &
(
��& '
this
��' +
object
��, 2
@this
��3 8
)
��8 9
{
�� 	
return
�� 
@this
�� 
.
�� 
ToOrDefault
�� $
(
��$ %
x
��% &
=>
��' )
default
��* 1
(
��1 2
T
��2 3
)
��3 4
)
��4 5
;
��5 6
}
�� 	
public
�� 
static
�� 
T
�� 
ToOrDefault
�� #
<
��# $
T
��$ %
>
��% &
(
��& '
this
��' +
object
��, 2
@this
��3 8
,
��8 9
T
��: ;
defaultValue
��< H
)
��H I
{
�� 	
return
�� 
@this
�� 
.
�� 
ToOrDefault
�� $
(
��$ %
x
��% &
=>
��' )
defaultValue
��* 6
)
��6 7
;
��7 8
}
�� 	
}
�� 
}�� �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToBoolean.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
	ToBoolean

 $
(

$ %
this

% )
object

* 0
@this

1 6
)

6 7
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
	ToBoolean* 3
(3 4
@this4 9
)9 :
;: ;
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToBooleanOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
ToBooleanOrDefault -
(- .
this. 2
object3 9
@this: ?
)? @
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
	ToBoolean. 7
(7 8
@this8 =
)= >
;> ?
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
bool 
ToBooleanOrDefault -
(- .
this. 2
object3 9
@this: ?
,? @
boolA E
defaultValueF R
)R S
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
	ToBoolean"". 7
(""7 8
@this""8 =
)""= >
;""> ?
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
bool00 
ToBooleanOrDefault00 -
(00- .
this00. 2
object003 9
@this00: ?
,00? @
Func00A E
<00E F
bool00F J
>00J K
defaultValueFactory00L _
)00_ `
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
	ToBoolean44. 7
(447 8
@this448 =
)44= >
;44> ?
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
byte

 
ToByte

 !
(

! "
this

" &
object

' -
@this

. 3
)

3 4
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToByte* 0
(0 1
@this1 6
)6 7
;7 8
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToByteOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
ToByteOrDefault *
(* +
this+ /
object0 6
@this7 <
)< =
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToByte. 4
(4 5
@this5 :
): ;
;; <
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
byte 
ToByteOrDefault *
(* +
this+ /
object0 6
@this7 <
,< =
byte> B
defaultValueC O
)O P
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToByte"". 4
(""4 5
@this""5 :
)"": ;
;""; <
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
byte00 
ToByteOrDefault00 *
(00* +
this00+ /
object000 6
@this007 <
,00< =
Func00> B
<00B C
byte00C G
>00G H
defaultValueFactory00I \
)00\ ]
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToByte44. 4
(444 5
@this445 :
)44: ;
;44; <
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToChar.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
char

 
ToChar

 !
(

! "
this

" &
object

' -
@this

. 3
)

3 4
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToChar* 0
(0 1
@this1 6
)6 7
;7 8
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToCharOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
char 
ToCharOrDefault *
(* +
this+ /
object0 6
@this7 <
)< =
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToChar. 4
(4 5
@this5 :
): ;
;; <
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
char 
ToCharOrDefault *
(* +
this+ /
object0 6
@this7 <
,< =
char> B
defaultValueC O
)O P
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToChar"". 4
(""4 5
@this""5 :
)"": ;
;""; <
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
char00 
ToCharOrDefault00 *
(00* +
this00+ /
object000 6
@this007 <
,00< =
Func00> B
<00B C
char00C G
>00G H
defaultValueFactory00I \
)00\ ]
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToChar44. 4
(444 5
@this445 :
)44: ;
;44; <
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDateTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -

ToDateTime

. 8
(

8 9
this

9 =
object

> D
@this

E J
)

J K
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *

ToDateTime* 4
(4 5
@this5 :
): ;
;; <
}
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDateTimeOffSet.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTimeOffset

% 3
ToDateTimeOffSet

4 D
(

D E
this

E I
object

J P
@this

Q V
)

V W
{ 	
return 
new 
global 
:: 
System %
.% &
DateTimeOffset& 4
(4 5
global5 ;
::; =
System= C
.C D
ConvertD K
.K L

ToDateTimeL V
(V W
@thisW \
)\ ]
,] ^
global_ e
::e g
Systemg m
.m n
TimeSpann v
.v w
Zerow {
){ |
;| }
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDateTimeOffSetOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3%
ToDateTimeOffSetOrDefault4 M
(M N
thisN R
objectS Y
@thisZ _
)_ `
{
try 
{ 
return 
new 
global !
::! #
System# )
.) *
DateTimeOffset* 8
(8 9
global9 ?
::? A
SystemA G
.G H
ConvertH O
.O P

ToDateTimeP Z
(Z [
@this[ `
)` a
,a b
globalc i
::i k
Systemk q
.q r
TimeSpanr z
.z {
Zero{ 
)	 �
;
� �
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3%
ToDateTimeOffSetOrDefault4 M
(M N
thisN R
objectS Y
@thisZ _
,_ `
globala g
::g i
Systemi o
.o p
DateTimeOffsetp ~
defaultValue	 �
)
� �
{ 	
try   
{!! 
return"" 
new"" 
global"" !
::""! #
System""# )
."") *
DateTimeOffset""* 8
(""8 9
global""9 ?
::""? A
System""A G
.""G H
Convert""H O
.""O P

ToDateTime""P Z
(""Z [
@this""[ `
)""` a
,""a b
global""c i
::""i k
System""k q
.""q r
TimeSpan""r z
.""z {
Zero""{ 
)	"" �
;
""� �
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
DateTimeOffset00% 3%
ToDateTimeOffSetOrDefault004 M
(00M N
this00N R
object00S Y
@this00Z _
,00_ `
Func00a e
<00e f
global00f l
::00l n
System00n t
.00t u
DateTimeOffset	00u �
>
00� �!
defaultValueFactory
00� �
)
00� �
{11 	
try22 
{33 
return44 
new44 
global44 !
::44! #
System44# )
.44) *
DateTimeOffset44* 8
(448 9
global449 ?
::44? A
System44A G
.44G H
Convert44H O
.44O P

ToDateTime44P Z
(44Z [
@this44[ `
)44` a
,44a b
global44c i
::44i k
System44k q
.44q r
TimeSpan44r z
.44z {
Zero44{ 
)	44 �
;
44� �
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDateTimeOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
ToDateTimeOrDefault. A
(A B
thisB F
objectG M
@thisN S
)S T
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .

ToDateTime. 8
(8 9
@this9 >
)> ?
;? @
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
global 
:: 
System $
.$ %
DateTime% -
ToDateTimeOrDefault. A
(A B
thisB F
objectG M
@thisN S
,S T
globalU [
::[ ]
System] c
.c d
DateTimed l
defaultValuem y
)y z
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .

ToDateTime"". 8
(""8 9
@this""9 >
)""> ?
;""? @
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
DateTime00% -
ToDateTimeOrDefault00. A
(00A B
this00B F
object00G M
@this00N S
,00S T
Func00U Y
<00Y Z
global00Z `
::00` b
System00b h
.00h i
DateTime00i q
>00q r 
defaultValueFactory	00s �
)
00� �
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .

ToDateTime44. 8
(448 9
@this449 >
)44> ?
;44? @
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
publicAA 
staticAA 
globalAA 
::AA 
SystemAA $
.AA$ %
DateTimeAA% -
?AA- .
ToDateTimeOrNullAA/ ?
(AA? @
thisAA@ D
objectAAE K
@thisAAL Q
)AAQ R
{BB 	
tryCC 
{DD 
returnEE 
globalEE 
::EE 
SystemEE %
.EE% &
ConvertEE& -
.EE- .

ToDateTimeEE. 8
(EE8 9
@thisEE9 >
)EE> ?
;EE? @
}FF 
catchGG 
(GG 
	ExceptionGG 
)GG 
{HH 
returnII 
nullII 
;II 
}JJ 
}KK 	
}LL 
}MM �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDecimal.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
decimal

 
	ToDecimal

 '
(

' (
this

( ,
object

- 3
@this

4 9
)

9 :
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
	ToDecimal* 3
(3 4
@this4 9
)9 :
;: ;
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDecimalOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
ToDecimalOrDefault 0
(0 1
this1 5
object6 <
@this= B
)B C
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
	ToDecimal. 7
(7 8
@this8 =
)= >
;> ?
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
decimal 
ToDecimalOrDefault 0
(0 1
this1 5
object6 <
@this= B
,B C
decimalD K
defaultValueL X
)X Y
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
	ToDecimal"". 7
(""7 8
@this""8 =
)""= >
;""> ?
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
decimal00 
ToDecimalOrDefault00 0
(000 1
this001 5
object006 <
@this00= B
,00B C
Func00D H
<00H I
decimal00I P
>00P Q
defaultValueFactory00R e
)00e f
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
	ToDecimal44. 7
(447 8
@this448 =
)44= >
;44> ?
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDouble.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
double

 
ToDouble

 %
(

% &
this

& *
object

+ 1
@this

2 7
)

7 8
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToDouble* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToDoubleOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
ToDoubleOrDefault .
(. /
this/ 3
object4 :
@this; @
)@ A
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToDouble. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
double 
ToDoubleOrDefault .
(. /
this/ 3
object4 :
@this; @
,@ A
doubleB H
defaultValueI U
)U V
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToDouble"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
double00 
ToDoubleOrDefault00 .
(00. /
this00/ 3
object004 :
@this00; @
,00@ A
Func00B F
<00F G
double00G M
>00M N
defaultValueFactory00O b
)00b c
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToDouble44. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToFloat.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
float

 
ToFloat

 #
(

# $
this

$ (
object

) /
@this

0 5
)

5 6
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToSingle* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToFloatOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
ToFloatOrDefault ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToSingle. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
float 
ToFloatOrDefault ,
(, -
this- 1
object2 8
@this9 >
,> ?
float@ E
defaultValueF R
)R S
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToSingle"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
float00 
ToFloatOrDefault00 ,
(00, -
this00- 1
object002 8
@this009 >
,00> ?
Func00@ D
<00D E
float00E J
>00J K
defaultValueFactory00L _
)00_ `
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToSingle44. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToGuid.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
Guid

% )
ToGuid

* 0
(

0 1
this

1 5
object

6 <
@this

= B
)

B C
{ 	
return 
new 
global 
:: 
System %
.% &
Guid& *
(* +
@this+ 0
.0 1
ToString1 9
(9 :
): ;
); <
;< =
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToGuidOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Guid% )
ToGuidOrDefault* 9
(9 :
this: >
object? E
@thisF K
)K L
{
try 
{ 
return 
new 
global !
::! #
System# )
.) *
Guid* .
(. /
@this/ 4
.4 5
ToString5 =
(= >
)> ?
)? @
;@ A
} 
catch 
( 
	Exception 
) 
{ 
return 
global 
:: 
System %
.% &
Guid& *
.* +
Empty+ 0
;0 1
} 
} 	
public 
static 
global 
:: 
System $
.$ %
Guid% )
ToGuidOrDefault* 9
(9 :
this: >
object? E
@thisF K
,K L
globalM S
::S U
SystemU [
.[ \
Guid\ `
defaultValuea m
)m n
{ 	
try   
{!! 
return"" 
new"" 
global"" !
::""! #
System""# )
."") *
Guid""* .
("". /
@this""/ 4
.""4 5
ToString""5 =
(""= >
)""> ?
)""? @
;""@ A
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
Guid00% )
ToGuidOrDefault00* 9
(009 :
this00: >
object00? E
@this00F K
,00K L
Func00M Q
<00Q R
global00R X
::00X Z
System00Z `
.00` a
Guid00a e
>00e f
defaultValueFactory00g z
)00z {
{11 	
try22 
{33 
return44 
new44 
global44 !
::44! #
System44# )
.44) *
Guid44* .
(44. /
@this44/ 4
.444 5
ToString445 =
(44= >
)44> ?
)44? @
;44@ A
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
short

 
ToInt16

 #
(

# $
this

$ (
object

) /
@this

0 5
)

5 6
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt16* 1
(1 2
@this2 7
)7 8
;8 9
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToInt16OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
ToInt16OrDefault ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt16. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
short 
ToInt16OrDefault ,
(, -
this- 1
object2 8
@this9 >
,> ?
short@ E
defaultValueF R
)R S
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToInt16"". 5
(""5 6
@this""6 ;
)""; <
;""< =
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
short00 
ToInt16OrDefault00 ,
(00, -
this00- 1
object002 8
@this009 >
,00> ?
Func00@ D
<00D E
short00E J
>00J K
defaultValueFactory00L _
)00_ `
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToInt1644. 5
(445 6
@this446 ;
)44; <
;44< =
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
int

 
ToInt32

 !
(

! "
this

" &
object

' -
@this

. 3
)

3 4
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt32* 1
(1 2
@this2 7
)7 8
;8 9
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToInt32OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
ToInt32OrDefault *
(* +
this+ /
object0 6
@this7 <
)< =
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt32. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
int 
ToInt32OrDefault *
(* +
this+ /
object0 6
@this7 <
,< =
int> A
defaultValueB N
)N O
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToInt32"". 5
(""5 6
@this""6 ;
)""; <
;""< =
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
int00 
ToInt32OrDefault00 *
(00* +
this00+ /
object000 6
@this007 <
,00< =
Func00> B
<00B C
int00C F
>00F G
defaultValueFactory00H [
)00[ \
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToInt3244. 5
(445 6
@this446 ;
)44; <
;44< =
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
long

 
ToInt64

 "
(

" #
this

# '
object

( .
@this

/ 4
)

4 5
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt64* 1
(1 2
@this2 7
)7 8
;8 9
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToInt64OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
ToInt64OrDefault +
(+ ,
this, 0
object1 7
@this8 =
)= >
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt64. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
long 
ToInt64OrDefault +
(+ ,
this, 0
object1 7
@this8 =
,= >
long? C
defaultValueD P
)P Q
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToInt64"". 5
(""5 6
@this""6 ;
)""; <
;""< =
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
long00 
ToInt64OrDefault00 +
(00+ ,
this00, 0
object001 7
@this008 =
,00= >
Func00? C
<00C D
long00D H
>00H I
defaultValueFactory00J ]
)00] ^
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToInt6444. 5
(445 6
@this446 ;
)44; <
;44< =
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToLong.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
long

 
ToLong

 !
(

! "
this

" &
object

' -
@this

. 3
)

3 4
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt64* 1
(1 2
@this2 7
)7 8
;8 9
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToLongOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
ToLongOrDefault *
(* +
this+ /
object0 6
@this7 <
)< =
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt64. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
long 
ToLongOrDefault *
(* +
this+ /
object0 6
@this7 <
,< =
long> B
defaultValueC O
)O P
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToInt64"". 5
(""5 6
@this""6 ;
)""; <
;""< =
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
long00 
ToLongOrDefault00 *
(00* +
this00+ /
object000 6
@this007 <
,00< =
Func00> B
<00B C
long00C G
>00G H
defaultValueFactory00I \
)00\ ]
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToInt6444. 5
(445 6
@this446 ;
)44; <
;44< =
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableBoolean.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
? 
ToNullableBoolean -
(- .
this. 2
object3 9
@this: ?
)? @
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
	ToBoolean* 3
(3 4
@this4 9
)9 :
;: ;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableBooleanOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
? &
ToNullableBooleanOrDefault 6
(6 7
this7 ;
object< B
@thisC H
)H I
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
	ToBoolean. 7
(7 8
@this8 =
)= >
;> ?
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
bool #
)# $
;$ %
} 
} 	
public## 
static## 
bool## 
?## &
ToNullableBooleanOrDefault## 6
(##6 7
this##7 ;
object##< B
@this##C H
,##H I
bool##J N
?##N O
defaultValue##P \
)##\ ]
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
	ToBoolean,,. 7
(,,7 8
@this,,8 =
),,= >
;,,> ?
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
bool:: 
?:: &
ToNullableBooleanOrDefault:: 6
(::6 7
this::7 ;
object::< B
@this::C H
,::H I
Func::J N
<::N O
bool::O S
?::S T
>::T U
defaultValueFactory::V i
)::i j
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
	ToBooleanCC. 7
(CC7 8
@thisCC8 =
)CC= >
;CC> ?
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
? 
ToNullableByte *
(* +
this+ /
object0 6
@this7 <
)< =
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToByte* 0
(0 1
@this1 6
)6 7
;7 8
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableByteOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
byte 
? #
ToNullableByteOrDefault 3
(3 4
this4 8
object9 ?
@this@ E
)E F
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToByte. 4
(4 5
@this5 :
): ;
;; <
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
byte #
)# $
;$ %
} 
} 	
public## 
static## 
byte## 
?## #
ToNullableByteOrDefault## 3
(##3 4
this##4 8
object##9 ?
@this##@ E
,##E F
byte##G K
?##K L
defaultValue##M Y
)##Y Z
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToByte,,. 4
(,,4 5
@this,,5 :
),,: ;
;,,; <
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
byte:: 
?:: #
ToNullableByteOrDefault:: 3
(::3 4
this::4 8
object::9 ?
@this::@ E
,::E F
Func::G K
<::K L
byte::L P
?::P Q
>::Q R
defaultValueFactory::S f
)::f g
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToByteCC. 4
(CC4 5
@thisCC5 :
)CC: ;
;CC; <
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableChar.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
char 
? 
ToNullableChar *
(* +
this+ /
object0 6
@this7 <
)< =
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToChar* 0
(0 1
@this1 6
)6 7
;7 8
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableCharOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
char 
? #
ToNullableCharOrDefault 3
(3 4
this4 8
object9 ?
@this@ E
)E F
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToChar. 4
(4 5
@this5 :
): ;
;; <
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
char #
)# $
;$ %
} 
} 	
public## 
static## 
char## 
?## #
ToNullableCharOrDefault## 3
(##3 4
this##4 8
object##9 ?
@this##@ E
,##E F
char##G K
?##K L
defaultValue##M Y
)##Y Z
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToChar,,. 4
(,,4 5
@this,,5 :
),,: ;
;,,; <
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
char:: 
?:: #
ToNullableCharOrDefault:: 3
(::3 4
this::4 8
object::9 ?
@this::@ E
,::E F
Func::G K
<::K L
char::L P
?::P Q
>::Q R
defaultValueFactory::S f
)::f g
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToCharCC. 4
(CC4 5
@thisCC5 :
)CC: ;
;CC; <
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDateTime.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
?- .
ToNullableDateTime/ A
(A B
thisB F
objectG M
@thisN S
)S T
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *

ToDateTime* 4
(4 5
@this5 :
): ;
;; <
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDateTimeOffSet.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3
?3 4$
ToNullableDateTimeOffSet5 M
(M N
thisN R
objectS Y
@thisZ _
)_ `
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
new 
global 
:: 
System %
.% &
DateTimeOffset& 4
(4 5
global5 ;
::; =
System= C
.C D
ConvertD K
.K L

ToDateTimeL V
(V W
@thisW \
)\ ]
,] ^
global_ e
::e g
Systemg m
.m n
TimeSpann v
.v w
Zerow {
){ |
;| }
} 	
} 
} �'
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDateTimeOffSetOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTimeOffset% 3
?3 4-
!ToNullableDateTimeOffSetOrDefault5 V
(V W
thisW [
object\ b
@thisc h
)h i
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
new 
global !
::! #
System# )
.) *
DateTimeOffset* 8
(8 9
global9 ?
::? A
SystemA G
.G H
ConvertH O
.O P

ToDateTimeP Z
(Z [
@this[ `
)` a
,a b
globalc i
::i k
Systemk q
.q r
TimeSpanr z
.z {
Zero{ 
)	 �
;
� �
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
global %
::% '
System' -
.- .
DateTimeOffset. <
)< =
;= >
} 
} 	
public## 
static## 
global## 
::## 
System## $
.##$ %
DateTimeOffset##% 3
?##3 4-
!ToNullableDateTimeOffSetOrDefault##5 V
(##V W
this##W [
object##\ b
@this##c h
,##h i
global##j p
::##p r
System##r x
.##x y
DateTimeOffset	##y �
?
##� �
defaultValue
##� �
)
##� �
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
new,, 
global,, !
::,,! #
System,,# )
.,,) *
DateTimeOffset,,* 8
(,,8 9
global,,9 ?
::,,? A
System,,A G
.,,G H
Convert,,H O
.,,O P

ToDateTime,,P Z
(,,Z [
@this,,[ `
),,` a
,,,a b
global,,c i
::,,i k
System,,k q
.,,q r
TimeSpan,,r z
.,,z {
Zero,,{ 
)	,, �
;
,,� �
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
global:: 
:::: 
System:: $
.::$ %
DateTimeOffset::% 3
?::3 4-
!ToNullableDateTimeOffSetOrDefault::5 V
(::V W
this::W [
object::\ b
@this::c h
,::h i
Func::j n
<::n o
global::o u
::::u w
System::w }
.::} ~
DateTimeOffset	::~ �
?
::� �
>
::� �!
defaultValueFactory
::� �
)
::� �
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
newCC 
globalCC !
::CC! #
SystemCC# )
.CC) *
DateTimeOffsetCC* 8
(CC8 9
globalCC9 ?
::CC? A
SystemCCA G
.CCG H
ConvertCCH O
.CCO P

ToDateTimeCCP Z
(CCZ [
@thisCC[ `
)CC` a
,CCa b
globalCCc i
::CCi k
SystemCCk q
.CCq r
TimeSpanCCr z
.CCz {
ZeroCC{ 
)	CC �
;
CC� �
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK � 
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDateTimeOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
?- .'
ToNullableDateTimeOrDefault/ J
(J K
thisK O
objectP V
@thisW \
)\ ]
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .

ToDateTime. 8
(8 9
@this9 >
)> ?
;? @
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
global %
::% '
System' -
.- .
DateTime. 6
)6 7
;7 8
} 
} 	
public## 
static## 
global## 
::## 
System## $
.##$ %
DateTime##% -
?##- .'
ToNullableDateTimeOrDefault##/ J
(##J K
this##K O
object##P V
@this##W \
,##\ ]
global##^ d
::##d f
System##f l
.##l m
DateTime##m u
?##u v
defaultValue	##w �
)
##� �
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .

ToDateTime,,. 8
(,,8 9
@this,,9 >
),,> ?
;,,? @
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
global:: 
:::: 
System:: $
.::$ %
DateTime::% -
?::- .'
ToNullableDateTimeOrDefault::/ J
(::J K
this::K O
object::P V
@this::W \
,::\ ]
Func::^ b
<::b c
global::c i
::::i k
System::k q
.::q r
DateTime::r z
?::z {
>::{ | 
defaultValueFactory	::} �
)
::� �
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .

ToDateTimeCC. 8
(CC8 9
@thisCC9 >
)CC> ?
;CC? @
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDecimal.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
? 
ToNullableDecimal 0
(0 1
this1 5
object6 <
@this= B
)B C
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
	ToDecimal* 3
(3 4
@this4 9
)9 :
;: ;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDecimalOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
? &
ToNullableDecimalOrDefault 9
(9 :
this: >
object? E
@thisF K
)K L
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
	ToDecimal. 7
(7 8
@this8 =
)= >
;> ?
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
decimal &
)& '
;' (
} 
} 	
public## 
static## 
decimal## 
?## &
ToNullableDecimalOrDefault## 9
(##9 :
this##: >
object##? E
@this##F K
,##K L
decimal##M T
?##T U
defaultValue##V b
)##b c
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
	ToDecimal,,. 7
(,,7 8
@this,,8 =
),,= >
;,,> ?
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
decimal:: 
?:: &
ToNullableDecimalOrDefault:: 9
(::9 :
this::: >
object::? E
@this::F K
,::K L
Func::M Q
<::Q R
decimal::R Y
?::Y Z
>::Z [
defaultValueFactory::\ o
)::o p
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
	ToDecimalCC. 7
(CC7 8
@thisCC8 =
)CC= >
;CC> ?
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDouble.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
? 
ToNullableDouble .
(. /
this/ 3
object4 :
@this; @
)@ A
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToDouble* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableDoubleOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
? %
ToNullableDoubleOrDefault 7
(7 8
this8 <
object= C
@thisD I
)I J
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToDouble. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
double %
)% &
;& '
} 
} 	
public## 
static## 
double## 
?## %
ToNullableDoubleOrDefault## 7
(##7 8
this##8 <
object##= C
@this##D I
,##I J
double##K Q
?##Q R
defaultValue##S _
)##_ `
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToDouble,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
double:: 
?:: %
ToNullableDoubleOrDefault:: 7
(::7 8
this::8 <
object::= C
@this::D I
,::I J
Func::K O
<::O P
double::P V
?::V W
>::W X
defaultValueFactory::Y l
)::l m
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToDoubleCC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableFloat.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
? 
ToNullableFloat ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToSingle* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableFloatOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
? $
ToNullableFloatOrDefault 5
(5 6
this6 :
object; A
@thisB G
)G H
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToSingle. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
float $
)$ %
;% &
} 
} 	
public## 
static## 
float## 
?## $
ToNullableFloatOrDefault## 5
(##5 6
this##6 :
object##; A
@this##B G
,##G H
float##I N
?##N O
defaultValue##P \
)##\ ]
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToSingle,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
float:: 
?:: $
ToNullableFloatOrDefault:: 5
(::5 6
this::6 :
object::; A
@this::B G
,::G H
Func::I M
<::M N
float::N S
?::S T
>::T U
defaultValueFactory::V i
)::i j
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToSingleCC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableGuid.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Guid% )
?) *
ToNullableGuid+ 9
(9 :
this: >
object? E
@thisF K
)K L
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
new 
global 
:: 
System %
.% &
Guid& *
(* +
@this+ 0
.0 1
ToString1 9
(9 :
): ;
); <
;< =
} 	
} 
} �!
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableGuidOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Guid% )
?) *#
ToNullableGuidOrDefault+ B
(B C
thisC G
objectH N
@thisO T
)T U
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
new 
global !
::! #
System# )
.) *
Guid* .
(. /
@this/ 4
.4 5
ToString5 =
(= >
)> ?
)? @
;@ A
} 
catch 
( 
	Exception 
) 
{ 
return 
global 
:: 
System %
.% &
Guid& *
.* +
Empty+ 0
;0 1
} 
} 	
public## 
static## 
global## 
::## 
System## $
.##$ %
Guid##% )
?##) *#
ToNullableGuidOrDefault##+ B
(##B C
this##C G
object##H N
@this##O T
,##T U
global##V \
::##\ ^
System##^ d
.##d e
Guid##e i
?##i j
defaultValue##k w
)##w x
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
new,, 
global,, !
::,,! #
System,,# )
.,,) *
Guid,,* .
(,,. /
@this,,/ 4
.,,4 5
ToString,,5 =
(,,= >
),,> ?
),,? @
;,,@ A
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
global:: 
:::: 
System:: $
.::$ %
Guid::% )
?::) *#
ToNullableGuidOrDefault::+ B
(::B C
this::C G
object::H N
@this::O T
,::T U
Func::V Z
<::Z [
global::[ a
::::a c
System::c i
.::i j
Guid::j n
?::n o
>::o p 
defaultValueFactory	::q �
)
::� �
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
newCC 
globalCC !
::CC! #
SystemCC# )
.CC) *
GuidCC* .
(CC. /
@thisCC/ 4
.CC4 5
ToStringCC5 =
(CC= >
)CC> ?
)CC? @
;CC@ A
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
? 
ToNullableInt16 ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt16* 1
(1 2
@this2 7
)7 8
;8 9
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableInt16OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
? $
ToNullableInt16OrDefault 5
(5 6
this6 :
object; A
@thisB G
)G H
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt16. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
short $
)$ %
;% &
} 
} 	
public## 
static## 
short## 
?## $
ToNullableInt16OrDefault## 5
(##5 6
this##6 :
object##; A
@this##B G
,##G H
short##I N
?##N O
defaultValue##P \
)##\ ]
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToInt16,,. 5
(,,5 6
@this,,6 ;
),,; <
;,,< =
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
short:: 
?:: $
ToNullableInt16OrDefault:: 5
(::5 6
this::6 :
object::; A
@this::B G
,::G H
Func::I M
<::M N
short::N S
?::S T
>::T U
defaultValueFactory::V i
)::i j
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToInt16CC. 5
(CC5 6
@thisCC6 ;
)CC; <
;CC< =
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
? 
ToNullableInt32 *
(* +
this+ /
object0 6
@this7 <
)< =
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt32* 1
(1 2
@this2 7
)7 8
;8 9
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableInt32OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
? $
ToNullableInt32OrDefault 3
(3 4
this4 8
object9 ?
@this@ E
)E F
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt32. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
int "
)" #
;# $
} 
} 	
public## 
static## 
int## 
?## $
ToNullableInt32OrDefault## 3
(##3 4
this##4 8
object##9 ?
@this##@ E
,##E F
int##G J
?##J K
defaultValue##L X
)##X Y
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToInt32,,. 5
(,,5 6
@this,,6 ;
),,; <
;,,< =
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
int:: 
?:: $
ToNullableInt32OrDefault:: 3
(::3 4
this::4 8
object::9 ?
@this::@ E
,::E F
Func::G K
<::K L
int::L O
?::O P
>::P Q
defaultValueFactory::R e
)::e f
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToInt32CC. 5
(CC5 6
@thisCC6 ;
)CC; <
;CC< =
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
? 
ToNullableInt64 +
(+ ,
this, 0
object1 7
@this8 =
)= >
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt64* 1
(1 2
@this2 7
)7 8
;8 9
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableInt64OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
? $
ToNullableInt64OrDefault 4
(4 5
this5 9
object: @
@thisA F
)F G
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt64. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
long #
)# $
;$ %
} 
} 	
public## 
static## 
long## 
?## $
ToNullableInt64OrDefault## 4
(##4 5
this##5 9
object##: @
@this##A F
,##F G
long##H L
?##L M
defaultValue##N Z
)##Z [
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToInt64,,. 5
(,,5 6
@this,,6 ;
),,; <
;,,< =
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
long:: 
?:: $
ToNullableInt64OrDefault:: 4
(::4 5
this::5 9
object::: @
@this::A F
,::F G
Func::H L
<::L M
long::M Q
?::Q R
>::R S
defaultValueFactory::T g
)::g h
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToInt64CC. 5
(CC5 6
@thisCC6 ;
)CC; <
;CC< =
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableLong.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
? 
ToNullableLong *
(* +
this+ /
object0 6
@this7 <
)< =
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt64* 1
(1 2
@this2 7
)7 8
;8 9
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableLongOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
? #
ToNullableLongOrDefault 3
(3 4
this4 8
object9 ?
@this@ E
)E F
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt64. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
long #
)# $
;$ %
} 
} 	
public## 
static## 
long## 
?## #
ToNullableLongOrDefault## 3
(##3 4
this##4 8
object##9 ?
@this##@ E
,##E F
long##G K
?##K L
defaultValue##M Y
)##Y Z
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToInt64,,. 5
(,,5 6
@this,,6 ;
),,; <
;,,< =
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
long:: 
?:: #
ToNullableLongOrDefault:: 3
(::3 4
this::4 8
object::9 ?
@this::@ E
,::E F
Func::G K
<::K L
long::L P
?::P Q
>::Q R
defaultValueFactory::S f
)::f g
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToInt64CC. 5
(CC5 6
@thisCC6 ;
)CC; <
;CC< =
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableSByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
sbyte 
? 
ToNullableSByte ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToSByte* 1
(1 2
@this2 7
)7 8
;8 9
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableSByteOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
sbyte 
? $
ToNullableSByteOrDefault 5
(5 6
this6 :
object; A
@thisB G
)G H
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToSByte. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
sbyte $
)$ %
;% &
} 
} 	
public## 
static## 
sbyte## 
?## $
ToNullableSByteOrDefault## 5
(##5 6
this##6 :
object##; A
@this##B G
,##G H
sbyte##I N
?##N O
defaultValue##P \
)##\ ]
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToSByte,,. 5
(,,5 6
@this,,6 ;
),,; <
;,,< =
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
sbyte:: 
?:: $
ToNullableSByteOrDefault:: 5
(::5 6
this::6 :
object::; A
@this::B G
,::G H
Func::I M
<::M N
sbyte::N S
?::S T
>::T U
defaultValueFactory::V i
)::i j
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToSByteCC. 5
(CC5 6
@thisCC6 ;
)CC; <
;CC< =
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableShort.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
? 
ToNullableShort ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt16* 1
(1 2
@this2 7
)7 8
;8 9
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableShortOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
? $
ToNullableShortOrDefault 5
(5 6
this6 :
object; A
@thisB G
)G H
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt16. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
short $
)$ %
;% &
} 
} 	
public## 
static## 
short## 
?## $
ToNullableShortOrDefault## 5
(##5 6
this##6 :
object##; A
@this##B G
,##G H
short##I N
?##N O
defaultValue##P \
)##\ ]
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToInt16,,. 5
(,,5 6
@this,,6 ;
),,; <
;,,< =
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
short:: 
?:: $
ToNullableShortOrDefault:: 5
(::5 6
this::6 :
object::; A
@this::B G
,::G H
Func::I M
<::M N
short::N S
?::S T
>::T U
defaultValueFactory::V i
)::i j
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToInt16CC. 5
(CC5 6
@thisCC6 ;
)CC; <
;CC< =
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableSingle.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
? 
ToNullableSingle -
(- .
this. 2
object3 9
@this: ?
)? @
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToSingle* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableSingleOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
? %
ToNullableSingleOrDefault 6
(6 7
this7 ;
object< B
@thisC H
)H I
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToSingle. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
float $
)$ %
;% &
} 
} 	
public## 
static## 
float## 
?## %
ToNullableSingleOrDefault## 6
(##6 7
this##7 ;
object##< B
@this##C H
,##H I
float##J O
?##O P
defaultValue##Q ]
)##] ^
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToSingle,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
float:: 
?:: %
ToNullableSingleOrDefault:: 6
(::6 7
this::7 ;
object::< B
@this::C H
,::H I
Func::J N
<::N O
float::O T
?::T U
>::U V
defaultValueFactory::W j
)::j k
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToSingleCC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
? 
ToNullableUInt16 .
(. /
this/ 3
object4 :
@this; @
)@ A
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt16* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUInt16OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
? %
ToNullableUInt16OrDefault 7
(7 8
this8 <
object= C
@thisD I
)I J
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt16. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
ushort %
)% &
;& '
} 
} 	
public## 
static## 
ushort## 
?## %
ToNullableUInt16OrDefault## 7
(##7 8
this##8 <
object##= C
@this##D I
,##I J
ushort##K Q
?##Q R
defaultValue##S _
)##_ `
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToUInt16,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
ushort:: 
?:: %
ToNullableUInt16OrDefault:: 7
(::7 8
this::8 <
object::= C
@this::D I
,::I J
Func::K O
<::O P
ushort::P V
?::V W
>::W X
defaultValueFactory::Y l
)::l m
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToUInt16CC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
uint 
? 
ToNullableUInt32 ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt32* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUInt32OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
uint 
? %
ToNullableUInt32OrDefault 5
(5 6
this6 :
object; A
@thisB G
)G H
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt32. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
uint #
)# $
;$ %
} 
} 	
public## 
static## 
uint## 
?## %
ToNullableUInt32OrDefault## 5
(##5 6
this##6 :
object##; A
@this##B G
,##G H
uint##I M
?##M N
defaultValue##O [
)##[ \
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToUInt32,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
uint:: 
?:: %
ToNullableUInt32OrDefault:: 5
(::5 6
this::6 :
object::; A
@this::B G
,::G H
Func::I M
<::M N
uint::N R
?::R S
>::S T
defaultValueFactory::U h
)::h i
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToUInt32CC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
? 
ToNullableUInt64 -
(- .
this. 2
object3 9
@this: ?
)? @
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt64* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUInt64OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
? %
ToNullableUInt64OrDefault 6
(6 7
this7 ;
object< B
@thisC H
)H I
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt64. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
ulong $
)$ %
;% &
} 
} 	
public## 
static## 
ulong## 
?## %
ToNullableUInt64OrDefault## 6
(##6 7
this##7 ;
object##< B
@this##C H
,##H I
ulong##J O
?##O P
defaultValue##Q ]
)##] ^
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToUInt64,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
ulong:: 
?:: %
ToNullableUInt64OrDefault:: 6
(::6 7
this::7 ;
object::< B
@this::C H
,::H I
Func::J N
<::N O
ulong::O T
?::T U
>::U V
defaultValueFactory::W j
)::j k
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToUInt64CC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableULong.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
? 
ToNullableULong ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt64* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableULongOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
? $
ToNullableULongOrDefault 5
(5 6
this6 :
object; A
@thisB G
)G H
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt64. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
ulong $
)$ %
;% &
} 
} 	
public## 
static## 
ulong## 
?## $
ToNullableULongOrDefault## 5
(##5 6
this##6 :
object##; A
@this##B G
,##G H
ulong##I N
?##N O
defaultValue##P \
)##\ ]
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToUInt64,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
ulong:: 
?:: $
ToNullableULongOrDefault:: 5
(::5 6
this::6 :
object::; A
@this::B G
,::G H
Func::I M
<::M N
ulong::N S
?::S T
>::T U
defaultValueFactory::V i
)::i j
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToUInt64CC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUShort.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
? 
ToNullableUShort .
(. /
this/ 3
object4 :
@this; @
)@ A
{
if 
( 
@this 
== 
null 
||  
@this! &
==' )
DBNull* 0
.0 1
Value1 6
)6 7
{ 
return 
null 
; 
} 
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt16* 2
(2 3
@this3 8
)8 9
;9 :
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToNullableUShortOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
? %
ToNullableUShortOrDefault 7
(7 8
this8 <
object= C
@thisD I
)I J
{
try 
{ 
if 
( 
@this 
== 
null !
||" $
@this% *
==+ -
DBNull. 4
.4 5
Value5 :
): ;
{ 
return 
null 
;  
} 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt16. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
( 
ushort %
)% &
;& '
} 
} 	
public## 
static## 
ushort## 
?## %
ToNullableUShortOrDefault## 7
(##7 8
this##8 <
object##= C
@this##D I
,##I J
ushort##K Q
?##Q R
defaultValue##S _
)##_ `
{$$ 	
try%% 
{&& 
if'' 
('' 
@this'' 
=='' 
null'' !
||''" $
@this''% *
==''+ -
DBNull''. 4
.''4 5
Value''5 :
)'': ;
{(( 
return)) 
null)) 
;))  
}** 
return,, 
global,, 
::,, 
System,, %
.,,% &
Convert,,& -
.,,- .
ToUInt16,,. 6
(,,6 7
@this,,7 <
),,< =
;,,= >
}-- 
catch.. 
(.. 
	Exception.. 
).. 
{// 
return00 
defaultValue00 #
;00# $
}11 
}22 	
public:: 
static:: 
ushort:: 
?:: %
ToNullableUShortOrDefault:: 7
(::7 8
this::8 <
object::= C
@this::D I
,::I J
Func::K O
<::O P
ushort::P V
?::V W
>::W X
defaultValueFactory::Y l
)::l m
{;; 	
try<< 
{== 
if>> 
(>> 
@this>> 
==>> 
null>> !
||>>" $
@this>>% *
==>>+ -
DBNull>>. 4
.>>4 5
Value>>5 :
)>>: ;
{?? 
return@@ 
null@@ 
;@@  
}AA 
returnCC 
globalCC 
::CC 
SystemCC %
.CC% &
ConvertCC& -
.CC- .
ToUInt16CC. 6
(CC6 7
@thisCC7 <
)CC< =
;CC= >
}DD 
catchEE 
(EE 
	ExceptionEE 
)EE 
{FF 
returnGG 
defaultValueFactoryGG *
(GG* +
)GG+ ,
;GG, -
}HH 
}II 	
}JJ 
}KK �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToSByte.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
sbyte

 
ToSByte

 #
(

# $
this

$ (
object

) /
@this

0 5
)

5 6
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToSByte* 1
(1 2
@this2 7
)7 8
;8 9
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToSByteOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
sbyte 
ToSByteOrDefault ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToSByte. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
sbyte 
ToSByteOrDefault ,
(, -
this- 1
object2 8
@this9 >
,> ?
sbyte@ E
defaultValueF R
)R S
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToSByte"". 5
(""5 6
@this""6 ;
)""; <
;""< =
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
sbyte00 
ToSByteOrDefault00 ,
(00, -
this00- 1
object002 8
@this009 >
,00> ?
Func00@ D
<00D E
sbyte00E J
>00J K
defaultValueFactory00L _
)00_ `
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToSByte44. 5
(445 6
@this446 ;
)44; <
;44< =
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToShort.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
short

 
ToShort

 #
(

# $
this

$ (
object

) /
@this

0 5
)

5 6
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToInt16* 1
(1 2
@this2 7
)7 8
;8 9
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToShortOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
ToShortOrDefault ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToInt16. 5
(5 6
@this6 ;
); <
;< =
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
short 
ToShortOrDefault ,
(, -
this- 1
object2 8
@this9 >
,> ?
short@ E
defaultValueF R
)R S
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToInt16"". 5
(""5 6
@this""6 ;
)""; <
;""< =
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
short00 
ToShortOrDefault00 ,
(00, -
this00- 1
object002 8
@this009 >
,00> ?
Func00@ D
<00D E
short00E J
>00J K
defaultValueFactory00L _
)00_ `
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToInt1644. 5
(445 6
@this446 ;
)44; <
;44< =
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToSingle.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
float

 
ToSingle

 $
(

$ %
this

% )
object

* 0
@this

1 6
)

6 7
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToSingle* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToSingleOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
ToSingleOrDefault -
(- .
this. 2
object3 9
@this: ?
)? @
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToSingle. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
float 
ToSingleOrDefault -
(- .
this. 2
object3 9
@this: ?
,? @
floatA F
defaultValueG S
)S T
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToSingle"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
float00 
ToSingleOrDefault00 -
(00- .
this00. 2
object003 9
@this00: ?
,00? @
Func00A E
<00E F
float00F K
>00K L
defaultValueFactory00M `
)00` a
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToSingle44. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
ToString

 %
(

% &
this

& *
object

+ 1
@this

2 7
)

7 8
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToString* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToStringOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToStringOrDefault .
(. /
this/ 3
object4 :
@this; @
)@ A
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToString. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
string 
ToStringOrDefault .
(. /
this/ 3
object4 :
@this; @
,@ A
stringB H
defaultValueI U
)U V
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToString"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
string00 
ToStringOrDefault00 .
(00. /
this00/ 3
object004 :
@this00; @
,00@ A
Func00B F
<00F G
string00G M
>00M N
defaultValueFactory00O b
)00b c
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToString44. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
ushort

 
ToUInt16

 %
(

% &
this

& *
object

+ 1
@this

2 7
)

7 8
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt16* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUInt16OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
ToUInt16OrDefault .
(. /
this/ 3
object4 :
@this; @
)@ A
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt16. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
ushort 
ToUInt16OrDefault .
(. /
this/ 3
object4 :
@this; @
,@ A
ushortB H
defaultValueI U
)U V
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToUInt16"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
ushort00 
ToUInt16OrDefault00 .
(00. /
this00/ 3
object004 :
@this00; @
,00@ A
Func00B F
<00F G
ushort00G M
>00M N
defaultValueFactory00O b
)00b c
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToUInt1644. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
uint

 
ToUInt32

 #
(

# $
this

$ (
object

) /
@this

0 5
)

5 6
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt32* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUInt32OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
uint 
ToUInt32OrDefault ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt32. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
uint 
ToUInt32OrDefault ,
(, -
this- 1
object2 8
@this9 >
,> ?
uint@ D
defaultValueE Q
)Q R
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToUInt32"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
uint00 
ToUInt32OrDefault00 ,
(00, -
this00- 1
object002 8
@this009 >
,00> ?
Func00@ D
<00D E
uint00E I
>00I J
defaultValueFactory00K ^
)00^ _
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToUInt3244. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
ulong

 
ToUInt64

 $
(

$ %
this

% )
object

* 0
@this

1 6
)

6 7
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt64* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUInt64OrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
ToUInt64OrDefault -
(- .
this. 2
object3 9
@this: ?
)? @
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt64. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
ulong 
ToUInt64OrDefault -
(- .
this. 2
object3 9
@this: ?
,? @
ulongA F
defaultValueG S
)S T
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToUInt64"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
ulong00 
ToUInt64OrDefault00 -
(00- .
this00. 2
object003 9
@this00: ?
,00? @
Func00A E
<00E F
ulong00F K
>00K L
defaultValueFactory00M `
)00` a
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToUInt6444. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToULong.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
ulong

 
ToULong

 #
(

# $
this

$ (
object

) /
@this

0 5
)

5 6
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt64* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToULongOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
ToULongOrDefault ,
(, -
this- 1
object2 8
@this9 >
)> ?
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt64. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
ulong 
ToULongOrDefault ,
(, -
this- 1
object2 8
@this9 >
,> ?
ulong@ E
defaultValueF R
)R S
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToUInt64"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
ulong00 
ToULongOrDefault00 ,
(00, -
this00- 1
object002 8
@this009 >
,00> ?
Func00@ D
<00D E
ulong00E J
>00J K
defaultValueFactory00L _
)00_ `
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToUInt6444. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUShort.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
ushort

 
ToUShort

 %
(

% &
this

& *
object

+ 1
@this

2 7
)

7 8
{ 	
return 
global 
:: 
System !
.! "
Convert" )
.) *
ToUInt16* 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Convert\ToValueType\Object.ToUShortOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Convert6 =
.= >
ToValueType> I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
ToUShortOrDefault .
(. /
this/ 3
object4 :
@this; @
)@ A
{
try 
{ 
return 
global 
:: 
System %
.% &
Convert& -
.- .
ToUInt16. 6
(6 7
@this7 <
)< =
;= >
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public 
static 
ushort 
ToUShortOrDefault .
(. /
this/ 3
object4 :
@this; @
,@ A
ushortB H
defaultValueI U
)U V
{ 	
try   
{!! 
return"" 
global"" 
::"" 
System"" %
.""% &
Convert""& -
.""- .
ToUInt16"". 6
(""6 7
@this""7 <
)""< =
;""= >
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 
defaultValue&& #
;&&# $
}'' 
}(( 	
public00 
static00 
ushort00 
ToUShortOrDefault00 .
(00. /
this00/ 3
object004 :
@this00; @
,00@ A
Func00B F
<00F G
ushort00G M
>00M N
defaultValueFactory00O b
)00b c
{11 	
try22 
{33 
return44 
global44 
::44 
System44 %
.44% &
Convert44& -
.44- .
ToUInt1644. 6
(446 7
@this447 <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 
defaultValueFactory88 *
(88* +
)88+ ,
;88, -
}99 
}:: 	
};; 
}<< �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\System.Object.Helper.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
object 
GetPropertyValue -
(- .
this. 2
object3 9
t: ;
,; <
string= C
propNameD L
)L M
{ 	
return 
t 
. 
GetType 
( 
) 
. 
GetProperty *
(* +
propName+ 3
)3 4
?4 5
.5 6
GetValue6 >
(> ?
t? @
,@ A
nullB F
)F G
;G H
} 	
}		 
}

 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.Coalesce.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
Coalesce  
<  !
T! "
>" #
(# $
this$ (
T) *
@this+ 0
,0 1
params2 8
T9 :
[: ;
]; <
values= C
)C D
whereE J
TK L
:M N
classO T
{
if 
( 
@this 
!= 
null 
) 
{ 
return 
@this 
; 
} 
foreach 
( 
T 
value 
in 
values  &
)& '
{ 
if 
( 
value 
!= 
null !
)! "
{ 
return 
value  
;  !
} 
} 
return 
null 
; 
} 	
} 
} � 
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.CoalesceOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
CoalesceOrDefault )
<) *
T* +
>+ ,
(, -
this- 1
T2 3
@this4 9
,9 :
params; A
TB C
[C D
]D E
valuesF L
)L M
whereN S
TT U
:V W
classX ]
{ 	
if 
( 
@this 
!= 
null 
) 
{ 
return 
@this 
; 
} 
foreach 
( 
T 
value 
in 
values  &
)& '
{ 
if 
( 
value 
!= 
null !
)! "
{ 
return 
value  
;  !
} 
} 
return 
default 
; 
} 	
public
�� 
static
�� 
T
�� 
CoalesceOrDefault
�� )
<
��) *
T
��* +
>
��+ ,
(
��, -
this
��- 1
T
��2 3
@this
��4 9
,
��9 :
Func
��; ?
<
��? @
T
��@ A
>
��A B!
defaultValueFactory
��C V
,
��V W
params
��X ^
T
��_ `
[
��` a
]
��a b
values
��c i
)
��i j
where
��k p
T
��q r
:
��s t
class
��u z
{
�� 	
if
�� 
(
�� 
@this
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
@this
�� 
;
�� 
}
�� 
foreach
�� 
(
�� 
T
�� 
value
�� 
in
�� 
values
��  &
)
��& '
{
�� 
if
�� 
(
�� 
value
�� 
!=
�� 
null
�� !
)
��! "
{
�� 
return
�� 
value
��  
;
��  !
}
�� 
}
�� 
return
�� !
defaultValueFactory
�� &
(
��& '
)
��' (
;
��( )
}
�� 	
public
�� 
static
�� 
T
�� 
CoalesceOrDefault
�� )
<
��) *
T
��* +
>
��+ ,
(
��, -
this
��- 1
T
��2 3
@this
��4 9
,
��9 :
Func
��; ?
<
��? @
T
��@ A
,
��A B
T
��C D
>
��D E!
defaultValueFactory
��F Y
,
��Y Z
params
��[ a
T
��b c
[
��c d
]
��d e
values
��f l
)
��l m
where
��n s
T
��t u
:
��v w
class
��x }
{
�� 	
if
�� 
(
�� 
@this
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
@this
�� 
;
�� 
}
�� 
foreach
�� 
(
�� 
T
�� 
value
�� 
in
�� 
values
��  &
)
��& '
{
�� 
if
�� 
(
�� 
value
�� 
!=
�� 
null
�� !
)
��! "
{
�� 
return
�� 
value
��  
;
��  !
}
�� 
}
�� 
return
�� !
defaultValueFactory
�� &
(
��& '
@this
��' ,
)
��, -
;
��- .
}
�� 	
}
�� 
}�� �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.GetValueOrDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
TResult 
GetValueOrDefault /
</ 0
T0 1
,1 2
TResult3 :
>: ;
(; <
this< @
TA B
@thisC H
,H I
FuncJ N
<N O
TO P
,P Q
TResultR Y
>Y Z
func[ _
)_ `
{ 	
try 
{ 
return 
func 
( 
@this !
)! "
;" #
} 
catch 
( 
	Exception 
) 
{ 
return 
default 
; 
} 
} 	
public$$ 
static$$ 
TResult$$ 
GetValueOrDefault$$ /
<$$/ 0
T$$0 1
,$$1 2
TResult$$3 :
>$$: ;
($$; <
this$$< @
T$$A B
@this$$C H
,$$H I
Func$$J N
<$$N O
T$$O P
,$$P Q
TResult$$R Y
>$$Y Z
func$$[ _
,$$_ `
TResult$$a h
defaultValue$$i u
)$$u v
{%% 	
try&& 
{'' 
return(( 
func(( 
((( 
@this(( !
)((! "
;((" #
})) 
catch** 
(** 
	Exception** 
)** 
{++ 
return,, 
defaultValue,, #
;,,# $
}-- 
}.. 	
public
�� 
static
�� 
TResult
�� 
GetValueOrDefault
�� /
<
��/ 0
T
��0 1
,
��1 2
TResult
��3 :
>
��: ;
(
��; <
this
��< @
T
��A B
@this
��C H
,
��H I
Func
��J N
<
��N O
T
��O P
,
��P Q
TResult
��R Y
>
��Y Z
func
��[ _
,
��_ `
Func
��a e
<
��e f
TResult
��f m
>
��m n"
defaultValueFactory��o �
)��� �
{
�� 	
try
�� 
{
�� 
return
�� 
func
�� 
(
�� 
@this
�� !
)
��! "
;
��" #
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� !
defaultValueFactory
�� *
(
��* +
)
��+ ,
;
��, -
}
�� 
}
�� 	
public
�� 
static
�� 
TResult
�� 
GetValueOrDefault
�� /
<
��/ 0
T
��0 1
,
��1 2
TResult
��3 :
>
��: ;
(
��; <
this
��< @
T
��A B
@this
��C H
,
��H I
Func
��J N
<
��N O
T
��O P
,
��P Q
TResult
��R Y
>
��Y Z
func
��[ _
,
��_ `
Func
��a e
<
��e f
T
��f g
,
��g h
TResult
��i p
>
��p q"
defaultValueFactory��r �
)��� �
{
�� 	
try
�� 
{
�� 
return
�� 
func
�� 
(
�� 
@this
�� !
)
��! "
;
��" #
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� !
defaultValueFactory
�� *
(
��* +
@this
��+ 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
}
�� 
}�� �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.IfNotNull.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
	IfNotNull $
<$ %
T% &
>& '
(' (
this( ,
T- .
@this/ 4
,4 5
Action6 <
<< =
T= >
>> ?
action@ F
)F G
whereH M
TN O
:P Q
classR W
{ 	
if
(
@this
!=
null
)
{ 
action 
( 
@this 
) 
; 
} 
} 	
public 
static 
TResult 
	IfNotNull '
<' (
T( )
,) *
TResult+ 2
>2 3
(3 4
this4 8
T9 :
@this; @
,@ A
FuncB F
<F G
TG H
,H I
TResultJ Q
>Q R
funcS W
)W X
whereY ^
T_ `
:a b
classc h
{ 	
return 
@this 
!= 
null  
?! "
func# '
(' (
@this( -
)- .
:/ 0
default1 8
;8 9
} 	
public)) 
static)) 
TResult)) 
	IfNotNull)) '
<))' (
T))( )
,))) *
TResult))+ 2
>))2 3
())3 4
this))4 8
T))9 :
@this)); @
,))@ A
Func))B F
<))F G
T))G H
,))H I
TResult))J Q
>))Q R
func))S W
,))W X
TResult))Y `
defaultValue))a m
)))m n
where))o t
T))u v
:))w x
class))y ~
{** 	
return++ 
@this++ 
!=++ 
null++  
?++! "
func++# '
(++' (
@this++( -
)++- .
:++/ 0
defaultValue++1 =
;++= >
},, 	
public77 
static77 
TResult77 
	IfNotNull77 '
<77' (
T77( )
,77) *
TResult77+ 2
>772 3
(773 4
this774 8
T779 :
@this77; @
,77@ A
Func77B F
<77F G
T77G H
,77H I
TResult77J Q
>77Q R
func77S W
,77W X
Func77Y ]
<77] ^
TResult77^ e
>77e f
defaultValueFactory77g z
)77z {
where	77| �
T
77� �
:
77� �
class
77� �
{88 	
return99 
@this99 
!=99 
null99  
?99! "
func99# '
(99' (
@this99( -
)99- .
:99/ 0
defaultValueFactory991 D
(99D E
)99E F
;99F G
}:: 	
};; 
}<< �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.NullIf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
NullIf 
< 
T  
>  !
(! "
this" &
T' (
@this) .
,. /
Func0 4
<4 5
T5 6
,6 7
bool8 <
>< =
	predicate> G
)G H
whereI N
TO P
:Q R
classS X
{ 	
if 
( 
	predicate 
( 
@this 
)  
)  !
{ 
return 
null 
; 
} 
return 
@this 
; 
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.NullIfEquals.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
NullIfEquals $
<$ %
T% &
>& '
(' (
this( ,
T- .
@this/ 4
,4 5
T6 7
value8 =
)= >
where? D
TE F
:G H
classI N
{
if 
( 
@this 
. 
Equals 
( 
value "
)" #
)# $
{ 
return 
null 
; 
} 
return 
@this 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.NullIfEqualsAny.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
NullIfEqualsAny '
<' (
T( )
>) *
(* +
this+ /
T0 1
@this2 7
,7 8
params9 ?
T@ A
[A B
]B C
valuesD J
)J K
whereL Q
TR S
:T U
classV [
{
if 
( 
global 
:: 
System 
. 
Array $
.$ %
IndexOf% ,
(, -
values- 3
,3 4
@this5 :
): ;
!=< >
-? @
$num@ A
)A B
{ 
return 
null 
; 
} 
return 
@this 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.ToStringSafe.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
ToStringSafe

 )
(

) *
this

* .
object

/ 5
@this

6 ;
)

; <
{ 	
return 
@this 
== 
null  
?! "
$str# %
:& '
@this( -
.- .
ToString. 6
(6 7
)7 8
;8 9
}
} 
} �:
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\Utility\Object.Try.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
Utility6 =
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
TResult
Try
<
TType
,
TResult
>
(
this
TType
@this
,
Func
<
TType
,
TResult
>
tryFunction
)
{ 	
try 
{ 
return 
tryFunction "
(" #
@this# (
)( )
;) *
} 
catch 
{ 
return 
default 
; 
} 
} 	
public   
static   
TResult   
Try   !
<  ! "
TType  " '
,  ' (
TResult  ) 0
>  0 1
(  1 2
this  2 6
TType  7 <
@this  = B
,  B C
Func  D H
<  H I
TType  I N
,  N O
TResult  P W
>  W X
tryFunction  Y d
,  d e
TResult  f m

catchValue  n x
)  x y
{!! 	
try"" 
{## 
return$$ 
tryFunction$$ "
($$" #
@this$$# (
)$$( )
;$$) *
}%% 
catch&& 
{'' 
return(( 

catchValue(( !
;((! "
})) 
}** 	
public33 
static33 
TResult33 
Try33 !
<33! "
TType33" '
,33' (
TResult33) 0
>330 1
(331 2
this332 6
TType337 <
@this33= B
,33B C
Func33D H
<33H I
TType33I N
,33N O
TResult33P W
>33W X
tryFunction33Y d
,33d e
Func33f j
<33j k
TType33k p
,33p q
TResult33r y
>33y z
catchValueFactory	33{ �
)
33� �
{44 	
try55 
{66 
return77 
tryFunction77 "
(77" #
@this77# (
)77( )
;77) *
}88 
catch99 
{:: 
return;; 
catchValueFactory;; (
(;;( )
@this;;) .
);;. /
;;;/ 0
}<< 
}== 	
publicFF 
staticFF 
boolFF 
TryFF 
<FF 
TTypeFF $
,FF$ %
TResultFF& -
>FF- .
(FF. /
thisFF/ 3
TTypeFF4 9
@thisFF: ?
,FF? @
FuncFFA E
<FFE F
TTypeFFF K
,FFK L
TResultFFM T
>FFT U
tryFunctionFFV a
,FFa b
outFFc f
TResultFFg n
resultFFo u
)FFu v
{GG 	
tryHH 
{II 
resultJJ 
=JJ 
tryFunctionJJ $
(JJ$ %
@thisJJ% *
)JJ* +
;JJ+ ,
returnKK 
trueKK 
;KK 
}LL 
catchMM 
{NN 
resultOO 
=OO 
defaultOO  
;OO  !
returnPP 
falsePP 
;PP 
}QQ 
}RR 	
public\\ 
static\\ 
bool\\ 
Try\\ 
<\\ 
TType\\ $
,\\$ %
TResult\\& -
>\\- .
(\\. /
this\\/ 3
TType\\4 9
@this\\: ?
,\\? @
Func\\A E
<\\E F
TType\\F K
,\\K L
TResult\\M T
>\\T U
tryFunction\\V a
,\\a b
TResult\\c j

catchValue\\k u
,\\u v
out\\w z
TResult	\\{ �
result
\\� �
)
\\� �
{]] 	
try^^ 
{__ 
result`` 
=`` 
tryFunction`` $
(``$ %
@this``% *
)``* +
;``+ ,
returnaa 
trueaa 
;aa 
}bb 
catchcc 
{dd 
resultee 
=ee 

catchValueee #
;ee# $
returnff 
falseff 
;ff 
}gg 
}hh 	
publicrr 
staticrr 
boolrr 
Tryrr 
<rr 
TTyperr $
,rr$ %
TResultrr& -
>rr- .
(rr. /
thisrr/ 3
TTyperr4 9
@thisrr: ?
,rr? @
FuncrrA E
<rrE F
TTyperrF K
,rrK L
TResultrrM T
>rrT U
tryFunctionrrV a
,rra b
Funcrrc g
<rrg h
TTyperrh m
,rrm n
TResultrro v
>rrv w
catchValueFactory	rrx �
,
rr� �
out
rr� �
TResult
rr� �
result
rr� �
)
rr� �
{ss 	
trytt 
{uu 
resultvv 
=vv 
tryFunctionvv $
(vv$ %
@thisvv% *
)vv* +
;vv+ ,
returnww 
trueww 
;ww 
}xx 
catchyy 
{zz 
result{{ 
={{ 
catchValueFactory{{ *
({{* +
@this{{+ 0
){{0 1
;{{1 2
return|| 
false|| 
;|| 
}}} 
}~~ 	
public
�� 
static
�� 
bool
�� 
Try
�� 
<
�� 
TType
�� $
>
��$ %
(
��% &
this
��& *
TType
��+ 0
@this
��1 6
,
��6 7
Action
��8 >
<
��> ?
TType
��? D
>
��D E
	tryAction
��F O
)
��O P
{
�� 	
try
�� 
{
�� 
	tryAction
�� 
(
�� 
@this
�� 
)
��  
;
��  !
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
bool
�� 
Try
�� 
<
�� 
TType
�� $
>
��$ %
(
��% &
this
��& *
TType
��+ 0
@this
��1 6
,
��6 7
Action
��8 >
<
��> ?
TType
��? D
>
��D E
	tryAction
��F O
,
��O P
Action
��Q W
<
��W X
TType
��X ]
>
��] ^
catchAction
��_ j
)
��j k
{
�� 	
try
�� 
{
�� 
	tryAction
�� 
(
�� 
@this
�� 
)
��  
;
��  !
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
{
�� 
catchAction
�� 
(
�� 
@this
�� !
)
��! "
;
��" #
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
<" #
T# $
>$ %
(% &
this& *
T+ ,
@this- 2
,2 3
T4 5
minValue6 >
,> ?
T@ A
maxValueB J
)J K
whereL Q
TR S
:T U
IComparableV a
<a b
Tb c
>c d
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
In 
< 
T 
>  
(  !
this! %
T& '
@this( -
,- .
params/ 5
T6 7
[7 8
]8 9
values: @
)@ A
{
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
<" #
T# $
>$ %
(% &
this& *
T+ ,
@this- 2
,2 3
T4 5
minValue6 >
,> ?
T@ A
maxValueB J
)J K
whereL Q
TR S
:T U
IComparableV a
<a b
Tb c
>c d
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.IsDBNull.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsDBNull #
<# $
T$ %
>% &
(& '
this' +
T, -
value. 3
)3 4
where5 :
T; <
:= >
class? D
{ 	
return
global
::
System
.
Convert
.
IsDBNull
(
value
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.IsDefault.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
	IsDefault $
<$ %
T% &
>& '
(' (
this( ,
T- .
source/ 5
)5 6
{ 	
return
source
.
Equals
(
default
(
T
)
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.IsNotNull.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
	IsNotNull $
<$ %
T% &
>& '
(' (
this( ,
T- .
@this/ 4
)4 5
where6 ;
T< =
:> ?
class@ E
{ 	
return
@this
!=
null
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.IsNull.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsNull !
<! "
T" #
># $
($ %
this% )
T* +
@this, 1
)1 2
where3 8
T9 :
:; <
class= B
{ 	
return
@this
==
null
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
NotIn  
<  !
T! "
>" #
(# $
this$ (
T) *
@this+ 0
,0 1
params2 8
T9 :
[: ;
]; <
values= C
)C D
{
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Object\ValueComparison\Object.ReferenceEquals.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Object/ 5
.5 6
ValueComparison6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
ReferenceEquals *
(* +
this+ /
object0 6
objA7 ;
,; <
object= C
objBD H
)H I
{ 	
return
object
.
ReferenceEquals
(
objA
,
objB
)
;
} 	
} 
} �
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Random\Random.CoinToss.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Random/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
CoinToss

 #
(

# $
this

$ (
global

) /
::

/ 1
System

1 7
.

7 8
Random

8 >
@this

? D
)

D E
{ 	
return 
@this 
. 
Next 
( 
$num 
)  
==! #
$num$ %
;% &
}
} 
} �
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Random\Random.OneOf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Random/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
OneOf 
< 
T 
>  
(  !
this! %
global& ,
::, .
System. 4
.4 5
Random5 ;
@this< A
,A B
paramsC I
TJ K
[K L
]L M
valuesN T
)T U
{
return 
values 
[ 
@this 
.  
Next  $
($ %
values% +
.+ ,
Length, 2
)2 3
]3 4
;4 5
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.SByte\System.Math\SByte.Abs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
SByte/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
sbyte

 
Abs

 
(

  
this

  $
sbyte

% *
value

+ 0
)

0 1
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Abs' *
(* +
value+ 0
)0 1
;1 2
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.SByte\System.Math\SByte.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
SByte/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
sbyte 
Max 
(  
this  $
sbyte% *
val1+ /
,/ 0
sbyte1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.SByte\System.Math\SByte.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
SByte/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
sbyte 
Min 
(  
this  $
sbyte% *
val1+ /
,/ 0
sbyte1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.SByte\System.Math\SByte.Sign.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
SByte/ 4
.4 5
System5 ;
.; <
Math< @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
Sign
(
this
sbyte
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sign' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.SByte\_CoreObject\SByte.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
SByte/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
sbyte
@this
,
params
sbyte
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.SByte\_CoreObject\SByte.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
SByte/ 4
.4 5
_CoreObject5 @
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
sbyte
@this
,
params
sbyte
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Math\Single.Abs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
float

 
Abs

 
(

  
this

  $
float

% *
value

+ 0
)

0 1
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Abs' *
(* +
value+ 0
)0 1
;1 2
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Math\Single.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
Max 
(  
this  $
float% *
val1+ /
,/ 0
float1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Math\Single.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
float 
Min 
(  
this  $
float% *
val1+ /
,/ 0
float1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Math\Single.Sign.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
Sign
(
this
float
value
)
{ 	
return 
global 
:: 
System !
.! "
Math" &
.& '
Sign' +
(+ ,
value, 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Single\Single.IsInfinity.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Single= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 

IsInfinity

 %
(

% &
this

& *
float

+ 0
f

1 2
)

2 3
{ 	
return 
float 
. 

IsInfinity #
(# $
f$ %
)% &
;& '
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Single\Single.IsNaN.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Single= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNaN

  
(

  !
this

! %
float

& +
f

, -
)

- .
{ 	
return 
float 
. 
IsNaN 
( 
f  
)  !
;! "
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Single\Single.IsNegativeInfinity.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Single= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNegativeInfinity

 -
(

- .
this

. 2
float

3 8
f

9 :
)

: ;
{ 	
return 
float 
. 
IsNegativeInfinity +
(+ ,
f, -
)- .
;. /
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\System.Single\Single.IsPositiveInfinity.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
System6 <
.< =
Single= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsPositiveInfinity

 -
(

- .
this

. 2
float

3 8
f

9 :
)

: ;
{ 	
return 
float 
. 
IsPositiveInfinity +
(+ ,
f, -
)- .
;. /
}
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\_CoreObject\Single.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
float( -
@this. 3
,3 4
float5 :
minValue; C
,C D
floatE J
maxValueK S
)S T
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\_CoreObject\Single.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
float
@this
,
params
float
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\_CoreObject\Single.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
float( -
@this. 3
,3 4
float5 :
minValue; C
,C D
floatE J
maxValueK S
)S T
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Single\_CoreObject\Single.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Single/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
float
@this
,
params
float
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Br2Nl.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
Br2Nl

 "
(

" #
this

# '
string

( .
@this

/ 4
)

4 5
{ 	
return 
@this 
. 
Replace  
(  !
$str! )
,) *
$str+ 1
)1 2
.2 3
Replace3 :
(: ;
$str; A
,A B
$strC I
)I J
;J K
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Concatenate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Concatenate (
(( )
this) -
IEnumerable. 9
<9 :
string: @
>@ A
@thisB G
)G H
{

sb 
= 
new "
(" #
)# $
;$ %
foreach 
( 
string 
s 
in  
@this! &
)& '
{ 
sb 
. 
Append 
( 
s 
) 
; 
} 
return 
sb 
. 
ToString 
( 
)  
;  !
} 	
public 
static 
string 
Concatenate (
<( )
T) *
>* +
(+ ,
this, 0
IEnumerable1 <
<< =
T= >
>> ?
source@ F
,F G
FuncH L
<L M
TM N
,N O
stringP V
>V W
funcX \
)\ ]
{ 	

sb 
= 
new "
(" #
)# $
;$ %
foreach   
(   
T   
item   
in   
source   %
)  % &
{!! 
sb"" 
."" 
Append"" 
("" 
func"" 
("" 
item"" #
)""# $
)""$ %
;""% &
}## 
return%% 
sb%% 
.%% 
ToString%% 
(%% 
)%%  
;%%  !
}&& 	
}'' 
}(( �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ConcatWith.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 

ConcatWith '
(' (
this( ,
string- 3
@this4 9
,9 :
params; A
stringB H
[H I
]I J
valuesK Q
)Q R
{ 	
return
string
.
Concat
(
@this
,
string
.
Concat
(
values
)
)
;
} 	
} 
} �
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Contains.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
Contains
(
this
string
@this
,
string
value
)
{ 	
return 
@this 
. 
IndexOf  
(  !
value! &
)& '
!=( *
-+ ,
$num, -
;- .
} 	
public 
static 
bool 
Contains #
(# $
this$ (
string) /
@this0 5
,5 6
string7 =
value> C
,C D
StringComparisonE U
comparisonTypeV d
)d e
{ 	
return 
@this 
. 
IndexOf  
(  !
value! &
,& '
comparisonType( 6
)6 7
!=8 :
-; <
$num< =
;= >
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ContainsAll.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
ContainsAll
(
this
string
@this
,
params
string
[
]
values
)
{ 	
foreach 
( 
string 
value !
in" $
values% +
)+ ,
{ 
if 
( 
! 
@this 
. 
Contains #
(# $
value$ )
,) *
StringComparison+ ;
.; <
CurrentCulture< J
)J K
)K L
{ 
return 
false  
;  !
} 
} 
return 
true 
; 
} 	
public!! 
static!! 
bool!! 
ContainsAll!! &
(!!& '
this!!' +
string!!, 2
@this!!3 8
,!!8 9
StringComparison!!: J
comparisonType!!K Y
,!!Y Z
params!![ a
string!!b h
[!!h i
]!!i j
values!!k q
)!!q r
{"" 	
foreach## 
(## 
string## 
value## !
in##" $
values##% +
)##+ ,
{$$ 
if%% 
(%% 
!%% 
@this%% 
.%% 
Contains%% #
(%%# $
value%%$ )
,%%) *
comparisonType%%+ 9
)%%9 :
)%%: ;
{&& 
return'' 
false''  
;''  !
}(( 
})) 
return++ 
true++ 
;++ 
},, 	
}-- 
}.. �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ContainsAny.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
ContainsAny
(
this
string
@this
,
params
string
[
]
values
)
{ 	
foreach 
( 
string 
value !
in" $
values% +
)+ ,
{ 
if 
( 
@this 
. 
IndexOf !
(! "
value" '
)' (
!=) +
-, -
$num- .
). /
{ 
return 
true 
;  
} 
} 
return 
false 
; 
} 	
public!! 
static!! 
bool!! 
ContainsAny!! &
(!!& '
this!!' +
string!!, 2
@this!!3 8
,!!8 9
StringComparison!!: J
comparisonType!!K Y
,!!Y Z
params!![ a
string!!b h
[!!h i
]!!i j
values!!k q
)!!q r
{"" 	
foreach## 
(## 
string## 
value## !
in##" $
values##% +
)##+ ,
{$$ 
if%% 
(%% 
@this%% 
.%% 
IndexOf%% !
(%%! "
value%%" '
,%%' (
comparisonType%%) 7
)%%7 8
!=%%9 ;
-%%< =
$num%%= >
)%%> ?
{&& 
return'' 
true'' 
;''  
}(( 
})) 
return++ 
false++ 
;++ 
},, 	
}-- 
}.. �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.DecodeBase64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
DecodeBase64
(
this
string
@this
)
{ 	
return 
Encoding 
. 
ASCII !
.! "
	GetString" +
(+ ,
Convert, 3
.3 4
FromBase64String4 D
(D E
@thisE J
)J K
)K L
;L M
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.DecryptRSA.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{		 
public 
static 
string 

DecryptRSA '
(' (
this( ,
string- 3
@this4 9
,9 :
string; A
keyB E
)E F
{ 	$
RSACryptoServiceProvider $
rsa% (
=) *
new+ .$
RSACryptoServiceProvider/ G
(G H
$numH L
)L M
;M N
string 
[ 
] 
decryptArray !
=" #
@this$ )
.) *
Split* /
(/ 0
new0 3
[3 4
]4 5
{6 7
$str8 ;
}< =
,= >
StringSplitOptions? Q
.Q R
NoneR V
)V W
;W X
byte 
[ 
] 
decryptByteArray #
=$ %
global& ,
::, .
System. 4
.4 5
Array5 :
.: ;

ConvertAll; E
(E F
decryptArrayF R
,R S
sT U
=>V X
ConvertY `
.` a
ToBytea g
(g h
byteh l
.l m
Parsem r
(r s
ss t
,t u
NumberStyles	v �
.
� �
	HexNumber
� �
)
� �
)
� �
)
� �
;
� �
byte 
[ 
] 
bytes 
= 
rsa 
. 
Decrypt &
(& '
decryptByteArray' 7
,7 8
true9 =
)= >
;> ?
return 
Encoding 
. 
UTF8  
.  !
	GetString! *
(* +
bytes+ 0
)0 1
;1 2
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.EncodeBase64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
EncodeBase64
(
this
string
@this
)
{ 	
return 
Convert 
. 
ToBase64String )
() *
	Activator* 3
.3 4
CreateInstance4 B
<B C

>P Q
(Q R
)R S
.S T
GetBytesT \
(\ ]
@this] b
)b c
)c d
;d e
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.EncryptRSA.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 

EncryptRSA '
(' (
this( ,
string- 3
@this4 9
,9 :
string; A
keyB E
)E F
{ 	$
RSACryptoServiceProvider $
rsa% (
=) *
new+ .$
RSACryptoServiceProvider/ G
(G H
$numH L
)L M
;M N
byte 
[ 
] 
bytes 
= 
rsa 
. 
Encrypt &
(& '
Encoding' /
./ 0
UTF80 4
.4 5
GetBytes5 =
(= >
@this> C
)C D
,D E
trueF J
)J K
;K L
return 
BitConverter 
.  
ToString  (
(( )
bytes) .
). /
;/ 0
} 	
} 
} �

~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.EscapeXml.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
	EscapeXml

 &
(

& '
this

' +
string

, 2
@this

3 8
)

8 9
{ 	
return 
@this 
. 
Replace  
(  !
$str! $
,$ %
$str& -
)- .
.. /
Replace/ 6
(6 7
$str7 :
,: ;
$str< B
)B C
.C D
ReplaceD K
(K L
$strL O
,O P
$strQ W
)W X
.X Y
ReplaceY `
(` a
$stra e
,e f
$strg o
)o p
.p q
Replaceq x
(x y
$stry |
,| }
$str	~ �
)
� �
;
� �
}
} 
} �	
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Extract.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Extract $
($ %
this% )
string* 0
@this1 6
,6 7
Func8 <
<< =
char= A
,A B
boolC G
>G H
	predicateI R
)R S
{ 	
return 
new 
string 
( 
@this #
.# $
ToCharArray$ /
(/ 0
)0 1
.1 2
Where2 7
(7 8
	predicate8 A
)A B
.B C
ToArrayC J
(J K
)K L
)L M
;M N
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ExtractLetter.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 

(* +
this+ /
string0 6
@this7 <
)< =
{
return 
new 
string 
( 
@this #
.# $
ToCharArray$ /
(/ 0
)0 1
.1 2
Where2 7
(7 8
x8 9
=>: <
char= A
.A B
IsLetterB J
(J K
xK L
)L M
)M N
.N O
ToArrayO V
(V W
)W X
)X Y
;Y Z
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ExtractNumber.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 

(* +
this+ /
string0 6
@this7 <
)< =
{
return 
new 
string 
( 
@this #
.# $
ToCharArray$ /
(/ 0
)0 1
.1 2
Where2 7
(7 8
x8 9
=>: <
char= A
.A B
IsNumberB J
(J K
xK L
)L M
)M N
.N O
ToArrayO V
(V W
)W X
)X Y
;Y Z
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.FormatWith.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 

FormatWith '
(' (
this( ,
string- 3
@this4 9
,9 :
object; A
arg0B F
)F G
{ 	
return 
string 
. 
Format  
(  !
@this! &
,& '
arg0( ,
), -
;- .
} 	
public 
static 
string 

FormatWith '
(' (
this( ,
string- 3
@this4 9
,9 :
object; A
arg0B F
,F G
objectH N
arg1O S
)S T
{   	
return!! 
string!! 
.!! 
Format!!  
(!!  !
@this!!! &
,!!& '
arg0!!( ,
,!!, -
arg1!!. 2
)!!2 3
;!!3 4
}"" 	
public00 
static00 
string00 

FormatWith00 '
(00' (
this00( ,
string00- 3
@this004 9
,009 :
object00; A
arg000B F
,00F G
object00H N
arg100O S
,00S T
object00U [
arg200\ `
)00` a
{11 	
return22 
string22 
.22 
Format22  
(22  !
@this22! &
,22& '
arg022( ,
,22, -
arg122. 2
,222 3
arg2224 8
)228 9
;229 :
}33 	
public?? 
static?? 
string?? 

FormatWith?? '
(??' (
this??( ,
string??- 3
@this??4 9
,??9 :
params??; A
object??B H
[??H I
]??I J
values??K Q
)??Q R
{@@ 	
returnAA 
stringAA 
.AA 
FormatAA  
(AA  !
@thisAA! &
,AA& '
valuesAA( .
)AA. /
;AA/ 0
}BB 	
}CC 
}DD �

}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.GetAfter.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
GetAfter
(
this
string
@this
,
string
value
)
{ 	
if 
( 
! 
@this 
. 
Contains 
(  
value  %
,% &
StringComparison' 7
.7 8
CurrentCulture8 F
)F G
)G H
{ 
return 
$str 
; 
} 
return 
@this 
[ 
( 
@this 
.  
IndexOf  '
(' (
value( -
)- .
+/ 0
value1 6
.6 7
Length7 =
)= >
..> @
]@ A
;A B
} 	
} 
} �	
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.GetBefore.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
	GetBefore
(
this
string
@this
,
string
value
)
{ 	
if 
( 
! 
@this 
. 
Contains 
(  
value  %
,% &
StringComparison' 7
.7 8
CurrentCulture8 F
)F G
)G H
{ 
return 
$str 
; 
} 
return 
@this 
[ 
.. 
@this  
.  !
IndexOf! (
(( )
value) .
). /
]/ 0
;0 1
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.GetBetween.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 

GetBetween '
(' (
this( ,
string- 3
@this4 9
,9 :
string; A
beforeB H
,H I
stringJ P
afterQ V
)V W
{
int 
beforeStartIndex  
=! "
@this# (
.( )
IndexOf) 0
(0 1
before1 7
)7 8
;8 9
int 

startIndex 
= 
beforeStartIndex -
+. /
before0 6
.6 7
Length7 =
;= >
int 
afterStartIndex 
=  !
@this" '
.' (
IndexOf( /
(/ 0
after0 5
,5 6

startIndex7 A
)A B
;B C
if 
( 
beforeStartIndex  
==! #
-$ %
$num% &
||' )
afterStartIndex* 9
==: <
-= >
$num> ?
)? @
{ 
return 
$str 
; 
} 
return 
@this 
[ 

startIndex #
..# %
afterStartIndex% 4
]4 5
;5 6
} 	
} 
} �
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IfEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
IfEmpty $
($ %
this% )
string* 0
value1 6
,6 7
string8 >
defaultValue? K
)K L
{ 	
return
value
.

IsNotEmpty
(
)
?
value
:
defaultValue
;
} 	
} 
} �
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsAlpha.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsAlpha "
(" #
this# '
string( .
@this/ 4
)4 5
{
return 
! 
Regex 
. 
IsMatch !
(! "
@this" '
,' (
$str) 4
)4 5
;5 6
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsAlphaNumeric.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsAlphaNumeric )
() *
this* .
string/ 5
@this6 ;
); <
{
return 
! 
Regex 
. 
IsMatch !
(! "
@this" '
,' (
$str) 7
)7 8
;8 9
} 	
} 
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsAnagram.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
	IsAnagram $
($ %
this% )
string* 0
@this1 6
,6 7
string8 >
otherString? J
)J K
{ 	
return 
@this 
. 
OrderBy 
( 
c 
=> 
c 
)  
. 

( 
otherString *
.* +
OrderBy+ 2
(2 3
c3 4
=>5 7
c8 9
)9 :
): ;
;; <
} 	
} 
} �
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsEmpty

 "
(

" #
this

# '
string

( .
@this

/ 4
)

4 5
{ 	
return 
@this 
== 
$str 
; 
}
} 
} �
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsLike.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
IsLike
(
this
string
@this
,
string
pattern
)
{ 	
string 
regexPattern 
=  !
$str" %
+& '
Regex( -
.- .
Escape. 4
(4 5
pattern5 <
)< =
+> ?
$str@ C
;C D
regexPattern 
= 
regexPattern '
.' (
Replace( /
(/ 0
$str0 6
,6 7
$str8 <
)< =
. 
Replace 
( 
$str 
, 
$str  #
)# $
. 
Replace 
( 
$str 
, 
$str  #
)# $
. 
Replace 
( 
$str 
, 
$str  #
)# $
. 
Replace 
( 
$str 
, 
$str  $
)$ %
. 
Replace 
( 
$str 
, 
$str  %
)% &
;& '
return 
Regex 
. 
IsMatch  
(  !
@this! &
,& '
regexPattern( 4
)4 5
;5 6
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsNotEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 

IsNotEmpty

 %
(

% &
this

& *
string

+ 1
@this

2 7
)

7 8
{ 	
return 
@this 
!= 
$str 
; 
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsNotNullOrEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNotNullOrEmpty

 +
(

+ ,
this

, 0
string

1 7
@this

8 =
)

= >
{ 	
return 
! 
string 
. 

(( )
@this) .
). /
;/ 0
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsNotNullOrWhiteSpace.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 !
IsNotNullOrWhiteSpace

 0
(

0 1
this

1 5
string

6 <
value

= B
)

B C
{ 	
return 
! 
string 
. 
IsNullOrWhiteSpace -
(- .
value. 3
)3 4
;4 5
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsNullOrEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 


 (
(

( )
this

) -
string

. 4
@this

5 :
)

: ;
{ 	
return 
string 
. 

(' (
@this( -
)- .
;. /
}
} 
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsNumeric.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
	IsNumeric $
($ %
this% )
string* 0
@this1 6
)6 7
{
return 
! 
Regex 
. 
IsMatch !
(! "
@this" '
,' (
$str) 1
)1 2
;2 3
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsPalindrome.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsPalindrome '
(' (
this( ,
string- 3
@this4 9
)9 :
{
Regex 
rgx 
= 
new 
( 
$str *
)* +
;+ ,
@this 
= 
rgx 
. 
Replace 
(  
@this  %
,% &
$str' )
)) *
;* +
return 
@this 
. 

(& '
@this' ,
., -
Reverse- 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.IsValidEmail.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
IsValidEmail
(
this
string
@this
)
{ 	
return 
new !
EmailAddressAttribute ,
(, -
)- .
.. /
IsValid/ 6
(6 7
@this7 <
)< =
;= >
} 	
} 
} �
yF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Left.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Left !
(! "
this" &
string' -
@this. 3
,3 4
int5 8
length9 ?
)? @
{ 	
return
@this
[
..
length
]
;
} 	
} 
} �
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.LeftSafe.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
LeftSafe
(
this
string
@this
,
int
length
)
{ 	
return 
@this 
[ 
.. 
Math 
.  
Min  #
(# $
length$ *
,* +
@this, 1
.1 2
Length2 8
)8 9
]9 :
;: ;
} 	
} 
} �
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Nl2Br.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
Nl2Br

 "
(

" #
this

# '
string

( .
@this

/ 4
)

4 5
{ 	
return 
@this 
. 
Replace  
(  !
$str! '
,' (
$str) 1
)1 2
.2 3
Replace3 :
(: ;
$str; ?
,? @
$strA I
)I J
;J K
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.NullIfEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
NullIfEmpty

 (
(

( )
this

) -
string

. 4
@this

5 :
)

: ;
{ 	
return 
@this 
== 
$str 
?  
null! %
:& '
@this( -
;- .
}
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.PathCombine.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
PathCombine (
(( )
this) -
string. 4
@this5 :
,: ;
params< B
stringC I
[I J
]J K
pathsL Q
)Q R
{ 	
List 
< 
string 
> 
list 
= 
paths  %
.% &
ToList& ,
(, -
)- .
;. /
list 
. 
Insert 
( 
$num 
, 
@this  
)  !
;! "
return 
Path 
. 
Combine 
(  
list  $
.$ %
ToArray% ,
(, -
)- .
). /
;/ 0
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.RemoveDiacritics.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
RemoveDiacritics
(
this
string
@this
)
{ 	
string 
normalizedString #
=$ %
@this& +
.+ ,
	Normalize, 5
(5 6
NormalizationForm6 G
.G H
FormDH M
)M N
;N O

sb 
= 
new "
(" #
)# $
;$ %
foreach 
( 
char 
t 
in 
normalizedString /
)/ 0
{ 
UnicodeCategory 
uc  "
=# $
CharUnicodeInfo% 4
.4 5
GetUnicodeCategory5 G
(G H
tH I
)I J
;J K
if 
( 
uc 
!= 
UnicodeCategory )
.) *
NonSpacingMark* 8
)8 9
{ 
sb 
. 
Append 
( 
t 
)  
;  !
} 
} 
return 
sb 
. 
ToString 
( 
)  
.  !
	Normalize! *
(* +
NormalizationForm+ <
.< =
FormC= B
)B C
;C D
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.RemoveLetter.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
RemoveLetter )
() *
this* .
string/ 5
@this6 ;
); <
{
return 
new 
string 
( 
@this #
.# $
ToCharArray$ /
(/ 0
)0 1
.1 2
Where2 7
(7 8
x8 9
=>: <
!= >
char> B
.B C
IsLetterC K
(K L
xL M
)M N
)N O
.O P
ToArrayP W
(W X
)X Y
)Y Z
;Z [
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.RemoveNumber.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
RemoveNumber )
() *
this* .
string/ 5
@this6 ;
); <
{
return 
new 
string 
( 
@this #
.# $
ToCharArray$ /
(/ 0
)0 1
.1 2
Where2 7
(7 8
x8 9
=>: <
!= >
char> B
.B C
IsNumberC K
(K L
xL M
)M N
)N O
.O P
ToArrayP W
(W X
)X Y
)Y Z
;Z [
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.RemoveWhere.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
RemoveWhere (
(( )
this) -
string. 4
@this5 :
,: ;
Func< @
<@ A
charA E
,E F
boolG K
>K L
	predicateM V
)V W
{ 	
return 
new 
string 
( 
@this #
.# $
ToCharArray$ /
(/ 0
)0 1
.1 2
Where2 7
(7 8
x8 9
=>: <
!= >
	predicate> G
(G H
xH I
)I J
)J K
.K L
ToArrayL S
(S T
)T U
)U V
;V W
} 	
} 
} �
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Repeat.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
Repeat
(
this
string
@this
,
int
repeatCount
)
{ 	
if 
( 
@this 
. 
Length 
== 
$num  !
)! "
{ 
return 
new 
string !
(! "
@this" '
[' (
$num( )
]) *
,* +
repeatCount, 7
)7 8
;8 9
} 

sb 
= 
new "
(" #
repeatCount# .
*/ 0
@this1 6
.6 7
Length7 =
)= >
;> ?
while 
( 
repeatCount 
--  
>! "
$num# $
)$ %
{ 
sb 
. 
Append 
( 
@this 
)  
;  !
} 
return 
sb 
. 
ToString 
( 
)  
;  !
} 	
} 
} �	
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Replace.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Replace $
($ %
this% )
string* 0
@this1 6
,6 7
int8 ;

startIndex< F
,F G
intH K
lengthL R
,R S
stringT Z
value[ `
)` a
{ 	
@this
=
@this
.
Remove
(

startIndex
,
length
)
.
Insert
(

startIndex
,
value
)
;
return 
@this 
; 
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ReplaceByEmpty.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ReplaceByEmpty +
(+ ,
this, 0
string1 7
@this8 =
,= >
params? E
stringF L
[L M
]M N
valuesO U
)U V
{ 	
foreach
(
string
value
in
values
)
{ 
@this 
= 
@this 
. 
Replace %
(% &
value& +
,+ ,
$str- /
)/ 0
;0 1
} 
return 
@this 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ReplaceFirst.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ReplaceFirst )
() *
this* .
string/ 5
@this6 ;
,; <
string= C
oldValueD L
,L M
stringN T
newValueU ]
)] ^
{ 	
int 

startindex 
= 
@this "
." #
IndexOf# *
(* +
oldValue+ 3
)3 4
;4 5
if 
( 

startindex 
== 
- 
$num  
)  !
{ 
return 
@this 
; 
} 
return 
@this 
. 
Remove 
(  

startindex  *
,* +
oldValue, 4
.4 5
Length5 ;
); <
.< =
Insert= C
(C D

startindexD N
,N O
newValueP X
)X Y
;Y Z
} 	
public## 
static## 
string## 
ReplaceFirst## )
(##) *
this##* .
string##/ 5
@this##6 ;
,##; <
int##= @
number##A G
,##G H
string##I O
oldValue##P X
,##X Y
string##Z `
newValue##a i
)##i j
{$$ 	
List%% 
<%% 
string%% 
>%% 
list%% 
=%% 
@this%%  %
.%%% &
Split%%& +
(%%+ ,
oldValue%%, 4
)%%4 5
.%%5 6
ToList%%6 <
(%%< =
)%%= >
;%%> ?
int&& 
old&& 
=&& 
number&& 
+&& 
$num&&  
;&&  !
IEnumerable'' 
<'' 
string'' 
>'' 
	listStart''  )
=''* +
list'', 0
.''0 1
Take''1 5
(''5 6
old''6 9
)''9 :
;'': ;
IEnumerable(( 
<(( 
string(( 
>(( 
listEnd((  '
=((( )
list((* .
.((. /
Skip((/ 3
(((3 4
old((4 7
)((7 8
;((8 9
return** 
string** 
.** 
Join** 
(** 
newValue** '
,**' (
	listStart**) 2
)**2 3
+**4 5
(++ 
listEnd++ 
.++ 
Any++ 
(++  
)++  !
?++" #
oldValue++$ ,
:++- .
$str++/ 1
)++1 2
+++3 4
string,, 
.,, 
Join,, 
(,, 
oldValue,, '
,,,' (
listEnd,,) 0
),,0 1
;,,1 2
}-- 	
}.. 
}// �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ReplaceLast.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ReplaceLast (
(( )
this) -
string. 4
@this5 :
,: ;
string< B
oldValueC K
,K L
stringM S
newValueT \
)\ ]
{ 	
int 

startindex 
= 
@this "
." #
LastIndexOf# .
(. /
oldValue/ 7
)7 8
;8 9
if 
( 

startindex 
== 
- 
$num  
)  !
{ 
return 
@this 
; 
} 
return 
@this 
. 
Remove 
(  

startindex  *
,* +
oldValue, 4
.4 5
Length5 ;
); <
.< =
Insert= C
(C D

startindexD N
,N O
newValueP X
)X Y
;Y Z
} 	
public$$ 
static$$ 
string$$ 
ReplaceLast$$ (
($$( )
this$$) -
string$$. 4
@this$$5 :
,$$: ;
int$$< ?
number$$@ F
,$$F G
string$$H N
oldValue$$O W
,$$W X
string$$Y _
newValue$$` h
)$$h i
{%% 	
List&& 
<&& 
string&& 
>&& 
list&& 
=&& 
@this&&  %
.&&% &
Split&&& +
(&&+ ,
oldValue&&, 4
)&&4 5
.&&5 6
ToList&&6 <
(&&< =
)&&= >
;&&> ?
int'' 
old'' 
='' 
Math'' 
.'' 
Max'' 
('' 
$num''  
,''  !
list''" &
.''& '
Count''' ,
-''- .
number''/ 5
-''6 7
$num''8 9
)''9 :
;'': ;
IEnumerable(( 
<(( 
string(( 
>(( 
	listStart((  )
=((* +
list((, 0
.((0 1
Take((1 5
(((5 6
old((6 9
)((9 :
;((: ;
IEnumerable)) 
<)) 
string)) 
>)) 
listEnd))  '
=))( )
list))* .
.)). /
Skip))/ 3
())3 4
old))4 7
)))7 8
;))8 9
return++ 
string++ 
.++ 
Join++ 
(++ 
oldValue++ '
,++' (
	listStart++) 2
)++2 3
+++4 5
(,, 
old,, 
>,, 
$num,, 
?,, 
oldValue,, &
:,,' (
$str,,) +
),,+ ,
+,,- .
string-- 
.-- 
Join-- 
(-- 
newValue-- '
,--' (
listEnd--) 0
)--0 1
;--1 2
}.. 	
}// 
}00 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ReplaceWhenEquals.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ReplaceWhenEquals .
(. /
this/ 3
string4 :
@this; @
,@ A
stringB H
oldValueI Q
,Q R
stringS Y
newValueZ b
)b c
{
return 
@this 
== 
oldValue $
?% &
newValue' /
:0 1
@this2 7
;7 8
} 	
} 
} �

|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Reverse.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
Reverse

 $
(

$ %
this

% )
string

* 0
@this

1 6
)

6 7
{ 	
if 
( 
@this 
. 
Length 
<= 
$num  !
)! "
{
return 
@this 
; 
} 
char 
[ 
] 
chars 
= 
@this  
.  !
ToCharArray! ,
(, -
)- .
;. /
global 
:: 
System 
. 
Array  
.  !
Reverse! (
(( )
chars) .
). /
;/ 0
return 
new 
string 
( 
chars #
)# $
;$ %
} 	
} 
} �
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Right.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Right "
(" #
this# '
string( .
@this/ 4
,4 5
int6 9
length: @
)@ A
{ 	
return
@this
[
^
length
..
]
;
} 	
} 
} �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.RightSafe.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
string
	RightSafe
(
this
string
@this
,
int
length
)
{ 	
return 
@this 
[ 
Math 
. 
Max !
(! "
$num" #
,# $
@this% *
.* +
Length+ 1
-2 3
length4 :
): ;
..; =
]= >
;> ?
} 	
} 
} �
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.SaveAs.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
void
SaveAs
(
this
string
@this
,
string
fileName
,
bool
append
=
false
)
{ 	
using 

TextWriter 
tw 
=  !
new" %
StreamWriter& 2
(2 3
fileName3 ;
,; <
append= C
)C D
;D E
tw 
. 
Write 
( 
@this 
) 
; 
} 	
public 
static 
void 
SaveAs !
(! "
this" &
string' -
@this. 3
,3 4
FileInfo5 =
file> B
,B C
boolD H
appendI O
=P Q
falseR W
)W X
{ 	
using 

TextWriter 
tw 
=  !
new" %
StreamWriter& 2
(2 3
file3 7
.7 8
FullName8 @
,@ A
appendB H
)H I
;I J
tw 
. 
Write 
( 
@this 
) 
; 
} 	
} 
} �	
zF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Split.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
[ 
] 
Split $
($ %
this% )
string* 0
@this1 6
,6 7
string8 >
	separator? H
,H I
StringSplitOptionsJ \
option] c
=d e
StringSplitOptionsf x
.x y
Noney }
)} ~
{ 	
return 
@this 
. 
Split 
( 
new "
[" #
]# $
{% &
	separator' 0
}1 2
,2 3
option4 :
): ;
;; <
} 	
} 
} �%
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.SqlTypeNameToSqlDbType.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
	SqlDbType "
SqlTypeNameToSqlDbType  6
(6 7
this7 ;
string< B
@thisC H
)H I
{		 	
return

 
@this

 
.

 
ToLower

  
(

  !
)

! "
switch

# )
{ 
$str
=>
	SqlDbType
.
Image
,
$str 
=> 
	SqlDbType #
.# $
Text$ (
,( )
$str "
=># %
	SqlDbType& /
./ 0
UniqueIdentifier0 @
,@ A
$str 
=> 
	SqlDbType #
.# $
Date$ (
,( )
$str 
=> 
	SqlDbType #
.# $
Time$ (
,( )
$str 
=> 
	SqlDbType (
.( )
	DateTime2) 2
,2 3
$str  
=>! #
	SqlDbType$ -
.- .
DateTimeOffset. <
,< =
$str 
=> 
	SqlDbType &
.& '
TinyInt' .
,. /
$str 
=> 
	SqlDbType '
.' (
SmallInt( 0
,0 1
$str 
=> 
	SqlDbType "
." #
Int# &
,& '
$str!! 
=>!!  "
	SqlDbType!!# ,
.!!, -

,!!: ;
$str## 
=>## 
	SqlDbType## #
.### $
Real##$ (
,##( )
$str%% 
=>%% 
	SqlDbType%% $
.%%$ %
Money%%% *
,%%* +
$str'' 
=>'' 
	SqlDbType'' '
.''' (
DateTime''( 0
,''0 1
$str)) 
=>)) 
	SqlDbType)) $
.))$ %
Float))% *
,))* +
$str++ 
=>++  
	SqlDbType++! *
.++* +
Variant+++ 2
,++2 3
$str-- 
=>-- 
	SqlDbType-- $
.--$ %
NText--% *
,--* +
$str// 
=>// 
	SqlDbType// "
.//" #
Bit//# &
,//& '
$str11 
=>11 
	SqlDbType11 &
.11& '
Decimal11' .
,11. /
$str33 
=>33 
	SqlDbType33 &
.33& '
Decimal33' .
,33. /
$str55 
=>55 
	SqlDbType55  )
.55) *

SmallMoney55* 4
,554 5
$str77 
=>77 
	SqlDbType77 %
.77% &
BigInt77& ,
,77, -
$str99 
=>99 
	SqlDbType99 (
.99( )
	VarBinary99) 2
,992 3
$str;; 
=>;; 
	SqlDbType;; &
.;;& '
VarChar;;' .
,;;. /
$str== 
=>== 
	SqlDbType== %
.==% &
Binary==& ,
,==, -
$str?? 
=>?? 
	SqlDbType?? #
.??# $
Char??$ (
,??( )
$strAA 
=>AA 
	SqlDbTypeAA (
.AA( )
	TimestampAA) 2
,AA2 3
$strCC 
=>CC 
	SqlDbTypeCC '
.CC' (
NVarCharCC( 0
,CC0 1
$strEE 
=>EE 
	SqlDbTypeEE &
.EE& '
NVarCharEE' /
,EE/ 0
$strGG 
=>GG 
	SqlDbTypeGG $
.GG$ %
NCharGG% *
,GG* +
$strII 
=>II  
	SqlDbTypeII! *
.II* +
UdtII+ .
,II. /
$strKK 
=>KK 
	SqlDbTypeKK '
.KK' (
UdtKK( +
,KK+ ,
$strMM 
=>MM 
	SqlDbTypeMM (
.MM( )
UdtMM) ,
,MM, -
$strOO 
=>OO 
	SqlDbTypeOO "
.OO" #
XmlOO# &
,OO& '
_PP 
=>PP 
throwPP 
newPP 
	ExceptionPP (
(PP( )
stringPP) /
.PP/ 0
FormatPP0 6
(PP6 7
$str	PP7 �
,
PP� �
@this
PP� �
)
PP� �
)
PP� �
,
PP� �
}QQ 
;QQ
}RR 	
}SS 
}TT �
~F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.StripHtml.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
	StripHtml

 &
(

& '
this

' +
string

, 2
@this

3 8
)

8 9
{ 	

path 
=  
new! $
($ %
@this% *
)* +
;+ ,

sb
=
new
(
)
;
int 
pos 
= 
$num 
; 
while 
( 
pos 
< 
path 
. 
Length $
)$ %
{ 
char 
ch 
= 
path 
[ 
pos "
]" #
;# $
pos 
++ 
; 
if 
( 
ch 
== 
$char 
) 
{ 
while 
( 
pos 
<  
path! %
.% &
Length& ,
), -
{ 
ch 
= 
path !
[! "
pos" %
]% &
;& '
pos 
++ 
; 
if 
( 
ch 
== !
$char" %
)% &
{ 
break   !
;  ! "
}!! 
if## 
(## 
ch## 
==## !
$char##" &
)##& '
{$$ 
pos&& 
=&&  !
Text&&" &
.&&& '

.&&4 5

Extensions&&5 ?
.&&? @(
GetIndexAfterNextSingleQuote&&@ \
(&&\ ]
path&&] a
,&&a b
pos&&c f
,&&f g
true&&h l
)&&l m
;&&m n
}'' 
else(( 
if(( 
(((  !
ch((! #
==(($ &
$char((' *
)((* +
{)) 
pos++ 
=++  !
Text++" &
.++& '

.++4 5

Extensions++5 ?
.++? @(
GetIndexAfterNextDoubleQuote++@ \
(++\ ]
path++] a
,++a b
pos++c f
,++f g
true++h l
)++l m
;++m n
},, 
}-- 
}.. 
else// 
{00 
sb11 
.11 
Append11 
(11 
ch11  
)11  !
;11! "
}22 
}33 
return55 
sb55 
.55 
ToString55 
(55 
)55  
;55  !
}66 	
}77 
}88 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToByteArray.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
byte
[
]
ToByteArray
(
this
string
@this
)
{ 	
Encoding 
encoding 
= 
	Activator  )
.) *
CreateInstance* 8
<8 9

>F G
(G H
)H I
;I J
return 
encoding 
. 
GetBytes $
($ %
@this% *
)* +
;+ ,
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToDirectoryInfo.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 

ToDirectoryInfo$ 3
(3 4
this4 8
string9 ?
@this@ E
)E F
{
return 
new 

($ %
@this% *
)* +
;+ ,
} 	
} 
} �
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToEnum.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
T 
ToEnum 
< 
T  
>  !
(! "
this" &
string' -
@this. 3
)3 4
{
Type 
enumType 
= 
typeof "
(" #
T# $
)$ %
;% &
return 
( 
T 
) 
global 
:: 
System $
.$ %
Enum% )
.) *
Parse* /
(/ 0
enumType0 8
,8 9
@this: ?
)? @
;@ A
} 	
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToFileInfo.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
FileInfo 

ToFileInfo )
() *
this* .
string/ 5
@this6 ;
); <
{
return 
new 
FileInfo 
(  
@this  %
)% &
;& '
} 	
} 
} �
{F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToLong.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
List 
< 
long 
>  
ToLong! '
(' (
this( ,
string- 3
@this4 9
)9 :
{
List 
< 
long 
> 
longList 
=  !
null" &
;& '
if 
( 
! 
@this 
. 

($ %
)% &
)& '
{ 
string 
[ 
] 

listValues #
=$ %
@this& +
.+ ,
Split, 1
(1 2
$str2 5
)5 6
;6 7
longList 
= 
new 
List #
<# $
long$ (
>( )
() *
)* +
;+ ,
foreach 
( 
string 
item  $
in% '

listValues( 2
)2 3
{ 
if 
( 
long 
. 
TryParse %
(% &
item& *
,* +
out, /
long0 4
	longValue5 >
)> ?
)? @
{ 
longList  
.  !
Add! $
($ %
	longValue% .
). /
;/ 0
} 
} 
} 
return 
longList 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToMemoryStream.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
Stream 
ToMemoryStream +
(+ ,
this, 0
string1 7
@this8 =
)= >
{ 	
Encoding 
encoding 
= 
	Activator  )
.) *
CreateInstance* 8
<8 9

>F G
(G H
)H I
;I J
return 
new 
MemoryStream #
(# $
encoding$ ,
., -
GetBytes- 5
(5 6
@this6 ;
); <
)< =
;= >
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToSecureString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
SecureString "
ToSecureString# 1
(1 2
this2 6
string7 =
@this> C
)C D
{
SecureString 
secureString %
=& '
new( +
(+ ,
), -
;- .
foreach 
( 
char 
c 
in 
@this $
)$ %
{ 
secureString 
. 

AppendChar '
(' (
c( )
)) *
;* +
} 
return 
secureString 
;  
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToTitleCase.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
ToTitleCase (
(( )
this) -
string. 4
@this5 :
): ;
{
return 
new 
CultureInfo "
(" #
$str# *
)* +
.+ ,
TextInfo, 4
.4 5
ToTitleCase5 @
(@ A
@thisA F
)F G
;G H
} 	
public 
static 
string 
ToTitleCase (
(( )
this) -
string. 4
@this5 :
,: ;
CultureInfo< G
cultureInfoH S
)S T
{ 	
return 
cultureInfo 
. 
TextInfo '
.' (
ToTitleCase( 3
(3 4
@this4 9
)9 :
;: ;
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToXDocument.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{		 
public 
static 
	XDocument 
ToXDocument  +
(+ ,
this, 0
string1 7
@this8 =
)= >
{ 	
Encoding 
encoding 
= 
	Activator  )
.) *
CreateInstance* 8
<8 9

>F G
(G H
)H I
;I J
using 
MemoryStream 
ms !
=" #
new$ '
(' (
encoding( 0
.0 1
GetBytes1 9
(9 :
@this: ?
)? @
)@ A
;A B
return 
	XDocument 
. 
Load !
(! "
ms" $
)$ %
;% &
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.ToXmlDocument.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
XmlDocument !

(/ 0
this0 4
string5 ;
@this< A
)A B
{
XmlDocument 
doc 
= 
new !
(! "
)" #
;# $
doc 
. 
LoadXml 
( 
@this 
) 
; 
return 
doc 
; 
} 	
} 
} �
}F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\String.Truncate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Truncate %
(% &
this& *
string+ 1
@this2 7
,7 8
int9 <
	maxLength= F
)F G
{ 	
const
string
suffix
=
$str
;
if 
( 
@this 
== 
null 
||  
@this! &
.& '
Length' -
<=. 0
	maxLength1 :
): ;
{ 
return 
@this 
; 
} 
int 
	strLength 
= 
	maxLength %
-& '
suffix( .
.. /
Length/ 5
;5 6
return 
@this 
[ 
.. 
	strLength $
]$ %
+& '
suffix( .
;. /
} 	
public 
static 
string 
Truncate %
(% &
this& *
string+ 1
@this2 7
,7 8
int9 <
	maxLength= F
,F G
stringH N
suffixO U
)U V
{   	
if!! 
(!! 
@this!! 
==!! 
null!! 
||!!  
@this!!! &
.!!& '
Length!!' -
<=!!. 0
	maxLength!!1 :
)!!: ;
{"" 
return## 
@this## 
;## 
}$$ 
int&& 
	strLength&& 
=&& 
	maxLength&& %
-&&& '
suffix&&( .
.&&. /
Length&&/ 5
;&&5 6
return'' 
@this'' 
['' 
..'' 
	strLength'' $
]''$ %
+''& '
suffix''( .
;''. /
}(( 	
})) 
}** �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.ConvertToUtf32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
ConvertToUtf32 (
(( )
this) -
string. 4
s5 6
,6 7
int8 ;
index< A
)A B
{ 	
return 
char 
. 
ConvertToUtf32 &
(& '
s' (
,( )
index* /
)/ 0
;0 1
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.GetNumericValue.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
GetNumericValue ,
(, -
this- 1
string2 8
s9 :
,: ;
int< ?
index@ E
)E F
{ 	
return 
char 
. 
GetNumericValue '
(' (
s( )
,) *
index+ 0
)0 1
;1 2
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.GetUnicodeCategory.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
UnicodeCategory %
GetUnicodeCategory& 8
(8 9
this9 =
string> D
sE F
,F G
intH K
indexL Q
)Q R
{ 	
return 
char 
. 
GetUnicodeCategory *
(* +
s+ ,
,, -
index. 3
)3 4
;4 5
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsControl.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
	IsControl $
($ %
this% )
string* 0
s1 2
,2 3
int4 7
index8 =
)= >
{
return 
char 
. 
	IsControl !
(! "
s" #
,# $
index% *
)* +
;+ ,
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsDigit.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsDigit "
(" #
this# '
string( .
s/ 0
,0 1
int2 5
index6 ;
); <
{
return 
char 
. 
IsDigit 
(  
s  !
,! "
index# (
)( )
;) *
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsHighSurrogate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsHighSurrogate *
(* +
this+ /
string0 6
s7 8
,8 9
int: =
index> C
)C D
{ 	
return 
char 
. 
IsHighSurrogate '
(' (
s( )
,) *
index+ 0
)0 1
;1 2
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsLetter.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsLetter #
(# $
this$ (
string) /
s0 1
,1 2
int3 6
index7 <
)< =
{
return 
char 
. 
IsLetter  
(  !
s! "
," #
index$ )
)) *
;* +
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsLetterOrDigit.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsLetterOrDigit *
(* +
this+ /
string0 6
s7 8
,8 9
int: =
index> C
)C D
{
return 
char 
. 
IsLetterOrDigit '
(' (
s( )
,) *
index+ 0
)0 1
;1 2
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsLower.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsLower "
(" #
this# '
string( .
s/ 0
,0 1
int2 5
index6 ;
); <
{
return 
char 
. 
IsLower 
(  
s  !
,! "
index# (
)( )
;) *
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsLowSurrogate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsLowSurrogate )
() *
this* .
string/ 5
s6 7
,7 8
int9 <
index= B
)B C
{ 	
return 
char 
. 
IsLowSurrogate &
(& '
s' (
,( )
index* /
)/ 0
;0 1
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsNumber.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsNumber #
(# $
this$ (
string) /
s0 1
,1 2
int3 6
index7 <
)< =
{ 	
return
char
.
IsNumber
(
s
,
index
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsPunctuation.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 

(( )
this) -
string. 4
s5 6
,6 7
int8 ;
index< A
)A B
{
return 
char 
. 

(% &
s& '
,' (
index) .
). /
;/ 0
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsSeparator.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsSeparator &
(& '
this' +
string, 2
s3 4
,4 5
int6 9
index: ?
)? @
{
return 
char 
. 
IsSeparator #
(# $
s$ %
,% &
index' ,
), -
;- .
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsSurrogate.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
IsSurrogate
(
this
string
s
,
int
index
)
{ 	
return 
char 
. 
IsSurrogate #
(# $
s$ %
,% &
index' ,
), -
;- .
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsSurrogatePair.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsSurrogatePair *
(* +
this+ /
string0 6
s7 8
,8 9
int: =
index> C
)C D
{ 	
return 
char 
. 
IsSurrogatePair '
(' (
s( )
,) *
index+ 0
)0 1
;1 2
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsSymbol.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsSymbol #
(# $
this$ (
string) /
s0 1
,1 2
int3 6
index7 <
)< =
{
return 
char 
. 
IsSymbol  
(  !
s! "
," #
index$ )
)) *
;* +
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsUpper.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsUpper "
(" #
this# '
string( .
s/ 0
,0 1
int2 5
index6 ;
); <
{
return 
char 
. 
IsUpper 
(  
s  !
,! "
index# (
)( )
;) *
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Char\String.IsWhiteSpace.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Char= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsWhiteSpace '
(' (
this( ,
string- 3
s4 5
,5 6
int7 :
index; @
)@ A
{ 	
return
char
.
IsWhiteSpace
(
s
,
index
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.CompareOrdinal.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
CompareOrdinal (
(( )
this) -
string. 4
strA5 9
,9 :
string; A
strBB F
)F G
{ 	
return 
string 
. 
CompareOrdinal (
(( )
strA) -
,- .
strB/ 3
)3 4
;4 5
} 	
public!! 
static!! 
int!! 
CompareOrdinal!! (
(!!( )
this!!) -
string!!. 4
strA!!5 9
,!!9 :
int!!; >
indexA!!? E
,!!E F
string!!G M
strB!!N R
,!!R S
int!!T W
indexB!!X ^
,!!^ _
int!!` c
length!!d j
)!!j k
{"" 	
return## 
string## 
.## 
CompareOrdinal## (
(##( )
strA##) -
,##- .
indexA##/ 5
,##5 6
strB##7 ;
,##; <
indexB##= C
,##C D
length##E K
)##K L
;##L M
}$$ 	
}%% 
}&& �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.Concat.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Concat #
(# $
this$ (
string) /
str00 4
,4 5
string6 <
str1= A
)A B
{ 	
return
string
.
Concat
(
str0
,
str1
)
;
} 	
public 
static 
string 
Concat #
(# $
this$ (
string) /
str00 4
,4 5
string6 <
str1= A
,A B
stringC I
str2J N
)N O
{ 	
return 
string 
. 
Concat  
(  !
str0! %
,% &
str1' +
,+ ,
str2- 1
)1 2
;2 3
} 	
public$$ 
static$$ 
string$$ 
Concat$$ #
($$# $
this$$$ (
string$$) /
str0$$0 4
,$$4 5
string$$6 <
str1$$= A
,$$A B
string$$C I
str2$$J N
,$$N O
string$$P V
str3$$W [
)$$[ \
{%% 	
return&& 
string&& 
.&& 
Concat&&  
(&&  !
str0&&! %
,&&% &
str1&&' +
,&&+ ,
str2&&- 1
,&&1 2
str3&&3 7
)&&7 8
;&&8 9
}'' 	
}(( 
})) �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.Copy.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 
Copy

 !
(

! "
this

" &
string

' -
str

. 1
)

1 2
{ 	
return 
string 
. 
Copy 
( 
str "
)" #
;# $
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.Format.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Format #
(# $
this$ (
string) /
format0 6
,6 7
object8 >
arg0? C
)C D
{ 	
return
string
.
Format
(
format
,
arg0
)
;
} 	
public 
static 
string 
Format #
(# $
this$ (
string) /
format0 6
,6 7
object8 >
arg0? C
,C D
objectE K
arg1L P
)P Q
{ 	
return 
string 
. 
Format  
(  !
format! '
,' (
arg0) -
,- .
arg1/ 3
)3 4
;4 5
} 	
public&& 
static&& 
string&& 
Format&& #
(&&# $
this&&$ (
string&&) /
format&&0 6
,&&6 7
object&&8 >
arg0&&? C
,&&C D
object&&E K
arg1&&L P
,&&P Q
object&&R X
arg2&&Y ]
)&&] ^
{'' 	
return(( 
string(( 
.(( 
Format((  
(((  !
format((! '
,((' (
arg0(() -
,((- .
arg1((/ 3
,((3 4
arg2((5 9
)((9 :
;((: ;
})) 	
public55 
static55 
string55 
Format55 #
(55# $
this55$ (
string55) /
format550 6
,556 7
object558 >
[55> ?
]55? @
args55A E
)55E F
{66 	
return77 
string77 
.77 
Format77  
(77  !
format77! '
,77' (
args77) -
)77- .
;77. /
}88 	
}99 
}:: �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.Intern.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Intern #
(# $
this$ (
string) /
str0 3
)3 4
{
return 
string 
. 
Intern  
(  !
str! $
)$ %
;% &
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.IsInterned.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
string

 

IsInterned

 '
(

' (
this

( ,
string

- 3
str

4 7
)

7 8
{ 	
return 
string 
. 

IsInterned $
($ %
str% (
)( )
;) *
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.IsNullOrWhiteSpace.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNullOrWhiteSpace

 -
(

- .
this

. 2
string

3 9
value

: ?
)

? @
{ 	
return 
string 
. 
IsNullOrWhiteSpace ,
(, -
value- 2
)2 3
;3 4
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.String\String.Join.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
String= C
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
string 
Join !
(! "
this" &
string' -
	separator. 7
,7 8
string9 ?
[? @
]@ A
valueB G
)G H
{ 	
return 
string 
. 
Join 
( 
	separator (
,( )
value* /
)/ 0
;0 1
} 	
public$$ 
static$$ 
string$$ 
Join$$ !
($$! "
this$$" &
string$$' -
	separator$$. 7
,$$7 8
object$$9 ?
[$$? @
]$$@ A
values$$B H
)$$H I
{%% 	
return&& 
string&& 
.&& 
Join&& 
(&& 
	separator&& (
,&&( )
values&&* 0
)&&0 1
;&&1 2
}'' 	
public33 
static33 
string33 
Join33 !
<33! "
T33" #
>33# $
(33$ %
this33% )
string33* 0
	separator331 :
,33: ;
IEnumerable33< G
<33G H
T33H I
>33I J
values33K Q
)33Q R
{44 	
return55 
string55 
.55 
Join55 
(55 
	separator55 (
,55( )
values55* 0
)550 1
;551 2
}66 	
publicDD 
staticDD 
stringDD 
JoinDD !
(DD! "
thisDD" &
stringDD' -
	separatorDD. 7
,DD7 8
IEnumerableDD9 D
<DDD E
stringDDE K
>DDK L
valuesDDM S
)DDS T
{EE 	
returnFF 
stringFF 
.FF 
JoinFF 
(FF 
	separatorFF (
,FF( )
valuesFF* 0
)FF0 1
;FF1 2
}GG 	
publicWW 
staticWW 
stringWW 
JoinWW !
(WW! "
thisWW" &
stringWW' -
	separatorWW. 7
,WW7 8
stringWW9 ?
[WW? @
]WW@ A
valueWWB G
,WWG H
intWWI L

startIndexWWM W
,WWW X
intWWY \
countWW] b
)WWb c
{XX 	
returnYY 
stringYY 
.YY 
JoinYY 
(YY 
	separatorYY (
,YY( )
valueYY* /
,YY/ 0

startIndexYY1 ;
,YY; <
countYY= B
)YYB C
;YYC D
}ZZ 	
}[[ 
}\\ �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Text.RegularExpressions.Regex\String.IsMatch.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Text= A
.A B
RegularExpressionsB T
.T U
RegexU Z
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
IsMatch
(
this
string
input
,
string
pattern
)
{ 	
return 
global 
:: 
System !
.! "
Text" &
.& '
RegularExpressions' 9
.9 :
Regex: ?
.? @
IsMatch@ G
(G H
inputH M
,M N
patternO V
)V W
;W X
} 	
public 
static 
bool 
IsMatch "
(" #
this# '
string( .
input/ 4
,4 5
string6 <
pattern= D
,D E
RegexOptionsF R
optionsS Z
)Z [
{ 	
return 
global 
:: 
System !
.! "
Text" &
.& '
RegularExpressions' 9
.9 :
Regex: ?
.? @
IsMatch@ G
(G H
inputH M
,M N
patternO V
,V W
optionsX _
)_ `
;` a
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Text.RegularExpressions.Regex\String.Match.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Text= A
.A B
RegularExpressionsB T
.T U
RegexU Z
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
Match
Match
(
this
string
input
,
string
pattern
)
{ 	
return 
global 
:: 
System !
.! "
Text" &
.& '
RegularExpressions' 9
.9 :
Regex: ?
.? @
Match@ E
(E F
inputF K
,K L
patternM T
)T U
;U V
} 	
public 
static 
Match 
Match !
(! "
this" &
string' -
input. 3
,3 4
string5 ;
pattern< C
,C D
RegexOptionsE Q
optionsR Y
)Y Z
{ 	
return 
global 
:: 
System !
.! "
Text" &
.& '
RegularExpressions' 9
.9 :
Regex: ?
.? @
Match@ E
(E F
inputF K
,K L
patternM T
,T U
optionsV ]
)] ^
;^ _
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\System.Text.RegularExpressions.Regex\String.Matches.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
System6 <
.< =
Text= A
.A B
RegularExpressionsB T
.T U
RegexU Z
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
MatchCollection %
Matches& -
(- .
this. 2
string3 9
input: ?
,? @
stringA G
patternH O
)O P
{ 	
return 
global 
:: 
System !
.! "
Text" &
.& '
RegularExpressions' 9
.9 :
Regex: ?
.? @
Matches@ G
(G H
inputH M
,M N
patternO V
)V W
;W X
} 	
public   
static   
MatchCollection   %
Matches  & -
(  - .
this  . 2
string  3 9
input  : ?
,  ? @
string  A G
pattern  H O
,  O P
RegexOptions  Q ]
options  ^ e
)  e f
{!! 	
return"" 
global"" 
::"" 
System"" !
.""! "
Text""" &
.""& '
RegularExpressions""' 9
.""9 :
Regex"": ?
.""? @
Matches""@ G
(""G H
input""H M
,""M N
pattern""O V
,""V W
options""X _
)""_ `
;""` a
}## 	
}$$ 
}%% �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\zzzRegexPattern\String.IsValidEmail.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
zzzRegexPattern6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
IsValidEmail '
(' (
this( ,
string- 3
obj4 7
)7 8
{
return 
Regex 
. 
IsMatch  
(  !
obj! $
,$ %
$str	& �
)
� �
;
� �
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\zzzRegexPattern\String.IsValidIP.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
zzzRegexPattern6 E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
	IsValidIP $
($ %
this% )
string* 0
obj1 4
)4 5
{
return 
Regex 
. 
IsMatch  
(  !
obj! $
,$ %
$str	& �
)
� �
;
� �
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_CoreObject\String.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
In 
( 
this "
string# )
@this* /
,/ 0
params1 7
string8 >
[> ?
]? @
valuesA G
)G H
{ 	
return
global
::
System
.
Array
.
IndexOf
(
values
,
@this
)
!=
-
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_CoreObject\String.IsNotNull.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
	IsNotNull

 $
(

$ %
this

% )
string

* 0
@this

1 6
)

6 7
{ 	
return 
@this 
!= 
null  
;  !
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_CoreObject\String.IsNull.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
bool

 
IsNull

 !
(

! "
this

" &
string

' -
@this

. 3
)

3 4
{ 	
return 
@this 
== 
null  
;  !
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_CoreObject\String.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
NotIn  
(  !
this! %
string& ,
@this- 2
,2 3
params4 :
string; A
[A B
]B C
valuesD J
)J K
{ 	
return
global
::
System
.
Array
.
IndexOf
(
values
,
@this
)
==
-
$num
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractDecimal.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
decimal
ExtractDecimal
(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
||+ -
@this. 3
[3 4
i4 5
]5 6
==7 9
$char: =
)= >
{ 
if 
( 
sb 
. 
Length !
==" $
$num% &
&&' )
i* +
>, -
$num. /
&&0 2
@this3 8
[8 9
i9 :
-; <
$num= >
]> ?
==@ B
$charC F
)F G
{ 
sb 
. 
Append !
(! "
$char" %
)% &
;& '
} 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
	ToDecimal $
($ %
sb% '
.' (
ToString( 0
(0 1
)1 2
)2 3
;3 4
} 	
} 
}   �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractDouble.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
double

(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
||+ -
@this. 3
[3 4
i4 5
]5 6
==7 9
$char: =
)= >
{ 
if 
( 
sb 
. 
Length !
==" $
$num% &
&&' )
i* +
>, -
$num. /
&&0 2
@this3 8
[8 9
i9 :
-; <
$num= >
]> ?
==@ B
$charC F
)F G
{ 
sb 
. 
Append !
(! "
$char" %
)% &
;& '
} 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
ToDouble #
(# $
sb$ &
.& '
ToString' /
(/ 0
)0 1
)1 2
;2 3
} 	
} 
}   �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
short
ExtractInt16
(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
)* +
{ 
if 
( 
sb 
. 
Length !
==" $
$num% &
&&' )
i* +
>, -
$num. /
&&0 2
@this3 8
[8 9
i9 :
-; <
$num= >
]> ?
==@ B
$charC F
)F G
{ 
sb 
. 
Append !
(! "
$char" %
)% &
;& '
} 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
ToInt16 "
(" #
sb# %
.% &
ToString& .
(. /
)/ 0
)0 1
;1 2
} 	
} 
}   �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
int
ExtractInt32
(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
)* +
{ 
if 
( 
sb 
. 
Length !
==" $
$num% &
&&' )
i* +
>, -
$num. /
&&0 2
@this3 8
[8 9
i9 :
-; <
$num= >
]> ?
==@ B
$charC F
)F G
{ 
sb 
. 
Append !
(! "
$char" %
)% &
;& '
} 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
ToInt32 "
(" #
sb# %
.% &
ToString& .
(. /
)/ 0
)0 1
;1 2
} 	
} 
}   �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
long
ExtractInt64
(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
)* +
{ 
if 
( 
sb 
. 
Length !
==" $
$num% &
&&' )
i* +
>, -
$num. /
&&0 2
@this3 8
[8 9
i9 :
-; <
$num= >
]> ?
==@ B
$charC F
)F G
{ 
sb 
. 
Append !
(! "
$char" %
)% &
;& '
} 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
ToInt64 "
(" #
sb# %
.% &
ToString& .
(. /
)/ 0
)0 1
;1 2
} 	
} 
}   �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyDecimal.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
decimal 
[ 
] 
ExtractManyDecimal  2
(2 3
this3 7
string8 >
@this? D
)D E
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( :
): ;
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
	ToDecimal% .
(. /
x/ 0
.0 1
Value1 6
)6 7
)7 8
. 
ToArray 
( 
) 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyDouble.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
double 
[ 
] 
ExtractManyDouble 0
(0 1
this1 5
string6 <
@this= B
)B C
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( :
): ;
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
ToDouble% -
(- .
x. /
./ 0
Value0 5
)5 6
)6 7
. 
ToArray 
( 
) 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
short 
[ 
] 
ExtractManyInt16 .
(. /
this/ 3
string4 :
@this; @
)@ A
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( 2
)2 3
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
ToInt16% ,
(, -
x- .
.. /
Value/ 4
)4 5
)5 6
. 
ToArray 
( 
) 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int 
[ 
] 
ExtractManyInt32 ,
(, -
this- 1
string2 8
@this9 >
)> ?
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( 2
)2 3
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
ToInt32% ,
(, -
x- .
.. /
Value/ 4
)4 5
)5 6
. 
ToArray 
( 
) 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
long 
[ 
] 
ExtractManyInt64 -
(- .
this. 2
string3 9
@this: ?
)? @
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( 2
)2 3
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
ToInt64% ,
(, -
x- .
.. /
Value/ 4
)4 5
)5 6
. 
ToArray 
( 
) 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyUInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
[ 
] 
ExtractManyUInt16 0
(0 1
this1 5
string6 <
@this= B
)B C
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( .
). /
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
ToUInt16% -
(- .
x. /
./ 0
Value0 5
)5 6
)6 7
. 
ToArray 
( 
) 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyUInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
uint 
[ 
] 
ExtractManyUInt32 .
(. /
this/ 3
string4 :
@this; @
)@ A
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( .
). /
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
ToUInt32% -
(- .
x. /
./ 0
Value0 5
)5 6
)6 7
. 
ToArray 
( 
) 
; 
} 	
} 
} �

�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractManyUInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
[ 
] 
ExtractManyUInt64 /
(/ 0
this0 4
string5 ;
@this< A
)A B
{ 	
return 
Regex 
. 
Matches  
(  !
@this! &
,& '
$str( .
). /
. 
Cast 
< 
Match 
> 
( 
) 
. 
Select 
( 
x 
=> 
Convert $
.$ %
ToUInt64% -
(- .
x. /
./ 0
Value0 5
)5 6
)6 7
. 
ToArray 
( 
) 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractUInt16.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
ushort

(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
)* +
{ 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
ToUInt16 #
(# $
sb$ &
.& '
ToString' /
(/ 0
)0 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractUInt32.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
uint

(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
)* +
{ 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
ToUInt32 #
(# $
sb$ &
.& '
ToString' /
(/ 0
)0 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.String\_ExtractValueType\String.ExtractUInt64.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
String/ 5
.5 6
_ExtractValueType6 G
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
ulong

(
this
string
@this
)
{ 	

sb 
= 
new "
(" #
)# $
;$ %
for 
( 
int 
i 
= 
$num 
; 
i 
< 
@this  %
.% &
Length& ,
;, -
i. /
++/ 1
)1 2
{ 
if 
( 
char 
. 
IsDigit  
(  !
@this! &
[& '
i' (
]( )
)) *
)* +
{ 
sb 
. 
Append 
( 
@this #
[# $
i$ %
]% &
)& '
;' (
} 
} 
return 
Convert 
. 
ToUInt64 #
(# $
sb$ &
.& '
ToString' /
(/ 0
)0 1
)1 2
;2 3
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractChar.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
char

 
ExtractChar

 &
(

& '
this

' +
global

, 2
::

2 4
System

4 :
.

: ;
Text

; ?
.

? @


@ M
@this

N S
)

S T
{ 	
return 
@this 
. 
ExtractChar $
($ %
$num% &
)& '
;' (
}
public 
static 
char 
ExtractChar &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
Text; ?
.? @

@thisN S
,S T
outU X
intY \
endIndex] e
)e f
{ 	
return 
@this 
. 
ExtractChar $
($ %
$num% &
,& '
out( +
endIndex, 4
)4 5
;5 6
} 	
public 
static 
char 
ExtractChar &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
Text; ?
.? @

@thisN S
,S T
intU X

startIndexY c
)c d
{ 	
return 
@this 
. 
ExtractChar $
($ %

startIndex% /
,/ 0
out1 4
int5 8
endIndex9 A
)A B
;B C
} 	
public'' 
static'' 
char'' 
ExtractChar'' &
(''& '
this''' +
global'', 2
::''2 4
System''4 :
.'': ;
Text''; ?
.''? @

@this''N S
,''S T
int''U X

startIndex''Y c
,''c d
out''e h
int''i l
endIndex''m u
)''u v
{(( 	
if)) 
()) 
@this)) 
.)) 
Length)) 
>)) 

startIndex)) )
+))* +
$num)), -
)))- .
{** 
char++ 
ch1++ 
=++ 
@this++  
[++  !

startIndex++! +
]+++ ,
;++, -
char,, 
ch2,, 
=,, 
@this,,  
[,,  !

startIndex,,! +
+,,, -
$num,,. /
],,/ 0
;,,0 1
char-- 
ch3-- 
=-- 
@this--  
[--  !

startIndex--! +
+--, -
$num--. /
]--/ 0
;--0 1
if// 
(// 
ch1// 
==// 
$char// 
&&//  "
ch3//# &
==//' )
$char//* .
)//. /
{00 
endIndex11 
=11 

startIndex11 )
+11* +
$num11, -
;11- .
return22 
ch222 
;22 
}33 
}44 
throw66 
new66 
	Exception66 
(66  
$str66  <
+66= >

startIndex66? I
)66I J
;66J K
}77 	
}88 
}99 �#
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractComment.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractComment8 F
(F G
thisG K
globalL R
::R T
SystemT Z
.Z [
Text[ _
._ `

@thisn s
)s t
{		 	
return

 
@this

 
.

 
ExtractComment

 '
(

' (
$num

( )
)

) *
;

* +
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractComment8 F
(F G
thisG K
globalL R
::R T
SystemT Z
.Z [
Text[ _
._ `

@thisn s
,s t
outu x
inty |
endIndex	} �
)
� �
{ 	
return 
@this 
. 
ExtractComment '
(' (
$num( )
,) *
out+ .
endIndex/ 7
)7 8
;8 9
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractComment8 F
(F G
thisG K
globalL R
::R T
SystemT Z
.Z [
Text[ _
._ `

@thisn s
,s t
intu x

startIndex	y �
)
� �
{ 	
return 
@this 
. 
ExtractComment '
(' (

startIndex( 2
,2 3
out4 7
int8 ;
endIndex< D
)D E
;E F
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *

ExtractComment$$8 F
($$F G
this$$G K
global$$L R
::$$R T
System$$T Z
.$$Z [
Text$$[ _
.$$_ `

@this$$n s
,$$s t
int$$u x

startIndex	$$y �
,
$$� �
out
$$� �
int
$$� �
endIndex
$$� �
)
$$� �
{%% 	
if&& 
(&& 
@this&& 
.&& 
Length&& 
>&& 

startIndex&& )
+&&* +
$num&&, -
)&&- .
{'' 
char(( 
ch1(( 
=(( 
@this((  
[((  !

startIndex((! +
]((+ ,
;((, -
char)) 
ch2)) 
=)) 
@this))  
[))  !

startIndex))! +
+)), -
$num)). /
]))/ 0
;))0 1
if++ 
(++ 
ch1++ 
==++ 
$char++ 
&&++ !
ch2++" %
==++& (
$char++) ,
)++, -
{,, 
return// 
@this//  
.//  !$
ExtractCommentSingleLine//! 9
(//9 :

startIndex//: D
,//D E
out//F I
endIndex//J R
)//R S
;//S T
}00 
if22 
(22 
ch122 
==22 
$char22 
&&22 !
ch222" %
==22& (
$char22) ,
)22, -
{33 
return88 
@this88  
.88  !#
ExtractCommentMultiLine88! 8
(888 9

startIndex889 C
,88C D
out88E H
endIndex88I Q
)88Q R
;88R S
}99 
}:: 
endIndex<< 
=<< 
-<< 
$num<< 
;<< 
return== 
null== 
;== 
}>> 	
}?? 
}@@ �.
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractCommentMultiLine.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractCommentMultiLine8 O
(O P
thisP T
globalU [
::[ ]
System] c
.c d
Textd h
.h i

@thisw |
)| }
{ 	
return
@this
.
ExtractCommentMultiLine
(
$num
)
;
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractCommentMultiLine8 O
(O P
thisP T
globalU [
::[ ]
System] c
.c d
Textd h
.h i

@thisw |
,| }
out	~ �
int
� �
endIndex
� �
)
� �
{ 	
return 
@this 
. #
ExtractCommentMultiLine 0
(0 1
$num1 2
,2 3
out4 7
endIndex8 @
)@ A
;A B
} 	
public## 
static## 
global## 
::## 
System## $
.##$ %
Text##% )
.##) *

ExtractCommentMultiLine##8 O
(##O P
this##P T
global##U [
::##[ ]
System##] c
.##c d
Text##d h
.##h i

@this##w |
,##| }
int	##~ �

startIndex
##� �
)
##� �
{$$ 	
return%% 
@this%% 
.%% #
ExtractCommentMultiLine%% 0
(%%0 1

startIndex%%1 ;
,%%; <
out%%= @
int%%A D
endIndex%%E M
)%%M N
;%%N O
}&& 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
Text00% )
.00) *

ExtractCommentMultiLine008 O
(00O P
this00P T
global00U [
::00[ ]
System00] c
.00c d
Text00d h
.00h i

@this00w |
,00| }
int	00~ �

startIndex
00� �
,
00� �
out
00� �
int
00� �
endIndex
00� �
)
00� �
{11 	
global22 
::22 
System22 
.22 
Text22 
.22  

sb22. 0
=221 2
new223 6
(226 7
)227 8
;228 9
if44 
(44 
@this44 
.44 
Length44 
>44 

startIndex44 )
+44* +
$num44, -
)44- .
{55 
char66 
ch166 
=66 
@this66  
[66  !

startIndex66! +
]66+ ,
;66, -
char77 
ch277 
=77 
@this77  
[77  !

startIndex77! +
+77, -
$num77. /
]77/ 0
;770 1
if99 
(99 
ch199 
==99 
$char99 
&&99 !
ch299" %
==99& (
$char99) ,
)99, -
{:: 
sb?? 
.?? 
Append?? 
(?? 
ch1?? !
)??! "
;??" #
sb@@ 
.@@ 
Append@@ 
(@@ 
ch2@@ !
)@@! "
;@@" #
intAA 
posAA 
=AA 

startIndexAA (
+AA) *
$numAA+ ,
;AA, -
whileCC 
(CC 
posCC 
<CC  
@thisCC! &
.CC& '
LengthCC' -
)CC- .
{DD 
charEE 
chEE 
=EE  !
@thisEE" '
[EE' (
posEE( +
]EE+ ,
;EE, -
posFF 
++FF 
;FF 
ifHH 
(HH 
chHH 
==HH !
$charHH" %
&&HH& (
posHH) ,
<HH- .
@thisHH/ 4
.HH4 5
LengthHH5 ;
&&HH< >
@thisHH? D
[HHD E
posHHE H
]HHH I
==HHJ L
$charHHM P
)HHP Q
{II 
sbJJ 
.JJ 
AppendJJ %
(JJ% &
chJJ& (
)JJ( )
;JJ) *
sbKK 
.KK 
AppendKK %
(KK% &
@thisKK& +
[KK+ ,
posKK, /
]KK/ 0
)KK0 1
;KK1 2
endIndexLL $
=LL% &
posLL' *
;LL* +
returnMM "
sbMM# %
;MM% &
}NN 
sbPP 
.PP 
AppendPP !
(PP! "
chPP" $
)PP$ %
;PP% &
}QQ 
endIndexSS 
=SS 
posSS "
;SS" #
returnTT 
sbTT 
;TT 
}UU 
}VV 
endIndexXX 
=XX 
-XX 
$numXX 
;XX 
returnYY 
nullYY 
;YY 
}ZZ 	
}[[ 
}\\ �,
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractCommentSingleLine.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractCommentSingleLine8 P
(P Q
thisQ U
globalV \
::\ ^
System^ d
.d e
Texte i
.i j

@thisx }
)} ~
{ 	
return
@this
.
ExtractCommentSingleLine
(
$num
)
;
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractCommentSingleLine8 P
(P Q
thisQ U
globalV \
::\ ^
System^ d
.d e
Texte i
.i j

@thisx }
,} ~
out	 �
int
� �
endIndex
� �
)
� �
{ 	
return 
@this 
. $
ExtractCommentSingleLine 1
(1 2
$num2 3
,3 4
out5 8
endIndex9 A
)A B
;B C
} 	
public## 
static## 
global## 
::## 
System## $
.##$ %
Text##% )
.##) *

ExtractCommentSingleLine##8 P
(##P Q
this##Q U
global##V \
::##\ ^
System##^ d
.##d e
Text##e i
.##i j

@this##x }
,##} ~
int	## �

startIndex
##� �
)
##� �
{$$ 	
return%% 
@this%% 
.%% $
ExtractCommentSingleLine%% 1
(%%1 2

startIndex%%2 <
,%%< =
out%%> A
int%%B E
endIndex%%F N
)%%N O
;%%O P
}&& 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
Text00% )
.00) *

ExtractCommentSingleLine008 P
(00P Q
this00Q U
global00V \
::00\ ^
System00^ d
.00d e
Text00e i
.00i j

@this00x }
,00} ~
int	00 �

startIndex
00� �
,
00� �
out
00� �
int
00� �
endIndex
00� �
)
00� �
{11 	
global22 
::22 
System22 
.22 
Text22 
.22  

sb22. 0
=221 2
new223 6
(226 7
)227 8
;228 9
if44 
(44 
@this44 
.44 
Length44 
>44 

startIndex44 )
+44* +
$num44, -
)44- .
{55 
char66 
ch166 
=66 
@this66  
[66  !

startIndex66! +
]66+ ,
;66, -
char77 
ch277 
=77 
@this77  
[77  !

startIndex77! +
+77, -
$num77. /
]77/ 0
;770 1
if99 
(99 
ch199 
==99 
$char99 
&&99 !
ch299" %
==99& (
$char99) ,
)99, -
{:: 
sb== 
.== 
Append== 
(== 
ch1== !
)==! "
;==" #
sb>> 
.>> 
Append>> 
(>> 
ch2>> !
)>>! "
;>>" #
int?? 
pos?? 
=?? 

startIndex?? (
+??) *
$num??+ ,
;??, -
whileAA 
(AA 
posAA 
<AA  
@thisAA! &
.AA& '
LengthAA' -
)AA- .
{BB 
charCC 
chCC 
=CC  !
@thisCC" '
[CC' (
posCC( +
]CC+ ,
;CC, -
posDD 
++DD 
;DD 
ifFF 
(FF 
chFF 
==FF !
$charFF" &
&&FF' )
posFF* -
<FF. /
@thisFF0 5
.FF5 6
LengthFF6 <
&&FF= ?
@thisFF@ E
[FFE F
posFFF I
]FFI J
==FFK M
$charFFN R
)FFR S
{GG 
endIndexHH $
=HH% &
posHH' *
-HH+ ,
$numHH- .
;HH. /
returnII "
sbII# %
;II% &
}JJ 
sbLL 
.LL 
AppendLL !
(LL! "
chLL" $
)LL$ %
;LL% &
}MM 
endIndexOO 
=OO 
posOO "
;OO" #
returnPP 
sbPP 
;PP 
}QQ 
}RR 
endIndexTT 
=TT 
-TT 
$numTT 
;TT 
returnUU 
nullUU 
;UU 
}VV 	
}WW 
}XX �6
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractHexadecimal.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractHexadecimal8 J
(J K
thisK O
globalP V
::V X
SystemX ^
.^ _
Text_ c
.c d

@thisr w
)w x
{		 	
return

 
@this

 
.

 
ExtractHexadecimal

 +
(

+ ,
$num

, -
)

- .
;

. /
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractHexadecimal8 J
(J K
thisK O
globalP V
::V X
SystemX ^
.^ _
Text_ c
.c d

@thisr w
,w x
outy |
int	} �
endIndex
� �
)
� �
{ 	
return 
@this 
. 
ExtractHexadecimal +
(+ ,
$num, -
,- .
out/ 2
endIndex3 ;
); <
;< =
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractHexadecimal8 J
(J K
thisK O
globalP V
::V X
SystemX ^
.^ _
Text_ c
.c d

@thisr w
,w x
inty |

startIndex	} �
)
� �
{ 	
return 
@this 
. 
ExtractHexadecimal +
(+ ,

startIndex, 6
,6 7
out8 ;
int< ?
endIndex@ H
)H I
;I J
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *

ExtractHexadecimal$$8 J
($$J K
this$$K O
global$$P V
::$$V X
System$$X ^
.$$^ _
Text$$_ c
.$$c d

@this$$r w
,$$w x
int$$y |

startIndex	$$} �
,
$$� �
out
$$� �
int
$$� �
endIndex
$$� �
)
$$� �
{%% 	
if)) 
()) 

startIndex)) 
+)) 
$num)) 
<))  
@this))! &
.))& '
Length))' -
&&)). 0
@this))1 6
[))6 7

startIndex))7 A
]))A B
==))C E
$char))F I
&&** 
(** 
@this** 
[** 

startIndex** $
+**% &
$num**' (
]**( )
==*** ,
$char**- 0
||**1 3
@this**4 9
[**9 :

startIndex**: D
+**E F
$num**G H
]**H I
==**J L
$char**M P
)**P Q
)**Q R
{++ 
global,, 
::,, 
System,, 
.,, 
Text,, #
.,,# $

sb,,2 4
=,,5 6
new,,7 :
(,,: ;
),,; <
;,,< =
bool.. 
	hasNumber.. 
=..  
false..! &
;..& '
bool// 
	hasSuffix// 
=//  
false//! &
;//& '
sb11 
.11 
Append11 
(11 
@this11 
[11  

startIndex11  *
]11* +
)11+ ,
;11, -
sb22 
.22 
Append22 
(22 
@this22 
[22  

startIndex22  *
+22+ ,
$num22- .
]22. /
)22/ 0
;220 1
int44 
pos44 
=44 

startIndex44 $
+44% &
$num44' (
;44( )
while66 
(66 
pos66 
<66 
@this66 "
.66" #
Length66# )
)66) *
{77 
char88 
ch88 
=88 
@this88 #
[88# $
pos88$ '
]88' (
;88( )
pos99 
++99 
;99 
if;; 
(;; 
(;; 
(;; 
ch;; 
>=;; 
$char;;  #
&&;;$ &
ch;;' )
<=;;* ,
$char;;- 0
);;0 1
||<< 
(<< 
ch<< 
>=<<  "
$char<<# &
&&<<' )
ch<<* ,
<=<<- /
$char<<0 3
)<<3 4
||== 
(== 
ch== 
>===  "
$char==# &
&&==' )
ch==* ,
<===- /
$char==0 3
)==3 4
)==4 5
&&>> 
!>> 
	hasSuffix>> %
)>>% &
{?? 
	hasNumber@@ !
=@@" #
true@@$ (
;@@( )
sbAA 
.AA 
AppendAA !
(AA! "
chAA" $
)AA$ %
;AA% &
}BB 
elseCC 
ifCC 
(CC 
(CC 
chCC  
>=CC! #
$charCC$ '
&&CC( *
chCC+ -
<=CC. 0
$charCC1 4
)CC4 5
||CC6 8
(CC9 :
chCC: <
>=CC= ?
$charCC@ C
&&CCD F
chCCG I
<=CCJ L
$charCCM P
)CCP Q
)CCQ R
{DD 
	hasSuffixEE !
=EE" #
trueEE$ (
;EE( )
sbFF 
.FF 
AppendFF !
(FF! "
chFF" $
)FF$ %
;FF% &
}GG 
elseHH 
{II 
posJJ 
-=JJ 
$numJJ  
;JJ  !
breakKK 
;KK 
}LL 
}MM 
ifOO 
(OO 
	hasNumberOO 
)OO 
{PP 
endIndexQQ 
=QQ 
posQQ "
;QQ" #
returnRR 
sbRR 
;RR 
}SS 
}TT 
endIndexVV 
=VV 
-VV 
$numVV 
;VV 
returnWW 
nullWW 
;WW 
}XX 	
}YY 
}ZZ �+
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractKeyword.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractKeyword8 F
(F G
thisG K
globalL R
::R T
SystemT Z
.Z [
Text[ _
._ `

@thisn s
)s t
{		 	
return

 
@this

 
.

 
ExtractKeyword

 '
(

' (
$num

( )
)

) *
;

* +
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractKeyword8 F
(F G
thisG K
globalL R
::R T
SystemT Z
.Z [
Text[ _
._ `

@thisn s
,s t
outu x
inty |
endIndex	} �
)
� �
{ 	
return 
@this 
. 
ExtractKeyword '
(' (
$num( )
,) *
out+ .
endIndex/ 7
)7 8
;8 9
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractKeyword8 F
(F G
thisG K
globalL R
::R T
SystemT Z
.Z [
Text[ _
._ `

@thisn s
,s t
intu x

startIndex	y �
)
� �
{ 	
return 
@this 
. 
ExtractKeyword '
(' (

startIndex( 2
,2 3
out4 7
int8 ;
endIndex< D
)D E
;E F
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *

ExtractKeyword$$8 F
($$F G
this$$G K
global$$L R
::$$R T
System$$T Z
.$$Z [
Text$$[ _
.$$_ `

@this$$n s
,$$s t
int$$u x

startIndex	$$y �
,
$$� �
out
$$� �
int
$$� �
endIndex
$$� �
)
$$� �
{%% 	
global(( 
::(( 
System(( 
.(( 
Text(( 
.((  

sb((. 0
=((1 2
new((3 6
(((6 7
)((7 8
;((8 9
int** 
pos** 
=** 

startIndex**  
;**  !
bool++ 
hasCharacter++ 
=++ 
false++  %
;++% &
while-- 
(-- 
pos-- 
<-- 
@this-- 
.-- 
Length-- %
)--% &
{.. 
char// 
ch// 
=// 
@this// 
[//  
pos//  #
]//# $
;//$ %
pos00 
++00 
;00 
if22 
(22 
(22 
ch22 
>=22 
$char22 
&&22 !
ch22" $
<=22% '
$char22( +
)22+ ,
||22- /
(220 1
ch221 3
>=224 6
$char227 :
&&22; =
ch22> @
<=22A C
$char22D G
)22G H
)22H I
{33 
hasCharacter44  
=44! "
true44# '
;44' (
sb55 
.55 
Append55 
(55 
ch55  
)55  !
;55! "
}66 
else77 
if77 
(77 
ch77 
==77 
$char77 "
)77" #
{88 
sb99 
.99 
Append99 
(99 
ch99  
)99  !
;99! "
}:: 
else;; 
if;; 
(;; 
ch;; 
>=;; 
$char;; "
&&;;# %
ch;;& (
<=;;) +
$char;;, /
&&;;0 2
hasCharacter;;3 ?
);;? @
{<< 
sb== 
.== 
Append== 
(== 
ch==  
)==  !
;==! "
}>> 
else?? 
{@@ 
posAA 
-=AA 
$numAA 
;AA 
breakBB 
;BB 
}CC 
}DD 
ifFF 
(FF 
hasCharacterFF 
)FF 
{GG 
endIndexHH 
=HH 
posHH 
;HH 
returnII 
sbII 
;II 
}JJ 
endIndexLL 
=LL 
-LL 
$numLL 
;LL 
returnMM 
nullMM 
;MM 
}NN 	
}OO 
}PP �.
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractNumber.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
)r s
{		 	
return

 
@this

 
.

 


 &
(

& '
$num

' (
)

( )
;

) *
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
,r s
outt w
intx {
endIndex	| �
)
� �
{ 	
return 
@this 
. 

(& '
$num' (
,( )
out* -
endIndex. 6
)6 7
;7 8
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
,r s
intt w

startIndex	x �
)
� �
{ 	
return 
@this 
. 

(& '

startIndex' 1
,1 2
out3 6
int7 :
endIndex; C
)C D
;D E
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *


($$E F
this$$F J
global$$K Q
::$$Q S
System$$S Y
.$$Y Z
Text$$Z ^
.$$^ _

@this$$m r
,$$r s
int$$t w

startIndex	$$x �
,
$$� �
out
$$� �
int
$$� �
endIndex
$$� �
)
$$� �
{%% 	
global(( 
::(( 
System(( 
.(( 
Text(( 
.((  

sb((. 0
=((1 2
new((3 6
(((6 7
)((7 8
;((8 9
bool** 
	hasNumber** 
=** 
false** "
;**" #
bool++ 
hasDot++ 
=++ 
false++ 
;++  
bool,, 
	hasSuffix,, 
=,, 
false,, "
;,," #
int.. 
pos.. 
=.. 

startIndex..  
;..  !
while00 
(00 
pos00 
<00 
@this00 
.00 
Length00 %
)00% &
{11 
char22 
ch22 
=22 
@this22 
[22  
pos22  #
]22# $
;22$ %
pos33 
++33 
;33 
if55 
(55 
ch55 
>=55 
$char55 
&&55  
ch55! #
<=55$ &
$char55' *
&&55+ -
!55. /
	hasSuffix55/ 8
)558 9
{66 
	hasNumber77 
=77 
true77  $
;77$ %
sb88 
.88 
Append88 
(88 
ch88  
)88  !
;88! "
}99 
else:: 
if:: 
(:: 
ch:: 
==:: 
$char:: "
&&::# %
!::& '
	hasSuffix::' 0
&&::1 3
!::4 5
hasDot::5 ;
)::; <
{;; 
hasDot<< 
=<< 
true<< !
;<<! "
sb== 
.== 
Append== 
(== 
ch==  
)==  !
;==! "
}>> 
else?? 
if?? 
(?? 
(?? 
ch?? 
>=?? 
$char??  #
&&??$ &
ch??' )
<=??* ,
$char??- 0
)??0 1
||??2 4
(??5 6
ch??6 8
>=??9 ;
$char??< ?
&&??@ B
ch??C E
<=??F H
$char??I L
)??L M
)??M N
{@@ 
	hasSuffixAA 
=AA 
trueAA  $
;AA$ %
sbBB 
.BB 
AppendBB 
(BB 
chBB  
)BB  !
;BB! "
}CC 
elseDD 
{EE 
posFF 
-=FF 
$numFF 
;FF 
breakGG 
;GG 
}HH 
}II 
ifKK 
(KK 
	hasNumberKK 
)KK 
{LL 
endIndexMM 
=MM 
posMM 
;MM 
returnNN 
sbNN 
;NN 
}OO 
endIndexQQ 
=QQ 
-QQ 
$numQQ 
;QQ 
returnRR 
nullRR 
;RR 
}SS 	
}TT 
}UU �1
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractOperator.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractOperator8 G
(G H
thisH L
globalM S
::S U
SystemU [
.[ \
Text\ `
.` a

@thiso t
)t u
{		 	
return

 
@this

 
.

 
ExtractOperator

 (
(

( )
$num

) *
)

* +
;

+ ,
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractOperator8 G
(G H
thisH L
globalM S
::S U
SystemU [
.[ \
Text\ `
.` a

@thiso t
,t u
outv y
intz }
endIndex	~ �
)
� �
{ 	
return 
@this 
. 
ExtractOperator (
(( )
$num) *
,* +
out, /
endIndex0 8
)8 9
;9 :
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractOperator8 G
(G H
thisH L
globalM S
::S U
SystemU [
.[ \
Text\ `
.` a

@thiso t
,t u
intv y

startIndex	z �
)
� �
{ 	
return 
@this 
. 
ExtractOperator (
(( )

startIndex) 3
,3 4
out5 8
int9 <
endIndex= E
)E F
;F G
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *

ExtractOperator$$8 G
($$G H
this$$H L
global$$M S
::$$S U
System$$U [
.$$[ \
Text$$\ `
.$$` a

@this$$o t
,$$t u
int$$v y

startIndex	$$z �
,
$$� �
out
$$� �
int
$$� �
endIndex
$$� �
)
$$� �
{%% 	
global(( 
::(( 
System(( 
.(( 
Text(( 
.((  

sb((. 0
=((1 2
new((3 6
(((6 7
)((7 8
;((8 9
int** 
pos** 
=** 

startIndex**  
;**  !
while,, 
(,, 
pos,, 
<,, 
@this,, 
.,, 
Length,, %
),,% &
{-- 
char.. 
ch.. 
=.. 
@this.. 
[..  
pos..  #
]..# $
;..$ %
pos// 
++// 
;// 
switch11 
(11 
ch11 
)11 
{22 
case33 
$char33 
:33 
case44 
$char44 
:44 
case55 
$char55 
:55 
case66 
$char66 
:66 
case77 
$char77 
:77 
case88 
$char88 
:88 
case99 
$char99 
:99 
case:: 
$char:: 
::: 
case;; 
$char;; 
:;; 
case<< 
$char<< 
:<< 
case== 
$char== 
:== 
case>> 
$char>> 
:>> 
case?? 
$char?? 
:?? 
case@@ 
$char@@ 
:@@ 
caseAA 
$charAA 
:AA 
caseBB 
$charBB 
:BB 
caseCC 
$charCC 
:CC 
caseDD 
$charDD 
:DD 
caseEE 
$charEE 
:EE 
caseFF 
$charFF 
:FF 
caseGG 
$charGG 
:GG 
caseHH 
$charHH 
:HH 
caseII 
$charII 
:II 
caseJJ 
$charJJ 
:JJ 
caseKK 
$charKK 
:KK 
caseLL 
$charLL 
:LL 
caseMM 
$charMM 
:MM 
caseNN 
$charNN 
:NN 
sbOO 
.OO 
AppendOO !
(OO! "
chOO" $
)OO$ %
;OO% &
breakPP 
;PP 
defaultQQ 
:QQ 
ifRR 
(RR 
sbRR 
.RR 
LengthRR %
>RR& '
$numRR( )
)RR) *
{SS 
endIndexTT $
=TT% &
posTT' *
-TT+ ,
$numTT- .
;TT. /
returnUU "
sbUU# %
;UU% &
}VV 
endIndexXX  
=XX! "
-XX# $
$numXX$ %
;XX% &
returnYY 
nullYY #
;YY# $
}ZZ 
}[[ 
if]] 
(]] 
sb]] 
.]] 
Length]] 
>]] 
$num]] 
)]] 
{^^ 
endIndex__ 
=__ 
pos__ 
;__ 
return`` 
sb`` 
;`` 
}aa 
endIndexcc 
=cc 
-cc 
$numcc 
;cc 
returndd 
nulldd 
;dd 
}ee 	
}ff 
}gg �)
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractString.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
)r s
{		 	
return

 
@this

 
.

 


 &
(

& '
$num

' (
)

( )
;

) *
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
,r s
outt w
intx {
endIndex	| �
)
� �
{ 	
return 
@this 
. 

(& '
$num' (
,( )
out* -
endIndex. 6
)6 7
;7 8
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
,r s
intt w

startIndex	x �
)
� �
{ 	
return 
@this 
. 

(& '

startIndex' 1
,1 2
out3 6
int7 :
endIndex; C
)C D
;D E
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *


($$E F
this$$F J
global$$K Q
::$$Q S
System$$S Y
.$$Y Z
Text$$Z ^
.$$^ _

@this$$m r
,$$r s
int$$t w

startIndex	$$x �
,
$$� �
out
$$� �
int
$$� �
endIndex
$$� �
)
$$� �
{%% 	
if&& 
(&& 
@this&& 
.&& 
Length&& 
>&& 

startIndex&& )
+&&* +
$num&&, -
)&&- .
{'' 
char(( 
ch1(( 
=(( 
@this((  
[((  !

startIndex((! +
]((+ ,
;((, -
char)) 
ch2)) 
=)) 
@this))  
[))  !

startIndex))! +
+)), -
$num)). /
]))/ 0
;))0 1
if++ 
(++ 
ch1++ 
==++ 
$char++ 
&&++ !
ch2++" %
==++& (
$char++) ,
)++, -
{,, 
return// 
@this//  
.//  !*
ExtractStringArobasDoubleQuote//! ?
(//? @

startIndex//@ J
,//J K
out//L O
endIndex//P X
)//X Y
;//Y Z
}00 
if22 
(22 
ch122 
==22 
$char22 
&&22 !
ch222" %
==22& (
$char22) -
)22- .
{33 
return77 
@this77  
.77  !*
ExtractStringArobasSingleQuote77! ?
(77? @

startIndex77@ J
,77J K
out77L O
endIndex77P X
)77X Y
;77Y Z
}88 
if:: 
(:: 
ch1:: 
==:: 
$char:: 
):: 
{;; 
return>> 
@this>>  
.>>  !$
ExtractStringDoubleQuote>>! 9
(>>9 :

startIndex>>: D
,>>D E
out>>F I
endIndex>>J R
)>>R S
;>>S T
}?? 
ifAA 
(AA 
ch1AA 
==AA 
$charAA 
)AA  
{BB 
returnFF 
@thisFF  
.FF  !$
ExtractStringSingleQuoteFF! 9
(FF9 :

startIndexFF: D
,FFD E
outFFF I
endIndexFFJ R
)FFR S
;FFS T
}GG 
}HH 
endIndexJJ 
=JJ 
-JJ 
$numJJ 
;JJ 
returnKK 
nullKK 
;KK 
}LL 	
}MM 
}NN �.
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractStringArobasDoubleQuote.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
Text
.

ExtractStringArobasDoubleQuote
(
this
global
::
System
.
Text
.

@this	
)

{ 	
return 
@this 
. *
ExtractStringArobasDoubleQuote 7
(7 8
$num8 9
)9 :
;: ;
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractStringArobasDoubleQuote8 V
(V W
thisW [
global\ b
::b d
Systemd j
.j k
Textk o
.o p

@this	~ �
,
� �
out
� �
int
� �
endIndex
� �
)
� �
{ 	
return 
@this 
. *
ExtractStringArobasDoubleQuote 7
(7 8
$num8 9
,9 :
out; >
endIndex? G
)G H
;H I
} 	
public&& 
static&& 
global&& 
::&& 
System&& $
.&&$ %
Text&&% )
.&&) *

ExtractStringArobasDoubleQuote&&8 V
(&&V W
this&&W [
global&&\ b
::&&b d
System&&d j
.&&j k
Text&&k o
.&&o p

@this	&&~ �
,
&&� �
int
&&� �

startIndex
&&� �
)
&&� �
{'' 	
return(( 
@this(( 
.(( *
ExtractStringArobasDoubleQuote(( 7
(((7 8

startIndex((8 B
,((B C
out((D G
int((H K
endIndex((L T
)((T U
;((U V
})) 	
public44 
static44 
global44 
::44 
System44 $
.44$ %
Text44% )
.44) *

ExtractStringArobasDoubleQuote448 V
(44V W
this44W [
global44\ b
::44b d
System44d j
.44j k
Text44k o
.44o p

@this	44~ �
,
44� �
int
44� �

startIndex
44� �
,
44� �
out
44� �
int
44� �
endIndex
44� �
)
44� �
{55 	
global66 
::66 
System66 
.66 
Text66 
.66  

sb66. 0
=661 2
new663 6
(666 7
)667 8
;668 9
if88 
(88 
@this88 
.88 
Length88 
>88 

startIndex88 )
+88* +
$num88, -
)88- .
{99 
char:: 
ch1:: 
=:: 
@this::  
[::  !

startIndex::! +
]::+ ,
;::, -
char;; 
ch2;; 
=;; 
@this;;  
[;;  !

startIndex;;! +
+;;, -
$num;;. /
];;/ 0
;;;0 1
if== 
(== 
ch1== 
==== 
$char== 
&&== !
ch2==" %
====& (
$char==) ,
)==, -
{>> 
intAA 
posAA 
=AA 

startIndexAA (
+AA) *
$numAA+ ,
;AA, -
whileCC 
(CC 
posCC 
<CC  
@thisCC! &
.CC& '
LengthCC' -
)CC- .
{DD 
charEE 
chEE 
=EE  !
@thisEE" '
[EE' (
posEE( +
]EE+ ,
;EE, -
posFF 
++FF 
;FF 
ifHH 
(HH 
chHH 
==HH !
$charHH" %
&&HH& (
posHH) ,
<HH- .
@thisHH/ 4
.HH4 5
LengthHH5 ;
&&HH< >
@thisHH? D
[HHD E
posHHE H
]HHH I
==HHJ L
$charHHM P
)HHP Q
{II 
sbJJ 
.JJ 
AppendJJ %
(JJ% &
chJJ& (
)JJ( )
;JJ) *
posKK 
++KK !
;KK! "
}LL 
elseMM 
ifMM 
(MM  !
chMM! #
==MM$ &
$charMM' *
)MM* +
{NN 
endIndexOO $
=OO% &
posOO' *
;OO* +
returnPP "
sbPP# %
;PP% &
}QQ 
elseRR 
{SS 
sbTT 
.TT 
AppendTT %
(TT% &
chTT& (
)TT( )
;TT) *
}UU 
}VV 
throwXX 
newXX 
	ExceptionXX '
(XX' (
$strXX( P
+XXQ R

startIndexXXS ]
)XX] ^
;XX^ _
}YY 
}ZZ 
endIndex\\ 
=\\ 
-\\ 
$num\\ 
;\\ 
return]] 
null]] 
;]] 
}^^ 	
}__ 
}`` �.
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractStringArobasSingleQuote.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
Text
.

ExtractStringArobasSingleQuote
(
this
global
::
System
.
Text
.

@this	
)

{ 	
return 
@this 
. *
ExtractStringArobasSingleQuote 7
(7 8
$num8 9
)9 :
;: ;
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractStringArobasSingleQuote8 V
(V W
thisW [
global\ b
::b d
Systemd j
.j k
Textk o
.o p

@this	~ �
,
� �
out
� �
int
� �
endIndex
� �
)
� �
{ 	
return 
@this 
. *
ExtractStringArobasSingleQuote 7
(7 8
$num8 9
,9 :
out; >
endIndex? G
)G H
;H I
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *

ExtractStringArobasSingleQuote$$8 V
($$V W
this$$W [
global$$\ b
::$$b d
System$$d j
.$$j k
Text$$k o
.$$o p

@this	$$~ �
,
$$� �
int
$$� �

startIndex
$$� �
)
$$� �
{%% 	
return&& 
@this&& 
.&& *
ExtractStringArobasSingleQuote&& 7
(&&7 8

startIndex&&8 B
,&&B C
out&&D G
int&&H K
endIndex&&L T
)&&T U
;&&U V
}'' 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
Text00% )
.00) *

ExtractStringArobasSingleQuote008 V
(00V W
this00W [
global00\ b
::00b d
System00d j
.00j k
Text00k o
.00o p

@this	00~ �
,
00� �
int
00� �

startIndex
00� �
,
00� �
out
00� �
int
00� �
endIndex
00� �
)
00� �
{11 	
global22 
::22 
System22 
.22 
Text22 
.22  

sb22. 0
=221 2
new223 6
(226 7
)227 8
;228 9
if44 
(44 
@this44 
.44 
Length44 
>44 

startIndex44 )
+44* +
$num44, -
)44- .
{55 
char66 
ch166 
=66 
@this66  
[66  !

startIndex66! +
]66+ ,
;66, -
char77 
ch277 
=77 
@this77  
[77  !

startIndex77! +
+77, -
$num77. /
]77/ 0
;770 1
if99 
(99 
ch199 
==99 
$char99 
&&99 !
ch299" %
==99& (
$char99) -
)99- .
{:: 
int>> 
pos>> 
=>> 

startIndex>> (
+>>) *
$num>>+ ,
;>>, -
while@@ 
(@@ 
pos@@ 
<@@  
@this@@! &
.@@& '
Length@@' -
)@@- .
{AA 
charBB 
chBB 
=BB  !
@thisBB" '
[BB' (
posBB( +
]BB+ ,
;BB, -
posCC 
++CC 
;CC 
ifEE 
(EE 
chEE 
==EE !
$charEE" &
&&EE' )
posEE* -
<EE. /
@thisEE0 5
.EE5 6
LengthEE6 <
&&EE= ?
@thisEE@ E
[EEE F
posEEF I
]EEI J
==EEK M
$charEEN R
)EER S
{FF 
sbGG 
.GG 
AppendGG %
(GG% &
chGG& (
)GG( )
;GG) *
posHH 
++HH !
;HH! "
}II 
elseJJ 
ifJJ 
(JJ  !
chJJ! #
==JJ$ &
$charJJ' +
)JJ+ ,
{KK 
endIndexLL $
=LL% &
posLL' *
;LL* +
returnMM "
sbMM# %
;MM% &
}NN 
elseOO 
{PP 
sbQQ 
.QQ 
AppendQQ %
(QQ% &
chQQ& (
)QQ( )
;QQ) *
}RR 
}SS 
throwUU 
newUU 
	ExceptionUU '
(UU' (
$strUU( P
+UUQ R

startIndexUUS ]
)UU] ^
;UU^ _
}VV 
}WW 
endIndexYY 
=YY 
-YY 
$numYY 
;YY 
returnZZ 
nullZZ 
;ZZ 
}[[ 	
}\\ 
}]] �-
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractStringDoubleQuote.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
Text
.

ExtractStringDoubleQuote
(
this
global
::
System
.
Text
.

@this
)
{ 	
return 
@this 
. $
ExtractStringDoubleQuote 1
(1 2
$num2 3
)3 4
;4 5
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractStringDoubleQuote8 P
(P Q
thisQ U
globalV \
::\ ^
System^ d
.d e
Texte i
.i j

@thisx }
,} ~
out	 �
int
� �
endIndex
� �
)
� �
{ 	
return 
@this 
. $
ExtractStringDoubleQuote 1
(1 2
$num2 3
,3 4
out5 8
endIndex9 A
)A B
;B C
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *

ExtractStringDoubleQuote$$8 P
($$P Q
this$$Q U
global$$V \
::$$\ ^
System$$^ d
.$$d e
Text$$e i
.$$i j

@this$$x }
,$$} ~
int	$$ �

startIndex
$$� �
)
$$� �
{%% 	
return&& 
@this&& 
.&& $
ExtractStringDoubleQuote&& 1
(&&1 2

startIndex&&2 <
,&&< =
out&&> A
int&&B E
endIndex&&F N
)&&N O
;&&O P
}'' 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
Text00% )
.00) *

ExtractStringDoubleQuote008 P
(00P Q
this00Q U
global00V \
::00\ ^
System00^ d
.00d e
Text00e i
.00i j

@this00x }
,00} ~
int	00 �

startIndex
00� �
,
00� �
out
00� �
int
00� �
endIndex
00� �
)
00� �
{11 	
global22 
::22 
System22 
.22 
Text22 
.22  

sb22. 0
=221 2
new223 6
(226 7
)227 8
;228 9
if44 
(44 
@this44 
.44 
Length44 
>44 

startIndex44 )
+44* +
$num44, -
)44- .
{55 
char66 
ch166 
=66 
@this66  
[66  !

startIndex66! +
]66+ ,
;66, -
if88 
(88 
ch188 
==88 
$char88 
)88 
{99 
int<< 
pos<< 
=<< 

startIndex<< (
+<<) *
$num<<+ ,
;<<, -
while>> 
(>> 
pos>> 
<>>  
@this>>! &
.>>& '
Length>>' -
)>>- .
{?? 
char@@ 
ch@@ 
=@@  !
@this@@" '
[@@' (
pos@@( +
]@@+ ,
;@@, -
posAA 
++AA 
;AA 
charCC 
nextCharCC %
;CC% &
ifDD 
(DD 
chDD 
==DD !
$charDD" &
&&DD' )
posDD* -
<DD. /
@thisDD0 5
.DD5 6
LengthDD6 <
&&DD= ?
(DD@ A
(DDA B
nextCharDDB J
=DDK L
@thisDDM R
[DDR S
posDDS V
]DDV W
)DDW X
==DDY [
$charDD\ `
||DDa c
nextCharDDd l
==DDm o
$charDDp s
)DDs t
)DDt u
{EE 
sbFF 
.FF 
AppendFF %
(FF% &
nextCharFF& .
)FF. /
;FF/ 0
posGG 
++GG !
;GG! "
}HH 
elseII 
ifII 
(II  !
chII! #
==II$ &
$charII' *
)II* +
{JJ 
endIndexKK $
=KK% &
posKK' *
;KK* +
returnLL "
sbLL# %
;LL% &
}MM 
elseNN 
{OO 
sbPP 
.PP 
AppendPP %
(PP% &
chPP& (
)PP( )
;PP) *
}QQ 
}RR 
throwTT 
newTT 
	ExceptionTT '
(TT' (
$strTT( P
+TTQ R

startIndexTTS ]
)TT] ^
;TT^ _
}UU 
}VV 
endIndexXX 
=XX 
-XX 
$numXX 
;XX 
returnYY 
nullYY 
;YY 
}ZZ 	
}[[ 
}\\ �-
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractStringSingleQuote.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
Text
.

ExtractStringSingleQuote
(
this
global
::
System
.
Text
.

@this
)
{ 	
return 
@this 
. $
ExtractStringSingleQuote 1
(1 2
$num2 3
)3 4
;4 5
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractStringSingleQuote8 P
(P Q
thisQ U
globalV \
::\ ^
System^ d
.d e
Texte i
.i j

@thisx }
,} ~
out	 �
int
� �
endIndex
� �
)
� �
{ 	
return 
@this 
. $
ExtractStringSingleQuote 1
(1 2
$num2 3
,3 4
out5 8
endIndex9 A
)A B
;B C
} 	
public$$ 
static$$ 
global$$ 
::$$ 
System$$ $
.$$$ %
Text$$% )
.$$) *

ExtractStringSingleQuote$$8 P
($$P Q
this$$Q U
global$$V \
::$$\ ^
System$$^ d
.$$d e
Text$$e i
.$$i j

@this$$x }
,$$} ~
int	$$ �

startIndex
$$� �
)
$$� �
{%% 	
return&& 
@this&& 
.&& $
ExtractStringSingleQuote&& 1
(&&1 2

startIndex&&2 <
,&&< =
out&&> A
int&&B E
endIndex&&F N
)&&N O
;&&O P
}'' 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
Text00% )
.00) *

ExtractStringSingleQuote008 P
(00P Q
this00Q U
global00V \
::00\ ^
System00^ d
.00d e
Text00e i
.00i j

@this00x }
,00} ~
int	00 �

startIndex
00� �
,
00� �
out
00� �
int
00� �
endIndex
00� �
)
00� �
{11 	
global22 
::22 
System22 
.22 
Text22 
.22  

sb22. 0
=221 2
new223 6
(226 7
)227 8
;228 9
if44 
(44 
@this44 
.44 
Length44 
>44 

startIndex44 )
+44* +
$num44, -
)44- .
{55 
char66 
ch166 
=66 
@this66  
[66  !

startIndex66! +
]66+ ,
;66, -
if88 
(88 
ch188 
==88 
$char88 
)88  
{99 
int== 
pos== 
=== 

startIndex== (
+==) *
$num==+ ,
;==, -
while?? 
(?? 
pos?? 
<??  
@this??! &
.??& '
Length??' -
)??- .
{@@ 
charAA 
chAA 
=AA  !
@thisAA" '
[AA' (
posAA( +
]AA+ ,
;AA, -
posBB 
++BB 
;BB 
charDD 
nextCharDD %
;DD% &
ifEE 
(EE 
chEE 
==EE !
$charEE" &
&&EE' )
posEE* -
<EE. /
@thisEE0 5
.EE5 6
LengthEE6 <
&&EE= ?
(EE@ A
(EEA B
nextCharEEB J
=EEK L
@thisEEM R
[EER S
posEES V
]EEV W
)EEW X
==EEY [
$charEE\ `
||EEa c
nextCharEEd l
==EEm o
$charEEp t
)EEt u
)EEu v
{FF 
sbGG 
.GG 
AppendGG %
(GG% &
nextCharGG& .
)GG. /
;GG/ 0
posHH 
++HH !
;HH! "
}II 
elseJJ 
ifJJ 
(JJ  !
chJJ! #
==JJ$ &
$charJJ' +
)JJ+ ,
{KK 
endIndexLL $
=LL% &
posLL' *
;LL* +
returnMM "
sbMM# %
;MM% &
}NN 
elseOO 
{PP 
sbQQ 
.QQ 
AppendQQ %
(QQ% &
chQQ& (
)QQ( )
;QQ) *
}RR 
}SS 
throwUU 
newUU 
	ExceptionUU '
(UU' (
$strUU( P
+UUQ R

startIndexUUS ]
)UU] ^
;UU^ _
}VV 
}WW 
endIndexYY 
=YY 
-YY 
$numYY 
;YY 
returnZZ 
nullZZ 
;ZZ 
}[[ 	
}\\ 
}]] �H
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractToken.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
Text

% )
.

) *


* 7
ExtractToken

8 D
(

D E
this

E I
global

J P
::

P R
System

R X
.

X Y
Text

Y ]
.

] ^


^ k
@this

l q
)

q r
{ 	
return 
@this 
. 
ExtractToken %
(% &
$num& '
)' (
;( )
}
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractToken8 D
(D E
thisE I
globalJ P
::P R
SystemR X
.X Y
TextY ]
.] ^

@thisl q
,q r
outs v
intw z
endIndex	{ �
)
� �
{ 	
return 
@this 
. 
ExtractToken %
(% &
$num& '
,' (
out) ,
endIndex- 5
)5 6
;6 7
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractToken8 D
(D E
thisE I
globalJ P
::P R
SystemR X
.X Y
TextY ]
.] ^

@thisl q
,q r
ints v

startIndex	w �
)
� �
{ 	
return 
@this 
. 
ExtractToken %
(% &

startIndex& 0
,0 1
out2 5
int6 9
endIndex: B
)B C
;C D
}   	
public(( 
static(( 
global(( 
::(( 
System(( $
.(($ %
Text((% )
.(() *

ExtractToken((8 D
(((D E
this((E I
global((J P
::((P R
System((R X
.((X Y
Text((Y ]
.((] ^

@this((l q
,((q r
int((s v

startIndex	((w �
,
((� �
out
((� �
int
((� �
endIndex
((� �
)
((� �
{)) 	
char33 
ch133 
=33 
@this33 
[33 

startIndex33 '
]33' (
;33( )
int44 
pos44 
=44 

startIndex44  
+44! "
$num44# $
;44$ %
switch66 
(66 
ch166 
)66 
{77 
case88 
$char88 
:88 
if99 
(99 
pos99 
<99 
@this99 #
.99# $
Length99$ *
&&99+ -
@this99. 3
[993 4
pos994 7
]997 8
==999 ;
$char99< ?
)99? @
{:: 
return;; 
@this;; $
.;;$ %*
ExtractStringArobasDoubleQuote;;% C
(;;C D

startIndex;;D N
,;;N O
out;;P S
endIndex;;T \
);;\ ]
;;;] ^
}<< 
if>> 
(>> 
pos>> 
<>> 
@this>> #
.>># $
Length>>$ *
&&>>+ -
@this>>. 3
[>>3 4
pos>>4 7
]>>7 8
==>>9 ;
$char>>< @
)>>@ A
{?? 
return@@ 
@this@@ $
.@@$ %*
ExtractStringArobasSingleQuote@@% C
(@@C D

startIndex@@D N
,@@N O
out@@P S
endIndex@@T \
)@@\ ]
;@@] ^
}AA 
breakCC 
;CC 
caseDD 
$charDD 
:DD 
returnEE 
@thisEE  
.EE  !$
ExtractStringDoubleQuoteEE! 9
(EE9 :

startIndexEE: D
,EED E
outEEF I
endIndexEEJ R
)EER S
;EES T
caseFF 
$charFF 
:FF 
returnGG 
@thisGG  
.GG  !$
ExtractStringSingleQuoteGG! 9
(GG9 :

startIndexGG: D
,GGD E
outGGF I
endIndexGGJ R
)GGR S
;GGS T
caseHH 
$charHH 
:HH 
caseII 
$charII 
:II 
caseJJ 
$charJJ 
:JJ 
caseKK 
$charKK 
:KK 
caseLL 
$charLL 
:LL 
caseMM 
$charMM 
:MM 
caseNN 
$charNN 
:NN 
caseOO 
$charOO 
:OO 
casePP 
$charPP 
:PP 
caseQQ 
$charQQ 
:QQ 
caseRR 
$charRR 
:RR 
caseSS 
$charSS 
:SS 
caseTT 
$charTT 
:TT 
caseUU 
$charUU 
:UU 
caseVV 
$charVV 
:VV 
caseWW 
$charWW 
:WW 
caseXX 
$charXX 
:XX 
caseYY 
$charYY 
:YY 
caseZZ 
$charZZ 
:ZZ 
case[[ 
$char[[ 
:[[ 
case\\ 
$char\\ 
:\\ 
case]] 
$char]] 
:]] 
case^^ 
$char^^ 
:^^ 
case__ 
$char__ 
:__ 
case`` 
$char`` 
:`` 
caseaa 
$charaa 
:aa 
casebb 
$charbb 
:bb 
casecc 
$charcc 
:cc 
returndd 
@thisdd  
.dd  !
ExtractOperatordd! 0
(dd0 1

startIndexdd1 ;
,dd; <
outdd= @
endIndexddA I
)ddI J
;ddJ K
caseee 
$charee 
:ee 
ifff 
(ff 
posff 
<ff 
@thisff #
.ff# $
Lengthff$ *
&&ff+ -
(ff. /
@thisff/ 4
[ff4 5
posff5 8
]ff8 9
==ff: <
$charff= @
||ffA C
@thisffD I
[ffI J
posffJ M
]ffM N
==ffO Q
$charffR U
)ffU V
)ffV W
{gg 
returnhh 
@thishh $
.hh$ %
ExtractHexadecimalhh% 7
(hh7 8

startIndexhh8 B
,hhB C
outhhD G
endIndexhhH P
)hhP Q
;hhQ R
}ii 
returnkk 
@thiskk  
.kk  !

(kk. /

startIndexkk/ 9
,kk9 :
outkk; >
endIndexkk? G
)kkG H
;kkH I
casell 
$charll 
:ll 
casemm 
$charmm 
:mm 
casenn 
$charnn 
:nn 
caseoo 
$charoo 
:oo 
casepp 
$charpp 
:pp 
caseqq 
$charqq 
:qq 
caserr 
$charrr 
:rr 
casess 
$charss 
:ss 
casett 
$chartt 
:tt 
returnuu 
@thisuu  
.uu  !

(uu. /

startIndexuu/ 9
,uu9 :
outuu; >
endIndexuu? G
)uuG H
;uuH I
defaultvv 
:vv 
ifww 
(ww 
(ww 
ch1ww 
>=ww 
$charww  #
&&ww$ &
ch1ww' *
<=ww+ -
$charww. 1
)ww1 2
||ww3 5
(ww6 7
ch1ww7 :
>=ww; =
$charww> A
&&wwB D
ch1wwE H
<=wwI K
$charwwL O
)wwO P
)wwP Q
{xx 
returnyy 
@thisyy $
.yy$ %
ExtractKeywordyy% 3
(yy3 4

startIndexyy4 >
,yy> ?
outyy@ C
endIndexyyD L
)yyL M
;yyM N
}zz 
endIndex|| 
=|| 
-||  
$num||  !
;||! "
return}} 
null}} 
;}}  
}~~ 
throw
�� 
new
�� 
	Exception
�� 
(
��  
$str
��  /
)
��/ 0
;
��0 1
}
�� 	
}
�� 
}�� �/
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\Extract\ExtractTriviaToken.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

.A B
ExtractB I
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractTriviaToken8 J
(J K
thisK O
globalP V
::V X
SystemX ^
.^ _
Text_ c
.c d

@thisr w
)w x
{ 	
return
@this
.
ExtractTriviaToken
(
$num
)
;
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

ExtractTriviaToken8 J
(J K
thisK O
globalP V
::V X
SystemX ^
.^ _
Text_ c
.c d

@thisr w
,w x
outy |
int	} �
endIndex
� �
)
� �
{ 	
return 
@this 
. 
ExtractTriviaToken +
(+ ,
$num, -
,- .
out/ 2
endIndex3 ;
); <
;< =
} 	
public## 
static## 
global## 
::## 
System## $
.##$ %
Text##% )
.##) *

ExtractTriviaToken##8 J
(##J K
this##K O
global##P V
::##V X
System##X ^
.##^ _
Text##_ c
.##c d

@this##r w
,##w x
int##y |

startIndex	##} �
)
##� �
{$$ 	
return%% 
@this%% 
.%% 
ExtractTriviaToken%% +
(%%+ ,

startIndex%%, 6
,%%6 7
out%%8 ;
int%%< ?
endIndex%%@ H
)%%H I
;%%I J
}&& 	
public00 
static00 
global00 
::00 
System00 $
.00$ %
Text00% )
.00) *

ExtractTriviaToken008 J
(00J K
this00K O
global00P V
::00V X
System00X ^
.00^ _
Text00_ c
.00c d

@this00r w
,00w x
int00y |

startIndex	00} �
,
00� �
out
00� �
int
00� �
endIndex
00� �
)
00� �
{11 	
global22 
::22 
System22 
.22 
Text22 
.22  

sb22. 0
=221 2
new223 6
(226 7
)227 8
;228 9
int33 
pos33 
=33 

startIndex33  
;33  !
bool55 
isSpace55 
=55 
false55  
;55  !
while77 
(77 
pos77 
<77 
@this77 
.77 
Length77 %
)77% &
{88 
char99 
ch99 
=99 
@this99 
[99  
pos99  #
]99# $
;99$ %
pos:: 
++:: 
;:: 
if<< 
(<< 
ch<< 
==<< 
$char<< 
||<<  
ch<<! #
==<<$ &
$char<<' +
||<<, .
ch<</ 1
==<<2 4
$char<<5 9
||<<: <
ch<<= ?
==<<@ B
$char<<C G
)<<G H
{== 
isSpace>> 
=>> 
true>> "
;>>" #
sb?? 
.?? 
Append?? 
(?? 
ch??  
)??  !
;??! "
}@@ 
elseAA 
ifAA 
(AA 
chAA 
==AA 
$charAA "
&&AA# %
!AA& '
isSpaceAA' .
)AA. /
{BB 
ifCC 
(CC 
posCC 
<CC 
@thisCC #
.CC# $
LengthCC$ *
)CC* +
{DD 
chEE 
=EE 
@thisEE "
[EE" #
posEE# &
]EE& '
;EE' (
ifFF 
(FF 
chFF 
==FF !
$charFF" %
)FF% &
{GG 
returnHH "
@thisHH# (
.HH( )$
ExtractCommentSingleLineHH) A
(HHA B

startIndexHHB L
,HHL M
outHHN Q
endIndexHHR Z
)HHZ [
;HH[ \
}II 
ifKK 
(KK 
chKK 
==KK !
$charKK" %
)KK% &
{LL 
returnMM "
@thisMM# (
.MM( )#
ExtractCommentMultiLineMM) @
(MM@ A

startIndexMMA K
,MMK L
outMMM P
endIndexMMQ Y
)MMY Z
;MMZ [
}NN 
posQQ 
--QQ 
;QQ 
breakRR 
;RR 
}SS 
}TT 
elseUU 
{VV 
posWW 
-=WW 
$numWW 
;WW 
breakXX 
;XX 
}YY 
}ZZ 
if\\ 
(\\ 
isSpace\\ 
)\\ 
{]] 
endIndex^^ 
=^^ 
pos^^ 
;^^ 
return__ 
sb__ 
;__ 
}`` 
endIndexbb 
=bb 
-bb 
$numbb 
;bb 
returncc 
nullcc 
;cc 
}dd 	
}ee 
}ff �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.AppendIf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
Text
.

AppendIf
<
T
>
(
this
global
::
System
.
Text
.

@this
,
Func
<
T
,
bool
>
	predicate

,

params

T

[

]

values

)

{ 	
foreach 
( 
T 
value 
in 
values  &
)& '
{ 
if 
( 
	predicate 
( 
value #
)# $
)$ %
{ 
@this 
. 
Append  
(  !
value! &
)& '
;' (
} 
} 
return 
@this 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.AppendJoin.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


AppendJoin8 B
<B C
TC D
>D E
(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
,r s
stringt z
	separator	{ �
,
� �
IEnumerable
� �
<
� �
T
� �
>
� �
values
� �
)
� �
{
@this 
. 
Append 
( 
string 
.  
Join  $
($ %
	separator% .
,. /
values0 6
)6 7
)7 8
;8 9
return 
@this 
; 
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *


AppendJoin8 B
<B C
TC D
>D E
(E F
thisF J
globalK Q
::Q S
SystemS Y
.Y Z
TextZ ^
.^ _

@thism r
,r s
stringt z
	separator	{ �
,
� �
params
� �
T
� �
[
� �
]
� �
values
� �
)
� �
{ 	
@this 
. 
Append 
( 
string 
.  
Join  $
($ %
	separator% .
,. /
values0 6
)6 7
)7 8
;8 9
return 
@this 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.AppendLineFormat.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
Text
.

AppendLineFormat
(
this
global
::
System
.
Text
.

@this
,
string
format	
,

params

object

[

]

args

)

{ 	
@this 
. 

AppendLine 
( 
string #
.# $
Format$ *
(* +
format+ 1
,1 2
args3 7
)7 8
)8 9
;9 :
return 
@this 
; 
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

AppendLineFormat8 H
(H I
thisI M
globalN T
::T V
SystemV \
.\ ]
Text] a
.a b

@thisp u
,u v
stringw }
format	~ �
,
� �
List
� �
<
� �
IEnumerable
� �
<
� �
object
� �
>
� �
>
� �
args
� �
)
� �
{ 	
@this 
. 

AppendLine 
( 
string #
.# $
Format$ *
(* +
format+ 1
,1 2
args3 7
)7 8
)8 9
;9 :
return 
@this 
; 
} 	
}   
}!! �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.AppendLineIf.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
global
::
System
.
Text
.

AppendLineIf
<
T
>
(
this
global
::
System
.
Text
.

@this
,
Func
<
T
,
bool	
>

	predicate

,

params

T

[

]

values

)

{ 	
foreach 
( 
T 
value 
in 
values  &
)& '
{ 
if 
( 
	predicate 
( 
value #
)# $
)$ %
{ 
@this 
. 

AppendLine $
($ %
value% *
.* +
ToString+ 3
(3 4
)4 5
)5 6
;6 7
} 
} 
return 
@this 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.AppendLineJoin.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

AppendLineJoin8 F
<F G
TG H
>H I
(I J
thisJ N
globalO U
::U W
SystemW ]
.] ^
Text^ b
.b c

@thisq v
,v w
stringx ~
	separator	 �
,
� �
IEnumerable
� �
<
� �
T
� �
>
� �
values
� �
)
� �
{
@this 
. 

AppendLine 
( 
string #
.# $
Join$ (
(( )
	separator) 2
,2 3
values4 :
): ;
); <
;< =
return 
@this 
; 
} 	
public 
static 
global 
:: 
System $
.$ %
Text% )
.) *

AppendLineJoin8 F
(F G
thisG K
globalL R
::R T
SystemT Z
.Z [
Text[ _
._ `

@thisn s
,s t
stringu {
	separator	| �
,
� �
params
� �
object
� �
[
� �
]
� �
values
� �
)
� �
{ 	
@this 
. 

AppendLine 
( 
string #
.# $
Join$ (
(( )
	separator) 2
,2 3
values4 :
): ;
); <
;< =
return 
@this 
; 
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.GetIndexAfterNextDoubleQuote.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int (
GetIndexAfterNextDoubleQuote 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
TextK O
.O P

@this^ c
)c d
{		 	
return

 
@this

 
.

 (
GetIndexAfterNextDoubleQuote

 5
(

5 6
$num

6 7
,

7 8
false

9 >
)

> ?
;

? @
} 	
public 
static 
int (
GetIndexAfterNextDoubleQuote 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
TextK O
.O P

@this^ c
,c d
boole i
allowEscapej u
)u v
{ 	
return 
@this 
. (
GetIndexAfterNextDoubleQuote 5
(5 6
$num6 7
,7 8
allowEscape9 D
)D E
;E F
} 	
public 
static 
int (
GetIndexAfterNextDoubleQuote 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
TextK O
.O P

@this^ c
,c d
inte h

startIndexi s
)s t
{ 	
return 
@this 
. (
GetIndexAfterNextDoubleQuote 5
(5 6

startIndex6 @
,@ A
falseB G
)G H
;H I
} 	
public$$ 
static$$ 
int$$ (
GetIndexAfterNextDoubleQuote$$ 6
($$6 7
this$$7 ;
global$$< B
::$$B D
System$$D J
.$$J K
Text$$K O
.$$O P

@this$$^ c
,$$c d
int$$e h

startIndex$$i s
,$$s t
bool$$u y
allowEscape	$$z �
)
$$� �
{%% 	
while&& 
(&& 

startIndex&& 
<&& 
@this&&  %
.&&% &
Length&&& ,
)&&, -
{'' 
char(( 
ch(( 
=(( 
@this(( 
[((  

startIndex((  *
]((* +
;((+ ,

startIndex)) 
++)) 
;)) 
char++ 
nextChar++ 
;++ 
if,, 
(,, 
allowEscape,, 
&&,,  "
ch,,# %
==,,& (
$char,,) -
&&,,. 0

startIndex,,1 ;
<,,< =
@this,,> C
.,,C D
Length,,D J
&&,,K M
(,,N O
(,,O P
nextChar,,P X
=,,Y Z
@this,,[ `
[,,` a

startIndex,,a k
],,k l
),,l m
==,,n p
$char,,q u
||,,v x
nextChar	,,y �
==
,,� �
$char
,,� �
)
,,� �
)
,,� �
{-- 

startIndex.. 
++..  
;..  !
}// 
else00 
if00 
(00 
ch00 
==00 
$char00 "
)00" #
{11 
return22 

startIndex22 %
;22% &
}33 
}44 
return66 

startIndex66 
;66 
}77 	
}88 
}99 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.GetIndexAfterNextSingleQuote.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
int (
GetIndexAfterNextSingleQuote 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
TextK O
.O P

@this^ c
)c d
{		 	
return

 
@this

 
.

 (
GetIndexAfterNextSingleQuote

 5
(

5 6
$num

6 7
,

7 8
false

9 >
)

> ?
;

? @
} 	
public 
static 
int (
GetIndexAfterNextSingleQuote 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
TextK O
.O P

@this^ c
,c d
boole i
allowEscapej u
)u v
{ 	
return 
@this 
. (
GetIndexAfterNextSingleQuote 5
(5 6
$num6 7
,7 8
allowEscape9 D
)D E
;E F
} 	
public 
static 
int (
GetIndexAfterNextSingleQuote 6
(6 7
this7 ;
global< B
::B D
SystemD J
.J K
TextK O
.O P

@this^ c
,c d
inte h

startIndexi s
)s t
{ 	
return 
@this 
. (
GetIndexAfterNextSingleQuote 5
(5 6

startIndex6 @
,@ A
falseB G
)G H
;H I
} 	
public$$ 
static$$ 
int$$ (
GetIndexAfterNextSingleQuote$$ 6
($$6 7
this$$7 ;
global$$< B
::$$B D
System$$D J
.$$J K
Text$$K O
.$$O P

@this$$^ c
,$$c d
int$$e h

startIndex$$i s
,$$s t
bool$$u y
allowEscape	$$z �
)
$$� �
{%% 	
while&& 
(&& 

startIndex&& 
<&& 
@this&&  %
.&&% &
Length&&& ,
)&&, -
{'' 
char(( 
ch(( 
=(( 
@this(( 
[((  

startIndex((  *
]((* +
;((+ ,

startIndex)) 
++)) 
;)) 
char++ 
nextChar++ 
;++ 
if,, 
(,, 
allowEscape,, 
&&,,  "
ch,,# %
==,,& (
$char,,) -
&&,,. 0

startIndex,,1 ;
<,,< =
@this,,> C
.,,C D
Length,,D J
&&,,K M
(,,N O
(,,O P
nextChar,,P X
=,,Y Z
@this,,[ `
[,,` a

startIndex,,a k
],,k l
),,l m
==,,n p
$char,,q u
||,,v x
nextChar	,,y �
==
,,� �
$char
,,� �
)
,,� �
)
,,� �
{-- 

startIndex.. 
++..  
;..  !
}// 
else00 
if00 
(00 
ch00 
==00 
$char00 #
)00# $
{11 
return22 

startIndex22 %
;22% &
}33 
}44 
return66 

startIndex66 
;66 
}77 	
}88 
}99 �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.Text.StringBuilder\StringBuilder.Substring.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
Text/ 3
.3 4

{ 
public 

static 
partial 
class 

Extensions  *
{ 
public		 
static		 
string		 
	Substring		 &
(		& '
this		' +
global		, 2
::		2 4
System		4 :
.		: ;
Text		; ?
.		? @

@this		N S
,		S T
int		U X

startIndex		Y c
)		c d
{

 	
return 
@this 
. 
ToString !
(! "

startIndex" ,
,, -
@this. 3
.3 4
Length4 :
-; <

startIndex= G
)G H
;H I
} 	
public 
static 
string 
	Substring &
(& '
this' +
global, 2
::2 4
System4 :
.: ;
Text; ?
.? @

@thisN S
,S T
intU X

startIndexY c
,c d
inte h
lengthi o
)o p
{ 	
return 
@this 
. 
ToString !
(! "

startIndex" ,
,, -
length. 4
)4 5
;5 6
} 	
} 
} �
|F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.TimeSpan\TimeSpan.Ago.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
TimeSpan/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -
Ago

. 1
(

1 2
this

2 6
global

7 =
::

= ?
System

? E
.

E F
TimeSpan

F N
@this

O T
)

T U
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +
Now+ .
.. /
Subtract/ 7
(7 8
@this8 =
)= >
;> ?
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.TimeSpan\TimeSpan.FromNow.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
TimeSpan/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -
FromNow

. 5
(

5 6
this

6 :
global

; A
::

A C
System

C I
.

I J
TimeSpan

J R
@this

S X
)

X Y
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +
Now+ .
.. /
Add/ 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.TimeSpan\TimeSpan.UtcAgo.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
TimeSpan/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
DateTime% -
UtcAgo. 4
(4 5
this5 9
global: @
::@ B
SystemB H
.H I
TimeSpanI Q
@thisR W
)W X
{ 	
return
global
::
System
.
DateTime
.
Now
.
Subtract
(
@this
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.TimeSpan\TimeSpan.UtcFromNow.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
TimeSpan/ 7
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public

 
static

 
global

 
::

 
System

 $
.

$ %
DateTime

% -

UtcFromNow

. 8
(

8 9
this

9 =
global

> D
::

D F
System

F L
.

L M
TimeSpan

M U
@this

V [
)

[ \
{ 	
return 
global 
:: 
System !
.! "
DateTime" *
.* +
Now+ .
.. /
Add/ 2
(2 3
@this3 8
)8 9
;9 :
}
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt16\System.Math\UInt16.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt16/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
Max  
(  !
this! %
ushort& ,
val1- 1
,1 2
ushort3 9
val2: >
)> ?
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt16\System.Math\UInt16.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt16/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ushort 
Min  
(  !
this! %
ushort& ,
val1- 1
,1 2
ushort3 9
val2: >
)> ?
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt16\_CoreObject\UInt16.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt16/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
ushort( .
@this/ 4
,4 5
ushort6 <
minValue= E
,E F
ushortG M
maxValueN V
)V W
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt16\_CoreObject\UInt16.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt16/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
ushort
@this
,
params
ushort
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt16\_CoreObject\UInt16.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt16/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
ushort( .
@this/ 4
,4 5
ushort6 <
minValue= E
,E F
ushortG M
maxValueN V
)V W
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt16\_CoreObject\UInt16.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt16/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
ushort
@this
,
params
ushort
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt32\System.Math\UInt32.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt32/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
uint 
Max 
( 
this #
uint$ (
val1) -
,- .
uint/ 3
val24 8
)8 9
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt32\System.Math\UInt32.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt32/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
uint 
Min 
( 
this #
uint$ (
val1) -
,- .
uint/ 3
val24 8
)8 9
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt32\_CoreObject\UInt32.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt32/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
uint( ,
@this- 2
,2 3
uint4 8
minValue9 A
,A B
uintC G
maxValueH P
)P Q
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt32\_CoreObject\UInt32.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt32/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
uint
@this
,
params
uint
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt32\_CoreObject\UInt32.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt32/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
uint( ,
@this- 2
,2 3
uint4 8
minValue9 A
,A B
uintC G
maxValueH P
)P Q
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt32\_CoreObject\UInt32.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt32/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
uint
@this
,
params
uint
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt64\System.Math\UInt64.Max.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt64/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
Max 
(  
this  $
ulong% *
val1+ /
,/ 0
ulong1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Max
(
val1
,
val2
)
;
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt64\System.Math\UInt64.Min.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt64/ 5
.5 6
System6 <
.< =
Math= A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
ulong 
Min 
(  
this  $
ulong% *
val1+ /
,/ 0
ulong1 6
val27 ;
); <
{ 	
return
global
::
System
.
Math
.
Min
(
val1
,
val2
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt64\_CoreObject\UInt64.Between.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt64/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
Between "
(" #
this# '
ulong( -
@this. 3
,3 4
ulong5 :
minValue; C
,C D
ulongE J
maxValueK S
)S T
{ 	
return 
minValue 
. 
	CompareTo %
(% &
@this& +
)+ ,
==- /
-0 1
$num1 2
&&3 5
@this6 ;
.; <
	CompareTo< E
(E F
maxValueF N
)N O
==P R
-S T
$numT U
;U V
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt64\_CoreObject\UInt64.In.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt64/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
In
(
this
ulong
@this
,
params
ulong
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
!=? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt64\_CoreObject\UInt64.InRange.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt64/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
bool 
InRange "
(" #
this# '
ulong( -
@this. 3
,3 4
ulong5 :
minValue; C
,C D
ulongE J
maxValueK S
)S T
{ 	
return 
@this 
. 
	CompareTo "
(" #
minValue# +
)+ ,
>=- /
$num0 1
&&2 4
@this5 :
.: ;
	CompareTo; D
(D E
maxValueE M
)M N
<=O Q
$numR S
;S T
} 	
} 
} �
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UInt64\_CoreObject\UInt64.NotIn.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UInt64/ 5
.5 6
_CoreObject6 A
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public
static
bool
NotIn
(
this
ulong
@this
,
params
ulong
[
]
values
)
{ 	
return 
global 
:: 
System !
.! "
Array" '
.' (
IndexOf( /
(/ 0
values0 6
,6 7
@this8 =
)= >
==? A
-B C
$numC D
;D E
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UIntPtr\System.UIntPtr\UIntPtr.Add.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UIntPtr/ 6
.6 7
System7 =
.= >
UIntPtr> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
UIntPtr% ,
Add- 0
(0 1
this1 5
global6 <
::< >
System> D
.D E
UIntPtrE L
pointerM T
,T U
intV Y
offsetZ `
)` a
{ 	
return
global
::
System
.
UIntPtr
.
Add
(
pointer
,
offset
)
;
} 	
} 
} �	
�F:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\System.UIntPtr\System.UIntPtr\UIntPtr.Subtract.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
System( .
.. /
UIntPtr/ 6
.6 7
System7 =
.= >
UIntPtr> E
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
global 
:: 
System $
.$ %
UIntPtr% ,
Subtract- 5
(5 6
this6 :
global; A
::A C
SystemC I
.I J
UIntPtrJ Q
pointerR Y
,Y Z
int[ ^
offset_ e
)e f
{ 	
return
global
::
System
.
UIntPtr
.
Subtract
(
pointer
,
offset
)
;
} 	
} 
} �
uF:\Work\Office\Projects\Nspira\Portal\HRMS_API\5-CrossCutting\Phoenix.CrossCutting.Extension\TArray\Array.ClearAll.cs
	namespace 	
Phonix
 
. 
CrossCutting 
. 
	Extension '
.' (
TArray( .
{ 
public 

static 
partial 
class 

Extensions  *
{ 
public 
static 
void 
ClearAll #
<# $
T$ %
>% &
(& '
this' +
T, -
[- .
]. /
@this0 5
)5 6
{ 	
Array 
. 
Clear 