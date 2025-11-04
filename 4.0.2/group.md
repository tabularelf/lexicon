# Group

Lexicon Group is a small class-based group that allows you to fetch & generate text elements by supplying a shortcut to the name.
This is rather convinent when you know the key itself will always start with `multiplayer.game.status`, and you prefer to implicitly refer to it.

### `LexiconGroup(key)`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconGroupClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`subkey`|`String`|The key to store for implicit fetching later.|

Returns a Lexicon group that contains apart of the key. Any text elements fetched directly from the group will implicitly append the key to the start.

#### **Example**
```gml
// Create Event
multi = LexiconGroup("multiplayer.game.status");
start = multi.Get("start");

// Draw Event
draw_text(8, 8, start.Get());
```

<!-- tabs:end -->

`LexiconGroup` only comes with three methods.

### `.ClearStatic()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

Clears the Lexicon group static cache.

#### **Example**
```gml
multi.ClearStatic();
```

<!-- tabs:end -->

### `.Get()`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconTextElementClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`key`|`String`|The key you wish to fetch from the group.|

Returns a Lexicon text element with the specified key, appending the subkey provided to the start when `LexiconGroup()` was called.

#### **Example**
```gml
multi = LexiconGroup("multiplayer.game.status");
start = multi.Get("start"); // "multiplayer.game.status.start"
```

<!-- tabs:end -->

### `.GetStatic()`

<!-- tabs:start -->

#### **Description**
Returns: Instance of `__LexiconTextElementClass`.

|Name|Datatype|Purpose|
|---|---|---|
|`N/A`|||

Returns a static Lexicon text element with the specified key, appending the subkey provided to the start when `LexiconGroup()` was called.

#### **Example**
```gml
// Create Event
multi = LexiconGroup("multiplayer.game.status");


// Draw Event
var start = multi.GetStatic("start"); // "multiplayer.game.status.start"

draw_text(8, 8, start.Get());
```

<!-- tabs:end -->