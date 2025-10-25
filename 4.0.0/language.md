# Language

### `LexiconLanguageExists(language)`

<!-- tabs:start -->

#### **Description**
Returns: `Bool`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language` |`String`| Language or locale to check if it exists. |

Returns whether the specified language or locale exists or not.

#### **Example**
```gml
if (LexiconLanguageExists("en_AU")) {
    LexiconLanguageSet("en_AU");
}
```

<!-- tabs:end -->

### `LexiconLanguageGet(language, [loose])`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconLanguageClass` or `Undefined`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language` |`String`| Language or locale to get. |
| `loose` |`Bool`| Whether Lexicon should attempt a loose search for locales. Default is `false`. |

Returns whether the specified language or locale exists or not.

#### **Example**
```gml
// Game Start
LexiconIndexDeclareLanguage("English", "en");

// Elsewhere
lang = LexiconLanguageGet("en_AU", true);
```

<!-- tabs:end -->

### `LexiconLanguageSet(language, [async])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A``

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language` |`String` or instance of `__LexiconLangueClass`| Language or locale to set as the main language.|
| `async` |`Bool`| Whether Lexicon should load files in asynchronously or not. Default is `false`.|

Sets the main language to the specificed language or locale. If it is the same language as the currently assigned language, Lexicon will ignore it. Setting the language will clear all existing entries and languages, and loads all files from the main language, the fallbacks that the language is assigned and the global fallback itself.

#### **Example**
```gml
// Game Start
LexiconIndexDeclareLanguage("English", "en");
LexiconLanguageSet("en");
// Or
LexiconLanguageSet("English");
```

<!-- tabs:end -->