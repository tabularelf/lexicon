// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lexicon_language_get_unicode_range() {
	static _unicodeMap = undefined;
	if (is_undefined(_unicodeMap)) {
		_unicodeMap = {
			basic_latin: [0x20, 0x7F],
			latin_supplement: [0x80, 0xFF],
			latin_extended_a: [0x100, 0x17F],
			latin_extended_b: [0x180, 0x24F],
			hebrew: [0x590, 0x5FF],
			katakana: [0x30A0, 0x30FF],
			katakana_phonetic_ext: [0x31F0, 0x31FF],
			hiragana: [0x3040, 0x309F],
			kanji_a: [0x3400, 0x4dbf],
			kanji_b: [0x4e00, 0x9faf],
			kanbun: [0x3190, 0x319F],
			hangul_jamo: [0x1100, 0x11FF],
			hangul_compatibility_jamo: [0x3130, 0x318F],
			hangul_jamo_ext_a: [0xA960, 0xA97F],
			hangul_jamo_ext_b: [0xD7B0, 0xD7FF],
			hangul_syllables: [0xAC00, 0xD7A3],
			cjk_symbols_and_punctuation: [0x3000, 0x303F],
			cjk_compatibility: [0x3300, 0x33FF],
			cjk_compatibility_forms: [0xFE30, 0xFE4F],
			cjk_compatibility_ideographs: [0xF900, 0xFAFF],
			cjk_compatibility_ideographs_suppliement: [0x2F800, 0x2FA1F],
			cjk_radicals_supplement: [0x2E80, 0x2EFF],
			cjk_strokes: [0x31C0, 0x31EF],
			cjk_unified_ideographs: [0x4E00, 0x9FFF],
			cjk_unified_ideographs_ext_a: [0x3400, 0x4DB5],
			cjk_unified_ideographs_ext_b: [0x20000, 0x2A6D6],
			cjk_unified_ideographs_ext_c: [0x2A700, 0x2B73F],
			cjk_unified_ideographs_ext_d: [0x2B740, 0x2B81F],
			arabic: [0x600, 0x6FF],
			arabic_ext_a: [0x8A0, 0x8FF],
			arabic_presentation_forms_a: [0xFB50, 0xFDFF],
			arabic_supplement: [0x750, 0x77F],
			ipa_extensions: [0x250, 0x2AF],
			thai: [0xE00, 0xE7F],
			sundanese: [0x1B80, 0x1BBF],
			sundanese_supplement: [0x1CC0, 0x1CCF],
			georgian: [0x10A0, 0x10FF],
			georgian_supplement: [0x2D00, 0x2D2F],
			malayalam: [0xD00, 0xD7F],
			cyrillic: [0x400, 0x4FF],
			cyrillic_supplement: [0x500, 0x52F],
			cyrillic_ext_a: [0x2DE0, 0x2DFF],
			cyrillic_ext_b: [0xA640, 0xA69F],
			bopomofo: [0x3100, 0x312F],
			bopomofo_ext: [0x31A0, 0x31BF]
		}
		
		static _languageRangeMap = {};
		with(_languageRangeMap) {
			// Cyrillic copies
			russian = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			ukranian = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			turkmen = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			uzbek = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			serbian = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			tajik = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			bulgarian = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			azerbaijani = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			kazakh = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			macedonian = [_unicodeMap.cyrillic, _unicodeMap.cyrillic_supplement, _unicodeMap.cyrillic_ext_a, _unicodeMap.cyrillic_ext_b];
			hebrew = [_unicodeMap.hebrew];
			
			// Special cases
			//latin_1 = _unicodeMap.latin_supplement;
			arabic = [_unicodeMap.arabic, _unicodeMap.arabic_ext_a, _unicodeMap.arabic_presentation_forms_a, _unicodeMap.arabic_supplement];
			french = [_unicodeMap.latin_supplement];
			hungarian = [_unicodeMap.latin_supplement];
			turkish = [_unicodeMap.latin_supplement];
			array_copy(turkish, array_length(turkish), arabic, 0, array_length(arabic));
			traditional_chinese = [_unicodeMap.cjk_compatibility, _unicodeMap.cjk_compatibility_forms, _unicodeMap.cjk_compatibility_ideographs, _unicodeMap.cjk_compatibility_ideographs_suppliement,  _unicodeMap.cjk_unified_ideographs, _unicodeMap.cjk_radicals_supplement, _unicodeMap.cjk_strokes, _unicodeMap.cjk_symbols_and_punctuation, _unicodeMap.cjk_unified_ideographs_ext_a, _unicodeMap.cjk_unified_ideographs_ext_b, _unicodeMap.cjk_unified_ideographs_ext_c, _unicodeMap.cjk_unified_ideographs_ext_d,];
			simplified_chinese = traditional_chinese;
			mandarin_chnese = [_unicodeMap.bopomofo, _unicodeMap.bopomofo_ext];
			korean = [_unicodeMap.hangul_jamo, _unicodeMap.hangul_compatibility_jamo, _unicodeMap.hangul_jamo_ext_a, _unicodeMap.hangul_jamo_ext_b, _unicodeMap.hangul_syllables, _unicodeMap.cjk_compatibility, _unicodeMap.cjk_compatibility_forms, _unicodeMap.cjk_compatibility_ideographs, _unicodeMap.cjk_compatibility_ideographs_suppliement,  _unicodeMap.cjk_unified_ideographs, _unicodeMap.cjk_radicals_supplement, _unicodeMap.cjk_strokes, _unicodeMap.cjk_symbols_and_punctuation, _unicodeMap.cjk_unified_ideographs_ext_a, _unicodeMap.cjk_unified_ideographs_ext_b, _unicodeMap.cjk_unified_ideographs_ext_c, _unicodeMap.cjk_unified_ideographs_ext_d,];
			persian = [_unicodeMap.arabic, _unicodeMap.arabic_ext_a, _unicodeMap.arabic_presentation_forms_a, _unicodeMap.arabic_supplement];
		}
		//show_debug_message(_unicodeMap);
	}
	
	var _languageArray = [];
	
	var _i = 0;
	repeat(argument_count) {
		var _chosenArray = _unicodeMap[$ argument[_i++]];
		if (is_undefined(_chosenArray)) {
			array_push(_languageArray, undefined);
			continue;
		}
		
		var _array = array_create(array_length(_chosenArray));
		array_copy(_array, 0, _chosenArray, 0, array_length(_chosenArray));	
		array_push(_languageArray, _array);
	}
	
	return _languageRangeMap[$ _language];
}