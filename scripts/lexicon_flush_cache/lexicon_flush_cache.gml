/// @funct lexicon_flush_cache()
function lexicon_flush_cache() {
	ds_map_clear(__LEXICON_STRUCT.cacheMap);
	ds_list_clear(__LEXICON_STRUCT.cacheList);
}