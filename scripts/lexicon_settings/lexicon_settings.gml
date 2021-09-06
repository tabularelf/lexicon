// General
#macro LEXICON_DEFAULT_LOCALE					os_get_language() + "-" + os_get_region() // Determines what your preferred method of fetch language/region.
#macro LEXICON_DEBUG										false // Enables Lexicons deep debugging information. (Which at the moment is very little)
#macro LEXICON_USE_FIRST_ENTRY_ADDED	false // Adds the very first entry that gets added

// Cache related

#macro LEXICON_USE_CACHE								true // Uses the cache system. Prevents the same string from being regenerated.
#macro LEXICON_AUTO_GC_CACHE					true // Whether to automatically run the cache system or not.
#macro LEXICON_USE_ADVANCE_CACHE			true // Used for lexicon_text_struct. Setting deprecated.
																				
#macro LEXICON_CACHE_TIMEOUT						4000 // How long before it gets removed from memory, in milliseconds
#macro LEXICON_CACHE_ARG_THRESHOLD		2 // How many arguments before it starts caching. This doesn't apply to structs.
#macro LEXICON_GC_NEXT_TICK							60 // Controller to ensure that the cache garbage collector triggers only when necessary