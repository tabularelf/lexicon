// feather ignore all 
/// @ignore
function __LexiconTextCache() {
	static _init = __LexiconTextSystem();
	static _cache = ds_map_create();
	return _cache;
}