/// @func lexicon_text_struct
/// @param text
/// @param struct
function lexicon_text_struct(_text, _struct) {
	gml_pragma("forceinline");
	// Auto GC
	if (LEXICON_USE_CACHE && LEXICON_AUTO_GC_CACHE) __lexicon_handle_cache();

	with(LEXICON_STRUCT) {

		// Failsafe before everything else!

		var _replchr = lang_replace_chr;
		// Correct for any potential errors
		if (lang_map[$ lang_type] == undefined) {
			return lang_type + "." + _text;
		}

		// Check to see if text exists
		var _str = lang_map[$ lang_type][$ "text"][$ _text];
		if (_str == undefined) {
			return _text;
		}

		#region Cache
		// Check against Cache
			if (LEXICON_USE_CACHE) {
				var _keys = variable_struct_get_names(_struct);
					var _cacheStr = sha1_string_unicode(lang_type+"."+_text);
					if (LEXICON_USE_ADVANCE_CACHE) {
							_cacheStr += sha1_string_unicode(string(_struct));
					}

					if ds_map_exists(lang_cache, _cacheStr) {
						var _structCache = lang_cache[? _cacheStr];
						if _structCache.cacheStr == _cacheStr {
							_structCache.timeStamp = current_time;
							return _structCache.str;
						}
					}
			}
		#endregion

		// Lets loop through struct-based stuff
		var _count = string_count("{{", _str) + string_count("}}", _str);
		for(var _i = 0; _i < _count; ++_i) {
			if (_i > argument_count-2) break;
			var _arg = argument[_i+1];
			if is_struct(_arg) {
				var _keys = variable_struct_get_names(_arg);
				var _lastPos = 1;
				for(var _ii = 0; _ii < array_length(_keys); ++_ii) {
					_str = string_replace_all(_str,"{{" + _keys[_ii] + "}}", _arg[$ _keys[_ii]]);
				}
			}
		}

	}

	if (LEXICON_USE_CACHE) {
		var _structEntry = new __lexicon_cache_text(_str, _cacheStr);
		LEXICON_STRUCT.lang_cache[? _cacheStr] = _structEntry;
		ds_list_add(LEXICON_STRUCT.lang_cache_list, {cacheStr: _cacheStr, ref: weak_ref_create(_structEntry)});
		//return _struct;
	}

	return _str;
}
