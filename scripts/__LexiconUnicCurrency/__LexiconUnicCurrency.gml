// feather ignore all
/// @ignore
function __LexiconUnicCurrency(_num, _places = "2", _symbol = "$") {
	static _inst = __LexiconUnicSystem();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());

	try {
		_num = is_real(_num) ? _num: real(_num);
		_places = real(_places);
	} catch(_) {
		_num = NaN;
		_places = 2;
	}

	return UnicCurrency(_symbol, _num, _places, _locale);
}