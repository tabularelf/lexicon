// feather ignore all
/// @ignore
/// @param {String} language
/// @return {Any}
function __LexiconGetLanguage(_lang) {
	static _loadedLanguage = __LexiconSystem().__languages;
	static _ctx = {
		language: undefined,
	};

	static _find = method(_ctx, function(_elm, _index) {
		return _elm.GetLanguage() == language;
	});

	_ctx.language = _lang;
	var _pos = array_find_index(_loadedLanguage, _find);
	return (_pos != -1) ? _loadedLanguage[@ _pos] : undefined;
}