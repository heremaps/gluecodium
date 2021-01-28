import SharedModule

class UseFoo {
  public init() {
    let foo = CommonMainFoo()
    let bar = MainBar(foo:foo) 
  }
}
