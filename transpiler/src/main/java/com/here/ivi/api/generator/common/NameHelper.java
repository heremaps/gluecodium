package com.here.ivi.api.generator.common;

import com.google.common.base.CaseFormat;

public class NameHelper {
    static public String toSnakeCase(String input) {
        return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, input);
    }

    static public String toUpperSnakeCase(String input) {
        return CaseFormat.UPPER_CAMEL.to(CaseFormat.UPPER_UNDERSCORE, input);
    }

    static public String toUpperCamel(String input) {
        return CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, input);
    }
}
