// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT MultipleAttributesCpp {
public:
    MultipleAttributesCpp();
    virtual ~MultipleAttributesCpp() = 0;
public:
    [[Foo, Bar]]
    virtual void no_lists2(  ) = 0;
    [[Foo, Bar, Baz]]
    virtual void no_lists3(  ) = 0;
    [[Foo, Bar, Baz]]
    virtual void list_first(  ) = 0;
    [[Foo, Bar, Baz]]
    virtual void list_second(  ) = 0;
    [[Foo, Bar, Baz, Fizz]]
    virtual void two_lists(  ) = 0;
};
}
