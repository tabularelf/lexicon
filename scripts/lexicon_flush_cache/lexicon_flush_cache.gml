/// @funct lexicon_flush_cache
function lexicon_flush_cache() {
	ds_map_clear(LEXICON_STRUCT.lang_cache);
	ds_list_clear(LEXICON_STRUCT.lang_cache_list);
}