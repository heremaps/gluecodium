#include "com_example_smoke_ListenerWithPropertiesImplCppProxy.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
namespace smoke {
using namespace ::genium::jni;
ListenerWithPropertiesCppProxy::ListenerWithPropertiesCppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
::std::string ListenerWithPropertiesCppProxy::get_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "getMessage", "()Ljava/lang/String;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::string*)nullptr );
}
void ListenerWithPropertiesCppProxy::set_message( const ::std::string& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMessage", "(Ljava/lang/String;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
::std::shared_ptr< ::smoke::CalculationResult > ListenerWithPropertiesCppProxy::get_packed_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getPackedMessage", "()Lcom/example/smoke/CalculationResult;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::shared_ptr< ::smoke::CalculationResult >*)nullptr );
}
void ListenerWithPropertiesCppProxy::set_packed_message( const ::std::shared_ptr< ::smoke::CalculationResult >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setPackedMessage", "(Lcom/example/smoke/CalculationResult;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
::smoke::ListenerWithProperties::ResultStruct ListenerWithPropertiesCppProxy::get_structured_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getStructuredMessage", "()Lcom/example/smoke/ListenerWithProperties$ResultStruct;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return ::genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenerWithProperties::ResultStruct*)nullptr );
}
void ListenerWithPropertiesCppProxy::set_structured_message( const ::smoke::ListenerWithProperties::ResultStruct& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setStructuredMessage", "(Lcom/example/smoke/ListenerWithProperties$ResultStruct;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
::smoke::ListenerWithProperties::ResultEnum ListenerWithPropertiesCppProxy::get_enumerated_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getEnumeratedMessage", "()Lcom/example/smoke/ListenerWithProperties$ResultEnum;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return ::genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenerWithProperties::ResultEnum*)nullptr );
}
void ListenerWithPropertiesCppProxy::set_enumerated_message( const ::smoke::ListenerWithProperties::ResultEnum nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setEnumeratedMessage", "(Lcom/example/smoke/ListenerWithProperties$ResultEnum;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
::std::vector< ::std::string > ListenerWithPropertiesCppProxy::get_arrayed_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getArrayedMessage", "()Ljava/util/List;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::vector< ::std::string >*)nullptr );
}
void ListenerWithPropertiesCppProxy::set_arrayed_message( const ::std::vector< ::std::string >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setArrayedMessage", "(Ljava/util/List;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
::smoke::ListenerWithProperties::StringToDouble ListenerWithPropertiesCppProxy::get_mapped_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getMappedMessage", "()Ljava/util/Map;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return ::genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenerWithProperties::StringToDouble*)nullptr );
}
void ListenerWithPropertiesCppProxy::set_mapped_message( const ::smoke::ListenerWithProperties::StringToDouble& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMappedMessage", "(Ljava/util/Map;)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
::std::shared_ptr< ::std::vector< uint8_t > > ListenerWithPropertiesCppProxy::get_buffered_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jbyteArray>( "getBufferedMessage", "()[B", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr );
}
void ListenerWithPropertiesCppProxy::set_buffered_message( const ::std::shared_ptr< ::std::vector< uint8_t > >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setBufferedMessage", "([B)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
}
