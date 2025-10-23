# General

### `Lexicon(entry, [...])`

Returns: Instance of `__LexiconTextElementClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`entry`|`String`|The entry you wish to refer to.|
|`...`|`Any`|The value/s you wish to pass to the Lexicon text element instance.|

This function returns a Lexicon Text Element Class instance. This instance will contain info about the entry provided, and the arguments (if any) that were provided. Whether the text entry has any text or not, Lexicon will treat it as if it does.
If the text entry does not exist, Lexicon will store the text entry itself. These text elements are dynamic in nature, in which they can be used to fetch the same text repeatedly. If the text entry language has changed, these text elements will update.
You can see how Lexicon text elements work [here](text-elements.md).

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

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

This will get the replace character (default: `%s`) to whatever you desire.

### `lexicon_replace_chr_set(chr)`

Returns: `N/A`

|Name|Datatype|Purpose|
|---|---|---|
|`String`|||

This will set the replace character (default: `%s`).

### `lexicon_dynamic_define(name, callback, [updateCache])`

Returns: `N/A`.

|Name|Datatype|Purpose|
|---|---|---|
|`name`|`String`|The name of the dynamic callback.|
|`callback`|`Function`|The function callback you wish to use.|
|`updateCache`|`Boolean`|Whether any Lexicon text caches should be updated every time `lexicon_text` or `lexicon_text_array` is called for that specific text entry. The default is `true`.|

Assigns a dynamic callback to all future `lexicon_text` and `lexicon_text_array` calls, via the template selection. Allowing you to define and replace text on the fly. A good example is having a text entry as `npc.bob.greeting`, with the text being `"Hello there, {Player}!"`. 
```gml
// Script
function GetPlayerName() {
    return global.playerName;
}

global.playerName = "Alice";
lexicon_dynamic_define("Player", GetPlayerName);

// Draw Event
var text = lexicon_text("npc.bob.greeting");
draw_text(8, 8, text); // Renders "Hello there, Alice!"
```

### `lexicon_text_get_utf8_range(string)`

Returns: `Struct`, or `undefined`.

|Name|Datatype|Purpose|
|---|---|---|
|`String`|`String`|The string of characters you wish to fetch.|

Returns a struct with the keys `min` and `max`, for the exact font range. If the string is empty, it will return `undefined`.

### `lexicon_text_get_utf8_array(string)`

Returns: `Array` of `Reals`, or `undefined`.

|Name|Datatype|Purpose|
|---|---|---|
|`String`|`String`|The string of characters you wish to fetch.|

Returns an array of reals, making up every single character. If the string is empty, it will return `undefined`.

### `lexicon_get_json_data()`

Returns: `Struct` or `undefined`, if the loaded file isn't json.

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`||

Returns the struct that Lexicon parses from JSON, minus `language`, `locale` and `text`.