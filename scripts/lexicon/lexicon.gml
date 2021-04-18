#macro LEXICON_STRUCT global.__lexicon_struct
#macro LEXICON_VERSION "1.1.0"
#macro LEXICON_CREDITS "TabularElf at https://github.com/tabularelf"

// Setup Lexicon well before anything else
LEXICON_STRUCT = undefined;

/// @func lexicon_init
/// @param [default_locale]
/// @param [default_replace_chr]
function lexicon_init(_default_locale, _default_replace_chr) {
	if (LEXICON_STRUCT != undefined) {
		__lexicon_throw("Lexicon already Initialized");
		return false;
	}
	LEXICON_STRUCT = {
		lang_map: {},
		lang_type: os_get_language() + "-" + os_get_region(),
		lang_replace_chr: "%s",
		lang_async_list: ds_list_create(),
		lang_cache: ds_map_create(),
		lang_cache_list: ds_list_create(),

		#region functions
		parse_json: function(_data) {

			if buffer_exists(_data) {
				var _json = buffer_read(_data, buffer_string);
			} else if is_string(_data) {
				var _json = _data;
			}

			var _map = json_parse(_json);
			var _status = -1;
			if (_map != -1) {
				_status = _map;

				// Get Languages
				var _languages = variable_struct_get_names(_map);

				for(var _j = 0; _j < array_length(_languages); ++_j) {
					// Get Lang type
					var _lang_type = _map[$ _languages[_j]][$ "locale"];

					// Create Language struct
					var _langStruct = {};
					// Loop text entries
					var _textStructPtr = _map[$ _languages[_j]][$ "text"];
					var _textArray = variable_struct_get_names(_textStructPtr);
					var _textStruct = {};
					for(var _k = 0; _k < array_length(_textArray); ++_k) {
						_textStruct[$ _textArray[_k]] = _textStructPtr[$ _textArray[_k]];
					}

					_langStruct.text = _textStruct;
					_langStruct.language = _languages[_j];
					_langStruct.locale = _lang_type;

					if (is_array(_lang_type)) {
						for(var _i = 0; _i < array_length(_lang_type); ++_i) {
							lang_map[$ _lang_type[_i]] = _langStruct;
						}
					} else {
						lang_map[$ _lang_type] = _langStruct;
					}
				}
			} else {
				__lexicon_throw("Error! Language JSON invalid!");
			}
			return _lang_type;
		},
		add: function(_file) {
			var _buff = buffer_load(_file);
			var _str = buffer_read(_buff,buffer_text);
			var _string = parse_json(_str);
			buffer_delete(_buff);
			return _string;
		},
		add_async: function(_file) {
			var _buff = buffer_create(1,buffer_grow,1);
			var _buffID = buffer_load_async(_buff,_file,0,-1);
			ds_list_add(lang_async_list,[_buffID,_buff]);
		},
		async: function() {
			var _size = ds_list_size(lang_async_list);
			var _id = async_load[? "id"];
			for(var _i = 0; _i < _size; ++_i) {
				var _info = lang_async_list[| _i];
				if (_info[0] == _id) {
					if (async_load[? "status"] == true) {
						var _str = buffer_read(_info[1],buffer_text);
						parse_json(_str);
					} else {
						__lexicon_throw("Lexicon Error! File not loaded!");
					}
					// Clean up
					buffer_delete(_info[1]);
					ds_list_delete(lang_async_list,_i);
				}
			}
		},
		remove: function(_lang_type) {
			if (lang_map[$ _lang_type] != undefined) {
				variable_struct_remove(lang_map, _lang_type);
			}
		},
		language_exists: function() {

		}
		#endregion
	}

	if (_default_locale != undefined) {lexicon_set_locale(_default_locale);}
	if(_default_replace_chr != undefined) {lexicon_set_replace_chr(_default_replace_chr);}

	show_debug_message("Lexicon " + LEXICON_VERSION + " initialized!");
	show_debug_message("Created by " + LEXICON_CREDITS);
}

// General Functions

/// @funct lexicon_flush_cache
function lexicon_flush_cache() {
	ds_map_clear(LEXICON_STRUCT.lang_cache);
	ds_list_clear(LEXICON_STRUCT.lang_cache_list);
}

/// @func __lexicon_throw
function __lexicon_throw(_string) {
	show_debug_message("Lexicon Error: " + string(_string));
}

/// @func __lexicon_debug
function __lexicon_debug(_string) {
	show_debug_message("Lexicon Debug: " + string(_string));
}

/// @func __lexicon_handle_cache
function __lexicon_handle_cache() {

	// Keep track of frame
	if (LEXICON_USE_CACHE) {
		static _frame = 0;
		static _cFrame = 0;

		// Perform first check
		if (_cFrame >= current_time) exit;

		// Perform second check
		_frame = ++_frame mod LEXICON_GC_NEXT_TICK;
		if (_frame != 0) exit;
	}


	with(LEXICON_STRUCT) {
		var _length = ds_list_size(lang_cache_list);
		for(var _i = 0; _i < _length; ++_i) {
			var _deleteStruct = false;
			var _ref = lang_cache_list[| _i];
			if !weak_ref_alive(_ref.ref) {
				_deleteStruct=  true;
			}
			if (current_time > lang_cache[? _ref.cacheStr].timeStamp+LEXICON_CACHE_TIMEOUT) {
				_deleteStruct = true;
			}


			if (_deleteStruct) {
				ds_list_delete(lang_cache_list,_i);
				delete lang_cache[? _ref.cacheStr];
				ds_map_delete(lang_cache, _ref.cacheStr);
				--_i;
				--_length;
				if (LEXICON_DEBUG_WARNINGS) __lexicon_debug(_ref.cacheStr + " has been removed!");
			}
		}
	}

	_cFrame = current_time+1000;
}

// Text Cache Function
// @func	__lexicon_cache_text
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

/// @func lexicon_text_array
/// @param text
/// @param array
function lexicon_text_array(_text, _array) {
	var _arrayCopy;
	_arrayCopy[array_length(_array)-1] = 0;
	array_copy(_arrayCopy,0,_array,0,array_length(_array));
	array_insert(_arrayCopy,0,string(_text))
	var _value = script_execute_ext(lexicon_text,_arrayCopy);
	return _value;
}

/// @func lexicon_text
/// @param text
/// @param [substring]
/// @param [...]
function lexicon_text(_text) {
			gml_pragma("forceinline");

			// Auto GC
			if (LEXICON_USE_CACHE && LEXICON_AUTO_GC_CACHE) __lexicon_handle_cache();
			//if (_replchr == undefined) _replchr = "";
			// We'll check to see if it already exists in the cache before processing the string at hand.
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
				if (argument_count-1 >= LEXICON_CACHE_THRESHOLD) {
					var _cacheStr = sha1_string_unicode(lang_type+"."+_text);
					if (LEXICON_USE_ADVANCE_CACHE) {
						// Normable substring replacement loop
						var _count = string_count(_replchr,_str);
						var _args = array_create(_count);
						for(var _i = 1; _i < _count; ++_i) {
							if (_i > argument_count) break;
							_args[_i-1] = argument[_i-1];
						}
							_cacheStr += sha1_string_unicode(string(_args));
					}

					if ds_map_exists(lang_cache, _cacheStr) {
						var _struct = lang_cache[? _cacheStr];
						if _struct.cacheStr == _cacheStr {
							// Update timestamp
							/*if (_struct.str != _struct.memStr) {
								if (_struct.cacheStr != _cacheStr) {
									// Recache
									var _newStruct = new _lexiconCacheText(_str, _cacheStr);
									delete _struct;
									ds_map_delete(_cacheStr
								}
							}*/
							_struct.timeStamp = current_time;
							return _struct.str;
						}
					}
				}
			}
			#endregion

			if (argument_count > 1) {
					var _count = string_count(_replchr,_str);
					for(var _i = 0; _i < _count; ++_i) {
						if (_i > argument_count-2) break;
						var _arg = argument[_i+1];
						_str = string_replace(_str, _replchr, _arg);
					}

					if (LEXICON_USE_CACHE) && (argument_count-1 >= LEXICON_CACHE_THRESHOLD) {
						var _struct = new __lexicon_cache_text(_str, _cacheStr);
						LEXICON_STRUCT.lang_cache[? _cacheStr] = _struct;
						ds_list_add(LEXICON_STRUCT.lang_cache_list, {cacheStr: _cacheStr, ref: weak_ref_create(_struct)});
						//return _struct;
					}
				}
			}

			return _str;
}

/// @func lexicon_set_replace_chr
/// @arg string
function lexicon_set_replace_chr(_chr) {
	LEXICON_STRUCT.lang_replace_chr = _chr;
}

/// @func lexicon_get_replace_chr
function lexicon_get_replace_chr() {
	return LEXICON_STRUCT.lang_replace_chr;
}

/// @func lexicon_add_entry
/// @param locale
/// @param text_pointer
/// @param string
function lexicon_add_entry(_locale, _text_name, _text) {
	LEXICON_STRUCT.lang_map[$ _locale][$ "text"][$ _text_name] = _text;
}

/// @func lexicon_remove_entry
/// @param locale
/// @param text_pointer
function lexicon_remove_entry(_locale, _text_name) {
	variable_struct_remove(LEXICON_STRUCT.lang_map[$ _locale], _text_name);
}
