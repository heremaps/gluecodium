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

import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.*;

import com.here.ivi.api.TranspilerExecutionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.*;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

@RunWith(JUnit4.class)
public final class CommandLineToolTest {

  private final int endOfStream = -1;
  private final GeneratedFile generatedFile = new GeneratedFile("", "");
  private final GeneratedFile generatedFileWithContents = new GeneratedFile("file contents", "");

  @Rule public ExpectedException expectedException = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Process systemProcess;

  private CommandLineTool commandLineTool;

  @Before
  public void setUp() throws IOException {
    MockitoAnnotations.initMocks(this);

    commandLineTool = Mockito.spy(new CommandLineTool("", "", new ArrayList<>()));
    Mockito.doReturn(systemProcess).when(commandLineTool).startSystemProcess();

    when(systemProcess.getInputStream().read(any(byte[].class), anyInt(), anyInt()))
        .thenReturn(endOfStream);
    when(systemProcess.getErrorStream().read(any(byte[].class), anyInt(), anyInt()))
        .thenReturn(endOfStream);
  }

  @Test
  public void processDoesNotThrow() {
    commandLineTool.process(generatedFile);
  }

  @Test
  public void processDoesNowWriteEmptyInput() throws IOException {
    commandLineTool.process(generatedFile);

    verify(systemProcess.getOutputStream(), never()).write(any(byte[].class), anyInt(), anyInt());
  }

  @Test
  public void processWritesInput() throws IOException {
    commandLineTool.process(generatedFileWithContents);

    verify(systemProcess.getOutputStream()).write(any(byte[].class), anyInt(), anyInt());
  }

  @Test
  public void processReadsOutput() throws IOException {
    commandLineTool.process(generatedFile);

    //noinspection ResultOfMethodCallIgnored
    verify(systemProcess.getInputStream()).read(any(byte[].class), anyInt(), anyInt());
  }

  @Test
  public void processReadsErrors() throws IOException {
    commandLineTool.process(generatedFile);

    //noinspection ResultOfMethodCallIgnored
    verify(systemProcess.getErrorStream()).read(any(byte[].class), anyInt(), anyInt());
  }

  @Test
  public void processWaitsForSystemProcess() throws InterruptedException {
    commandLineTool.process(generatedFile);

    verify(systemProcess).waitFor();
  }

  @Test
  public void processDoesCleanUp() {
    commandLineTool.process(generatedFile);

    verify(systemProcess).destroy();
  }

  @Test(expected = TranspilerExecutionException.class)
  public void processThrowsOnWriteError() throws IOException {
    // Don't inline this variable, Mockito will fail at runtime
    OutputStream outputStream = systemProcess.getOutputStream();
    doThrow(new IOException()).when(outputStream).write(any(byte[].class), anyInt(), anyInt());

    commandLineTool.process(new GeneratedFile("file contents", ""));
  }

  @Test
  public void processThrowsOnOutputReadError() throws IOException {
    // Don't inline this variable, Mockito will fail at runtime
    InputStream inputStream = systemProcess.getInputStream();
    //noinspection ResultOfMethodCallIgnored
    doThrow(new IOException()).when(inputStream).read(any(byte[].class), anyInt(), anyInt());

    expectedException.expect(TranspilerExecutionException.class);

    commandLineTool.process(generatedFile);
  }

  @Test
  public void processThrowsOnErrorReadError() throws IOException {
    // Don't inline this variable, Mockito will fail at runtime
    InputStream errorStream = systemProcess.getErrorStream();
    //noinspection ResultOfMethodCallIgnored
    doThrow(new IOException()).when(errorStream).read(any(byte[].class), anyInt(), anyInt());

    expectedException.expect(TranspilerExecutionException.class);

    commandLineTool.process(generatedFile);
  }

  @Test
  public void processThrowsOnNonZeroExitCode() {
    when(systemProcess.exitValue()).thenReturn(1);

    expectedException.expect(TranspilerExecutionException.class);

    commandLineTool.process(generatedFile);
  }

  @Test
  public void processThrowsOnNonEmptyError() throws IOException {
    final String errorString = "error";
    when(systemProcess.getErrorStream().read(any(byte[].class), anyInt(), anyInt()))
        .thenAnswer(
            new Answer<Integer>() {
              private boolean firstCall = true;

              @Override
              public Integer answer(final InvocationOnMock invocation) {
                if (!firstCall) {
                  return endOfStream;
                }

                firstCall = false;

                byte[] buffer = (byte[]) (invocation.getArguments())[0];
                final int bufferOffset = (int) (invocation.getArguments())[1];
                final int bufferLength = (int) (invocation.getArguments())[2];

                final int count = Math.min(bufferLength, errorString.length());
                System.arraycopy(errorString.getBytes(), 0, buffer, bufferOffset, count);

                return count;
              }
            });

    expectedException.expect(TranspilerExecutionException.class);

    commandLineTool.process(generatedFile);
  }

  @Test
  public void processDoesCleanUpOnThrow() {
    when(systemProcess.exitValue()).thenReturn(1);

    expectedException.expect(TranspilerExecutionException.class);
    commandLineTool.process(generatedFile);

    verify(systemProcess).destroy();
  }
}
