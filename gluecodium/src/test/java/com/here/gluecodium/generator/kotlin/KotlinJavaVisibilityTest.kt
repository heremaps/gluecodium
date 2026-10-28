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

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.GluecodiumOptions
import com.here.gluecodium.generator.common.GeneratorOptions
import org.jetbrains.kotlin.cli.common.ExitCode
import org.jetbrains.kotlin.cli.jvm.K2JVMCompiler
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.PrintStream
import java.lang.reflect.Modifier
import java.net.URLClassLoader
import javax.tools.Diagnostic
import javax.tools.DiagnosticCollector
import javax.tools.JavaFileObject
import javax.tools.ToolProvider

class KotlinJavaVisibilityTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

    @Test
    fun generatedInternalsAreHiddenFromJavaWithoutBreakingKotlinOrJvmNames() {
        val input = temporaryFolder.newFile("Visibility.lime")
        input.writeText(
            """
            package visibility
            @Internal
            class Hidden {
                constructor create()
                fun work(): Int
                property count: Int
                static fun static_work(): Int
                const TOKEN: Int = 1
                struct Data {
                    value: Int
                }
                interface Callback {
                    fun work(): Int
                    property count: Int
                    static property shared_count: Int
                }
            }
            @Internal
            enum Problem {
                FAILED
            }
            @Internal
            exception HiddenProblem(Problem)
            @Kotlin("UuidInternal")
            struct Uuid {
                external {
                    kotlin name "java.util.UUID"
                    kotlin converter "visibility.UuidConverter"
                }
                text: String
            }
            class Visible {
                constructor create()
                @Internal
                constructor create(value: Int)
                fun work(): Int
                struct Data {
                    value: Int
                }
                struct WithUuid {
                    uuid: Uuid
                }
            }
            struct Secret {
                value: Int
                @Internal
                token: String
            }
            """.trimIndent() + "\n",
        )
        val generated = temporaryFolder.newFolder("generated")
        val options =
            GluecodiumOptions(
                idlSources = listOf(input.path),
                outputDir = generated.path,
                commonOutputDir = generated.path,
                generators = setOf("android-kotlin"),
            )
        assertTrue("Fixture generation failed", Gluecodium(options, GeneratorOptions()).execute())

        val consumer = temporaryFolder.newFile("SameModuleAccess.kt")
        consumer.writeText(
            """
            package visibility
            import com.example.visibility.Hidden
            import com.example.visibility.HiddenProblemException
            import com.example.visibility.Problem
            import com.example.visibility.Secret
            import com.example.visibility.UuidInternal
            import com.example.visibility.Visible
            internal fun use(value: Hidden, data: Hidden.Data, callback: Hidden.Callback) {
                value.work()
                value.count = value.count
                Hidden.staticWork()
                check(Hidden.TOKEN == 1)
                data.value = data.value
                callback.work()
                callback.count = callback.count
                Hidden.Callback.setSharedCount(Hidden.Callback.getSharedCount())
            }
            internal fun construct(): List<Any> =
                listOf(Hidden(), Visible(1), HiddenProblemException(Problem.FAILED), UuidInternal("id").text)
            internal fun data(): Int = Hidden.Data(1).value
            internal fun secret(): String = Secret(1, "token").token
            """.trimIndent(),
        )
        val classes = temporaryFolder.newFolder("classes")
        val stdlib = File(Unit::class.java.protectionDomain.codeSource.location.toURI())
        val compilerOutput = ByteArrayOutputStream()
        val sources = generated.walkTopDown().filter { it.extension == "kt" }.map { it.path }.toList() + consumer.path
        val arguments =
            listOf("-no-stdlib", "-no-reflect", "-classpath", stdlib.path, "-jvm-target", "11", "-d", classes.path) + sources
        val exitCode = PrintStream(compilerOutput).use { K2JVMCompiler().exec(it, *arguments.toTypedArray()) }
        assertEquals(compilerOutput.toString(), ExitCode.OK, exitCode)

        // Kotlin code of another module can neither call the hidden constructor nor see its factory companion.
        val externalConsumer = temporaryFolder.newFile("ExternalModuleAccess.kt")
        externalConsumer.writeText(
            """
            package outside
            import com.example.visibility.Secret
            fun companion(): Any = Secret.Companion
            fun create(): Any = Secret(1, "token")
            """.trimIndent(),
        )
        val externalOutput = ByteArrayOutputStream()
        val externalArguments =
            listOf(
                "-no-stdlib", "-no-reflect", "-module-name", "outside", "-classpath", classes.path + File.pathSeparator + stdlib.path,
                "-jvm-target", "11", "-d", temporaryFolder.newFolder("external").path, externalConsumer.path,
            )
        val externalExitCode = PrintStream(externalOutput).use { K2JVMCompiler().exec(it, *externalArguments.toTypedArray()) }
        assertEquals(externalOutput.toString(), ExitCode.COMPILATION_ERROR, externalExitCode)
        assertTrue(externalOutput.toString(), externalOutput.toString().contains("cannot access 'Companion': it is internal in 'Secret'"))
        assertTrue(externalOutput.toString(), externalOutput.toString().contains("cannot access '<init>': it is private in 'Secret'"))

        val javaClasspath = classes.path + File.pathSeparator + stdlib.path
        assertJavaCompiles(
            javaClasspath,
            "new Visible().work(); new Visible.Data(1).value = 2; new Visible.WithUuid(java.util.UUID.randomUUID()).uuid = null;",
            expected = true,
        )
        listOf(
            "((Hidden) null).work();",
            "((Hidden) null).getCount();",
            "((Hidden) null).setCount(1);",
            "Hidden.staticWork();",
            "int value = Hidden.TOKEN;",
            "int value = ((Hidden.Data) null).value;",
            "((Hidden.Callback) null).work();",
            "((Hidden.Callback) null).getCount();",
            "((Hidden.Callback) null).setCount(1);",
            "Hidden.Callback.getSharedCount();",
            "Hidden.Callback.setSharedCount(1);",
            "Hidden.Companion.invoke();",
            "Visible.Companion.invoke(1);",
            "String text = ((UuidInternal) null).text;",
        ).forEach { assertJavaCompiles(javaClasspath, it, expected = false, expectedError = HIDDEN_MEMBER) }
        listOf(
            "new Hidden();",
            "new Hidden.Data(1);",
            "new Visible(1);",
            "new HiddenProblemException(Problem.FAILED);",
            "new UuidInternal(\"id\");",
            "new Secret(1, \"token\");",
        ).forEach { assertJavaCompiles(javaClasspath, it, expected = false, expectedError = HIDDEN_CONSTRUCTOR) }

        URLClassLoader(arrayOf(classes.toURI().toURL()), javaClass.classLoader).use { loader ->
            val hidden = loader.loadClass("com.example.visibility.Hidden")
            assertTrue(hidden.getDeclaredMethod("work").isSynthetic)
            assertTrue(hidden.getDeclaredMethod("getCount").isSynthetic)
            assertTrue(hidden.getDeclaredMethod("setCount", Int::class.javaPrimitiveType).isSynthetic)
            assertTrue(hidden.getDeclaredMethod("staticWork").isSynthetic)
            assertTrue(hidden.getDeclaredField("TOKEN").isSynthetic)
            assertTrue(Modifier.isPrivate(hidden.getDeclaredConstructor().modifiers))
            assertSyntheticFactory(loader.loadClass("com.example.visibility.Hidden${'$'}Companion"))
            val data = loader.loadClass("com.example.visibility.Hidden${'$'}Data")
            assertTrue(data.getDeclaredField("value").isSynthetic)
            assertTrue(Modifier.isPrivate(data.getDeclaredConstructor(Int::class.javaPrimitiveType).modifiers))
            val callback = loader.loadClass("com.example.visibility.Hidden${'$'}Callback")
            assertTrue(callback.getDeclaredMethod("work").isSynthetic)
            assertTrue(callback.getDeclaredMethod("getCount").isSynthetic)
            assertTrue(callback.getDeclaredMethod("setCount", Int::class.javaPrimitiveType).isSynthetic)
            assertTrue(callback.getDeclaredMethod("getSharedCount").isSynthetic)
            assertTrue(callback.getDeclaredMethod("setSharedCount", Int::class.javaPrimitiveType).isSynthetic)

            val visible = loader.loadClass("com.example.visibility.Visible")
            assertTrue(Modifier.isPublic(visible.getDeclaredConstructor().modifiers))
            assertTrue(Modifier.isPrivate(visible.getDeclaredConstructor(Int::class.javaPrimitiveType).modifiers))
            assertSyntheticFactory(loader.loadClass("com.example.visibility.Visible${'$'}Companion"))

            val problem = loader.loadClass("com.example.visibility.Problem")
            val exception = loader.loadClass("com.example.visibility.HiddenProblemException")
            assertTrue(Modifier.isPrivate(exception.getDeclaredConstructor(problem).modifiers))

            val uuid = loader.loadClass("com.example.visibility.UuidInternal")
            assertTrue(uuid.getDeclaredField("text").isSynthetic)
            assertTrue(Modifier.isPrivate(uuid.getDeclaredConstructor(String::class.java).modifiers))
            val withUuid = loader.loadClass("com.example.visibility.Visible${'$'}WithUuid")
            assertFalse(withUuid.getDeclaredField("uuid").isSynthetic)
        }
    }

    private fun assertSyntheticFactory(companion: Class<*>) {
        val factories = companion.declaredMethods.filter { it.name.startsWith("invoke") }
        assertTrue(companion.name, factories.isNotEmpty())
        factories.forEach { assertTrue(it.toString(), it.isSynthetic) }
    }

    private fun assertJavaCompiles(
        classpath: String,
        body: String,
        expected: Boolean,
        expectedError: List<String> = emptyList(),
    ) {
        val compiler = requireNotNull(ToolProvider.getSystemJavaCompiler()) { "Java compilation tests require a JDK" }
        val source = File(temporaryFolder.root, "JavaAccess.java")
        source.writeText("package com.example.visibility; final class JavaAccess { void use() { $body } }")
        val diagnostics = DiagnosticCollector<JavaFileObject>()
        compiler.getStandardFileManager(diagnostics, null, null).use { manager ->
            val units = manager.getJavaFileObjects(source)
            val result =
                compiler.getTask(
                    null,
                    manager,
                    diagnostics,
                    listOf("-proc:none", "-classpath", classpath, "-d", temporaryFolder.root.path),
                    null,
                    units,
                ).call()
            assertEquals("$body\n${diagnostics.diagnostics.joinToString("\n")}", expected, result)
            if (!expected) {
                val errors = diagnostics.diagnostics.filter { it.kind == Diagnostic.Kind.ERROR }
                assertEquals(errors.joinToString("\n"), 1, errors.size)
                val code = errors.single().code
                assertTrue("$body: $code", expectedError.any { code.startsWith(it) })
            }
        }
    }

    companion object {
        private val HIDDEN_MEMBER = listOf("compiler.err.cant.resolve")
        private val HIDDEN_CONSTRUCTOR = listOf("compiler.err.report.access", "compiler.err.cant.apply.symbol")
    }
}
