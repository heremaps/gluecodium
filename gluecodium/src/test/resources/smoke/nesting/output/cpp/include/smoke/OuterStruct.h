// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Locale.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT OuterStruct {
    struct _GLUECODIUM_CPP_EXPORT InnerStruct {
        ::std::vector< ::std::chrono::system_clock::time_point > other_field;
        InnerStruct( );
        InnerStruct( ::std::vector< ::std::chrono::system_clock::time_point > other_field );
        void do_something(  ) const;
    };
    enum class InnerEnum {
        FOO,
        BAR
    };
    class _GLUECODIUM_CPP_EXPORT InnerClass {
    public:
        InnerClass();
        virtual ~InnerClass() = 0;
    public:
        virtual ::std::unordered_set< ::gluecodium::Locale > foo_bar(  ) = 0;
    };
    class _GLUECODIUM_CPP_EXPORT Builder {
    public:
        Builder();
        virtual ~Builder() = 0;
    public:
        /**
         *
         * \return @NotNull
         */
        static ::std::shared_ptr< ::smoke::OuterStruct::Builder > create(  );
        /**
         *
         * \param[in] value
         * \return @NotNull
         */
        virtual ::std::shared_ptr< ::smoke::OuterStruct::Builder > field( const ::std::string& value ) = 0;
        virtual ::smoke::OuterStruct build(  ) = 0;
    };
    class _GLUECODIUM_CPP_EXPORT InnerInterface {
    public:
        InnerInterface();
        virtual ~InnerInterface() = 0;
    public:
        virtual ::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > > bar_baz(  ) = 0;
    };
    ::std::string field;
    OuterStruct( );
    OuterStruct( ::std::string field );
    void do_nothing(  ) const;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::OuterStruct::InnerInterface*);
}
