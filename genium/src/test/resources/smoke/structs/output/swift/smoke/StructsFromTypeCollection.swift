//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: StructsFromTypeCollection?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_StructsFromTypeCollection_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_StructsFromTypeCollection_release_handle)
        : RefHolder(handle_copy)
}
public class StructsFromTypeCollection {
    let c_instance : _baseRef
    init(cStructsFromTypeCollection: _baseRef) {
        guard cStructsFromTypeCollection != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cStructsFromTypeCollection
    }
    deinit {
        smoke_StructsFromTypeCollection_release_handle(c_instance)
    }
    public static func createPoint(x: Double, y: Double) -> Point {
            let c_x = moveToCType(x)
            let c_y = moveToCType(y)
        return moveFromCType(smoke_StructsFromTypeCollection_createPoint(c_x.ref, c_y.ref))
    }
    public static func swapPointCoordinates(input: Point) -> Point {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_StructsFromTypeCollection_swapPointCoordinates(c_input.ref))
    }
    public static func createLine(pointA: Point, pointB: Point) -> Line {
            let c_pointA = moveToCType(pointA)
            let c_pointB = moveToCType(pointB)
        return moveFromCType(smoke_StructsFromTypeCollection_createLine(c_pointA.ref, c_pointB.ref))
    }
    public static func createColoredLine(line: Line, color: Color) -> ColoredLine {
            let c_line = moveToCType(line)
            let c_color = moveToCType(color)
        return moveFromCType(smoke_StructsFromTypeCollection_createColoredLine(c_line.ref, c_color.ref))
    }
    public static func modifyAllTypesStruct(input: AllTypesStruct) -> AllTypesStruct {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_StructsFromTypeCollection_modifyAllTypesStruct(c_input.ref))
    }
}
extension StructsFromTypeCollection: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func StructsFromTypeCollectioncopyFromCType(_ handle: _baseRef) -> StructsFromTypeCollection {
    return StructsFromTypeCollection(cStructsFromTypeCollection: smoke_StructsFromTypeCollection_copy_handle(handle))
}
internal func StructsFromTypeCollectionmoveFromCType(_ handle: _baseRef) -> StructsFromTypeCollection {
    return StructsFromTypeCollection(cStructsFromTypeCollection: handle)
}
internal func StructsFromTypeCollectioncopyFromCType(_ handle: _baseRef) -> StructsFromTypeCollection? {
    guard handle != 0 else {
        return nil
    }
    return StructsFromTypeCollectionmoveFromCType(handle) as StructsFromTypeCollection
}
internal func StructsFromTypeCollectionmoveFromCType(_ handle: _baseRef) -> StructsFromTypeCollection? {
    guard handle != 0 else {
        return nil
    }
    return StructsFromTypeCollectionmoveFromCType(handle) as StructsFromTypeCollection
}
internal func copyToCType(_ swiftClass: StructsFromTypeCollection) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: StructsFromTypeCollection) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: StructsFromTypeCollection?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: StructsFromTypeCollection?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}