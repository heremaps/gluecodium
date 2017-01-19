package com.here.ivi.api.generator.common;

import org.franca.core.franca.*;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import static java.util.Arrays.asList;


public class CppTypeMapper {
    private final static String INTYPES_INCLUDE = "stdint.h";
    private final static String VECTOR_INCLUDE = "vector.h";

    enum TypeInfo {
        Invalid,
        BuiltIn,
        InterfaceInstance,
        Complex
    }

    static class Type {
        public FTypeRef type;
        public String typeName = "INVALID";
        public TypeInfo info = TypeInfo.Invalid;
        public Set<String> includes;
        public Set<Type> referencedTypes;

        public Type(FTypeRef type) {
            this.type = type;
        }

        public Type(FTypeRef type, String typeName, TypeInfo info) {
            this(type, typeName, info, Collections.emptySet());
        }
        public Type(FTypeRef type, String typeName, TypeInfo info, String... includes) {
            this(type, typeName, info, asList(includes));
        }

        public Type(FTypeRef type, String typeName, TypeInfo info, Collection<String> includes) {
            this(type, typeName, info, includes, Collections.emptySet());
        }
        public Type(FTypeRef type, String typeName, TypeInfo info,
                    Collection<String> includes, Collection<Type> referencedTypes) {
            this.type = type;
            this.typeName = typeName;
            this.info = info;
            this.includes = new HashSet<>(includes);
            this.referencedTypes = new HashSet<>(referencedTypes);
        }
    }

    public static Type map(FTypeRef type) {
        if (type.getDerived() != null) {
            return mapDerived(type);
        } else if (type.getPredefined() != null) {
            return mapPredefined(type);
        }
        return new Type(type);
    }

    private static Type mapDerived(FTypeRef type) {
        FType derived = type.getDerived();
        if (derived instanceof FArrayType) {
            return mapArray(type, (FArrayType) derived);
        }
        else if (derived instanceof FTypeDef) {
            return mapTypeDef(type, (FTypeDef) derived);
        }
        else if (derived instanceof FMapType) {
            FMapType typedef = (FMapType) derived;

            // TODO add map support
        }

        return new Type(type,"UNMAPPED DERIVED", TypeInfo.Invalid);
    }

    private static Type mapTypeDef(FTypeRef type, FTypeDef typedef) {
        if (typedef.getActualType() == null) {
            return new Type(type,"NO ACTUAL TYPE FOUND", TypeInfo.Invalid);
        } else if (isInstanceId(typedef)) {
            Type actual = map(typedef.getActualType());
            // TODO check that this InstanceId is actually the correct one or add special fdepl info to it
            // TODO figure out the right include for this type
            return new Type(type, typedef.getName(), TypeInfo.InterfaceInstance);
        } else {
            Type actual = map(typedef.getActualType());
            // TODO actually use the typedef in this case, not the underlying type
            // TODO make sure typedef is only declared once, and this file is included correctly
            return actual;
        }
    }

    private static Type mapArray(FTypeRef type, FArrayType array) {
        if (array.getElementType() == null) {
            return new Type(type,"NO ELEMENT TYPE FOUND", TypeInfo.Invalid);
        } else {
            Type actual = map(array.getElementType());
            String typeName = "std::vector< " + actual.typeName + " >";

            Set<String> includes = actual.includes;
            includes.add(VECTOR_INCLUDE);
            return new Type(type, typeName, TypeInfo.Complex, includes, asList(actual));
        }
    }

    private static boolean isInstanceId(FTypeDef typedef) {
        return typedef.getActualType().getDerived() != null &&
               typedef.getActualType().getDerived().getName().equals("InstanceId");
    }

    private static Type mapPredefined(FTypeRef type) {
        switch (type.getPredefined().getValue()) {
            case FBasicTypeId.BOOLEAN_VALUE: return new Type(type, "bool", TypeInfo.BuiltIn);
            case FBasicTypeId.FLOAT_VALUE: return new Type(type, "float", TypeInfo.BuiltIn);
            case FBasicTypeId.DOUBLE_VALUE: return new Type(type, "double", TypeInfo.BuiltIn);
            case FBasicTypeId.INT8_VALUE: return new Type(type, "int8_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT16_VALUE: return new Type(type,"int16_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT32_VALUE: return new Type(type,"int32_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT64_VALUE: return new Type(type,"int64_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT8_VALUE: return new Type(type,"uint8_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT16_VALUE: return new Type(type,"uint16_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT32_VALUE: return new Type(type,"uint32_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT64_VALUE: return new Type(type,"uint64_t", TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.STRING_VALUE: return new Type(type,"std::string", TypeInfo.Complex, INTYPES_INCLUDE);
            case FBasicTypeId.BYTE_BUFFER_VALUE: return new Type(type,"std::vector< uint8_t >", TypeInfo.Complex, VECTOR_INCLUDE);
            default: return new Type(type,"UNMAPPED PREDEFINED", TypeInfo.Invalid);
        }
    }
}
