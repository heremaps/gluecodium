/*

 *
 */

#pragma once

#include "smoke/ListenersWithReturnValues.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_ListenersWithReturnValues_CppProxy final : public CppProxyBase, public ::smoke::ListenersWithReturnValues {
public:
    com_example_smoke_ListenersWithReturnValues_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_ListenersWithReturnValues_CppProxy( const com_example_smoke_ListenersWithReturnValues_CppProxy& ) = delete;
    com_example_smoke_ListenersWithReturnValues_CppProxy& operator=( const com_example_smoke_ListenersWithReturnValues_CppProxy& ) = delete;


    double fetch_data_double(  ) override;

    ::std::string fetch_data_string(  ) override;

    ::smoke::ListenersWithReturnValues::ResultStruct fetch_data_struct(  ) override;

    ::smoke::ListenersWithReturnValues::ResultEnum fetch_data_enum(  ) override;

    ::std::vector< double > fetch_data_array(  ) override;

    ::smoke::ListenersWithReturnValues::StringToDouble fetch_data_map(  ) override;

    ::std::shared_ptr< ::smoke::CalculationResult > fetch_data_instance(  ) override;
};

}
}
