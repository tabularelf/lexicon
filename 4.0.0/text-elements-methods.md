# Text elements Methods

### `.Get(...)`

<!-- tabs:start -->

#### **Description**
Returns: `String`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `...` |`Any`| Values to replace number templates with, if any exist. |

Returns a string from a Lexicon text element. If any number templates exist and arguments were passed, Lexicon will swap them.

#### **Example**
```gml
// Create Event
text = Lexicon("foo.bar");

// Draw Event
draw_text(8, 8, text.Get());
```

<!-- tabs:end -->

### `.toString()`

<!-- tabs:start -->

#### **Description**
Returns: `String`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Same as `.Get()`, except this is mainly for stringifying a Lexicon text element. This can apply to several of functions, including `draw_text`, `string`, and many more.

#### **Example**
```gml
// Create Event
text = Lexicon("foo.bar");

// Draw Event
draw_text(8, 8, string(text));
```

<!-- tabs:end -->


### `.ToStatic()`

<!-- tabs:start -->

#### **Description**
Returns: `Self`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Forces the text element to be static, until a language change occurs for the entry at hand.

#### **Example**
```gml
text = Lexicon("foo.bar").ToStatic();
```

<!-- tabs:end -->

### `.IsStatic()`

<!-- tabs:start -->

#### **Description**
Returns: `Bool`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Returns whether the text element is static or not.

#### **Example**
```gml
if (text.IsStatic() == false) {
    text.ToStatic();
}
```

<!-- tabs:end -->

### `.Refresh()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Forces the text element to regenerate.

#### **Example**
```gml
text.Refresh();
```

<!-- tabs:end -->

### `.GetKey()`

<!-- tabs:start -->

#### **Description**
Returns: `String`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Returns the text entry key that was passed to the Lexicon text element.

#### **Example**
```gml
key = text.GetKey();
```

<!-- tabs:end -->

### `.Update(...)`

<!-- tabs:start -->

#### **Description**
Returns: `Self`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `...` |`Any`| Values you wish to pass to the Lexicon text element.|
Returns the text entry key that was passed to the Lexicon text element.

#### **Example**
```gml
text.Update("Hello, world!", 42, {
    foo: "bar"
});
```

<!-- tabs:end -->