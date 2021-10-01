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

import 'dart:io';
import 'package:functional/src/_library_context.dart' as __lib;

import "test/Blobs_test.dart" as BlobsTests;
import "test/CallbacksMultithreaded_test.dart" as CallbacksMultithreadedTests;
import "test/Classes_test.dart" as ClassesTests;
import "test/Constants_test.dart" as ConstantsTests;
import "test/CppConstMethods_test.dart" as CppConstMethodsTests;
import "test/Dates_test.dart" as DatesTests;
import "test/Defaults_test.dart" as DefaultsTests;
import "test/Durations_test.dart" as DurationsTests;
import "test/EquatableClasses_test.dart" as EquatableClassesTests;
import "test/EquatableStructs_test.dart" as EquatableStructsTests;
import "test/Enums_test.dart" as EnumsTests;
import "test/Exceptions_test.dart" as Exceptions;
import "test/ExternalTypes_test.dart" as ExternalTypes;
import "test/FieldConstructors_test.dart" as FieldConstructors;
import "test/Inheritance_test.dart" as InheritanceTests;
import "test/Interfaces_test.dart" as InterfacesTests;
import "test/InterfaceWithStatic_test.dart" as InterfaceWithStaticTests;
import "test/Lambdas_test.dart" as LambdasTests;
import "test/Lists_test.dart" as ListsTests;
import "test/Listeners_test.dart" as ListenersTests;
import "test/ListenersWithAttributes_test.dart" as ListenersWithAttributesTests;
import "test/ListenersWithErrors_test.dart" as ListenersWithErrorsTests;
import "test/ListenersWithReturnValues_test.dart" as ListenersWithReturnValuesTests;
import "test/Locales_test.dart" as LocalesTests;
import "test/Maps_test.dart" as MapsTests;
import "test/MethodOverloads_test.dart" as MethodOverloadsTests;
import "test/MultiListener_test.dart" as MultiListenerTests;
import "test/MultipleInheritance_test.dart" as MultipleInheritanceTests;
import "test/Nesting_test.dart" as NestingTests;
import "test/Nullable_test.dart" as NullableTests;
import "test/OptimizedLists_test.dart" as OptimizedListsTests;
import "test/PlainDataStructures_test.dart" as PlainDataStructuresTests;
import "test/PlainDataStructuresImmutable_test.dart" as PlainDataStructuresImmutableTests;
import "test/PlainDataStructuresTypeCollection_test.dart" as PlainDataStructuresTypeCollectionTests;
import "test/Properties_test.dart" as PropertiesTests;
import "test/RefEquality_test.dart" as RefEqualityTests;
import "test/Sets_test.dart" as SetsTests;
import "test/SimpleEquality_test.dart" as SimpleEqualityTests;
import "test/SkipElement_test.dart" as SkipElementTests;
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
  CppConstMethodsTests.main,
  DatesTests.main,
  DefaultsTests.main,
  DurationsTests.main,
  EquatableClassesTests.main,
  EquatableStructsTests.main,
  EnumsTests.main,
  Exceptions.main,
  ExternalTypes.main,
  FieldConstructors.main,
  InheritanceTests.main,
  InterfacesTests.main,
  InterfaceWithStaticTests.main,
  LambdasTests.main,
  ListsTests.main,
  ListenersTests.main,
  ListenersWithAttributesTests.main,
  ListenersWithErrorsTests.main,
  ListenersWithReturnValuesTests.main,
  LocalesTests.main,
  MapsTests.main,
  MethodOverloadsTests.main,
  MultiListenerTests.main,
  MultipleInheritanceTests.main,
  NestingTests.main,
  NullableTests.main,
  OptimizedListsTests.main,
  PlainDataStructuresTests.main,
  PlainDataStructuresImmutableTests.main,
  PlainDataStructuresTypeCollectionTests.main,
  PropertiesTests.main,
  RefEqualityTests.main,
  SetsTests.main,
  SimpleEqualityTests.main,
  SkipElementTests.main,
  StaticBooleanMethodsTests.main,
  StaticFloatDoubleMethodsTests.main,
  StaticIntMethodsTests.main,
  StaticStringMethodsTests.main,
  StructsWithConstantsTests.main,
  StructsWithMethodsTests.main
];

String _getLibraryPath(String nativeLibraryName) {
  if (Platform.isWindows) return 'lib${nativeLibraryName}.dll';
  if (Platform.isMacOS || Platform.isIOS) return 'lib${nativeLibraryName}.dylib';
  return 'lib${nativeLibraryName}.so';
}

void main(List<String> arguments) {
  final libraryName = arguments.isEmpty ? _getLibraryPath('functional') : arguments[0];

  __lib.LibraryContext.init(__lib.IsolateOrigin.main, nativeLibraryPath: libraryName);
  _allTests.forEach((testCase) => testCase());
  __lib.LibraryContext.release();

  CallbacksMultithreadedTests.main([libraryName]);
}
