# React Native generator

The `react-native` generator turns a LIME IDL into a [React Native TurboModule](https://reactnative.dev/docs/turbo-native-modules-introduction)
binding for a **pre-built** native library exposed through a C foreign-function interface (FFI). It
emits three coordinated layers, all derived from the same LIME model:

1. **TurboModule TypeScript specs** — the typed `Native*Module` interfaces React Native Codegen
   consumes (paired with the `typescript` generator).
2. **C++ JSI bridges** — `Native*Module.cpp/.h` that marshal between JSI values and the FFI, calling
   the `<libraryname>_*` C functions resolved at link time from the pre-built binary.
3. **Idiomatic TypeScript wrapper** — the `wrapper/` classes application code imports; consumers
   never touch the raw specs.

The generator is **product-neutral**: it contains no library-specific identifiers and is retargeted
entirely through flags. It works for any LIME input.

## Flags

| Flag | Purpose |
|---|---|
| `-generators react-native,typescript` | Enable the RN bridge + the TS spec/wrapper generators (used together). |
| `-libraryname <name>` | The FFI symbol prefix and TypeScript base/error class names. `-libraryname acme_sdk` yields `acme_sdk_*` C symbols, `AcmeSdkError`, `_AcmeSdkBase`, and namespace-free JS. This is the primary retargeting lever. |
| `-cppnamespace <ns>` | C++ namespace for generated types. |
| `-intnamespace <ns>` (a.k.a. `-internalprefix`) | Internal prefix applied to generic-collection FFI names, e.g. `gluecodium` → `<lib>_gluecodiumListOf_*`, `<lib>_gluecodiumMapOf_*`. Must match the prefix the pre-built binary was generated with. |
| `-sharedenginetype <TypeName>` | Names the class whose static factory is the process-wide shared engine. Its factory stores the raw engine handle (`setSharedEngineRaw`) so sub-engine factories can retrieve it. Omit if there is no shared engine. |
| `-tag react-native` | Selects LIME elements tagged for the React Native surface. |
| `-docsplaceholderslist <file>` | Placeholder substitutions for structured-comment docs. |

## Supported LIME features

| Feature | Support | Notes |
|---|---|---|
| Basic types, enums, constants | ✅ | Numbers map to `number` (JSI `double`); enums to `number` ordinals. |
| Classes, instance & static methods | ✅ | Instances are opaque handle strings in a JS-side registry. |
| Constructors / factories | ✅ | Primary `make()` → wrapper `constructor`; a no-arg native factory also gets `fromDefaults()`; named factories become named static wrapper methods. |
| Structs & struct field getters | ✅ | Field getters marshal per type; a struct with no exposed constructor gets a synthesized `make(<fields>)`. |
| Nullable fields/params/returns | ✅ | String, date, object, primitive. Nullable Date/Duration reuse the exported `ULong` optional box (ABI-identical `std::optional<uint64_t>`). |
| `List<T>` / `Set<T>` | ✅ | Marshalled to/from `ReadonlyArray<T>` (spec) / `readonly T[]` (wrapper); class elements reconstruct via `_fromHandle`. |
| `Map<K,V>` | ✅ | Crosses the boundary as an array of `[key, value]` tuples (`ReadonlyArray<[K, V]>`); the wrapper re-exposes a real `Map<K,V>`. Primitive key/value sides use the by-value FFI ABI (`put(handle, K, V)`, `iterator_get_key : K`, `iterator_get_value : V`); String/complex sides pass as handles. |
| Lambdas / callbacks (0–4 params) | ✅ | Marshalled through a `create_proxy` callback slot; list/set callback params unwrap into arrays. |
| Single-method interface listeners (≤3 params) | ✅ | Passed as a `jsi::Function` callback proxy. |
| Multi-method interface listeners | ✅ | All-void, no-property interfaces are passed as a JS object of optional callbacks (one slot per method). |
| Interface-typed object parameters | ✅ | An existing native object (not a listener) is passed as its registry handle, retrieved and null-checked before the FFI call. |
| Interface inheritance | ✅ | Inherited methods and properties are emitted with consistent effective names across all three layers. |
| Overload disambiguation | ✅ | Overloaded (incl. inherited) methods use the LIME `@Dart(Name)` effective name uniformly in bridge, spec, and wrapper. |
| Throwing methods | ✅ | Rejected/thrown as a typed error carrying the operation context. |
| Shared engine | ✅ | Via `-sharedenginetype`. |

## Runtime model

* **Handles.** Non-primitive values cross the JSI boundary as string keys into a C++ handle registry
  (`FfiHandleRegistry`). The wrapper hides this behind `_toHandle()` / `_fromHandle()`.
* **Generic collections.** List/Set/Map FFI symbols are named
  `<libraryname><intnamespace>ListOf_… / SetOf_… / MapOf_<K>_to_<V>_…`. When a pre-built library
  exports these under a different per-module name, a thin forwarding shim maps the canonical
  generated names onto the exported ones (this is a *linking* concern of the consuming project, not
  of the generator).
* **Callbacks.** Each registration acquires a callback slot; the proxy marshals FFI payloads into
  owned C++ on the callback thread, then rebuilds JSI values on the JS thread inside `invokeAsync`.

## Limitations

* The generated bridge targets a **pre-built** binary; the generator does not compile the native
  library. Its FFI declarations must match the ABI the binary exposes (hence `-intnamespace` must
  match how the binary's generic collections were named).
* Callback/listener arities above 4 (lambdas) / 3 (single-method listeners) are not proxied.
* A standalone `interface` does not produce its own TurboModule; interfaces are marshalled inline
  where a class/struct references them as a parameter or return type.
* JSI represents all numbers as `double`; 64-bit integer precision beyond 2^53 is not preserved.
* `Map` keys/values that are themselves collections are not supported (no nested-collection map
  sides).

## Retargeting to another product

The generator ships no product identifiers. To bind a different library:

```sh
gluecodium \
  -input path/to/lime \
  -output out \
  -generators react-native,typescript \
  -libraryname my_product \
  -cppnamespace my_product \
  -intnamespace gluecodium \
  -sharedenginetype MyEngine \
  -tag react-native
```

This yields `my_product_*` FFI symbols, `MyProductError` / `_MyProductBase`, and an idiomatic
wrapper for the `my_product` library — with no changes to the generator sources.

## Genericity guarantees & tests

* Golden tests over a **product-neutral** LIME fixture library
  (`ReactNativeNeutralFixtureLibraryTest`, `NeutralLimeFixtures`) exercise nullable fields,
  List/Set/Map collections, callbacks, single- and multi-method listeners, interface inheritance,
  shared-engine factories, and synthetic struct makes — with no product-specific names.
* Focused capability golden tests cover overload name resolution, interface-object parameters,
  inherited interface properties, nullable-field constructors, wrapper factories, shared-engine
  factory error accessors, and `Map<K,V>` marshalling.
* Consuming projects should enforce that the generator sources stay product-neutral (a CI grep for
  product identifiers), so genericity does not regress.
