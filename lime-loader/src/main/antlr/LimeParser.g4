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

parser grammar LimeParser;

options { tokenVocab = LimeLexer; }

limeFile
    : NewLine* packageHeader importHeader
      (container |  struct | enumeration | typealias | exception | lambda)+ EOF
    ;

packageHeader
    : 'package' identifier NewLine+
    ;

importHeader
    : importStatement*
    ;

importStatement
    : 'import' identifier NewLine+
    ;

container
    : docComment* annotation* 'open'? ('class' | 'narrow'? 'interface') NewLine*
      simpleId NewLine* parentTypes? '{' NewLine* externalDescriptor?
      ((function | constructor | property | struct | enumeration | constant | typealias |
      exception | lambda | container) NewLine*)* '}' NewLine+
    ;

parentTypes
    : ':' NewLine* identifier NewLine* (',' NewLine* identifier NewLine*)*
    ;

function
    : docComment* annotation* ('static' NewLine*)? 'fun' NewLine* simpleId NewLine*
      '(' NewLine* (parameter (',' NewLine* parameter)*)?  ')' NewLine*
      (':' returnType)? throwsClause? NewLine*
    ;

constructor
    : docComment* annotation* 'constructor' NewLine* simpleId NewLine*
      '(' NewLine* (parameter (',' NewLine* parameter)*)? ')' NewLine* throwsClause? NewLine*
    ;

fieldConstructor
    : docComment* annotation* 'field' NewLine* 'constructor' NewLine*
      '(' NewLine* (fieldParameter (',' NewLine* fieldParameter)*)? ')' NewLine*
    ;

fieldParameter
    : annotation* simpleId NewLine*
    ;

parameter
    : docComment* annotation* simpleId NewLine* ':' NewLine* typeRef NewLine*
    ;

returnType
    : NewLine* docComment* typeRef NewLine*
    ;

throwsClause
    : 'throws' NewLine* docComment* typeRef NewLine*
    ;

property
    : docComment* annotation* ('static' NewLine*)? 'property' NewLine* simpleId NewLine*
      ':' NewLine* typeRef NewLine* ('{' NewLine* getter (setter)? '}' )? NewLine+
    ;

getter
    : docComment* annotation* 'get' NewLine* externalDescriptor?
    ;

setter
    : docComment* annotation* 'set' NewLine* externalDescriptor?
    ;

struct
    : docComment* annotation* 'struct' NewLine* simpleId NewLine*
      '{' NewLine* externalDescriptor?
      ((field | function | constructor | fieldConstructor | constant | container | struct |
      enumeration | typealias | exception | lambda) NewLine*)+
      '}' NewLine+
    ;

field
    : docComment* annotation* NewLine* simpleId NewLine* ':' NewLine* typeRef NewLine*
      ('=' NewLine* literalConstant NewLine*)? (externalDescriptor? | NewLine+)
    ;

enumeration
    : docComment* annotation* 'enum' NewLine* simpleId NewLine*
      '{' NewLine* externalDescriptor? enumerator NewLine* (',' NewLine* enumerator NewLine*)* '}' NewLine+
    ;

enumerator
    : docComment* annotation* simpleId NewLine* ('=' NewLine* literalConstant NewLine*)?
    ;

constant
    : docComment* annotation* 'const' NewLine* simpleId NewLine* ':' NewLine* typeRef NewLine*
      '=' NewLine* literalConstant NewLine+
    ;

typealias
    : docComment* annotation* 'typealias' NewLine* simpleId NewLine* '=' NewLine* typeRef NewLine+
    ;

exception
    : docComment* annotation* 'exception' NewLine* simpleId NewLine*
      '(' NewLine* simpleTypeRef NewLine* ')' NewLine+
    ;

lambda
    : docComment* annotation* 'lambda' NewLine* simpleId NewLine* '=' NewLine*
      '(' NewLine* (lambdaParameter (',' NewLine* lambdaParameter)*)? ')' NewLine*
      '->' returnType
    ;

lambdaParameter
    : typeRef NewLine*
    ;

// Comments, annotations, and descriptors

docComment
    : DelimitedCommentOpen DelimitedCommentText NewLine*
    | LineCommentOpen LineCommentText NewLine*
    ;

annotation
    : '@' simpleId ('(' NewLine* annotationValue (',' NewLine* annotationValue)* ')')? NewLine*
    ;

annotationValue
    : simpleId NewLine* ('=' NewLine* singleLineStringLiteral NewLine*)?
    | simpleId NewLine* '=' NewLine* '[' NewLine* singleLineStringLiteral NewLine* (',' NewLine* singleLineStringLiteral NewLine*)* ']' NewLine*
    | singleLineStringLiteral NewLine*
    ;

externalDescriptor
    : 'external' NewLine* '{' NewLine* externalDescriptorValue+ '}' NewLine+
    ;

externalDescriptorValue
    : simpleId simpleId singleLineStringLiteral NewLine*
    ;

// Type references

typeRef
    : simpleTypeRef ('?')? NewLine*
    ;

simpleTypeRef
    : annotation* (identifier | predefinedType | genericType)
    ;

predefinedType
    : 'Byte'  | 'Short'  | 'Int'  | 'Long'  |
      'UByte'  | 'UShort'  | 'UInt'  | 'ULong' |
      'Boolean' | 'String' | 'Float' | 'Double' |
      'Blob' | 'Date' | 'Duration' | 'Locale' | 'Void'
    ;

genericType
    : listType | mapType | setType
    ;

listType
    : 'List' NewLine* '<' NewLine* typeRef NewLine* '>' NewLine*
    ;

mapType
    : 'Map' NewLine* '<' NewLine* typeRef NewLine* ',' NewLine* typeRef NewLine* '>' NewLine*
    ;

setType
    : 'Set' NewLine* '<' NewLine* typeRef NewLine* '>' NewLine*
    ;

// Literals

literalConstant
    : singleLineStringLiteral
    | multiLineStringLiteral
    | elementRef
    | positionalEnumeratorRef
    | structInitializer
    | listInitializer
    | mapInitializer
    | durationLiteral
    | BooleanLiteral
    | ('+' | '-')? IntegerLiteral
    | ('+' | '-')? DoubleLiteral
    | ('+' | '-')? 'Infinity'
    | 'null'
    | 'NaN'
    ;

singleLineStringLiteral
    : QuoteOpen singleLineStringContent* QuoteClose
    ;

singleLineStringContent
    : LineStrText | LineStrEscapedChar ;

multiLineStringLiteral
    : TripleQuoteOpen multiLineStringContent* TripleQuoteClose
    ;

multiLineStringContent
    : MultiLineStrText | MultiLineStringQuote
    ;

elementRef
    : identifier NewLine*
    ;

positionalEnumeratorRef
    : identifier NewLine* '(' NewLine* IntegerLiteral NewLine* ')' NewLine*
    ;

structInitializer
    : '{' NewLine* ((simpleId NewLine* '=' NewLine*)? literalConstant NewLine*
      (',' NewLine* (simpleId NewLine* '=' NewLine*)? literalConstant NewLine*)*)? '}' NewLine*
    ;

listInitializer
    : '[' NewLine* (literalConstant NewLine* (',' NewLine* literalConstant NewLine*)*)? ']' NewLine*
    ;

mapInitializer
    : '[' NewLine* (keyValuePair NewLine* (',' NewLine* keyValuePair NewLine*)*)? ']' NewLine*
    ;

keyValuePair
    : literalConstant NewLine* ':' NewLine* literalConstant
    ;

durationLiteral
    : ('+' | '-')? DurationLiteral
    ;

// Identifiers

simpleId
    : Identifier
    ;

identifier
    : simpleId ('.' simpleId)*
    ;
