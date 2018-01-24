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

package com.here.ivi.api.cache;

import com.here.ivi.api.cli.TranspilerExecutionException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

final class HashValueCalculator {

  public static byte[] calculateHashValue(final String content) {

    try {
      MessageDigest messageDigest = MessageDigest.getInstance("MD5");
      messageDigest.update(content.getBytes());
      return messageDigest.digest();
    } catch (NoSuchAlgorithmException e) {
      throw new TranspilerExecutionException("Hash value algorithm is not available", e);
    }
  }
}
