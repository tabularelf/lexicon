# Plug-In

### `...AddEntry(key, text, languageInstance)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` or instance of `__LexiconEntryClass` | The key you wish to add text onto. |
| `text` | `String` or `Undefined` | The text you want to apply on. `Undefined` means "no text." |
| `languageInstance` | Instance of `__LexiconLanguageClass` | The language instance you wish to assign the entry. |

Adds the text onto an entry, if the text itself stored in the currenty entry is `undefined`. This will otherwise be implicitly ignored.

!> Text elements will not refresh automatically upon setting the text.

#### **Example**
```gml
var lang = LexiconLanguageGet("en_AU");
LexiconPlugInAddEntry("foo.bar", "Hello, world!", lang);
LexiconPlugInAddEntry("foo.bar", "Goodbye, world!", lang); // No Change
```

<!-- tabs:end -->

### `...AddVariation`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `targetKey`|`String`| The key to add a variation for. |
| `variationKey`|`String`| The key variation to add to the target. |

Adds a key variation to the target key.

#### **Example**
```gml
LexiconPlugInAddVariation("npc.bob.greeting", "Hello {playerName}, welcome to my store!");
LexiconPlugInAddVariation("npc.bob.greeting", "Greetings, how has the weather been {playerName}?");
```

<!-- tabs:end -->

### `...AssertDependencies(plugInName, targetVersion, ...)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `plugInName`|`String`| The name of the plug-in to check. |
| `targetVersion`|`String`| The target version to compare against. |
| `[plugInName]`|`String`| The name of the plug-in to check. |
| `[targetVersion]`|`String`| The target version to compare against. |
| `[]...]` | `String` | Etc. |

Asserts and ensures that the target version roughly matches the current plug-in version.

#### **Example**
```gml
LexiconPlugInDefine("SpacularElf.NoTabs", "SpacularElf", "1.0", "4.0", function() {
    LexiconPlugInAssertDependencies("TabularElf.YesTabs", "1.0");

	LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_UPDATE, undefined, function(_text) {
        return string_replace_all(_text, "  ", " ");
    });
});
```

<!-- tabs:end -->

### `...Define(name, author, version, lexicon_version, init_callback)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `name`|`String`| The name of the plug-in. |
| `author`|`String`| The name of the author. |
| `version`|`String`| The version of the plug-in. (This should be MAJOR.MINOR at minimal) |
| `lexicon_version`|`String`| The version of Lexicon to target towards. (This should be MAJOR.MINOR at minimal) |
| `init_callback`|`Function`| The callback Lexicon should fire when the plug-in is initialised. |

Registers a new plug-in for Lexicon to call.

!> Must be defined in a script with no function Name() {} wrapper around it.

!> `lexicon_version` should be the version you wish to support, not the macro `__LEXICON_VERSION`.

#### **Example**
```gml
LexiconPlugInDefine("SpacularElf.NoTabs", "SpacularElf", "1.0", "4.0", function() {
	LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_UPDATE, undefined, function(_text) {
        return string_replace_all(_text, "  ", " ");
    });
});
```

<!-- tabs:end -->

### `...ExistsEntry(key)`

<!-- tabs:start -->

#### **Description**
Returns: `Bool`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key`| `String` | The entry you wish to check if it exists. |

Returns whether an entry exists or not.

#### **Example**
```gml
var entry = LexiconPlugInGetEntry("foo.bar");
```

<!-- tabs:end -->

### `...ForceLoad()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A`||

Force loads the plugins. This is usually done automatically, after whenever a language is set or after at least the first frame of GameMaker has passed.

!> Can only be called in an object, and not in a script.

#### **Example**
```gml
var entry = LexiconPlugInGetEntry("foo.bar");
```

<!-- tabs:end -->

### `...GetAllEntriesNames([returnValid])`

<!-- tabs:start -->

#### **Description**
Returns: `Array<String>`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `returnValid`|`Bool`|Whether to filter for only valid entries (entries that have text) or not.|

Returns an array of text entries that exist within Lexicon at the time of the call.

!> This is a new array per call.

#### **Example**
```gml
var _entries = LexiconPlugInGetAllEntriesNames();
var _len = array_length(_entries);
for(var _i = 0; _i < _len; _i++) {
    show_debug_message(_entries[_i]);
}
```

<!-- tabs:end -->


### `...GetEntry(key)`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconEntryClass` or `Undefined.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key`| `String`| The entry you wish to fetch. |

Returns an existing entry, or `undefined` if none exists.

#### **Example**
```gml
var entry = LexiconPlugInGetEntry("foo.bar");
```

<!-- tabs:end -->

### `...GetFrame()`

<!-- tabs:start -->

#### **Description**
Returns: `Real`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A`|||

Returns the current frame of the Lexicon plug-in system.

#### **Example**
```gml
var frame = LexiconPlugInGetFrame();
```

<!-- tabs:end -->

### `...RegisterCallback`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `type`|`LexiconCallbackType`| The type of the Lexicon callback. |
| `priority`|`Real`| The priority of the callback. Default is `-1`. |
| `callback`|`Function`| The callback that Lexicon should fire. Default is a `no-op` function. (Takes nothing, does nothing, returns nothing.) |

Registers a new plug-in callback to fire based on several key events. You can find them out where they fire from [here](callback-types.md).

!> Must be defined in a `LexiconPlugInDefine` init_callback.

#### **Example**
```gml
LexiconPlugInDefine("SpacularElf.NoTabs", "SpacularElf", "1.0", "4.0", function() {
	LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_UPDATE, undefined, function(_text) {
        return string_replace_all(_text, "  ", " ");
    });
});
```

<!-- tabs:end -->

### `...RemoveDynamic`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `name`| `String`| Name of dynamic you wish to remove. |

Removes the dynamic from Lexicon. 

!> Text elements will still reference the old callbacks until they are refreshed.

#### **Example**
```gml
LexiconPlugInRemoveDynamic("CONCAT");
```

<!-- tabs:end -->

### `...RemoveVariableModifier`
### `...ResetEntry(key)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` or instance of `__LexiconEntryClass` | The key you wish to reset. |

Resets the text entry to an unused text entry. 

!> This is the equivilant to setting it to `LexiconPlugInSetEntry(key, undefined, null_language)` and therefore relevant callbacks will be fired.

#### **Example**
```gml
LexiconPlugInRestEntry("foo.bar");
```

<!-- tabs:end -->


### `...AreLoaded()`

<!-- tabs:start -->

#### **Description**
Returns: `Bool`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A`|||

Returns whether plug-ins have fully loaded or not.

#### **Example**
```gml
if (LexiconPlugInsAreLoaded() == false) {
    LexiconPlugInForceLoad();
}
```

<!-- tabs:end -->

### `...SetDynamic(name, callback, [static])`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `name`| `String` | The name of the dynamic callback. |
| `callback`| `Function` | The callback the dynamic should fire. |
| `static` | `Bool` | Whether the callback itself is static. Defaults to `false`. |

This defines a new dynamic for Lexicon text elements to be able to parse, and execute callback functionality. Callbacks that are set to be static, will run once and won't do anything until the text element is regenerated.

#### **Example**
```gml
LexiconPlugInSetDynamic("CONCAT", string_concat, true);

LexiconPlugInSetDynamic("UPPER", function(_str) {
    return string_upper(_str);
}, true);

LexiconPlugInSetDynamic("RANDOM_CHAR", function(_str) {
    var _len = string_length(_str);
    var _pos = irandom_range(1, _len);
    return string_char_at(_str, _pos);
});
```

<!-- tabs:end -->

### `...SetEntry(key, text, languageInstance)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` or instance of `__LexiconEntryClass` | The key you wish to add text onto. |
| `text` | `String` or `Undefined` | The text you want to apply on. `Undefined` means "no text." |
| `languageInstance` | Instance of `__LexiconLanguageClass` | The language instance you wish to assign the entry. |

Sets the text onto an entry. If the text is provided with `undefined`, it is considered unloaded.

!> Text elements will not refresh automatically upon setting the text.

#### **Example**
```gml
var lang = LexiconLanguageGet("en_AU");
LexiconPlugInSetEntry("foo.bar", "Hello, world!", lang);
LexiconPlugInSetEntry("foo.bar", "Goodbye, world!", lang); // Replaces the text
```

<!-- tabs:end -->

### `...SetVariableModifier`