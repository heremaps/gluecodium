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

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.trimou.engine.MustacheTagInfo;
import org.trimou.engine.MustacheTagType;
import org.trimou.handlebars.Helper;
import org.trimou.handlebars.HelperDefinition;
import org.trimou.handlebars.HelperValidator;
import org.trimou.handlebars.SwitchHelper;

/**
 * Identical to built-in Trimou SwitchHelper, except that it does not spam the log about "comment"
 * sections found inside the "switch" block.
 *
 * <p>Since the real validation check in SwitchHelper is in a private isValid() method, both
 * validate() and isValid() method are copy-pasted from SwitchHelper here.
 */
class NiceSwitchHelper extends SwitchHelper {

  private static final Logger LOGGER = LoggerFactory.getLogger(SwitchHelper.class);

  @Override
  public void validate(HelperDefinition definition) {
    // BasicHelper.validate()
    Class<? extends Helper> helperClazz = this.getClass();
    HelperValidator.checkType(helperClazz, definition, allowedTagTypes());
    HelperValidator.checkParams(helperClazz, definition, numberOfRequiredParameters());
    HelperValidator.checkHash(definition, this);

    // SwitchHelper.validate()
    Set<String> validNames = new HashSet<>(4);
    for (Map.Entry<String, Helper> entry : configuration.getHelpers().entrySet()) {
      if (entry.getValue() instanceof CaseHelper || entry.getValue() instanceof DefaultHelper) {
        validNames.add(entry.getKey());
      }
    }
    for (MustacheTagInfo info : definition.getTagInfo().getChildTags()) {
      if (!isValid(info, validNames)) {
        LOGGER.warn(
            "Invalid content detected {}. "
                + "This helper should only contain case, default and comment sections. "
                + "Other types of segments are always rendered.",
            info);
      }
    }
  }

  private boolean isValid(MustacheTagInfo info, Set<String> validNames) {
    // Accept "comment" sections as valid
    if (info.getType().equals(MustacheTagType.COMMENT)) {
      return true;
    }

    // SwitchHelper.isValid()
    if (!info.getType().equals(MustacheTagType.SECTION)) {
      return false;
    }
    for (String name : validNames) {
      if (info.getText().startsWith(name)) {
        return true;
      }
    }
    return false;
  }
}
