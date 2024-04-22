/*

 *
 */

#include "com_example_smoke_OuterStruct_InnerInterfaceImplCppProxy.h"
#include "com_example_smoke_OuterStruct_InnerInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_OuterStruct_00024InnerInterface_CppProxy::com_example_smoke_OuterStruct_00024InnerInterface_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_OuterStruct_00024InnerInterface") {
}

::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > >
com_example_smoke_OuterStruct_00024InnerInterface_CppProxy::bar_baz(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jobject>( "barBaz", "()Ljava/util/Map;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > >*)nullptr );



}

}
}
