// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_localization_map_init() {
	static _inst = undefined;
	//if (_inst == undefined) {
	//	var _t = get_timer();
	//	var _buff = buffer_load("lexicon_db.json");
	//	var _json = buffer_read(_buff, buffer_text);
	//	buffer_delete(_buff);	
	//	try {
	//		_inst = {};
	//		var _struct = json_parse(_json);
	//		var _i = 0;
	//		var _keys = variable_struct_get_names(_struct);
	//		repeat(array_length(_keys)) {
	//			if (_keys[_i] == "Template") {
	//				++_i;
	//				continue;
	//			}
	//			var _entry = _struct[$ _keys[_i]];
	//			__lexicon_localization(_keys[_i], _entry.region, _entry.locale, _entry.format);
	//			if (variable_struct_exists(_entry, "children")) {
	//				var _alts = _entry.children;
	//				var _j = 0;
	//				repeat(array_length(_alts)) {
	//					__lexicon_localization(_alts[_j].name, _entry.region, _alts[_j].locale, 
	//					(variable_struct_exists(_alts[_j], "format") ? __lexicon_struct_merge(_alts[_j].format, _entry.format) : _entry.format));	
	//					++_j;
	//				}
	//			}
	//			++_i;
	//		}
	//		__lexicon_trace("Lexicon Database loaded! Took " + string((get_timer() - _t) / 1000) + "ms");
	//	} catch(_ex) {
	//		__lexicon_trace("Invalid lexicon_db.json!\n" + _ex.message);
	//		_inst = {};
	//	} 
	//}
	return _inst;
}
//__lexicon_localization_map_init();