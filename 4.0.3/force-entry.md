# Force Entry

When it comes to Lexicon, Lexicon treats all text passed to `Lexicon()` and `LexiconExt()` as "keys", whether they are valid or not. For the most part, this is entirely preferable as you do not want to allow any text to be registered and parsed. (For those cases, `LexiconParse()` and `LexiconParseExt()` fill in the gaps.) However, it is sometimes nice, especially with other tools that provide live reloading support, to be able to force accept the text on the fly as-is for development purposes. This plug-in enables that by treating all keys as if they are genuinely text. This means allowing `Lexicon("Hello, {playerName}!")` to be used and parsed directly!

Force Entry comes with no functions and one singular config option.

|Name|Default Value|Purpose|
|---|---|---|
|`__LEXICON_FORCE_ENTRY_ENABLED`|`false`|When enabling this, upon a language being set, Lexicon will force add any text as a valid entry. Even if it doesn't make sense from a practical standpoint.|