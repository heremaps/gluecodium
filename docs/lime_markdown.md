LIME IDL documentation comments
===============================

Documentation comments in LIME IDL are meant to document the declared elements and thus are
preserved in the generated code (see [Documentation conventions](documentation_conventions.md) for
details on generated documentation; the current document describes LIME IDL syntax only).

Documentation comments, single-line
-----------------------------------

* Syntax: __//__*text*
* Example:
```
// Process the input in the given mode.
fun process(mode: Mode, input: String): GenericResult
```
* Description: defines a single-line documentation comment. All text after `//` symbols until the
end of the line is taken as the comment text.

Documentation comments, multi-line
----------------------------------

* Syntax: __/\*__*multi-line-text*__\*/__
* Example:
```
/*
Process the input in the given mode.
A lot of multi-line text can be said about it.
*/
fun process(mode: Mode, input: String): GenericResult
```
* Description: defines a multi-line documentation comment. All text after between `/*` and `*/`
symbols is taken as the comment text, including the line breaks.

Structured documentation comments
---------------------------------

Documentation comments also support structured comments for some elements (i.e. specifying comments
for child elements in the comment of the parent element). Structured comments can be specified in
both `//` and `/*` style comments (or even in a combination of those).

### Structured comments for functions

Structured comments are supported for functions. The following syntax is used:
- the lines prepending any annotation are used as description of the function
- `@param[<NAME>]` annotation can be used to document the parameters of the function
- `@return` annotation can be used to document a return value of the function
- `@throws` annotation can be used to document exceptions that are raised

>**Important:** return values (except `Void`) and parameters of functions must be documented. If appropriate comment is
> missing for any parameter or return value, then Gluecodium will raise warning or error depending on `werror` flag.

Example:
```
// Process the input in the given mode.
// A lot of multi-line text can be said about it.
// @param[mode] operational mode
// @param[input] data for processing
// @return a generic result
// @throws if something goes wrong
fun process(mode: Mode, input: String): GenericResult throws SomethingWrongException
```

### Structured comments for properties

Structured comments are supported for properties. The comment must start with annotation.
At the moment the following annotations are supported:
1. `@value` - short description of property (ideally single line); it is used to document getter's
   return value and setter's parameter as well as the declaration of property
2. `@description` - extended information about property that is required to use it correctly
3. `@get` - can be used to describe the getter function
4. `@set` - can be used to describe the setter function

>**Important:** `@value` annotation is required. Return values of getters and parameters of setters must be documented.
> If appropriate documentation comment is missing, then Gluecodium will raise warning or error depending on `werror` flag.

Example:
```
// @value Time interval taken by the processing.
// @description Time interval must be in range [100ms, 1s].
// @get Gets the time interval taken by the processing.
// @set Sets the time interval taken by the processing.
property processingTime: ProcessorHelperTypes.Timestamp
```

### Structured comments for structs

Structured comments for structs allow specifying documentation for the struct's auto-generated
constructor. Example:
```
// Stores various important options.
// @constructor Creates a nice storage for your various very important options.
struct Options {
    // An optional flag to do something useful.
    flagOption: Boolean = false
    // A uint option to specify something more useful.
    uintOption: UShort = 1
    // Additional options to add something more.
    additionalOptions: List<String> = []
}
```

The comment after the `@constructor` tag will be used for the documentation of the constructor. The line above will be
used for the documentation of the struct itself. The parameter documentation of the constructor will use the same
documentation as for the fields of the struct. A default value will make it possible to omit a field from a constructor.

### Structured comments for lambdas

Structured comments for lambdas offer the following capabilities:
- lambda parameters can be documented via `@param[<NAME>]` annotation
- return value of lambda can be documented via `@return` annotation

>**Important:** all parameters and return value (except `Void`) of lambda must be documented. If appropriate documentation
> comment is missing, then Gluecodium will raise warning or error depending on `werror` flag.

For unnamed parameters that have only types specified, positional names can be used to document parameters: `p0`, `p1`,
and so on. For example:
```
// Communicate the date and the message.
// @param[p0] the current date.
// @param[p1] the new message.
// @return whether the operation succeeded.
lambda TimestampCallback = (Date, String) -> Boolean
```
For named parameters use the same syntax as for functions. For example:
```
// Communicate the date and the message.
// @param[currentDate] the current date.
// @param[newMessage] the new message.
// @return whether the operation succeeded.
lambda TimestampCallback = (currentDate: Date, newMessage: String) -> Boolean
```

Formatting in documentation comments
------------------------------------

Markdown-style formatting is supported in documentation comments. It is processed and converted to language-specific
formatting in the generated code, where appropriate (e.g. into HTML formatting in generated JavaDoc). Most commonly used
Markdown features are:
* links (see `Links` below)
* bold/italic/code test formatting
* ordered/unordered lists
* character escaping (see `Character escaping` below)

Links in documentation comments
-------------------------------

Markdown-style links are supported in documentation comments. Example:
```
// Process the input in the given mode, based on [Mode]. For more details, see [example],
// [another example](https://www.example.com/details2), or <https://www.example.com/details3>.
//
// [example]: https://www.example.com/details1
fun process(mode: Mode, input: String): GenericResult
```

There are three ways to specify web links:
1. reference web link, e.g. `[example]` with `[example]: https://www.example.com/details1` listed at the end of the comment.
2. inline web link, e.g. `[another example](https://www.example.com/details2)`.
3. automatic web link, e.g. `<https://www.example.com/details3>`.

Any square-brackets link that does not resolve into a web link is treated as a link to some IDL element, e.g. `[Mode]`.
Please note that all whitespace between the square brackets is ignored during link resolution.

When referring to a function, you can also optionally mention its signature (list of parameter types, but not the return
type), e.g. `[Processor.process(Mode, String)]`. This way you can refer to a specific overload of an overloaded
function. Please not that parameter type names should be simple unqualified names, i.e.
`[Processor.process(Mode, String)]` instead of `[Processor.process(com.example.Processor.Mode, String)]`

When referring to a property element, you can also specifically refer to its getter or its setter by adding `.get` or
`.set` suffix respectively, e.g. `[Processor.secretDelegate.set]`.

Platform-specific comments
--------------------------

Parts of documentation comments can be varied per platform (i.e. per output language). Example:
```
// Process something{@Java  the Java way}. Returns a{@Cpp generic } result
// and throws if something goes wrong{@Swift  but not on iOS}.
fun process(): GenericResult throws SomethingWrongException
```

The resulting documentation will look like this, per language:
* *C++*: `Process something. Returns a generic result and throws if something goes wrong.`
* *Java*: `Process something the Java way. Returns a result and throws if something goes wrong.`
* *Swift*: `Process something. Returns a result and throws if something goes wrong but not on iOS.`
Note that one space after the `@Platform` is treated as separator, everything after that, including
spaces is considered to be part of the comment.

Supported platform tags are `@Cpp`, `@Java`, `@Swift`, and `@Dart`.

Multiple platform tags can be combined in a single `{@ }` section, if necessary:
```
// Process something{@Cpp @Java  the right way}.
```

Placeholder comments
--------------------------
Certain syntax may be used very often when documenting code. Let's look at the following example:
```
// This is {@Java interface}{@Swift protocol}{@Dart abstract class}{@Cpp abstract class}.
```

The type used to represent an interface can have different names depending on the output language.
To avoid repeating such complicated syntax the placeholders can be specified and used e.g.:
```
// This is {@Placeholder interfaceString}.
```

The syntax above instructs Gluecodium to insert the content of placeholder with name `interfaceString`
into the selected place.

The content of placeholders is specified via properties file, which is then supplied when invoking
generator via `-docsplaceholderslist` CLI parameter or `GLUECODIUM_DOCS_PLACEHOLDERS_FILES` and `GLUECODIUM_DOCS_PLACEHOLDERS` CMake parameters.

Each placeholder needs to be defined as `<PLACEHOLDER_NAME>="<PLACEHOLDER_VALUE>"`.
Please notice the usage of quotation - it is required. Moreover, if multiline string needs to be defined then
appropriate line end must be defined according to '.properties' format and newline must be escaped via `\n`:
```
some_multiline="This \
  is the first line!\n \
  This is the second line."
```

In the case of `interfaceString` placeholder the file content may look like this:
```
interfaceString="{@Java interface}{@Swift protocol}{@Dart abstract class}{@Cpp abstract class}"
```

Character escaping in documentation comments
--------------------------------------------

Special characters `@`, `{`, `}`, `[`, `]`, and `\` can be used in documentation comments only if they are
"escaped" with an additional backslash (i.e. `\@`, `\{`, `\}`, `\[`, `\]`, and `\\` respectively).

Excluding an element from documentation
---------------------------------------

Documentation comments support a special `@exclude` tag. This tag is converted into a language-appropriate "exclude from
the documentation" tag in the generated code. When using this tag, it should be placed on a separate line of its own
within the IDL documentation comment.
