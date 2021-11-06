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
      'given a boolean value true',
      json: _booleanTrue,
      yaml: _booleanTrueYaml,
    );

    testCase(
      'given a string value true',
      json: _stringTrue,
      yaml: _stringTrueYaml,
    );

    testCase(
      'given a boolean value false',
      json: _booleanFalse,
      yaml: _booleanFalseYaml,
    );

    testCase(
      'given a string value false',
      json: _stringFalse,
      yaml: _stringFalseYaml,
    );
  });
}

const _booleanTrue = {
  'value': true,
};
const _booleanTrueYaml = '''
value: true
''';

const _stringTrue = {
  'value': 'true',
};
const _stringTrueYaml = '''
value: "true"
''';

const _booleanFalse = {
  'value': false,
};
const _booleanFalseYaml = '''
value: false
''';

const _stringFalse = {
  'value': 'false',
};
const _stringFalseYaml = '''
value: "false"
''';
