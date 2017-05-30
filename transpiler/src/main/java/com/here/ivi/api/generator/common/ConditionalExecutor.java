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

package com.here.ivi.api.generator.common;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Predicate;
import org.apache.commons.io.FilenameUtils;

/** Class for conditional execution of arbitrary tool */
public class ConditionalExecutor implements FileTool {

  private final FileTool actualTool;
  private final Predicate<GeneratedFile> condition;

  /**
   * @param condition {@link java.util.function.Predicate Predicate} deciding whether to execute the
   *     actual tool
   * @param actualTool Actual {@link FileTool} to be executed on a file when the condition is met
   */
  public ConditionalExecutor(final Predicate<GeneratedFile> condition, final FileTool actualTool) {
    this.condition = condition;
    this.actualTool = actualTool;
  }

  /**
   * Executes actual tool when condition is met
   *
   * @param file File to process
   * @return Processed file if condition is met, unmodified file otherwise
   */
  @Override
  public GeneratedFile process(GeneratedFile file) {
    if (condition.test(file)) {
      return actualTool.process(file);
    } else {
      return file;
    }
  }

  /**
   * Helper function returning predicate to be used by {@link
   * com.here.ivi.api.generator.common.ConditionalExecutor} and filtering files based on extensions.
   *
   * @param extensions List of file extensions for which tool should be run
   * @return Predicate to use as {@link
   *     com.here.ivi.api.generator.common.ConditionalExecutor#ConditionalExecutor(Predicate,
   *     FileTool) condition}
   */
  public static Predicate<GeneratedFile> fileExtensionFilter(Collection<String> extensions) {
    final Set<String> allowedExtensions = new HashSet<>(extensions);
    return f -> allowedExtensions.contains(FilenameUtils.getExtension(f.targetFile.getPath()));
  }
}
