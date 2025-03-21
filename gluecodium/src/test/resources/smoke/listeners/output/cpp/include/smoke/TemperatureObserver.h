// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <memory>


namespace smoke {

    class Thermometer;


}

namespace smoke {
/**
 * Observer interface for monitoring changes in thermometer ("Observer of subject").

 */
class _GLUECODIUM_CPP_EXPORT TemperatureObserver {
public:
    TemperatureObserver();
    virtual ~TemperatureObserver();


public:
    /**
     *
     * \param[in] thermometer @NotNull
     */
    virtual void on_temperature_update( const ::std::shared_ptr< ::smoke::Thermometer >& thermometer ) = 0;
};


}
