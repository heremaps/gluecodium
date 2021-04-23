//
//
import Foundation
public struct UseOptimizedListStruct {
    public let structs: CollectionOf<VeryBigStruct>
    public let classes: CollectionOf<UnreasonablyLazyClass>
    public init(structs: CollectionOf<VeryBigStruct>, classes: CollectionOf<UnreasonablyLazyClass>) {
        self.structs = structs
        self.classes = classes
    }
    internal init(cHandle: _baseRef) {
        let structs_c_handle = smoke_UseOptimizedListStruct_structs_get(cHandle)
        structs = CollectionOf<VeryBigStruct>(
            handle: structs_c_handle,
            size: smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get_size(structs_c_handle),
            elementGetter: { index in moveFromCType(smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get(structs_c_handle, index)) },
            releaser: { smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_release_handle(structs_c_handle) }
        )
        let classes_c_handle = smoke_UseOptimizedListStruct_classes_get(cHandle)
        classes = CollectionOf<UnreasonablyLazyClass>(
            handle: classes_c_handle,
            size: smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get_size(classes_c_handle),
            elementGetter: { index in UnreasonablyLazyClass_moveFromCType(smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get(classes_c_handle, index)) },
            releaser: { smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_release_handle(classes_c_handle) }
        )
    }
}
internal func copyFromCType(_ handle: _baseRef) -> UseOptimizedListStruct {
    return UseOptimizedListStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> UseOptimizedListStruct {
    defer {
        smoke_UseOptimizedListStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: UseOptimizedListStruct) -> RefHolder {
    let c_structs = RefHolder(swiftType.structs.c_handle)
    let c_classes = RefHolder(swiftType.classes.c_handle)
    return RefHolder(smoke_UseOptimizedListStruct_create_handle(c_structs.ref, c_classes.ref))
}
internal func moveToCType(_ swiftType: UseOptimizedListStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_UseOptimizedListStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> UseOptimizedListStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_UseOptimizedListStruct_unwrap_optional_handle(handle)
    return UseOptimizedListStruct(cHandle: unwrappedHandle) as UseOptimizedListStruct
}
internal func moveFromCType(_ handle: _baseRef) -> UseOptimizedListStruct? {
    defer {
        smoke_UseOptimizedListStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: UseOptimizedListStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_structs = RefHolder(swiftType.structs.c_handle)
    let c_classes = RefHolder(swiftType.classes.c_handle)
    return RefHolder(smoke_UseOptimizedListStruct_create_optional_handle(c_structs.ref, c_classes.ref))
}
internal func moveToCType(_ swiftType: UseOptimizedListStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_UseOptimizedListStruct_release_optional_handle)
}
