/// @ignore
// General
// Enables Lexicons debugging (outputs specific errors or extra info to console).
#macro LEXICON_DEBUG								(GM_build_type == "run") 

// Whether Lexicon should be verbose about what's it removing or not.
#macro LEXICON_VERBOSE								false

// Uses the first entry added automatically
#macro LEXICON_USE_FIRST_ENTRY_ADDED				false 

// Tells Lexicon which rows in a CSV format are comments and discards them.
#macro LEXICON_ROW_SEPERATOR						"------------------" 
																			

// Tells Lexicon what characters are used to determine a variable with lexicon_text_struct(). In previous versions it was { } by default.
#macro LEXICON_STRUCT_REPLACE_CHR_SYMBOLS			["{", "}"] 

// Tells Lexicon what character it should return for when a struct is defined within one of the text entries. i.e. "generic": {"foo": "bar"} would become "generic.foo".	
#macro LEXICON_TEXT_JSON_BREAK						"."

// Tells Lexicon that it can replace duplicate entries with new ones.
#macro LEXICON_REPLACE_ENTRIES						false 

// Tells Lexicon to include the fallback language as well when switching languages.
#macro LEXICON_FORECE_LOAD_FALLBACK_LANGUAGE		false 

// Whether to use the old legacy accessor feature "%s" or not.
#macro LEXICON_ALLOW_LEGACY_ACCESSOR				false

// Whether Lexicon should allow dynamic functions to update existing texte entries
#macro LEXICON_UPDATE_DYNAMIC_VALUES				true