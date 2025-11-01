# Index


### `LexiconIndexDeclareAddFile(filePath, language)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `filepath` |`String`| Path to file. |
| `language` |`String` or instance of `__LexiconLanguageClass`| Language you want to add the file to. |

This will add the file to the specified language. If the language is already loaded in, this will load the file immediately.

#### **Example**
```gml
LexiconDeclareLanguage("English", "en");
LexiconDeclareAddFile("locale.csv", "en");
```

<!-- tabs:end -->

### `LexiconIndexDeclare(language, locale, [fallbacks], [...])`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconLanguageClass`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language` |`String`| Name of the language. |
| `locale`   |`String`| Name of the locale.   |
| `fallback` |`String`| The fallbacks this language should load in whenever it is loaded.|

This will create a new language and locale, if one doesn't exist already. If one does already, it will instead return the language instance.
Any fallbacks provided alongside it will be added alongside with the language. Fallbacks will be loaded along with the language whenever the language is loaded. This is separate from global fallback.

#### **Example**
```gml
LexiconIndexDeclare("English", "en");
```

<!-- tabs:end -->

### `LexiconIndexDeclareFromFile(filePath)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `filepath` |`String`| Path to file. |

This will fetch all language entries from the file, auto-declaring each and every languagethem.
If a language/locale already exists, this will instead add the file onto the language/locale.

#### **Example**
```gml
LexiconDeclareFromFile("locale.csv");
```

<!-- tabs:end -->

### `LexiconIndexLoadFile(filepath, [async], [language])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `filepath` |`String`| Path to a file. i.e. JSON. |
| `async` |`Bool`| Whether to load asynchronously or not. Default is `false`. |
| `language` |`String` or instance of `__LexiconLanguageClass`| Language to assign entries to. i.e. "en". Defaults to `LexiconGetCurrentLanguage()`. |

This will load a file from disk as if it were a file added to a language. If there is no matching parser extension added, Lexicon will output a message into the console and do nothing.

#### **Example**
```gml
var json = @'
{
    "language": "English",
    "locale": "en",
    "text": {
        "foo": "bar",
    },
}
';

LexiconIndexLoadString(json, "json");
```

<!-- tabs:end -->

### `LexiconIndexLoadString(string, extension, [language])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `string` |`String`| String contents of a text file. i.e. JSON. |
| `extension` |`String`| File extension of the parser you wish to use. i.e. JSON |
| `language` |`String` or instance of `__LexiconLanguageClass`| Language to assign entries to. i.e. "en". Defaults to `LexiconGetCurrentLanguage()`. |

This will load the string as if it were a file added to a language. If there is no matching parser extension added, Lexicon will output a message into the console and do nothing.

#### **Example**
```gml
var json = @'
{
    "language": "English",
    "locale": "en",
    "text": {
        "foo": "bar",
    },
}
';

LexiconIndexLoadString(json, "json");
```

<!-- tabs:end -->

### `LexiconIndexLoadBuffer(buffer, extension, [language])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `buffer` |`Buffer`| Bufer contents of a file. i.e. JSON. |
| `extension` |`String`| File extension of the parser you wish to use. i.e. JSON |
| `language` |`String` or instance of `__LexiconLanguageClass`| Language to assign entries to. i.e. "en". Defaults to `LexiconGetCurrentLanguage()`. |

This will load the buffer as if it were a file added to a language. If there is no matching parser extension added, Lexicon will output a message into the console and do nothing.

#### **Example**
```gml
var buff = buffer_load("english.json");
LexiconIndexLoadBuffer(buff, "json");
buffer_delete(buff);
```

<!-- tabs:end -->

### `LexiconIndexLoadBufferExt(buffer, extension, [offset], [length], [language])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `buffer` |`Buffer`| Bufer contents of a file. i.e. JSON. |
| `extension` |`String`| File extension of the parser you wish to use. i.e. JSON |
| `offset` |`real`| The offset of the buffer. Defaults to `0` |
| `length` |`real`| The length of the buffer. Defaults to the size of the buffer |
| `language` |`String` or instance of `__LexiconLanguageClass`| Language to assign entries to. i.e. "en". Defaults to `LexiconGetCurrentLanguage()`. |

This will load the buffer as if it were a file added to a language, but only from the offset to the specified length. If there is no matching parser extension added, Lexicon will output a message into the console and do nothing.

!> The buffer sent to the parser is a copy of the buffer contents.

#### **Example**
```gml
var buff = buffer_load("english.json");
LexiconIndexLoadBufferExt(buff, "json");
buffer_delete(buff);
```

<!-- tabs:end -->

### `LexiconIndexUnloadAll()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`N/A`||

Unloads all text entries.

#### **Example**
```gml
LexiconIndexUnloadAll();
```

<!-- tabs:end -->

### `LexiconIndexUndeclare(language)`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconLanguageClass`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language_or_locale` |`String` or instance of `__LexiconLanguageClass` | Name of the language or locale to unload. |

Removes the language from Lexicon, resetting all known entries under the language.

#### **Example**
```gml
LexiconIndexUndeclare(LexiconLanguageGetCurrent());
LexiconIndexUndeclare("English");
LexiconIndexUndeclare("en");
```

<!-- tabs:end -->