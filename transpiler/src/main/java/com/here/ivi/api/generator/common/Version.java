package com.here.ivi.api.generator.common;

public class Version {
    final int major;
    final int minor;
    final int patch;

    public Version(int major, int minor, int patch) {
        this.major = major;
        this.minor = minor;
        this.patch = patch;
    }

    @Override
    public String toString() {
        return String.valueOf(major) + '.' + minor + '.' + patch;
    }
}
