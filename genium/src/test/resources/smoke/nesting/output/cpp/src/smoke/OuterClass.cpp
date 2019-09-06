// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/OuterClass.h"
namespace genium {
TypeRepository& get_type_repository(const ::smoke::OuterClass::InnerInterface*) {
    static TypeRepository s_repo;
    return s_repo;
}
}
namespace smoke {
OuterClass::OuterClass() {
}
OuterClass::~OuterClass() {
}
OuterClass::InnerClass::InnerClass() {
}
OuterClass::InnerClass::~InnerClass() {
}
OuterClass::InnerInterface::InnerInterface() {
}
OuterClass::InnerInterface::~InnerInterface() {
}
}
