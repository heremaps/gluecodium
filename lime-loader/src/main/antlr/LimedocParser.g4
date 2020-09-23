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
    : skipWhiteSpace* documentationContent? skipWhiteSpace* EOF
    ;

skipWhiteSpace
    : WhiteSpace | NewLine
    ;

documentationContent
    : description
    | tagSection
    | description skipWhiteSpace* NewLine skipWhiteSpace* tagSection
    ;

description
    : descriptionLine descriptionMoreLines*
    ;

descriptionMoreLines
    : NewLine+ descriptionLine
    ;

descriptionLine
    : WhiteSpace* decriptionFirstWord+ descriptionContent*
    ;

decriptionFirstWord
    : textContent | inlineTag
    ;

descriptionContent
    : (textContent | '{' | '}' | '@' | WhiteSpace+) | inlineTag
    ;

tagSection
    : blockTag+
    ;

blockTag
    : WhiteSpace* '@' tagName ('[' blockTagParameter ']')? (WhiteSpace blockTagContent*)?
    ;

tagName
    : Name
    ;

blockTagParameter
    : Name | Identifier
    ;

blockTagContent
    : (textContent | '{' | '}' | WhiteSpace+ | NewLine+) | inlineTag
    ;

inlineTag
      : '{@' tagName (WhiteSpace '@' tagName)* WhiteSpace inlineTagContent* '}'
      ;

inlineTagContent
    : textContent | WhiteSpace+ | NewLine+
    ;

textContent
    : TextContent | Name | Identifier | EscapedChar | MarkdownEscapedChar | '[' | ']'
    ;
