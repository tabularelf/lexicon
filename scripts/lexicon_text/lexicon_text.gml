/// @func lexicon_text(textEntry, [substring], [...]
/// @param {String} _textEntry
/// @param {Any} [substring]
/// @param {Any} [...]
/// @return {String}
function lexicon_text(_textEntry) {
	gml_pragma("forceinline");
	// Ensure that it's loaded first!
	static _global = __lexicon_init();
	static _cacheMap = _global.cacheMap;
	static _staticArray = [];
	static _replaceChrStart = _global.replaceChr[0];
	static _replaceChrEnd = _global.replaceChr[1];
	static _replchr = _global.replaceChrLegacy;
	var _str = _textEntry;
	
	if (argument_count > array_length(_staticArray)) array_resize(_staticArray, argument_count);
	var _cacheStruct = undefined;
	
	// We'll check to see if it already exists in the cache before processing the string at hand.
	
	// Failsafe before everything else!
	if (_global.localeMap[$ _global.locale] == undefined) {
		// Fallback to language
		if (_global.languageMap[$ _global.language] == undefined) {
			return _global.locale + "." + _textEntry;	
		}
	}
	
	// Treat as a text entry!
	if ((string_count(_replaceChrStart, _str) == 0) || (string_count(_replaceChrEnd, _str) == 0)) {
		_str = _global.textEntries[$ _textEntry];
		if (_str == undefined) {
			/* Feather ignore once GM2047 */
			
			if (__LEXICON_DEBUG) {
				return "Missing text entry: \"" + _textEntry + "\"";	
			}
			
			return _textEntry;
		}
	}
	

	#region Cache
	// Check against Cache
	var _cacheStr = _global.locale+"."+_textEntry;
	
	// Get arguments
	var _i = 1;
	repeat(argument_count-1) {
		if (is_struct(argument[_i])) {
			_cacheStr += string(ptr(argument[_i]));	
		} else {
			_cacheStr += string(argument[_i]);	
		}
		// Store arguments
		_staticArray[_i] = argument[_i];
		++_i;
	}

	if (ds_map_exists(_cacheMap, _cacheStr)) {
		_cacheStruct = _cacheMap[? _cacheStr];
	} else {
		_cacheStruct = new __lexicon_cache_text(_str, _cacheStr);
		_global.cacheMap[? _cacheStr] = _cacheStruct;
		ds_list_add(_global.cacheList, {cacheStr: _cacheStr, ref: weak_ref_create(_cacheStruct)});
	}
	#endregion
	var _newStr;
	_staticArray[0] = _cacheStruct;
	_newStr = script_execute_ext(__lexicon_parse_string, _staticArray, 0, argument_count);
	
	return _newStr;
}