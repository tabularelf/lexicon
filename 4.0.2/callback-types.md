# Callback types

Lexicon allows plug-ins to interface and modify any step of Lexicon's steps in between creating text elements, modifying or update text entries, or even whenever updating a language.

|Name|Ran when|
|---|---|
|`LexiconCallbackType.ENTRY_CREATED`|Any time a new text entry is created and stored into the entry database. |
|`LexiconCallbackType.ENTRY_COLLECT`|Any time a text entry is initially called, and before the text is applied to the entry instance. Returning `undefined` will skip `.ENTRY_UPDATE`.|
|`LexiconCallbackType.ENTRY_UPDATE`|Any time a text entry is about to have its text applied.|
|`LexiconCallbackType.LANGUAGE_UPDATE`|Any time a language is initially changed. `LexiconLanguageSet("en_AU")`.|
|`LexiconCallbackType.LANGUAGE_POST_UPDATE`|Any time a language has finished changing.|
|`LexiconCallbackType.TEXT_ELEMENT_CREATED`|Any time a new text element has been created.|