/// @ignore
/// feather ignore all
function __lexicon_cache_text(_text, _cacheStr) constructor {
	//static memStr = "";
	str = _text;
	//memStr = _text;
	cacheStr = _cacheStr;
	timeStamp = current_time;
	
	static toString = function() {
		timeStamp = current_time;
		return str;
	}
}