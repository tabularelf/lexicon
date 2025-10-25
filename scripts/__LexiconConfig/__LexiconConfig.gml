/*
 When enabled, prints out additional information for debugging purposes.
 Default: false
*/
#macro __LEXICON_VERBOSE false
/*
 When enabled, any loading failures will throw an exception.
 Default: false
*/
#macro __LEXICON_ERROR_ON_LOAD_FAILURE_ON_RELEASE false
/*
 When enabled, Lexicon will attempt to refer to the bundle area, if sandbox is enabled.
 If this is ran from the IDE while this is enabled, but sandbox is disabled, an error will be thrown.
 On release, this will print a message to the output window.
 Default: true
*/
#macro __LEXICON_REFER_TO_BUNDLE_AREA true
/*
 The default font Lexicon should refer to when LexiconFontGet() fails to find a suitable font.
 Default: __LexiconFontFallback
*/
#macro __LEXICON_DEFAULT_FONT __LexiconFontFallback
/*
 Whether Lexicon should attempt to find the closest possible font it can utilise, if the initial searches fail.
 This system isn't strictly perfect, but it's a good enough "catch-all" solution for having most text render correctly.
 Default: true
*/
#macro __LEXICON_ENABLE_APPROXIMATE_FONT_SEARCH true
/*
 Whether Lexicon should adjust unused string templates when calling Lexicon() or LexiconExt() and passing non-struct arguments.
 This will turn text like "Hello, {0}. Would you like {1}!", assuming the second argument is 
 "Bob" passed to Lexicon(), as "Hello, Bob. Would you like {0}!".
 Default: true
*/
#macro __LEXICON_ADJUST_UNUSED_STRING_TEMPLATES true
/*
 How much time should Lexicon spend time between parsing files.
 This only occurs when loading asynchronously.
 Default: 1_000
*/
#macro __LEXICON_ASYNC_LOAD_PER_FILE_TIME_MS 1_000
/*
 Whether Lexicon should allow variable templates to look up text entries.
 This enables both "foo" and "TEXT.foo" to both look up text entries.
 Note: This option isn't strictly necessary, as both global and local lookups can reference and fetch the results from a Lexicon Text Element,
 if it's assigned to a variable.
 Default: true
*/
#macro __LEXICON_ALLOW_ENTRY_REFERENCING_IN_TEXT true
/*
 Whether Lexicon should have it mandatory to use "TEXT." when it comes to looking up text entries.
 Default: true
*/
#macro __LEXICON_ENFORCE_TEXT_ENTRY_EXPLICIT_ACCESSOR true
/*
 How many text entry references should Lexicon be allowed to make before it throws an exception.
 This is primarily to prevent text entries from recursing eachother indefinitely. 
 i.e. "foo" referes to "bar" which refers to "foo" which refers to "bar", so forth.
 Default: 10
*/
#macro __LEXICON_TEXT_PARSER_MAX_REFERENCE_STACK 10
/*
 The max amount of frame time that Lexicon should scan for changes in dynamic entries.
 Lexicon text elements include a small timer between checks to ensure that it isn't constantly checking for non-changing values.
 This value can be modified per text element.
 This is ignored if the text element in question has any dynamic callbacks.
 Default: 3
*/
#macro __LEXICON_MAX_DYNAMIC_ENTRY_FRAME_CAP 3