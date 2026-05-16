// feather ignore all
/// @ignore
function __LexiconSystemParsers() {
	static _inst = undefined;
	if (is_struct(_inst)) return _inst;
	
	_inst = {};
	_inst[$ "json"] = new __LexiconParserClass("json", __LexiconParserJSON, __LexiconDeclareParserJson);
	_inst[$ "csv"] = new __LexiconParserClass("csv", __LexiconParserCsv, __LexiconDeclareParserCsv);

	return _inst;
}