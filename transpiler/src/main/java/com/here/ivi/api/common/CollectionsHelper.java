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

package com.here.ivi.api.common;

import java.util.Collection;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class CollectionsHelper {

  public static <T> List<T> getAllOfType(
      final Collection<? super T> collection, final Class<T> clazz) {
    return getStreamOfType(collection, clazz).collect(Collectors.toList());
  }

  public static <T> T getFirstOfType(
      final Collection<? super T> collection, final Class<T> clazz, final T defaultValue) {
    return getStreamOfType(collection, clazz).findFirst().orElse(defaultValue);
  }

  public static <T> T getFirstOfType(final Collection<? super T> collection, final Class<T> clazz) {
    return getFirstOfType(collection, clazz, null);
  }

  public static <T> Stream<T> getStreamOfType(
      final Collection<? super T> collection, final Class<T> clazz) {
    return getStreamOfType(collection.stream(), clazz);
  }

  public static <T> Stream<T> getStreamOfType(
      final Stream<? super T> stream, final Class<T> clazz) {
    return stream.filter(clazz::isInstance).map(clazz::cast);
  }

  public static <E, T extends E> List<E> getAllNotOfType(
      final Collection<E> collection, final Class<T> clazz) {
    return getStreamNotOfType(collection, clazz).collect(Collectors.toList());
  }

  public static <E, T extends E> Stream<E> getStreamNotOfType(
      final Collection<E> collection, final Class<T> clazz) {
    return collection.stream().filter(obj -> !clazz.isInstance(obj));
  }

  public static <T> boolean anyMatchFullEvaluation(
      final Stream<T> stream, final Predicate<T> predicate) {
    return stream.map(predicate::test).reduce(false, (acc, element) -> acc || element);
  }

  public static <T> boolean allMatchFullEvaluation(
      final Stream<T> stream, final Predicate<T> predicate) {
    return stream.map(predicate::test).reduce(true, (acc, element) -> acc && element);
  }

  public static <T> boolean noneMatchFullEvaluation(
      final Stream<T> stream, final Predicate<T> predicate) {
    return !anyMatchFullEvaluation(stream, predicate);
  }
}
