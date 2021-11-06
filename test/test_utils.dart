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

import 'dart:convert';

import 'package:json2yaml/src/json2yaml.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void testFormatting(
  String testCase, {
  required Map<String, dynamic> json,
  required String yaml,
  YamlStyle yamlStyle = YamlStyle.generic,
}) =>
    test(testCase, () {
      final result = json2yaml(json, yamlStyle: yamlStyle);
      expect(result, yaml);
    });

void testFormatPreservation(
  String testCase, {
  required String yaml,
  YamlStyle yamlStyle = YamlStyle.generic,
}) =>
    test(testCase, () {
      final dynamic contentAsYaml = loadYaml(yaml);
      final contentAsJson =
          json.decode(json.encode(contentAsYaml)) as Map<String, dynamic>;
      final result = json2yaml(contentAsJson, yamlStyle: yamlStyle);

      expect(result, yaml);
    });

void testCase(
  String testCase, {
  required Map<String, dynamic> json,
  required String yaml,
  YamlStyle yamlStyle = YamlStyle.generic,
}) =>
    group(testCase, () {
      final result = json2yaml(json, yamlStyle: yamlStyle);
      test('it produces correct YAML', () {
        expect(result, yaml);
      });
      test('it preserves JSON structure', () {
        expect(loadAsJson(result), json);
      });
    });

dynamic loadAsJson(String result) => json.decode(json.encode(loadYaml(result)));
