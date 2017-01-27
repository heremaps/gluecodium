package com.here.ivi.api.generator.common;

import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FInitializer;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FrancaFactory;

public class CppDefaultInitializer {
    public static CppElements.CppValue map(FTypeRef it)
    {
        if (it.getDerived() != null)
        {
            return null;
        }
        else
        {
            FInitializer expr = FrancaFactory.eINSTANCE.createFInitializer();
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
                    return new CppElements.CppValue( "0", expr);
                case FBasicTypeId.STRING_VALUE:
                    return null;
                case FBasicTypeId.BOOLEAN_VALUE:
                    return new CppElements.CppValue( "false", expr);
                case FBasicTypeId.FLOAT_VALUE:
                    return new CppElements.CppValue( "std::numeric_limits<float>::quiet_NaN()", expr);
                case FBasicTypeId.DOUBLE_VALUE:
                    return new CppElements.CppValue( "std::numeric_limits<double>::quiet_NaN()", expr);
                case FBasicTypeId.BYTE_BUFFER_VALUE:
                    return null;
            }
        }

        return null;
    }

}
