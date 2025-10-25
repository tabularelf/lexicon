# Global

### `LexiconGlobalSet(key, value)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` | The name of the variable you wish to set.|
| `value` |`Any`| The value you wish to set.|

Sets the key within the Lexicon global struct, to be referenced by text elements later. Lexicon text elements will use the value set to determine if the string cache needs to be updated per Lexicon text element.
Additionally, any instances of `__LexiconTextElementClass` that are stored here, will automatically call their `.Get()` methods. 

#### **Example**
```gml
LexiconGlobalSet("amount", 42);
LexiconGlobalSet("item", Lexicon("item.apple.name"));
text = Lexicon("npc.alice.item_interest");
```

<!-- tabs:end -->

### `LexiconGlobalGet()`

<!-- tabs:start -->

#### **Description**
Returns: `Any`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` |`String`|The key you wish to look up and return the currently set value from. |

Returns the value set in the current Lexicon global struct. If there is no existing key, this function will return `undefined`.

#### **Example**
```gml
amount = LexiconGlobalGet("amount");
```

<!-- tabs:end -->

### `LexiconGlobalStructGet()`

<!-- tabs:start -->

#### **Description**
Returns: `Struct`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Returns the current Lexicon global struct.

#### **Example**
```gml
var _global = LexiconGlobalStructGet();
_global.amount = 42;
_global.item = Lexicon("item.apple.name");
```

<!-- tabs:end -->

### `LexiconGlobalStructSet()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `Struct` |`Struct`|The struct you wish to swap as the main Lexicon global struct.|

Sets a new Lexicon global struct.

!> Existing text elements may need to be refreshed as Lexicon text elements are not made fully aware that the global struct has changed, and may refer to the old Lexicon global struct.

#### **Example**
```gml
var _global = {
    item: Lexicon("item.apple.name"),
    amount: 42,
    prices: {
        apples: 4,
        oranges: 4,
        tomatoes: 5,
        grapes: 10,
        bananas: 8,
    },
};

LexiconGlobalStructSet(_global);
```

<!-- tabs:end -->

### `LexiconGlobalFallbackSet(language)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `language` | `String` or `Undefined` | The language or locale you wish to set as the fallback. |

Sets the global fallback that all languages will load in on the next `LexiconLanguageSet()` call.

#### **Example**
```gml
LexiconGlobalFallbackSet("en");
```

<!-- tabs:end -->

### `LexiconGlobalFallbackGet()`

<!-- tabs:start -->

#### **Description**
Returns: `String` or `Undefined`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Returns the currently set global fallback that all languages will load in on the next `LexiconLanguageSet()` call.

#### **Example**
```gml
fallback = LexiconGlobalFallbackGet("amount");
```

<!-- tabs:end -->