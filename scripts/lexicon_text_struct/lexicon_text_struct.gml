/// @func lexicon_text_struct(text_pointer, struct)
/// @param text_pointer
/// @param struct
function lexicon_text_struct(_text, _struct) {
	gml_pragma("forceinline");
	// Auto GC
	if (LEXICON_USE_CACHE && LEXICON_AUTO_GC_CACHE) __lexicon_handle_cache();

	with(__LEXICON_STRUCT) {

		// Failsafe before everything else!

		var _replchr = replaceChr;
		// Correct for any potential errors
		if (localeMap[$ locale] == undefined) {
				// Fallback to language
				if (languageMap[$ language] == undefined) {
					return locale + "." + _text;	
				}
			}

		// Check to see if text exists
		var _str = textEntries[$ _text];
		if (_str == undefined) {
			if (LEXICON_DEBUG) {
				return "Missing text pointer: " + _text;	
			}
				
			return _text;
		}

		#region Cache
		// Check against Cache
			if (LEXICON_USE_CACHE) {
				var _keys = variable_struct_get_names(_struct);
					var _cacheStr = locale+"."+_text;
					if (LEXICON_USE_ADVANCE_CACHE) {
							_cacheStr += string(_struct);
					}

					if ds_map_exists(cacheMap, _cacheStr) {
						var _structCache = cacheMap[? _cacheStr];
						if _structCache.cacheStr == _cacheStr {
							_structCache.timeStamp = current_time;
							return _structCache.str;
						}
					}
			}
		#endregion

		// Lets loop through struct-based stuff
		var _keys = variable_struct_get_names(_struct);
		var _i = 0;
		var _replChr0 = replaceChrStruct[0];
		var _replChr1 = replaceChrStruct[1];
		repeat(array_length(_keys)) {
			_str = string_replace_all(_str, _replChr0 + _keys[_i] + _replChr1, _struct[$ _keys[_i]]);
			++_i;
		}
		/*var _count = string_count(replaceChrStruct[0], _str) + string_count(replaceChrStruct[1], _str);
		for(var _i = 0; _i < _count; ++_i) {
			if (_i > argument_count-2) break;
			var _arg = argument[_i+1];
			if is_struct(_arg) {
				var _keys = variable_struct_get_names(_arg);
				var _lastPos = 1;
				for(var _ii = 0; _ii < array_length(_keys); ++_ii) {
					_str = string_replace_all(_str, "%" + _keys[_ii] + "%", _arg[$ _keys[_ii]]);
				}
			}
		}*/

	}

	if (LEXICON_USE_CACHE) {
		var _structEntry = new __lexicon_cache_text(_str, _cacheStr);
		__LEXICON_STRUCT.cacheMap[? _cacheStr] = _structEntry;
		ds_list_add(__LEXICON_STRUCT.cacheList, {cacheStr: _cacheStr, ref: weak_ref_create(_structEntry)});
		//return _struct;
	}

	return _str;
}
