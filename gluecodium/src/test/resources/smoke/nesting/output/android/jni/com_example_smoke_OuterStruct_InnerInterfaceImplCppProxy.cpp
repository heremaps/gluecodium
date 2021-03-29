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
com_example_smoke_OuterStruct_00024InnerInterface_CppProxy::com_example_smoke_OuterStruct_00024InnerInterface_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_OuterStruct_00024InnerInterface" ) {
}
::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > >
com_example_smoke_OuterStruct_00024InnerInterface_CppProxy::bar_baz(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jobject>( "barBaz", "()Ljava/util/Map;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, result, (::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > >*)nullptr );
}
}
}
