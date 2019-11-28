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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
import 'package:library/src/smoke/off/SomeStruct.dart';
class NestedPackages {
  class SomeStruct {
    String someField;
  }
  static SomeStruct basicMethod(SomeStruct input) {
    final _basicMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_off_NestedPackages_basicMethod__SomeStruct');
    final _input_handle = __lib.smoke_off_SomeStruct_toFfi(input);
    final _result_handle = _basicMethod_ffi(_input_handle);
    final _result = __lib.smoke_off_SomeStruct_fromFfi(_result_handle);
    __lib.smoke_off_SomeStruct_releaseFfiHandle(_result_handle);
    __lib.smoke_off_SomeStruct_releaseFfiHandle(_input_handle);
    return _result;
  }
}
