package com.here.ivi.api.model;


import org.eclipse.xtext.util.Strings;

import java.util.List;

class PackageHelper {
    static List<String> splitPackage(String modelName) {
        return Strings.split(modelName, ".");
    }
}
