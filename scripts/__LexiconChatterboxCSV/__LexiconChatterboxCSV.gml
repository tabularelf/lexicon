function __LexiconChatterboxCSVPaser(_buff, _file, _lang) {
	var _grid = __LexiconArray2DFromCsv(buffer_read(_buff, buffer_text), ",", "\"");
	var _height = array_length(_grid[0]);
	
	for(var _i = 3; _i < _height; ++_i) {
		var _length = array_length(_grid[_i])-1;
		if (_length < 5) continue;
		var _text = _grid[_i][5];
		if (_text == "") continue;
		var _key = _grid[_i][3];
		LexiconPlugInAddEntry(_key, _text, _lang);	
	}
}

//LexiconPlugInSetParser("csv", __LexiconChatterboxCSVPaser, undefined);