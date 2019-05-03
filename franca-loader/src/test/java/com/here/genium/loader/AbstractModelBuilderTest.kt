/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.loader;

import com.here.genium.common.ModelBuilderContextStack;
import com.here.genium.test.MockContextStack;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FField;
import org.franca.core.franca.FInitializerExpression;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class AbstractModelBuilderTest {

  private final Object resultObject = new Object();

  private final MockContextStack<Object> contextStack = new MockContextStack<>();
  private final TestableModelBuilder modelBuilder = new TestableModelBuilder(contextStack);

  private static class TestableModelBuilder extends AbstractModelBuilder<Object> {
    TestableModelBuilder(ModelBuilderContextStack<Object> contextStack) {
      super(contextStack);
    }

    @Override
    public void finishBuilding(FInterface francaInterface) {}

    @Override
    public void finishBuilding(FTypeCollection francaTypeCollection) {}

    @Override
    public void finishBuilding(FMethod francaMethod) {}

    @Override
    public void finishBuildingInputArgument(FArgument francaArgument) {}

    @Override
    public void finishBuildingOutputArgument(FArgument francaArgument) {}

    @Override
    public void finishBuilding(FTypeRef francaTypeRef) {}

    @Override
    public void finishBuilding(FConstantDef francaConstant) {}

    @Override
    public void finishBuilding(FField francaField) {}

    @Override
    public void finishBuilding(FStructType francaStructType) {}

    @Override
    public void finishBuilding(FTypeDef francaTypeDef) {}

    @Override
    public void finishBuilding(FArrayType francaArrayType) {}

    @Override
    public void finishBuilding(FMapType francaMapType) {}

    @Override
    public void finishBuilding(FEnumerationType francaEnumerationType) {}

    @Override
    public void finishBuilding(FEnumerator francaEnumerator) {}

    @Override
    public void finishBuilding(FInitializerExpression francaExpression) {}

    @Override
    public void finishBuilding(FAttribute francaAttribute) {}
  }

  @Test
  public void closeContextPropagatesResults() {
    contextStack.getCurrentContext().getCurrentResults().add(resultObject);

    modelBuilder.closeContext();

    Assert.assertTrue(contextStack.getParentContext().getPreviousResults().contains(resultObject));
  }

  @Test
  public void closeContextAppendsResults() {
    final Object anotherResultObject = new Object();
    contextStack.getCurrentContext().getCurrentResults().add(anotherResultObject);
    contextStack.getParentContext().getPreviousResults().add(resultObject);

    modelBuilder.closeContext();

    Assert.assertTrue(contextStack.getParentContext().getPreviousResults().contains(resultObject));
    Assert.assertTrue(
        contextStack.getParentContext().getPreviousResults().contains(anotherResultObject));
  }
}
