ü	
_F:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.FileProviders\AwsFileProvider.cs
	namespace 	
Test
 
. 
Controllers 
{ 
public 

class 
AwsFileProvider  
:! "
IAwsFileProvider# 3
{ 
private 
readonly 
string 
_tempdirpath  ,
;, -
private 
const 
string 
TempFilePrefix +
=, -
$str. <
;< =
private 
static 
	IAmazonS3  
	_s3Client! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
private 
const 
string 
existingBucketName /
=0 1
$str2 ?
;? @
public 
AwsFileProvider 
( 
string %
tempdirpath& 1
,1 2
	IAmazonS33 <
s3Client= E
)E F
{ 	
	_s3Client 
= 
s3Client  
;  !
_tempdirpath 
= 
tempdirpath &
;& '
} 	
} 
} ·
`F:\Work\Office\Projects\Nspira\Portal\HRMS_API\6-Model\Phoenix.FileProviders\IAwsFileProvider.cs
	namespace 	
Phoenix
 
. 
FileProviders 
{ 
public		 

	interface		 
IAwsFileProvider		 %
{

 
} 
} 