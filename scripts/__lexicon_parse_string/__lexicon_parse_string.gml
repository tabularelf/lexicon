// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_parse_string(_lexiconTextCache) {
	gml_pragma("forceinline");
	static _global = __lexicon_init();
    _lexiconTextCache.timeStamp = _global.frame;
	//static _replaceChrs = _global.replaceChr;
	static _replaceChrStart = _global.replaceChr[0];
	static _replaceChrEnd = _global.replaceChr[1];
	static _replaceChrLegacy = _global.replaceChrLegacy;
    static _hashAvailable = _global.hashAvailable;
	var _dynamicArray = undefined;
	var _target = undefined;

	if (!_lexiconTextCache.isCompiled) {
		var _newStr = _lexiconTextCache.str;
		//if (argument_count > 1) {
		var _i = 1;
		var _ii = 0;
		while(true) {
				if (!(string_count(_replaceChrStart + string(_ii) + _replaceChrEnd, _newStr) > 0)) break;
				if (is_struct(argument[_i])) {
					++_i;
					continue;
				}
				_newStr = string_replace_all(_newStr, _replaceChrStart + string(_ii) + _replaceChrEnd, argument[_i] ?? "__lexicon_null" + string(_ii));
				++_i;
				++_ii;
			//}
			
			if (__LEXICON_ALLOW_LEGACY_ACCESSOR) {
				_i = 1;
				repeat(string_count("%s", _newStr)) {
					if (_i >= argument_count) break;
					repeat(argument_count-1) {
						if (is_struct(argument[_i])) {
							++_i;
							continue;
						}
						_newStr = string_replace(_newStr, _replaceChrLegacy, argument[_i]);
						++_i;
						break;
					}
				}
			}
		}
			
		if (string_count(_replaceChrStart, _newStr) > 0) && (string_count(_replaceChrEnd, _newStr) > 0) {
			var _remaining = string_count(_replaceChrStart, _newStr) + string_count(_replaceChrEnd, _newStr);
			var _posStart = 1;
			var _posEnd = 1;
			var _leftReplaceChrLen = string_length(_replaceChrStart);
			var _rightRplaceChrLen = string_length(_replaceChrEnd);
			//var _rightReplaceChrLen = string_length(_replaceChrEnd);
			for(_i = 0; _i < _remaining; _i += 2) {
				_target = undefined;
				var _args = undefined;
				_posStart = string_pos_ext(_replaceChrStart, _newStr, _posStart);
				_posEnd = string_pos_ext(_replaceChrEnd, _newStr, _posEnd);
				var _strKey = string_copy(_newStr, _posStart+_leftReplaceChrLen, _posEnd-_posStart-_leftReplaceChrLen);
				var _strKeyStripped = _strKey;
				if (_strKey == "") break;
                   
				// Fetch Arguments
				if (string_count(",", _strKey) > 0) {
					var _argStr = string_copy(_strKey, string_pos(",", _strKey)+1, string_length(_strKey));
					var _len = string_count(",", _strKey);
					_args = array_create(_len, undefined);
					var _sepPos = 1;
					var _sepLen = string_length(",");
					var _nextPos = string_pos(",", _argStr);
					var _argStrLen = string_length(_argStr);
					var _ii = 0;
					repeat(_len-1) {
						_args[_ii] = string_copy(_argStr, _sepPos, _nextPos - _sepPos);
						if (string_count("__lexicon_null", _args[_ii]) > 0) {
							var _numStr = string_digits(_args[_ii]);
							_strKey = string_replace(_strKey, "__lexicon_null" + _numStr, _replaceChrStart + _numStr + _replaceChrEnd);	
							_args[_ii] = string_replace(_args[_ii], "__lexicon_null", _replaceChrStart) + _replaceChrEnd;
						}
						_sepPos = _nextPos + _sepLen;
						_nextPos = string_pos_ext(",", _argStr, _sepPos);
						++_ii;
					}
					var _strArg = string_copy(_argStr, _sepPos, _argStrLen);
					_args[_ii] = string_copy(_argStr, _sepPos, _argStrLen);
					if (string_count("__lexicon_null", _args[_ii]) > 0) {
						var _numStr = string_digits(_args[_ii]);
						_strKey = string_replace(_strKey, "__lexicon_null" + _numStr, _replaceChrStart + _numStr + _replaceChrEnd);	
						_args[_ii] = string_replace(_args[_ii], "__lexicon_null", _replaceChrStart) + _replaceChrEnd;
					}
					//_args[_ii] = string_copy(_argStr, _sepPos, _argStrLen);
					_strKeyStripped = string_copy(_strKey, 1, string_pos(",", _strKey)-_sepLen);
				}
				   
				   //	if (string_count("#", _strKey) > 0) {
					//		if (string_delete(_strKey, string_pos("#", _strKey), string_length(_strKey)) == "self") {
					//			_target = self;	
					//			_strKey = string_delete(_strKey, 1, string_pos("#", _strKey));
					//		}
				   //	}
				   
					var _iii = 0;
					var _alreadyPushed = false;
                       if (_dynamicArray != undefined) {
					    repeat(array_length(_dynamicArray)) {
					    	if (_dynamicArray[_iii][2] == _strKey) {
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
					if (variable_struct_exists(_global.dynamicMap, _strKeyStripped)) {
						var _callback = _global.dynamicMap[$ _strKeyStripped];
						if (_callback[1]) {
							if (_dynamicArray == undefined) _dynamicArray = [];
							_lexiconTextCache.isDynamic = true;
							array_push(_dynamicArray, [_strKeyStripped, undefined, _strKey, _args]);
						} else {
							_newStr = string_replace_all(_newStr, _replaceChrStart + _strKey + _replaceChrEnd, __lexicon_resolve_dynamic(_strKeyStripped, _args)); 
						}
					} else {
						_ii = 1;
						repeat(argument_count-1) {
						if (!is_struct(argument[_ii])) {
							++_ii;
							continue;
						}
							
						if (_target == undefined) && (variable_struct_exists(argument[_ii], _strKeyStripped)) {
							_lexiconTextCache.isDynamic = true;
							var _iii = 0;
							var _weakref = undefined;
							var _currentStruct = argument[_ii];
							if (_dynamicArray == undefined) _dynamicArray = [];
							repeat(array_length(_dynamicArray)) {
								var _entry = _dynamicArray[_iii][1];
								if (_entry != undefined && weak_ref_alive(_entry) && _entry.ref == _currentStruct) {
									_weakref = _entry;
									break;
								}
								++_iii;
							}
							if (_weakref == undefined) _weakref = weak_ref_create(argument[_ii]);
							array_push(_dynamicArray, [_strKeyStripped, _weakref, _strKey, /*_hashAvailable ? variable_get_hash(_strKey) :*/ _args]);
							++_ii;
							break;
						}
						
						if (variable_struct_exists(self, _strKeyStripped)) {
							_lexiconTextCache.isDynamic = true;
							var _iii = 0;
							var _weakref = undefined;
							var _currentStruct = self;
							if (_dynamicArray == undefined) _dynamicArray = [];
							repeat(array_length(_dynamicArray)) {
								var _entry = _dynamicArray[_iii][1];
								if (_entry != undefined && weak_ref_alive(_entry) && _entry.ref == _currentStruct) {
									_weakref = _entry;
									break;
								}
								++_iii;
							}
							if (_weakref == undefined) _weakref = weak_ref_create(self);
							array_push(_dynamicArray, [_strKeyStripped, _weakref, _strKey, /*_hashAvailable ? variable_get_hash(_strKey) : undefined*/ _args]);
							++_ii;
							break;
						}
						++_ii;
					}
				}
				_posStart++;
				_posEnd++;
			}
			
		}
		
		_i = 0;
		repeat(string_count("__lexicon_null", _newStr)) {
			if (string_count("__lexicon_null", _newStr) == 0) break;
			if (string_count("__lexicon_null" + string(_i), _newStr) == 0) {
				while((string_count("__lexicon_null" + string(_i), _newStr) == 0)) {
					++_i;
				}
			}
			_newStr = string_replace_all(_newStr, "__lexicon_null" + string(_i), _replaceChrStart + string(_i) + _replaceChrEnd);
			++_i;
		}
	
		// Store current string contents
         _lexiconTextCache.str = _newStr;

		_lexiconTextCache.dynamicArray = _dynamicArray;
		_lexiconTextCache.isCompiled = true;
	} else {
        var _newStr = _lexiconTextCache.str;	
        
        if (_lexiconTextCache.isDynamic) {
		    var _dynamicArray = _lexiconTextCache.dynamicArray;
	    } else {
            return _newStr;   
        }
    }
	
	if (_dynamicArray != undefined) {
		_i = 0;
		repeat(array_length(_dynamicArray)) {
			var _entry = _dynamicArray[_i];
			var _strKey = _entry[2];
			var _strKeyStripped = _entry[0];
			var _id = _entry[1];
			if (_id == undefined) {
				_newStr = string_replace_all(_newStr, _replaceChrStart + _strKey + _replaceChrEnd, __lexicon_resolve_dynamic(_strKeyStripped, _entry[3]));
			} else if (weak_ref_alive(_id)) {
				if (variable_struct_exists(_id.ref, _strKeyStripped)) {
					_newStr = string_replace_all(_newStr, _replaceChrStart + _strKey + _replaceChrEnd, /*_hashAvailable ? struct_get_from_hash(_id.ref, _entry[2]) :*/ _id.ref[$ _strKeyStripped]);
				}
			}
			++_i;
		}
	}
	
	if (!__LEXICON_UPDATE_DYNAMIC_VALUES) {
		_lexiconTextCache.isDynamic = false;	
		_lexiconTextCache.str = _newStr;
	}
	
	return _newStr;
}
