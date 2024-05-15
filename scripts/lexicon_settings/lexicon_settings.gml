/// @ignore
/// feather ignore all
/* 
    Enables Lexicons debugging (outputs specific errors or extra info to console)
*/
#macro __LEXICON_DEBUG (GM_build_type == "run") 

/*
    Whether Lexicon should be verbose in certain areas (such as cache clearing)
*/
#macro __LEXICON_VERBOSE false

/*
    Uses the first entry added automatically
*/
#macro __LEXICON_USE_FIRST_ENTRY_ADDED false 

/*
    Tells Lexicon which rows in a CSV format are comments and discards them.
*/
#macro __LEXICON_ROW_SEPERATOR "------------------" 
																			

/*
    Tells Lexicon what characters are used to determine a variable with lexicon_text_struct(). 
	By default it is ["{", "}"].
*/
#macro __LEXICON_STRUCT_REPLACE_CHR_SYMBOLS ["{", "}"] 

/* 
    Tells Lexicon what character it should return for when a struct is defined within one of the text entries. 
    i.e. "generic": {"foo": "bar"} would become "generic.foo".	
*/
#macro __LEXICON_TEXT_JSON_BREAK "."

/* 
    Tells Lexicon that it can replace duplicate entries with new ones.
*/
#macro __LEXICON_REPLACE_ENTRIES false 

/* 
    Tells Lexicon to include the fallback language as well when switching languages.
*/
#macro __LEXICON_FORECE_LOAD_FALLBACK_LANGUAGE false 

/*
    Whether to use the old legacy accessor feature "%s" or not.
*/
#macro __LEXICON_ALLOW_LEGACY_ACCESSOR false

/*
    Whether Lexicon should allow dynamic functions to update existing texte entries
*/
#macro __LEXICON_UPDATE_DYNAMIC_VALUES true

/*
	Whether to resolve newlines (\n) upon loading in language\s
*/
#macro __LEXICON_RESOLVE_NEWLINES false

/*
	Whether Lexicon should verify that no recursion is occuring.
	Turning this off will bypass any recursion checks, but unknown errors may occur.
	By default this is on.
*/
#macro __LEXICON_ENTRY_RECURSION_DETECTION true