//
//
import Foundation
/// Referencing some type `MapScene.loadScene(Int32, MapScene.LoadSceneCallback?)`.
public class MapScene {
    public typealias LoadSceneCallback = (String?) -> Void
    let c_instance : _baseRef
    init(cMapScene: _baseRef) {
        guard cMapScene != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cMapScene
    }
    deinit {
        smoke_MapScene_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_MapScene_release_handle(c_instance)
    }
    public func loadScene(mapScheme: Int32, callback: MapScene.LoadSceneCallback?) -> Void {
        let c_mapScheme = moveToCType(mapScheme)
        let c_callback = moveToCType(callback)
        smoke_MapScene_loadScene_Int_LoadSceneCallback(self.c_instance, c_mapScheme.ref, c_callback.ref)
    }
    public func loadScene(configurationFile: String, callback: MapScene.LoadSceneCallback?) -> Void {
        let c_configurationFile = moveToCType(configurationFile)
        let c_callback = moveToCType(callback)
        smoke_MapScene_loadScene_String_LoadSceneCallback(self.c_instance, c_configurationFile.ref, c_callback.ref)
    }
}
internal func getRef(_ ref: MapScene?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_MapScene_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_MapScene_release_handle)
        : RefHolder(handle_copy)
}
extension MapScene: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension MapScene: Hashable {
    /// :nodoc:
    public static func == (lhs: MapScene, rhs: MapScene) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func MapScene_copyFromCType(_ handle: _baseRef) -> MapScene {
    if let swift_pointer = smoke_MapScene_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MapScene {
        return re_constructed
    }
    let result = MapScene(cMapScene: smoke_MapScene_copy_handle(handle))
    smoke_MapScene_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func MapScene_moveFromCType(_ handle: _baseRef) -> MapScene {
    if let swift_pointer = smoke_MapScene_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MapScene {
        smoke_MapScene_release_handle(handle)
        return re_constructed
    }
    let result = MapScene(cMapScene: handle)
    smoke_MapScene_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func MapScene_copyFromCType(_ handle: _baseRef) -> MapScene? {
    guard handle != 0 else {
        return nil
    }
    return MapScene_moveFromCType(handle) as MapScene
}
internal func MapScene_moveFromCType(_ handle: _baseRef) -> MapScene? {
    guard handle != 0 else {
        return nil
    }
    return MapScene_moveFromCType(handle) as MapScene
}
internal func copyToCType(_ swiftClass: MapScene) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MapScene) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: MapScene?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MapScene?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> MapScene.LoadSceneCallback {
    return moveFromCType(smoke_MapScene_LoadSceneCallback_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> MapScene.LoadSceneCallback {
    let refHolder = RefHolder(ref: handle, release: smoke_MapScene_LoadSceneCallback_release_handle)
    return { (p0: String?) -> Void in
        let _p0 = moveToCType(p0)
        return moveFromCType(smoke_MapScene_LoadSceneCallback_call(refHolder.ref, _p0.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> MapScene.LoadSceneCallback? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as MapScene.LoadSceneCallback
}
internal func moveFromCType(_ handle: _baseRef) -> MapScene.LoadSceneCallback? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as MapScene.LoadSceneCallback
}
internal func createFunctionalTable(_ swiftType: @escaping MapScene.LoadSceneCallback) -> smoke_MapScene_LoadSceneCallback_FunctionTable {
    class smoke_MapScene_LoadSceneCallback_Holder {
        let closure: MapScene.LoadSceneCallback
        init(_ closure: @escaping MapScene.LoadSceneCallback) {
            self.closure = closure
        }
    }
    var functions = smoke_MapScene_LoadSceneCallback_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_MapScene_LoadSceneCallback_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_MapScene_LoadSceneCallback_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_MapScene_LoadSceneCallback_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping MapScene.LoadSceneCallback) -> RefHolder {
    let handle = smoke_MapScene_LoadSceneCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping MapScene.LoadSceneCallback) -> RefHolder {
    let handle = smoke_MapScene_LoadSceneCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_MapScene_LoadSceneCallback_release_handle)
}
internal func copyToCType(_ swiftType: MapScene.LoadSceneCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_MapScene_LoadSceneCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: MapScene.LoadSceneCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_MapScene_LoadSceneCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_MapScene_LoadSceneCallback_release_handle)
}
