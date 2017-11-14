//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation

internal class UInt8ListList: CollectionOf<CollectionOf<UInt8>> {
    let c_element: arrayCollection_UInt8Array

    init(_ c_element: arrayCollection_UInt8Array) {
        self.c_element = c_element
        super.init([])
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_UInt8Array_count(c_element))
    }

    public override subscript(index: Int) -> CollectionOf<UInt8> {
        let handle = arrayCollection_UInt8Array_get(c_element, UInt64(index))
        return UInt8List(handle)
    }
}
extension Collection where Element == CollectionOf<UInt8>  {
    public func c_conversion()-> (c_type: arrayCollection_UInt8Array, cleanup: () ->Void) {
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

internal class StringList: CollectionOf<String> {
    let c_element: arrayCollection_String
    init(_ c_element: arrayCollection_String) {
        self.c_element = c_element
        super.init([])
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_String_count(c_element))
    }
    public override subscript(index: Int) -> String {
        let handle = arrayCollection_String_get(c_element, UInt64(index))
        defer {
        std_string_release(handle)
        }
        return String(data: Data(bytes: std_string_data_get(handle),
        count: Int(std_string_size_get(handle))), encoding: .utf8)!
    }
}
extension Collection where Element == String  {
    public func c_conversion()-> (c_type: arrayCollection_String, cleanup: () ->Void) {
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

internal class FancyStructList: CollectionOf<Arrays.FancyStruct> {
    let c_element: arrayCollection_FancyStruct

    init(_ c_element: arrayCollection_FancyStruct) {
        self.c_element = c_element
        super.init([])
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_FancyStruct_count(c_element))
    }

    public override subscript(index: Int) -> Arrays.FancyStruct {
        let handle = arrayCollection_FancyStruct_get(c_element, UInt64(index))
        guard let result = Arrays.FancyStruct(cFancyStruct: handle) else {
            fatalError("Not implemented")
        }
        return result
    }
}
extension Collection where Element == Arrays.FancyStruct  {
    public func c_conversion()-> (c_type: arrayCollection_FancyStruct, cleanup: () ->Void) {
        let handle = arrayCollection_FancyStruct_create()
        for item in self { 
           arrayCollection_FancyStruct_append(handle, item.convertToCType())
        }
        let cleanup_function = { () -> Void in
            arrayCollection_FancyStruct_release(handle)
        }
        return (handle, cleanup_function)
    }
}

internal class BasicStructList: CollectionOf<Arrays.BasicStruct> {
    let c_element: arrayCollection_BasicStruct

    init(_ c_element: arrayCollection_BasicStruct) {
        self.c_element = c_element
        super.init([])
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_BasicStruct_count(c_element))
    }

    public override subscript(index: Int) -> Arrays.BasicStruct {
        let handle = arrayCollection_BasicStruct_get(c_element, UInt64(index))
        guard let result = Arrays.BasicStruct(cBasicStruct: handle) else {
            fatalError("Not implemented")
        }
        return result
    }
}
extension Collection where Element == Arrays.BasicStruct  {
    public func c_conversion()-> (c_type: arrayCollection_BasicStruct, cleanup: () ->Void) {
        let handle = arrayCollection_BasicStruct_create()
        for item in self { 
           arrayCollection_BasicStruct_append(handle, item.convertToCType())
        }
        let cleanup_function = { () -> Void in
            arrayCollection_BasicStruct_release(handle)
        }
        return (handle, cleanup_function)
    }
}

internal class UInt8List: CollectionOf<UInt8> {
    let c_element: arrayCollection_UInt8

    init(_ c_element: arrayCollection_UInt8) {
        self.c_element = c_element
        super.init([])
        self.startIndex = 0
        self.endIndex = Int(arrayCollection_UInt8_count(c_element))
    }

    public override subscript(index: Int) -> UInt8 {
        let handle = arrayCollection_UInt8_get(c_element, UInt64(index))
        return handle
    }
}
extension Collection where Element == UInt8  {
    public func c_conversion()-> (c_type: arrayCollection_UInt8, cleanup: () ->Void) {
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




















