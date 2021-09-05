// General
#macro LEXICON_DEBUG false

// Cache related

#macro LEXICON_USE_CACHE true
#macro LEXICON_USE_ADVANCE_CACHE true
#macro LEXICON_AUTO_GC_CACHE true

#macro LEXICON_CACHE_TIMEOUT 4000 // How long before it gets removed from memory, in milliseconds
#macro LEXICON_CACHE_ARG_THRESHOLD 2 // How many arguments before it starts caching. This doesn't apply to structs.
#macro LEXICON_GC_NEXT_TICK 60 // Controller to ensure that the cache garbage collector triggers only when necessary