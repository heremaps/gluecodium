import CustomName
import ModuleWithMainOnly

class UseFoo {
  public init() {
    let foo = CommonMainFoo()
    let _ = MainBar(foo: foo)
  }
}
