# Text

### `lexicon_text(textEntry, [substring], [...])`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`| `String`| The textEntry you want to fetch.|
|`[substring]`| `String/Real`| The text you want to replace, as per the Lexicon replace chr (default is `%s`).|

The bread and butter of the main system. Takes a text pointer (a string), such as `text.introduction1`, `text_introduction1`, `textIntroduction1` or any kind of flavour. So long as it's a string, it works.

The additional optional arguments replace `%s` with each and every subsequent argument. i.e.

This: 
`This is a test string that contains %s million!`

To:
`This is a test string that contains 100 million!`

Example:<br>
```gml
// Returns the specific string/pointer
lexicon_text("dialogue.introduction1");

// Returns the specific string/pointer. Replacing a single `%s`.
lexicon_text("dialogue.introduction1", current_time/1000);

// Returns the specific string/pointer. Replacing two+ `%s`.
lexicon_text("dialogue.introduction1", current_time/1000, "This was added in");
```

### `lexicon_text_array(textEntry, array)`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`| `String`| The textEntry you want to fetch.|
|`array`| `Array`| Array of substrings you'd want to replace, as per the Lexicon replace chr (default is `%s`).|

The same as `lexicon_text`, but takes in an array for multiple replace characters.

Example:<br>
```gml
// Returns the specific string/pointer with array entries replacing the replace character.
var _array = [current_time/1000, fps, fps_real];
lexicon_text_array("dialogue.introduction1", array);
```

### `lexicon_text_struct(textEntry, struct)`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`| `String`| The textEntry you want to fetch.|
|`[struct]`| `String/Real`| The struct you want to replace strings with, as per the Lexicon replace struct chr (Default is `["%", "%"]`).|

A special variation of `lexicon_text`, that uses a struct in its place. It doesn't use the replace characters, but rather follows a very unique format. 
New to v1.1.0 of Lexicon. All replace characters are instead variable names. i.e. `%variable_name%`

Example:<br>
```gml
// Returns the specific string/pointer, with struct modifiers
var _struct = {playerName: "TabulerElf"};
lexicon_text_struct("dialogue.introduction1", _struct);
```
