Demonstrating a bug in easy_localization package. Only seems to be an issue on
Windows, works fine on Linux; tested on `windows-2019` GitHub Actions runner and
locally on Windows 11.

- translations/en.json is complete
- translations/de.json is missing 1 key that en has ("completed")

Run generation:

```
dart run easy_localization:generate --source-dir translations --output-dir lib/generated --output-file locale_keys.g.dart --format keys --skip-unnecessary-keys
```

Result:

`lib/generated/locale_keys.g.dart`

Expected: generated file should contain all keys from en.json, languages with
missing translations should use the fallbackLocale (en) value.

Actual: generated file skips keys if they are not present in all languages.

If the missing key is added to de.json, the file is generated correctly.
