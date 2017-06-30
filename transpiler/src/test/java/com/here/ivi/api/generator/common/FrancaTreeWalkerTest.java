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

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.ArrayEList;
import java.util.Collections;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class FrancaTreeWalkerTest {

  @Mock private ModelBuilder modelBuilder;
  @Mock private Interface<?> anInterface;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FArgument anotherFrancaArgument;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FConstantDef francaConstant;
  @Mock private FAttribute francaAttribute;

  private final ArrayEList<FMethod> methods = new ArrayEList<>();
  private final ArrayEList<FArgument> arguments = new ArrayEList<>();
  private final ArrayEList<FConstantDef> constants = new ArrayEList<>();
  private final ArrayEList<FAttribute> attributes = new ArrayEList<>();

  private FrancaTreeWalker treeWalker;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    methods.add(francaMethod);
    arguments.add(francaArgument);
    constants.add(francaConstant);
    attributes.add(francaAttribute);

    when(anInterface.getFrancaInterface()).thenReturn(francaInterface);
    when(francaInterface.getMethods()).thenReturn(methods);
    when(francaInterface.getConstants()).thenReturn(constants);
    when(francaInterface.getAttributes()).thenReturn(attributes);

    when(francaMethod.getInArgs()).thenReturn(arguments);
    when(francaArgument.getType()).thenReturn(francaTypeRef);
  }

  @Test
  public void walkNullInterface() {
    treeWalker.walk(null);

    verify(modelBuilder, never()).startBuilding(any(Interface.class));
  }

  @Test
  public void walkEmptyInterface() {
    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(anInterface);
    verify(modelBuilder).finishBuilding(anInterface);
  }

  @Test
  public void walkFrancaInterface() {
    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaInterface);
    verify(modelBuilder).finishBuilding(francaInterface);
  }

  @Test
  public void walkWithOneMethod() {
    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaMethod);
    verify(modelBuilder).finishBuilding(francaMethod);
  }

  @Test
  public void walkWithTwoMethods() {
    FMethod anotherFrancaMethod = mock(FMethod.class);
    methods.add(anotherFrancaMethod);

    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaMethod);
    verify(modelBuilder).finishBuilding(francaMethod);
    verify(modelBuilder).startBuilding(anotherFrancaMethod);
    verify(modelBuilder).finishBuilding(anotherFrancaMethod);
  }

  @Test
  public void walkWithOneInArg() {
    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuildingInputArgument(francaArgument);
    verify(modelBuilder).finishBuildingInputArgument(francaArgument);
  }

  @Test
  public void walkWithTwoInArgs() {
    arguments.add(anotherFrancaArgument);

    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuildingInputArgument(francaArgument);
    verify(modelBuilder).finishBuildingInputArgument(francaArgument);
    verify(modelBuilder).startBuildingInputArgument(anotherFrancaArgument);
    verify(modelBuilder).finishBuildingInputArgument(anotherFrancaArgument);
  }

  @Test
  public void walkWithOneOutArg() {
    when(francaMethod.getInArgs()).thenReturn(null);
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuildingOutputArgument(francaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(francaArgument);
  }

  @Test
  public void walkWithTwoOutArgs() {
    arguments.add(anotherFrancaArgument);
    when(francaMethod.getInArgs()).thenReturn(null);
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuildingOutputArgument(francaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(francaArgument);
    verify(modelBuilder).startBuildingOutputArgument(anotherFrancaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(anotherFrancaArgument);
  }

  @Test
  public void walkWithInAndOutArgs() {
    ArrayEList<FArgument> outArguments = new ArrayEList<>();
    outArguments.add(anotherFrancaArgument);
    when(francaMethod.getOutArgs()).thenReturn(outArguments);

    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuildingInputArgument(francaArgument);
    verify(modelBuilder).finishBuildingInputArgument(francaArgument);
    verify(modelBuilder).startBuildingOutputArgument(anotherFrancaArgument);
    verify(modelBuilder).finishBuildingOutputArgument(anotherFrancaArgument);
  }

  @Test
  public void walkWithTypeRef() {
    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaTypeRef);
    verify(modelBuilder).finishBuilding(francaTypeRef);
  }

  @Test
  public void walkWithOneConstant() {
    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaConstant);
    verify(modelBuilder).finishBuilding(francaConstant);
  }

  @Test
  public void walkWithTwoConstants() {
    FConstantDef anotherFrancaConstant = mock(FConstantDef.class);
    constants.add(anotherFrancaConstant);

    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaConstant);
    verify(modelBuilder).finishBuilding(francaConstant);
    verify(modelBuilder).startBuilding(anotherFrancaConstant);
    verify(modelBuilder).finishBuilding(anotherFrancaConstant);
  }

  @Test
  public void walkWithOneAttribute() {
    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaAttribute);
    verify(modelBuilder).finishBuilding(francaAttribute);
  }

  @Test
  public void walkWithTwoAttributes() {
    FAttribute anotherFrancaAttribute = mock(FAttribute.class);
    attributes.add(anotherFrancaAttribute);

    treeWalker.walk(anInterface);

    verify(modelBuilder).startBuilding(francaAttribute);
    verify(modelBuilder).finishBuilding(francaAttribute);
    verify(modelBuilder).startBuilding(anotherFrancaAttribute);
    verify(modelBuilder).finishBuilding(anotherFrancaAttribute);
  }
}
