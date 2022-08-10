External types
==============

This document describes in detail the "external types"/"external descriptor" functionality of LIME IDL.

General concepts
----------------

Gluecodium supports integrating pre-existing types into the hierarchy of the generated ones. The "external" type could
be manually written, or come from a system library, or even from a third-party library.

The syntax is **external** **{** *descriptors-list* **}**, where *descriptors-list* is a newline-separated list of one
or more descriptors, each declared as *PlatformTag* *ValueName* **"**_Value_**"**. Platform tags and value
names are case-insensitive. Please note that the value itself is _always_ a string literal.

A minimal example:
```
external {
    cpp include "other/MoreTypes.h"
}
```

External descriptors are supported for classes, interfaces, structs, and enums. If present, the descriptor must be the
first child element. When specifying fine-grained behavior _inside_ the type that is already "external", additional
descriptors could also be placed as trailing declarations for fields, property getters, or property setters.

A type does not have to be "external" on every target platform. It will be "external" only for the platforms, whose
tags are present in the descriptor. For the rest of the platforms, it will behave like "normal" generated code.

Platform tags
------------

### C++

Platform tag **cpp** describes "external" behavior for C++ generated code. It supports the following value names:
* **include**: *mandatory value*. Specifies include path(s) for the pre-existing type. Can be either a single path or a
comma-separated list of paths (i.e. a string literal with commas inside, not a list of several string literals).
* **name**: specifies a distinct C++ name (i.e. to have a name that is not derived automatically from the element's name
declared in IDL declaration). For types the name should be fully qualified. This value is also supported for property
accessors (within a type already marked as "external"). For accessors the name does not have to be fully-qualified.
* **getterName**, **setterName**: marks a field in a struct type that is already marked as
external to be accessed through given getter/setter functions instead of directly in C++.

Examples:
```
class ValueContainer {
    external {
        cpp include "include/ValueContainer.h"
    }
    property value: String {
        get external { cpp name "unsafe_value" }
    }
}
```
```
struct StringPair {
    external {
        cpp include "string, utility"
        cpp name "std::pair<std::string, std::string>"
    }
    first: String
    second: String
}
```

### Java

Platform tag **java** describes "external" behavior for Java generated code. It supports the following value names:
* **name**: *mandatory value*. Specifies a full Java name for the pre-existing type (i.e. including package names and
names of outer classes, as it would appear in an `import` statement).
* **getterName**, **setterName**: marks a field in a struct type that is already marked as external to be accessed
through given getter/setter functions instead of directly in Java.
* **converter**: specifies a pre-existing converter class (by its full Java name). A converter class should have two
static functions named `convertToInternal` and `convertFromInternal`, providing conversion between the "external" type
and the generated "internal" helper type (which has package-private visibility). See also `Converters` below.

Example:
```
@Immutable
struct Currency {
    external {
        java name "java.util.Currency"
    }

    currencyCode: String external { java getterName "getCurrencyCode" }
    numericCode: Int external { java getterName "getNumericCode" }
}
```

### Swift

Platform tag **swift** describes "external" behavior for Swift generated code. It supports the following value names:
* **framework**: *mandatory value*. Specifies a name of a Swift framework that needs to be imported for the
pre-existing type. The value can be an empty string `""` if the type resides in the current framework.
* **converter**: specifies a pre-existing converter class. A converter class should have two static functions named
`convertToInternal` and `convertFromInternal`, providing conversion between the "external" type and the generated
"internal" helper type. The argument of each conversion function has to be anonymous (i.e. with `_` argument label).
See also `Converters` below.

If the Swift name of the pre-existing type differs from the name of the LIME definition, it can be specified through the
regular `@Swift("FooBarName")` attribute.

Example:
```
struct DateInterval {
    external {
        swift framework "Foundation"
    }

    start: Date
    end: Date
}
```

### Dart

Platform tag **dart**: describes "external" behavior for Dart generated code. It supports the following value names:
* **importPath**: *mandatory value*. Specifies a full import path for a Dart `import` directive needed for the
pre-existing type (i.e. either `"dart:<library_name>"` or `"package:<path>/<file_name>.dart"`).
* **converter**: specifies a pre-existing converter class. A converter class should have two static functions named
`convertToInternal` and `convertFromInternal`, providing conversion between the "external" type and the generated
"internal" helper type. See also `Converters` below.
* **converterImport**: specifies a relative import path for a Dart `import` directive needed for the pre-existing
converter class (i.e. `"<path>/<file_name>.dart"`).

If the Dart name of the pre-existing type differs from the name of the LIME definition, it can be specified through the
regular `@Dart("FooBarName")` attribute.

Example:
```
@Dart("int")
struct SystemColor {
    external {
       dart importPath "dart:core"
       dart converterImport "../color_converter.dart"
       dart converter "ColorConverter"
    }

    red: Float
    green: Float
    blue: Float
    alpha: Float
}
```

Converters
----------

For "external" structs, if the fields of the pre-existing type match the LIME definition exactly, Gluecodium is capable
to generate Platform<->C++ conversion code automatically. However, it is also possible to represent such struct through
a type with non-matching fields (or even without fields at all). In such case, an additional manually written
"converter" class needs to be provided, to facilitate platform-side conversion between the API-facing type and the
intermediate ("internal") type that still matches the IDL definition. 

Consider the (artificial) example of representing a floating-point-based `Color` struct with an integer in Dart, as
defined in the previous section. The corresponding `ColorConverter` class would look like this:
```dart
class ColorConverter {
  static int convertFromInternal(intInternal internalColor) {
    final alpha = (internalColor.alpha * 255).round() << 24;
    final red = (internalColor.red * 255).round() << 16;
    final green = (internalColor.green * 255).round() << 8;
    final blue = (internalColor.blue * 255).round();
    return alpha + red + green + blue;
  }

  static intInternal convertToInternal(int systemColor) => 
    intInternal(
        ((systemColor >> 16) & 0xFF) / 255.0,
        ((systemColor >> 8) & 0xFF) / 255.0,
        (systemColor & 0xFF) / 255.0,
        ((systemColor >> 24) & 0xFF) / 255.0
    );
}
```

Additional details
------------------

Please note that only one-to-one correspondence between IDL types and "external" types is supported. E.g., defining
two different LIME types with external descriptors pointing to the same C++ type will result in errors.

The way of specifying the name of the external type to use varies slightly between output languages. For C++ and Java it
needs to be a fully-qualified name, and it is specified through `cpp name "..."` and `java name "..."` values of the
external descriptor. For Swift and Dart a regular short name is enough, so it can be specified through `@Swift("...")`
and `@Dart("...")` attributes (or omitted if the name is the name of the type in IDL declaration).

Due to specifics of external type naming mentioned just above, the intermediate internal type which is generated when a
converter is specified has an additional `_internal` suffix to its name in Swift and Dart.
