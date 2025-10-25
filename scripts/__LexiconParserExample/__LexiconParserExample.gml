// feather ignore all
LexiconPlugInDefine("Lexicon.ParserExample", "TabularElf", "1.0", "4.0", function() {
	LexiconPlugInSetParser("txt", function(_buff, _filepath, _lang) {
		var _text = buffer_read(_buff, buffer_text);
		_text = string_split_ext(_text, ["\n", "\r"], true);
		var _len = array_length(_text);
		for(var _i = 0; _i < _len; _i++) {
			var _textEntry = string_split(_text[_i], "=", false, 1);
			if (array_length(_textEntry) > 1) {
				var _textResult = _textEntry[1] != "" ? _textEntry[1] : undefined;
				LexiconPlugInAddEntry(_textEntry[0], _textResult, _lang);
			}
		}
	});
});