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
::gluecodium::optional< int8_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_byte( const ::gluecodium::optional< int8_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< int8_t >*)nullptr );
}
::gluecodium::optional< uint8_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_byte( const ::gluecodium::optional< uint8_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< uint8_t >*)nullptr );
}
::gluecodium::optional< int16_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_short( const ::gluecodium::optional< int16_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< int16_t >*)nullptr );
}
::gluecodium::optional< uint16_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_short( const ::gluecodium::optional< uint16_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< uint16_t >*)nullptr );
}
::gluecodium::optional< int32_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_int( const ::gluecodium::optional< int32_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< int32_t >*)nullptr );
}
::gluecodium::optional< uint32_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_int( const ::gluecodium::optional< uint32_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< uint32_t >*)nullptr );
}
::gluecodium::optional< int64_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_long( const ::gluecodium::optional< int64_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< int64_t >*)nullptr );
}
::gluecodium::optional< uint64_t >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_u_long( const ::gluecodium::optional< uint64_t >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< uint64_t >*)nullptr );
}
::gluecodium::optional< bool >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_double( const ::gluecodium::optional< bool >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< bool >*)nullptr );
}
::gluecodium::optional< float >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_float( const ::gluecodium::optional< float >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< float >*)nullptr );
}
::gluecodium::optional< double >
com_example_smoke_ListenerWithNullable_CppProxy::method_with_double( const ::gluecodium::optional< double >& ninput ) {
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
    return convert_from_jni( jniEnv, _result, (::gluecodium::optional< double >*)nullptr );
}
}
}
