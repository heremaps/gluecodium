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
                let aHandle = smoke_StructsInheritance_ColoredLineInherited_a_get(cColoredLineInherited)
                defer {
                    smoke_Structs_Point_release(aHandle)
                }
                guard
                    let aUnwrapped = Structs.Point(cPoint: aHandle)
                else {
                    return nil
                }
                a = aUnwrapped
            }
            do {
                let bHandle = smoke_StructsInheritance_ColoredLineInherited_b_get(cColoredLineInherited)
                defer {
                    smoke_Structs_Point_release(bHandle)
                }
                guard
                    let bUnwrapped = Structs.Point(cPoint: bHandle)
                else {
                    return nil
                }
                b = bUnwrapped
            }
            do {
                let colorHandle = smoke_StructsInheritance_ColoredLineInherited_color_get(cColoredLineInherited)
                defer {
                    smoke_TypeCollection_Color_release(colorHandle)
                }
                guard
                    let colorUnwrapped = Color(cColor: colorHandle)
                else {
                    return nil
                }
                color = colorUnwrapped
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_StructsInheritance_ColoredLineInherited_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cColoredLineInherited: _baseRef) -> Void {
            let aHandle = a.convertToCType()
            defer {
                smoke_Structs_Point_release(aHandle)
            }
            smoke_StructsInheritance_ColoredLineInherited_a_set(cColoredLineInherited, aHandle)
            let bHandle = b.convertToCType()
            defer {
                smoke_Structs_Point_release(bHandle)
            }
            smoke_StructsInheritance_ColoredLineInherited_b_set(cColoredLineInherited, bHandle)
            let colorHandle = color.convertToCType()
            defer {
                smoke_TypeCollection_Color_release(colorHandle)
            }
            smoke_StructsInheritance_ColoredLineInherited_color_set(cColoredLineInherited, colorHandle)
        }
    }
    public static func methodWithInheritedType(input: StructsInheritance.ColoredLineInherited) -> StructsInheritance.ColoredLineInherited? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_StructsInheritance_ColoredLineInherited_release(inputHandle)
        }
        let cResult = smoke_StructsInheritance_methodWithInheritedType(inputHandle)
        defer {
            smoke_StructsInheritance_ColoredLineInherited_release(cResult)
        }
        return StructsInheritance.ColoredLineInherited(cColoredLineInherited: cResult)
    }
}
extension StructsInheritance: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
