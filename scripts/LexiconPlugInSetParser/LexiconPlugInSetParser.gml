// feather ignore all
/// @param {String} extension
/// @param {Function} parser
/// @param {Function, Undefined} declare_parser
function LexiconPlugInSetParser(_ext, _parser, _declareParser = undefined) {
	static _parsers = __LexiconParsersDatabase();
	
	_parsers[$ string_lower(string_trim(_ext))] = new __LexiconParserClass(string_trim(_ext), _parser, _declareParser);
}