// feather ignore all
/// @param {String | Struct.__LexiconEntryClass} key 
/// @param {String | Undefined} text
/// @param {Struct.__LexiconLanguageClass} languageInstance
function LexiconPlugInSetEntry(_entry, _text, _language) {
	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;
	static _ctx = {
		text: undefined,
		entry: undefined,
	};

	static _update = method(_ctx, function(_elm, _index) {
		text = _elm.callback(text, entry);
	});

	static _collect = method(_ctx, function(_elm, _index) {
		text = _elm.callback(text, entry);
	});

	_entry = LexiconIsEntry(_entry) ? _entry : __LexiconGetEntry(_entry);

	var _textFinal = is_string(_text) || is_undefined(_text) ? _text : string(_text);
	_ctx.text = _textFinal;
	_ctx.entry = _entry.__entry;
	array_foreach(_plugInCallbacks[LexiconCallbackType.ENTRY_COLLECT], _collect);
	if (!is_undefined(_ctx.text)) {
		array_foreach(_plugInCallbacks[LexiconCallbackType.ENTRY_UPDATE], _update);
	}
	_entry.__text = (is_string(_ctx.text) || is_undefined(_ctx.text)) ? _ctx.text : string(_ctx.text);
	_entry.__isStatic = is_string(_ctx.text) ? string_pos("{", _ctx.text == 0) || string_pos("}", _ctx.text == 0) : false;
	_entry.__language = _language;

	_ctx.text = undefined;
	_ctx.entry = undefined;
}