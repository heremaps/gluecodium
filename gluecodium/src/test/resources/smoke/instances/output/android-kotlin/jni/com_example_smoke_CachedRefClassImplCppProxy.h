/*

 *
 */

#pragma once

#include "smoke/CachedRefClass.h"
#include "CppProxyBase.h"
#include "JniReference.h"
#include <mutex>

namespace gluecodium
{
namespace jni
{

class com_example_smoke_CachedRefClassImpl_CppProxy final : public CppProxyBase, public ::smoke::CachedRefClass {
public:
    com_example_smoke_CachedRefClassImpl_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_CachedRefClassImpl_CppProxy( const com_example_smoke_CachedRefClassImpl_CppProxy& ) = delete;
    com_example_smoke_CachedRefClassImpl_CppProxy& operator=( const com_example_smoke_CachedRefClassImpl_CppProxy& ) = delete;


    ::std::string get_string_value(  ) override;


    const ::std::vector< ::std::string >& get_items(  ) const override;


private:


    // A C++ reference must outlive the call, so the value is converted once and kept for the proxy's lifetime.
    mutable ::std::once_flag _get_items_once;
    mutable ::std::unique_ptr< ::std::vector< ::std::string > > _get_items_value;

};

}
}
