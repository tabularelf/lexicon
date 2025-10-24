# Text Elements
Upon calling `Lexicon(entry, ...)` or `LexiconExt(entry, array)` whatever is passed to the first argument is considered a text entry, and it will find/create an entry class and store that alongside with the Lexicon text element, and returns the text element instance directly to you. These text element instances do not get cached at all by Lexicon, but are garbage collectible friendly as they only contain structs (the ones you passed in, text entries referenced, or the global struct) and arrays (for arguments passed in, and for when text entries are dynamic for the simplified structure). If the text entry own text is `undefined`, it is considered not loaded by all intents and purposes by Lexicon, and will be treated as completely static. If a text entry is considered dynamic, it will instead regenerate the text itself. Or if `.ToStatic()` was called directly from the text element itself.

The following cases where regeneration occurs:

- On text element creation.
- Upon text entry language change.
- Upon calling `.Refresh()`.
- Upon calling `.SetKey(entry)`.
- Upon calling `.Update(...)` and passing in different arguments.

## What does Lexicon parse the text entries for?

Lexicon by default will not parse any text entries, if they do not contain at least one pair of `{}`. This is by design as an early out optimization. In the event that a pair (whether valid or not) does exist, Lexicon will parse it and validate. Lexicon will be looking out for dynamic callbacks, number template strings, variable template strings and text entry strings (if enabled). This will be broken down into two sections. 

### Dynamic templates
The following hierarchy that Lexicon will follow in terms of searching, from top to bottom:
- Dynamic Callbacks
- Variable template strings (local structs)
- Variable template strings (global)
- Text entries (if enabled and explicit `TEXT.` is disabled)

This means that a dynamic callback called `foo`, and a text entry contains `{foo}`, then it will mark it as a dynamic callback. If there isn't a dynamic callback, and `foo` as a variable exists in a local struct passed to the Lexicon text element instance (either via `Lexicon(entry, ...)` or `LexiconExt(entry, array)` or via `.Update(...)`), then it'll refer to `foo` from the local struct/s. If not, instead if the [Lexicon global struct](global.md) contains the variable `foo`, it will instead refer to that. If all else fails, and there is a text entry that is just `foo`, it will then refer to that. If failing all of that, Lexicon will instead treat it as ordinary text and move on. You may also explicitly override which one it looks at, by appending `LOCAL.` for structs passed to the text element, `GLOBAL.` for the global struct, or `TEXT.` for the text entries themselves. Referencing text entries within text entries will fire up & pass the arguments fed to `Lexicon` or `LexiconExt` to a new text element, which gets stored as its own reference to the root text element. Allowing you to pass relevant local structs and other values directly. Take this for example with these text entries.
```json
	"foo": "{TEXT.bar}",
	"bar": "{TEXT.item}",
	"item": "{GLOBAL.foo}",
```

Doing `Lexicon("foo")` will do the following:
- Sees `bar` as a text entry, which calls `Lexicon("bar")` and stores it within the root text element.
- Sees `item` as a text entry, which calls `Lexicon("item")` and stores it within the root text element of `bar`.
- If `foo` exists as a global, it will then store a reference to the global struct and variable.

This will result in this hierachy.

```
 Lexicon("foo") - Root
  │                              
  └─►Lexicon("bar") - Child A           
      │                          
      └─►Lexicon("item") - Child B    
          │                      
          └─►"LexiconGlobal.foo" - Global variable
```

While this example is unlikely to be seen in most text entries, the intended idea to allow referencing multiple text entries within one text element, allowing for carrying the translation of certain text entries around. i.e. `"Hello {playerName}, would you care for an {TEXT.item.apple.name}?`.

### Number templates
Number templates strings are parsed separately, and are considered non-mutable by the text element, if non-struct values are passed initially to `Lexicon(entry, ...)` or the array within `LexiconExt(entry, array)`. If `__LEXICON_ADJUST_UNUSED_STRING_TEMPLATES` is set to `true`, Lexicon will adjust any text that has number templates unused. Take for example this text `"Hello {0}, I hope {1} is well!"`. If it was under the text entry `npc.bob.greeting`, passing `Lexicon("npc.bob.greeting", "Alice")` will bake the results in directly as `"Hello Alice, I hope {0} is well!"`, allowing you to update the number template strings via `.Get()` without altering your argument order. Any unused number string templates will be corrected based on when they were found in order. Otherwise if `__LEXICON_ADJUST_UNUSED_STRING_TEMPLATES` is set to `false`, the text will remain as `"Hello Alice, I hope {1} is well!"`, and all `.Get()` calls will need to account for the argument differences. Number templates can be passed to dynamic callbacks. However, there is one exception as of writing where this is not possible, and that is variable modifiers. Any left over number template strings will follow the same rules as `string()` when calling `.Get(...)`.

### Dynamic callbacks
Dynamic callbacks are functions that are exposed to Lexicon, and allow calling any arbitary code and returning a result. Dynamic callbacks are defined by `LexiconPlugInSetDynamic()`, where they take a name, a callback function and an optional state to determine if they should be static or not.

### Variable Modifiers
Variable modifiers are a new feature, aimed at simplifying dynamic callback calls, for primarily variable lookups. This means text can have something like `"The price is {price, currency}."`, where `price` is the variable lookup and `currency` is the variable modifier. And it will call a variable modifier that will modify and return the results directly on a local or global variable. These are treated as separately from dynamic callbacks, as the first argument is always a variable result. (This means the first argument of `currency` will be the result of `price` lookup.) And as such, are exposed separate from dynamic callbacks.

## Local vs Global

Lexicon text elements can either reference a global struct via [`LexiconGlobalStructGet()`](globals.md) or a struct that was passed to `Lexicon(entry, ...)` or `LexiconExt(entry, array)`.
An example of this is if you have a text entry called `"item.name"`, and that contains the following text `"{name}"`, you can set the following in a global struct to refer to a global variable.

```gml
var _global = LexiconGlobalStructGet();
_global.name = "Charlie";
text = Lexicon("item.name"); // "{name}"

show_message(text.Get()); // "Charlie"
```

If you instead wish to refer to another struct besides the global, you can instead pass in your own struct. This is referred to as a local struct. And you may pass as many local structs as you like, the text elements will search through all of them as needed during parsing, and mark the ones it needs to refer to, based on the very first variable it finds.
```gml
item = {
    name: "Apple",
    count: 1,
    description: "An apple a day, keeps the doctor away!",
};
text = Lexicon("item.name", item); // "{name}"

show_message(text.Get()); // "Apple"
```

Variable template strings also allow accessing structs from within structs, allowing you to point to a specific entry. i.e. `itemDb.apple.name` will treat it as multiple structs in, if they are all structs, and stores the most right value struct. (`apple` in this example is the right value struct under this assumption.)

!> Variable template strings are treated as always dynamic, so these will update whenever the structs `.Get()` is called (minus frame cooldown.). The results are also cached for the future, until the value changes again.