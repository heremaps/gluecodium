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

import XCTest
import hello

let allTests = [
    testCase(ArraysTests.allTests),
    testCase(AttributesInterfaceTests.allTests),
    testCase(AttributesTests.allTests),
    testCase(ConstantsTests.allTests),
    testCase(DefaultsTests.allTests),
    testCase(EnumsTests.allTests),
    testCase(EquatableTests.allTests),
    testCase(ErrorsTests.allTests),
    testCase(ExternalTypesTests.allTests),
    testCase(HelloWorldInstancesTests.allTests),
    testCase(HelloWorldTests.allTests),
    testCase(InheritanceTests.allTests),
    testCase(InterfacesTests.allTests),
    testCase(ListenerRoundtripTests.allTests),
    testCase(ListenerWithAttributesTests.allTests),
    testCase(ListenerWithErrorsTests.allTests),
    testCase(ListenersReturnValuesTests.allTests),
    testCase(ListenersTests.allTests),
    testCase(ListenersWithDictionaries.allTests),
    testCase(MapsTests.allTests),
    testCase(MethodOverloadsTests.allTests),
    testCase(NotNullTests.allTests),
    testCase(NullableAttributesTests.allTests),
    testCase(NullableListenersTests.allTests),
    testCase(NullableMethodArgumentsTests.allTests),
    testCase(NullableStructsTests.allTests),
    testCase(PlainDataStructuresFromTypeCollectionTests.allTests),
    testCase(PlainDataStructuresTests.allTests),
    testCase(StaticBooleanMethodsTests.allTests),
    testCase(StaticByteArrayMethodsTests.allTests),
    testCase(StaticFloatDoubleMethodsTests.allTests),
    testCase(StaticIntMethodsTests.allTests),
    testCase(StaticStringMethodsTests.allTests),
    testCase(StructWithInstanceTests.allTests),
    testCase(TypeDefTests.allTests)
]

XCTMain(allTests)
