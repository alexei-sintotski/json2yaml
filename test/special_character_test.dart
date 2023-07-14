/*
 * MIT License
 *
 * Copyright (c) 2019 Alexei Sintotski
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group('json2yaml', () {
    testCase(
      'given a string value that ends with $_colon',
      json: _valueWithColon,
      yaml: _valueWithColonYaml,
    );

    testCase(
      'given a string value with $_squareBrackets',
      json: _valueWithSquareBrackets,
      yaml: _valueWithSquareBracketsYaml,
    );

    testCase(
      'given a string value with $_curlyBraces',
      json: _valueWithCurlyBraces,
      yaml: _valueWithCurlyBracesYaml,
    );

    testCase(
      'given a string value with $_greaterSign',
      json: _valueWithGreaterSign,
      yaml: _valueWithGreaterSignYaml,
    );

    testCase(
      'given a string value with $_exclamationMark',
      json: _valueWithExclamationMark,
      yaml: _valueWithExclamationMarkYaml,
    );

    testCase(
      'given a string value with $_asterisk',
      json: _valueWithAsterisk,
      yaml: _valueWithAsteriskYaml,
    );

    testCase(
      'given a string value with $_ampersand',
      json: _valueWithAmpersand,
      yaml: _valueWithAmpersandYaml,
    );

    testCase(
      'given a string value with $_pipeSign',
      json: _valueWithPipeSign,
      yaml: _valueWithPipeSignYaml,
    );

    testCase(
      'given a string value with $_percentSign',
      json: _valueWithPercentSign,
      yaml: _valueWithPercentSignYaml,
    );

    testCase(
      'given a string value with $_hash',
      json: _valueWithHash,
      yaml: _valueWithHashYaml,
    );

    testCase(
      'given a string value with $_backquote',
      json: _valueWithBackquote,
      yaml: _valueWithBackquoteYaml,
    );

    testCase(
      'given a string value with $_atSign',
      json: _valueWithAtSign,
      yaml: _valueWithAtSignYaml,
    );

    testCase(
      'given a string value with $_comma',
      json: _valueWithComma,
      yaml: _valueWithCommaYaml,
    );

    testCase(
      'given a string value with $_questionMark',
      json: _valueWithQuestionMark,
      yaml: _valueWithQuestionMarkYaml,
    );

    testCase(
      'given a string value with $_dash',
      json: _valueWithDash,
      yaml: _valueWithDashYaml,
    );
  });
}

const _colon = ':'; // Indicates mapping in YAML
const _valueWithColon = {
  'windows_drive': 'c$_colon',
};
const _valueWithColonYaml = '''
windows_drive: "c$_colon"
''';

const _squareBrackets = '[]';
const _valueWithSquareBrackets = {'value': _squareBrackets};
const _valueWithSquareBracketsYaml = '''
value: "$_squareBrackets"
''';

const _curlyBraces = '{}';
const _valueWithCurlyBraces = {'value': _curlyBraces};
const _valueWithCurlyBracesYaml = '''
value: "$_curlyBraces"
''';

const _greaterSign = '>';
const _valueWithGreaterSign = {'value': _greaterSign};
const _valueWithGreaterSignYaml = '''
value: "$_greaterSign"
''';

const _exclamationMark = '!';
const _valueWithExclamationMark = {'value': _exclamationMark};
const _valueWithExclamationMarkYaml = '''
value: "$_exclamationMark"
''';

const _asterisk = '*';
const _valueWithAsterisk = {'value': _asterisk};
const _valueWithAsteriskYaml = '''
value: "$_asterisk"
''';

const _ampersand = '&';
const _valueWithAmpersand = {'value': _ampersand};
const _valueWithAmpersandYaml = '''
value: "$_ampersand"
''';

const _pipeSign = '|';
const _valueWithPipeSign = {'value': _pipeSign};
const _valueWithPipeSignYaml = '''
value: "$_pipeSign"
''';

const _percentSign = '%';
const _valueWithPercentSign = {'value': _percentSign};
const _valueWithPercentSignYaml = '''
value: "$_percentSign"
''';

const _hash = ' #'; // Indicates comment in YAML
const _valueWithHash = {'value': _hash};
const _valueWithHashYaml = '''
value: "$_hash"
''';

const _backquote = '`';
const _valueWithBackquote = {'value': _backquote};
const _valueWithBackquoteYaml = '''
value: "$_backquote"
''';

const _atSign = '@';
const _valueWithAtSign = {'value': _atSign};
const _valueWithAtSignYaml = '''
value: "$_atSign"
''';

const _comma = ',';
const _valueWithComma = {'value': _comma};
const _valueWithCommaYaml = '''
value: "$_comma"
''';

const _questionMark = '?';
const _valueWithQuestionMark = {'value': _questionMark};
const _valueWithQuestionMarkYaml = '''
value: "$_questionMark"
''';

const _dash = '-';
const _valueWithDash = {'value': _hash};
const _valueWithDashYaml = '''
value: "$_hash"
''';
