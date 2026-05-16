// feather ignore all
/// @ignore
/// @return {Struct.__LexiconParserClass}
function __LexiconGetParser(_ext){
	static _systemParsers = __LexiconSystem().__systemParsers;
	static _parsers = __LexiconSystem().__parsers;
	return _parsers[$ string_lower(_ext)] ?? _systemParsers[$ string_lower(_ext)]
}