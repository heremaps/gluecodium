package com.here.ivi.api.model.cppmodel;

public class CppElement {
    public CppElements.Visibility visibility = CppElements.Visibility.Default;
    public String name;

    @Override
    public int hashCode() {
        return name.hashCode();
    }
}
