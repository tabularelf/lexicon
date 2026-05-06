LexiconPlugInDefine("ElementChangeTest", "TabularElf", "1.0", "4.1", function() {
	LexiconPlugInRegisterCallback(LexiconCallbackType.TEXT_ELEMENT_KEY_UPDATED, undefined, function(_key, _element) {
		if (!LexiconEntryIsLoaded(_key)) {
			show_debug_message($"{_key} is null!");
			_element.SetKey("foo.bar");
		}
		
	});
});