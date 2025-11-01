function __LexiconUniqueSystem() { 
	static _inst = {
		__LexiconCache: {},
	};

	return _inst;
}

if (debug_mode) {
	global.__LexiconUniqueSystem = __LexiconUniqueSystem();
}

#macro __LEXICON_UNIQUE_LINE__ ("Unique"+ "_" + _GMFILE_ + "_" + _GMFUNCTION_ + "_" + string(_GMLINE_))
#macro LexiconUnique (__LexiconUnique(variable_get_hash(__LEXICON_UNIQUE_LINE__)).callback)