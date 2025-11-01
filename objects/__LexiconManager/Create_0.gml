filesList = [];

__LexiconManagerCleanUp = function(_runPostUpdate = true) {
	static _global = __LexiconSystem();
	// ┏━┓┏━╸┏━┓╺┳┓   ╺┳╸╻ ╻╻┏━┓   ┏━╸╻┏━┓┏━┓╺┳╸
	// ┣┳┛┣╸ ┣━┫ ┃┃    ┃ ┣━┫┃┗━┓   ┣╸ ┃┣┳┛┗━┓ ┃ 
	// ╹┗╸┗━╸╹ ╹╺┻┛    ╹ ╹ ╹╹┗━┛   ╹  ╹╹┗╸┗━┛ ╹ 
    // If you have received an error involving __LexiconManager, and you think this is the cause, 
	// you are on the wrong path. Turn back, read the error message clearly and look at other places.
	// This is here to intentionally clean up the manager when it is not needed.
	// If you are 110% certain that this is failing for some reason, please reproduce this in a sample project.
	// Then inform TabularElf with the sample project.
	time_source_stop(_global.__asyncTs);
	__canDestroy = true;
	_global.__languageLoaded = true;
	if (_runPostUpdate) __LexiconCallbackFire(LexiconCallbackType.LANGUAGE_POST_UPDATE, _global.__mainLanguage);
	instance_destroy();
}

hasSorted = false;