//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal class BasicStructList: CollectionOf<Arrays.BasicStruct> {
    let c_element: _baseRef
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init(nil)
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_BasicStruct_count(c_element))
    }
    deinit {
        arrayCollection_BasicStruct_release(c_element)
    }
    public override subscript(index: Int) -> Arrays.BasicStruct {
        let handle = arrayCollection_BasicStruct_get(c_element, UInt64(index))
        defer {
            smoke_Arrays_BasicStruct_release(handle)
        }
        guard let result = Arrays.BasicStruct(cBasicStruct: handle) else {
            fatalError("Unexpected nullptr for Arrays.BasicStruct")
        }
        return result
    }
}
extension Collection where Element == Arrays.BasicStruct  {
    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_BasicStruct_create()
        for item in self {
            let itemHandle = item.convertToCType();
            defer {
                smoke_Arrays_BasicStruct_release(itemHandle)
            }
            arrayCollection_BasicStruct_append(handle, itemHandle)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_BasicStruct_release(handle)
        }
        return (handle, cleanup_function)
    }
}
internal class FancyStructList: CollectionOf<Arrays.FancyStruct> {
    let c_element: _baseRef
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init(nil)
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_FancyStruct_count(c_element))
    }
    deinit {
        arrayCollection_FancyStruct_release(c_element)
    }
    public override subscript(index: Int) -> Arrays.FancyStruct {
        let handle = arrayCollection_FancyStruct_get(c_element, UInt64(index))
        defer {
            smoke_Arrays_FancyStruct_release(handle)
        }
        guard let result = Arrays.FancyStruct(cFancyStruct: handle) else {
            fatalError("Unexpected nullptr for Arrays.FancyStruct")
        }
        return result
    }
}
extension Collection where Element == Arrays.FancyStruct  {
    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_FancyStruct_create()
        for item in self {
            let itemHandle = item.convertToCType();
            defer {
                smoke_Arrays_FancyStruct_release(itemHandle)
            }
            arrayCollection_FancyStruct_append(handle, itemHandle)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_FancyStruct_release(handle)
        }
        return (handle, cleanup_function)
    }
}
internal class ArraysErrorCodeToMessageMapList: CollectionOf<Arrays.ErrorCodeToMessageMap> {
    let c_element: _baseRef
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init(nil)
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_Int32StringMap_count(c_element))
    }
    deinit {
        arrayCollection_Int32StringMap_release(c_element)
    }
    public override subscript(index: Int) -> Arrays.ErrorCodeToMessageMap {
        let handle = arrayCollection_Int32StringMap_get(c_element, UInt64(index))
        return convertArrays_ErrorCodeToMessageMapFromCType(handle)
    }
}
extension Collection where Element == Arrays.ErrorCodeToMessageMap  {
    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_Int32StringMap_create()
        for item in self {
            let conversion = convertArrays_ErrorCodeToMessageMapToCType(item)
            defer {
                smoke_Arrays_ErrorCodeToMessageMap_release(conversion)
            }
            arrayCollection_Int32StringMap_append(handle, conversion)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_Int32StringMap_release(handle)
        }
        return (handle, cleanup_function)
    }
}
internal class UInt8ListList: CollectionOf<CollectionOf<UInt8>> {
    let c_element: _baseRef
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init(nil)
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_UInt8Array_count(c_element))
    }
    deinit {
        arrayCollection_UInt8Array_release(c_element)
    }
    public override subscript(index: Int) -> CollectionOf<UInt8> {
        let handle = arrayCollection_UInt8Array_get(c_element, UInt64(index))
        return UInt8List(handle)
    }
}
extension Collection where Element: Collection, Element.Element == UInt8  {
    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_UInt8Array_create()
        for item in self {
            let conversion = item.c_conversion()
            arrayCollection_UInt8Array_append(handle, conversion.c_type)
            conversion.cleanup()
        }
        let cleanup_function = { () -> Void in
            arrayCollection_UInt8Array_release(handle)
        }
        return (handle, cleanup_function)
    }
}
internal class StringList: CollectionOf<Arrays.ProfileId> {
    let c_element: _baseRef
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init(nil)
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_String_count(c_element))
    }
    deinit {
        arrayCollection_String_release(c_element)
    }
    public override subscript(index: Int) -> Arrays.ProfileId {
        let handle = arrayCollection_String_get(c_element, UInt64(index))
        defer {
            std_string_release(handle)
        }
        return String(data: Data(bytes: std_string_data_get(handle),
                      count: Int(std_string_size_get(handle))), encoding: .utf8)!
    }
}
extension Collection where Element == Arrays.ProfileId  {
    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_String_create()
        for item in self {
            arrayCollection_String_append(handle, item)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_String_release(handle)
        }
        return (handle, cleanup_function)
    }
}
internal class UInt8List: CollectionOf<UInt8> {
    let c_element: _baseRef
    init(_ c_element: _baseRef) {
        self.c_element = c_element
        super.init(nil)
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_UInt8_count(c_element))
    }
    deinit {
        arrayCollection_UInt8_release(c_element)
    }
    public override subscript(index: Int) -> UInt8 {
        let handle = arrayCollection_UInt8_get(c_element, UInt64(index))
        return handle
    }
}
extension Collection where Element == UInt8  {
    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {
        let handle = arrayCollection_UInt8_create()
        for item in self {
            arrayCollection_UInt8_append(handle, item)
        }
        let cleanup_function = { () -> Void in
            arrayCollection_UInt8_release(handle)
        }
        return (handle, cleanup_function)
    }
}