// feather ignore all
LexiconPlugInDefine("Lexicon.ForceAdd", "TabularElf", "1.0", "4.0", function() {
	if (__LEXICON_FORCE_ENTRY_ENABLED) {
		LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_CREATED, undefined, function(_text, _key) {
			static _entries = __LexiconForceAddSystem();
			array_push(_entries, _key);
			if (!LexiconLanguageIsLoaded(LexiconLanguageGetCurrent())) {
				return _text;
			}

			return _text ?? _key;
		});

		LexiconPlugInRegisterCallback(LexiconCallbackType.LANGUAGE_POST_UPDATE, undefined, function(_newLang) {
			with({_newLang}) {
				array_foreach(__LexiconForceAddSystem(), function(_elm) {
						LexiconPlugInAddEntry(_elm, _elm, _newLang);
				});
			}
		});
    	
		LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_COLLECT, undefined, function(_text, _key) {
			return _text ?? _key;
		});
	}
});

function __LexiconForceAddSystem() {
	static _entries = [];
	return _entries;
}