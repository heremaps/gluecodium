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
      (container | types | struct | enumeration | typealias | exception | lambda)+ EOF
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
    : docComment* annotation* visibility? ('class' | 'interface') NewLine* simpleId NewLine*
      (':' NewLine* identifier NewLine*)? '{' NewLine* externalDescriptor?
      ((function | constructor | property | struct | enumeration | constant | typealias |
      exception | lambda | container) NewLine*)* '}' NewLine+
    ;

types
    : docComment* annotation* visibility? 'types' NewLine* simpleId NewLine*
      '{' NewLine* ((struct | enumeration | constant | typealias | exception) NewLine*)* '}' NewLine+
    ;

function
    : docComment* annotation* visibility? ('static' NewLine*)? 'fun' NewLine* simpleId NewLine*
      '(' NewLine* (parameter NewLine* (',' NewLine* parameter NewLine*)*)?  ')' NewLine*
      returnType? throwsClause? NewLine+
    ;

constructor
    : docComment* annotation* visibility? 'constructor' NewLine* simpleId NewLine*
      '(' NewLine* (parameter NewLine* (',' NewLine* parameter NewLine*)*)? ')' NewLine* throwsClause? NewLine+
    ;

parameter
    : docComment* annotation* simpleId NewLine* ':' NewLine* typeRef NewLine*
    ;

returnType
    : ':' NewLine* docComment* typeRef NewLine*
    ;

throwsClause
    : 'throws' NewLine* docComment* typeRef NewLine*
    ;

property
    : docComment* annotation* visibility? ('static' NewLine*)? 'property' NewLine* simpleId NewLine*
      ':' NewLine* typeRef NewLine* ('{' NewLine* getter (setter)? '}' )? NewLine+
    ;

getter
    : docComment* annotation* visibility? 'get' NewLine* externalDescriptor?
    ;

setter
    : docComment* annotation* visibility? 'set' NewLine* externalDescriptor?
    ;

struct
    : docComment* annotation* visibility? 'struct' NewLine* simpleId NewLine*
      '{' NewLine* externalDescriptor?
      ((field | function | constructor | constant | container | struct) NewLine*)+ '}' NewLine+
    ;

field
    : docComment* annotation* visibility? NewLine* simpleId NewLine* ':' NewLine* typeRef NewLine*
      ('=' NewLine* literalConstant NewLine*)? (externalDescriptor? | NewLine+)
    ;

enumeration
    : docComment* annotation* visibility? 'enum' NewLine* simpleId NewLine*
      '{' NewLine* externalDescriptor? enumerator NewLine* (',' NewLine* enumerator NewLine*)* '}' NewLine+
    ;

enumerator
    : docComment* annotation* simpleId NewLine* ('=' NewLine* literalConstant NewLine*)?
    ;

constant
    : docComment* annotation* visibility? 'const' NewLine* simpleId NewLine* ':' NewLine* typeRef NewLine*
      '=' NewLine* literalConstant NewLine+
    ;

typealias
    : docComment* annotation* visibility? 'typealias' NewLine* simpleId NewLine* '=' NewLine* typeRef NewLine+
    ;

exception
    : docComment* annotation* visibility? 'exception' NewLine* simpleId NewLine*
      '(' NewLine* simpleTypeRef NewLine* ')' NewLine+
    ;

lambda
    : docComment* annotation* visibility? 'lambda' NewLine* simpleId NewLine* '=' NewLine*
      '(' NewLine* (lambdaParameter (',' NewLine* lambdaParameter)*)? ')' NewLine*
      '->' NewLine* typeRef NewLine+
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
      'Blob' | 'Date' | 'Locale' | 'Void'
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

visibility
    : ('internal' | 'public' | 'open' | 'open' 'internal') NewLine*
    ;

literalConstant
    : singleLineStringLiteral
    | multiLineStringLiteral
    | enumeratorRef
    | structInitializer
    | listInitializer
    | mapInitializer
    | BooleanLiteral
    | ('+' | '-')? IntegerLiteral
    | ('+' | '-')? DoubleLiteral
    | ('+' | '-')? 'Infinity'
    | 'null'
    | 'NaN'
    ;

stringLiteral
    : singleLineStringLiteral | multiLineStringLiteral
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

enumeratorRef
    : identifier NewLine*
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

// Identifiers

simpleId
    : Identifier
    ;

identifier
    : simpleId ('.' simpleId)*
    ;
