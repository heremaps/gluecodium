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

lexer grammar LimeLexer;

LocalComment
    : '#' ~[\r\n]*
      -> channel(HIDDEN)
    ;

WS  : [ \t]+
      -> skip
    ;

NL  : '\n'
    | '\r'
    | '\r' '\n'
    ;

// Separators and operators

ASSIGNMENT: '=' ;
AT: '@' ;
COLON: ':' ;
COMMA: ',' ;
DOT: '.' ;
MINUS: '-' ;
PLUS: '+' ;
QUEST: '?' ;
LPAREN: '(' ;
RPAREN: ')' ;
LCURL: '{' ;
RCURL: '}' ;
LANGLE: '<' ;
RANGLE: '>' ;

// Keywords

CLASS: 'class' ;
CONST: 'const' ;
CONSTRUCTOR: 'constructor' ;
FUN: 'fun' ;
ENUM: 'enum' ;
EXCEPTION: 'exception' ;
GET: 'get' ;
IMPORT: 'import' ;
INTERFACE: 'interface' ;
INTERNAL: 'internal' ;
OPEN: 'open' ;
PACKAGE: 'package' ;
PROPERTY: 'property' ;
PUBLIC: 'public' ;
SET: 'set' ;
STATIC: 'static' ;
STRUCT: 'struct' ;
THROWS: 'throws' ;
TYPEALIAS: 'typealias' ;
TYPES: 'types' ;

// Predefined types

VOID_TYPE: 'Void' ;
BOOL_TYPE: 'Boolean' ;
FLOAT_TYPE: 'Float' ;
DOUBLE_TYPE: 'Double' ;
BYTE_TYPE: 'Byte' ;
SHORT_TYPE: 'Short' ;
INT_TYPE: 'Int' ;
LONG_TYPE: 'Long' ;
UBYTE_TYPE: 'UByte' ;
USHORT_TYPE: 'UShort' ;
UINT_TYPE: 'UInt' ;
ULONG_TYPE: 'ULong' ;
STRING_TYPE: 'String' ;
BLOB_TYPE: 'Blob' ;
DATE_TYPE: 'Date' ;

LIST_TYPE: 'List' ;
MAP_TYPE: 'Map' ;
SET_TYPE: 'Set' ;

// Literals

BooleanLiteral: 'true' | 'false' ;
NullLiteral: 'null' ;
EmptyCollectionLiteral: '[]' ;
NanLiteral: 'NaN' ;
InfinityLiteral: 'Infinity' ;

DoubleLiteral
    : DecDigits? '.' DecDigits DoubleExponent?
    | DecDigits DoubleExponent
    ;

IntegerLiteral
    : DecDigitNoZero DecDigitOrSeparator* DecDigit
    | DecDigit
    ;

fragment DecDigitOrSeparator: DecDigit | '_';
fragment DecDigits
    : DecDigit DecDigitOrSeparator* DecDigit
    | DecDigit
    ;
fragment DoubleExponent: [eE] [+-]? DecDigits;
fragment DecDigit: '0'..'9' ;
fragment DecDigitNoZero: '1'..'9' ;

// Identifier

Identifier
    : (Letter | '_') (Letter | '_' | DecimalDigit)*
    | '`' ~('\r' | '\n' | '`')+ '`'
    ;

fragment Letter
    : [a-zA-Z]
    ;

fragment DecimalDigit
    : [0-9]
    ;

// Modes

QUOTE_OPEN: '"' -> pushMode(LineString) ;
TRIPLE_QUOTE_OPEN: '"""' -> pushMode(MultiLineString) ;
LINE_COMMENT_OPEN: '//' -> pushMode(LineComment) ;
DELIMITED_COMMENT_OPEN: '/*' -> pushMode(DelimitedComment) ;

mode LineString ;
LineStrText: ~('\\' | '"')+ ;
LineStrEscapedChar: '\\' ('t' | 'b' | 'r' | 'n' | '"' | '\\') ;
QUOTE_CLOSE: '"' -> popMode ;

mode MultiLineString ;
MultiLineStringQuote : '"'+ ;
MultiLineStrText :  ~'"'+ ;
TRIPLE_QUOTE_CLOSE : MultiLineStringQuote? '"""' -> popMode ;

mode LineComment ;
LineCommentText: .*? [\r\n] -> popMode ;

mode DelimitedComment ;
DelimitedCommentText: .*? '*/' -> popMode ;
