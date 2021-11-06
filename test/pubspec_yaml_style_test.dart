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

import 'dart:io';

import 'package:json2yaml/json2yaml.dart';
import 'package:json2yaml/src/json2yaml.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group('json2yaml', () {
    testFormatPreservation(
      'Formats homepage correctly',
      yaml: _homepageYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Separates environment section with empty line',
      yaml: _environmentYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Separates dependencies section with empty line',
      yaml: _dependenciesYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Separates dev_dependencies section with empty line',
      yaml: _devDependenciesYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Separates dependency overrides section with empty line',
      yaml: _depOverridesYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Separates custom section with empty line',
      yaml: _customSectionYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Preserves formatting of custom section with nested arrays',
      yaml: _customSectionWithNestedArraysYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Preserves formatting of a complete example of pubspec.yaml file',
      yaml: _completePubspecYaml,
      yamlStyle: YamlStyle.pubspecYaml,
    );

    testFormatPreservation(
      'Preserves formatting of realistic pubspec.yaml file',
      yaml: File('pubspec.yaml').readAsStringSync(),
      yamlStyle: YamlStyle.pubspecYaml,
    );
  });
}

const _homepageYaml = '''
homepage: https://github.com/alexei-sintotski/json2yaml
''';

const _environmentYaml = '''
name: json2yaml

environment:
  sdk: '>=2.12.0 <3.0.0'
''';

const _dependenciesYaml = '''
name: json2yaml

dependencies:
  meta: ^1.7.0
''';

const _devDependenciesYaml = '''
name: json2yaml

dev_dependencies:
  dependency_validator: ^3.1.0
  test: ^1.19.0
  yaml: ^3.1.0
''';

const _depOverridesYaml = '''
name: my_app

dependency_overrides:
  transmogrify:
    path: ../transmogrify_patch/
''';

const _customSectionYaml = '''
name: my_app

custom_section:
''';

const _customSectionWithNestedArraysYaml = '''
name: my_app

fonts:
  - family: larsseit
    fonts:
      - asset: assets/fonts/larsseit/Larsseit-Bold.ttf
      - asset: assets/fonts/larsseit/Larsseit-Medium.ttf
  - family: roger_icons
    fonts:
      - asset: assets/fonts/roger_icons/RogerIcons.ttf
''';

const _completePubspecYaml = '''
name: newtify
version: 1.2.3
description: |-
  Have you been turned into a newt?  Would you like to be?
  This package can help. It has all of the
  newt-transmogrification functionality you have been looking
  for.
homepage: https://example-pet-store.com/newtify
documentation: https://example-pet-store.com/newtify/docs

environment:
  sdk: '>=2.10.0 <3.0.0'

dependencies:
  efts: ^2.0.4
  transmogrify: ^0.4.0

dev_dependencies:
  test: '>=1.15.0 <2.0.0'
''';
