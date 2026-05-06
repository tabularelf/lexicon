// feather ignore all
/// @ignore
function __LexiconDefaultPlugInDefine() {
	LexiconPlugInDefine("Lexicon", "TabularElf", "1.0", "4.1", function() {
		if (__LEXICON_VERBOSE) {
			LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_CREATED, undefined, function(_text, _key) {
				__LexiconTrace($"New entry registered! \"{_key}\" with typeof \"{typeof(_text)}\"!")
				return _text;
			});

			LexiconPlugInRegisterCallback(LexiconCallbackType.ENTRY_UPDATE, undefined, function(_text, _key) {
				__LexiconTrace($"Entry updated! \"{_key}\" entry length: {string_length(_text)}")
				return _text;
			});

			LexiconPlugInRegisterCallback(LexiconCallbackType.LANGUAGE_UPDATE, undefined, function(_oldLang, _newLang) {
				__LexiconTrace($"Language updated from \"{_oldLang}\" to \"{_newLang}\"");
			});
		}

		LexiconPlugInRegisterCallback(LexiconCallbackType.LANGUAGE_UPDATE, undefined, function(_oldLang, _newLang) {
			static _global = __LexiconUnicSystem();
			if (_oldLang == _newLang) return;
			
			_global.language = _newLang;
			if (UnicLocaleExists(_newLang.GetLocale())) { 
				_global.locale = _newLang.GetLocale();
				return;
			}
        
			
			var _fallbacks = _newLang.GetFallbacks();
			for(var _i = 0; _i < array_length(_fallbacks); ++_i) {
				if (UnicLocaleExists(_fallbacks[_i])) {
					_global.locale = _fallbacks[_i];
					return;
				}
			}
               
        	var _fallback = LexiconLanguageGet(LexiconGlobalFallbackGet());
			if (LexiconIsLanguage(_fallback)) && (UnicLocaleExists(_fallback.GetLocale())) {
				_global.locale = _fallback.GetLocale();
				return;
			}
               
			var _pos = string_pos("_", _newLang.GetLocale());
			if (_pos > 0) {
				_global.locale = string_copy(_newLang.GetLocale(), 1, _pos-1);
			}
		});
	});
}
__LexiconDefaultPlugInDefine();