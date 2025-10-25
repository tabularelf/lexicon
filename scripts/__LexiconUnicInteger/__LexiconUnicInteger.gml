// feather ignore all
/// @ignore
function __LexiconUnicInteger(_num) {
	static _inst = __LexiconUnicSystem();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());

	try {
		_num = is_real(_num) ? _num: real(_num);
	} catch(_) {
		_num = NaN;
	}

	return UnicInteger(_num, _locale);
}