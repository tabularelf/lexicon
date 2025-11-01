// feather ignore all
LexiconPlugInDefine("Lexicon.ReplaceNewlines", "TabularElf", "1.0", "4.0", function() {
	LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_UPDATE, undefined, function(_text) {
		_text = string_replace_all(_text, "\\r", "\r");
		_text = string_replace_all(_text, "\\n", "\n");
		return _text;
	});

	LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_CREATED, 1, function(_text) {
		if (is_string(_text)) {
			_text = string_replace_all(_text, "\\r", "\r");
			_text = string_replace_all(_text, "\\n", "\n");
		}

		return _text;
	});
});