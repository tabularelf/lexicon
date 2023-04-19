// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_parse_string(_lexiconTextCache) {
	static _global = __lexicon_init();
	static __blacklistDB = {
		"Date": true,
		"Time": true,
		"DateTime": true
	}
    _lexiconTextCache.timeStamp = _global.frame;
	//static _replaceChrs = _global.replaceChr;
	static _replaceChrStart = _global.replaceChr[0];
	static _replaceChrEnd = _global.replaceChr[1];
	static _replaceChrLegacy = _global.replaceChrLegacy;
    static _hashAvailable = _global.hashAvailable;
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
					_posStart = string_pos_ext(_replaceChrStart, _newStr, _posStart);
					_posEnd = string_pos_ext(_replaceChrEnd, _newStr, _posEnd);
					var _strKey = string_copy(_newStr, _posStart+_leftReplaceChrLen, _posEnd-_posStart-_leftReplaceChrLen);
					if (_strKey == "") break;
                    
						var _iii = 0;
						var _alreadyPushed = false;
                        if (_dynamicArray != undefined) {
						    repeat(array_length(_dynamicArray)) {
						    	if (_dynamicArray[_iii][0] == _strKey) {
						    		_alreadyPushed = true;
						    		break;
						    	}
						    	++_iii;
						    }
						    
						    if (_alreadyPushed) {
						    	++_ii;
						    	continue;
						    }
                        }
						if (_global.dynamicMap[$ _strKey] != undefined) {
                            if (_dynamicArray == undefined) _dynamicArray = [];
							_lexiconTextCache.isDynamic = true;
							array_push(_dynamicArray, [_strKey, undefined]);
						} else {
							_ii = 1;
							repeat(argument_count-1) {
							if (!is_struct(argument[_ii])) {
								++_ii;
								continue;
							}
								
							if (variable_struct_exists(argument[_ii], _strKey)) {
								_lexiconTextCache.isDynamic = true;
                                if (_dynamicArray == undefined) _dynamicArray = [];
								array_push(_dynamicArray, [_strKey, weak_ref_create(argument[_ii]), _hashAvailable ? variable_get_hash(_strKey) : undefined]);
								++_ii;
								break;
								//_newStr = string_replace_all(_newStr, _replaceChrStart + _strKey + _replaceChrEnd, argument[_ii][$ _strKey]);	
							}
							++_ii;
						}
					}
					_posStart++;
					_posEnd++;
				}
				
			}
		}
	
		// Store current string contents
         _lexiconTextCache.str = _newStr;

		_lexiconTextCache.dynamicArray = _dynamicArray;
		_lexiconTextCache.isCompiled = true;
	} else {
        var _newStr = _lexiconTextCache.str;	
        
        if (_lexiconTextCache.isDynamic) || (_lexiconTextCache.isDynamicGlobal) {
		    var _dynamicArray = _lexiconTextCache.dynamicArray;
	    } else {
            return _newStr;   
        }
    }
	
	if (_dynamicArray != undefined) {
		_i = 0;
        var _entry = _dynamicArray[_i];
        var _strKey = _entry[0];
        var _id = _entry[1];
		repeat(array_length(_dynamicArray)) {
			if (_id == undefined) {
				_newStr = string_replace_all(_newStr, _replaceChrStart + _strKey + _replaceChrEnd, _global.dynamicMap[$ _strKey]());
			} else if (weak_ref_alive(_id)) {
				_newStr = string_replace_all(_newStr, _replaceChrStart + _strKey + _replaceChrEnd, _hashAvailable ? struct_get_from_hash(_id.ref, _entry[2]) : _id.ref[$ _strKey]); //_global.hashAvailable ? variable_get_hash(_strKey) : undefined	
			}
			++_i;
		}
	}
	
	return _newStr;
}
