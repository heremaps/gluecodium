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
import functional

func getAllTests() -> [XCTestCaseEntry] {

    #if os(macOS)
    let platformSpecificTests = [XCTestCaseEntry]()
    #else
    let platformSpecificTests = [testCase(ExternalTypesTests.allTests)]
    #endif

    let allTests = platformSpecificTests + [
        testCase(ArraysTests.allTests),
        testCase(AttributesInterfaceTests.allTests),
        testCase(AttributesTests.allTests),
        testCase(BlobsTests.allTests),
        testCase(ConstantsTests.allTests),
        testCase(CppConstMethodsTests.allTests),
        testCase(DatesTests.allTests),
        testCase(DefaultsTests.allTests),
        testCase(DurationsTests.allTests),
        testCase(EnumsTests.allTests),
        testCase(EquatableInstancesTests.allTests),
        testCase(EquatableNullableTests.allTests),
        testCase(EquatableTests.allTests),
        testCase(ErrorsInInterfaceTests.allTests),
        testCase(ErrorsTests.allTests),
        testCase(FieldConstructorsTests.allTests),
        testCase(InheritanceTests.allTests),
        testCase(InterfacesTests.allTests),
        testCase(InterfaceWithStaticTests.allTests),
        testCase(LambdasTests.allTests),
        testCase(ListenerAsConstructorParamTest.allTests),
        testCase(ListenerInheritanceTests.allTests),
        testCase(ListenerRoundtripTests.allTests),
        testCase(ListenerWithAttributesTests.allTests),
        testCase(ListenersReturnValuesTests.allTests),
        testCase(ListenersWithDictionaries.allTests),
        testCase(LocalesTests.allTests),
        testCase(MapsTests.allTests),
        testCase(MethodOverloadsTests.allTests),
        testCase(MultiListenerTests.allTests),
        testCase(MultipleInheritanceTests.allTests),
        testCase(NestingTests.allTests),
        testCase(NoCacheTests.allTests),
        testCase(NullableAttributesTests.allTests),
        testCase(NullableCollectionsTests.allTests),
        testCase(NullableInstancesTests.allTests),
        testCase(NullableListenersTests.allTests),
        testCase(NullableMethodArgumentsTests.allTests),
        testCase(NullableStructsTests.allTests),
        testCase(OptimizedListsTests.allTests),
        testCase(PodTypeCollectionTests.allTests),
        testCase(PlainDataStructuresTests.allTests),
        testCase(RefEqualityTests.allTests),
        testCase(SerializationTests.allTests),
        testCase(SetTypeTests.allTests),
        testCase(SimpleEqualityTests.allTests),
        testCase(SkipElementTests.allTests),
        testCase(StaticBooleanMethodsTests.allTests),
        testCase(StaticByteArrayMethodsTests.allTests),
        testCase(StaticFloatDoubleMethodsTests.allTests),
        testCase(StaticIntMethodsTests.allTests),
        testCase(StaticStringMethodsTests.allTests),
        testCase(StructWithConstantsTests.allTests),
        testCase(StructsWithMethodsTests.allTests),
        testCase(StructWithInstanceTests.allTests),
        testCase(TypeDefTests.allTests),
        testCase(WeakListenersTests.allTests)
    ]
    return allTests
}

XCTMain(getAllTests())
