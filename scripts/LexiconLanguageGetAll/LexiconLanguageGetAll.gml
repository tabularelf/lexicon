// feather ignore all
/// @return {Array<Struct.__LexiconLanguageClass>}
function LexiconLanguageGetAll(_sort = true) {
	static _languages = __LexiconSystem().__languages;
	var _result = variable_clone(_languages, 0);
	if (_sort) {
		array_sort(_result, function(_elm1, _elm2) {
			return _elm1.GetLocale() > _elm2.GetLocale();
		});
	}

	return _result;
}