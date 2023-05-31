//

//

import Foundation

public class ClassWithStructWithSkipLambdaInPlatform {


    let c_instance : _baseRef

    init(cClassWithStructWithSkipLambdaInPlatform: _baseRef) {
        guard cClassWithStructWithSkipLambdaInPlatform != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cClassWithStructWithSkipLambdaInPlatform
    }

    deinit {
        smoke_ClassWithStructWithSkipLambdaInPlatform_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ClassWithStructWithSkipLambdaInPlatform_release_handle(c_instance)
    }

    public struct SkipLambdaInPlatform {

        public var intField: Int32

        public init(intField: Int32) {
            self.intField = intField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_intField_get(cHandle))
        }
    }


}



internal func getRef(_ ref: ClassWithStructWithSkipLambdaInPlatform?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ClassWithStructWithSkipLambdaInPlatform_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ClassWithStructWithSkipLambdaInPlatform_release_handle)
        : RefHolder(handle_copy)
}

extension ClassWithStructWithSkipLambdaInPlatform: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension ClassWithStructWithSkipLambdaInPlatform: Hashable {
    /// :nodoc:
    public static func == (lhs: ClassWithStructWithSkipLambdaInPlatform, rhs: ClassWithStructWithSkipLambdaInPlatform) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func ClassWithStructWithSkipLambdaInPlatform_copyFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform {
    if let swift_pointer = smoke_ClassWithStructWithSkipLambdaInPlatform_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ClassWithStructWithSkipLambdaInPlatform {
        return re_constructed
    }
    let result = ClassWithStructWithSkipLambdaInPlatform(cClassWithStructWithSkipLambdaInPlatform: smoke_ClassWithStructWithSkipLambdaInPlatform_copy_handle(handle))
    smoke_ClassWithStructWithSkipLambdaInPlatform_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func ClassWithStructWithSkipLambdaInPlatform_moveFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform {
    if let swift_pointer = smoke_ClassWithStructWithSkipLambdaInPlatform_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ClassWithStructWithSkipLambdaInPlatform {
        smoke_ClassWithStructWithSkipLambdaInPlatform_release_handle(handle)
        return re_constructed
    }
    let result = ClassWithStructWithSkipLambdaInPlatform(cClassWithStructWithSkipLambdaInPlatform: handle)
    smoke_ClassWithStructWithSkipLambdaInPlatform_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func ClassWithStructWithSkipLambdaInPlatform_copyFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform? {
    guard handle != 0 else {
        return nil
    }
    return ClassWithStructWithSkipLambdaInPlatform_moveFromCType(handle) as ClassWithStructWithSkipLambdaInPlatform
}
internal func ClassWithStructWithSkipLambdaInPlatform_moveFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform? {
    guard handle != 0 else {
        return nil
    }
    return ClassWithStructWithSkipLambdaInPlatform_moveFromCType(handle) as ClassWithStructWithSkipLambdaInPlatform
}

internal func copyToCType(_ swiftClass: ClassWithStructWithSkipLambdaInPlatform) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: ClassWithStructWithSkipLambdaInPlatform) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: ClassWithStructWithSkipLambdaInPlatform?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: ClassWithStructWithSkipLambdaInPlatform?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform {
    return ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform {
    defer {
        smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform) -> RefHolder {
    let c_intField = moveToCType(swiftType.intField)
    return RefHolder(smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_handle(c_intField.ref))
}
internal func moveToCType(_ swiftType: ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_unwrap_optional_handle(handle)
    return ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform(cHandle: unwrappedHandle) as ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform
}
internal func moveFromCType(_ handle: _baseRef) -> ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform? {
    defer {
        smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    return RefHolder(smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_optional_handle(c_intField.ref))
}
internal func moveToCType(_ swiftType: ClassWithStructWithSkipLambdaInPlatform.SkipLambdaInPlatform?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_optional_handle)
}



