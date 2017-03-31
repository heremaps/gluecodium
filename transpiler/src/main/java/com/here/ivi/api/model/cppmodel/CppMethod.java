package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.cppstub.templates.MethodBodyTemplate;
import com.here.ivi.api.model.CollectionsHelper;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CppMethod extends CppElement {
    public String comment = null;
    public String deprecatedComment = null;
    public CppType returnType = CppType.Void;
    public List<String> specifiers = new ArrayList<>();
    public List<String> qualifiers = new ArrayList<>();
    public List<CppParameter> inParameters = new ArrayList<>();
    public List<CppParameter> outParameters = new ArrayList<>();

    public MethodBodyTemplate mbt;

    public CharSequence generateBody() {
        if (mbt == null) {
            return null;
        }

        return mbt.generate(this);
    }

    public boolean hasBody() {
        return mbt != null;
    }
    public boolean hasParameters() {
        return !(inParameters.isEmpty() && outParameters.isEmpty());
    }

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
        boolean inParamsEquality = CollectionsHelper.areEqualOrdered(inParameters, otherMethod.inParameters);
        boolean outParamsEquality = CollectionsHelper.areEqualOrdered(outParameters, otherMethod.outParameters);
        boolean specifiersEquality = CollectionsHelper.areEqual(specifiers, otherMethod.specifiers);
        boolean qualifiersEquality = CollectionsHelper.areEqual(qualifiers, otherMethod.qualifiers);

        return super.equals(other) &&
                returnType.equals(otherMethod.returnType) && inParamsEquality && outParamsEquality
                && specifiersEquality && qualifiersEquality;
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.concat(
                Stream.of(returnType),
                Stream.concat(
                        inParameters.stream(),
                        outParameters.stream()));
    }
}
