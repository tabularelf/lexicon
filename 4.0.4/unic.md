# Unic-Specific 
Lexicon inclues the [Unic library](https://github.com/tabularelf/Unic), a library aimed at providing with a bunch of how text should be handled in all languages around the world. Including formatting, 

### `LexiconUnicAutoLocaleGet()`

<!-- tabs:start -->

#### **Description**
Returns: `Bool`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`N/A`||

Returns whether Lexicon handles automatic locale selection or not.

#### **Example**
```gml
if (LexiconUnicAutoLocaleGet() == false) {
    UnicSetLocale("en_AU");
}
```


<!-- tabs:end -->

### `LexiconUnicAutoLocaleSet()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`value`|`Bool`|Whether it should auto set the locale for Unic on the next language change.|

Sets whether Lexicon should auto set the locale for Unic on the next language change.

#### **Example**
```gml
LexiconUnicAutoLocaleSet(false);
```


<!-- tabs:end -->

### `LexiconUnicDatetimeGet()`

<!-- tabs:start -->

#### **Description**
Returns: `number` or `Undefined`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`N/A`||

Returns the current assigned date time to Lexicon, the value used for `{DATETIME}`, `{TIME}` or `{DATE}` to determine whether it should use a set datetime or the value provided by the system via `date_current_datetime()`.

#### **Example**
```gml
time = LexiconUnicDateTimeGet();
```


<!-- tabs:end -->

### `LexiconUnicDatetimeSet(value)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`value`|`number` or `Undefined`|The datetime you wish to set for Lexicon.|

Sets the datetime that Lexicon will refer to, the value is used for `{DATETIME}`, `{TIME}` or `{DATE}`, where if a `number` is passed in, it will use that as the current datetime. Otherwise if the datetime value is set to`undefined`, it will use the currently set time from `date_current_datetime()`.

#### **Example**
```gml
LexiconUnicDateTimeSet(
    date_create_datetime( 
            2025,
            10,
            25,
            0,
            0,
            0
    )
);
```


<!-- tabs:end -->