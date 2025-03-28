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
#include <system_error>
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
     * Some error code for thermometer.

     */
    enum class SomeThermometerErrorCode {
        ERROR_NONE,
        ERROR_FATAL
    };


public:
    /**
     * A constructor, which makes the thermometer with readout interval.
     * \param[in] interval readout interval
     * \param[in] observers observers of temperature changes
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Thermometer > make_with_duration( const ::std::chrono::seconds interval, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
    /**
     * A constructor, which makes the thermometer with default readout interval (1 second).
     * \param[in] observers observers of temperature changes
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Thermometer > make_without_duration( const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
    /**
     * A throwing constructor, which makes the thermometer with default readout interval (1 second).
     * \param[in] id identification of this thermometer
     * \param[in] observers observers of temperature changes
     * \return @NotNull
     * \retval ::::String if identification number is invalid
     */
    static ::gluecodium::Return< ::std::shared_ptr< ::smoke::Thermometer >, ::std::string > throwing_make( const int32_t id, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
    /**
     * A non-throwing constructor, which makes the thermometer with default readout interval (1 second).
     * \param[in] label some identification label
     * \param[in] nice_observers observers of temperature changes
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::Thermometer > nothrow_make( const ::std::string& label, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& nice_observers );
    /**
     * A throwing constructor, which makes the thermometer with default readout interval (1 second).
     * \param[in] dummy some dummy boolean flag
     * \param[in] observers observers of temperature changes
     * \return @NotNull
     * \retval ::smoke::Thermometer::SomeThermometerErrorCode if some problem occurs
     */
    static ::gluecodium::Return< ::std::shared_ptr< ::smoke::Thermometer >, ::std::error_code > another_throwing_make( const bool dummy, const ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >& observers );
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


_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::Thermometer::SomeThermometerErrorCode value ) noexcept;
}

namespace std
{
template <>
struct is_error_code_enum< ::smoke::Thermometer::SomeThermometerErrorCode > : public std::true_type { };
}
