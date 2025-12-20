# Hot Reload

Starting with Lexicon v4, it has been made possible to support hot reloading to the fullest. Hot reloading enables the developer, a translator, story writer or a community fan from making changes on the fly, without ever having to close and open the game again. Lexicon will also refresh all text elements that are currently being referenced. Hot reloading does not provide any functions, but does provide a bunch of configuration macros.

?> Hot reloading is only supported for desktops platforms. 

!> Hot reloading from the IDE requires the sandbox to be disabled!

## Functions
### `LexiconHotreload()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
| `N/A` |||

Hot reloads every text element except for the `LexiconParse()` and `LexiconParseExt()` variants that have not been altered via `.SetKey().

#### **Example**
```gml
if (keyboard_check_released(vk_f7)) {
    LexiconHotreload();
}
```

<!-- tabs:end -->



## Config 
|Name|Default Value|Purpose|
|---|---|---|
|`__LEXICON_HOT_RELOAD_ENABLED`|`true`| Whether hot reloading should be enabled or not. This will attempt to hot reload files every time they have been changed. If sandbox is disabled, an error will be thrown. Unless it's exported or ran on a non-desktop platform|
|`__LEXICON_HOT_RELOAD_ALLOW_ON_EXPORT`|`false`|Whether hot reloading should be allowed on export. This mainly applies to desktop applications.|
|`__LEXICON_HOT_RELOAD_FILE_WATCH_UPDATE_SECONDS`|`2`|How many seconds before Lexicon will scan existing files and attempt to soft reload language entries.|
|`__LEXICON_HOT_RELOAD_GC_FRAMES`|`1`|How many frames should Lexicon sleep for before firing off the garbage collector. As each and every text element is stored as a weak reference elsewhere for refreshing, Lexicon needs to periodically clear these out.|
|`__LEXICON_HOT_RELOAD_GC_MAX_TIME_MS`|`200`|The max amount of time in milliseconds Lexicon should spend on processing the garbage collector for dead text element references.|