// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/OuterInterface.h"
namespace gluecodium {
TypeRepository& get_type_repository(const ::smoke::OuterInterface*) {
    static TypeRepository s_repo;
    return s_repo;
}
TypeRepository& get_type_repository(const ::smoke::OuterInterface::InnerInterface*) {
    static TypeRepository s_repo;
    return s_repo;
}
}
namespace smoke {
OuterInterface::OuterInterface() {
}
OuterInterface::~OuterInterface() {
}
OuterInterface::InnerClass::InnerClass() {
}
OuterInterface::InnerClass::~InnerClass() {
}
OuterInterface::InnerInterface::InnerInterface() {
}
OuterInterface::InnerInterface::~InnerInterface() {
}
}
