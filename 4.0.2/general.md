# General

### `Lexicon(entry, [...])`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconTextElementClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`entry`|`String`|The entry you wish to refer to.|
|`...`|`Any`|The value/s you wish to pass to the Lexicon text element instance.|

This function returns a Lexicon Text Element Class instance. This instance will contain info about the entry provided, and the arguments (if any) that were provided. Whether the text entry has any text or not, Lexicon will treat it as if it does.
If the text entry does not exist, Lexicon will generate it as a new entry that is not set, and refer to the key as static text. These text elements are dynamic in nature, in which they can be used to fetch the same text repeatedly. If the text entry language has changed, these text elements will update.
You can see how Lexicon text elements work [here](text-elements.md).

#### **Example**
```gml
/// Create Event
prices = {
    applePrice: 4,
    orangePrice: 4,
    bananaPrice: 7,
    grapesPrice: 10,
};

playerData = {
     playerName: "Alice",
    money: 6,
}

text = Lexicon("npc.bob.prices", prices, playerData);

/// Draw Event
draw_text(8, 8, text.Get());
```

<!-- tabs:end -->

### `LexiconExt(entry, array, [offset], [length])`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconTextElementClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`entry`|`String`|The entry you wish to refer to.|
|`array`|`Array<Any>`|The array of values you wish to pass to the Lexicon text element instance.|
|`offset`|`Real`|The offset of the array to copy from. Defaults to `0`.|
|`length`|`Real`|The length of the array to copy to. Defaults to the length of the array.|

This function returns a Lexicon Text Element Class instance. This instance will contain info about the entry provided, and the arguments (if any) that were provided in the array. Whether the text entry has any text or not, Lexicon will treat it as if it does.
If the text entry does not exist, Lexicon will store the text entry itself. These text elements are dynamic in nature, in which they can be used to fetch the same text repeatedly. If the text entry language has changed, these text elements will update.
You can see how Lexicon text elements work [here](text-elements.md).

#### **Example**
```gml
/// Create Event
data = [ 
    {
        applePrice: 4,
        orangePrice: 4,
        bananaPrice: 7,
        grapesPrice: 10,
    },
    {
        playerName: "Alice",
        money: 6,
    }
];

text = LexiconExt("npc.bob.prices", data);

/// Draw Event
draw_text(8, 8, text.Get());
```

<!-- tabs:end -->

### `LexiconParse(string, [...])`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconTextElementClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`string`|`String`|The string you wish to parse.|
|`...`|`Any`|The value/s you wish to pass to the Lexicon text element instance.|

Just like it's `Lexicon()` counterpart, this function returns a Lexicon Text Element Class instance. Except the string itself is treated as if it's a valid entry. This text element will contain a dummy entry, that is not accessible by normal means. (This is not fetchable via the entries database and is considered unique). You can see how Lexicon text elements work [here](text-elements.md).

#### **Example**
```gml
/// Create Event
prices = {
    applePrice: 4,
    orangePrice: 4,
    bananaPrice: 7,
    grapesPrice: 10,
};

playerData = {
    playerName: "Alice",
    money: 6,
}

text = LexiconParse("Hello there {playerName}, would you like an apple at {applePrice, currency}?", prices, playerData);

/// Draw Event
draw_text(8, 8, text.Get());
```

<!-- tabs:end -->

### `LexiconParseExt(string, array, [offset], [length])`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconTextElementClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`string`|`String`|The string you wish to parse.|
|`array`|`Array<Any>`|The array of values you wish to pass to the Lexicon text element instance.|
|`offset`|`Real`|The offset of the array to copy from. Defaults to `0`.|
|`length`|`Real`|The length of the array to copy to. Defaults to the length of the array.|

Just like it's `LexiconExt()` counterpart, this function returns a Lexicon Text Element Class instance. Except the string itself is treated as if it's a valid entry. This text element will contain a dummy entry, that is not accessible by normal means. (This is not fetchable via the entries database and is considered unique). You can see how Lexicon text elements work [here](text-elements.md).

#### **Example**
```gml
/// Create Event
data = [ 
    {
        applePrice: 4,
        orangePrice: 4,
        bananaPrice: 7,
        grapesPrice: 10,
    },
    {
        playerName: "Alice",
        money: 6,
    }
];

text = LexiconParseExt("Hello there {playerName}, would you like an apple at {applePrice, currency}?", data);

/// Draw Event
draw_text(8, 8, text.Get());
```

<!-- tabs:end -->

### `LexiconGetOSLocale()`

<!-- tabs:start -->

#### **Description**
Returns: `String`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`N/A`||

Returns the current locale of the operating system, if it can be derived. The format may appear as `en_AU`, or `en` if the region cannot be found.

#### **Example**
```gml
LexiconLanguageSet(LexiconGetOSLocale(), true);
```

<!-- tabs:end -->

### `LexiconIsLanguage(value)`

<!-- tabs:start -->

#### **Description**
Returns: `String`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`value`|`Any`|The value to check for a valid language.|

Returns whether this is a valid instance of a Lexicon Language class or not.

#### **Example**
```gml
// Create Event
lang = undefined;

// Step
if (LexiconIsLanguaage(lang)) {
    LexiconLanguageSet(lang);
}
```

<!-- tabs:end -->

### `LexiconIsTextElement(value)`

<!-- tabs:start -->

#### **Description**
Returns: `String`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`value`|`Any`|The value to check for a valid text element.|

Returns whether this is a valid instance of a Lexicon text element class or not.

#### **Example**
```gml
// Create Event
text = undefined;

// Draw
if (LexiconIsTextElement(text)) {
    draw_text(8, 8, text.Get());
}
```

<!-- tabs:end -->

### `LexiconIsEntry(value)`

<!-- tabs:start -->

#### **Description**
Returns: `String`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`value`|`Any`|The value to check for a valid entry instance.|

Returns whether this is a valid instance of a Lexicon text entry class or not.

#### **Example**
```gml
// Create Event
entry = LexiconPlugInGetEntry("foo.bar");

// Draw
if (LexiconIsEntry(text)) {
    draw_text(8, 8, entry.GetText());
}
```

<!-- tabs:end -->