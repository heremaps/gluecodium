package com.here.ivi.api.generator.common;

import com.google.common.collect.Sets;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.Includes;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

import java.util.*;

import static java.util.Arrays.asList;

public class CppTypeMapper {
    private final static Includes.SystemInclude INTYPES_INCLUDE = new Includes.SystemInclude("stdint.h");
    private final static Includes.SystemInclude VECTOR_INCLUDE = new Includes.SystemInclude("vector");
    private final static Includes.SystemInclude MAP_INCLUDE = new Includes.SystemInclude("map");
    private final static Includes.SystemInclude STRING_INCLUDE = new Includes.SystemInclude("string");

    public static CppType map(FTypeRef type) {
        if (type.getDerived() != null) {
            return mapDerived(type);
        } else if (type.getPredefined() != null) {
            return mapPredefined(type);
        }
        return new CppType();
    }

    private static CppType mapDerived(FTypeRef type) {
        FType derived = type.getDerived();
        if (derived instanceof FTypeDef) {
            return mapTypeDef( (FTypeDef) derived);
        }
        if (derived instanceof FArrayType) {
            return mapArray( (FArrayType) derived);
        }
        if (derived instanceof FMapType) {
            FMapType typedef = (FMapType) derived;
            return mapMap( (FMapType) derived);
        }
        if (derived instanceof FStructType) {
            return mapStruct( (FStructType) derived);
        }

        return new CppType("UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
    }

    private static CppType mapTypeDef(FTypeDef typedef) {
        if (typedef.getActualType() == null) {
            return new CppType("NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else if (isInstanceId(typedef)) {
            CppType actual = map(typedef.getActualType());
            // TODO check that this InstanceId is actually the correct one or add special fdepl info to it
            // TODO figure out the right include for this type
            return new CppType( typedef.getName(), CppElements.TypeInfo.InterfaceInstance);
        } else {
            FTypeRef underlyingType = typedef.getActualType();

            CppType actual = map(underlyingType);

            // lookup where type came from, setup includes
            Includes.Include include = internalInclude(underlyingType);

            // actually use the typedef in this case, not the underlying type
            return new CppType( typedef.getName(), actual.info, include);
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

    private static Includes.Include internalInclude(EObject obj) {
        // search for parent type collection
        FTypeCollection tc = findDefiningTypeCollection(obj);

        if (tc == null || !(tc.eContainer() instanceof FModel)) {
            return null;
        }

        FModel model = (FModel)tc.eContainer();
        return new Includes.LazyInternalInclude(tc, model);
    }

    private static void printStackToTop(EObject obj, String prefix) {
        System.out.println(prefix + " : " + obj);
        System.out.println(prefix + " : " + obj.eResource());

        EObject parent = obj.eContainer();
        if ((parent != obj) && (parent != null)) {
            printStackToTop(parent, prefix + "-" );
        }
    }

    public static CppType mapArray(FArrayType array) {
        if (array.getElementType() == null) {
            System.err.println("Failed resolving array element type (indicates wrong typedef)");
            return new CppType("NO ELEMENT TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
            FTypeRef elementType = array.getElementType();
            CppType actual = map(elementType);

            String typeName = array.getName(); // use name defined for array
            if (typeName != null) {

                // lookup where array typedef came from, setup includes
                Set<Includes.Include> includes = Sets.newHashSet(internalInclude(array));

                return new CppType( typeName, CppElements.TypeInfo.Complex, includes, asList(actual));
            }

            // lookup where array element type came from, setup includes
            Includes.Include include = internalInclude(elementType);

            return wrapArrayType( actual);
        }
    }

    public static CppType wrapArrayType(CppType actual) {
        Set<Includes.Include> includes = actual.includes;
        includes.add(VECTOR_INCLUDE);
        String typeName = "std::vector< " + actual.typeName + " >"; // if no name is given, fallback to underlying type

        return new CppType( typeName, CppElements.TypeInfo.Complex, includes, asList(actual));
    }

    private static CppType mapMap(FMapType map) {
        if (map.getKeyType() == null || map.getValueType() == null ) {
            return new CppType("NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
            CppType key = map(map.getKeyType());
            CppType value = map(map.getValueType());
            String typeName = "std::map< " + key.typeName + ", " + value.typeName + " >";

            Set<Includes.Include> includes = key.includes;
            value.includes.forEach(include -> { includes.add(include); });
            includes.add(MAP_INCLUDE);
            return new CppType(typeName, CppElements.TypeInfo.Complex, includes, asList(key, value));
        }
    }

    private static CppType mapStruct(FStructType struct) {
        if (struct.getElements().isEmpty() ) {
            return new CppType("EMPTY STRUCT", CppElements.TypeInfo.Invalid);
        } else {
            Set<Includes.Include> includes = new HashSet<>();
            ArrayList<CppType> references = new ArrayList<>();
            struct.getElements().forEach(element -> {
                CppType elementType = map(element.getType());
                elementType.includes.forEach(include -> { includes.add(include); });
                references.add(elementType);
            });

            return new CppType(struct.getName(), CppElements.TypeInfo.Complex, includes, references);
        }
    }

    private static boolean isInstanceId(FTypeDef typedef) {
        return typedef.getActualType().getDerived() != null &&
                "InstanceId".equals(typedef.getActualType().getDerived().getName());
    }

    private static CppType mapPredefined(FTypeRef type) {
        int v = type.getPredefined().getValue();
        switch (v) {
            case FBasicTypeId.BOOLEAN_VALUE: return new CppType("bool", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.FLOAT_VALUE: return new CppType("float", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.DOUBLE_VALUE: return new CppType("double", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.INT8_VALUE: return new CppType("int8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT16_VALUE: return new CppType("int16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT32_VALUE: return new CppType("int32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT64_VALUE: return new CppType("int64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT8_VALUE: return new CppType("uint8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT16_VALUE: return new CppType("uint16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT32_VALUE: return new CppType("uint32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT64_VALUE: return new CppType("uint64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.STRING_VALUE: return new CppType("std::string", CppElements.TypeInfo.Complex, STRING_INCLUDE);
            case FBasicTypeId.BYTE_BUFFER_VALUE: return new CppType("std::vector< uint8_t >", CppElements.TypeInfo.Complex, VECTOR_INCLUDE);
            default: return new CppType("UNMAPPED PREDEFINED [" + type.getPredefined().getName() + "]", CppElements.TypeInfo.Invalid);
        }
    }
}
