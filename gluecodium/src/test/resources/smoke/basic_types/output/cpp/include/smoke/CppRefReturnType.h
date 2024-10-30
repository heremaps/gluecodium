// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <memory>
#include <optional>
#include <string>
#include <system_error>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT CppRefReturnType {
public:
    CppRefReturnType();
    virtual ~CppRefReturnType();


public:
    enum class _GLUECODIUM_CPP_EXPORT InternalError {
        FOO,
        BAR
    };


    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        ::std::string field;

        SomeStruct( );
        explicit SomeStruct( ::std::string field );

    };

public:
    static void void_ref(  );
    static const bool& bool_ref(  );
    static const ::std::string& string_ref(  );
    static const ::smoke::CppRefReturnType::SomeStruct& struct_ref(  );
    /**
     *
     * \return @NotNull
     */
    static const ::std::shared_ptr< ::smoke::CppRefReturnType >& class_ref(  );
    static const std::optional< ::std::string >& nullable_ref(  );
    static ::std::error_code throwing_enum_with_void(  );
    static ::gluecodium::Return< const ::std::string&, ::std::error_code > throwing_enum_with_string(  );
    static ::gluecodium::Return< void, ::smoke::CppRefReturnType::SomeStruct > throwing_struct_with_void(  );
    static ::gluecodium::Return< const ::std::string&, ::smoke::CppRefReturnType::SomeStruct > throwing_struct_with_string(  );
    static const ::std::string& get_string_property(  );

};


_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::CppRefReturnType::InternalError value ) noexcept;
}

namespace std
{
template <>
struct is_error_code_enum< ::smoke::CppRefReturnType::InternalError > : public std::true_type { };
}
