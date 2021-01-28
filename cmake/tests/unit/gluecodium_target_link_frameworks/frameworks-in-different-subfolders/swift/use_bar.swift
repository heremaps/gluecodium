import ModuleWithMainOnly

class UseFoo {
  public init() {
    let foo = CommonMainFoo()
    let bar = MainBar(foo: foo)
  }
}
