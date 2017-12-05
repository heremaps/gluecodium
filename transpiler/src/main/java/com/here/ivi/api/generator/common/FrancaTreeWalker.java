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

package com.here.ivi.api.generator.common;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.function.BiConsumer;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/**
 * Tree walker for the Franca model tree decouples tree traversal from the creation of
 * language-specific models. The tree walker has a list of "model builders" and invokes all of the
 * builders for every node.
 *
 * <p>The invocation sequence for each node is the same, regardless of the node type:
 *
 * <ol>
 *   <li>Call builder.startBuilding(node) for each builder.
 *   <li>Walk all child nodes of the current node (recursively).
 *   <li>Call builder.finishBuilding(node) for each builder.
 * </ol>
 *
 * <p>For example, a model element representing a class requires all model elements for its methods
 * to be built beforehand. So it could only be built in the finishBuilding() step. However, for some
 * language models the method elements might need to know the class name to be built. The class name
 * could be calculated at startBuilding() step and thus made available to the children.
 */
public class FrancaTreeWalker extends GenericTreeWalker<ModelBuilder> {

  private static final String IN_ARG_KEY = "InputArgument";
  private static final String OUT_ARG_KEY = "OutputArgument";
  private static final Map<Object, TreeNodeInfo<ModelBuilder, ?>> FRANCA_TREE_STRUCTURE =
      new HashMap<>();

  static {

    // Regular nodes
    initTreeNode(
        FInterface.class,
        ModelBuilder::startBuilding,
        ModelBuilder::finishBuilding,
        FrancaTreeWalker::walkChildNodes);
    initTreeNode(
        FTypeCollection.class,
        ModelBuilder::startBuilding,
        ModelBuilder::finishBuilding,
        FrancaTreeWalker::walkChildNodes);
    initTreeNode(FMethod.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FAttribute.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(
        FConstantDef.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FStructType.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(
        FEnumerationType.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FEnumerator.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FField.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FUnionType.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FTypeDef.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FArrayType.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(FMapType.class, ModelBuilder::finishBuilding, FrancaTreeWalker::walkChildNodes);
    initTreeNode(
        IN_ARG_KEY,
        FArgument.class,
        ModelBuilder::startBuildingInputArgument,
        ModelBuilder::finishBuildingInputArgument,
        FrancaTreeWalker::walkChildNodes);
    initTreeNode(
        OUT_ARG_KEY,
        FArgument.class,
        ModelBuilder::startBuildingOutputArgument,
        ModelBuilder::finishBuildingOutputArgument,
        FrancaTreeWalker::walkChildNodes);

    // Leaf nodes
    initTreeNode(FExpression.class, ModelBuilder::finishBuilding, FrancaTreeWalker::noChildNodes);
    initTreeNode(FTypeRef.class, ModelBuilder::finishBuilding, FrancaTreeWalker::noChildNodes);
  }

  public FrancaTreeWalker(final Collection<ModelBuilder> builders) {
    super(builders, FRANCA_TREE_STRUCTURE);
  }

  public void walkTree(final FTypeCollection francaTypeCollection) {

    walk(francaTypeCollection);
  }

  private static <T extends EObject> void initTreeNode(
      final Class<T> clazz,
      final BiConsumer<ModelBuilder, T> finishMethod,
      final BiConsumer<FrancaTreeWalker, T> walkChildNodes) {

    initTreeNode(clazz, clazz, ModelBuilder::startBuilding, finishMethod, walkChildNodes);
  }

  private static <T extends EObject> void initTreeNode(
      final Class<T> clazz,
      final BiConsumer<ModelBuilder, T> startMethod,
      final BiConsumer<ModelBuilder, T> finishMethod,
      final BiConsumer<FrancaTreeWalker, T> walkChildNodes) {

    initTreeNode(clazz, clazz, startMethod, finishMethod, walkChildNodes);
  }

  private static <T> void initTreeNode(
      Object key,
      final Class<T> clazz,
      final BiConsumer<ModelBuilder, T> startMethod,
      final BiConsumer<ModelBuilder, T> finishMethod,
      final BiConsumer<FrancaTreeWalker, T> walkChildNodes) {

    FRANCA_TREE_STRUCTURE.put(
        key,
        new TreeNodeInfo<>(
            clazz,
            startMethod,
            finishMethod,
            (walker, object) -> walkChildNodes.accept((FrancaTreeWalker) walker, object)));
  }

  private void walkChildNodes(FInterface francaInterface) {
    walkCollection(francaInterface.getMethods());
    walkCollection(francaInterface.getAttributes());
    walkChildNodes((FTypeCollection) francaInterface);
  }

  private void walkChildNodes(FTypeCollection francaTypeCollection) {
    walkCollection(francaTypeCollection.getConstants());
    walkCollection(francaTypeCollection.getTypes());
  }

  private void walkChildNodes(FMethod francaMethod) {
    walkCollection(IN_ARG_KEY, francaMethod.getInArgs());
    walkCollection(OUT_ARG_KEY, francaMethod.getOutArgs());
    walk(francaMethod.getErrorEnum());
  }

  private void walkChildNodes(FStructType francaStructType) {
    walk(francaStructType.getBase());
    walkChildNodes((FCompoundType) francaStructType);
  }

  private void walkChildNodes(FCompoundType francaCompoundType) {
    walkCollection(francaCompoundType.getElements());
  }

  private void walkChildNodes(FTypedElement francaTypedElement) {
    walk(francaTypedElement.getType());
  }

  private void walkChildNodes(FEnumerationType francaEnumerationType) {
    walkCollection(francaEnumerationType.getEnumerators());
  }

  private void walkChildNodes(FEnumerator francaEnumerator) {
    walk(francaEnumerator.getValue());
  }

  private void walkChildNodes(FTypeDef francaTypeDef) {
    walk(francaTypeDef.getActualType());
  }

  private void walkChildNodes(FArrayType francaArrayType) {
    walk(francaArrayType.getElementType());
  }

  private void walkChildNodes(FMapType francaMapType) {
    walk(francaMapType.getKeyType());
    walk(francaMapType.getValueType());
  }
}
