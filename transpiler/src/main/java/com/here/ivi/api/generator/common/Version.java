package com.here.ivi.api.generator.common;

import org.franca.core.franca.FVersion;

public class Version {
    final int major;
    final int minor;
    final int patch;

    public Version(int major, int minor, int patch) {
        this.major = major;
        this.minor = minor;
        this.patch = patch;
    }

    public static Version create(FVersion version) {
        return new Version(version.getMajor(), version.getMinor(), 0);
    }

    @Override
    public String toString() {
        return String.valueOf(major) + '.' + minor + '.' + patch;
    }
}
