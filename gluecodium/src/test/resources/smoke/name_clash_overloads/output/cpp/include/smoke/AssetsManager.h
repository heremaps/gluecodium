// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
namespace smoke {
    class Image;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT AssetsManager {
public:
    AssetsManager();
    virtual ~AssetsManager() = 0;
public:
    virtual void add_asset( const ::std::string& identifier, const ::std::shared_ptr< ::std::vector< uint8_t > >& asset_data ) = 0;
    /**
     *
     * \param[in] identifier
     * \param[in] image_data @NotNull
     */
    virtual void add_asset( const ::std::string& identifier, const ::std::shared_ptr< ::smoke::Image >& image_data ) = 0;
};
}
