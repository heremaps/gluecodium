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

parser grammar LimedocParser;

options { tokenVocab = LimedocLexer; }

documentation
    : skipWS* documentationContent? skipWS* EOF
    ;

skipWS
    : WS | NL
    ;

documentationContent
    : description
    | tagSection
    | description skipWS* NL skipWS* tagSection
    ;

description
    : descriptionLine descriptionMoreLines*
    ;

descriptionMoreLines
    : NL+ descriptionLine
    ;

descriptionLine
    : WS* decriptionFirstWord+ descriptionContent*
    ;

decriptionFirstWord
    : textContent | inlineTag
    ;

descriptionContent
    : (textContent | '{' | '}' | '@' | WS+) | inlineTag
    ;

tagSection
    : blockTag+
    ;

blockTag
    : WS* '@' tagName ('[' blockTagParameter ']')? WS blockTagContent*
    ;

tagName
    : NAME
    ;

blockTagParameter
    : NAME | IDENTIFIER
    ;

blockTagContent
    : (textContent | '{' | '}' | WS+ | NL+) | inlineTag
    ;

inlineTag
      : '{@' tagName WS inlineTagContent* '}'
      ;

inlineTagContent
    // TODO: escaping
    : textContent | WS+ | NL+
    ;

textContent
    : TEXT_CONTENT | NAME | IDENTIFIER | '[' | ']'
    ;
