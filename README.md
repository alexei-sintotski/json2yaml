# json2yaml [![Build Status](https://travis-ci.com/alexei-sintotski/json2yaml.svg?branch=master)](https://travis-ci.com/alexei-sintotski/json2yaml) [![codecov](https://codecov.io/gh/alexei-sintotski/json2yaml/branch/master/graph/badge.svg)](https://codecov.io/gh/alexei-sintotski/json2yaml) [![pubspec_lock version](https://img.shields.io/pub/v/json2yaml?label=json2yaml)](https://pub.dev/packages/json2yaml)
Dart package to render JSON data to YAML

## json2yaml()

json2yaml is the function to format JSON data to YAML.

```
  const developerData = {
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

  print(json2yaml(developerData));
```

This function is implemented in a very basic and perhaps naive way, please let me know if it does not work for you.

## Usage

To use json2yaml, add the following dependency to pubspec.yaml:

```
dependencies:
  json2yaml: ^2.0.0
```

## Advanced usage: YAML formatting styles

json2yaml supports the optional argument to customize YAML formatting for various use cases.
At the moment, it supports the three following formatting styles:
- YamlStyle.generic (default) -- Default formatting style applicable in most cases
- YamlStyle.pubspecYaml -- YAML formatting style following pubspec.yaml formatting conventions
- YamlStyle.pubspecLock -- YAML formatting style following pubspec.lock formatting conventions

YAML style is supplied as an optional argument to json2yaml():

```
/// Yaml formatting control options
enum YamlStyle {
  generic,
  pubspecYaml,
  pubspecLock,
}

/// Converts JSON to YAML representation
String json2yaml(
  Map<String, dynamic> json, {
  YamlStyle yamlStyle = YamlStyle.generic,
});
```
