#pragma once

#include <tuple>
#include <iostream>

namespace here {

namespace internal {

/**
 * A generic result holder.
 *
 * Can wrap error & multiple result types.
 * To be used by generated code.
 */
template <typename E, typename... T_values>
struct Expected
{
public:
    /**
     * Creates a new successful result with the given values.
     *
     * @param values The values in a parameter pack
     * @return The created result object
     */
    static Expected result(T_values&&... values) {
        // this will also call the default constructor of the error, to be fixed when using optional
        return Expected(std::piecewise_construct, // ensure the right constructor is called
                        std::forward_as_tuple(values...)); // this still involves a copy constructor call
    }

    /**
     * Creates a new failed result with the given error.
     *
     * @param error The error
     * @return The created failure object
     */
    static Expected fail(E error) {
        // this will also call the default constructor of the result, to be fixed when using optional
        return Expected(error);
    }

    /**
     * Checks whether the Expected is an error or a success.
     * @return true when the result succeeded, false if there was an error
     */
    inline bool succeeded() const {
        return m_succeeded;
    }

    /**
     * Retrieves the error value.
     *
     * @return The error type
     * @note will abort if there was no error
     */
    inline E get_error() const {
        if (m_succeeded) {
            std::cerr << "Do not read an error from a valid object!" << std::endl; // TODO switch to logging
            std::terminate(); // fail here, this is an error in the generated code
        }
        return m_error;
    }

    /**
     * Retrieves the values from the result as a reference to a tuple
     *
     * @return The values
     * @note will abort if there was an error
     */
    inline const std::tuple<T_values...>& get_values() {
        if (!m_succeeded) {
            std::cerr << "Do not read a result from a invalid object!" << std::endl; // TODO switch to logging
            std::terminate(); // fail here, this is an error in the generated code
        }
        return m_values;
    }

private:
    /// private constructor
    Expected() {}

    /// Creates failed instance
    Expected(E error) :
        m_succeeded(false),
        m_error(std::move(error)) { } // move here to prevent another copy

    /// Creates successful instance
    Expected(std::piecewise_construct_t,
             std::tuple<T_values...>&& values) :
        m_succeeded(true),
        m_values(std::move(values)) { } // move here to prevent another copy

    // TODO look into variant/optional usage later
    bool m_succeeded; /// stores whether the call was successful or not
    E m_error; /// the error type
    std::tuple<T_values...> m_values; /// the result values
};

} // internal

} // here
