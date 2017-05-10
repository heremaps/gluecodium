package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.model.cppmodel.CppValue;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FField;
import org.franca.core.franca.FTypeRef;

public class CppDefaultInitializer {

    public static CppValue map(FField field) {
        // arrays are initialized empty
        if (field.isArray()) {
            return null;
        }

        // use default value for type
        return map(field.getType());
    }

    public static CppValue map(FTypeRef it)
    {
        if (it.getDerived() != null)
        {
            return null;
        }

        switch (it.getPredefined().getValue())
        {
            case FBasicTypeId.INT8_VALUE:
            case FBasicTypeId.INT16_VALUE:
            case FBasicTypeId.INT32_VALUE:
            case FBasicTypeId.INT64_VALUE:
            case FBasicTypeId.UINT8_VALUE:
            case FBasicTypeId.UINT16_VALUE:
            case FBasicTypeId.UINT32_VALUE:
            case FBasicTypeId.UINT64_VALUE:
                return new CppValue( "0" );
            case FBasicTypeId.STRING_VALUE:
                return null;
            case FBasicTypeId.BOOLEAN_VALUE:
                return new CppValue( "false" );
            case FBasicTypeId.FLOAT_VALUE:
                return CppValueMapper.NAN_FLOAT;
            case FBasicTypeId.DOUBLE_VALUE:
                return CppValueMapper.NAN_DOUBLE;
            case FBasicTypeId.BYTE_BUFFER_VALUE:
                return null;
        }


        return null;
    }
}
