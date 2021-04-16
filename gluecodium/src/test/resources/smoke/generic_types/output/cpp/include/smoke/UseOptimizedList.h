// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include "smoke/VeryBigStruct.h"
#include <memory>
#include <vector>
namespace smoke {
    class UnreasonablyLazyClass;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT UseOptimizedList {
public:
    UseOptimizedList();
    virtual ~UseOptimizedList() = 0;
public:
    static ::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > > fetch_the_big_ones(  );
    static ::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > > get_lazy_ones(  );
};
}
