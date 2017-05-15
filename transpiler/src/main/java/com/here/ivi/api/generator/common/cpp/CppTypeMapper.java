package com.here.ivi.api.generator.common.cpp;

import com.google.common.collect.Sets;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.InstanceHelper;
import com.here.ivi.api.model.cppmodel.CppElements;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import com.here.ivi.api.model.cppmodel.CppType;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.util.HashSet;
import java.util.Set;
import java.util.logging.Logger;

public class CppTypeMapper {
    private final static Includes.SystemInclude INTYPES_INCLUDE = new Includes.SystemInclude("stdint.h");
    private final static Includes.SystemInclude VECTOR_INCLUDE = new Includes.SystemInclude("vector");
    private final static Includes.SystemInclude SET_INCLUDE = new Includes.SystemInclude("set");
    private final static Includes.SystemInclude MAP_INCLUDE = new Includes.SystemInclude("map");
    private final static Includes.SystemInclude STRING_INCLUDE = new Includes.SystemInclude("string");
    private final static Includes.SystemInclude UNIQUE_PTR_INCLUDE = new Includes.SystemInclude("memory");
    private final static Includes.SystemInclude SHARED_PTR_INCLUDE = new Includes.SystemInclude("memory");
    private final static Includes.SystemInclude WEAK_PTR_INCLUDE = new Includes.SystemInclude("memory");

    static Logger logger = java.util.logging.Logger.getLogger(CppTypeMapper.class.getName());

    public static CppType map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                              FArgument argument) {
        CppType type = CppTypeMapper.map(rootModel, argument.getType());

        if (argument.isArray()) {
            type = CppTypeMapper.wrapArrayType(rootModel.getDefiner(), type, CppTypeMapper.ArrayMode.map(rootModel, argument));
        }

        return type;
    }

    public static CppType map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                              FAttribute attribute) {
        CppType type = CppTypeMapper.map(rootModel, attribute.getType());

        if (attribute.isArray()) {
            type = CppTypeMapper.wrapArrayType(rootModel.getDefiner(), type, CppTypeMapper.ArrayMode.map(rootModel, attribute));
        }

        return type;
    }

    public static CppType map(CppModelAccessor rootModel, FField field) {
        CppType type = CppTypeMapper.map(rootModel, field.getType());

        if (field.isArray()) {
            type = CppTypeMapper.wrapArrayType(rootModel.getDefiner(), type, CppTypeMapper.ArrayMode.map(rootModel, field));
        }

        return type;
    }

    public static CppType map(CppModelAccessor rootModel, FTypeRef type) {

        if (type.getDerived() != null) {
            return mapDerived(rootModel, type);
        } else if (type.getPredefined() != null) {
            return mapPredefined(type);
        }
        return new CppType();
    }

    private static CppType mapDerived(CppModelAccessor rootModel, FTypeRef type) {
        FType derived = type.getDerived();

        // types without a parent are not valid
        if (derived.eContainer() == null) {
            return mapInvalidType(rootModel, type);
        }

        if (derived instanceof FTypeDef) {
            return mapTypeDef( rootModel, (FTypeDef) derived);
        }
        if (derived instanceof FArrayType) {
            return mapArray( rootModel, (FArrayType) derived);
        }
        if (derived instanceof FMapType) {
            return mapMap( rootModel, (FMapType) derived);
        }
        if (derived instanceof FStructType) {
            return mapStruct( rootModel, (FStructType) derived);
        }
        if (derived instanceof FEnumerationType) {
            return mapEnum( rootModel, (FEnumerationType) derived);
        }

        return new CppType(null, "UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
    }

    private static CppType mapInvalidType(CppModelAccessor rootModel, FTypeRef type) {
        DefinedBy definer = DefinedBy.getDefinedBy(type);
        String name = "unknown";
        String typeDesc = "derived type";

        if (type.eContainer() instanceof FTypeDef) {
            name = ((FTypeDef) type.eContainer()).getName();
            typeDesc = "type reference";
        } else if (type.eContainer() instanceof FArgument) {
            FArgument arg = (FArgument) type.eContainer();
            name = arg.getName();

            // look at method name as well
            if (arg.eContainer() instanceof FMethod) {
                name = ((FMethod) arg.eContainer()).getName() + "::" + name;
            } else if (arg.eContainer() instanceof FBroadcast) {
                name = ((FMethod) arg.eContainer()).getName() + "::" + name;
            }

            typeDesc = "argument";
        } else if (type.eContainer() instanceof FField) {
            name = ((FField) type.eContainer()).getName();
            typeDesc = "field";
        } else if (type.eContainer() instanceof FAttribute) {
            name = ((FAttribute) type.eContainer()).getName();
            typeDesc = "attribute";
        }

        logger.severe("Failed resolving " + typeDesc + " for '" + name + "' in " + definer +
                " (indicates wrong typedef or missing include). Type included in " + rootModel + ".");

        return new CppType(definer, "INVALID DERIVED FOUND", CppElements.TypeInfo.Invalid);
    }

    private static CppType mapTypeDef(CppModelAccessor rootModel, FTypeDef typedef) {

        DefinedBy typeRefDefiner = DefinedBy.getDefinedBy(typedef);

        if (typedef.getActualType() == null) {
            return new CppType(typeRefDefiner, "NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else if (InstanceHelper.isInstanceId(typedef)) {
            Includes.Include include = new Includes.LazyInternalInclude(typeRefDefiner, Includes.InternalType.Interface);

            // each Instance type is defined directly in the Interface that is refers to, this is already
            // resolved in the typeRefDefiner, and named as the interface

            String name = rootModel.getRules().className(typeRefDefiner.type);
            String namespacedName = CppNamespaceUtils.getCppTypename(rootModel, typeRefDefiner, name);

            return new CppType(typeRefDefiner, namespacedName,
                    CppElements.TypeInfo.InterfaceInstance, include);
        } else {
            CppType actual = map(rootModel, typedef.getActualType());
            DefinedBy actualTypeDefiner = actual.definedIn;

            // lookup where type came from, setup includes
            Includes.Include include = new Includes.LazyInternalInclude(actualTypeDefiner);

            String namespacedName = CppNamespaceUtils.getCppTypename(rootModel, typedef);
            // actually use the typedef in this case, not the underlying type
            return new CppType(typeRefDefiner, namespacedName, actual.info, include);
        }
    }

    public static CppType mapArray(CppModelAccessor rootModel, FArrayType array) {

        DefinedBy arrayDefiner = DefinedBy.getDefinedBy(array);

        FTypeRef elementType = array.getElementType();
        CppType actual = map(rootModel, elementType);

        String typeName = array.getName(); // use name defined for array
        if (typeName != null) {
            // lookup where array typedef came from, setup includes
            Set<Includes.Include> includes = Sets.newHashSet(new Includes.LazyInternalInclude(arrayDefiner));

            typeName = CppNamespaceUtils.getCppTypename(rootModel, array);

            return new CppType( arrayDefiner, typeName, CppElements.TypeInfo.Complex, includes);
        }

        // if no name is given, fallback to underlying type
        return wrapArrayType(arrayDefiner, actual, ArrayMode.map(rootModel, array));
    }

    public static CppType defineArray(CppModelAccessor rootModel, FArrayType array) {
        DefinedBy arrayDefiner = DefinedBy.getDefinedBy(array);
        FTypeRef elementType = array.getElementType();
        CppType actual = map(rootModel, elementType);

        return wrapArrayType(arrayDefiner, actual, ArrayMode.map(rootModel, array));
    }

    public enum ArrayMode {
        STD_VECTOR,
        STD_SET;

        public static ArrayMode map(CppModelAccessor<?> rootModel, FArrayType array) {
            if (rootModel.getAccessor().getIsSet(array)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }

        public static ArrayMode map(CppModelAccessor<?> rootModel, FField field) {
            if (rootModel.getAccessor().getIsSet(field)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }

        public static ArrayMode map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                                    FArgument argument) {
            if (rootModel.getAccessor().getIsSet(argument)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }

        public static ArrayMode map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                                    FAttribute argument) {
            if (rootModel.getAccessor().getIsSet(argument)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }
    }

    private static CppType wrapArrayType(DefinedBy definedIn, CppType elementType, ArrayMode mode) {
        CppType result = null;
        switch (mode) {
            case STD_VECTOR:
                result = wrapVector(elementType);
                break;
            case STD_SET:
                result = wrapSet(elementType);
                break;
        }
        if (result != null) {
            result.definedIn = definedIn;
        }
        return result;
    }

    private static CppType mapMap(CppModelAccessor rootModel, FMapType map) {
        DefinedBy mapDefiner = DefinedBy.getDefinedBy(map);

        if (map.getKeyType() == null || map.getValueType() == null ) {
            return new CppType(mapDefiner, "NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {

            String typeName = map.getName(); // use name defined for map
            if (typeName != null) {
                // lookup where map typedef came from, setup includes
                Set<Includes.Include> includes = Sets.newHashSet(new Includes.LazyInternalInclude(mapDefiner));
                typeName = CppNamespaceUtils.getCppTypename(rootModel, map);

                return new CppType( mapDefiner, typeName, CppElements.TypeInfo.Complex, includes);
            }

            CppType key = map(rootModel, map.getKeyType());
            CppType value = map(rootModel, map.getValueType());

            // if no names are given, fallback to underlying type
            return wrapMapType(mapDefiner, key, value);
        }
    }

    private static CppType mapStruct(CppModelAccessor rootModel, FStructType struct) {

        DefinedBy structDefiner = DefinedBy.getDefinedBy(struct);

        if (struct.getElements().isEmpty() ) {
            return new CppType(structDefiner, "EMPTY STRUCT", CppElements.TypeInfo.Invalid);
        } else {
            Includes.Include include = new Includes.LazyInternalInclude(structDefiner);

            String typeName = CppNamespaceUtils.getCppTypename(rootModel, struct);

            return new CppType(structDefiner, typeName, CppElements.TypeInfo.Complex, include);
        }
    }

    public static CppType mapEnum(CppModelAccessor rootModel, FEnumerationType enumeration) {
        DefinedBy enumDefiner = DefinedBy.getDefinedBy(enumeration);

        if (enumeration.getEnumerators().isEmpty() ) {
            return new CppType(enumDefiner, "EMPTY ENUM", CppElements.TypeInfo.Invalid);
        } else {
            Includes.Include include = new Includes.LazyInternalInclude(enumDefiner);
            String typeName = CppNamespaceUtils.getCppTypename(rootModel, enumeration);

            return new CppType(enumDefiner, typeName, CppElements.TypeInfo.BuiltIn, include);
        }
    }


    public static CppType wrapMapType(DefinedBy mapDefiner, CppType key, CppType value)
    {
        // lookup where map types came from, setup includes
        Includes.Include keyInclude = new Includes.LazyInternalInclude(key.definedIn);
        Includes.Include valueInclude = new Includes.LazyInternalInclude(value.definedIn);

        String mapType = "std::map< " + key.name + ", " + value.name + " >";

        // include key type, value type and the map
        Set<Includes.Include> includes = new HashSet<>(key.includes);
        includes.add(keyInclude);
        includes.add(valueInclude);
        includes.add(MAP_INCLUDE);

        return new CppType(mapDefiner, mapType, CppElements.TypeInfo.Complex, includes);
    }

    public static CppType wrapUniquePtr(CppType content)
    {
        // lookup where content type came from, setup includes
        Includes.Include typeInclude = new Includes.LazyInternalInclude(content.definedIn);

        String mapType = "std::unique_ptr< " + content.name + " >";

        // include content type and the shared_ptr
        Set<Includes.Include> includes = new HashSet<>(content.includes);
        includes.add(typeInclude);
        includes.add(UNIQUE_PTR_INCLUDE);

        return new CppType(content.definedIn, mapType, CppElements.TypeInfo.Complex, includes);
    }

    public static CppType wrapSharedPtr(CppType content)
    {
        // lookup where content type came from, setup includes
        Includes.Include typeInclude = new Includes.LazyInternalInclude(content.definedIn);

        String mapType = "std::shared_ptr< " + content.name + " >";

        // include content type and the shared_ptr
        Set<Includes.Include> includes = new HashSet<>(content.includes);
        includes.add(typeInclude);
        includes.add(SHARED_PTR_INCLUDE);

        return new CppType(content.definedIn, mapType, CppElements.TypeInfo.Complex, includes);
    }

    public static CppType wrapWeakPtr(CppType content)
    {
        // lookup where content type came from, setup includes
        Includes.Include typeInclude = new Includes.LazyInternalInclude(content.definedIn);

        String mapType = "std::weak_ptr< " + content.name + " >";

        // include content type and the weak_ptr
        Set<Includes.Include> includes = new HashSet<>(content.includes);
        includes.add(typeInclude);
        includes.add(WEAK_PTR_INCLUDE);

        return new CppType(content.definedIn, mapType, CppElements.TypeInfo.Complex, includes);
    }

    public static CppType wrapVector(CppType content)
    {
        // lookup where content type came from, setup includes
        Includes.Include typeInclude = new Includes.LazyInternalInclude(content.definedIn);

        String mapType = "std::vector< " + content.name + " >";

        // include content type and the weak_ptr
        Set<Includes.Include> includes = new HashSet<>(content.includes);
        includes.add(typeInclude);
        includes.add(VECTOR_INCLUDE);

        return new CppType(content.definedIn, mapType, CppElements.TypeInfo.Complex, includes);
    }

    public static CppType wrapSet(CppType content)
    {
        // lookup where content type came from, setup includes
        Includes.Include typeInclude = new Includes.LazyInternalInclude(content.definedIn);

        String mapType = "std::set< " + content.name + " >";

        // include content type and the weak_ptr
        Set<Includes.Include> includes = new HashSet<>(content.includes);
        includes.add(typeInclude);
        includes.add(SET_INCLUDE);

        return new CppType(content.definedIn, mapType, CppElements.TypeInfo.Complex, includes);
    }

    private static CppType mapPredefined(FTypeRef type) {

        DefinedBy definer = DefinedBy.getDefinedBy(type);

        int v = type.getPredefined().getValue();
        switch (v) {
            case FBasicTypeId.BOOLEAN_VALUE: return new CppType(definer, "bool", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.FLOAT_VALUE: return new CppType(definer, "float", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.DOUBLE_VALUE: return new CppType(definer, "double", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.INT8_VALUE: return new CppType(definer, "int8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT16_VALUE: return new CppType(definer, "int16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT32_VALUE: return new CppType(definer, "int32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT64_VALUE: return new CppType(definer, "int64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT8_VALUE: return new CppType(definer, "uint8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT16_VALUE: return new CppType(definer, "uint16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT32_VALUE: return new CppType(definer, "uint32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT64_VALUE: return new CppType(definer, "uint64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.STRING_VALUE: return new CppType(definer, "std::string", CppElements.TypeInfo.Complex, STRING_INCLUDE);
            case FBasicTypeId.BYTE_BUFFER_VALUE: return new CppType(definer, "std::vector< uint8_t >", CppElements.TypeInfo.Complex, VECTOR_INCLUDE);
            default: return new CppType(definer, "UNMAPPED PREDEFINED [" + type.getPredefined().getName() + "]", CppElements.TypeInfo.Invalid);
        }
    }
}
