/**
 * Module to allow validation on the syntax and the content of fidl/fdepl files.
 *
 * <h1>Input</h1>
 *
 * For content validation, the input is a FrancaModel. For syntax validation, the input is the
 * collection of fidl/fdepl files.
 *
 * <h1>Output</h1>
 *
 * Boolean return on valid or invalid. Validation failure diagnostics will be output to the {@link
 * com.here.genium.logger.TranspilerLogger}. In the future, when more validation rules comes to
 * mind, we can extend the result to support different types of syntanx/content violations.
 */
package com.here.genium.validator;
