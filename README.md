# Lexicon

Lexicon is a localization system focused around on simplifying implementation of adding translation to your GameMaker project!
It supports the following:

* Substring Replacement.
* Adding/removing languages through built-in functionality.
* Supports CSV/JSON parsing.


## Functions

### lexicon_init
`lexicon_init([default_locale], [default_replace_chr])`

Initalizes Lexicon system. Optionally allows to set the default locale, as well as the default replace character.
Leaving it as `lexicon_init()` will use the OSes default language (as `os_get_language() + "-" + os_get_region()`)and the default replace character will be set as `%s`.

Example:
```gml
// Initalizes & sets the default locale to the OSes settings. And replace character to %s
lexicon_init(); 

// Initalizes & sets the default locale to "en-US". And replace character to %s.
lexicon_init("en-US"); 

// Initalizes & sets the default locale to "en-US". And replace character to "$t".
lexicon_init("en-US", "$t"); 
```

### lexicon_text

The bread and butter of the main system. Takes a text pointer (such as `text.introduction1` or `text_introduction1` or any kind of flavour) 
and returns either the text pointer or the string from the set localization.

The additional optional arguments replace `%s` with each and every subsequent argument. i.e.

This: 
`This is a test string that contains %s million!`

To:
`This is a test string that contains 100 million!`

Example:
```gml
// Returns the specific string/pointer
lexicon_text("text.introduction1`);

// Returns the specific string/pointer. Replacing a single entry with `%s`.
lexicon_text("text.introduction1`, current_time/1000);

// Returns the specific string/pointer. Replacing two+ single entry with `%s`.
lexicon_text("text.introduction1`, current_time/1000, "This was added in");
```

### lexicon_set_replace_chr

This will set the replace character (i.e. `%s`) to whatever you desire.

Example:
```gml
// This will set the replace character to "$t"
lexicon_set_replace_chr("$t");
```

### lexicon_get_replace_chr

This will set the replace character (i.e. `%s`) to whatever you desire.

Example:
```gml
// This will return the replace character.
var _chr = lexicon_get_replace_chr();
```

### lexicon_add_entry

This will add a new text entry to an existing language.

Example:
```gml
lexicon_add_entry("en-US, "text.test", "This is a test %s");
```

### lexicon_remove_entry
