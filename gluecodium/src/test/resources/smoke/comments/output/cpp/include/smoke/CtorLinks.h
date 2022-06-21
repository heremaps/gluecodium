// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <memory>
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT CtorLinks {
public:
    CtorLinks();
    virtual ~CtorLinks() = 0;
public:
    /**
     * This class has just one constructor ::smoke::CtorLinks::SingleCtor::create.
     */
    class _GLUECODIUM_CPP_EXPORT SingleCtor {
    public:
        SingleCtor();
        virtual ~SingleCtor() = 0;
    public:
        /**
         *
         * \return @NotNull
         */
        static ::std::shared_ptr< ::smoke::CtorLinks::SingleCtor > create(  );
    };
    class _GLUECODIUM_CPP_EXPORT OverloadedCtors {
    public:
        OverloadedCtors();
        virtual ~OverloadedCtors() = 0;
    public:
        /**
         *
         * \param[in] input
         * \return @NotNull
         */
        static ::std::shared_ptr< ::smoke::CtorLinks::OverloadedCtors > create( const ::std::string& input );
        /**
         *
         * \deprecated Use ::smoke::CtorLinks::OverloadedCtors::create(const ::std::string&) instead.
         * \param[in] input
         * \param[in] flag
         * \return @NotNull
         */
        static ::std::shared_ptr< ::smoke::CtorLinks::OverloadedCtors > create( const ::std::string& input, const bool flag );
    };
};
}
