//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal class BasicStructList: CollectionOf<Arrays.BasicStruct> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_BasicStruct_count(c_element))
    }
    deinit {
        arrayCollection_BasicStruct_release_handle(c_element!)
    }
    public override subscript(index: Int) -> Arrays.BasicStruct {
        let handle = arrayCollection_BasicStruct_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.BasicStruct> {
    return BasicStructList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.BasicStruct> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.BasicStruct {
    let handle = arrayCollection_BasicStruct_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_BasicStruct_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.BasicStruct {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_BasicStruct_release_handle)
}
internal class ExternalEnumList: CollectionOf<Arrays.ExternalEnum> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_ExternalEnum_count(c_element))
    }
    deinit {
        arrayCollection_ExternalEnum_release_handle(c_element!)
    }
    public override subscript(index: Int) -> Arrays.ExternalEnum {
        let handle = arrayCollection_ExternalEnum_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalEnum> {
    return ExternalEnumList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalEnum> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.ExternalEnum {
    let handle = arrayCollection_ExternalEnum_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_ExternalEnum_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.ExternalEnum {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_ExternalEnum_release_handle)
}
internal class ExternalStructList: CollectionOf<Arrays.ExternalStruct> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_ExternalStruct_count(c_element))
    }
    deinit {
        arrayCollection_ExternalStruct_release_handle(c_element!)
    }
    public override subscript(index: Int) -> Arrays.ExternalStruct {
        let handle = arrayCollection_ExternalStruct_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalStruct> {
    return ExternalStructList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalStruct> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.ExternalStruct {
    let handle = arrayCollection_ExternalStruct_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_ExternalStruct_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.ExternalStruct {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_ExternalStruct_release_handle)
}
internal class FancyStructList: CollectionOf<Arrays.FancyStruct> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_FancyStruct_count(c_element))
    }
    deinit {
        arrayCollection_FancyStruct_release_handle(c_element!)
    }
    public override subscript(index: Int) -> Arrays.FancyStruct {
        let handle = arrayCollection_FancyStruct_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.FancyStruct> {
    return FancyStructList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.FancyStruct> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.FancyStruct {
    let handle = arrayCollection_FancyStruct_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_FancyStruct_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.FancyStruct {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_FancyStruct_release_handle)
}
internal class SomeEnumList: CollectionOf<Arrays.SomeEnum> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_SomeEnum_count(c_element))
    }
    deinit {
        arrayCollection_SomeEnum_release_handle(c_element!)
    }
    public override subscript(index: Int) -> Arrays.SomeEnum {
        let handle = arrayCollection_SomeEnum_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.SomeEnum> {
    return SomeEnumList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.SomeEnum> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.SomeEnum {
    let handle = arrayCollection_SomeEnum_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_SomeEnum_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.SomeEnum {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_SomeEnum_release_handle)
}
internal class ArraysErrorCodeToMessageMapList: CollectionOf<Arrays.ErrorCodeToMessageMap> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_Int32StringMap_count(c_element))
    }
    deinit {
        arrayCollection_Int32StringMap_release_handle(c_element!)
    }
    public override subscript(index: Int) -> Arrays.ErrorCodeToMessageMap {
        let handle = arrayCollection_Int32StringMap_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ErrorCodeToMessageMap> {
    return ArraysErrorCodeToMessageMapList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ErrorCodeToMessageMap> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.ErrorCodeToMessageMap {
    let handle = arrayCollection_Int32StringMap_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_Int32StringMap_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == Arrays.ErrorCodeToMessageMap {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_Int32StringMap_release_handle)
}
internal class StringListList: CollectionOf<CollectionOf<String>> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_StringArray_count(c_element))
    }
    deinit {
        arrayCollection_StringArray_release_handle(c_element!)
    }
    public override subscript(index: Int) -> CollectionOf<String> {
        let handle = arrayCollection_StringArray_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<String>> {
    return StringListList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<String>> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element: Collection, T.Element.Element == String {
    let handle = arrayCollection_StringArray_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_StringArray_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element: Collection, T.Element.Element == String {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_StringArray_release_handle)
}
internal class UInt8ListList: CollectionOf<CollectionOf<UInt8>> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_UInt8Array_count(c_element))
    }
    deinit {
        arrayCollection_UInt8Array_release_handle(c_element!)
    }
    public override subscript(index: Int) -> CollectionOf<UInt8> {
        let handle = arrayCollection_UInt8Array_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<UInt8>> {
    return UInt8ListList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<UInt8>> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element: Collection, T.Element.Element == UInt8 {
    let handle = arrayCollection_UInt8Array_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_UInt8Array_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element: Collection, T.Element.Element == UInt8 {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_UInt8Array_release_handle)
}
internal class StringList: CollectionOf<String> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_String_count(c_element))
    }
    deinit {
        arrayCollection_String_release_handle(c_element!)
    }
    public override subscript(index: Int) -> String {
        let handle = arrayCollection_String_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<String> {
    return StringList(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<String> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == String {
    let handle = arrayCollection_String_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_String_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == String {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_String_release_handle)
}
internal class UInt8List: CollectionOf<UInt8> {
    var c_element: _baseRef?
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init()
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_UInt8_count(c_element))
    }
    deinit {
        arrayCollection_UInt8_release_handle(c_element!)
    }
    public override subscript(index: Int) -> UInt8 {
        let handle = arrayCollection_UInt8_get(c_element!, UInt64(index))
        return copyFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<UInt8> {
    return UInt8List(handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<UInt8> {
    return copyFromCType(handle)
}
internal func copyToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == UInt8 {
    let handle = arrayCollection_UInt8_create_handle()
    for item in swiftArray {
        let c_item = moveToCType(item)
        arrayCollection_UInt8_append(handle, c_item.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType<T: Collection>(_ swiftArray: T) -> RefHolder where T.Element == UInt8 {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_UInt8_release_handle)
}