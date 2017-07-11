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

package com.here.ivi.api.generator.common.jni;

import com.here.ivi.api.generator.baseapi.StubModelBuilder;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaElement;
import com.here.ivi.api.model.javamodel.JavaMethod;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;

/*
 * This class builds a correspondence-tree containing correspondences between java and cpp model
 * elements. Currently only corresponding classes and theirs corresponding methods are calculated.
 *
 * Preconditions:
 *
 * For correspondence calculation it is assumed to have one to one mapping, i.e. one franca element
 * is mapped to one target model element at maximum.
 *
 * It is assumed that Java- and StubModelbuilder's finishBuilding methods are called in advance
 * of calling finishBuilding on JniModelBuilder (constructed java and cpp elements need to be
 * accessible via getResults(..) ).
 *
 */
public class CorrespondenceBuilder
    extends AbstractModelBuilder<CorrespondenceBuilder.CorrespondenceTreeNode> {

  public static class ElementPair {

    public final JavaElement javaElement;
    public final CppElement stubElement;

    ElementPair(JavaElement javaElement, CppElement stubElement) {
      this.javaElement = javaElement;
      this.stubElement = stubElement;
    }
  }

  public static class CorrespondenceTreeNode {

    public final ElementPair elementPair;
    public final List<CorrespondenceTreeNode> children = new LinkedList<>();

    CorrespondenceTreeNode(JavaElement javaElement, CppElement cppElement) {
      this.elementPair = new ElementPair(javaElement, cppElement);
    }
  }

  private final JavaModelBuilder javaBuilder;
  private final StubModelBuilder stubBuilder;

  public CorrespondenceBuilder(
      final ModelBuilderContextStack<CorrespondenceTreeNode> contextStack,
      final JavaModelBuilder javaBuilder,
      final StubModelBuilder stubBuilder) {
    super(contextStack);
    this.javaBuilder = javaBuilder;
    this.stubBuilder = stubBuilder;
  }

  public CorrespondenceBuilder(
      final JavaModelBuilder javaBuilder, final StubModelBuilder stubBuilder) {
    super(new ModelBuilderContextStack<>());
    this.javaBuilder = javaBuilder;
    this.stubBuilder = stubBuilder;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    //collect classes
    JavaClass javaElement = getFirstResult(javaBuilder.getResults(), JavaClass.class);
    CppClass cppElement = getFirstResult(stubBuilder.getResults(), CppClass.class);

    //create tree
    if (javaElement != null && cppElement != null) {
      CorrespondenceTreeNode treeNode = new CorrespondenceTreeNode(javaElement, cppElement);

      //store method pairs in children nodes
      for (CorrespondenceTreeNode node : getCurrentContext().previousResults) {
        treeNode.children.add(node);
      }
      storeResult(treeNode);
    }

    // we'll end up with a tree containing the correspondences ...
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    //collect methods
    JavaMethod javaElement = getFirstResult(javaBuilder.getResults(), JavaMethod.class);
    CppMethod cppElement = getFirstResult(stubBuilder.getResults(), CppMethod.class);

    if (javaElement != null && cppElement != null) {
      storeResult(new CorrespondenceTreeNode(javaElement, cppElement));
    }
    closeContext();
  }

  private static <T> T getFirstResult(List<? super T> list, Class<T> type) {
    return list.stream()
        .filter(element -> type.isAssignableFrom(element.getClass()))
        .map(element -> (T) element)
        .findFirst()
        .orElse(null);
  }
}
