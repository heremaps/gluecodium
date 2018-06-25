// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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
    testCase(EnumsTests.allTests),
    testCase(HelloWorldInstancesTests.allTests),
    testCase(HelloWorldTests.allTests),
    testCase(ListenersReturnValuesTests.allTests),
    testCase(ListenersTests.allTests),
    testCase(ListenersWithDictionaries.allTests),
    testCase(StructWithInstanceTests.allTests),
    testCase(MethodOverloadsTests.allTests),
    testCase(PlainDataStructuresFromTypeCollectionTests.allTests),
    testCase(PlainDataStructuresTests.allTests),
    testCase(StaticBooleanMethodsTests.allTests),
    testCase(StaticByteArrayMethodsTests.allTests),
    testCase(StaticFloatDoubleMethodsTests.allTests),
    testCase(StaticIntMethodsTests.allTests),
    testCase(StaticStringMethodsTests.allTests),
    testCase(TypeDefTests.allTests),
    testCase(ArraysTests.allTests),
    testCase(AttributesTests.allTests),
    testCase(AttributesInterfaceTests.allTests),
    testCase(InterfacesTests.allTests),
    testCase(ErrorsTests.allTests),
    testCase(DefaultsTests.allTests),
    testCase(InheritanceTests.allTests),
    testCase(MapsTests.allTests),
    testCase(ExternalTypesTests.allTests),
    testCase(ConstantsTests.allTests),
    testCase(EquatableTests.allTests)
]

XCTMain(allTests)
