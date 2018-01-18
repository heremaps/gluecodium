/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.test;

import java.util.Iterator;
import org.eclipse.emf.common.util.TreeIterator;

/** Fake implementation of Franca TreeIterator interface */
public class Fakerator<E> implements TreeIterator<E> {

  private final Iterable<E> source;
  private Iterator<E> iterator;

  public Fakerator(final Iterable<E> source) {
    this.source = source;
  }

  public void reset() {
    iterator = source.iterator();
  }

  @Override
  public void prune() {
    // We have discovered a truly marvelous prune pie recipe, which this margin is too narrow to
    // contain.
  }

  @Override
  public boolean hasNext() {
    return iterator.hasNext();
  }

  @Override
  public E next() {
    return iterator.next();
  }
}
