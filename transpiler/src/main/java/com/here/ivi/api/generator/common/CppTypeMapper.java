package com.here.ivi.api.generator.common;

import com.google.common.collect.Sets;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

import java.util.*;

import static java.util.Arrays.asList;

public class CppTypeMapper {
    private final static CppElements.SystemInclude INTYPES_INCLUDE = new CppElements.SystemInclude("stdint.h");
    private final static CppElements.SystemInclude VECTOR_INCLUDE = new CppElements.SystemInclude("vector");
    private final static CppElements.SystemInclude MAP_INCLUDE = new CppElements.SystemInclude("map");
    private final static CppElements.SystemInclude STRING_INCLUDE = new CppElements.SystemInclude("string");

    public static CppElements.CppType map(FTypeRef type) {
        if (type.getDerived() != null) {
            return mapDerived(type);
        } else if (type.getPredefined() != null) {
            return mapPredefined(type);
        }
        return new CppElements.CppType(type);
    }

    private static CppElements.CppType mapDerived(FTypeRef type) {
        FType derived = type.getDerived();
        if (derived instanceof FTypeDef) {
            return mapTypeDef(type, (FTypeDef) derived);
        }
        if (derived instanceof FArrayType) {
            return mapArray(type, (FArrayType) derived);
        }
        if (derived instanceof FMapType) {
            FMapType typedef = (FMapType) derived;
            return mapMap(type, (FMapType) derived);
        }
        if (derived instanceof FStructType) {
            return mapStruct(type, (FStructType) derived);
        }

        return new CppElements.CppType(type,"UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
    }

    private static CppElements.CppType mapTypeDef(FTypeRef type, FTypeDef typedef) {
        if (typedef.getActualType() == null) {
            return new CppElements.CppType(type,"NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else if (isInstanceId(typedef)) {
            CppElements.CppType actual = map(typedef.getActualType());
            // TODO check that this InstanceId is actually the correct one or add special fdepl info to it
            // TODO figure out the right include for this type
            return new CppElements.CppType(type, typedef.getName(), CppElements.TypeInfo.InterfaceInstance);
        } else {
            FTypeRef underlyingType = typedef.getActualType();

            CppElements.CppType actual = map(underlyingType);

            // lookup where type came from, setup includes
            CppElements.Include include = internalInclude(underlyingType);

            // actually use the typedef in this case, not the underlying type
            return new CppElements.CppType(type, typedef.getName(), actual.info, include);
        }
    }

    private static FTypeCollection findDefiningTypeCollection(EObject obj) {
        if (obj instanceof FTypeCollection) {
            return (FTypeCollection)obj;
        }

        EObject parent = obj.eContainer();

        if ((parent == obj) || (parent == null)) {
            return null;
        }

        return findDefiningTypeCollection(parent);
    }

    private static CppElements.Include internalInclude(EObject obj) {
        // search for parent type collection
        FTypeCollection tc = findDefiningTypeCollection(obj);

        if (tc == null || !(tc.eContainer() instanceof FModel)) {
            return null;
        }

        FModel model = (FModel)tc.eContainer();
        return new CppElements.LazyInternalInclude(tc, model);
    }

    private static void printStackToTop(EObject obj, String prefix) {
        System.out.println(prefix + " : " + obj);
        System.out.println(prefix + " : " + obj.eResource());

        EObject parent = obj.eContainer();
        if ((parent != obj) && (parent != null)) {
            printStackToTop(parent, prefix + "-" );
        }
    }

    private static CppElements.CppType mapArray(FTypeRef type, FArrayType array) {
        if (array.getElementType() == null) {
            System.err.println("Failed resolving reference " + type.getDerived() + " ");
            return new CppElements.CppType(type,"NO ELEMENT TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
            FTypeRef elementType = array.getElementType();
            CppElements.CppType actual = map(elementType);

            String typeName = array.getName(); // use name defined for array
            if (typeName != null) {

                // lookup where array typedef came from, setup includes
                Set<CppElements.Include> includes = Sets.newHashSet(internalInclude(array));

                return new CppElements.CppType(type, typeName, CppElements.TypeInfo.Complex, includes, asList(actual));
            }

            // lookup where array element type came from, setup includes
            CppElements.Include include = internalInclude(elementType);

            return wrapArrayType(type, actual);
        }
    }

    public static CppElements.CppType wrapArrayType(FTypeRef type, CppElements.CppType actual) {
        Set<CppElements.Include> includes = actual.includes;
        includes.add(VECTOR_INCLUDE);
        String typeName = "std::vector< " + actual.typeName + " >"; // if no name is given, fallback to underlying type

        return new CppElements.CppType(type, typeName, CppElements.TypeInfo.Complex, includes, asList(actual));
    }

    private static CppElements.CppType mapMap(FTypeRef type, FMapType map) {
        if (map.getKeyType() == null || map.getValueType() == null ) {
            return new CppElements.CppType(type,"NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
            CppElements.CppType key = map(map.getKeyType());
            CppElements.CppType value = map(map.getValueType());
            String typeName = "std::map< " + key.typeName + ", " + value.typeName + " >";

            Set<CppElements.Include> includes = key.includes;
            value.includes.forEach(include -> { includes.add(include); });
            includes.add(MAP_INCLUDE);
            return new CppElements.CppType(type, typeName, CppElements.TypeInfo.Complex, includes, asList(key, value));
        }
    }

    private static CppElements.CppType mapStruct(FTypeRef type, FStructType struct) {
        if (struct.getElements().isEmpty() ) {
            return new CppElements.CppType(type,"EMPTY STRUCT", CppElements.TypeInfo.Invalid);
        } else {
            Set<CppElements.Include> includes = new HashSet<>();
            ArrayList<CppElements.CppType> references = new ArrayList<>();
            struct.getElements().forEach(element -> {
                CppElements.CppType elementType = map(element.getType());
                elementType.includes.forEach(include -> { includes.add(include); });
                references.add(elementType);
            });

            return new CppElements.CppType(type, struct.getName(), CppElements.TypeInfo.Complex, includes, references);
        }
    }

    private static boolean isInstanceId(FTypeDef typedef) {
        return typedef.getActualType().getDerived() != null &&
                "InstanceId".equals(typedef.getActualType().getDerived().getName());
    }

    private static CppElements.CppType mapPredefined(FTypeRef type) {
        switch (type.getPredefined().getValue()) {
            case FBasicTypeId.BOOLEAN_VALUE: return new CppElements.CppType(type, "bool", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.FLOAT_VALUE: return new CppElements.CppType(type, "float", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.DOUBLE_VALUE: return new CppElements.CppType(type, "double", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.INT8_VALUE: return new CppElements.CppType(type, "int8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT16_VALUE: return new CppElements.CppType(type,"int16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT32_VALUE: return new CppElements.CppType(type,"int32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT64_VALUE: return new CppElements.CppType(type,"int64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT8_VALUE: return new CppElements.CppType(type,"uint8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT16_VALUE: return new CppElements.CppType(type,"uint16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT32_VALUE: return new CppElements.CppType(type,"uint32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT64_VALUE: return new CppElements.CppType(type,"uint64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.STRING_VALUE: return new CppElements.CppType(type,"std::string", CppElements.TypeInfo.Complex, STRING_INCLUDE);
            case FBasicTypeId.BYTE_BUFFER_VALUE: return new CppElements.CppType(type,"std::vector< uint8_t >", CppElements.TypeInfo.Complex, VECTOR_INCLUDE);
            default: return new CppElements.CppType(type,"UNMAPPED PREDEFINED", CppElements.TypeInfo.Invalid);
        }
    }
}
