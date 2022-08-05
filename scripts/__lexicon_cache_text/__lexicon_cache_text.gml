// Feather ignore all
/// @ignore
function __lexicon_cache_text(_text, _cacheStr) constructor {
	//static memStr = "";
	str = _text;
	//memStr = _text;
	cacheStr = _cacheStr;
	timeStamp = current_time;
	
	static toString = function() {
		/*if (LEXICON_USE_CACHE) {
			lexicon_handle_cache();
		}*/
		timeStamp = current_time;
		return str;
	}
}