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

import 'package:meta/meta.dart';

/// Yaml formatting control options
enum YamlStyle {
  /// Default formatting style applicable in most cases
  generic,

  /// YAML formatting style following pubspec.yaml formatting conventions
  pubspecYaml,

  /// YAML formatting style following pubspec.lock formatting conventions
  pubspecLock,
}

/// Converts JSON to YAML representation
String json2yaml(
  Object? json, {
  YamlStyle yamlStyle = YamlStyle.generic,
}) =>
    _separatePubspecYamlSections(
      _condense(_formatObject(
          value: json,
          context: _Context(
            yamlStyle: yamlStyle,
            nesting: 0,
          ))),
      yamlStyle,
    );

String _formatObject({
  required dynamic value,
  required _Context context,
}) {
  if (value is Map) {
    return _formatStructure(
      structure: value as Map<String, dynamic>,
      context: context,
    );
  } else if (value is Iterable) {
    return _formatCollection(
      collection: value,
      context: context,
    );
  } else if (value is String) {
    return _isMultilineString(value)
        ? _formatMultilineString(value, context)
        : _formatSingleLineString(value, context);
  } else if (value == null) {
    return '';
  } else {
    return '$value';
  }
}

String _formatStructure({
  required Map<String, dynamic> structure,
  required _Context context,
}) {
  String separator_(MapEntry<String, dynamic> e) =>
      e.value is Map ? '\n${_indentation(context.nest())}' : ' ';

  if (structure.isEmpty) {
    return '';
  }
  final entries = structure.entries;
  final firstElement = entries.first;
  final first = '${firstElement.key}:${separator_(firstElement)}${_formatObject(
    value: firstElement.value,
    context: context.nest(),
  )}\n';
  final rest = entries
      .skip(1)
      .map((e) => '${_indentation(context)}${e.key}:${separator_(e)}'
          '${_formatObject(value: e.value, context: context.nest())}')
      .join('\n');
  return '$first$rest';
}

String _formatCollection({
  required Iterable<dynamic> collection,
  required _Context context,
}) {
  if (collection.isEmpty) {
    return '';
  }
  return '\n${collection.map((dynamic e) => '${_indentation(context)}- '
      '${_formatObject(
        value: e,
        context: context.nest(),
      )}').join('\n')}\n';
}

String _condense(String yaml) => _endWithEol(
      yaml
          .split('\n')
          .map((s) => s.trimRight())
          .where((s) => s.isNotEmpty)
          .join('\n'),
    );

String _endWithEol(String s) => '$s\n';

String _separatePubspecYamlSections(String yaml, YamlStyle yamlStyle) =>
    yamlStyle == YamlStyle.pubspecYaml
        ? yaml
            .split('\n')
            .map((s) => _shouldPubspecYamlLineBeSeparated(s) ? '\n$s' : s)
            .join('\n')
        : yaml;

bool _shouldPubspecYamlLineBeSeparated(String yamlLine) =>
    yamlLine.isNotEmpty &&
    !_startsOfPubspecYamlLinesKeptTogether.any((s) => yamlLine.startsWith(s));

@immutable
class _Context {
  const _Context({
    required this.yamlStyle,
    required this.nesting,
  });

  final YamlStyle yamlStyle;
  final int nesting;

  _Context nest() => _Context(
        yamlStyle: yamlStyle,
        nesting: nesting + 1,
      );
}

const _spacesPerNestingLevel = 2;
String _indentation(_Context ctx) => ''.padLeft(
      ctx.nesting * _spacesPerNestingLevel,
    );

bool _isMultilineString(String value) => value.trim().contains('\n');

String _formatMultilineString(String value, _Context ctx) =>
    '|${_chompModifier(value)}\n'
    '${_indentMultilineString(value, _indentation(ctx))}';

String _chompModifier(String value) => value.endsWith('\n') ? '' : '-';

String _indentMultilineString(String value, String indentation) =>
    value.split('\n').map((s) => '$indentation$s').join('\n');

String _formatSingleLineString(String value, _Context ctx) =>
    _requiresQuotes(value, ctx.yamlStyle)
        ? '${_quote[ctx.yamlStyle]}$value${_quote[ctx.yamlStyle]}'
        : value;

bool _requiresQuotes(String s, YamlStyle yamlStyle) =>
    _isNumeric(s) ||
    _isBoolean(s) ||
    _containsSpecialCharacters(s) ||
    (yamlStyle == YamlStyle.pubspecLock &&
        (s.contains('.') ||
            s.contains(' ') ||
            s.contains('/') ||
            s.startsWith(RegExp('[0-9]'))));

bool _isNumeric(String s) => s.isNotEmpty && num.tryParse(s) != null;

bool _isBoolean(String s) => _booleanValues.contains(s);

bool _containsSpecialCharacters(String s) =>
    _specialCharacters.any((c) => s.contains(c));

const _specialCharacters = {
  ': ', // Indicates mapping in YAML
  '[',
  ']',
  '{',
  '}',
  '>',
  '!',
  '*',
  '&',
  '|',
  '%',
  ' #', // Indicates comment in YAML
  '`',
  '@',
  ',',
  '?',
};

const _booleanValues = {
  '${true}',
  '${false}',
};

const _startsOfPubspecYamlLinesKeptTogether = [
  ' ',
  '#',
  'name:',
  'homepage:',
  'version',
  'description:',
  'documentation:',
  'repository:',
  'issue_tracker:',
  'executables:',
  'author:',
  'authors:',
  'publish_to:',
];

const _quote = {
  YamlStyle.generic: '"',
  YamlStyle.pubspecLock: '"',
  YamlStyle.pubspecYaml: "'",
};
