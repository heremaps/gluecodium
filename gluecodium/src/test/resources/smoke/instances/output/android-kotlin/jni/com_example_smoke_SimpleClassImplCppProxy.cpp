/*

 *
 */

#include "com_example_smoke_SimpleClassImplCppProxy.h"
#include "com_example_smoke_SimpleClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_SimpleClassImpl_CppProxy::com_example_smoke_SimpleClassImpl_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_SimpleClassImpl") {
}

::std::string
com_example_smoke_SimpleClassImpl_CppProxy::get_string_value(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getStringValue", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::string>{});



}

::std::shared_ptr< ::smoke::SimpleClass >
com_example_smoke_SimpleClassImpl_CppProxy::use_simple_class( const ::std::shared_ptr< ::smoke::SimpleClass >& ninput ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jinput = convert_to_jni( jniEnv, ninput );
    auto _result = callJavaMethod<jobject>( "useSimpleClass", "(Lcom/example/smoke/SimpleClass;)Lcom/example/smoke/SimpleClass;", jniEnv , jinput);

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::shared_ptr< ::smoke::SimpleClass >>{});



}


::std::string
com_example_smoke_SimpleClassImpl_CppProxy::get_title(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getTitle", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::string>{});



}


}
}
