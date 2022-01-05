/*
 *
 */
#pragma once
#include "smoke/DurationInterface.h"
#include "CppProxyBase.h"
#include "JniReference.h"
namespace gluecodium
{
namespace jni
{
class com_example_smoke_DurationInterface_CppProxy : public CppProxyBase, public ::smoke::DurationInterface {
public:
    com_example_smoke_DurationInterface_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    com_example_smoke_DurationInterface_CppProxy( const com_example_smoke_DurationInterface_CppProxy& ) = delete;
    com_example_smoke_DurationInterface_CppProxy& operator=( const com_example_smoke_DurationInterface_CppProxy& ) = delete;
    ::std::string duration_function( const ::std::chrono::seconds ninput ) override;
};
}
}
