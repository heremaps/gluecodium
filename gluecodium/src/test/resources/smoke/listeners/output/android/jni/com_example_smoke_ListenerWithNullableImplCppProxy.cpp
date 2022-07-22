/*
 *
 */
#include "com_example_smoke_ListenerWithNullableImplCppProxy.h"
#include "com_example_smoke_ListenerWithNullable__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_ListenerWithNullable_CppProxy::com_example_smoke_ListenerWithNullable_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_ListenerWithNullable" ) {
}
std::optional< int8_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_byte( const std::optional< int8_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithByte", "(Ljava/lang/Byte;)Ljava/lang/Byte;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< int8_t >*)nullptr );
}
std::optional< uint8_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_byte( const std::optional< uint8_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithUByte", "(Ljava/lang/Short;)Ljava/lang/Short;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< uint8_t >*)nullptr );
}
std::optional< int16_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_short( const std::optional< int16_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithShort", "(Ljava/lang/Short;)Ljava/lang/Short;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< int16_t >*)nullptr );
}
std::optional< uint16_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_short( const std::optional< uint16_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithUShort", "(Ljava/lang/Integer;)Ljava/lang/Integer;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< uint16_t >*)nullptr );
}
std::optional< int32_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_int( const std::optional< int32_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithInt", "(Ljava/lang/Integer;)Ljava/lang/Integer;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< int32_t >*)nullptr );
}
std::optional< uint32_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_int( const std::optional< uint32_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithUInt", "(Ljava/lang/Long;)Ljava/lang/Long;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< uint32_t >*)nullptr );
}
std::optional< int64_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_long( const std::optional< int64_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithLong", "(Ljava/lang/Long;)Ljava/lang/Long;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< int64_t >*)nullptr );
}
std::optional< uint64_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_long( const std::optional< uint64_t >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithULong", "(Ljava/lang/Long;)Ljava/lang/Long;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< uint64_t >*)nullptr );
}
std::optional< bool >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_double( const std::optional< bool >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithDouble", "(Ljava/lang/Boolean;)Ljava/lang/Boolean;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< bool >*)nullptr );
}
std::optional< float >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_float( const std::optional< float >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithFloat", "(Ljava/lang/Float;)Ljava/lang/Float;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< float >*)nullptr );
}
std::optional< double >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_double( const std::optional< double >& ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "methodWithDouble", "(Ljava/lang/Double;)Ljava/lang/Double;", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (std::optional< double >*)nullptr );
}
}
}
