Naming conventions for the generated code
=========================================

This document discusses the transformations applied to entity names in the generated code and the
naming conventions governing these transformations.

LimeIDL names
-------------------

### Entity names
Entity names supplied in the LimeIDL definitions are used as a source for the entity names in the
generated code. Both snake_case and camelCase naming conventions are recognized in the LimeIDL
definitions (both conventions with both lowercase and UPPERCASE variations).

### Circumventing LimeIDL reserved words
LimeIDL has some reserved words that are not reserved in target languages (e.g. "exception"). Using
these words as identifiers in a LimeIDL file results in validation failures during code generation.
To get around this limitation, the identifier can be put in \`backticks\` (e.g. \`exception\`).

Custom name rules
-----------------

The default name rules for Java, Swift and C++ can be customized by providing the path to a name rules
properties file. These can be passed via `-javanamerules`, `-swiftnamerules` or `-cppnamerules`
command line parameters.

Example custom `cpp.properties`:

```
field=lower_snake_case
field.prefix=m
parameter=lowerCamelCase
constant=UPPER_SNAKE_CASE
type=UpperCamelCase
```

Each of the name types accepts one of the basic formats `lower_snake_case`, `UPPER_SNAKE_CASE`,
`lowerCamelCase` or `UpperCamelCase`. Each of those name types (except for `method`) can have a
fixed `prefix` and/or `suffix`. Additionally for `getter` a special `prefix.boolean` for Boolean
properties is possible. The prefixes and suffixes are added to the main name according to the
specified format.
These are all supported name types in the name config file are:

| Name Type     | Description
| --------------|--------------
| `field`       | Fields of structs
| `parameter`   | Method parameters
| `constant`    | Constants in interfaces and structs
| `enumerator`  | Enum items
| `method`      | Method names (no prefix or suffix supported)
| `type`        | Struct, Interface and Enum names
| `property`    | Property name (only Swift)
| `setter`      | Setter name for an property (only Java, C++)
| `getter`      | Getter name for an property (only Java, C++)
| `error`       | Exception/Error name (only Java, Swift)

If one of the properties is not set in the custom rules, the default is applied.

Default C++ names
-----------------

### General naming conventions
* Type names are in UpperCamelCase.
* Method and variable names are in lower_snake_case.
* Constant and enumerator names are in UPPER_SNAKE_CASE.

### Property names
* Property getter names are prefixed with `get_`, unless it's a Boolean property.
* Boolean property getter names are prefixed with `is_`.
* Property setter names are prefixed with `set_`.

### Default namerules/cpp.properties
```
field=lower_snake_case
parameter=lower_snake_case
constant=UPPER_SNAKE_CASE
enumerator=UPPER_SNAKE_CASE
method=lower_snake_case
setter=lower_snake_case
setter.prefix=set
getter=lower_snake_case
getter.prefix=get
getter.prefix.boolean=is
type=UpperCamelCase
```

Default Java names
----------

### General naming conventions
* Type names are in UpperCamelCase.
* Method and variable names are in lowerCamelCase.
* Constant and enumerator names are in UPPER_SNAKE_CASE.

### Property names
* Property getter names are prefixed with `get`, unless it's a Boolean property.
* Boolean property getter names are prefixed with `is`.
* Property setter names are prefixed with `set`.

### Method overloads ambiguity resolution
Arrays and Maps defined in IDL definition are generated as List<> and Map<> generics in Java
respectively. Since Java language applies type erasure to its generics, declaring two method
overloads that differ only in the parameters of the generic (e.g. element type of the array) leads
to a compile-time error. This can be resolved manually at LimeIDL level by specifying alternative
names for these conflicting methods through marking them with `@Java("<method-name>")` attribute in
the IDL definition.

### Default namerules/java.properties
```
field=lowerCamelCase
parameter=lowerCamelCase
constant=UPPER_SNAKE_CASE
enumerator=UPPER_SNAKE_CASE
method=lowerCamelCase
setter=lowerCamelCase
setter.prefix=set
getter=lowerCamelCase
getter.prefix=get
getter.prefix.boolean=is
type=UpperCamelCase
error=UpperCamelCase
error.suffix=Exception

```

Default Swift names
-----------

### General naming conventions
* Type names are in UpperCamelCase.
* Method and variable names are in lowerCamelCase.
* Constant and enumerator names are in lowerCamelCase.

### Property names
Properties are generated as properties in Swift:
* Property names have no prefix, unless it's a Boolean property.
* Boolean property names are prefixed with `is`.

### Default namerules/swift.properties
```
field=lowerCamelCase
parameter=lowerCamelCase
constant=lowerCamelCase
enumerator=lowerCamelCase
method=lowerCamelCase
property=lowerCamelCase
property.prefix.boolean=is
type=UpperCamelCase
error=UpperCamelCase
error.suffix=Error

```
