# General

### `lexicon_async()`

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This is only needed in the `Async - Save/Load` event for localization that is loaded in asynchronously.

### `lexicon_flush_cache()`

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This will flush Lexicon's internal cache system for text entries that have had their replacement characters replaced. 

### `lexicon_get_os_locale()`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

Returns the current OS language and region code, as per [`os_get_language()`](https://manual-en.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FOS_And_Compiler%2Fos_get_language.htm) and [`os_get_region()`](https://manual-en.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FOS_And_Compiler%2Fos_get_region.htm). i.e. `"en-US"`.<br>
If the region doesn't exist, it'll only return `os_get_language()`.

### `lexicon_replace_chr_get()`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This will get the replace character (default: `%s`) to whatever you desire.

### `lexicon_replace_chr_set(chr)`

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This will set the replace character (default: `%s`).