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

import "test/Blobs_test.dart" as BlobsTests;
import "test/Classes_test.dart" as ClassesTests;
import "test/Constants_test.dart" as ConstantsTests;
import "test/Dates_test.dart" as DatesTests;
import "test/Defaults_test.dart" as DefaultsTests;
import "test/Enums_test.dart" as EnumsTests;
import "test/Exceptions_test.dart" as Exceptions;
import "test/ExternalTypes_test.dart" as ExternalTypes;
import "test/Interfaces_test.dart" as InterfacesTests;
import "test/Lists_test.dart" as ListsTests;
import "test/Maps_test.dart" as MapsTests;
import "test/MethodOverloads_test.dart" as MethodOverloadsTests;
import "test/Nullable_test.dart" as NullableTests;
import "test/PlainDataStructures_test.dart" as PlainDataStructuresTests;
import "test/PlainDataStructuresImmutable_test.dart" as PlainDataStructuresImmutableTests;
import "test/PlainDataStructuresTypeCollection_test.dart" as PlainDataStructuresTypeCollectionTests;
import "test/Properties_test.dart" as PropertiesTests;
import "test/Sets_test.dart" as SetsTests;
import "test/StaticBooleanMethods_test.dart" as StaticBooleanMethodsTests;
import "test/StaticFloatDoubleMethods_test.dart" as StaticFloatDoubleMethodsTests;
import "test/StaticIntMethods_test.dart" as StaticIntMethodsTests;
import "test/StaticStringMethods_test.dart" as StaticStringMethodsTests;
import "test/StructsWithConstants_test.dart" as StructsWithConstantsTests;
import "test/StructsWithMethods_test.dart" as StructsWithMethodsTests;

final _allTests = [
  BlobsTests.main,
  ClassesTests.main,
  ConstantsTests.main,
  DatesTests.main,
  DefaultsTests.main,
  EnumsTests.main,
  Exceptions.main,
  ExternalTypes.main,
  InterfacesTests.main,
  ListsTests.main,
  MapsTests.main,
  MethodOverloadsTests.main,
  NullableTests.main,
  PlainDataStructuresTests.main,
  PlainDataStructuresImmutableTests.main,
  PlainDataStructuresTypeCollectionTests.main,
  PropertiesTests.main,
  SetsTests.main,
  StaticBooleanMethodsTests.main,
  StaticFloatDoubleMethodsTests.main,
  StaticIntMethodsTests.main,
  StaticStringMethodsTests.main,
  StructsWithConstantsTests.main,
  StructsWithMethodsTests.main
];

void main() {
  _allTests.forEach((testCase) => testCase());
}
