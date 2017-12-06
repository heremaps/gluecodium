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

package com.here.ivi.api.test;

import java.util.ArrayList;
import java.util.Collection;
import org.eclipse.emf.common.util.EList;

public class ArrayEList<E> extends ArrayList<E> implements EList<E> {

  public ArrayEList() {
    super();
  }

  public ArrayEList(final Collection<? extends E> collection) {
    super(collection);
  }

  @Override
  public void move(int newPosition, E object) {
    // intentionally left unimplemented
  }

  @Override
  public E move(int newPosition, int oldPosition) {
    // intentionally left unimplemented
    return null;
  }
}
