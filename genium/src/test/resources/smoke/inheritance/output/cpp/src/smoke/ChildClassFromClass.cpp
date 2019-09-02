// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/ChildClassFromClass.h"
namespace smoke {
ChildClassFromClass::ChildClassFromClass() {
    ::genium::get_type_repository(this).add_type(this, "smoke_ChildClassFromClass");
}
ChildClassFromClass::~ChildClassFromClass() {
    ::genium::get_type_repository(this).remove_type(this);
}
}
