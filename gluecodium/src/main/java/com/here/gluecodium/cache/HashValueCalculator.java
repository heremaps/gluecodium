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

package com.here.gluecodium.cache;

import com.here.gluecodium.cli.GluecodiumExecutionException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

final class HashValueCalculator {

  public static byte[] calculateHashValue(final String content) {

    try {
      MessageDigest messageDigest = MessageDigest.getInstance("MD5");
      messageDigest.update(content.getBytes());
      return messageDigest.digest();
    } catch (NoSuchAlgorithmException e) {
      throw new GluecodiumExecutionException("Hash value algorithm is not available", e);
    }
  }
}
