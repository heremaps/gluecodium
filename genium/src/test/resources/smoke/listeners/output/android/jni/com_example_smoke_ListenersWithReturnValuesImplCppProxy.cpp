#include "com_example_smoke_ListenersWithReturnValuesImplCppProxy.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
namespace smoke {
using namespace ::genium::jni;
ListenersWithReturnValuesCppProxy::ListenersWithReturnValuesCppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
double ListenersWithReturnValuesCppProxy::fetch_data(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jdouble>( "fetchDataDouble", "()D", jniEnv  );
    return result;
}
::std::string ListenersWithReturnValuesCppProxy::fetch_data(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "fetchDataString", "()Ljava/lang/String;", jniEnv  );
    return genium::jni::convert_from_jni( jniEnv, result, (::std::string*)nullptr );
}
::smoke::ListenersWithReturnValues::ResultStruct ListenersWithReturnValuesCppProxy::fetch_data(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataStruct", "()Lcom/example/smoke/ListenersWithReturnValues$ResultStruct;", jniEnv  );
    return genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenersWithReturnValues::ResultStruct*)nullptr );
}
::smoke::ListenersWithReturnValues::ResultEnum ListenersWithReturnValuesCppProxy::fetch_data(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataEnum", "()Lcom/example/smoke/ListenersWithReturnValues$ResultEnum;", jniEnv  );
    return genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenersWithReturnValues::ResultEnum*)nullptr );
}
::std::vector< double > ListenersWithReturnValuesCppProxy::fetch_data(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataArray", "()Ljava/util/List;", jniEnv  );
    return genium::jni::convert_from_jni( jniEnv, result, (::std::vector< double >*)nullptr );
}
::smoke::ListenersWithReturnValues::StringToDouble ListenersWithReturnValuesCppProxy::fetch_data(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataMap", "()Ljava/util/Map;", jniEnv  );
    return genium::jni::convert_from_jni( jniEnv, result, (::smoke::ListenersWithReturnValues::StringToDouble*)nullptr );
}
::std::shared_ptr< ::smoke::CalculationResult > ListenersWithReturnValuesCppProxy::fetch_data(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataInstance", "()Lcom/example/smoke/CalculationResult;", jniEnv  );
    return genium::jni::convert_from_jni( jniEnv, result, (::std::shared_ptr< ::smoke::CalculationResult >*)nullptr );
}
}