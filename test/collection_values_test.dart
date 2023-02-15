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

const _stringCollectionJson = [
  'Mark McGwire',
  'Sammy Sosa',
  'Ken Griffey',
];
const _stringCollectionYaml = '''
- Mark McGwire
- Sammy Sosa
- Ken Griffey
''';

const _collectionWithStructureJson = [
  {
    'hr': 65,
    'avg': 0.278,
    'rbi': 147,
  }
];
const _collectionWithStructureYaml = '''
- hr: 65
  avg: 0.278
  rbi: 147
''';

const _structureWithNestedStringCollectionsJson = [
  {
    'type': 'american',
    'values': [
      'Boston Red Sox',
      'Detroit Tigers',
      'New York Yankees',
    ],
  },
  {
    'type': 'national',
    'values': [
      'New York Mets',
      'Chicago Cubs',
      'Atlanta Braves',
    ],
  }
];
const _structureWithNestedStringCollectionsYaml = '''
- type: american
  values:
    - Boston Red Sox
    - Detroit Tigers
    - New York Yankees
- type: national
  values:
    - New York Mets
    - Chicago Cubs
    - Atlanta Braves
''';

const _structureWithNestedStructuresJson = [
  {
    'name': 'Mark McGwire',
    'infomation': {'hr': 65, 'avg': 0.278},
  },
  {
    'name': 'Sammy Sosa',
    'infomation': {'hr': 63, 'avg': 0.288},
  }
];
const _structureWithNestedStructuresYaml = '''
- name: Mark McGwire
  infomation:
    hr: 65
    avg: 0.278
- name: Sammy Sosa
  infomation:
    hr: 63
    avg: 0.288
''';

const _structureWithThreeNestedLevelsJson = [
  {
    'index': 'one',
    'value': {
      'twenty_one': {'thirty_one': 31, 'thirty_two': 32},
      'twenty_two': ['hello', 'world'],
    },
  },
  {
    'index': 'two',
    'value': {
      'twenty_one': 21,
      'twenty_two': {'thirty_one': 31, 'thirty_two': 32},
      'twenty_three': ['hello', 'world'],
    },
  }
];
const _structureWithThreeNestedLevelsYaml = '''
- index: one
  value:
    twenty_one:
      thirty_one: 31
      thirty_two: 32
    twenty_two:
      - hello
      - world
- index: two
  value:
    twenty_one: 21
    twenty_two:
      thirty_one: 31
      thirty_two: 32
    twenty_three:
      - hello
      - world
''';
