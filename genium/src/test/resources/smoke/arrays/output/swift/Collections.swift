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
        defer {
            smoke_Arrays_BasicStruct_release_handle(handle)
        }
        return Arrays.BasicStruct(cBasicStruct: handle)
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
        defer {
            smoke_Arrays_FancyStruct_release_handle(handle)
        }
        return Arrays.FancyStruct(cFancyStruct: handle)
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
        return Arrays.SomeEnum(rawValue: handle)!
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
        return StringList(handle)
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
        return UInt8List(handle)
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
        defer {
            std_string_release_handle(handle)
        }
        return String(data: Data(bytes: std_string_data_get(handle),
                      count: Int(std_string_size_get(handle))), encoding: .utf8)!
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
        return handle
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