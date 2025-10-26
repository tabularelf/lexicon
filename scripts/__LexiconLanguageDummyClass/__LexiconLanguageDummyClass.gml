// feather ignore all
/// @ignore
function __LexiconLanguageDummyClass(_language, _locale) constructor {
	/// @ignore
	static __NULLFUNC__ = function() {
		__LexiconError("A language was not set. Please set the language via \"LexiconLanguageSet()\"!");		
	};

	__language = _language;
	__locale = _locale;
	__fallbacks = undefined;
	__files = undefined;
	__remapAsset = undefined;
	__fonts = undefined;
	__loaded = false;

	static IsLoaded = __NULLFUNC__;
	static AddFile = __NULLFUNC__;
	static AddFileExt = __NULLFUNC__;
	static RemoveFile = __NULLFUNC__;
	static ClearFiles = __NULLFUNC__;
	static ClearFallbacks = __NULLFUNC__;
	static GetFiles = __NULLFUNC__;
	static GetFallbacks = __NULLFUNC__;
	static AddFallback = __NULLFUNC__;
	static AddFallbackExt = __NULLFUNC__;
	static SetFont = __NULLFUNC__;
	static GetFont = __NULLFUNC__;
	static AddRemapAsset = __NULLFUNC__;
	static SetRemapAsset = __NULLFUNC__;
	static GetRemapAsset = __NULLFUNC__;
	static HasFallback = __NULLFUNC__;
}