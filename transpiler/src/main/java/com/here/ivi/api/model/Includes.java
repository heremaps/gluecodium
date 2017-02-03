package com.here.ivi.api.model;

import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

public class Includes {
    public interface Include {
    }

    public static class SystemInclude implements Include {
        public final String file;

        public SystemInclude(String f) {
            file = f;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            SystemInclude that = (SystemInclude) o;

            return file.equals(that.file);
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
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            InternalPublicInclude that = (InternalPublicInclude) o;

            return file.equals(that.file);
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
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            LazyInternalInclude that = (LazyInternalInclude) o;

            return toString().equals(that.toString());
        }
        @Override
        public int hashCode() {
            return toString().hashCode();
        }
    }
}
