/// @ignore
/// feather ignore all
#macro LEXICON_FILE_TYPES global.__lexiconFileTypes 

LEXICON_FILE_TYPES = {
		json: {
			parser: __lexicon_parse_json,
			adder: lexicon_index_add_json
		},
		csv: {
			parser: __lexicon_parse_csv,
			adder: lexicon_index_add_csv
		}
}