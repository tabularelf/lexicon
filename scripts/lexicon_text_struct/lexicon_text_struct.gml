/// @func lexicon_text_struct(textEntry, struct)
/// @param {String} textEntry
/// @param {Struct} struct
/// @return {String}
/// feather ignore all
function lexicon_text_struct(_textEntry, _struct) {
	gml_pragma("forceinline");
	// Auto GC
	if (LEXICON_USE_CACHE && LEXICON_AUTO_GC_CACHE) __lexicon_handle_cache();
	static __lexicon = __LEXICON_STRUCT;
	static localeMap = __lexicon.localeMap;
	static languageMap = __lexicon.languageMap;
	var textEntries = __lexicon.textEntries;
	static cacheMap =	__lexicon.cacheMap;
	static cacheList =	__lexicon.cacheList;
	//with(__LEXICON_STRUCT) {

		// Failsafe before everything else!

		var _replchr = __lexicon.replaceChr;
		// Correct for any potential errors
		if (localeMap[$ __lexicon.locale] == undefined) {
				// Fallback to language
				if (languageMap[$ __lexicon.language] == undefined) {
					return __lexicon.locale + "." + _textEntry;	
				}
			}

		// Check to see if text exists
		var _str = textEntries[$ _textEntry];
		if (_str == undefined) {
			/* Feather ignore once GM2047 */
			if (LEXICON_DEBUG) {
				return "Missing text pointer: " + _textEntry;	
			}
				
			return _textEntry;
		}

		#region Cache
		// Check against Cache
			if (LEXICON_USE_CACHE) {
				static _crc32Buffer = buffer_create(1, buffer_grow, 1);
				var _keys = variable_struct_get_names(_struct);
					var _cacheStr = __lexicon.locale+"."+_textEntry;
					if (LEXICON_USE_ADVANCE_CACHE) {
							_cacheStr += string(_struct);
					}
					
					buffer_seek(_crc32Buffer, buffer_seek_start, 0);
					buffer_resize(_crc32Buffer, string_byte_length(_cacheStr));
					buffer_write(_crc32Buffer, buffer_text, _cacheStr);
					var _cacheStr = buffer_crc32(_crc32Buffer, 0, buffer_tell(_crc32Buffer));
					buffer_resize(_crc32Buffer, 1);

					if ds_map_exists(cacheMap, _cacheStr) {
						var _structCache = cacheMap[? _cacheStr];
						//if _structCache.cacheStr == _cacheStr {
							_structCache.timeStamp = current_time;
							return _structCache.str;
						//}
					}
			}
		#endregion

		// Lets loop through struct-based stuff
		var _keys = variable_struct_get_names(_struct);
		var _i = 0;
		static _replChr0 = __lexicon.replaceChrStruct[0];
		static _replChr1 = __lexicon.replaceChrStruct[1];
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

	//}

	if (LEXICON_USE_CACHE) {
		var _structEntry = new __lexicon_cache_text(_str, _cacheStr);
		cacheMap[? _cacheStr] = _structEntry;
		ds_list_add(cacheList, {cacheStr: _cacheStr, ref: weak_ref_create(_structEntry)});
		//return _struct;
	}

	return _str;
}



