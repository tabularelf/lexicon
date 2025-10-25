// feather ignore all
/// @ignore
/// @return {Any}
function __LexiconGetLocale(_locale = LexiconGetOSLocale(), _looseSearch = false) {
	static _loadedLanguage = __LexiconSystem().__languages;
	static _ctx = {
		locale: undefined,
		pos: -1,
	};

	static _find = method(_ctx, function(_elm, _index) {
		//if (is_array(_elm.GetLocale())) {
		//	var _i = 0;
		//	repeat(array_length(_elm.locale)) {
		//		if (_elm.locale[_i] == locale) {
		//			return true;
		//		}
		//		++_i;
		//	}
		//	return false;
		//}
		return _elm.GetLocale() == locale;
	});

	static _findLoose = method(_ctx, function(_elm, _index) {
		//if (is_array(_elm.GetLocale())) {
		//	var _i = 0;
		//	repeat(array_length(_elm.locale)) {
		//		if ((pos > 0) ? string_starts_with(_elm.locale[_i], string_copy(locale, 1, pos-1)) : 
		//			string_starts_with(_elm.locale[_i], locale)) {
		//				return true;
		//		}
		//		++_i;
		//	}
		//	return false;
		//}
		return (pos > 0) ? string_starts_with(_elm.GetLocale(), string_copy(locale, 1, pos-1)) : string_starts_with(_elm.GetLocale(), locale);
	});

	_ctx.locale = _locale;
	var _pos = array_find_index(_loadedLanguage, _find);
	if (_pos == -1) && (_looseSearch) {
		_ctx.pos = string_pos("_", _locale);
		_pos = array_find_index(_loadedLanguage, _findLoose);
	}	

	return (_pos != -1) ? _loadedLanguage[@ _pos] : undefined;
}