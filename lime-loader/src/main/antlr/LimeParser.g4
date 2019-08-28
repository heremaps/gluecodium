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
    : NewLine* packageHeader importHeader*
      (container | types | struct | enumeration | typealias | exception)+ EOF
    ;

packageHeader
    : 'package' identifier NewLine+
    ;

importHeader
    : 'import' identifier NewLine+
    ;

container
    : docComment* annotation* visibility? ('class' | 'interface') NewLine* simpleId NewLine*
      (':' NewLine* identifier NewLine*)? '{' NewLine* ((function | constructor | property |
      struct | enumeration | constant | typealias | exception) NewLine*)* '}' NewLine+
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
    : docComment* annotation* visibility? 'get' NewLine*
    ;

setter
    : docComment* annotation* visibility? 'set' NewLine*
    ;

struct
    : docComment* annotation* visibility? 'struct' NewLine* simpleId NewLine*
      '{' NewLine* ((field | function | constructor | constant) NewLine*)+ '}' NewLine+
    ;

field
    : docComment* annotation* visibility? NewLine* simpleId NewLine* ':' NewLine* typeRef NewLine*
      ('=' NewLine* literalConstant NewLine*)? NewLine+
    ;

enumeration
    : docComment* annotation* visibility? 'enum' NewLine* simpleId NewLine*
      '{' NewLine* enumerator NewLine* (',' NewLine* enumerator NewLine*)* '}' NewLine+
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
      '(' NewLine* identifier NewLine* ')' NewLine+
    ;

docComment
    : DELIMITED_COMMENT_OPEN DelimitedCommentText NewLine*
    | LINE_COMMENT_OPEN LineCommentText NewLine*
    ;

annotation
    : '@' simpleId ('(' NewLine* annotationValue (',' NewLine* annotationValue)* ')')? NewLine*
    ;

annotationValue
    : simpleId NewLine* ('=' NewLine* stringLiteral NewLine*)?
    | simpleId NewLine* '=' NewLine* '[' NewLine* stringLiteral (',' NewLine* stringLiteral)* NewLine* ']' NewLine*
    | stringLiteral NewLine*
    ;

// Type references

typeRef
    : (identifier | predefinedType | genericType) ('?')? NewLine*
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
    : identifier NewLine*
    ;

initializerList
    : '{' NewLine* ((simpleId NewLine* '=' NewLine*)? literalConstant NewLine*
      (',' NewLine* (simpleId NewLine* '=' NewLine*)? literalConstant NewLine*)*)? '}' NewLine*
    ;

// Identifiers

simpleId
    : Identifier
    ;

identifier
    : simpleId ('.' simpleId)*
    ;
