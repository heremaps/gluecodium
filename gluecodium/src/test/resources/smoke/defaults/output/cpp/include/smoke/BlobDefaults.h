// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <memory>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT BlobDefaults {
    ::std::shared_ptr< ::std::vector< uint8_t > > empty_list = ::std::make_shared<::std::vector<uint8_t>>(::std::vector<uint8_t>({}));
    ::std::shared_ptr< ::std::vector< uint8_t > > dead_beef = ::std::make_shared<::std::vector<uint8_t>>(::std::vector<uint8_t>({222, 173, 190, 239}));
    BlobDefaults( );
    BlobDefaults( ::std::shared_ptr< ::std::vector< uint8_t > > empty_list, ::std::shared_ptr< ::std::vector< uint8_t > > dead_beef );
};
}
