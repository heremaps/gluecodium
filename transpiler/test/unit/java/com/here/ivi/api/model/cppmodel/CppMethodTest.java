package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.common.templates.MethodBodyTemplate;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.*;

public class CppMethodTest {
    private CppMethod cppMethod = new CppMethod();

    @Test
    public void generateBodyWithNullMethodBodyTemplate() {
        cppMethod.mbt = null;

        assertNull(cppMethod.generateBody());
    }

    @Test
    public void generateBodyWithMockMethodBodyTemplate() {
        MethodBodyTemplate methodBodyTemplate = mock(MethodBodyTemplate.class);
        when(methodBodyTemplate.generate(cppMethod)).thenReturn(new StringConcatenation());

        cppMethod.mbt = methodBodyTemplate;

        assertNotNull(cppMethod.generateBody());
        verify(methodBodyTemplate).generate(cppMethod);
    }
}
