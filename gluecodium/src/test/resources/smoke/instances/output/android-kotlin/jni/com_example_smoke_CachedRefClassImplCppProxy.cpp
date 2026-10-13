/*

 *
 */

#include "com_example_smoke_CachedRefClassImplCppProxy.h"
#include "com_example_smoke_CachedRefClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_CachedRefClassImpl_CppProxy::com_example_smoke_CachedRefClassImpl_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_CachedRefClassImpl") {
}

::std::string
com_example_smoke_CachedRefClassImpl_CppProxy::get_string_value(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getStringValue", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::string>{});



}


const ::std::vector< ::std::string >&
com_example_smoke_CachedRefClassImpl_CppProxy::get_items( ) const {

    ::std::call_once( _get_items_once, [this]() {
        JNIEnv* jniEnv = getJniEnvironment( );
        auto _result = callJavaMethod<jobject>( "getItems", "()Ljava/util/List;", jniEnv );
        checkExceptionAndReportIfAny(jniEnv);
        _get_items_value.reset( new ::std::vector< ::std::string >( convert_from_jni( jniEnv, _result, TypeId<::std::vector< ::std::string >>{}) ) );
    } );
    return *_get_items_value;

}


}
}
