function LexiconLanguageGetLoaded() {
	static _languages = __LexiconSystem().__languages;
	return array_filter(_languages, function(_elm) {
		return _elm.IsLoaded();
	});
}