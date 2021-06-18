  static String stringFunction(String input) {
    final _stringFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_BasicTypes_stringFunction__String'));
    final _inputHandle = stringToFfi(input);
    final __resultHandle = _stringFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  static bool boolFunction(bool input) {
    final _boolFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_boolFunction__Boolean'));
    final _inputHandle = booleanToFfi(input);
    final __resultHandle = _boolFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    booleanReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  static double floatFunction(double input) {
    final _floatFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Int32, Float), double Function(int, double)>('library_smoke_BasicTypes_floatFunction__Float'));
    final _inputHandle = (input);
    final __resultHandle = _floatFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static double doubleFunction(double input) {
    final _doubleFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_BasicTypes_doubleFunction__Double'));
    final _inputHandle = (input);
    final __resultHandle = _doubleFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int byteFunction(int input) {
    final _byteFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int8 Function(Int32, Int8), int Function(int, int)>('library_smoke_BasicTypes_byteFunction__Byte'));
    final _inputHandle = (input);
    final __resultHandle = _byteFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int shortFunction(int input) {
    final _shortFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int16 Function(Int32, Int16), int Function(int, int)>('library_smoke_BasicTypes_shortFunction__Short'));
    final _inputHandle = (input);
    final __resultHandle = _shortFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int intFunction(int input) {
    final _intFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>('library_smoke_BasicTypes_intFunction__Int'));
    final _inputHandle = (input);
    final __resultHandle = _intFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int longFunction(int input) {
    final _longFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Int32, Int64), int Function(int, int)>('library_smoke_BasicTypes_longFunction__Long'));
    final _inputHandle = (input);
    final __resultHandle = _longFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int ubyteFunction(int input) {
    final _ubyteFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_ubyteFunction__UByte'));
    final _inputHandle = (input);
    final __resultHandle = _ubyteFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int ushortFunction(int input) {
    final _ushortFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint16 Function(Int32, Uint16), int Function(int, int)>('library_smoke_BasicTypes_ushortFunction__UShort'));
    final _inputHandle = (input);
    final __resultHandle = _ushortFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int uintFunction(int input) {
    final _uintFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_BasicTypes_uintFunction__UInt'));
    final _inputHandle = (input);
    final __resultHandle = _uintFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static int ulongFunction(int input) {
    final _ulongFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Int32, Uint64), int Function(int, int)>('library_smoke_BasicTypes_ulongFunction__ULong'));
    final _inputHandle = (input);
    final __resultHandle = _ulongFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
