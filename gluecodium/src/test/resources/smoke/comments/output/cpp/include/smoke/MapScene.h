// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Optional.h"
#include <cstdint>
#include <functional>
#include <string>
namespace smoke {
/**
 * Referencing some type ::smoke::MapScene::load_scene(const int32_t, const ::gluecodium::optional< ::smoke::MapScene::LoadSceneCallback >&).
 */
class _GLUECODIUM_CPP_EXPORT MapScene {
public:
    MapScene();
    virtual ~MapScene() = 0;
public:
    using LoadSceneCallback = ::std::function<void(const ::gluecodium::optional< ::std::string >&)>;
public:
    virtual void load_scene( const int32_t map_scheme, const ::gluecodium::optional< ::smoke::MapScene::LoadSceneCallback >& callback ) = 0;
    virtual void load_scene( const ::std::string& configuration_file, const ::gluecodium::optional< ::smoke::MapScene::LoadSceneCallback >& callback ) = 0;
};
}
