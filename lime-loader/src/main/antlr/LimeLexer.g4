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

WhiteSpace  : [ \t]+
      -> skip
    ;

NewLine  : '\n'
    | '\r'
    | '\r' '\n'
    ;

// Separators and operators

Arrow: '->' ;
Assignment: '=' ;
At: '@' ;
Colon: ':' ;
Comma: ',' ;
Dot: '.' ;
Minus: '-' ;
Plus: '+' ;
Quest: '?' ;
LParen: '(' ;
RParen: ')' ;
LCurl: '{' ;
RCurl: '}' ;
LAngle: '<' ;
RAngle: '>' ;
LSquare: '[' ;
RSquare: ']' ;

// Keywords

Class: 'class' ;
Const: 'const' ;
Constructor: 'constructor' ;
Fun: 'fun' ;
Enum: 'enum' ;
Exception: 'exception' ;
Get: 'get' ;
Import: 'import' ;
Interface: 'interface' ;
Internal: 'internal' ;
Lambda: 'lambda' ;
Open: 'open' ;
Package: 'package' ;
Property: 'property' ;
Public: 'public' ;
Set: 'set' ;
Static: 'static' ;
Struct: 'struct' ;
Throws: 'throws' ;
TypeAlias: 'typealias' ;
Types: 'types' ;

// Predefined types

VoidType: 'Void' ;
BoolType: 'Boolean' ;
FloatType: 'Float' ;
DoubleType: 'Double' ;
ByteType: 'Byte' ;
ShortType: 'Short' ;
IntType: 'Int' ;
LongType: 'Long' ;
UByteType: 'UByte' ;
UShortType: 'UShort' ;
UIntType: 'UInt' ;
ULongType: 'ULong' ;
StringType: 'String' ;
BlobType: 'Blob' ;
DateType: 'Date' ;

ListType: 'List' ;
MapType: 'Map' ;
SetType: 'Set' ;

// Literals

BooleanLiteral: 'true' | 'false' ;
NullLiteral: 'null' ;
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

QuoteOpen: '"' -> pushMode(LineString) ;
TripleQuoteOpen: '"""' -> pushMode(MultiLineString) ;
LineCommentOpen: '//' -> pushMode(LineComment) ;
DelimitedCommentOpen: '/*' -> pushMode(DelimitedComment) ;

mode LineString ;
LineStrText: ~('\\' | '"')+ ;
LineStrEscapedChar: '\\' ('t' | 'b' | 'r' | 'n' | '"' | '\\') ;
QuoteClose: '"' -> popMode ;

mode MultiLineString ;
MultiLineStringQuote : '"'+ ;
MultiLineStrText :  ~'"'+ ;
TripleQuoteClose : MultiLineStringQuote? '"""' -> popMode ;

mode LineComment ;
LineCommentText: .*? [\r\n] -> popMode ;

mode DelimitedComment ;
DelimitedCommentText: .*? '*/' -> popMode ;
