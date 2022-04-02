
function lexicon_text_get_unicode_range(_text) {
	static _blacklist = undefined;
	
	if (_blacklist == undefined) {
		_blacklist = ds_list_create();	
		ds_list_add(_blacklist, 0xA, 0xD);
	}
	
	var _strBuffer = buffer_create(1, buffer_fixed, 1);
	var _str = _text;
	var _isEmpty = false
	_lookup = ds_list_create();
	
	var _i = 32;
	repeat(127-31) {
		ds_list_add(_lookup, _i++);
	}
	
	buffer_resize(_strBuffer, string_byte_length(_str));
	buffer_poke(_strBuffer, 0, buffer_text, _str);
	var _size = buffer_get_size(_strBuffer);
	// Add a few to the list to block
	//var _highestByte = 0;
	//var _lowestByte = 0xFFFFFFFF;
	while(buffer_tell(_strBuffer) < _size) {
		var _num = __lexicon_buffer_read_utf8(_strBuffer);
		if (ds_list_find_index(_lookup, _num) == -1) && (ds_list_find_index(_blacklist, _num) == -1) {
			ds_list_add(_lookup, _num);
		}
	}
	
	var _list = _lookup;
	
	var _unicodeRangeArray = __lexicon_unicode_ranges_singleton().unicodeRangeArray;
	
	var _array = [[32, 127]];
	if (ds_list_size(_lookup) > 0) && (_isEmpty == false) {
		ds_list_sort(_lookup, true);
		var _lowestValue = ds_list_find_index(_lookup, 127);
		/*if (_lowestValue < ds_list_size(_lookup)-1) {
			_lowestByte = _lookup[| _lowestValue+1];
			_highestByte = _lookup[| ds_list_size(_lookup)-1];
			array_push(_array, [_lowestByte, _highestByte]);
		}*/
		var _i = _lowestValue+1;
		repeat(ds_list_size(_lookup)-_lowestValue+1) {
			var _value = _lookup[| _i++];
			var _exists = false;
			var _ii = 0;
			repeat(array_length(_array)) {
				if (_value >= _array[_ii][0]) && ( _value <= _array[_ii][1]) {
					_exists = true;
					break;
				}
				++_ii;
			}
			_ii = 0;
			if (!_exists) {
				repeat(array_length(_unicodeRangeArray)) {
					if (_value >= _unicodeRangeArray[_ii][0]) && ( _value <= _unicodeRangeArray[_ii][1]) {
						array_push(_array, _unicodeRangeArray[_ii]);
						break;
					}
					++_ii;
				}	
			}
			++_i;
			//_result += chr(_lookup[| _i++]);	
		}
		buffer_delete(_strBuffer);
		ds_list_destroy(_lookup);
	}
	return _array;
}


