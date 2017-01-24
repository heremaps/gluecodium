package com.here.ivi.api.generator.common;

import org.franca.core.franca.FInitializerExpression;
import org.franca.core.franca.FTypeRef;

import java.util.*;

import static java.util.Arrays.asList;

public class CppElements {
    public static final String HEADER_FILE_SUFFIX = ".h";

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
    }

    public static class CppEnumItem extends CppElement {
        public CppValue value;

    }

    public static class CppStruct extends CppElement {
        public CppStruct inherits;
        public List<CppField> fields = new ArrayList<>();
    }

    public static class CppField extends CppElement {
        public CppType type;
    }

    public static class CppParameter extends CppElement {
        public CppType type;
        public CppValue value;
    }

    public static class CppMethod extends CppElement {
        public String comment;
        public String returnType; //TODO: this should be CppType, once this supports existing types
        public List<CharSequence> specifiers = new ArrayList<>();
        public List<CharSequence> qualifiers = new ArrayList<>();
        public List<CppParameter> inParameters = new ArrayList<>();
        public List<CppParameter> outParameters = new ArrayList<>();
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
        public Set<String> includes;
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
        public CppType(FTypeRef type, String typeName, TypeInfo info, String... includes) {
            this(type, typeName, info, asList(includes));
        }

        public CppType(FTypeRef type, String typeName, TypeInfo info, Collection<String> includes) {
            this(type, typeName, info, includes, Collections.emptySet());
        }
        public CppType(FTypeRef type, String typeName, TypeInfo info,
                       Collection<String> includes, Collection<CppType> referencedTypes) {
            this.type = type;
            this.typeName = typeName;
            this.info = info;
            this.includes = new HashSet<>(includes);
            this.referencedTypes = new HashSet<>(referencedTypes);
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
}
