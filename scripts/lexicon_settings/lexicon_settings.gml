// General
#macro LEXICON_DEBUG										false // Enables Lexicons debugging (outputs specific errors or extra info to console).
#macro LEXICON_USE_FIRST_ENTRY_ADDED	false // Uses the first entry added automatically

// Cache related
#macro LEXICON_USE_CACHE								true // Uses the cache system. Searching for strings that match the same arguments as they were called.
#macro LEXICON_AUTO_GC_CACHE					true // Whether to automatically run the cache garbage collection system or not.
#macro LEXICON_USE_ADVANCE_CACHE			true // Used for lexicon_text_struct. Whether to include caching changing structs. Setting deprecated.
																				
#macro LEXICON_CACHE_TIMEOUT						4000 // How long before it gets removed from the cache system, in milliseconds
#macro LEXICON_CACHE_ARG_THRESHOLD		2 // How many arguments before it starts caching. This doesn't apply to lexicon_text_struct.
#macro LEXICON_GC_NEXT_TICK							60 // Controller to ensure that the cache garbage collector triggers only when necessary. 