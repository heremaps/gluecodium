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
  void my_async_function(_completer_callback, ...);
}
```

The first C++ overload is the same as without the `@Async` attribute. It still should be used for synchronous usages in
Java, Swift, and C++ itself. The second overload is intended for the asynchronous use. This overload does not return any
value. Instead, the return value should be passed to the "completer callback". Same applies to an error value if the
function has a `throws` clause.

The exact signature of the "completer callback" depends on the function's return value and `throws` clause:

* `fun myAsyncFunction(...)` -> `std::function<void()>`
* `fun myAsyncFunction(...): ReturnType` -> `std::function<void(ReturnType /*result*/)>`
* `fun myAsyncFunction(...) throws MyException` -> `std::function<void(bool /*has_value*/, MyException /*error*/)>`
* `fun myAsyncFunction(...): ReturnType throws MyException` -> `std::function<void(bool /*has_value*/, ReturnType /*result*/, MyException /*error*/)>`

All parameters passed to the "completer callback" are transformed into the appropriate state of the `Future` object on
Dart side, allowing for Dart-idiomatic asynchronous usage.
