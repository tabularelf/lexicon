// feather ignore all
/// @ignore
function __LexiconEntryClass(_entry, _language = __LexiconLanguageDummy(), _skipCallbacks = false) constructor {
	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;
	static _ctx = {
		entry: undefined,
		text: undefined,
	};

	static _callback = method(_ctx, function(_elm) {
		text = _elm.callback(text, entry);
	});
	
	
	_ctx.entry = _entry;
	if (!_skipCallbacks) {
		array_foreach(_plugInCallbacks[LexiconCallbackType.ENTRY_CREATED], _callback);	
	}

	__entry = _ctx.entry;
	__text = (is_string(_ctx.text) || is_undefined(_ctx.text)) ? _ctx.text : string(_ctx.text);
	__language = _language;
	__variations = undefined;
	__isStatic = is_string(__text) ? string_pos("{", __text == 0) || string_pos("}", __text == 0) : true;

	_ctx.entry = undefined;
	_ctx.text = undefined;

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
}