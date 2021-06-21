    public static func stringFunction(input: String) -> String {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_stringFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func boolFunction(input: Bool) -> Bool {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_boolFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func floatFunction(input: Float) -> Float {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_floatFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func doubleFunction(input: Double) -> Double {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_doubleFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func byteFunction(input: Int8) -> Int8 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_byteFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func shortFunction(input: Int16) -> Int16 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_shortFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func intFunction(input: Int32) -> Int32 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_intFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func longFunction(input: Int64) -> Int64 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_longFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func ubyteFunction(input: UInt8) -> UInt8 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_ubyteFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func ushortFunction(input: UInt16) -> UInt16 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_ushortFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func uintFunction(input: UInt32) -> UInt32 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_uintFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public static func ulongFunction(input: UInt64) -> UInt64 {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_BasicTypes_ulongFunction(c_input.ref)
        return moveFromCType(c_result_handle)
    }
}
