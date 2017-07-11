// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "stub/hello/HelloWorldStub.h"
#include "stub/hello/HelloWorldBuiltinTypesStub.h"

#include <cstdint>
#include <iostream>
#include <string>

using namespace hello;

int main()
{
    std::string string_buffer;

    std::cout << "Write your name: ";
    std::getline(std::cin, string_buffer);

    std::cout << HelloWorldStub::helloWorldMethod(string_buffer) << std::endl;

    std::cout << "Write the loan amount (NNNN.NN): ";
    std::getline(std::cin, string_buffer);
    float amount = std::stof(string_buffer);

    std::cout << "Write the interest rate (percentage): ";
    std::getline(std::cin, string_buffer);
    int8_t percentage = (int8_t)std::stoi(string_buffer);

    std::cout << "Repayment due in 1 year: "
              << amount + HelloWorldBuiltinTypesStub::methodWithFloatAndInteger(amount, percentage)
              << std::endl;
}
