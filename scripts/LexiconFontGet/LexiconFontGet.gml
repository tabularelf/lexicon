// feather ignore all
/// @param {String} fontDirectory
/// @param {Function | Undefined} searchCallback
/// @param {Bool} searchAllFonts
/// @param {Struct.__LexiconLanguageClass} language
/// @return {Asset.GMFont}
function LexiconFontGet(_fontDir, _searchCallback = undefined, _searchAllFontsIfFailed = false, _lang = LexiconLanguageGetCurrent()) {
	static _global = __LexiconSystem();
	static _cacheLang = __LexiconLanguageDummy();
	static _cacheFont = undefined;
	static _firstTime = false;
	if (!LexiconLanguageIsLoaded()) {
		return draw_get_font();
	}
;
	var _font = _lang.GetFont(_fontDir);
	if (is_undefined(_font)) {
			if (_global.__forceResetFontCache) || 
				(LexiconLanguageIsLoaded() && ((_lang != _cacheLang)) || is_undefined(_cacheFont)) {
				// Search possible alternatives
				if (is_callable(_searchCallback)) {
					var _names = struct_get_names(_lang.__fonts);
					for(var _i = struct_names_count(_lang.__fonts)-1; _i > 0; --_i) {
						if (_searchCallback(_lang.__fonts[_names[_i]])) {
							_font = _lang.__fonts[_names[_i]];
							break;
						}
					}
				}

				if (_searchAllFontsIfFailed) && (is_undefined(_font)) && (is_callable(_searchCallback)) {
					var _fonts = asset_get_ids(asset_font);
					var _index = array_find_index(_fonts, _searchCallback);
					if (_index != -1) {
						_font = _fonts[_index];
					}
				}

				if (__LEXICON_ENABLE_APPROXIMATE_FONT_SEARCH) && (is_undefined(_font)) {
					_cacheFont = __LexiconUnicGetApproximateFont();
				} else {
					_cacheFont = _font;
				}
				_cacheLang = _lang;

				_global.__forceResetFontCache = false;
			}
        	
			return _cacheFont ?? __LEXICON_DEFAULT_FONT;
	}

	return _font ?? __LEXICON_DEFAULT_FONT;
}