# Language/Locale


### `LexiconIndexDeclareAddFile(filePath, language)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| filePath |`String`| Path to file. |
| language |`String` or instance of `__LexiconLanguageClass`| Language you want to add the file to. |

This will add the file to the specified language. If the language in question is already loaded in, this will load the file immediately.

#### **Example**
```gml
LexiconDeclareLanguage("English", "en");
LexiconDeclareAddFile("locale.csv", "en");
```

### `LexiconIndexDeclare(language, locale, fallbacks, ...)`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconLanguageClass`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| language |`String`| Name of the language. |
| locale   |`String`| Name of the locale.   |
| fallback |`String`| The fallbacks this language should load in whenever it is loaded.|

This will create a new language and locale, if one doesn't exist already. If one does already, it will instead return the language instance.
Any fallbacks provided alongside it will be added alongside with the language. Fallbacks will be loaded along with the language whenever the language is loaded. This is separate from global fallback.

#### **Example**
```gml
LexiconIndexDeclare("English", "en");
```

<!-- tabs:end -->

<!-- tabs:end -->

### `LexiconIndexDeclareFromFile(filePath)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| filePath |`String`| Path to file. |

This will fetch all language entries from the file, auto-declaring each and every languagethem.
If a language/locale already exists, this will instead add the file onto the language/locale.

#### **Example**
```gml
LexiconDeclareFromFile("locale.csv");
```

<!-- tabs:end -->
