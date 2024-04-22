/*

 *
 */

#include "com_example_smoke_SkipProxyImplCppProxy.h"
#include "com_example_smoke_SkipProxy__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_SkipProxy_CppProxy::com_example_smoke_SkipProxy_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_SkipProxy") {
}

::std::string
com_example_smoke_SkipProxy_CppProxy::not_in_java( const ::std::string& ninput ) {

    return {};

}

bool
com_example_smoke_SkipProxy_CppProxy::not_in_swift( const bool ninput ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    jboolean jinput = ninput;
    auto _result = callJavaMethod<jboolean>( "notInSwift", "(Z)Z", jniEnv , jinput);

    checkExceptionAndReportIfAny(jniEnv);

    return _result;



}

float
com_example_smoke_SkipProxy_CppProxy::not_in_dart( const float ninput ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    jfloat jinput = ninput;
    auto _result = callJavaMethod<jfloat>( "notInDart", "(F)F", jniEnv , jinput);

    checkExceptionAndReportIfAny(jniEnv);

    return _result;



}


::std::string
com_example_smoke_SkipProxy_CppProxy::get_skipped_in_java(  ) const {

    return {};

}



void
com_example_smoke_SkipProxy_CppProxy::set_skipped_in_java( const ::std::string& nvalue ) {

    

}



bool
com_example_smoke_SkipProxy_CppProxy::is_skipped_in_swift(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jboolean>( "isSkippedInSwift", "()Z", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return _result;



}



void
com_example_smoke_SkipProxy_CppProxy::set_skipped_in_swift( const bool nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    jboolean jvalue = nvalue;
    callJavaMethod<void>( "setSkippedInSwift", "(Z)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



float
com_example_smoke_SkipProxy_CppProxy::get_skipped_in_dart(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jfloat>( "getSkippedInDart", "()F", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return _result;



}



void
com_example_smoke_SkipProxy_CppProxy::set_skipped_in_dart( const float nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    jfloat jvalue = nvalue;
    callJavaMethod<void>( "setSkippedInDart", "(F)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}



::smoke::SkippedEverywhere
com_example_smoke_SkipProxy_CppProxy::get_skipped_everywhere(  ) const {

    return {};

}



void
com_example_smoke_SkipProxy_CppProxy::set_skipped_everywhere( const ::smoke::SkippedEverywhere& nvalue ) {

    

}



::smoke::SkippedEverywhereEnum
com_example_smoke_SkipProxy_CppProxy::get_skipped_everywhere_too(  ) const {

    return {};

}



void
com_example_smoke_SkipProxy_CppProxy::set_skipped_everywhere_too( const ::smoke::SkippedEverywhereEnum nvalue ) {

    

}


}
}
