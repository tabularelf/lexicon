# Lexicon Configuration

|Name|<nobr>Default Value</nobr>|Purpose|
|---|---|---|
|`__LEXICON_CSV_ROW_SEPERATOR`|`"------------------"`|What rows should Lexicon ignore when it comes to parsing CSVs. Lexicon will match only the start of the string, so it does not need to be a completed separator. i.e. `"-- items"` will only ignore if the start of the string contains `--` at least.|
|`__LEXICON_CSV_STRING_DELIMITER`|`"\""`|The string delimiter that Lexicon CSV parser should use.|
|`__LEXICON_CSV_CELL_DELIMITER`|`","`|The cell delimiter that Lexicon CSV parser should use.|