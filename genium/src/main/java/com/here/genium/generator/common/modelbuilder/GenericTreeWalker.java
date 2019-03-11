/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.common.modelbuilder;

import java.util.Collection;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.logging.Logger;

public class GenericTreeWalker<MB> {

  private static final Logger LOGGER = Logger.getLogger(GenericTreeWalker.class.getName());

  private final Collection<MB> builders;
  private final Map<Object, TreeNodeInfo<MB, ?>> treeInfo;

  protected static class TreeNodeInfo<B, T> {

    private final Class<T> clazz;
    private final BiConsumer<B, T> startMethod;
    private final BiConsumer<B, T> finishMethod;
    private final BiConsumer<GenericTreeWalker<B>, T> walkChildNodes;

    TreeNodeInfo(
        final Class<T> clazz,
        final BiConsumer<B, T> startMethod,
        final BiConsumer<B, T> finishMethod,
        final BiConsumer<GenericTreeWalker<B>, T> walkChildNodes) {
      this.clazz = clazz;
      this.startMethod = startMethod;
      this.finishMethod = finishMethod;
      this.walkChildNodes = walkChildNodes;
    }

    private void walk(final GenericTreeWalker<B> walker, final Object element) {

      T francaElement = clazz.cast(element);
      for (B builder : walker.getBuilders()) {
        startMethod.accept(builder, francaElement);
      }
      walkChildNodes.accept(walker, francaElement);
      for (B builder : walker.getBuilders()) {
        finishMethod.accept(builder, francaElement);
      }
    }
  }

  protected GenericTreeWalker(
      final Collection<MB> builders, Map<Object, TreeNodeInfo<MB, ?>> treeInfo) {
    this.builders = builders;
    this.treeInfo = treeInfo;
  }

  protected void walk(final Object key, final Object element) {
    if (element != null) {
      treeInfo.get(key).walk(this, element);
    }
  }

  protected void walk(final Object element) {
    if (element != null) {
      Class<?> anInterface = findSupportedInterface(element.getClass());
      if (anInterface != null) {
        treeInfo.get(anInterface).walk(this, element);
      } else {
        String message = element.getClass().getInterfaces()[0].getName() + " is not supported";
        LOGGER.warning(message);
      }
    }
  }

  protected void walkCollection(final Object key, final Iterable<?> collection) {
    if (collection != null) {
      collection.forEach(element -> walk(key, element));
    }
  }

  protected void walkCollection(final Iterable<?> collection) {
    if (collection != null) {
      collection.forEach(this::walk);
    }
  }

  protected static <MB> void noChildNodes(
      @SuppressWarnings("unused") final GenericTreeWalker<MB> walker,
      @SuppressWarnings("unused") final Object element) {
    // Do nothing
  }

  protected Collection<MB> getBuilders() {
    return builders;
  }

  private Class<?> findSupportedInterface(final Class<?> aClass) {
    for (Class<?> anInterface : aClass.getInterfaces()) {
      if (treeInfo.containsKey(anInterface)) {
        return anInterface;
      }
    }
    for (Class<?> anInterface : aClass.getInterfaces()) {
      Class<?> result = findSupportedInterface(anInterface);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
