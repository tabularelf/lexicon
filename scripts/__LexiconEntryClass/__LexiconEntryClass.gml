// feather ignore all
/// @ignore
function __LexiconEntryClass(_entry, _language = __LexiconLanguageDummy()) constructor {
	__entry = _entry;
	__text = undefined;
	__language = _language;
	__variations = undefined;
	__isStatic = false;

	static GetText = function() {
		return __text;
	}

	static GetLanguage = function() {
		return __language;
	}

	static GetVariations = function() {
		return __variations;
	}

	static GetKey = function() {
		return __entry;
	}

	static toString = function() {
		return "Lexicon Entry Class: " + __entry;
	};
}