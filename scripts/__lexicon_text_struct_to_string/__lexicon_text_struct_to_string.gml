/// @ignore
function __lexicon_text_struct_to_string(_textName, _textStruct) {
	gml_pragma("forceinline");
	var _i = 0;
	var _textArray = variable_struct_get_names(_textStruct);
	repeat(array_length(_textArray)) {
		var _textKey = _textName + __LEXICON_TEXT_JSON_BREAK + _textArray[_i];
		if (is_struct(_textStruct[$ _textArray[_i]])) {
			__lexicon_text_struct_to_string(_textKey, _textStruct[$ _textArray[_i]]);
		} else if (is_array(_textStruct[$ _textArray[_i]])) {
			__lexicon_text_array_to_string(_textKey, _textStruct[$ _textArray[_i]]);
		} else {
			if ((!__LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(__LEXICON_STRUCT.textEntries, _textKey))) continue;
			__LEXICON_STRUCT.textEntries[$ _textKey] = _textStruct[$ _textArray[_i]];
		}
		++_i;
	}
}