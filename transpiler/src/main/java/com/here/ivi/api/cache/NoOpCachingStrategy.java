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

import com.here.ivi.api.generator.common.GeneratedFile;
import java.util.List;

/** This strategy implements a no-operation caching strategy. */
final class NoOpCachingStrategy implements CachingStrategy {

  @Override
  public boolean write(boolean folderContentIsValid) {
    return folderContentIsValid;
  }

  @Override
  public List<GeneratedFile> updateCache(String cacheName, List<GeneratedFile> inputFiles) {
    return inputFiles;
  }
}
