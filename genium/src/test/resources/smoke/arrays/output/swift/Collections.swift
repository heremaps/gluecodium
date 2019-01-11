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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == Arrays.BasicStruct  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_BasicStruct_create_handle()
        for item in self {
            let item_handle = item.convertToCType();
            defer {
                smoke_Arrays_BasicStruct_release_handle(item_handle)
            }
            arrayCollection_BasicStruct_append(handle, item_handle)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_BasicStruct_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.BasicStruct> {
    return BasicStructList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.BasicStruct> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == Arrays.ExternalEnum  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_ExternalEnum_create_handle()
        for item in self {
            arrayCollection_ExternalEnum_append(handle, item.rawValue)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_ExternalEnum_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalEnum> {
    return ExternalEnumList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalEnum> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == Arrays.ExternalStruct  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_ExternalStruct_create_handle()
        for item in self {
            let item_handle = item.convertToCType();
            defer {
                smoke_Arrays_ExternalStruct_release_handle(item_handle)
            }
            arrayCollection_ExternalStruct_append(handle, item_handle)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_ExternalStruct_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalStruct> {
    return ExternalStructList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ExternalStruct> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == Arrays.FancyStruct  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_FancyStruct_create_handle()
        for item in self {
            let item_handle = item.convertToCType();
            defer {
                smoke_Arrays_FancyStruct_release_handle(item_handle)
            }
            arrayCollection_FancyStruct_append(handle, item_handle)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_FancyStruct_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.FancyStruct> {
    return FancyStructList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.FancyStruct> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == Arrays.SomeEnum  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_SomeEnum_create_handle()
        for item in self {
            arrayCollection_SomeEnum_append(handle, item.rawValue)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_SomeEnum_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.SomeEnum> {
    return SomeEnumList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.SomeEnum> {
    return copyFromCType(handle)
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
        return convertArrays_ErrorCodeToMessageMapFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == Arrays.ErrorCodeToMessageMap  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_Int32StringMap_create_handle()
        for item in self {
            let conversion = convertArrays_ErrorCodeToMessageMapToCType(item)
            defer {
                smoke_Arrays_ErrorCodeToMessageMap_release_handle(conversion)
            }
            arrayCollection_Int32StringMap_append(handle, conversion)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_Int32StringMap_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ErrorCodeToMessageMap> {
    return ArraysErrorCodeToMessageMapList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<Arrays.ErrorCodeToMessageMap> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element: Collection, Element.Element == String  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_StringArray_create_handle()
        for item in self {
            let conversion = item.c_conversion()
            arrayCollection_StringArray_append(handle, conversion.c_type)
            conversion.cleanup()
        }
        let cleanup_function = { () -> Void in
            arrayCollection_StringArray_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<String>> {
    return StringListList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<String>> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element: Collection, Element.Element == UInt8  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_UInt8Array_create_handle()
        for item in self {
            let conversion = item.c_conversion()
            arrayCollection_UInt8Array_append(handle, conversion.c_type)
            conversion.cleanup()
        }
        let cleanup_function = { () -> Void in
            arrayCollection_UInt8Array_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<UInt8>> {
    return UInt8ListList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<CollectionOf<UInt8>> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == String  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_String_create_handle()
        for item in self {
            arrayCollection_String_append(handle, item)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_String_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<String> {
    return StringList(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<String> {
    return copyFromCType(handle)
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
        return moveFromCType(handle)
    }
    // This constructor is never called but it's required to conform to ExpressibleByArrayLiteral
    required public init(arrayLiteral elements: Element...) {
        super.init(elements)
    }
}
extension Collection where Element == UInt8  {
    func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_UInt8_create_handle()
        for item in self {
            arrayCollection_UInt8_append(handle, item)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_UInt8_release_handle(handle)
        }
        return (handle, cleanup_function)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> CollectionOf<UInt8> {
    return UInt8List(handle)
}
// Array is taking over and owning _baseRef instead of releasing it directly
internal func moveFromCType(_ handle: _baseRef) -> CollectionOf<UInt8> {
    return copyFromCType(handle)
}