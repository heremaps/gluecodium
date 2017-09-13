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

import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import java.util.Collection;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.logging.Logger;
import org.eclipse.emf.common.util.EList;
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
public class FrancaTreeWalker {

  private static final Logger LOGGER = Logger.getLogger(FrancaTreeWalker.class.getName());

  private final Collection<ModelBuilder> builders;

  public FrancaTreeWalker(final Collection<ModelBuilder> builders) {
    this.builders = builders;
  }

  public void walk(final FrancaElement francaElement) {

    if (francaElement == null || builders == null || builders.isEmpty()) {
      return;
    }

    if (francaElement instanceof Interface) {
      walkChildNodes((Interface) francaElement);
    } else if (francaElement instanceof TypeCollection) {
      walkChildNodes((TypeCollection) francaElement);
    }
  }

  private <T> void walk(
      final T francaElement,
      final BiConsumer<ModelBuilder, T> startMethod,
      final BiConsumer<ModelBuilder, T> finishMethod) {
    walk(francaElement, startMethod, finishMethod, element -> {});
  }

  private <T> void walk(
      final T francaElement,
      final BiConsumer<ModelBuilder, T> startMethod,
      final BiConsumer<ModelBuilder, T> finishMethod,
      final Consumer<T> walkChildNodes) {
    for (ModelBuilder builder : builders) {
      startMethod.accept(builder, francaElement);
    }
    walkChildNodes.accept(francaElement);
    for (ModelBuilder builder : builders) {
      finishMethod.accept(builder, francaElement);
    }
  }

  private void walkChildNodes(Interface anInterface) {
    FInterface francaInterface = anInterface.getFrancaInterface();
    if (francaInterface != null) {
      walk(
          francaInterface,
          ModelBuilder::startBuilding,
          ModelBuilder::finishBuilding,
          this::walkChildNodes);
    }
  }

  private void walkChildNodes(TypeCollection typeCollection) {
    FTypeCollection francaTypeCollection = typeCollection.getFrancaTypeCollection();
    if (francaTypeCollection != null) {
      walk(
          francaTypeCollection,
          ModelBuilder::startBuilding,
          ModelBuilder::finishBuilding,
          this::walkChildNodes);
    }
  }

  private void walkChildNodes(FInterface francaInterface) {
    EList<FMethod> methods = francaInterface.getMethods();
    if (methods != null) {
      for (FMethod method : methods) {
        walk(
            method,
            ModelBuilder::startBuilding,
            ModelBuilder::finishBuilding,
            this::walkChildNodes);
      }
    }
    EList<FAttribute> attributes = francaInterface.getAttributes();
    if (attributes != null) {
      for (FAttribute attribute : attributes) {
        walk(attribute, ModelBuilder::startBuilding, ModelBuilder::finishBuilding);
      }
    }
    walkChildNodes((FTypeCollection) francaInterface);
  }

  private void walkChildNodes(FTypeCollection francaTypeCollection) {
    EList<FConstantDef> constants = francaTypeCollection.getConstants();
    if (constants != null) {
      for (FConstantDef constant : constants) {
        walk(constant, ModelBuilder::startBuilding, ModelBuilder::finishBuilding);
      }
    }
    EList<FType> types = francaTypeCollection.getTypes();
    if (types != null) {
      types.forEach(this::walkType);
    }
  }

  private void walkType(FType type) {
    if (type instanceof FStructType) {
      walk(
          (FStructType) type,
          ModelBuilder::startBuilding,
          ModelBuilder::finishBuilding,
          this::walkChildNodes);
    } else if (type instanceof FTypeDef) {
      walk((FTypeDef) type, ModelBuilder::startBuilding, ModelBuilder::finishBuilding);
    } else if (type instanceof FArrayType) {
      walk((FArrayType) type, ModelBuilder::startBuilding, ModelBuilder::finishBuilding);
    } else if (type instanceof FMapType) {
      walk((FMapType) type, ModelBuilder::startBuilding, ModelBuilder::finishBuilding);
    } else if (type instanceof FEnumerationType) {
      walk(
          (FEnumerationType) type,
          ModelBuilder::startBuilding,
          ModelBuilder::finishBuilding,
          this::walkChildNodes);
    } else if (type instanceof FUnionType) {
      walk(
          (FUnionType) type,
          ModelBuilder::startBuilding,
          ModelBuilder::finishBuilding,
          this::walkChildNodes);
    } else {
      LOGGER.warning(type.getClass().getName() + " is not supported yet");
    }
  }

  private void walkChildNodes(FMethod francaMethod) {
    EList<FArgument> inArgs = francaMethod.getInArgs();
    if (inArgs != null) {
      for (FArgument argument : inArgs) {
        walk(
            argument,
            ModelBuilder::startBuildingInputArgument,
            ModelBuilder::finishBuildingInputArgument,
            this::walkChildNodes);
      }
    }
    EList<FArgument> outArgs = francaMethod.getOutArgs();
    if (outArgs != null) {
      for (FArgument argument : outArgs) {
        walk(
            argument,
            ModelBuilder::startBuildingOutputArgument,
            ModelBuilder::finishBuildingOutputArgument,
            this::walkChildNodes);
      }
    }
  }

  private void walkChildNodes(FCompoundType francaCompoundType) {
    EList<FField> fields = francaCompoundType.getElements();
    if (fields != null) {
      for (FField field : fields) {
        walk(
            field, ModelBuilder::startBuilding, ModelBuilder::finishBuilding, this::walkChildNodes);
      }
    }
  }

  private void walkChildNodes(FTypedElement francaTypedElement) {
    walk(francaTypedElement.getType(), ModelBuilder::startBuilding, ModelBuilder::finishBuilding);
  }

  private void walkChildNodes(FEnumerationType francaEnumerationType) {
    EList<FEnumerator> enumerators = francaEnumerationType.getEnumerators();
    if (enumerators != null) {
      for (FEnumerator enumerator : enumerators) {
        walk(
            enumerator,
            ModelBuilder::startBuilding,
            ModelBuilder::finishBuilding,
            this::walkChildNodes);
      }
    }
  }

  private void walkChildNodes(FEnumerator francaEnumerator) {
    walk(francaEnumerator.getValue(), ModelBuilder::startBuilding, ModelBuilder::finishBuilding);
  }
}
