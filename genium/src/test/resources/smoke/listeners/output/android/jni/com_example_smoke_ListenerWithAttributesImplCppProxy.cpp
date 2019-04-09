#include "com_example_smoke_ListenerWithAttributesImplCppProxy.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
namespace smoke {
using namespace ::genium::jni;
ListenerWithAttributesCppProxy::ListenerWithAttributesCppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
::std::string ListenerWithAttributesCppProxy::get_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "getMessage", "()Ljava/lang/String;", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::string*)nullptr );
}
void ListenerWithAttributesCppProxy::set_message( const ::std::string& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMessage", "(Ljava/lang/String;)V", jniEnv , jvalue);
}
::std::shared_ptr< ::smoke::CalculationResult > ListenerWithAttributesCppProxy::get_packed_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getPackedMessage", "()Lcom/example/smoke/CalculationResult;", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::shared_ptr< ::smoke::CalculationResult >*)nullptr );
}
void ListenerWithAttributesCppProxy::set_packed_message( const ::std::shared_ptr< ::smoke::CalculationResult >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setPackedMessage", "(Lcom/example/smoke/CalculationResult;)V", jniEnv , jvalue);
}
::smoke::ListenerWithAttributes::ResultStruct ListenerWithAttributesCppProxy::get_structured_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getStructuredMessage", "()Lcom/example/smoke/ListenerWithAttributes$ResultStruct;", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenerWithAttributes::ResultStruct*)nullptr );
}
void ListenerWithAttributesCppProxy::set_structured_message( const ::smoke::ListenerWithAttributes::ResultStruct& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setStructuredMessage", "(Lcom/example/smoke/ListenerWithAttributes$ResultStruct;)V", jniEnv , jvalue);
}
::smoke::ListenerWithAttributes::ResultEnum ListenerWithAttributesCppProxy::get_enumerated_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getEnumeratedMessage", "()Lcom/example/smoke/ListenerWithAttributes$ResultEnum;", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenerWithAttributes::ResultEnum*)nullptr );
}
void ListenerWithAttributesCppProxy::set_enumerated_message( const ::smoke::ListenerWithAttributes::ResultEnum nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setEnumeratedMessage", "(Lcom/example/smoke/ListenerWithAttributes$ResultEnum;)V", jniEnv , jvalue);
}
::std::vector< ::std::string > ListenerWithAttributesCppProxy::get_arrayed_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getArrayedMessage", "()Ljava/util/List;", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::vector< ::std::string >*)nullptr );
}
void ListenerWithAttributesCppProxy::set_arrayed_message( const ::std::vector< ::std::string >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setArrayedMessage", "(Ljava/util/List;)V", jniEnv , jvalue);
}
::smoke::ListenerWithAttributes::StringToDouble ListenerWithAttributesCppProxy::get_mapped_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "getMappedMessage", "()Ljava/util/Map;", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenerWithAttributes::StringToDouble*)nullptr );
}
void ListenerWithAttributesCppProxy::set_mapped_message( const ::smoke::ListenerWithAttributes::StringToDouble& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMappedMessage", "(Ljava/util/Map;)V", jniEnv , jvalue);
}
::std::shared_ptr< ::std::vector< uint8_t > > ListenerWithAttributesCppProxy::get_buffered_message(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jbyteArray>( "getBufferedMessage", "()[B", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr );
}
void ListenerWithAttributesCppProxy::set_buffered_message( const ::std::shared_ptr< ::std::vector< uint8_t > >& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setBufferedMessage", "([B)V", jniEnv , jvalue);
}
}
