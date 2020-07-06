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

package com.here.gluecodium.generator.common.templates

import com.here.gluecodium.generator.common.NameResolver
import org.trimou.engine.MustacheEngine
import org.trimou.engine.MustacheEngineBuilder
import org.trimou.engine.locator.ClassPathTemplateLocator
import org.trimou.handlebars.HelpersBuilder
import org.trimou.handlebars.SwitchHelper

object TemplateEngine {
    private val engine: MustacheEngine
    private val copyrightHeaderResolver = CopyrightHeaderResolver()
    private var copyrightHeaderInitialized = false

    private val nameResolverHelper = NameResolverHelper()
    private val ifPredicateHelper = PredicateHelper(true)
    private val unlessPredicateHelper = PredicateHelper(false)
    private val sortHelper = SortHelper()

    init {
        engine = MustacheEngineBuilder.newBuilder()
            .addTemplateLocator(ClassPathTemplateLocator(1, "templates", "mustache"))
            .setProperty("org.trimou.engine.config.skipValueEscaping", true)
            .registerHelper("prefix", PrefixHelper())
            .registerHelper("prefixPartial", PrefixPartialHelper())
            .registerHelper("joinPartial", JoinPartialHelper())
            .registerHelper("instanceOf", InstanceOfHelper(true))
            .registerHelper("notInstanceOf", InstanceOfHelper(false))
            .registerHelper("capitalize", CapitalizeHelper())
            .registerHelper("escape", EscapeHelper())
            .registerHelper("switch", NiceSwitchHelper())
            .registerHelper("case", SwitchHelper.CaseHelper(true))
            .registerHelper("default", SwitchHelper.DefaultHelper())
            .registerHelper("setJoin", SetJoinHelper())
            .registerHelper("resolveName", nameResolverHelper)
            .registerHelper("ifPredicate", ifPredicateHelper)
            .registerHelper("unlessPredicate", unlessPredicateHelper)
            .registerHelper("sort", sortHelper)
            .registerHelpers(
                HelpersBuilder.empty()
                    .addIsEqual()
                    .addIsNotEqual()
                    .addInclude()
                    .addJoin()
                    .addSet()
                    .build()
            )
            .addResolver(copyrightHeaderResolver)
            .build()
    }

    fun initCopyrightHeaderContents(contents: String?) {
        if (!copyrightHeaderInitialized) {
            copyrightHeaderResolver.copyrightHeaderContent = contents
            copyrightHeaderInitialized = true
        }
    }

    fun render(
        templateName: String,
        data: Any,
        nameResolvers: Map<String, NameResolver> = emptyMap(),
        predicates: Map<String, (Any)-> Boolean> = emptyMap(),
        sorters: Map<String, (List<Any>)-> List<Any>> = emptyMap()
    ): String {
        nameResolverHelper.nameResolvers += nameResolvers
        ifPredicateHelper.predicates += predicates
        unlessPredicateHelper.predicates += predicates
        sortHelper.sorters += sorters

        val result = engine.getMustache(templateName).render(data)

        nameResolverHelper.nameResolvers.clear()
        ifPredicateHelper.predicates.clear()
        unlessPredicateHelper.predicates.clear()
        sortHelper.sorters.clear()

        return result
    }
}
