function __lexicon_text_struct_to_string(_textName, _textStruct) {
	gml_pragma("forceinline");
	var _i = 0;
	var _textArray = variable_struct_get_names(_textStruct);
	repeat(array_length(_textArray)) {
		if (is_struct(_textStruct[$ _textArray[_i]])) {
			__lexicon_text_struct_to_string(_textArray[_i], _textStruct[$ _textArray[_i]]);
		} else {
			__LEXICON_STRUCT.textEntries[$ _textName + LEXICON_TEXT_JSON_BREAK + _textArray[_i]] = _textStruct[$ _textArray[_i]];	
		}
		++_i;
	}
}