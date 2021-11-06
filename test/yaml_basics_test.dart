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
      'given a collection of strings',
      json: _stringCollectionJson,
      yaml: _stringCollectionYaml,
    );

    testCase(
      'given a collection with a structure with scalar fields',
      json: _collectionWithStructureJson,
      yaml: _collectionWithStructureYaml,
    );

    testCase(
      'given a structure with nested string collections',
      json: _structureWithNestedStringCollectionsJson,
      yaml: _structureWithNestedStringCollectionsYaml,
    );

    testCase(
      'given a structure with nested structures',
      json: _structureWithNestedStructuresJson,
      yaml: _structureWithNestedStructuresYaml,
    );

    testCase(
      'given a structure with three nested levels',
      json: _structureWithThreeNestedLevelsJson,
      yaml: _structureWithThreeNestedLevelsYaml,
    );
  });
}

const _stringCollectionJson = {
  'collection': [
    'Mark McGwire',
    'Sammy Sosa',
    'Ken Griffey',
  ]
};
const _stringCollectionYaml = '''
collection:
  - Mark McGwire
  - Sammy Sosa
  - Ken Griffey
''';

const _collectionWithStructureJson = {
  'structure': [
    {
      'hr': 65,
      'avg': 0.278,
      'rbi': 147,
    }
  ]
};
const _collectionWithStructureYaml = '''
structure:
  - hr: 65
    avg: 0.278
    rbi: 147
''';

const _structureWithNestedStringCollectionsJson = {
  'american': [
    'Boston Red Sox',
    'Detroit Tigers',
    'New York Yankees',
  ],
  'national': [
    'New York Mets',
    'Chicago Cubs',
    'Atlanta Braves',
  ],
};
const _structureWithNestedStringCollectionsYaml = '''
american:
  - Boston Red Sox
  - Detroit Tigers
  - New York Yankees
national:
  - New York Mets
  - Chicago Cubs
  - Atlanta Braves
''';

const _structureWithNestedStructuresJson = {
  'Mark McGwire': {'hr': 65, 'avg': 0.278},
  'Sammy Sosa': {'hr': 63, 'avg': 0.288},
};
const _structureWithNestedStructuresYaml = '''
Mark McGwire:
  hr: 65
  avg: 0.278
Sammy Sosa:
  hr: 63
  avg: 0.288
''';

const _structureWithThreeNestedLevelsJson = {
  'one': {
    'twenty_one': {'thirty_one': 31, 'thirty_two': 32},
    'twenty_two': ['hello', 'world'],
  },
  'two': {
    'twenty_one': 21,
    'twenty_two': {'thirty_one': 31, 'thirty_two': 32},
    'twenty_three': ['hello', 'world'],
  },
};
const _structureWithThreeNestedLevelsYaml = '''
one:
  twenty_one:
    thirty_one: 31
    thirty_two: 32
  twenty_two:
    - hello
    - world
two:
  twenty_one: 21
  twenty_two:
    thirty_one: 31
    thirty_two: 32
  twenty_three:
    - hello
    - world
''';
