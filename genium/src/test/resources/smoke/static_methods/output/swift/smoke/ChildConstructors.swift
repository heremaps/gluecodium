//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ChildConstructors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildConstructors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildConstructors_release_handle)
        : RefHolder(handle_copy)
}
public class ChildConstructors: Constructors {
    public override init() {
        let _result = ChildConstructors.create()
        super.init(cConstructors: _result)
    }
    public override init(other: Constructors?) {
        let _result = ChildConstructors.create(other: other)
        super.init(cConstructors: _result)
    }
    init(cChildConstructors: _baseRef) {
        super.init(cConstructors: cChildConstructors)
    }
    private static func create() -> _baseRef {
        return moveFromCType(smoke_ChildConstructors_create_noArgsChild())
    }
    private static func create(other: Constructors?) -> _baseRef {
        let other_handle = getRef(other)
        return moveFromCType(smoke_ChildConstructors_create_copyFromParent(other_handle.ref))
    }
}