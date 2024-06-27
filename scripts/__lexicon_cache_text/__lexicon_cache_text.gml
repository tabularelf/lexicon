/// @ignore
function __lexicon_cache_text(_text, _cacheStr) constructor {
	static _global = __lexicon_init();
	str = _text;
	isCompiled = false;
	dynamicArray = undefined;
	isDynamic = false;
	cacheStr = _cacheStr;
	timeStamp = _global.frame;
	
	static toString = function() {
		return cacheStr;	
	}
}