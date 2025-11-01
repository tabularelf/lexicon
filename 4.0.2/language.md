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

Sets the main language to the specificed language or locale. If it is the same language as the currently assigned language, Lexicon will ignore it. Setting the language will clear all existing entries and languages, and loads all files from the main language, the fallbacks that the language is assigned and the global fallback itself. If the currently assigned language is the same as the new language, nothing will happen.

#### **Example**
```gml
// Game Start
LexiconIndexDeclareLanguage("English", "en");
LexiconLanguageSet("en");
// Or
LexiconLanguageSet("English");
```

<!-- tabs:end -->

### `LexiconLanguageGetCurrent()`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconLanguageClass` or a null language instance.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A`|||

Returns the currently loaded language, or a null language if none is loaded.

!> Null language is treated as "not a real language" and will return `false` on `LexiconIsLanguage()`. (All of their methods but `.GetLocale()` and `.GetLanguage()` will throw an exception.)

#### **Example**
```gml
var lang = LexiconLanguageGetCurrent();
```

<!-- tabs:end -->

### `LexiconLanguageGetAll()`

<!-- tabs:start -->

#### **Description**
Returns: Array of `__LexiconLanguageClass`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A`|||

Returns an array of all languages.

#### **Example**
```gml
var langs = LexiconLanguageGetAll();
```

<!-- tabs:end -->

### `LexiconLanguageGetLoaded()`

<!-- tabs:start -->

#### **Description**
Returns: Array of `__LexiconLanguageClass`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A`|||

Returns an array of all languages that are currently loaded by Lexicon.

#### **Example**
```gml
var langs = LexiconLanguageGetLoaded();
```

<!-- tabs:end -->

### `LexiconLanguageIsLoaded([language])`

<!-- tabs:start -->

#### **Description**
Returns: `Bool`

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `Language`|`String` or instance of `__LexiconLanguageClass`| The language to check if it's loaded. Defaults to the current main language.|

Returns whether the language is loaded ir not.

#### **Example**
```gml
if (LexiconLanguageIsLoaded()) {
    show_debug_message("Loaded!");
}
```

<!-- tabs:end -->

### `LexiconLanguageReload([async])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `async`|`Bool`|Whether to load files asynchronously or not.|

Reloads the current main language. 

!> This is similar to `LexiconLanguageSet()`, except the safeguards for assigning the same language is ignored.

#### **Example**
```gml
LexiconLanguageReload();
```

<!-- tabs:end -->