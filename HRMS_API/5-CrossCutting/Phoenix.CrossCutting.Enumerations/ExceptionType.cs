using System.ComponentModel;

namespace Phoenix.CrossCutting.Enumerations
{
    public enum ExceptionType
    {
        [Description("ERR - NG - 00001 : It is thrown when try to read or write protected memory.")]
        AccessViolationException,
        [Description("ERR-NG-00002 : Represents one or more errors that occur during application execution.")]
        AggregateException,
        [Description("ERR-NG-00003 : It is thrown when try to access an unloaded application domain.")]
        AppDomainUnloadedException,
        [Description("ERR-NG-00004 : It is base class for application-defined exceptions.")]
        ApplicationException,
        [Description("ERR-NG-00005 : It is thrown when invalid argument provided to a method.")]
        ArgumentException,
        [Description("ERR-NG-00006 : It is thrown when a method requires argument but no argument is provided.")]
        ArgumentNullException,
        [Description("ERR-NG-00007 : It is thrown when value of an argument is outside the allowable range.")]
        ArgumentOutOfRangeException,
        [Description("ERR-NG-00008 : It is thrown when doing arithmetic, casting, or conversion operation.")]
        ArithmeticException,
        [Description("ERR-NG-00009 : It is thrown when try to store an element of the wrong type within an array.")]
        ArrayTypeMismatchException,
        [Description("ERR-NG-00010 : It is thrown when file image, dll or exe program is invalid.")]
        BadImageFormatException,
        [Description("ERR-NG-00011 : It is thrown when try to unload an application domain fails.")]
        CannotUnloadAppDomainException,
        [Description("ERR-NG-00012 : The exception that is thrown when an attempt to marshal an object across a context boundary fails.")]
        ContextMarshalException,
        [Description("ERR-NG-00013 : It is thrown thrown when a unit of data is read from or written to an address that is not a multiple of the data size.")]
        DataMisalignedException,
        [Description("ERR-NG-00014 : It is thrown when there is an attempt to divide an integral or decimal value by zero.")]
        DivideByZeroException,
        [Description("ERR-NG-00015 : It is thrown when a DLL specified in a DLL import cannot be found.")]
        DllNotFoundException,
        [Description("ERR-NG-00016 : The exception that is thrown when an object appears more than once in an array of synchronization objects.")]
        DuplicateWaitObjectException,
        [Description("ERR-NG-00017 : The exception that is thrown when an attempt to load a class fails due to the absence of an entry method.")]
        EntryPointNotFoundException,
        [Description("ERR-NG-00018 : The exception that is thrown when there is an internal error in the execution engine of the common language runtime.")]
        ExecutionEngineException,
        [Description("ERR-NG-00019 : It is thrown when there is an invalid attempt to access a private or protected field inside a class.")]
        FieldAccessException,
        [Description("ERR-NG-00020 : The exception that is thrown when the format of an argument is invalid, or when a composite format string is not well formed.")]
        FormatException,
        [Description("ERR-NG-00021 : The exception that is thrown when an attempt is made to access an element of an array or collection with an index that is outside its bounds.")]
        IndexOutOfRangeException,
        [Description("ERR-NG-00022 : The exception that is thrown when a check for sufficient available memory fails. This class cannot be inherited.")]
        InsufficientMemoryException,
        [Description("ERR-NG-00023 : The exception that is thrown for invalid casting or explicit conversion.")]
        InvalidCastException,
        [Description("ERR-NG-00024 : The exception that is thrown when a method call is invalid for the object’s current state.")]
        InvalidOperationException,
        [Description("ERR-NG-00025 : The exception that is thrown when a program contains invalid Microsoft intermediate language (MSIL) or metadata.")]
        InvalidProgramException,
        [Description("ERR-NG-00026 : The exception that is thrown when time zone information is invalid.")]
        InvalidTimeZoneException,
        [Description("ERR-NG-00027 : The exception that is thrown when an attempt to access a class member fails.")]
        MemberAccessException,
        [Description("ERR-NG-00028 : The exception that is thrown when there is an invalid attempt to access a method, such as accessing a private method from partially trusted code.")]
        MethodAccessException,
        [Description("ERR-NG-00029 : The exception that is thrown when there is an attempt to dynamically access a field that does not exist.")]
        MissingFieldException,
        [Description("ERR-NG-00030 : The exception that is thrown when there is an attempt to dynamically access a class member that does not exist.")]
        MissingMemberException,
        [Description("ERR-NG-00031 : The exception that is thrown when there is an attempt to dynamically access a method that does not exist.")]
        MissingMethodException,
        [Description("ERR-NG-00032 : The exception that is thrown when there is an attempt to combine two delegates based on the Delegate type instead of the MulticastDelegate type.")]
        MulticastNotSupportedException,
        [Description("ERR-NG-00033 : It is thrown when an attempt is made to cancel an operation that is not cancelable.")]
        NotCancelableException,
        [Description("ERR-NG-00034 : The exception that is thrown when a floating-point value is positive infinity, negative infinity, or Not-a-Number (NaN).")]
        NotFiniteNumberException,
        [Description("ERR-NG-00035 : The exception that is thrown when a requested method or operation is not implemented.")]
        NotImplementedException,
        [Description("ERR-NG-00036 : The exception that is thrown when an invoked method is not supported, or when there is an attempt to read, seek, or write to a stream that does not support the invoked functionality.")]
        NotSupportedException,
        [Description("ERR-NG-00037 : The exception that is thrown when there is an attempt to dereference a null object reference.")]
        NullReferenceException,
        [Description("ERR-NG-00038 : The exception that is thrown when an operation is performed on a disposed object.")]
        ObjectDisposedException,
        [Description("ERR-NG-00039 : The exception that is thrown in a thread upon cancellation of an operation that the thread was executing.")]
        OperationCanceledException,
        [Description("ERR-NG-00040 : The exception that is thrown when there is not enough memory to continue the execution of a program.")]
        OutOfMemoryException,
        [Description("ERR-NG-00041 : The exception that is thrown when an arithmetic, casting, or conversion operation in a checked context results in an overflow.")]
        OverflowException,
        [Description("ERR-NG-00042 : The exception that is thrown when a feature does not run on a particular platform.")]
        PlatformNotSupportedException,
        [Description("ERR-NG-00043 : The exception that is thrown when an array with the wrong number of dimensions is passed to a method.")]
        RankException,
        [Description("ERR-NG-00044 : The exception that is thrown when the execution stack overflows because it contains too many nested method calls.")]
        StackOverflowException,
        [Description("ERR-NG-00045 : Serves as the base class for system exceptions namespace.")]
        SystemException,
        [Description("ERR-NG-00046 : The exception that is thrown when the time allotted for a process or operation has expired.")]
        TimeoutException,
        [Description("ERR-NG-00047 : The exception that is thrown when a time zone cannot be found.")]
        TimeZoneNotFoundException,
        [Description("ERR-NG-00048 : The exception that is thrown when a method attempts to use a type that it does not have access to.")]
        TypeAccessException,
        [Description("ERR-NG-00049 : The exception that is thrown as a wrapper around the exception thrown by the class initializer. This class cannot be inherited.")]
        TypeInitializationException,
        [Description("ERR-NG-00050 : The exception that is thrown when type-loading failures occur.")]
        TypeLoadException,
        [Description("ERR-NG-00051 : The exception that is thrown when there is an attempt to access an unloaded class.")]
        TypeUnloadedException,
        [Description("ERR-NG-00052 : The exception that is thrown when the operating system denies access because of an I/O error or a specific type of security error.")]
        UnauthorizedAccessException,
        [Description("ERR-NG-00053 : The exception that is thrown when an invalid Uniform Resource Identifier (URI) is detected.")]
        UriFormatException,
        [Description("ERR-NG-00054 : Represents the exception that is thrown when attempting an action that violates a constraint.")]
        ConstraintException,
        [Description("ERR-NG-00055 : Represents the exception that is thrown when attempting an action that violates a constraint.")]
        DataException,
        [Description("ERR-NG-00056 : Gets or sets the value of the DataRow that generated the DBConcurrencyException.")]
        DBConcurrencyException,
        [Description("ERR-NG-00057 : Represents the exception that is thrown when an action is tried on a DataRow that has been deleted.")]
        DeleteRowInaccessibleException,
        [Description("ERR-NG-00058 : Represents the exception that is thrown when a duplicate database object name is encountered during an add operation in a DataSet -related object.")]
        DuplicateNameException,
        [Description("ERR-NG-00059 : Represents the exception that is thrown when the Expression property of a DataColumn cannot be evaluated.")]
        EvaluateException,
        [Description("ERR-NG-00060 : Represents the exception that is thrown when you call the EndEdit method within the RowChanging event.")]
        InRowChangingEventException,
        [Description("ERR-NG-00061 : Represents the exception that is thrown when incorrectly trying to create or access a relation.")]
        InvalidConstraintException,
        [Description("ERR-NG-00062 : Represents the exception that is thrown when you try to add a DataColumn that contains an invalid Expression to a DataColumnCollection.")]
        InvalidExpressionException,
        [Description("ERR-NG-00063 : Represents the exception that is thrown when you try to access a row in a table that has no primary key.")]
        MissingPrimaryKeyException,
        [Description("ERR-NG-00064 : Represents the exception that is thrown when you try to insert a null value into a column where AllowDBNull is set tofalse.")]
        NoNullAllowedException,
        [Description("ERR-NG-00065 : This exception is thrown when an ongoing operation is aborted by the user.")]
        OperationAbortedException,
        [Description("ERR-NG-00066 : Represents the exception that is thrown when you try to change the value of a read-only column.")]
        ReadOnlyException,
        [Description("ERR-NG-00067 : Represents the exception that is thrown when you try to perform an operation on a DataRow that is not in a DataTable.")]
        RowNotInTableException,
        [Description("ERR-NG-00068 : The exception that is thrown by a strongly typed DataSet when the user accesses a DBNull value.")]
        StrongTypingException,
        [Description("ERR-NG-00069 : Represents the exception that is thrown when the Expression property of a DataColumn contains a syntax error.")]
        SyntaxErrorException,
        [Description("ERR-NG-00070 : The exception that is thrown when a name conflict occurs while generating a strongly typed DataSet.")]
        TypedDataSetGeneratorException,
        [Description("ERR-NG-00071 : Represents the exception that is thrown when you try to return a version of a DataRow that has been deleted.")]
        VersionNotFoundException,
        [Description("ERR-NG-00072 : The exception that is thrown when part of a file or directory cannot be found.")]
        DirectoryNotFoundException,
        [Description("ERR-NG-00073 : The exception that is thrown when a drive that is referenced by an operation could not be found.")]
        DriveNotFoundException,
        [Description("ERR-NG-00074 : An EndOfStreamException exception is thrown when there is an attempt to read past the end of a stream.")]
        EndOfStreamException,
        [Description("ERR-NG-00075 : The exception that is thrown when an input file or a data stream that is supposed to conform to a certain file format specification is malformed.")]
        FileFormatException,
        [Description("ERR-NG-00076 : The exception that is thrown when a managed assembly is found but cannot be loaded.")]
        FileLoadException,
        [Description("ERR-NG-00077 : The exception that is thrown when an attempt to access a file that does not exist on disk fails.")]
        FileNotFoundException,
        [Description("ERR-NG-00078 : The exception thrown when the internal buffer overflows.")]
        InternalBufferOverflowException,
        [Description("ERR-NG-00079 : The exception that is thrown when a data stream is in an invalid format.")]
        InvalidDataException,
        [Description("ERR-NG-00080 : The exception that is thrown when an I/O error occurs.")]
        IOException,
        [Description("ERR-NG-00081 : The exception that is thrown when a path or file name is longer than the system-defined maximum length.")]
        PathTooLongException,
        [Description("ERR-NG-00082 : Thrown when an error occurs within a named pipe.")]
        PipeException,
        [Description("ERR-NG-00083 : Thrown when an Database Exception Occurred.")]
        ADOException,
        [Description("ERR-NG-00084 : Thrown when an Access Database Exception Occurred.")]
        DbException,
        [Description("ERR-NG-00085 : Thrown when an Exception Occurred.")]
        Exception,
    }
}
