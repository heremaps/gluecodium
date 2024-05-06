/*

 *
 */

#include "com_example_smoke_ListenerWithPropertiesImplCppProxy.h"
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_ListenerWithProperties_ResultEnum__Conversion.h"
#include "com_example_smoke_ListenerWithProperties_ResultStruct__Conversion.h"
#include "com_example_smoke_ListenerWithProperties__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_ListenerWithProperties_CppProxy::com_example_smoke_ListenerWithProperties_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_ListenerWithProperties") {
}


::std::string
com_example_smoke_ListenerWithProperties_CppProxy::get_message(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getMessage", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::string>{});



}



void
com_example_smoke_ListenerWithProperties_CppProxy::set_message( const ::std::string& nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMessage", "(Ljava/lang/String;)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



::std::shared_ptr< ::smoke::CalculationResult >
com_example_smoke_ListenerWithProperties_CppProxy::get_packed_message(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "getPackedMessage", "()Lcom/example/smoke/CalculationResult;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::shared_ptr< ::smoke::CalculationResult >>{});



}



void
com_example_smoke_ListenerWithProperties_CppProxy::set_packed_message( const ::std::shared_ptr< ::smoke::CalculationResult >& nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setPackedMessage", "(Lcom/example/smoke/CalculationResult;)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



::smoke::ListenerWithProperties::ResultStruct
com_example_smoke_ListenerWithProperties_CppProxy::get_structured_message(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "getStructuredMessage", "()Lcom/example/smoke/ListenerWithProperties$ResultStruct;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::smoke::ListenerWithProperties::ResultStruct>{});



}



void
com_example_smoke_ListenerWithProperties_CppProxy::set_structured_message( const ::smoke::ListenerWithProperties::ResultStruct& nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setStructuredMessage", "(Lcom/example/smoke/ListenerWithProperties$ResultStruct;)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



::smoke::ListenerWithProperties::ResultEnum
com_example_smoke_ListenerWithProperties_CppProxy::get_enumerated_message(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "getEnumeratedMessage", "()Lcom/example/smoke/ListenerWithProperties$ResultEnum;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::smoke::ListenerWithProperties::ResultEnum>{});



}



void
com_example_smoke_ListenerWithProperties_CppProxy::set_enumerated_message( const ::smoke::ListenerWithProperties::ResultEnum nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setEnumeratedMessage", "(Lcom/example/smoke/ListenerWithProperties$ResultEnum;)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



::std::vector< ::std::string >
com_example_smoke_ListenerWithProperties_CppProxy::get_arrayed_message(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "getArrayedMessage", "()Ljava/util/List;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::vector< ::std::string >>{});



}



void
com_example_smoke_ListenerWithProperties_CppProxy::set_arrayed_message( const ::std::vector< ::std::string >& nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setArrayedMessage", "(Ljava/util/List;)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



::smoke::ListenerWithProperties::StringToDouble
com_example_smoke_ListenerWithProperties_CppProxy::get_mapped_message(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "getMappedMessage", "()Ljava/util/Map;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::smoke::ListenerWithProperties::StringToDouble>{});



}



void
com_example_smoke_ListenerWithProperties_CppProxy::set_mapped_message( const ::smoke::ListenerWithProperties::StringToDouble& nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setMappedMessage", "(Ljava/util/Map;)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



::std::shared_ptr< ::std::vector< uint8_t > >
com_example_smoke_ListenerWithProperties_CppProxy::get_buffered_message(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jbyteArray>( "getBufferedMessage", "()[B", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::shared_ptr< ::std::vector< uint8_t > >>{});



}



void
com_example_smoke_ListenerWithProperties_CppProxy::set_buffered_message( const ::std::shared_ptr< ::std::vector< uint8_t > >& nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setBufferedMessage", "([B)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}


}
}
