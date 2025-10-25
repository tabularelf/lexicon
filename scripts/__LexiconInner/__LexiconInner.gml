/// @ignore
/// @return {Struct.__LexiconTextElementClass}
function __LexiconInner(_key, _args = undefined) {
	static _entries = __LexiconSystem().__entries;
	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;

	if (_key == "") return undefined;

	var _entry = __LexiconGetEntry(_key);
	var _element = new __LexiconTextElementClass(_entry, _key, _args);
	
	__LexiconCallbackFire(LexiconCallbackType.TEXT_ELEMENT_CREATED, _element);

	return _element;
}