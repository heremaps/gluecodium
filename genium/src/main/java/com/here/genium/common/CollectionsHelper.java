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

package com.here.genium.common;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class CollectionsHelper {

  public static <T> List<T> getAllOfType(
      final Collection<? super T> collection, final Class<T> clazz) {
    return getStreamOfType(collection, clazz).collect(Collectors.toList());
  }

  public static <T> T getFirstOfType(final Collection<? super T> collection, final Class<T> clazz) {
    return getStreamOfType(collection, clazz).findFirst().orElse(null);
  }

  public static <T> Stream<T> getStreamOfType(
      final Collection<? super T> collection, final Class<T> clazz) {
    return getStreamOfType(collection.stream(), clazz);
  }

  public static <T> Stream<T> getStreamOfType(
      final Stream<? super T> stream, final Class<T> clazz) {
    return stream.filter(clazz::isInstance).map(clazz::cast);
  }
}
