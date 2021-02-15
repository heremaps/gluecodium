//
//
import Foundation
public class GenericTypesWithGenericTypes {
    let c_instance : _baseRef
    init(cGenericTypesWithGenericTypes: _baseRef) {
        guard cGenericTypesWithGenericTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cGenericTypesWithGenericTypes
    }
    deinit {
        smoke_GenericTypesWithGenericTypes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_GenericTypesWithGenericTypes_release_handle(c_instance)
    }
    public func methodWithListOfLists(input: [[Int32]]) -> [[Int32]] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithGenericTypes_methodWithListOfLists(self.c_instance, c_input.ref))
    }
    public func methodWithMapOfMaps(input: [Int32: [Int32: Bool]]) -> [[Int32: Bool]: Bool] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithGenericTypes_methodWithMapOfMaps(self.c_instance, c_input.ref))
    }
    public func methodWithSetOfSets(input: Set<Set<Int32>>) -> Set<Set<Int32>> {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithGenericTypes_methodWithSetOfSets(self.c_instance, c_input.ref))
    }
    public func methodWithListAndMap(input: [[Int32: Bool]]) -> [Int32: [Int32]] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithGenericTypes_methodWithListAndMap(self.c_instance, c_input.ref))
    }
    public func methodWithListAndSet(input: [Set<Int32>]) -> Set<[Int32]> {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithGenericTypes_methodWithListAndSet(self.c_instance, c_input.ref))
    }
    public func methodWithMapAndSet(input: [Int32: Set<Int32>]) -> Set<[Int32: Bool]> {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithGenericTypes_methodWithMapAndSet(self.c_instance, c_input.ref))
    }
    public func methodWithMapGenericKeys(input: [Set<Int32>: Bool]) -> [[Int32]: Bool] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithGenericTypes_methodWithMapGenericKeys(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: GenericTypesWithGenericTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_GenericTypesWithGenericTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_GenericTypesWithGenericTypes_release_handle)
        : RefHolder(handle_copy)
}
extension GenericTypesWithGenericTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension GenericTypesWithGenericTypes: Hashable {
    /// :nodoc:
    public static func == (lhs: GenericTypesWithGenericTypes, rhs: GenericTypesWithGenericTypes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func GenericTypesWithGenericTypes_copyFromCType(_ handle: _baseRef) -> GenericTypesWithGenericTypes {
    if let swift_pointer = smoke_GenericTypesWithGenericTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? GenericTypesWithGenericTypes {
        return re_constructed
    }
    let result = GenericTypesWithGenericTypes(cGenericTypesWithGenericTypes: smoke_GenericTypesWithGenericTypes_copy_handle(handle))
    smoke_GenericTypesWithGenericTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func GenericTypesWithGenericTypes_moveFromCType(_ handle: _baseRef) -> GenericTypesWithGenericTypes {
    if let swift_pointer = smoke_GenericTypesWithGenericTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? GenericTypesWithGenericTypes {
        smoke_GenericTypesWithGenericTypes_release_handle(handle)
        return re_constructed
    }
    let result = GenericTypesWithGenericTypes(cGenericTypesWithGenericTypes: handle)
    smoke_GenericTypesWithGenericTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func GenericTypesWithGenericTypes_copyFromCType(_ handle: _baseRef) -> GenericTypesWithGenericTypes? {
    guard handle != 0 else {
        return nil
    }
    return GenericTypesWithGenericTypes_moveFromCType(handle) as GenericTypesWithGenericTypes
}
internal func GenericTypesWithGenericTypes_moveFromCType(_ handle: _baseRef) -> GenericTypesWithGenericTypes? {
    guard handle != 0 else {
        return nil
    }
    return GenericTypesWithGenericTypes_moveFromCType(handle) as GenericTypesWithGenericTypes
}
internal func copyToCType(_ swiftClass: GenericTypesWithGenericTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: GenericTypesWithGenericTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: GenericTypesWithGenericTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: GenericTypesWithGenericTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
