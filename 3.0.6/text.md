# Text

### `lexicon_text(textEntry, [value], [...])`

Returns: `String`, or the argument `textEntry` if none was found.

|Name|Datatype|Purpose|
|---|---|---|
|`textEntry`| `String`| The textEntry you want to fetch.|
|`[value]`| `Any`| The text you want to replace, as per the Lexicon template string format `{0-99999}`, or `{name_of_variable}` via structs!|

The bread and butter of the main system. Takes a text entry (a string), such as `dialogue.introduction1`, `dialogue_introduction1`, `dialogueIntroduction1` or any kind of flavour. So long as it's a string, it works.

The additional optional arguments replace `{0-9999}` or `{name_of_variable}` templates with each and every subsequent argument, depending on the value placed. i.e.

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

// Returns the specific string/pointer. Replacing `{0}` and `{1}`.
lexicon_text("dialogue.introduction1", current_time/1000, "This was added in");
```

As mentioned above, the templates can also be a name. These will be referred to by the first struct that appears in the list, matching the corresponding name. i.e.


```gml
// Create
properties = {
    name: "Bob"
};

// Elsewhere

// Returns the specific string/pointer. Replacing any occurances of `{name}` that appear.
lexicon_text("dialogue.introduction1", properties);
```

### `lexicon_text_array(textEntry, array)`

Returns: `String`, or the argument `textEntry` if none was found.

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