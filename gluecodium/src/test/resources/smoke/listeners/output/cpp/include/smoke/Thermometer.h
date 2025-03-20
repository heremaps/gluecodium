// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/DurationHash.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
#include <memory>
#include <vector>


namespace smoke {

    class TemperatureObserver;


}

namespace smoke {
/**
 * A class, which reads temperature and updates observers according to the given interval.
 * "Subject" in observer design pattern.

 */
class _GLUECODIUM_CPP_EXPORT Thermometer {
public:
    Thermometer();
    virtual ~Thermometer();


public:
    /**
     *
     * \param[in] interval
     * \param[in] observers
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Thermometer > make_with_duration( const ::std::chrono::seconds interval, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
    /**
     *
     * \param[in] observers
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Thermometer > make_without_duration( const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
    /**
     *
     * \param[in] self @NotNull
     * \param[in] observers
     */
    static void notify_observers( const ::std::shared_ptr< ::smoke::Thermometer >& self, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
    virtual void force_update(  ) = 0;
    virtual double get_celsius(  ) = 0;
    virtual double get_kelvin(  ) = 0;
    virtual double get_fahrenheit(  ) = 0;
};


}
