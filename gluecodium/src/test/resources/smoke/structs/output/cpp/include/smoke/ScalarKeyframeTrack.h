// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include "smoke/ScalarKeyframe.h"
#include <string>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT ScalarKeyframeTrack {
    ::std::vector< ::smoke::ScalarKeyframe > keyframes;
    ::std::string easing_function;
    ::std::string interpolation_mode;
    ScalarKeyframeTrack( );
    ScalarKeyframeTrack( ::std::vector< ::smoke::ScalarKeyframe > keyframes, ::std::string easing_function, ::std::string interpolation_mode );
};
}
