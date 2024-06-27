// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_resolve_dynamic(_strKeyStripped, _args) {
	static _global = __lexicon_init();
	static _staticArray = [];
	static _replaceChrStart = _global.replaceChr[0];
	static _replaceChrEnd = _global.replaceChr[1];
	var _callback = _global.dynamicMap[$ _strKeyStripped][0];
	var _index = is_method(_callback) ? method_get_index(_callback) : _callback;
	var _self =	is_method(_callback) ? (method_get_self(_callback) ?? self) : self;
	var _strResult;
	if (_args == undefined) {
		_strResult = _callback();	
	} else {
		var _len = array_length(_args);
		if (is_array(_args) && _len > array_length(_staticArray)) {
			array_resize(_staticArray, _len);
		}
		array_copy(_staticArray, 0, _args, 0, _len);
		var _i = 0;
		repeat(_len) {
			var _str = _staticArray[_i];
			if (string_count(_replaceChrStart, _str) > 0 && string_count(_replaceChrEnd, _str) > 0) {
				_staticArray[_i] = undefined;	
			} else {
				// Digits check
				var _digitLen = string_length(string_digits(_str));
				
				if (_digitLen > 0 && _digitLen - (string_ord_at(_str, 1) == ord("-")) - (string_pos(".", _str) != 0)) {
					_staticArray[_i] = real(_str);
				}
			}
			
			++_i;
		}
		
		with(_self) {
			_strResult = script_execute_ext(_index, _staticArray, 0, array_length(_args));
		}
	}
	
	return _strResult;
}