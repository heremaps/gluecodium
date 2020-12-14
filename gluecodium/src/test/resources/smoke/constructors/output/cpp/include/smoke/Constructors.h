// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <memory>
#include <string>
#include <system_error>
#include <vector>
namespace smoke {
    class Constructors;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Constructors {
public:
    Constructors();
    virtual ~Constructors() = 0;
public:
    enum class ErrorEnum {
        NONE,
        CRASHED
    };
public:
    /**
     *
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Constructors > create(  );
    /**
     *
     * \param[in] other @NotNull
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Constructors > create( const ::std::shared_ptr< ::smoke::Constructors >& other );
    /**
     *
     * \param[in] foo
     * \param[in] bar
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Constructors > create( const ::std::string& foo, const uint64_t bar );
    /**
     *
     * \param[in] input
     * \return @NotNull
     * \retval ::smoke::Constructors::ErrorEnum
     */
    static ::gluecodium::Return< ::std::shared_ptr< ::smoke::Constructors >, ::std::error_code > create( const ::std::string& input );
    /**
     *
     * \param[in] input
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Constructors > create( const ::std::vector< double >& input );
    /**
     *
     * \param[in] input
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Constructors > create( const uint64_t input );
};
_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::Constructors::ErrorEnum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::smoke::Constructors::ErrorEnum > : public std::true_type { };
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::Constructors*);
}
