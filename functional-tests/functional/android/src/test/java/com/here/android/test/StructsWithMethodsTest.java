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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class StructsWithMethodsTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void vectorDistanceToSelf() {
    Vector vector = new Vector(1, 2);

    double result = vector.distanceTo(vector);

    assertEquals(0.0, result);
  }

  @Test
  public void vectorDistanceToOther() {
    Vector vector = new Vector(1, 2);
    Vector otherVector = new Vector(-3, -4);

    double result = vector.distanceTo(otherVector);

    assertEquals(7.211, result, 0.001);
  }

  @Test
  public void vectorAddSelf() {
    Vector vector = new Vector(1, 2);

    Vector result = vector.add(vector);

    assertEquals(new Vector(2.0, 4.0), result);
  }

  @Test
  public void vectorAddOther() {
    Vector vector = new Vector(1, 2);
    Vector otherVector = new Vector(-3, -7);

    Vector result = vector.add(otherVector);

    assertEquals(new Vector(-2.0, -5.0), result);
  }

  @Test
  public void vectorValidatePasses() {
    boolean result = Vector.validate(1, 2);

    assertTrue(result);
  }

  @Test
  public void vectorValidateFails() {
    boolean result = Vector.validate(1, Double.NaN);

    assertFalse(result);
  }

  @Test
  public void vectorCopyConstructorDoesNotThrow() throws ValidationUtils.ValidationException {
    Vector vector = new Vector(1, 2);

    new Vector(vector);
  }

  @Test
  public void vectorCopyConstructorThrows() throws ValidationUtils.ValidationException {
    Vector vector = new Vector(1, Double.NaN);
    expectedException.expect(ValidationUtils.ValidationException.class);

    new Vector(vector);
  }

  @Test
  public void vector3DistanceToSelf() {
    StructsWithMethodsInterface.Vector3 vector = new StructsWithMethodsInterface.Vector3(1, 2, 3);

    double result = vector.distanceTo(vector);

    assertEquals(0.0, result);
  }

  @Test
  public void vector3DistanceToOther() {
    StructsWithMethodsInterface.Vector3 vector = new StructsWithMethodsInterface.Vector3(1, 2, 3);
    StructsWithMethodsInterface.Vector3 otherVector =
        new StructsWithMethodsInterface.Vector3(-4, -5, 6);

    double result = vector.distanceTo(otherVector);

    assertEquals(9.110, result, 0.001);
  }

  @Test
  public void vector3AddSelf() {
    StructsWithMethodsInterface.Vector3 vector = new StructsWithMethodsInterface.Vector3(1, 2, 3);

    StructsWithMethodsInterface.Vector3 result = vector.add(vector);

    assertEquals(new StructsWithMethodsInterface.Vector3(2.0, 4.0, 6.0), result);
  }

  @Test
  public void vector3AddOther() {
    StructsWithMethodsInterface.Vector3 vector = new StructsWithMethodsInterface.Vector3(1, 2, 3);
    StructsWithMethodsInterface.Vector3 otherVector =
        new StructsWithMethodsInterface.Vector3(-4, -7, -10);

    StructsWithMethodsInterface.Vector3 result = vector.add(otherVector);

    assertEquals(new StructsWithMethodsInterface.Vector3(-3.0, -5.0, -7.0), result);
  }

  @Test
  public void vector3ValidatePasses() {
    boolean result = StructsWithMethodsInterface.Vector3.validate(1, 2, 3);

    assertTrue(result);
  }

  @Test
  public void vector3ValidateFails() {
    boolean result = StructsWithMethodsInterface.Vector3.validate(1, Double.NaN, 3);

    assertFalse(result);
  }

  @Test
  public void vector3CopyConstructorDoesNotThrow() throws ValidationUtils.ValidationException {
    StructsWithMethodsInterface.Vector3 vector = new StructsWithMethodsInterface.Vector3(1, 2, 3);

    new StructsWithMethodsInterface.Vector3(vector);
  }

  @Test
  public void vector3CopyConstructorThrows() throws ValidationUtils.ValidationException {
    StructsWithMethodsInterface.Vector3 vector =
        new StructsWithMethodsInterface.Vector3(1, Double.NaN, 3);
    expectedException.expect(ValidationUtils.ValidationException.class);

    new StructsWithMethodsInterface.Vector3(vector);
  }
}
