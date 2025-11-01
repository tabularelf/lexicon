// feather ignore all
/// @ignore
function __LexiconUnicInteger(_num) {
	static _inst = __LexiconUnicSystem();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());
	var _numReal;
	
	try {
		_numReal = is_real(_num) ? _num: real(_num);
	} catch(_) {
		_numReal = NaN;
	}

	return UnicInteger(_numReal, _locale);
}