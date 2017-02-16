package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.cppstub.templates.MethodBodyTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import static com.here.ivi.api.model.cppmodel.CppElements.areEqual;
import static com.here.ivi.api.model.cppmodel.CppElements.areEqualOrdered;

public class CppMethod extends CppElement {
    public String comment;
    public String returnType = "void"; //TODO: this should be CppType, once this supports existing types
    public List<String> specifiers = new ArrayList<>();
    public List<String> qualifiers = new ArrayList<>();
    public List<CppParameter> inParameters = new ArrayList<>();
    public List<CppParameter> outParameters = new ArrayList<>();

    public MethodBodyTemplate mbt;

    @Override
    public boolean equals(Object other) {
        if (other == null) {
            return false;
        }
        if (other == this) {
            return true;
        }
        if (!(other instanceof CppMethod)) {
            return false;
        }
        CppMethod otherMethod = (CppMethod) other;

        // TODO move to a helper.
        boolean inParamsEquality = areEqualOrdered(inParameters, otherMethod.inParameters);
        boolean outParamsEquality = areEqualOrdered(outParameters, otherMethod.outParameters);
        boolean specifiersEquality = areEqual(specifiers, otherMethod.specifiers);
        boolean qualifiersEquality = areEqual(qualifiers, otherMethod.qualifiers);

        return super.equals(other) &&
                returnType.equals(otherMethod.returnType) && inParamsEquality && outParamsEquality
                && specifiersEquality && qualifiersEquality;
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.concat(inParameters.stream(), outParameters.stream());
    }
}
