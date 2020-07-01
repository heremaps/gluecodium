/*
 *
 */
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValuesImplCppProxy.h"
#include "com_example_smoke_ListenersWithReturnValues_ResultEnum__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValues_ResultStruct__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValues__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::com_example_smoke_ListenersWithReturnValuesImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_ListenersWithReturnValuesImpl" ) {
}
double
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::fetch_data_double(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jdouble>( "fetchDataDouble", "()D", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return result;
}
::std::string
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::fetch_data_string(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "fetchDataString", "()Ljava/lang/String;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::string*)nullptr );
}
::smoke::ListenersWithReturnValues::ResultStruct
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::fetch_data_struct(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataStruct", "()Lcom/example/smoke/ListenersWithReturnValues$ResultStruct;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::smoke::ListenersWithReturnValues::ResultStruct*)nullptr );
}
::smoke::ListenersWithReturnValues::ResultEnum
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::fetch_data_enum(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataEnum", "()Lcom/example/smoke/ListenersWithReturnValues$ResultEnum;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::smoke::ListenersWithReturnValues::ResultEnum*)nullptr );
}
::std::vector< double >
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::fetch_data_array(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataArray", "()Ljava/util/List;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::vector< double >*)nullptr );
}
::smoke::ListenersWithReturnValues::StringToDouble
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::fetch_data_map(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataMap", "()Ljava/util/Map;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::smoke::ListenersWithReturnValues::StringToDouble*)nullptr );
}
::std::shared_ptr< ::smoke::CalculationResult >
com_example_smoke_ListenersWithReturnValuesImpl_CppProxy::fetch_data_instance(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "fetchDataInstance", "()Lcom/example/smoke/CalculationResult;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::shared_ptr< ::smoke::CalculationResult >*)nullptr );
}
}
}
