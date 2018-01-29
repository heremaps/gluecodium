// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "test/Talker.h"
#include "another/AdditionalErrors.h"
#include "another/TypeCollectionWithEnums.h"

namespace test
{
void
Talker::talk_to_parent( const std::shared_ptr< ParentListener >& listener )
{
    listener->listen( );
}

void
Talker::talk_to_child( const std::shared_ptr< ChildListener >& listener )
{
    listener->listen( );
}
}
