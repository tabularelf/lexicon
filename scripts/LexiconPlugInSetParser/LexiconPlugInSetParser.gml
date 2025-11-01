// feather ignore all
/// @param {String} extension
/// @param {Function} parser
/// @param {Function, Undefined} declare_parser
function LexiconPlugInSetParser(_ext, _parser, _declareParser = undefined) {
	static _parsers = __LexiconSystemParsers();
	
	_parsers[$ string_lower(_ext)] = new __LexiconParserClass(_ext, _parser, _declareParser);
}