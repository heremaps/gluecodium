// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/EnumWithToStringHelper.h"
namespace smoke {
  std::string_view
  to_string(EnumWithToStringHelper enumeration) {
    switch (enumeration) {
      case EnumWithToStringHelper::FIRST: return "EnumWithToStringHelper::FIRST";
      case EnumWithToStringHelper::SECOND: return "EnumWithToStringHelper::SECOND";
    }
    return "<unknown>";
  }
}
