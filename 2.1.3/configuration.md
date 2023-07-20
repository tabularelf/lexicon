# Lexicon Configuration

|Name|<nobr>Default Value</nobr>|Purpose|
|---|---|---|
|`LEXICON_DEBUG`|`false`|Enables Lexicons debugging (outputs specific errors or extra info to console).|
|`LEXICON_USE_FIRST_ENTRY_ADDED`|`false`|Uses the first entry added automatically.|
|`LEXICON_ROW_SEPERATOR`|`"------------------"`|Tells Lexicon which rows in a CSV format are row separators and ignores them.|
|`LEXICON_USE_CACHE`|`true`|Uses the cache system. Searching for strings that match the same arguments as they were called.|
|`LEXICON_AUTO_GC_CACHE`|`true`|Whether to automatically run the cache garbage collection system or not.|
|`LEXICON_USE_ADVANCE_CACHE`|`true`|Used for `lexicon_text_struct()`. Whether to include caching changing structs. Setting deprecated.|
|`LEXICON_CACHE_TIMEOUT`|`4000`|How long before it gets removed from the cache system, in milliseconds.|
|`LEXICON_CACHE_ARG_THRESHOLD`|`2`|How many arguments before it starts caching. This doesn't apply to `lexicon_text_struct()`.|
|`LEXICON_GC_NEXT_TICK`|`60`|Controller to ensure that the cache garbage collector triggers only when necessary. |
|`LEXICON_STRUCT_REPLACE_CHR_SYMBOLS`|`["%", "%"]`|Tells Lexicon what characters are used to determine a variable with `lexicon_text_struct()`. In previous versions it was `{{ }}` by default.|
|`LEXICON_TEXT_JSON_BREAK`|`"."`|Tells Lexicon what character it should return for when a struct is defined within one of the text entries. i.e. `"generic": {"foo": "bar"}` would become `"generic.foo"`.|
|`LEXICON_REPLACE_ENTRIES`|`false`|Tells Lexicon that it can replace duplicate entries with new ones.|
|`LEXICON_FORECE_LOAD_FALLBACK_LANGUAGE`|`false`|Tells Lexicon to include the fallback language as well when switching languages.|