// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include "smoke/OuterClass.h"
#include "smoke/OuterInterface.h"
#include <cstdint>
#include <memory>
#include <string>
namespace smoke {
class _GENIUM_CPP_EXPORT LevelOne {
public:
    LevelOne();
    virtual ~LevelOne() = 0;
public:
    class _GENIUM_CPP_EXPORT LevelTwo {
    public:
        LevelTwo();
        virtual ~LevelTwo() = 0;
    public:
        class _GENIUM_CPP_EXPORT LevelThree {
        public:
            LevelThree();
            virtual ~LevelThree() = 0;
        public:
            enum class LevelFourEnum {
                NONE
            };
            struct _GENIUM_CPP_EXPORT LevelFour {
                ::std::string string_field;
                LevelFour( );
                LevelFour( const ::std::string& string_field );
                static ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour foo_factory(  );
                _GENIUM_CPP_EXPORT static const bool FOO;
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
namespace genium {
template<>
struct hash< ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum > {
    _GENIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum& t ) const;
};
}
