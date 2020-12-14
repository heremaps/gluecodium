// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT SpecialAttributes {
public:
    SpecialAttributes();
    virtual ~SpecialAttributes() = 0;
public:
    [[Deprecated("foo\nbar")]]
    virtual void with_escaping(  ) = 0;
    [[HackMerm -rf *]]
    virtual void with_line_break(  ) = 0;
};
}
