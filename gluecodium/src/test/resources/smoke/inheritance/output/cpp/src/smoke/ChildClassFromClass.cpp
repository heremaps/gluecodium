// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/ChildClassFromClass.h"
namespace smoke {
ChildClassFromClass::ChildClassFromClass() {
    ::gluecodium::get_type_repository().add_type(this, "smoke_ChildClassFromClass");
}
ChildClassFromClass::~ChildClassFromClass() {
    ::gluecodium::get_type_repository().remove_type(this);
}
}
