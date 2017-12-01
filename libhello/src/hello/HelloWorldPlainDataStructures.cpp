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

#include "hello/HelloWorldPlainDataStructures.h"

namespace hello
{
HelloWorldPlainDataStructures::SyncResult
HelloWorldPlainDataStructures::method_with_non_nested_type(
    const HelloWorldPlainDataStructures::SyncResult& input )
{
    HelloWorldPlainDataStructures::SyncResult output = input;
    ++output.number_of_changes;

    return output;
}

HelloWorldPlainDataStructures::IdentifiableSyncResult
HelloWorldPlainDataStructures::method_with_nested_type(
    const HelloWorldPlainDataStructures::IdentifiableSyncResult& input )
{
    HelloWorldPlainDataStructures::IdentifiableSyncResult output = input;
    ++output.sync_result.number_of_changes;

    return output;
}

HelloWorldPlainDataStructures::NumericSyncResult
HelloWorldPlainDataStructures::method_with_inherited_struct(
    const HelloWorldPlainDataStructures::NumericSyncResult& input )
{
    HelloWorldPlainDataStructures::NumericSyncResult output = input;
    ++output.number_of_changes;

    return output;
}
}
