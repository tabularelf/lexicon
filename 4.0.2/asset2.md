# Asset

### `LexiconAssetSet(assetA, assetB, [language])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

|Name|Datatype|Purpose|
|---|---|---|
|`assetA`|`Asset` or `String`|The asset to use as the key|
|`AssetB`|`Asset` or `String`|The asset to use as the value |
|`language`| Instance of `__LexiconLanguageClass` |The language to apply this onto.|

This sets up the asset replacement. i.e. if `spr_game_logo` is `assetA` and `spr_game_logo_jp` is assetB, when calling `LexiconAssetGet("spr_logo_en)`, this will return `spr_logo_jp`.

#### **Example**
```gml
LexiconAssetSet(spr_game_logo, spr_game_logo_jp, "jp");
LexiconAssetSet("spr_company_logo", "spr_company_logo_jp", "jp");
```

<!-- tabs:end -->

### `LexiconAssetGet(assetA, [language])`

<!-- tabs:start -->

#### **Description**
Returns: `Any`.

|Name|Datatype|Purpose|
|---|---|---|
|`asset`|`Asset` or `String`|The asset to use as the key|
|`language`| Instance of `__LexiconLanguageClass` |The language to apply this onto.|

This returns an asset that was set by the current language, using the `asset` as the key, or returns `asset`.

#### **Example**
```gml
sprite_index = LexiconAssetGet(spr_game_logo, "jp");
```

<!-- tabs:end -->