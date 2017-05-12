package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.model.Includes;

public class CppLibraryIncludes {
    public final static Includes.SystemInclude INT_TYPES = new Includes.SystemInclude("stdint.h");
    public final static Includes.SystemInclude LIMITS = new Includes.SystemInclude("limits");
    public final static Includes.SystemInclude MAP = new Includes.SystemInclude("map");
    public final static Includes.SystemInclude MEMORY = new Includes.SystemInclude("memory");
    public final static Includes.SystemInclude SET = new Includes.SystemInclude("set");
    public final static Includes.SystemInclude STRING = new Includes.SystemInclude("string");
    public final static Includes.SystemInclude VECTOR = new Includes.SystemInclude("vector");
}
