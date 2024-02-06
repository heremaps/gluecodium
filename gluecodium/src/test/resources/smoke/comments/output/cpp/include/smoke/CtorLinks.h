// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <memory>
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT CtorLinks {
public:
    CtorLinks();
    virtual ~CtorLinks();


public:
    /**
     * This class has just one constructor ::smoke::CtorLinks::SingleCtor::create.

     */
    class _GLUECODIUM_CPP_EXPORT SingleCtor {
    public:
        SingleCtor();
        virtual ~SingleCtor();


    public:
        /**
         *
         * \return @NotNull
         */
        static ::std::shared_ptr< ::smoke::CtorLinks::SingleCtor > create(  );
    };

    /**
     * This class has just one constructor with one argument ::smoke::CtorLinks::SingleCtorWithOneArgument::create.

     */
    class _GLUECODIUM_CPP_EXPORT SingleCtorWithOneArgument {
    public:
        SingleCtorWithOneArgument();
        virtual ~SingleCtorWithOneArgument();


    public:
        /**
         *
         * \param[in] arg
         * \return @NotNull
         */
        static ::std::shared_ptr< ::smoke::CtorLinks::SingleCtorWithOneArgument > create( const int32_t arg );
    };

    /**
     * This class has just one constructor with two argument ::smoke::CtorLinks::SingleCtorWithTwoArgument::create.

     */
    class _GLUECODIUM_CPP_EXPORT SingleCtorWithTwoArgument {
    public:
        SingleCtorWithTwoArgument();
        virtual ~SingleCtorWithTwoArgument();


    public:
        /**
         *
         * \param[in] arg
         * \param[in] arg2
         * \return @NotNull
         */
        static ::std::shared_ptr< ::smoke::CtorLinks::SingleCtorWithTwoArgument > create( const int32_t arg, const ::std::string& arg2 );
    };

    class _GLUECODIUM_CPP_EXPORT OverloadedCtors {
    public:
        OverloadedCtors();
        virtual ~OverloadedCtors();


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
