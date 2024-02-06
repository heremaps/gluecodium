// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include "non/Sense.h"
#include <cstdint>
#include <string>
#include <vector>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT Structs {
public:
    Structs();
    virtual ~Structs();


public:


public:
    static ::smoke::Structs::ExternalStruct get_external_struct(  );
    static ::fire::SomeVeryExternalStruct get_another_external_struct(  );
};


}
