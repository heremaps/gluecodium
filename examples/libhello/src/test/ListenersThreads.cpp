// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

#include "test/ThreadedListener.h"
#include "test/ThreadedNotifier.h"
#include "test/UnloadedClass.h"

#include <memory>
#include <string>
#include <thread>

namespace test
{
namespace
{
void
notify_impl( const std::shared_ptr< ThreadedListener >& listener,
             const std::string& message,
             int64_t& response )
{
    listener->unloaded( UnloadedClass::create( ) );
    response = listener->on_event( message );
}
}

class ThreadedNotifierImpl : public ThreadedNotifier
{
public:
    int64_t
    notify( const std::shared_ptr< ThreadedListener >& listener,
            const std::string& message ) override
    {
        int64_t response;
        std::thread notification_thread( notify_impl, listener, message, std::ref( response ) );
        notification_thread.join( );
        return response;
    }
};

class UnloadedClassImpl : public UnloadedClass
{
public:
    virtual ~UnloadedClassImpl( ) = default;
    uint8_t increment( uint8_t in ) {
        return ++in;
    }
};

std::shared_ptr< UnloadedClass >
UnloadedClass::create( )
{
    return std::make_shared< UnloadedClassImpl >( );
}

std::shared_ptr< ThreadedNotifier >
ThreadedNotifier::create_on_new_thread( )
{
    return std::make_shared< ThreadedNotifierImpl >( );
}
}