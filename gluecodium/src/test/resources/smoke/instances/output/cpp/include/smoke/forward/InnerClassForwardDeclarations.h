// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <memory>

namespace smoke {
namespace forward {
class _GLUECODIUM_CPP_EXPORT InnerClassForwardDeclarations {
public:
    InnerClassForwardDeclarations();
    virtual ~InnerClassForwardDeclarations() = 0;

public:
    class InnerInterface1;
    class InnerInterface2;

public:
    class _GLUECODIUM_CPP_EXPORT InnerClass1 {
    public:
        InnerClass1();
        virtual ~InnerClass1() = 0;

    public:
        /**
         *
         * \return @NotNull
         */
        virtual ::std::shared_ptr< ::smoke::forward::InnerClassForwardDeclarations::InnerInterface1 > get_inner_interface(  ) = 0;
    };

    class _GLUECODIUM_CPP_EXPORT InnerClass2 {
    public:
        InnerClass2();
        virtual ~InnerClass2() = 0;

    public:
        class InnerInnerClass2;

    public:
        class _GLUECODIUM_CPP_EXPORT InnerInnerClass1 {
        public:
            InnerInnerClass1();
            virtual ~InnerInnerClass1() = 0;

        public:
            /**
             *
             * \return @NotNull
             */
            virtual ::std::shared_ptr< ::smoke::forward::InnerClassForwardDeclarations::InnerClass2::InnerInnerClass2 > foo(  ) = 0;
        };

        class _GLUECODIUM_CPP_EXPORT InnerInnerClass2 {
        public:
            InnerInnerClass2();
            virtual ~InnerInnerClass2() = 0;

        public:
            /**
             *
             * \param[in] arg @NotNull
             */
            virtual void bar( const ::std::shared_ptr< ::smoke::forward::InnerClassForwardDeclarations::InnerInterface2 >& arg ) = 0;
        };

    };

    class _GLUECODIUM_CPP_EXPORT InnerInterface1 {
    public:
        InnerInterface1();
        virtual ~InnerInterface1() = 0;
    };

    class _GLUECODIUM_CPP_EXPORT InnerInterface2 {
    public:
        InnerInterface2();
        virtual ~InnerInterface2() = 0;
    };

    class _GLUECODIUM_CPP_EXPORT InnerInterface3 {
    public:
        InnerInterface3();
        virtual ~InnerInterface3() = 0;
    };

};

}
}
