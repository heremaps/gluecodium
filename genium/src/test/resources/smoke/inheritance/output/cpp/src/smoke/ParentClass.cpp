// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/ParentClass.h"
namespace genium {
TypeRepository& get_type_repository(const ::smoke::ParentClass*) {
    static TypeRepository s_repo;
    return s_repo;
}
}
namespace smoke {
ParentClass::ParentClass() {
}
ParentClass::~ParentClass() {
}
}
