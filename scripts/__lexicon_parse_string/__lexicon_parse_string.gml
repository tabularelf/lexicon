// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_parse_string(_lexiconTextCache) {
	static _global = __lexicon_init();
	static __blacklistDB = {
		"Date": true,
		"Time": true,
		"DateTime": true
	}
	//static _replaceChrs = _global.replaceChr;
	static _replaceChrStart = _global.replaceChr[0];
	static _replaceChrEnd = _global.replaceChr[1];
	static _replaceChrLegacy = _global.replaceChrLegacy;
	var _dt = _global.dateTimeFunc != undefined ? _global.dateTimeFunc() : date_current_datetime(); 
	var _dynamicArray = undefined;
	//static _cacheStr = "";
	//static _cacheStr2 = "";
	//var _cacheStr3 = _str + string(ptr(_struct));
	//if (_cacheStr != _cacheStr3) {
	//	_cacheStr = _cacheStr3;	
	//}
	if (!_lexiconTextCache.isCompiled) && (argument_count > 1) {
		var _newStr = _lexiconTextCache.str;
		if (argument_count > 1) {
			var _i = 1;
			var _ii = 0;
			repeat(argument_count-1) {
				if (is_struct(argument[_i])) {
					++_i;
					continue;
				}
				if (!(string_count(_replaceChrStart + string(_ii) + _replaceChrEnd, _newStr) > 0)) break;
				_newStr = string_replace_all(_newStr, _replaceChrStart + string(_ii) + _replaceChrEnd, argument[_i]);
				++_i;
				++_ii;
				break;
			}
			
			if (LEXICON_USE_LEGACY_ARRAY) {
				_i = 1;
				_ii = 0;
				repeat(string_count("%s", _newStr)) {
					repeat(argument_count-1) {
						if (is_struct(argument[_i])) {
							++_i;
							continue;
						}
						_newStr = string_replace(_newStr, _replaceChrLegacy, argument[_i]);
						++_i;
						++_ii;
						break;
					}
				}
			}
			
			if (string_count(_replaceChrStart, _newStr) > 0) && (string_count(_replaceChrEnd, _newStr) > 0) {
				var _remaining = string_count(_replaceChrStart, _newStr) + string_count(_replaceChrEnd, _newStr);
				var _posStart = 1;
				var _posEnd = 1;
				var _leftReplaceChrLen = string_length(_replaceChrStart);
				//var _rightReplaceChrLen = string_length(_replaceChrEnd);
				for(_i = 0; _i < _remaining; _i += 2) {
					_posStart = string_pos_ext(_replaceChrStart, _newStr, _posStart)+_leftReplaceChrLen;
					_posEnd = string_pos_ext(_replaceChrEnd, _newStr, _posEnd);
					var _strKey = string_copy(_newStr, _posStart, _posEnd-_posStart);
					if (_strKey == "") break;
					if (string_pos(",", _strKey) > 0) && ((string_delete(_strKey, 1, string_pos(",", _strKey)) == "dynamic") || (string_delete(_strKey, 1, string_pos(",", _strKey)) == " dynamic")) {
						if (_dynamicArray == undefined) _dynamicArray = [];
						var _addDynamic = true;
						var _iii = 0;
						repeat(array_length(_dynamicArray)) {
							if (_dynamicArray[_iii][1] == _strKey) {
								_addDynamic = false;
								break;
							}
						}
						if (_addDynamic) array_push(_dynamicArray, [string_delete(_strKey, string_pos(",", _strKey), string_length(_strKey)), _strKey, undefined]);
						continue;
					}
					
					_ii = 1;
					repeat(argument_count-1) {
						if (!is_struct(argument[_ii])) {
							++_ii;
							continue;
						}
						
						if (variable_struct_exists(argument[_ii], _strKey)) {
							_newStr = string_replace_all(_newStr, _replaceChrStart + _strKey + _replaceChrEnd, argument[_ii][$ _strKey]);	
						}
						++_ii;
					}
				}
				
			}
		}
	
		// Store current string contents
		_lexiconTextCache.finalStrDynamic = _newStr;
		_lexiconTextCache.finalStr = _newStr;
		_lexiconTextCache.dynamicArray = _dynamicArray;
		_lexiconTextCache.isCompiled = true;
	} else if (_lexiconTextCache.isDynamic) {
		var _newStr = _lexiconTextCache.finalStrDynamic;	
		var _dynamicArray = _lexiconTextCache.dynamicArray;
	} else if (_lexiconTextCache.isDynamicGlobal) {
		var _newStr = _lexiconTextCache.finalStrDynamic;
	} else {
		return _lexiconTextCache.finalStr;	
	}
	
	if (string_count(_replaceChrStart + "Date" + _replaceChrEnd, _newStr) > 0) {
		_newStr = string_replace_all(_newStr, _replaceChrStart + "Date" + _replaceChrEnd, _global.langDB.__GetDateString(_dt));
		_lexiconTextCache.isDynamicGlobal = true;
	}
	
	if (string_count(_replaceChrStart + "Time" + _replaceChrEnd, _newStr) > 0) {
		_newStr = string_replace_all(_newStr, _replaceChrStart + "Time" + _replaceChrEnd, _global.langDB.__GetTimeString(_dt));
		_lexiconTextCache.isDynamicGlobal = true;
	}
	
	if (string_count(_replaceChrStart + "DateTime" + _replaceChrEnd, _newStr) > 0) {
		_newStr = string_replace_all(_newStr, _replaceChrStart + "DateTime" + _replaceChrEnd, _global.langDB.__GetDateTimeString(_dt));
		_lexiconTextCache.isDynamicGlobal = true;
	}
	
	if (_dynamicArray != undefined) {
		_i = 0;
		repeat(array_length(_dynamicArray)) {
			_ii = 1;
			repeat(argument_count-1) {
				if (!is_struct(argument[_ii])) {
					++_ii;
					continue;
				}
				
				if (variable_struct_exists(argument[_ii], _dynamicArray[_i][0])) {
					_newStr = string_replace_all(_newStr, _replaceChrStart + _dynamicArray[_i][1] + _replaceChrEnd, argument[_ii][$ _dynamicArray[_i][0]]);
					_dynamicArray[_i][2] = weak_ref_create(argument[_ii]);
					_lexiconTextCache.isDynamic = true;
				}
				++_ii;
			}
			if (_dynamicArray[_i][2] == undefined) array_delete(_dynamicArray, _i, 1);
			--_i;
			++_i;
		}
	}
	
	return _newStr;
}

/// @ignore
function __lexicon_cache_text_new(_text, _cacheStr) constructor {
	static _global = __lexicon_init();
	str = _text;
	isCompiled = false;
	dynamicArray = undefined;
	isDynamic = false;
	isDynamicGlobal = false;
	finalStr = "";
	finalStrDynamic = _text;
	cacheStr = _cacheStr;
	timeStamp = _global.frame;
	
	static toString = function() {
		return cacheStr;	
	}
}

var _str = "{{Rawr}} {{Rawr,dynamic}} {{Rawr,dynamic}} {{Rawr}} {{DateTime}} {{0}} %s {{1}} %s {{3}} %s {{2}}";//"{{Rawr,dynamic}} " + string_repeat("{{DateTime}}", 100);
var _struct = {Rawr: "Nice"};
var _args = [_struct, 2, 5, 3];
var _cacheStr = "";
var _i = 0;
repeat(array_length(_args)) {
	if (is_struct(_args[_i])) {
		_cacheStr += string(ptr(_args[_i]));	
	} else {
		_cacheStr += string(_args[_i]);	
	}
	++_i;
}
_str = new __lexicon_cache_text_new(_str, _str+_cacheStr);

var _t = get_timer();
repeat(10000) {
	__lexicon_parse_string(_str, _struct, 2, 5, 3);	
}
show_debug_message(__lexicon_parse_string(_str, _struct, 2, 5, 3));
show_debug_message(string((get_timer() - _t) / 1000) + "ms"); 
show_debug_message(_str);
//show_debug_message(__lexicon_parse_string("{{Rawr, dynamic}} {{DateTime}}", {Rawr: "good job"}));

