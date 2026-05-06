// feather ignore all
LexiconPlugInDefine("Lexicon.UndoUnicode", "TabularElf", "1.0", "4.1", function() {
	LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_UPDATE, undefined, function(_text) {
		_text = string_replace_all(_text, chr(0x2026), "..."); // ellipsis …
		_text = string_replace_all(_text, chr(0x2013), "-"); // En dash –
		_text = string_replace_all(_text, chr(0x2014), "-"); // Em dash —
		_text = string_replace_all(_text, chr(0x2015), "-"); // Horizontal bar ―
		_text = string_replace_all(_text, chr(0x2018), "'"); // Start Single Quote ‘
		_text = string_replace_all(_text, chr(0x2019), "'"); // End Single Quotee ’
		_text = string_replace_all(_text, chr(0x201C), "\""); // Start Double Quote “
		_text = string_replace_all(_text, chr(0x201D), "\""); // End Double Quote ”
		_text = string_replace_all(_text, chr(0x201E), "\""); // Low Double Quote „
		_text = string_replace_all(_text, chr(0x201F), "\""); // High Double Quote ‟
		_text = string_replace_all(_text, chr(0x037E), ";"); // Greek question mark ;
		return _text;
	});
});