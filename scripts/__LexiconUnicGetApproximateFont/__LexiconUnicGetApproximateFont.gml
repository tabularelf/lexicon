// feather ignore all
/// @ignore
function __LexiconUnicGetApproximateFont(_fonts = undefined) {
	static _ranges = [];
	//static _defaultFonts = __LexiconUnicFontsDatabase();
	var _entryNames = LexiconPlugInGetAllEntriesNames();
	var _i = 0;
	var _str = "";
	repeat(array_length(_entryNames)) {
		var _entryText = LexiconPlugInGetEntry(_entryNames[_i]);
		if (!is_undefined(_entryText)) {
			var _text = _entryText.GetText();
			if (!is_undefined(_text)) {
				_str += _text;
			}
		}
		++_i;
	}
	UnicBlockGetRangesExt(_ranges, _str);
	_fonts ??= asset_get_ids(asset_font);
	_fonts = is_array(_fonts) ? _fonts : [_fonts];
	var _lenFonts = array_length(_fonts);
	var _lenRanges = array_length(_ranges);
	var _validFont = undefined;
	var _bestFontScore = -1;
	for(var _i = 0; _i < _lenFonts; ++_i) {
		var _rangeSupported = true;
		if (string_starts_with(font_get_name(_fonts[_i]), "__newfont")) {
			continue;
		}
		var _fontScore = 0;
		var _first = font_get_first(_fonts[_i]);
		var _last = font_get_last(_fonts[_i]);
		var _name = font_get_name(_fonts[_i]);

		for(var _j = 0; _j < _lenRanges; ++_j) {
			var _min = _ranges[_j].min;
			_min = _min < 32 ? 32 : _min;
			var _max = _ranges[_j].max;
			if ((_first <= _max && _last >= _min)) {
				_fontScore++;
			} else {
				_rangeSupported = false;
			}
		}
		
		if (_fontScore > _bestFontScore) {
			_validFont = _fonts[_i];
			_bestFontScore = _fontScore;
		} 

		if (_rangeSupported) {
			break;
		}
	}
	array_resize(_ranges, 0);
	return _validFont;
}