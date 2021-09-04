#macro LEXICON_STRUCT global.__lexicon_struct
#macro LEXICON_VERSION "2.0.0"
#macro LEXICON_CREDITS "TabularElf at https://github.com/tabularelf"

// Setup Lexicon well before anything else
LEXICON_STRUCT = undefined;

// Init Lexicon
__lexicon_init();

function __lexicon_init() {
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
		#endregion
	}

	show_debug_message("Lexicon " + LEXICON_VERSION + " initialized!");
	show_debug_message("Created by " + LEXICON_CREDITS);
}