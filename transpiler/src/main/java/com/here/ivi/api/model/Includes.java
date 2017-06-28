/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model;

import com.here.ivi.api.model.franca.DefinedBy;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

public class Includes {
  public interface Include {}

  public static class SystemInclude implements Include {
    public final String file;

    public SystemInclude(String f) {
      file = f;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) {
        return true;
      }
      if (o == null || getClass() != o.getClass()) {
        return false;
      }

      SystemInclude that = (SystemInclude) o;

      return file != null ? file.equals(that.file) : that.file == null;
    }

    @Override
    public int hashCode() {
      return file != null ? file.hashCode() : 0;
    }
  }

  public static class InternalPublicInclude implements Include {
    public final String file;

    public InternalPublicInclude(String f) {
      file = f;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) {
        return true;
      }
      if (o == null || getClass() != o.getClass()) {
        return false;
      }

      InternalPublicInclude that = (InternalPublicInclude) o;

      return file != null ? file.equals(that.file) : that.file == null;
    }

    @Override
    public int hashCode() {
      return file != null ? file.hashCode() : 0;
    }
  }

  public enum InternalType {
    Interface,
    TypeCollection
  }

  public static class LazyInternalInclude implements Include {
    public final FTypeCollection tc;
    public final FModel model;
    public final InternalType type;

    public LazyInternalInclude(DefinedBy def) {
      this(def, InternalType.TypeCollection);
    }

    public LazyInternalInclude(DefinedBy def, InternalType type) {
      this.tc = def.type;
      this.model = def.model;
      this.type = type;
    }

    @Override
    public String toString() {
      return (model.getName() + "." + tc.getName());
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) {
        return true;
      }
      if (o == null || getClass() != o.getClass()) {
        return false;
      }

      LazyInternalInclude that = (LazyInternalInclude) o;

      if (tc != null ? !tc.equals(that.tc) : that.tc != null) {
        return false;
      }
      if (model != null ? !model.equals(that.model) : that.model != null) {
        return false;
      }
      return type == that.type;
    }

    @Override
    public int hashCode() {
      int result = tc != null ? tc.hashCode() : 0;
      result = 31 * result + (model != null ? model.hashCode() : 0);
      result = 31 * result + (type != null ? type.hashCode() : 0);
      return result;
    }
  }
}
