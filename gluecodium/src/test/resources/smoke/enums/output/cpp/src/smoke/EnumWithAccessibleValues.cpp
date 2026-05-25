// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#include "smoke/EnumWithAccessibleValues.h"

namespace smoke {


  std::array<EnumWithAccessibleValues, 3>
  EnumWithAccessibleValues_enumerators() {
    return std::array<EnumWithAccessibleValues, 3>{
      {
        EnumWithAccessibleValues::FOO,
        EnumWithAccessibleValues::BAR,
        EnumWithAccessibleValues::BAZ
      }
    };
  }

}

