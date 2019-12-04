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
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'dart:convert';

import 'package:json2yaml/json2yaml.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('$json2yaml', () {
    group('given basic string entry', () {
      final result = json2yaml(basicStringJson);
      test('it produces correct basic string field', () {
        expect(result, basicStringYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(result), basicStringJson);
      });
    });

    group('given structured data', () {
      final result = json2yaml(structuredDataJson);
      test('it produces YAML with correct structured data', () {
        expect(result, structuredDataYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(result), structuredDataJson);
      });
    });

    group('given data with list', () {
      final result = json2yaml(dataWithListJson);
      test('it produces YAML with correct list', () {
        expect(result, dataWithListYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(result), dataWithListJson);
      });
    });

    group('given data with boolean value', () {
      final result = json2yaml(boolJson);
      test('it produces YAML with correct boolean value', () {
        expect(result, boolYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(result), boolJson);
      });
    });

    group('given data with multiline string', () {
      final result = json2yaml(multilineStringJson);
      test('it produces YAML with multiline string', () {
        expect(result, multilineStringYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(result), multilineStringJson);
      });
    });

    group('given complex data structure', () {
      final result = json2yaml(complexExampleJson);
      test('it produces correct YAML', () {
        expect(result, complexExampleYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(result), complexExampleJson);
      });
    });

    group('given string with .', () {
      test('it produces safe YAML by default', () {
        expect(json2yaml(stringWithDotJson), stringWithDotWithQuotesYaml);
      });
      test('it produces YAML with qoutes for PubspecLock style', () {
        expect(json2yaml(stringWithDotJson, yamlStyle: YamlStyle.pubspecLock), stringWithDotWithQuotesYaml);
      });
      test('it produces YAML without qoutes for PubspecYaml style', () {
        expect(json2yaml(stringWithDotJson, yamlStyle: YamlStyle.pubspecYaml), stringWithDotWithoutQuotesYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(json2yaml(stringWithDotJson)), stringWithDotJson);
      });
    });

    group('given string with special characters', () {
      final result = json2yaml(stringWithSpecialCharactersJson);
      test('it produces correct YAML', () {
        expect(result, stringWithSpecialCharactersYaml);
      });
      test('it preserves json structure', () {
        expect(loadAsJson(result), stringWithSpecialCharactersJson);
      });
    });
  });
}

dynamic loadAsJson(String result) => json.decode(json.encode(loadYaml(result)));

const basicStringJson = {'basic_string': 'basic string'};
const basicStringYaml = 'basic_string: basic string';

const structuredDataJson = {
  'martin': {
    'name': "Martin D'vloper",
    'job': 'Developer',
    'skill': 'Elite',
  }
};
const structuredDataYaml = '''
martin:
  name: Martin D'vloper
  job: Developer
  skill: Elite''';

const dataWithListJson = {
  'martin': {
    'name': "Martin D'vloper",
    'job': 'Developer',
    'skills': ['python', 'perl', 'pascal']
  },
};
const dataWithListYaml = '''
martin:
  name: Martin D'vloper
  job: Developer
  skills:
    - python
    - perl
    - pascal''';

const boolJson = {'dart_is_cool': true};
const boolYaml = 'dart_is_cool: true';

const multilineStringJson = {'fold_newlines': 'a b\nc d\n  e\nf'};
const multilineStringYaml = '''
fold_newlines: |
  a b
  c d
    e
  f''';

const complexExampleJson = {
  'name': "Martin D'vloper",
  'job': 'Developer',
  'skill': 'Elite',
  'employed': true,
  'foods': ['Apple', 'Orange', 'Strawberry', 'Mango'],
  'languages': {
    'perl': 'Elite',
    'python': 'Elite',
    'pascal': 'Lame',
  },
  'education': '4 GCSEs\n3 A-Levels\nBSc in the Internet of Things'
};
const complexExampleYaml = '''
name: Martin D'vloper
job: Developer
skill: Elite
employed: true
foods:
  - Apple
  - Orange
  - Strawberry
  - Mango
languages:
  perl: Elite
  python: Elite
  pascal: Lame
education: |
  4 GCSEs
  3 A-Levels
  BSc in the Internet of Things''';

const stringWithDotJson = {'dot': '1.5.0'};
const stringWithDotWithQuotesYaml = 'dot: "1.5.0"';
const stringWithDotWithoutQuotesYaml = 'dot: 1.5.0';

const stringWithSpecialCharactersJson = {'url': 'https://pub.dartlang.org'};
const stringWithSpecialCharactersYaml = 'url: "https://pub.dartlang.org"';
