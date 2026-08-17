Asynchronous functions
======================

`@Async` attribute on a function marks it to be generated with support for asynchronous invocation.

Limitations
-----------

* This feature is currently *experimental*. There might be bugs and/or breaking changes later.
* Currently, only works for Dart (with an additional support function generated in C++). `@Async` attribute has no
effect on Java, Kotlin or Swift.
* Can be used with instance functions and non-constructor static functions. Cannot be used with constructors,
properties, or lambdas.
* Can be used inside classes or structs. Cannot be used in interfaces.

Dart usage
----------

```
class MyClass {
    @Async
    fun myAsyncFunction(...): ReturnType
}
```

This LIME IDL definition will result in the following Dart code being generated:

```dart
class AsyncClass {
  Future<ReturnType> myAsyncFunction(...);
}
```

This allows idiomatic asynchronous usage of the generated function in Dart: either with `async/await` mechanism, or with
`Future.then()` chains.

If the function's LIME IDL declaration has a `throws` clause, the appropriate async error handling mechanism should be
used on Dart side (`try/catch` for `async/await` or `Future.catchError()` for `then` chains).

C++ usage
---------

```
class MyClass {
    @Async
    fun myAsyncFunction(...): ReturnType
}
```

This LIME IDL definition will result in the following C++ code being generated:

```
class AsyncClass {
  ReturnType my_async_function(...);
  void my_async_function(_result_callback, _error_callback, ...);
}
```

>**Note:** if the function or whole type is generated only for C++ and Dart
> and other platforms are skipped via `@Skip(Java)`, `@Skip(Kotlin)` and `@Skip(Swift)`
> then only asynchronous version of the method is generated.

The first C++ overload is the same as without the `@Async` attribute. It still should be used for synchronous usages in
Java, Swift, and C++ itself. The second overload is intended for the asynchronous use. This overload does not return any
value. Instead:
* The return value should be passed to the "result callback".
* If the return type is `Void`, the "result callback" still needs to be called.
* If the function has a `throws` clause, the error value, if present, should be passed to the "error callback".
* Calling *both* callbacks in the same code path is invalid and leads to an exception being thrown at the receiving side.

All parameters passed to the "result callback" or "error callback" are transformed into the appropriate state of the
`Future` object on Dart side, allowing for Dart-idiomatic asynchronous usage.

Async decorator usage
---------------------

`@AsyncDecorator` adapts an existing callback-based API into an idiomatic asynchronous API on the target platform.
Unlike `@Async`, it does not add C++ functions or change the JNI contract: it only describes the callback shape
(callback parameter, error/result members, cancellation) so a generator can emit a wrapper.

The attribute itself is platform-agnostic. Currently only the Kotlin generator consumes it, emitting `suspend`
extension functions; other generators ignore it.

Runtime behaviour of the generated wrappers is currently validated only by the `android-kotlin` functional tests in
`functional-tests/functional/android-kotlin`, so the semantics described below are exercised for Kotlin alone.

The generated wrappers use `kotlinx.coroutines`, so a project that enables `@AsyncDecorator` has to put
`kotlinx-coroutines-core` (or `kotlinx-coroutines-android`) on the Kotlin runtime classpath.

### One-shot callbacks

Mark the function, its callback parameter, and any callback error/result members:

```lime
lambda FetchCallback = (
  error: @AsyncDecorator(Error) FetchError?,
  value: @AsyncDecorator(Result) String?
) -> Void

class Client {
  @AsyncDecorator
  fun fetch(@AsyncDecorator(Callback) callback: FetchCallback): TaskHandle
}
```

This generates a top-level Kotlin extension function such as:

```kotlin
public suspend fun Client.fetch(): String
```

The generated shape depends on the callback:

* An `Error` member produces `Result<T>` and a typed `<FunctionName>Exception` failure.
* No `Error` member produces a non-throwing direct `T` return value.
* No result members produce `Unit` (or `Result<Unit>` when an error member exists).
* Multiple `Result` members produce a named `<FunctionName>CoroutineResult` data class.
* `@AsyncDecorator(Default)` on a non-callback function parameter generates `= Type()` in the Kotlin wrapper, so
  that parameter's type has to be constructible without arguments: for example a struct declared with
  `@Kotlin(PositionalDefaults)` whose fields all have default values.
* `@AsyncDecorator(Name = "fetchValue")` overrides the generated extension function name without renaming the callback API.
* A returned type annotated `@AsyncTaskHandle` is cancelled when the coroutine is cancelled; its optional `Name` value
  names the cancel function, defaulting to a parameterless `cancel`. Functions without such a handle remain
  non-cancellable.

When an error member exists, the error and result members must be nullable because the callback contract is exactly one
of error or success. Multiple result members can all be marked with `@AsyncDecorator(Result)`.
