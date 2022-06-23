Asynchronous functions
======================

`@Async` attribute on a function marks it to be generated with support for asynchronous invocation.

Limitations
-----------

* This feature is currently *experimental*. There might be bugs and/or breaking changes later.
* Currently, only works for Dart (with an additional support function generated in C++). `@Async` attribute has no
effect on Java or Swift.
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

The first C++ overload is the same as without the `@Async` attribute. It still should be used for synchronous usages in
Java, Swift, and C++ itself. The second overload is intended for the asynchronous use. This overload does not return any
value. Instead:
* The return value should be passed to the "result callback".
* If the return type is `Void`, the "result callback" still needs to be called.
* If the function has a `throws` clause, the error value, if present, should be passed to the "error callback".
* Calling *both* callbacks in the same code path is invalid and leads to an exception being thrown at the receiving side.

All parameters passed to the "result callback" or "error callback" are transformed into the appropriate state of the
`Future` object on Dart side, allowing for Dart-idiomatic asynchronous usage.
