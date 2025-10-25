# v3 equivalent 

## Text

|Version 3|Version 4|
|------|------|
|`lexicon_text`|`Lexicon`|
|`lexicon_text_array`|`LexiconExt`|


## General
|Version 3|Version 4|
|------|------|
|`lexicon_get_os_locale`|`LexiconGetOSLocale`|
|`lexicon_text_get_utf8_range`|`Not implemented`|
|`lexicon_text_get_utf8_array`|`Not implemented`|
|`lexicon_async`|`Removed`|
|`lexicon_replace_chr_get`|`Removed`|
|`lexicon_replace_chr_set`|`Removed`|
|`lexicon_get_json_data`|`Removed`|

## Index
|Version 3|Version 4|
|------|------|
|`lexicon_index_declare_from_csv`|`LexiconIndexDeclareFromFile`|
|`lexicon_index_declare_from_json`|`LexiconIndexDeclareFromFile`|
|`lexicon_index_declare`|`LexiconIndexDeclare`|
|`lexicon_index_add_json`|`LexiconIndexAddFile`|
|`lexicon_index_add_csv`|`LexiconIndexAddFile`|
|`lexicon_index_definitions`|`Removed`|
|`lexicon_index_fallback_locale_set`|`LexiconGlobalFallbackSet`|
|`lexicon_index_fallback_language_set`|`LexiconGlobalFallbackSet`|

## Language/Locale
|Version 3|Version 4|
|------|------|
|`lexicon_entry_add`|`LexiconPlugInEntryAdd`|
|`lexicon_entry_exists`|`LexiconPlugInExistsEntry`|
|`lexicon_entry_remove`|`Removed`|
|`lexicon_entry_get_variations`|`LexiconEntryGetVariations`|
|`lexicon_language_exists`|`LexiconLanguageExists`|
|`lexicon_language_get`|`LexiconLanguageGet`|
|`lexicon_language_set`|`LexiconLanguageSet`|
|`lexicon_languages_get_array`|`LexiconLanguageGetAll`|
|`lexicon_locale_exists`|`lexicon_language_exists`|
|`lexicon_locale_get`|`LexiconLanguageGet`|
|`lexicon_locale_set`|`LexiconLanguageSet`|