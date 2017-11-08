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
internal func getRef(_ ref: MethodOverloads) -> RefHolder<smoke_MethodOverloadsRef> {
    return RefHolder<smoke_MethodOverloadsRef>(ref.c_instance)
}
public class MethodOverloads {
    let c_instance : smoke_MethodOverloadsRef
    public required init?(cMethodOverloads: smoke_MethodOverloadsRef) {
        c_instance = cMethodOverloads
    }
    deinit {
        smoke_MethodOverloads_release(c_instance)
    }
    public struct Point {
        public var x: Double
        public var y: Double
        public init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
        internal init?(cPoint: smoke_MethodOverloads_PointRef) {
            x = smoke_MethodOverloads_Point_x_get(cPoint)
            y = smoke_MethodOverloads_Point_y_get(cPoint)
        }
        internal func convertToCType() -> smoke_MethodOverloads_PointRef {
            let result = smoke_MethodOverloads_Point_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cPoint: smoke_MethodOverloads_PointRef) -> Void {
            smoke_MethodOverloads_Point_x_set(cPoint, x)
            smoke_MethodOverloads_Point_y_set(cPoint, y)
        }
    }
    public func isBoolean(input: Bool) -> Bool {
        return smoke_MethodOverloads_isBoolean_boolOverload(c_instance, input)
    }
    public func isBoolean(input: Int8) -> Bool {
        return smoke_MethodOverloads_isBoolean_intOverload(c_instance, input)
    }
    public func isBoolean(input: String) -> Bool {
        return smoke_MethodOverloads_isBoolean_stringOverload(c_instance, input)
    }
    public func isBoolean(input: MethodOverloads.Point) -> Bool {
        let inputHandle = input.convertToCType()
        defer {
            smoke_MethodOverloads_Point_release(inputHandle)
        }
        return smoke_MethodOverloads_isBoolean_structOverload(c_instance, inputHandle)
    }
    public func isBoolean(input1: Bool, input2: Int8, input3: String, input4: MethodOverloads.Point) -> Bool {
        let input4Handle = input4.convertToCType()
        defer {
            smoke_MethodOverloads_Point_release(input4Handle)
        }
        return smoke_MethodOverloads_isBoolean_everythingOverload(c_instance, input1, input2, input3, input4Handle)
    }
    public func isBoolean<Tinput: Collection>(input: Tinput) -> Bool where Tinput.Element == String {
        let inputArray = input.flatMap{ $0 as? String }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }
        return smoke_MethodOverloads_isBoolean_stringArrayOverload(c_instance, inputHandle.c_type)
    }
    public func isBoolean<Tinput: Collection>(input: Tinput) -> Bool where Tinput.Element == Int8 {
        let inputArray = input.flatMap{ $0 as? Int8 }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }
        return smoke_MethodOverloads_isBoolean_intArrayOverload(c_instance, inputHandle.c_type)
    }
}