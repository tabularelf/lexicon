#macro LEXICON_FILE_TYPES global.__lexiconFileTypes 

LEXICON_FILE_TYPES = {
		json: {
			parser: lexicon_parse_json,
			adder: lexicon_index_add_json
		},
		csv: {
			parser: lexicon_parse_csv,
			adder: undefined
		}
}