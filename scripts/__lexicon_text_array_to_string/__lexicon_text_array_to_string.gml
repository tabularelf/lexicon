/// @ignore
function __lexicon_text_array_to_string(_textName, _textArray) {
	static _global = __lexicon_init();
	gml_pragma("forceinline");
	var _arrayNames = array_create(array_length(_textArray), "");
	_global.textEntriesArray[$ _textName] = _arrayNames;
	var _i = 0;
	repeat(array_length(_textArray)) {
		var _textKey = _textName + string(_i);
		_arrayNames[_i] = _textKey;
		var _value = _textArray[_i];
		if ((!is_struct(_value)) && (!is_array(_value))) {
			if ((!__LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(__LEXICON_STRUCT.textEntries, _textKey))) continue;
			__LEXICON_STRUCT.textEntries[$ _textKey] = _value;
		}
		++_i;
	}
}