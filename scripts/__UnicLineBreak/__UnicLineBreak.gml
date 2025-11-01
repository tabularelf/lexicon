// https://www.unicode.org/reports/tr14/

enum UnicLineBreak {
	MANDATORY_BREAK = 0,                           // BK
	CARRIAGE_RETURN = 1,                           // CR
	LINE_FEED = 2,                                 // LF
	COMBINING_MARKS = 3,                           // CM
	WORD_JOINER = 4,                               // WJ
	SURROGATE = 5,                                 // SG
	ZERO_WIDTH_SPACE = 6,                          // ZW
	SPACE_INDIRECT_BREAK = 7,                      // SP
	ZERO_WIDTH_JOINER = 8,                         // ZW
	SYMBOLS_ALLOW_BREAK_AFTER = 9,                 // SY
	BREAK_OPPORTUNITY_BEFORE_AFTER = 10,           // B2
	BREAK_OPPORTUNITY_AFTER = 11,                  // BA
	BREAK_OPPORTUNITY_BEFORE = 12,                 // BB
	CONTINGENT_BREAK_OP = 13,                      // CB
	HYPHEN_MINUS = 14,                             // HY
	HYPHEN = 15,                                   // HH
	IDEOGRAPHIC = 16,                              // ID
	OPEN_PUNCTUATION = 17,                         // OP
	QUOTATIONS = 18,                               // QU
	ALPHABETIC = 19,                               // AL
	NUMERIC = 20,                                  // NU
	PRE_NUMERIC = 21,                              // PR
	POST_NUMERIC = 22,                             // PO
	NUMERIC_SEPARATOR = 23,                        // IS
	EMOJI_BASE = 24,                               // EB
	EMOJI_MODIFIER = 25,                           // EM
	REGIONAL_INDICATOR = 26,                       // RI
	AMBIGUOUS = 27,                                // AI
	CONJOINING_JAMO_L = 28,                        // JL
	CONJOINING_JAMO_V = 29,                        // JV
	CONJOINING_JAMO_T = 30,                        // JT
	NON_STARTER = 31,                              // NS
	CONDITIONAL_JAPANESE_STARTER = 32,             // CJ
	HANGUL_LV = 33,                                // H2
	HANGUL_LVT = 34,                               // H3
	HEBREW = 35,                                   // HL
	COMPLEX_CONTEXT_DEPENDENT_SEA = 36,            // SA
	VIRAMA_FINAL = 37,                             // VF
	VIRAMA = 38,                                   // VI
	AKSARA = 39,                                   // AK
	AKSARA_START = 40,                             // AS
	AKSARA_PREBASE = 41,                           // AP
	NO_BREAK_BEFORE_ELLIPSES = 42,                 // IN
	NO_BREAK_GLUE = 43,                            // GL
	NEXT_LINE_BREAK = 44,                          // NL
	CLOSE_PUNCTUATION = 45,                        // CL
	CLOSE_PARENTHESIS = 46,                        // CP
	EXCLAIMATION = 47,                             // EM
	UNKNOWN = 255,                                 // Unknown
	LENGTH
}