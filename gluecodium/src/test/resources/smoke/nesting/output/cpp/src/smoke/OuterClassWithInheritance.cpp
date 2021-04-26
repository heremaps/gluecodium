// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/OuterClassWithInheritance.h"
namespace smoke {
OuterClassWithInheritance::OuterClassWithInheritance() {
    ::gluecodium::get_type_repository().add_type(this, "smoke_OuterClassWithInheritance");
}
OuterClassWithInheritance::~OuterClassWithInheritance() {
    ::gluecodium::get_type_repository().remove_type(this);
}
OuterClassWithInheritance::InnerClass::InnerClass() {
}
OuterClassWithInheritance::InnerClass::~InnerClass() {
}
OuterClassWithInheritance::InnerInterface::InnerInterface() {
}
OuterClassWithInheritance::InnerInterface::~InnerInterface() {
}
}
