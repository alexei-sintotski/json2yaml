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
      'given a floating point value',
      json: _fpValue,
      yaml: _fpValueYaml,
    );

    testCase(
      'given a string convertible to double',
      json: _versionString,
      yaml: _versionStringYaml,
    );

    testCase(
      'given a double value convertible to int',
      json: _doubleConvertibleToInt,
      yaml: _doubleConvertibleToIntYaml,
    );
  });
}

const _fpValue = {
  'value': 1.1,
};
const _fpValueYaml = '''
value: 1.1
''';

const _versionString = {
  'value': '1.1',
};
const _versionStringYaml = '''
value: "1.1"
''';

const _doubleConvertibleToInt = {
  'value': 1.0,
};
const _doubleConvertibleToIntYaml = '''
value: 1.0
''';
