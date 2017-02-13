package com.here.ivi.api.model.cppmodel;

 import java.util.Objects;
 import java.util.stream.Stream;

public class CppElement {
    public CppElements.Visibility visibility = CppElements.Visibility.Default;
    public String name;

    public CppElement() {
    }

    public CppElement(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return this.getClass().getSimpleName() + "::" + name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CppElement that = (CppElement) o;

        return name != null ? name.equals(that.name) : that.name == null;
    }

    @Override
    public int hashCode() {
        return name != null ? name.hashCode() : 0;
    }

    public Stream<CppElement> stream() {
        return Stream.empty();
    }

    public final Stream<CppElement> streamRecursive() {
        return Stream.concat(
                Stream.of(this),
                stream().filter(Objects::nonNull).flatMap(CppElement::streamRecursive));
    }
}
