# Font

### `LexiconFontSet(fontDir, font, language)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

|Name|Datatype|Purpose|
|---|---|---|
|`fontDir`|`String`|The font directory to set|
|`font`|`Asset.GMFont`|The font asset to set|
|`language`| Instance of `__LexiconLanguageClass` |The language to set the font onto|

This sets the font asset to the specified font directory for the specified language.

#### **Example**
```gml
LexiconFontSet("default", fnt_japanese, LexiconLanguageGet("Japanese"));
```

<!-- tabs:end -->

### `LexiconFontGet(fontDir, [searchCallback], [searchAllFontsIfFailed], [language])`

<!-- tabs:start -->

#### **Description**
Returns: `Asset.GMFont`.

|Name|Datatype|Purpose|
|---|---|---|
|`fontDir`|`String`|The font directory to set|
|`searchCallback`|`Function`|The callback to use to find a specific font. Defaults to `undefined`.|
|`searchAllFontsIfFailed`|`Bool`|Whether to search all fonts with the callback, if the initial font directory search fails. Defaults to `false`.|
|`language`| Instance of `__LexiconLanguageClass` |The language to set the font onto. Defaults to `LexiconLanguageGetCurrent()`|

This fetches the font from the specified font directory. If the initial look up doesn't exist, Lexicon will use the `searchCallback` (if any) to look up all of the font directories for the set language to find a language.
If that fails, if `searchAllFontsIfFailed` is set to `true` and there's a valid `searchCallback`, it will use that. Otherwise if that is `false`, `searchCallback` is not a valid callback or that fails, and `__LEXICON_ENABLE_APPROXIMATE_FONT_SEARCH` is set to `true`, Lexicon will find the closest possible font available, based on all of the total combined entries in the game, even if the font result is not entirely accurate. The font found will be stored internally as a font cache until it is reset by either `LexiconFontCacheFlush()` or a new language is specified. Otherwise, it will return the `__LEXICON_DEFAULT_FONT`.

The `searchCallback` passed arguments are the same as [`array_find_index`](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Variable_Functions/array_find_index.htm).

#### **Example**
```gml
draw_set_font(LexiconFontGet("default"));
```

<!-- tabs:end -->

### `LexiconFontCacheFlush()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

Flushes the font cache that `LexiconFontGet()` stores.

#### **Example**
```gml
LexiconFontCacheFlush();
```

<!-- tabs:end -->