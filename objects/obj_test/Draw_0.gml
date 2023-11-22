/// @description Draw event
draw_set_font(fn_fontWithJapanese);
draw_text(32,32,"Normal Version: " + lexicon_text("text.test", struct, 100, 100));
draw_text(32,64,"Array Version: " + lexicon_text_array("text.test",array));
draw_text(32,96,"Struct within Struct Version (JSON only): " + lexicon_text("generic.foo",struct));
draw_text(32,160,string(languages_array));
draw_text(32,192,lexicon_locale_get());
draw_text(32, 192+64, lexicon_text("{DateTime}"));

draw_text(32, 192+32, string(lexicon_entry_get_variations("test.array"))+
    "\nDebug Demonstration: " + lexicon_text("text.test.exists")
);

draw_text(32, 192+128, lexicon_text("newline_test"));

draw_text(room_width div 2, room_height div 2, "Press spacebar to cycle languages");

