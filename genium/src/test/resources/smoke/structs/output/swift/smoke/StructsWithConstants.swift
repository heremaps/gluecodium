//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public struct Route {
    public static let defaultDescription: String = "Nonsense"
    public static let defaultType: RouteType = RouteType.equestrian
    public var description: String
    public var type: RouteType
    public init(description: String, type: RouteType) {
        self.description = description
        self.type = type
    }
    internal init(cHandle: _baseRef) {
        description = moveFromCType(smoke_StructsWithConstants_Route_description_get(cHandle))
        type = moveFromCType(smoke_StructsWithConstants_Route_type_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Route {
    return Route(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Route {
    defer {
        smoke_StructsWithConstants_Route_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Route) -> RefHolder {
    let c_description = moveToCType(swiftType.description)
    let c_type = moveToCType(swiftType.type)
    return RefHolder(smoke_StructsWithConstants_Route_create_handle(c_description.ref, c_type.ref))
}
internal func moveToCType(_ swiftType: Route) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructsWithConstants_Route_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Route? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructsWithConstants_Route_unwrap_optional_handle(handle)
    return Route(cHandle: unwrappedHandle) as Route
}
internal func moveFromCType(_ handle: _baseRef) -> Route? {
    defer {
        smoke_StructsWithConstants_Route_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Route?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_description = moveToCType(swiftType.description)
    let c_type = moveToCType(swiftType.type)
    return RefHolder(smoke_StructsWithConstants_Route_create_optional_handle(c_description.ref, c_type.ref))
}
internal func moveToCType(_ swiftType: Route?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructsWithConstants_Route_release_optional_handle)
}
