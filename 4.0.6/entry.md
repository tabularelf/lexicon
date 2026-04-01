# Entry

### `LexiconEntryGetText(key)`

<!-- tabs:start -->

#### **Description**
Returns: `String`, either text or `key`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` | The key you wish to fetch the text from.|

Returns the text that the entry currently has, or the `key` that was passed in if no key is found or `text` is set to `undefined`.

#### **Example**
```gml
text = LexiconEntryGetText("npc.bob.greeting");
```

<!-- tabs:end -->

### `LexiconEntryGetVariations(key)`

<!-- tabs:start -->

#### **Description**
Returns: `Array<String>` or `Undefined`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` | The key you wish to fetch the variations from.|

Returns an array of key string variations or undefined if no variations exist.

#### **Example**
```gml
variations = LexiconEntryGetVariations("npc.bob.buy_fail");
```

<!-- tabs:end -->

### `LexiconEntryGetVariationsCount(key)`

<!-- tabs:start -->

#### **Description**
Returns: `Real`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` | The key you wish to fetch the variations count from.|

Returns the number of variations that exist for the given entry.

#### **Example**
```gml
if (LexiconEntryGetVariationsCount("npc.bob.buy_fail") > 0) {
    variations = LexiconEntryGetVariations("npc.bob.buy_fail");
}
```

<!-- tabs:end -->

### `LexiconEntryHasVariations(key)`

<!-- tabs:start -->

#### **Description**
Returns: `Real`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` | The key you wish to check if the key in question has variations or not.|

Returns whether there are any variations or not for the given key.

#### **Example**
```gml
if (LexiconEntryHasVariations("npc.bob.buy_fail") == false) {
    text = Lexicon("npc.bob_buy_fail");
} else {
    var _variations = LexiconEntryGetVariations("npc.bob.buy_fail");
    text = Lexicon(_variations[ 
        irandom(array_length(_variations)-1)
    ]);
}
```

<!-- tabs:end -->

### `LexiconEntryIsLoaded(key)`

<!-- tabs:start -->

#### **Description**
Returns: `Bool`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `key` | `String` | The key you wish to check if the key in question exists (with text) or not.|

Returns whether there is a valid key with text or not.

#### **Example**
```gml
if (LexiconEntryIsLoaded("npc.bob.greeting") == false) {
    LexiconLanguageSet("English");
}
```

<!-- tabs:end -->