//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: StructsInheritance?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class StructsInheritance {
    let c_instance : _baseRef
    public init?(cStructsInheritance: _baseRef) {
        guard cStructsInheritance != 0 else {
            return nil
        }
        c_instance = cStructsInheritance
    }
    deinit {
        smoke_StructsInheritance_release(c_instance)
    }
    public struct ColoredLineInherited {
        public var a: Structs.Point
        public var b: Structs.Point
        public var color: Color
        public init(a: Structs.Point, b: Structs.Point, color: Color) {
            self.a = a
            self.b = b
            self.color = color
        }
        public func convertToLine() -> Structs.Line {
            return Structs.Line(a: a, b: b)
        }
        internal init?(cColoredLineInherited: _baseRef) {
            do {
                let a_handle = smoke_StructsInheritance_ColoredLineInherited_a_get(cColoredLineInherited)
                defer {
                    smoke_Structs_Point_release(a_handle)
                }
                guard
                    let a_unwrapped = Structs.Point(cPoint: a_handle)
                else {
                    return nil
                }
                a = a_unwrapped
            }
            do {
                let b_handle = smoke_StructsInheritance_ColoredLineInherited_b_get(cColoredLineInherited)
                defer {
                    smoke_Structs_Point_release(b_handle)
                }
                guard
                    let b_unwrapped = Structs.Point(cPoint: b_handle)
                else {
                    return nil
                }
                b = b_unwrapped
            }
            do {
                let color_handle = smoke_StructsInheritance_ColoredLineInherited_color_get(cColoredLineInherited)
                defer {
                    smoke_TypeCollection_Color_release(color_handle)
                }
                guard
                    let color_unwrapped = Color(cColor: color_handle)
                else {
                    return nil
                }
                color = color_unwrapped
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_StructsInheritance_ColoredLineInherited_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cColoredLineInherited: _baseRef) -> Void {
            let a_handle = a.convertToCType()
            defer {
                smoke_Structs_Point_release(a_handle)
            }
            smoke_StructsInheritance_ColoredLineInherited_a_set(cColoredLineInherited, a_handle)
            let b_handle = b.convertToCType()
            defer {
                smoke_Structs_Point_release(b_handle)
            }
            smoke_StructsInheritance_ColoredLineInherited_b_set(cColoredLineInherited, b_handle)
            let color_handle = color.convertToCType()
            defer {
                smoke_TypeCollection_Color_release(color_handle)
            }
            smoke_StructsInheritance_ColoredLineInherited_color_set(cColoredLineInherited, color_handle)
        }
    }
    public static func methodWithInheritedType(input: StructsInheritance.ColoredLineInherited) -> StructsInheritance.ColoredLineInherited? {
        let input_handle = input.convertToCType()
        defer {
            smoke_StructsInheritance_ColoredLineInherited_release(input_handle)
        }
        let cResult = smoke_StructsInheritance_methodWithInheritedType(input_handle)
        defer {
            smoke_StructsInheritance_ColoredLineInherited_release(cResult)
        }
        return StructsInheritance.ColoredLineInherited(cColoredLineInherited: cResult)
    }
}
extension StructsInheritance: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
