/*
 *
 */
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_ListenerWithPropertiesImplCppProxy.h"
#include "com_example_smoke_ListenerWithProperties_ResultEnum__Conversion.h"
#include "com_example_smoke_ListenerWithProperties_ResultStruct__Conversion.h"
#include "com_example_smoke_ListenerWithProperties__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::com_example_smoke_ListenerWithPropertiesImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_ListenerWithPropertiesImpl" ) {
}
::std::string
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::get_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "getMessage", "()Ljava/lang/String;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::string*)nullptr );
}
void
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::set_message( const ::std::string& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMessage", "(Ljava/lang/String;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
::std::shared_ptr< ::smoke::CalculationResult >
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::get_packed_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getPackedMessage", "()Lcom/example/smoke/CalculationResult;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::shared_ptr< ::smoke::CalculationResult >*)nullptr );
}
void
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::set_packed_message( const ::std::shared_ptr< ::smoke::CalculationResult >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setPackedMessage", "(Lcom/example/smoke/CalculationResult;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
::smoke::ListenerWithProperties::ResultStruct
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::get_structured_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getStructuredMessage", "()Lcom/example/smoke/ListenerWithProperties$ResultStruct;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::smoke::ListenerWithProperties::ResultStruct*)nullptr );
}
void
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::set_structured_message( const ::smoke::ListenerWithProperties::ResultStruct& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setStructuredMessage", "(Lcom/example/smoke/ListenerWithProperties$ResultStruct;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
::smoke::ListenerWithProperties::ResultEnum
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::get_enumerated_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getEnumeratedMessage", "()Lcom/example/smoke/ListenerWithProperties$ResultEnum;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::smoke::ListenerWithProperties::ResultEnum*)nullptr );
}
void
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::set_enumerated_message( const ::smoke::ListenerWithProperties::ResultEnum nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setEnumeratedMessage", "(Lcom/example/smoke/ListenerWithProperties$ResultEnum;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
::std::vector< ::std::string >
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::get_arrayed_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getArrayedMessage", "()Ljava/util/List;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::vector< ::std::string >*)nullptr );
}
void
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::set_arrayed_message( const ::std::vector< ::std::string >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setArrayedMessage", "(Ljava/util/List;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
::smoke::ListenerWithProperties::StringToDouble
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::get_mapped_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getMappedMessage", "()Ljava/util/Map;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::smoke::ListenerWithProperties::StringToDouble*)nullptr );
}
void
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::set_mapped_message( const ::smoke::ListenerWithProperties::StringToDouble& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMappedMessage", "(Ljava/util/Map;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
::std::shared_ptr< ::std::vector< uint8_t > >
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::get_buffered_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jbyteArray>( "getBufferedMessage", "()[B", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr );
}
void
com_example_smoke_ListenerWithPropertiesImpl_CppProxy::set_buffered_message( const ::std::shared_ptr< ::std::vector< uint8_t > >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setBufferedMessage", "([B)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
}
}
