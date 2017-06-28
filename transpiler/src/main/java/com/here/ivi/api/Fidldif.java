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

package com.here.ivi.api;

import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelHelper;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;

@SuppressWarnings("BooleanMethodIsAlwaysInverted")
public class Fidldif {
  public static void main(final String[] args) {
    if (args.length != 2) return;

    // using the BaseApiSpec to keep things simple ...
    final BaseApiSpecAccessorFactory specAccessorFactory = new BaseApiSpecAccessorFactory();
    final FrancaModelLoader<?, ?> fml = new FrancaModelLoader<>(specAccessorFactory);
    ModelHelper.getFdeplInjector().injectMembers(fml);

    final FrancaModel<?, ?> a =
        fml.load(
            specAccessorFactory.getSpecPath(),
            FrancaModelLoader.listFilesRecursively(new File(args[0])));
    final FrancaModel<?, ?> b =
        fml.load(
            specAccessorFactory.getSpecPath(),
            FrancaModelLoader.listFilesRecursively(new File(args[1])));

    // find removed interfaces
    List<Interface<?>> removedInterfaces =
        a.getInterfaces()
            .stream()
            .filter(f -> !b.getInterfaces().contains(f))
            .collect(Collectors.toList());

    // find added interfaces
    List<Interface<?>> addedInterfaces =
        b.getInterfaces()
            .stream()
            .filter(f -> !a.getInterfaces().contains(f))
            .collect(Collectors.toList());

    System.out.println("removed interfaces:");
    for (Interface<?> iface : removedInterfaces) {
      System.out.println("   * " + iface.getName());
    }
    System.out.println("added interfaces:");
    for (Interface<?> iface : addedInterfaces) {
      System.out.println("   * " + iface.getName());
    }

    int resultCode = 0;

    // compare interfaces
    for (Interface<?> ifa : a.getInterfaces()) {
      int bndx = b.getInterfaces().indexOf(ifa);
      if (bndx >= 0) {
        Interface<?> ifb = b.getInterfaces().get(bndx);

        // removed methods
        List<FMethod> removedMethods =
            ifa.getFrancaInterface()
                .getMethods()
                .stream()
                .filter(i -> !findF(i, ifb.getFrancaInterface().getMethods()))
                .collect(Collectors.toList());

        removedMethods.forEach(
            ma -> System.out.println("in " + ifa.getName() + " removed method " + ma.getName()));

        // added methods
        List<FMethod> addedMethods =
            ifb.getFrancaInterface()
                .getMethods()
                .stream()
                .filter(i -> !findF(i, ifa.getFrancaInterface().getMethods()))
                .collect(Collectors.toList());
        addedMethods.forEach(
            mb -> System.out.println("in " + ifb.getName() + " added method " + mb.getName()));

        // removed attributes
        List<FAttribute> removedAttributes =
            ifa.getFrancaInterface()
                .getAttributes()
                .stream()
                .filter(i -> !findF(i, ifb.getFrancaInterface().getAttributes()))
                .collect(Collectors.toList());
        removedAttributes.forEach(
            aa -> System.out.println("in " + ifa.getName() + " removed attribute " + aa.getName()));

        // added attributes
        List<FAttribute> addedAttributes =
            ifb.getFrancaInterface()
                .getAttributes()
                .stream()
                .filter(i -> !findF(i, ifa.getFrancaInterface().getAttributes()))
                .collect(Collectors.toList());
        addedAttributes.forEach(
            ab -> System.out.println("in " + ifb.getName() + " added attribute " + ab.getName()));

        boolean changedArgs = false;
        for (FMethod am : ifa.getFrancaInterface().getMethods()) {
          for (FMethod bm : ifb.getFrancaInterface().getMethods()) {
            if (bm.getName().equals(am.getName())) {
              if (am.getInArgs().size() == bm.getInArgs().size()
                  && am.getOutArgs().size() == bm.getOutArgs().size()) {

                if (!compareArguments(
                    am.getName(), am.getInArgs().iterator(), bm.getInArgs().iterator())) {
                  changedArgs = true;
                }

                if (!compareArguments(
                    am.getName(), am.getOutArgs().iterator(), bm.getOutArgs().iterator())) {
                  changedArgs = true;
                }
              } else {
                System.out.println(am.getName() + " has different argument count");
                changedArgs = true;
              }
            }
          }
        }

        Version va = ifa.getVersion();
        Version vb = ifb.getVersion();

        // check if major if necessary
        if ((removedMethods.isEmpty() || removedAttributes.isEmpty() || changedArgs)
            && va.major >= vb.major) {
          System.err.println(
              "incompatible change in " + ifb.getName() + "! Major version increase needed");
          resultCode = -1;
        }

        // same for minor
        if ((addedMethods.isEmpty() || addedAttributes.isEmpty())
            && va.major == vb.major
            && va.minor >= vb.minor) {
          System.err.println(
              "elements added in " + ifb.getName() + "! Minor version increase needed");
          resultCode = -1;
        }
      }
    }
    System.exit(resultCode);
  }

  private static <T extends FModelElement> boolean findF(T t, List<T> list) {
    for (T a : list) {
      if (a.getName().equals(t.getName())) {
        return true;
      }
    }
    return false;
  }

  private static boolean compareArguments(
      String ifName, Iterator<FArgument> iter_aarg, Iterator<FArgument> iter_barg) {
    boolean result = true;

    while (iter_aarg.hasNext() && iter_barg.hasNext()) {
      FArgument aarg = iter_aarg.next();
      FArgument barg = iter_barg.next();
      if (!barg.getName().equals(aarg.getName())) {
        System.out.println(
            ifName + " input argument " + aarg.getName() + " renamed to " + barg.getName());
        result = false;
        continue;
      }
      if (aarg.getType().getPredefined() != barg.getType().getPredefined()) {
        System.out.println(ifName + " input argument " + aarg.getName() + " changed type");
        result = false;
      }
    }

    return result;
  }
}
