// Copyright (C) 2016-2023 HERE Europe B.V.
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

#include "gluecodium/calculator/Calculator.h"

#include <limits>

namespace {

bool is_out_of_int32_bounds(int64_t value64) {
    return value64 < static_cast<int64_t>(std::numeric_limits<int32_t>::min()) ||
        value64 > static_cast<int64_t>(std::numeric_limits<int32_t>::max());
}

class CalculatorImpl : public gluecodium::calculator::Calculator {
    // If method throws an exception in Java/Swift it should return error in C++.
    // Note: Gluecodiom doesn't catch any C++ exceptions.
    ::gluecodium::Return< int32_t, ::std::error_code >
    summarize( const int32_t first, const int32_t second ) override {
        const int64_t result64 = static_cast<int64_t>(first) + static_cast<int64_t>(second);
        if (is_out_of_int32_bounds(result64)) {
            return {CalculatorError::RESULT_OUT_OF_BOUNDS};
        }
        return {static_cast<int32_t>(result64)};
    }

    void
    subtract( const int32_t minuend, const int32_t subtrahend,
              const ::gluecodium::calculator::Calculator::SubtructCallback& callback ) override {
        const auto result = summarize(minuend, -subtrahend);
        if (result.has_value()) {
            callback(std::nullopt, result.unsafe_value());
        } else {
            callback(static_cast<CalculatorError>(result.error().value()), std::nullopt);
        }
    }

    void
    multiply( const int32_t first, const int32_t second,
              const ::std::shared_ptr< ::gluecodium::calculator::Calculator::MultiplyCallback >& multiply_callback ) override {
        const int64_t result64 = static_cast<int64_t>(first) * static_cast<int64_t>(second);
        if (is_out_of_int32_bounds(result64)) {
            multiply_callback->on_error(CalculatorError::RESULT_OUT_OF_BOUNDS);
        } else {
            multiply_callback->on_result(static_cast<int32_t>(result64));
        }
    }

    ::gluecodium::calculator::Calculator::DivideResult
    divide( const Calculator::DivideArguments& divideArguments) override {
        ::gluecodium::calculator::Calculator::DivideResult result;
        if (divideArguments.divider == 0) {
            result.error = CalculatorError::DIVIDE_BY_ZERO;
        } else {
            result.result = static_cast<double>(divideArguments.dividend) / static_cast<double>(divideArguments.divider);
        }
        return result;
    }

    class MinResultRetrieverImpl final: public MinResultRetriever {
    public:
        explicit MinResultRetrieverImpl(int32_t result): m_result(result) {

        }
        int32_t get_result(  ) override {
            return m_result;
        }
    private:
        const int32_t m_result;
    };

    std::shared_ptr<Calculator::MinResultRetriever>
    min( const int32_t first, const int32_t second ) override {
        return std::make_shared<MinResultRetrieverImpl>(std::min(first, second));
    }

    std::optional< int32_t >
    max( const std::optional< int32_t >& first, const std::optional< int32_t >& second ) override {
        if (first && second) {
            return std::max(first.value(), second.value());
        }
        return first ? first : second;
    }
};
}

namespace gluecodium::calculator {
// This is factory method which is called from generated Java/Swift constructor.
::std::shared_ptr< ::gluecodium::calculator::Calculator >
Calculator::make()
{
    return std::make_shared<CalculatorImpl>();
}
}
