// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/DurationHash.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
#include <cstdint>
#include <memory>
#include <string>
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
     * \param[in] id
     * \param[in] observers
     * \return @NotNull
     * \retval ::::String
     */
    static ::gluecodium::Return< ::std::shared_ptr< ::smoke::Thermometer >, ::std::string > throwing_make( const int32_t id, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
    /**
     *
     * \param[in] label
     * \param[in] nice_observers
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Thermometer > nothrow_make( const ::std::string& label, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& nice_observers );
    /**
     *
     * \param[in] thermometer @NotNull
     * \param[in] some_observers
     */
    static void notify_observers( const ::std::shared_ptr< ::smoke::Thermometer >& thermometer, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& some_observers );
    /**
     *
     * \param[in] thermometer @NotNull
     * \param[in] some_observers
     * \retval ::::String
     */
    static ::gluecodium::Return< void, ::std::string > throwing_notify_observers( const ::std::shared_ptr< ::smoke::Thermometer >& thermometer, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& some_observers );
    virtual void force_update(  ) = 0;
    virtual double get_celsius(  ) = 0;
    virtual double get_kelvin(  ) = 0;
    virtual double get_fahrenheit(  ) = 0;
};


}
