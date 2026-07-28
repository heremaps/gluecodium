/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.generator.common.templates.TemplateEngine
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class KotlinCoroutinesTemplateTest {
    @Test
    fun renderSupportFileHasGenericBridgeAndGuards() {
        val modelData =
            mapOf(
                "packageName" to "com.example.routing",
                "fileJvmName" to "RoutingEngineKotlinCoroutines",
                "supports" to
                    listOf(
                        mapOf(
                            "contractViolationName" to "RoutingEngineSdkContractViolationException",
                            "resultBridgeName" to "routingEngineAwaitResultBridge",
                            "valueBridgeName" to "routingEngineAwaitValueBridge",
                        ),
                    ),
                "functions" to emptyList<Map<String, Any>>(),
            )

        val content = TemplateEngine.render("kotlin/KotlinCoroutines", modelData)

        assertTrue(content.contains("@file:JvmName(\"RoutingEngineKotlinCoroutines\")"))
        assertTrue(content.contains("Coroutine (suspend) support for @KotlinCoroutine functions."))
        assertTrue(content.contains("internal class RoutingEngineSdkContractViolationException"))
        assertTrue(content.contains("internal suspend fun <E, T, H> routingEngineAwaitResultBridge("))
        assertTrue(content.contains("internal suspend fun <T, H> routingEngineAwaitValueBridge("))
        assertTrue(content.contains("suspendCancellableCoroutine { continuation ->"))
        assertTrue(content.contains("AtomicBoolean(false)"))
        assertTrue(content.contains("compareAndSet(false, true)"))
        assertTrue(content.contains("Result.failure(mapDomainError(error))"))
        assertTrue(
            content.contains(
                "continuation.invokeOnCancellation {\n" +
                    "                if (resolved.compareAndSet(false, true)) {\n" +
                    "                    cancelOperation(handle)\n" +
                    "                }\n" +
                    "            }",
            ),
        )
    }

    @Test
    fun renderMemberDelegatesToBridge() {
        val modelData =
            mapOf(
                "exceptions" to
                    listOf(
                        mapOf(
                            "name" to "CalculateRouteException",
                            "errorType" to "RoutingError",
                        ),
                    ),
                "functions" to
                    listOf(
                        mapOf(
                            "docComment" to "/**\n * Coroutine (`suspend`) variant of `calculateRoute`.\n */",
                            "name" to "calculateRoute",
                            "params" to "waypoints: List<Waypoint>, options: RoutingOptions",
                            "returnType" to "Result<List<Route>>",
                            "continuationIndent" to "      ",
                            "bridgeName" to "routingEngineAwaitResultBridge",
                            "startCall" to
                                "this.calculateRoute(waypoints, options, " +
                                "CalculateRouteCallback { error, result -> callback(error, result) })",
                            "mapErrorExpr" to "CalculateRouteException(error)",
                            "hasError" to true,
                            "cancelExpr" to "handle.cancel()",
                        ),
                    ),
            )

        val content = TemplateEngine.render("kotlin/KotlinCoroutineMembers", modelData)

        assertTrue(content.contains("public class CalculateRouteException(public val error: RoutingError)"))
        assertTrue(
            content.contains(
                "public suspend fun calculateRoute(waypoints: List<Waypoint>, options: RoutingOptions): Result<List<Route>> =",
            ),
        )
        assertTrue(content.contains("routingEngineAwaitResultBridge("))
        assertTrue(
            content.contains(
                "startOperation = { callback -> this.calculateRoute(waypoints, options, " +
                    "CalculateRouteCallback { error, result -> callback(error, result) }) }",
            ),
        )
        assertTrue(
            content.contains(
                "mapDomainError = { error -> CalculateRouteException(error) }",
            ),
        )
        assertTrue(content.contains("cancelOperation = { handle -> handle.cancel() }"))
    }

    @Test
    fun renderFlowMemberUsesCallbackFlowAndCleanup() {
        val modelData =
            mapOf(
                "functions" to emptyList<Map<String, Any>>(),
                "flows" to
                    listOf(
                        mapOf(
                            "eventDeclaration" to
                                "public data class DownloadFlowEvent(\n" +
                                "    public val percentage: Int,\n" +
                                ")",
                            "docComment" to "/** Flow variant of `download`. */",
                            "name" to "downloadFlow",
                            "params" to "regionId: Int",
                            "eventType" to "DownloadFlowEvent",
                            "body" to
                                "        val listener = DownloadListener { percentage -> trySend(DownloadFlowEvent(percentage)) }\n" +
                                "        val handle = this@Downloader.download(regionId, listener)\n" +
                                "        awaitClose { handle.cancel() }",
                        ),
                    ),
            )

        val content = TemplateEngine.render("kotlin/KotlinCoroutineMembers", modelData)

        assertTrue(content.contains("public data class DownloadFlowEvent("))
        assertTrue(content.contains("public fun downloadFlow(regionId: Int): Flow<DownloadFlowEvent> ="))
        assertTrue(content.contains("callbackFlow {"))
        assertTrue(content.contains("awaitClose { handle.cancel() }"))
        assertTrue(content.contains("}.buffer(onBufferOverflow = BufferOverflow.DROP_OLDEST)"))
    }
}
