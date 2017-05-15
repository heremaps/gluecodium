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

import com.here.ivi.api.generator.common.cpp.CppNameRules;
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
      if (this == o) {
        return true;
      }
      if (o == null || getClass() != o.getClass()) {
        return false;
      }

      InternalPublicInclude that = (InternalPublicInclude) o;

      return file.equals(that.file);
    }

    @Override
    public int hashCode() {
      return file.hashCode();
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
    public final CppNameRules nameRules;

    public LazyInternalInclude(DefinedBy def, CppNameRules nameRules) {
      this(def, InternalType.TypeCollection, nameRules);
    }

    public LazyInternalInclude(DefinedBy def, InternalType type, CppNameRules nameRules) {
      this.tc = def.type;
      this.model = def.model;
      this.type = type;
      this.nameRules = nameRules;
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

      return toString().equals(that.toString());
    }

    @Override
    public int hashCode() {
      return toString().hashCode();
    }
  }
}
