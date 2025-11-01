/// @ignore
/// @return {Struct.__LexiconTextElementClass}
function __LexiconInner(_entry, _key, _args = undefined) {
	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;

	var _element = new __LexiconTextElementClass(_entry, _key, _args);
	
	__LexiconCallbackFire(LexiconCallbackType.TEXT_ELEMENT_CREATED, _element);

	return _element;
}