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

#include "test/DummyLogger.h"

#include <algorithm>
#include <memory>
#include <mutex>
#include <string>
#include <vector>

namespace test
{

void
DummyLogger::relay_message(
    const ::std::shared_ptr< ::test::StringListener >& listener, const ::std::string& message )
{
    listener->on_message( message );
}

}
