# Language/Locale

### `lexicon_entry_add(textEntry, string)`

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`|`String`|Name of text entry.|
|`string`| `String` |Contents of text entry.|

Used for Lexicon mostly. Allows you to add text entries to the current language/locale.

### `lexicon_entry_remove(textEntry)`

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`|`String`|Name of text entry.|

Allows you to remove a text entry from the current language/locale.

### `lexicon_entry_exists(textEntry)`

Returns: `Boolean`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`|`String`|Name of text entry.|

Checks whether a particular text entry exists or not.

Returns: `Boolean`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`|`String`|Name of text entry.|

Checks whether a particular text entry exists or not.

### `lexicon_language_exists(language)`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This will check to see if a specific language exists.

### `lexicon_language_get()`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This will return the current language.

### `lexicon_language_set(language)`

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This will change the language (and locale) to either an existing language or `unknown` if a fallback couldn't be found.

### `lexicon_languages_get_array()`

Returns: `Array`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`| `String`| The textEntry you want to fetch.|
|`[substring]`| `String/Real`| The text you want to replace, as per the Lexicon replace chr (default is `%s`).|

This will get all of the locales/languages in a 2D array stored as:<br>
```
[index][0] = language;
[index][1] = locale;
```

### `lexicon_locale_exists(locale)`

Returns: `Boolean`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`| `String`| The textEntry you want to fetch.|
|`array`| `Array`| Array of substrings you'd want to replace, as per the Lexicon replace chr (default is `%s`).|

This will check to see if a specific locale exists.

### `lexicon_locale_get()`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

Returns the currently set locale.

### `lexicon_locale_set(locale)`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`locale`| `String`| The locale you'd like to change to.|

This will change the locale (and language) to either an existing locale or `unknown` if a fallback couldn't be found.