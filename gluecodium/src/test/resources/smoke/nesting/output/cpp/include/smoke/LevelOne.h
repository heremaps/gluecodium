// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/OuterClass.h"
#include "smoke/OuterInterface.h"
#include <cstdint>
#include <memory>
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT LevelOne {
public:
    LevelOne();
    virtual ~LevelOne();


public:
    class _GLUECODIUM_CPP_EXPORT LevelTwo {
    public:
        LevelTwo();
        virtual ~LevelTwo();


    public:
        class _GLUECODIUM_CPP_EXPORT LevelThree {
        public:
            LevelThree();
            virtual ~LevelThree();


        public:
            enum class _GLUECODIUM_CPP_EXPORT LevelFourEnum {
                NONE
            };


            struct _GLUECODIUM_CPP_EXPORT LevelFour {
                static const bool FOO;

                ::std::string string_field;

                LevelFour( );
                explicit LevelFour( ::std::string string_field );

                static ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour foo_factory(  );

            };

        public:
            /**
             *
             * \param[in] input @NotNull
             * \return @NotNull
             */
            virtual ::std::shared_ptr< ::smoke::OuterInterface::InnerClass > foo( const ::std::shared_ptr< ::smoke::OuterClass::InnerInterface >& input ) = 0;
        };

    };

};


}
