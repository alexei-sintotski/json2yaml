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
      'given a multiline string',
      json: _multilineStringValue,
      yaml: _multilineStringValueYaml,
    );

    testCase(
      'given a multiline string with endline in the end',
      json: _multilineStringWithEndlineValue,
      yaml: _multilineStringWithEndlineValueYaml,
    );

    testCase(
      'given a complex example with multiline string',
      json: _complexExampleJson,
      yaml: _complexExampleYaml,
    );
  });
}

const _multilineStringValue = {
  'education': '4 GCSEs\n3 A-Levels\nBSc in the Internet of Things',
};
const _multilineStringValueYaml = '''
education: |-
  4 GCSEs
  3 A-Levels
  BSc in the Internet of Things
''';

const _multilineStringWithEndlineValue = {
  'education': '4 GCSEs\n3 A-Levels\nBSc in the Internet of Things\n',
};
const _multilineStringWithEndlineValueYaml = '''
education: |
  4 GCSEs
  3 A-Levels
  BSc in the Internet of Things
''';

const _complexExampleJson = {
  'name': "Martin D'vloper",
  'job': 'Developer',
  'skill': 'Elite',
  'employed': true,
  'foods': ['Apple', 'Orange', 'Strawberry', 'Mango'],
  'education': '4 GCSEs\n3 A-Levels\nBSc in the Internet of Things',
  'languages': {
    'perl': 'Elite',
    'python': 'Elite',
    'pascal': 'Lame',
  },
};
const _complexExampleYaml = '''
name: Martin D'vloper
job: Developer
skill: Elite
employed: true
foods:
  - Apple
  - Orange
  - Strawberry
  - Mango
education: |-
  4 GCSEs
  3 A-Levels
  BSc in the Internet of Things
languages:
  perl: Elite
  python: Elite
  pascal: Lame
''';
