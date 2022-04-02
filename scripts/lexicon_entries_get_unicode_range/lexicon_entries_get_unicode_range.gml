
function lexicon_entries_get_unicode_range(_forceUpdate = false) {
	static _cacheResult = undefined;
	static _cacheLocale = "";
	static _cacheLanguage = "";
	static _blacklist = undefined;
	
	if (_forceUpdate == false) && ((__LEXICON_STRUCT.cacheUpdate == false) && (_cacheLocale == __LEXICON_STRUCT.locale) && (_cacheLanguage == __LEXICON_STRUCT.language)) { 
		return _cacheResult;
	}
	
	if (_blacklist == undefined) {
		_blacklist = ds_list_create();	
		ds_list_add(_blacklist, 0xA, 0xD);
	}
	
	var _strBuffer = buffer_create(1, buffer_fixed, 1);
	var _textEntries = __LEXICON_STRUCT.textEntries;
	var _keys = variable_struct_get_names(_textEntries);
	var _ii = 0;
	var _str = "";
	var _isEmpty = true;
	var _lookup = ds_list_create();
	
	var _i = 32;
	repeat(127-31) {
		ds_list_add(_lookup, _i++);
	}
	
	repeat(array_length(_keys)) {
		_isEmpty = false;
		_str = _textEntries[$ _keys[_ii++]];
		buffer_resize(_strBuffer, string_byte_length(_str));
		buffer_poke(_strBuffer, 0, buffer_text, _str);
		var _size = buffer_get_size(_strBuffer);
		// Add a few to the list to block
		//var _highestByte = 0;
		//var _lowestByte = 0xFFFFFFFF;
		while(buffer_tell(_strBuffer) < _size) {
			var _num = __lexicon_buffer_read_utf8(_strBuffer);
			if (ds_list_find_index(_lookup, _num) == -1) && (ds_list_find_index(_blacklist, _num) == -1) {
				//_lookup[? _num] = true;
				ds_list_add(_lookup, _num);
				/*if (_num < _lowestByte) {
					_lowestByte = _num;	
				} 
				
				if (_num > _highestByte) {
					_highestByte = _num;
				}*/
			}
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
		_cacheResult = _array;
		_cacheLocale = __LEXICON_STRUCT.locale;
		_cacheLanguage = __LEXICON_STRUCT.language;
		ds_list_destroy(_lookup);
		__LEXICON_STRUCT.cacheUpdate = false;
	}
	return _array;
}
function __lexicon_unicode_ranges_singleton() {
	static __instance = undefined;
	if (__instance == undefined) {
		__instance = {};
		with(__instance) {
			unicodeRangeArray = [
				[0x20, 0x7F], // basic_latin
				[0x80, 0xFF], // latin-1 supplement
				[0x100, 0x17F], // latin extended a
				[0x180, 0x24F], // latin extended b
				[0x250, 0x2AF], // ipa extensions
				[0x2B0, 0x2FF], // spacing modifier letters
				[0x300, 0x36F], // combining diacritical marks,
				[0x370, 0x3FF], // Greek and Coptic
				[0x400, 0x4FF], // Cryillic
				[0x500, 0x52F], // Cryillic Supplement
				[0x530, 0x58F], // Armenian
				[0x590, 0x5FF], // Hebrew
				[0x600, 0x6FF], // Arabic
				[0x700, 0x74F], // Syriac
				[0x780, 0x7BF], //Thaana
				[0x900, 0x97F], // Devanagari
				[0x980, 0x9FF], // Bengali
				
				// CJK
				[0x2E80, 0x2EFF], // CJK Radicals Supplement
				[0x3000, 0x303F], // CJK Symbols and Punctuation
				[0x3200, 0x32FF], // Enclosed CJK Letters and Months
				[0x3300, 0x33FF], // CJK Compatibility
				[0x4E00, 0x9FFF], // CJK Unified Ideographs
				[0x3400, 0x3439], // CJK Unified Ideographs Extension A
				[0x20000, 0x2004D], // CJK Unified Ideographs Extension B
				[0x2A700, 0x2A74F], // CJK Unified Ideographs Extension C
				[0x2B740, 0x2B78F], // CJK Unified Ideographs Extension D
				[0x2B820, 0x2B86F], // CJK Unified Ideographs Extension E
				[0x2CEB0, 0x2CEFF], // CJK Unified Ideographs Extension F
				[0x30000, 0x3004F], // CJK Unified Ideographs Extension G
				[0x30A0, 0x30FF], // Katakana
				[0x3040, 0x309F], // Hiragana
			];
		}
	}
	
	return __instance;
}



