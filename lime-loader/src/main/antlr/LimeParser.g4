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
    : NL* packageHeader importHeader*
      (container | types | struct | enumeration | typealias | exception)+ EOF
    ;

packageHeader
    : 'package' identifier NL+
    ;

importHeader
    : 'import' identifier NL+
    ;

container
    : docComment* annotation* visibility? ('class' | 'interface') NL* simpleId NL*
      (':' NL* identifier NL*)? '{' NL* ((function | constructor | property |
      struct | enumeration | constant | typealias | exception) NL*)* '}' NL+
    ;

types
    : docComment* annotation* visibility? 'types' NL* simpleId NL*
      '{' NL* ((struct | enumeration | constant | typealias | exception) NL*)* '}' NL+
    ;

function
    : docComment* annotation* visibility? ('static' NL*)? 'fun' NL* simpleId NL*
      '(' NL* (parameter NL* (',' NL* parameter NL*)*)?  ')' NL*
      returnType? throwsClause? NL+
    ;

constructor
    : docComment* annotation* visibility? 'constructor' NL* simpleId NL*
      '(' NL* (parameter NL* (',' NL* parameter NL*)*)? ')' NL* throwsClause? NL+
    ;

parameter
    : docComment* annotation* simpleId NL* ':' NL* typeRef NL*
    ;

returnType
    : ':' NL* docComment* typeRef NL*
    ;

throwsClause
    : 'throws' NL* docComment* typeRef NL*
    ;

property
    : docComment* annotation* visibility? ('static' NL*)? 'property' NL* simpleId NL*
      ':' NL* typeRef NL* ('{' NL* getter (setter)? '}' )? NL+
    ;

getter
    : docComment* annotation* visibility? 'get' NL*
    ;

setter
    : docComment* annotation* visibility? 'set' NL*
    ;

struct
    : docComment* annotation* visibility? 'struct' NL* simpleId NL*
      '{' NL* ((field | function | constructor | constant) NL*)+ '}' NL+
    ;

field
    : docComment* annotation* visibility? NL* simpleId NL* ':' NL* typeRef NL*
      ('=' NL* literalConstant NL*)? NL+
    ;

enumeration
    : docComment* annotation* visibility? 'enum' NL* simpleId NL*
      '{' NL* enumerator NL* (',' NL* enumerator NL*)* '}' NL+
    ;

enumerator
    : docComment* annotation* simpleId NL* ('=' NL* literalConstant NL*)?
    ;

constant
    : docComment* annotation* visibility? 'const' NL* simpleId NL* ':' NL* typeRef NL*
      '=' NL* literalConstant NL+
    ;

typealias
    : docComment* annotation* visibility? 'typealias' NL* simpleId NL* '=' NL* typeRef NL+
    ;

exception
    : docComment* annotation* visibility? 'exception' NL* simpleId NL*
      '(' NL* identifier NL* ')' NL+
    ;

docComment
    : DELIMITED_COMMENT_OPEN DelimitedCommentText NL*
    | LINE_COMMENT_OPEN LineCommentText NL*
    ;

annotation
    : '@' simpleId ('(' NL* annotationValue (',' NL* annotationValue)* ')')? NL*
    ;

annotationValue
    : simpleId NL* ('=' NL* stringLiteral NL*)?
    | simpleId NL* '=' NL* '[' NL* stringLiteral (',' NL* stringLiteral)* NL* ']' NL*
    | stringLiteral NL*
    ;

// Type references

typeRef
    : (identifier | predefinedType | genericType) ('?')? NL*
    ;

predefinedType
    : 'Byte'  | 'Short'  | 'Int'  | 'Long'  |
      'UByte'  | 'UShort'  | 'UInt'  | 'ULong' |
      'Boolean' | 'String' | 'Float' | 'Double' |
      'Blob' | 'Date'
    ;

genericType
    : listType | mapType | setType
    ;

listType
    : 'List' NL* '<' NL* typeRef NL* '>' NL*
    ;

mapType
    : 'Map' NL* '<' NL* typeRef NL* ',' NL* typeRef NL* '>' NL*
    ;

setType
    : 'Set' NL* '<' NL* typeRef NL* '>' NL*
    ;

// Literals

visibility
    : ('internal' | 'public' | 'open' | 'open' 'internal') NL*
    ;

literalConstant
    : singleLineStringLiteral
    | multiLineStringLiteral
    | enumeratorRef
    | initializerList
    | BooleanLiteral
    | ('+' | '-')? IntegerLiteral
    | ('+' | '-')? DoubleLiteral
    | ('+' | '-')? 'Infinity'
    | 'null'
    | '[]'
    | 'NaN'
    ;

stringLiteral
    : singleLineStringLiteral | multiLineStringLiteral
    ;

singleLineStringLiteral
    : QUOTE_OPEN singleLineStringContent* QUOTE_CLOSE
    ;

singleLineStringContent
    : LineStrText | LineStrEscapedChar ;

multiLineStringLiteral
    : TRIPLE_QUOTE_OPEN multiLineStringContent* TRIPLE_QUOTE_CLOSE
    ;

multiLineStringContent
    : MultiLineStrText | MultiLineStringQuote
    ;

enumeratorRef
    : identifier NL*
    ;

initializerList
    : '{' NL* ((simpleId NL* '=' NL*)? literalConstant NL*
    (',' NL* (simpleId NL* '=' NL*)? literalConstant NL*)*)? '}' NL*
    ;

// Identifiers

simpleId
    : Identifier
    ;

identifier
    : simpleId ('.' simpleId)*
    ;
