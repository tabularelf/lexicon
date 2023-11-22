# Text

### `lexicon_text(textEntry, [value], [...])`

Returns: `String`

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`| `String`| The textEntry you want to fetch.|
|`[value]`| `Any`| The text you want to replace, as per the Lexicon template string format `{name}` or `{0-99999}`. If a struct is provided as one of those arguments, then it'll fetch any potential template strings directly.|

The bread and butter of the main system. Takes a text pointer (a string), such as `dialogue.introduction1`, `dialogue_introduction1`, `dialogueIntroduction1` or any kind of flavour. So long as it's a string, it works.

The additional optional arguments replace `{0-9999}` or `{name_of_variable}` with each and every subsequent argument, depending on the value placed. i.e.

This: 
`This is a test string that contains {0} million {name}'s!`

To:
`This is a test string that contains 100 million Bob's!`

Example:<br>
```gml
// Returns the specific string/pointer
lexicon_text("dialogue.introduction1");

// Returns the specific string/pointer. Replacing just `{0}`.
lexicon_text("dialogue.introduction1", current_time/1000);

// Returns the specific string/pointer. Replacing `{0}` and {1}.
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

!> Note: This is now deprecated. Please use `lexicon_text()`!

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