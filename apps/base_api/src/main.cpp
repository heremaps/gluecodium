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

#include <iostream>
#include <string>

using namespace hello;

int main()
{
    std::string user_name;

    std::cout << "Write your name: ";

    std::getline(std::cin, user_name);

    std::cout << HelloWorldStub::helloWorldMethod(user_name) << std::endl;
}
