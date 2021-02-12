//
//
import Foundation
public class GenericTypesWithBasicTypes {
    public typealias BasicList = [String]
    public typealias BasicMap = [String: String]
    public typealias BasicSet = Set<String>
    public var listProperty: [Float] {
        get {
            return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_listProperty_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_GenericTypesWithBasicTypes_listProperty_set(self.c_instance, c_value.ref))
        }
    }
    public var mapProperty: [Float: Double] {
        get {
            return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_mapProperty_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_GenericTypesWithBasicTypes_mapProperty_set(self.c_instance, c_value.ref))
        }
    }
    public var setProperty: Set<Float> {
        get {
            return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_setProperty_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_GenericTypesWithBasicTypes_setProperty_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cGenericTypesWithBasicTypes: _baseRef) {
        guard cGenericTypesWithBasicTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cGenericTypesWithBasicTypes
    }
    deinit {
        smoke_GenericTypesWithBasicTypes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_GenericTypesWithBasicTypes_release_handle(c_instance)
    }
    public struct StructWithGenerics {
        public var numbersList: [UInt8]
        public var numbersMap: [UInt8: String]
        public var numbersSet: Set<UInt8>
        public init(numbersList: [UInt8], numbersMap: [UInt8: String], numbersSet: Set<UInt8>) {
            self.numbersList = numbersList
            self.numbersMap = numbersMap
            self.numbersSet = numbersSet
        }
        internal init(cHandle: _baseRef) {
            numbersList = foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_StructWithGenerics_numbersList_get(cHandle))
            numbersMap = foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_StructWithGenerics_numbersMap_get(cHandle))
            numbersSet = foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_StructWithGenerics_numbersSet_get(cHandle))
        }
    }
    public func methodWithList(input: [Int32]) -> [Int32] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_methodWithList(self.c_instance, c_input.ref))
    }
    public func methodWithMap(input: [Int32: Bool]) -> [Int32: Bool] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_methodWithMap(self.c_instance, c_input.ref))
    }
    public func methodWithSet(input: Set<Int32>) -> Set<Int32> {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_methodWithSet(self.c_instance, c_input.ref))
    }
    public func methodWithListTypeAlias(input: GenericTypesWithBasicTypes.BasicList) -> GenericTypesWithBasicTypes.BasicList {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias(self.c_instance, c_input.ref))
    }
    public func methodWithMapTypeAlias(input: GenericTypesWithBasicTypes.BasicMap) -> GenericTypesWithBasicTypes.BasicMap {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias(self.c_instance, c_input.ref))
    }
    public func methodWithSetTypeAlias(input: GenericTypesWithBasicTypes.BasicSet) -> GenericTypesWithBasicTypes.BasicSet {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: GenericTypesWithBasicTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_GenericTypesWithBasicTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_GenericTypesWithBasicTypes_release_handle)
        : RefHolder(handle_copy)
}
extension GenericTypesWithBasicTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension GenericTypesWithBasicTypes: Hashable {
    // :nodoc:
    public static func == (lhs: GenericTypesWithBasicTypes, rhs: GenericTypesWithBasicTypes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func GenericTypesWithBasicTypes_copyFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes {
    if let swift_pointer = smoke_GenericTypesWithBasicTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? GenericTypesWithBasicTypes {
        return re_constructed
    }
    let result = GenericTypesWithBasicTypes(cGenericTypesWithBasicTypes: smoke_GenericTypesWithBasicTypes_copy_handle(handle))
    smoke_GenericTypesWithBasicTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func GenericTypesWithBasicTypes_moveFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes {
    if let swift_pointer = smoke_GenericTypesWithBasicTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? GenericTypesWithBasicTypes {
        smoke_GenericTypesWithBasicTypes_release_handle(handle)
        return re_constructed
    }
    let result = GenericTypesWithBasicTypes(cGenericTypesWithBasicTypes: handle)
    smoke_GenericTypesWithBasicTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func GenericTypesWithBasicTypes_copyFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes? {
    guard handle != 0 else {
        return nil
    }
    return GenericTypesWithBasicTypes_moveFromCType(handle) as GenericTypesWithBasicTypes
}
internal func GenericTypesWithBasicTypes_moveFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes? {
    guard handle != 0 else {
        return nil
    }
    return GenericTypesWithBasicTypes_moveFromCType(handle) as GenericTypesWithBasicTypes
}
internal func copyToCType(_ swiftClass: GenericTypesWithBasicTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: GenericTypesWithBasicTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: GenericTypesWithBasicTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: GenericTypesWithBasicTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes.StructWithGenerics {
    return GenericTypesWithBasicTypes.StructWithGenerics(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes.StructWithGenerics {
    defer {
        smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: GenericTypesWithBasicTypes.StructWithGenerics) -> RefHolder {
    let c_numbersList = foobar_moveToCType(swiftType.numbersList)
    let c_numbersMap = foobar_moveToCType(swiftType.numbersMap)
    let c_numbersSet = foobar_moveToCType(swiftType.numbersSet)
    return RefHolder(smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle(c_numbersList.ref, c_numbersMap.ref, c_numbersSet.ref))
}
internal func moveToCType(_ swiftType: GenericTypesWithBasicTypes.StructWithGenerics) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes.StructWithGenerics? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_GenericTypesWithBasicTypes_StructWithGenerics_unwrap_optional_handle(handle)
    return GenericTypesWithBasicTypes.StructWithGenerics(cHandle: unwrappedHandle) as GenericTypesWithBasicTypes.StructWithGenerics
}
internal func moveFromCType(_ handle: _baseRef) -> GenericTypesWithBasicTypes.StructWithGenerics? {
    defer {
        smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: GenericTypesWithBasicTypes.StructWithGenerics?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_numbersList = foobar_moveToCType(swiftType.numbersList)
    let c_numbersMap = foobar_moveToCType(swiftType.numbersMap)
    let c_numbersSet = foobar_moveToCType(swiftType.numbersSet)
    return RefHolder(smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_optional_handle(c_numbersList.ref, c_numbersMap.ref, c_numbersSet.ref))
}
internal func moveToCType(_ swiftType: GenericTypesWithBasicTypes.StructWithGenerics?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_optional_handle)
}
