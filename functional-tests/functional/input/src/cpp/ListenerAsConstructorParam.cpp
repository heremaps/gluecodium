// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2025 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

#include "test/Thermometer.h"
#include "test/TemperatureObserver.h"

#include <chrono>
#include <memory>
#include <random>
#include <vector>

namespace test {

class ThermometerImpl : public ::test::Thermometer, public std::enable_shared_from_this<ThermometerImpl> {
public:
    explicit ThermometerImpl(const ::std::chrono::seconds interval, const ::std::vector<::std::shared_ptr<::test::TemperatureObserver>>& observers)
        : m_interval{interval}, m_observers{observers}, m_temperatureInCelsius{0.0}
    {}

    ~ThermometerImpl() override = default;

    void force_update() override {
        m_temperatureInCelsius = m_temperatureDistribution(m_mersenne_twister);
    }

    double get_celsius() override {
        return m_temperatureInCelsius;
    }

    double get_kelvin() override {
        return m_temperatureInCelsius + 273.15;
    }

    double get_fahrenheit() override {
        return (m_temperatureInCelsius * 9 / 5) + 32;
    }

    void notify_observers() {
        for (auto& observer: m_observers) {
            observer->on_temperature_update(shared_from_this());
        }
    }

private:
    ::std::chrono::seconds m_interval;
    ::std::vector<::std::shared_ptr<::test::TemperatureObserver>> m_observers;
    double m_temperatureInCelsius;

    // Temperature readout is random from range [-15, 30].
    std::random_device m_random_device;
    std::mt19937 m_mersenne_twister{m_random_device()};
    std::uniform_real_distribution<double> m_temperatureDistribution{-15.0, 30.0};
};

::std::shared_ptr<::test::Thermometer> Thermometer::make(
    const ::std::chrono::seconds interval,
    const ::std::vector<::std::shared_ptr<::test::TemperatureObserver>>& observers
) {
    auto thermometer = std::make_shared<ThermometerImpl>(interval, observers);
    thermometer->force_update();
    thermometer->notify_observers();

    return thermometer;
}

} // namespace test