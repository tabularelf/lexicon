# Language/Locale


### `lexicon_index_declare_from_csv(filePath)`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| filePath |`String`| Path to csv file |

This will fetch all language entries from the CSV, auto-declaring them.
If a language/locale already exists, this will instead add the file onto the language/locale.

Example:
```gml
// Fetches all languages/locales from the locale.csv and declares them once.
lexicon_index_declare_from_csv("locale.csv");
```

### `lexicon_index_declare_from_json(filePath)`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| filePath |`String`| Path to csv file |

This will fetch the json file and auto-declare it.
If a language/locale already exists, this will instead add the file onto the language/locale.

Example:
```gml
// Fetches the languages/locale from the locale.json and declares it once.
lexicon_index_declare_from_json("locale.json");
```

### `lexicon_index_declare(language, locale, [fallbackLocale])`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| language |`String`| Language name
| locale |`String`| Locale of language
| [fallbackLocale]| `String`| First part of the locale to look up in the event `locale` cannot be found. Defaults to undefined. (Lexicon will ignore)

This declares a new index entry to Lexicon. Lexicon will use these entries to switch and keep track of file/s for that one language/locale.
You may optionally declare a Fallback Locale. This will be the locale that Lexicon will look for in the event that `lexicon_locale_set` has a somewhat incorrect argument. 

i.e. If you pass in "en-A" in `lexicon_locale_set` instead of "en-AU", Lexicon will look for "en" for a fallback.

Example:
```gml
// Declares "English" and sets the locale to "en-US"
lexicon_index_declare("English", "en-US"); 

// Declares "English" and sets the locale to "en-US". Sets the fallback locale "en" to point towards "en-US".
lexicon_index_declare("English", "en-US", "en"); 
```

### `lexicon_index_add_json`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language/locale`| `String`| language or locale name
| `file_name`| `String`| file path to json file.
| `[is_async]`| `Boolean`| Determines how Lexicon will load in the file. Defaults to `false`.

This adds a json file to the desired language/locale. The `is_async` argument optionally tells Lexicon whether to use asynchronous loading or to load the file. This is intended for cases where asynchronous loading is preferred. Note: Lexicon may briefly show `text_pointers` briefly during asynchronous loading.

(Add `lexicon_async();` to Save/Load event of your *preferably* persistent management object.)


Example:
```gml
// Adds "English.json" to "English" language.
lexicon_index_add_json("English", "English.json"); 

// Adds "English.json" to "en-US" locale.
lexicon_index_add_json("en-US", "English.json"); 

// Adds "English.json" to "English" locale, with asynchronous set to true.
lexicon_index_add_json("English", "English.json", true); 
```

### `lexicon_index_add_csv`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language/locale`| `String`| language or locale name
| `file_name`| `String`| file path to csv file.
| `[is_async]`| `Boolean`| Determines how Lexicon will load in the file. Defaults to `false`.
| `[cell_delimiter]`| `String`| Tells Lexicon to use (Default: `,`) for cell delimiters.
| `[string_delimiter]`| `String`| Tells Lexicon to use (Default: `"`) for string delimiters.

This adds a csv file to the desired language/locale. The `is_async` argument optionally tells Lexicon whether to use asynchronous loading or to load the file. This is intended for cases where asynchronous loading is preferred. Note: Lexicon may briefly show `text_pointers` briefly during asynchronous loading.

(Add `lexicon_async();` to Save/Load event of your *preferably* persistent management object.)

Unlike json files, the csv parser will search through all of the languages/locales to match the right one. This means that multiple indexes can point to one csv file.

Additionally, Lexicon provides options to tell the csv parser how to treat cell/string delimiters. By Default, it is treated as comma-separated.

Example:
```gml
// Adds "locale.csv" to "English" language.
lexicon_index_add_csv("English", "locale.csv"); 

// Adds "locale.csv" to "en-US" locale.
lexicon_index_add_csv("en-US", "locale.csv"); 

// Adds "locale.csv" to "fr-FR" locale. 
lexicon_index_add_csv("fr-FR", "locale.csv"); 

// Adds "locale.csv" to "English" locale, with asynchronous set to true.
lexicon_index_add_json("English", "locale.csv", true); 

// Adds "locale.csv" to "English" locale, with asynchronous set to true and cell/string delimiters set to semicolons (;) and apostrophes (') 
lexicon_index_add_json("English", "locale.csv", true, ";", "'"); 
```

### `lexicon_index_definitions(filename)`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `filename`| `String`| file path to "definitions" json file.

This informs Lexicon to load in a "definitions" json file. The benefit of this is that rather using `lexicon_index_declare` for all of the languages, you can instead use a file to setup all of the languages and the file/s that they will load for each language with arguments. This allows a game to easily support updated translations without having access to the source code to add `lexicon_index_declare` or by incorporating their own file directory search. Letting anyone create new language indexes.

However, due to the nature of the definitions format being very complex to explain here, a separate dedicated page has been made for it.<br>
You can [click here](definitions.md) to find out more!


Example:
```gml
// Loads in the definitions.json, letting Lexicon parse through it and add each and every language.
lexicon_index_definitions("definitions.json"); 
```

### `lexicon_index_fallback_locale_set`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| fallbackLocale| string| Name for fallbackLocale.|
| locale| string| Locale to point to.|

This will set the fallbackLocale to point towards the inserted locale.

Allowing you to specify what locale should Lexicon uses in the event `lexicon_locale_set` cannot find the locale you specified. (i.e. Passing in "en-AUS" when there's only "en-AU")

Example:
```gml
// Sets the fallbackLocale "en" to "en-AU".
lexicon_index_fallback_locale_set("en", "en-AU");
```

### `lexicon_index_fallback_language_set`
| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| language| string| Name for language you want to fallback upon to.|

This will ensure that some language is loaded if either `lexicon_language_set` or `lexicon_locale_set` cannot find any matches.

Example:
```gml
// Sets the language fallback to English.
lexicon_index_fallback_language_set("English");
```