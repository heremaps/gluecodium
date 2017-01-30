package com.here.ivi.api.generator.common;

import org.franca.core.franca.FInitializerExpression;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;

import java.util.*;

import static java.util.Arrays.asList;

public class CppElements {
    public enum Visibility {
        Default,
        Public,
        Protected,
        Private
    }

    public enum TypeInfo {
        Invalid,
        BuiltIn,
        InterfaceInstance,
        Complex
    }

    public interface Include {
    }

    public static class SystemInclude implements Include {
        public final String file;

        public SystemInclude(String f) {
            file = f;
        }

        @Override
        public int hashCode() {
            return file.hashCode();
        }
    }

    public static class InternalPublicInclude implements Include {
        public final String file;

        public InternalPublicInclude(String f) {
            file = f;
        }

        @Override
        public int hashCode() {
            return file.hashCode();
        }
    }

    public static class LazyInternalInclude implements Include {
        public final FTypeCollection tc;
        public final FModel model;

        public LazyInternalInclude(FTypeCollection tc, FModel model) {
            this.tc = tc;
            this.model = model;
        }

        @Override
        public String toString() {
            return (model.getName() + "." + tc.getName());
        }
        @Override
        public int hashCode() {
            return toString().hashCode();
        }
    }

    public static class CppValue {
        public String value;
        public FInitializerExpression expression;

        public boolean isValid() {
            return expression != null;
        }

        public CppValue() {
            this.value = "INVALID";
        }

        public CppValue(String value, FInitializerExpression expression) {
            this.value = value;
            this.expression = expression;
        }
    }

    public static class CppElement {
        public Visibility visibility = Visibility.Default;
        public String name;

        @Override
        public int hashCode() {
            return name.hashCode();
        }
    }

    public static class CppTypeDef extends CppElement {
        public CppType targetType;
    }

    public static class CppConstant extends CppElement {
        public CppType type;
        public CppValue value;

        public boolean isValid() {
            return type.isValid() && value.isValid();
        }
    }

    public static class CppEnum extends CppElement {
        public List<CppEnumItem> items = new ArrayList<>();
        public boolean isValid() {
            boolean ret = true;
            for (CppEnumItem item : items) {
                if (!item.isValid()) {
                    ret = false;
                    break;
                }
            }
            return !items.isEmpty() && !name.isEmpty() && ret;
        }
    }

    public static class CppEnumItem extends CppElement {
        public CppValue value;
        public boolean isValid() { return !name.isEmpty(); }

    }

    public static class CppEnumClass extends CppElement {
        public CppEnum enumeration;
        public boolean isValid() { return enumeration.isValid(); }
    }

    public static class CppStruct extends CppElement {
        public CppStruct inherits;
        public List<CppField> fields = new ArrayList<>();
    }

    public static class CppField extends CppElement {
        public CppType type;
        public CppValue initializer;
    }

    public static class CppParameter extends CppElement {
        public CppType type;
        public CppValue value;

        public boolean equals(Object other) {
            if (other == null) {
                return false;
            }
            if (other == this) {
                return true;
            }
            if (!(other instanceof CppParameter)) {
                return false;
            }

            CppParameter otherParameter = (CppParameter) other;
            return type.equals(otherParameter.type);// CppValue comparison is irrelevant.
        }


    }

    public static class CppClass extends CppElement{
        public Set<CppMethod> methods = new HashSet();
    }

    public static class CppMethod extends CppElement {
        public String comment;
        public String returnType; //TODO: this should be CppType, once this supports existing types
        public List<CharSequence> specifiers = new ArrayList<>();
        public List<CharSequence> qualifiers = new ArrayList<>();
        public List<CppParameter> inParameters = new ArrayList<>();
        public List<CppParameter> outParameters = new ArrayList<>();


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
            CppMethod otherMethod= (CppMethod)other;

            //TODO move to a helper.
            boolean inParamsEquality = areEqual(inParameters, otherMethod.inParameters);
            boolean outParamsEquality = areEqual(outParameters, otherMethod.outParameters);
            boolean specifiersEquality = areEqual(specifiers, otherMethod.specifiers);
            boolean qualifiersEquality = areEqual(qualifiers, otherMethod.qualifiers);

            return name.equals(otherMethod.name) &&
                   returnType.equals(otherMethod.returnType) && inParamsEquality && outParamsEquality
                    && specifiersEquality && qualifiersEquality;
        }
    }

    public static class CppNamespace extends CppElement {
        public List<CppElement> members = new ArrayList<>();

        public CppNamespace() {
            this("", null);
        }

        public CppNamespace(String name) {
            this(name, null);
        }

        public CppNamespace(String name, CppNamespace lastNs) {
            this.name = name;
            if (lastNs != null) {
                this.members.add(lastNs);
            }
        }
    }

    public static class CppType {
        public FTypeRef type;
        public String typeName = "INVALID";
        public TypeInfo info = TypeInfo.Invalid;
        public Set<Include> includes;
        public Set<CppType> referencedTypes;

        public boolean isValid() {
            return info != TypeInfo.Invalid;
        }

        public CppType(FTypeRef type) {
            this.type = type;
        }

        public CppType(FTypeRef type, String typeName, TypeInfo info) {
            this(type, typeName, info, Collections.emptySet());
        }
        public CppType(FTypeRef type, String typeName, TypeInfo info, Include... includes) {
            this(type, typeName, info, asList(includes));
        }

        public CppType(FTypeRef type, String typeName, TypeInfo info, Collection<Include> includes) {
            this(type, typeName, info, includes, Collections.emptySet());
        }
        public CppType(FTypeRef type, String typeName, TypeInfo info,
                       Collection<Include> includes, Collection<CppType> referencedTypes) {
            this.type = type;
            this.typeName = typeName;
            this.info = info;
            this.includes = new HashSet<>(includes);
            this.referencedTypes = new HashSet<>(referencedTypes);
        }

        @Override
        public int hashCode() {
            return typeName.hashCode();
        }

        public boolean equals(Object other) {
            if (other == null) {
                return false;
            }
            if (other == this) {
                return true;
            }
            if (!(other instanceof CppType)) {
                return false;
            }

            CppType otherType = (CppType) other;
            return typeName.equals(otherType.typeName);
        }
    }

    public static CppNamespace packageToNamespace(String[] packages) {
        CppNamespace lastNs = null;
        for (String p : packages) {
            lastNs = new CppNamespace(p, lastNs);
        }

        if (lastNs != null) {
            return lastNs;
        }

        return new CppNamespace();
    }

    public static Set<Include> collectIncludes(CppElements.CppNamespace root) {
        Set<Include> results = new HashSet<>();

        for (CppElements.CppElement m : root.members) {

            if (m instanceof CppNamespace) {
                results.addAll(collectIncludes((CppNamespace) m));
            }
            if (m instanceof CppStruct) {
                CppStruct struct = (CppStruct) m;
                struct.fields.stream().map(f -> f.type.includes).forEach(results::addAll);
            }
            if (m instanceof CppConstant) {
                CppConstant constant = (CppConstant) m;
                results.addAll(constant.type.includes);
            }
            // TODO go through classes, and methods
        }

        return results;
    }

    //TODO move to helper class
    public static <T> boolean areEqual(List<T> a, List<T> b) {
        List<T> listOne = new ArrayList<>(a);
        List<T> listTwo = new ArrayList<>(b);
        listOne.removeAll(b);
        listTwo.removeAll(a);
        return listOne.isEmpty() && listTwo.isEmpty();
    }
}
