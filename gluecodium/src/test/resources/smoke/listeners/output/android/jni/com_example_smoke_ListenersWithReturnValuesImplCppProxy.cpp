/*

 *
 */

#include "com_example_smoke_ListenersWithReturnValuesImplCppProxy.h"
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValues_ResultEnum__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValues_ResultStruct__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValues__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_ListenersWithReturnValues_CppProxy::com_example_smoke_ListenersWithReturnValues_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_ListenersWithReturnValues") {
}

double
com_example_smoke_ListenersWithReturnValues_CppProxy::fetch_data_double(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jdouble>( "fetchDataDouble", "()D", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return _result;



}

::std::string
com_example_smoke_ListenersWithReturnValues_CppProxy::fetch_data_string(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "fetchDataString", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::std::string*)nullptr );



}

::smoke::ListenersWithReturnValues::ResultStruct
com_example_smoke_ListenersWithReturnValues_CppProxy::fetch_data_struct(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "fetchDataStruct", "()Lcom/example/smoke/ListenersWithReturnValues$ResultStruct;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::smoke::ListenersWithReturnValues::ResultStruct*)nullptr );



}

::smoke::ListenersWithReturnValues::ResultEnum
com_example_smoke_ListenersWithReturnValues_CppProxy::fetch_data_enum(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "fetchDataEnum", "()Lcom/example/smoke/ListenersWithReturnValues$ResultEnum;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::smoke::ListenersWithReturnValues::ResultEnum*)nullptr );



}

::std::vector< double >
com_example_smoke_ListenersWithReturnValues_CppProxy::fetch_data_array(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "fetchDataArray", "()Ljava/util/List;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::std::vector< double >*)nullptr );



}

::smoke::ListenersWithReturnValues::StringToDouble
com_example_smoke_ListenersWithReturnValues_CppProxy::fetch_data_map(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "fetchDataMap", "()Ljava/util/Map;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::smoke::ListenersWithReturnValues::StringToDouble*)nullptr );



}

::std::shared_ptr< ::smoke::CalculationResult >
com_example_smoke_ListenersWithReturnValues_CppProxy::fetch_data_instance(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "fetchDataInstance", "()Lcom/example/smoke/CalculationResult;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::std::shared_ptr< ::smoke::CalculationResult >*)nullptr );



}

}
}
