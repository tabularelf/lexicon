draw_set_font(LexiconFontGet("default"));

draw_set_halign(fa_right);
draw_text(room_width-8, 8, datetime);
draw_set_halign(fa_left);

switch(state) {
	case 0:
		keyboard_string = string_copy(string_letters(keyboard_string), 1, 10);
		var _entry = text;

		if (keyboard_check_released(ord("Z"))) && string_length(keyboard_string) > 0 {
			state = 1;
			LexiconGlobalSet("playerName", keyboard_string);
			text = Lexicon("start.selected_name");
			call_later(2, time_source_units_seconds, function() {
				state = 2;
				text = Lexicon("npc.bob.greeting", priceData, playerData);
			});
		}

		draw_text(8, 24, _entry.Get(keyboard_string));
	break;

	case 1:
		var _entry = text;
		draw_text(8, 24, _entry.Get());
	break;

	case 2:
		var _entry = text;
		draw_text(8, 24, text.Get());

		if (keyboard_check_released(ord("Z"))) {
			if (playerData.money < priceData.applePrice) {
				state = 3;
				if (LexiconEntryHasVariations("npc.bob.buy_fail")) {
					variation_index = irandom(LexiconEntryGetVariationsCount("npc.bob.buy_fail")-1);
				} else {
					variation_index = "";
				}

				call_later(3, time_source_units_seconds, function() {
					state = 2;
					playerData.money++;
					text = Lexicon("npc.bob.greeting", priceData, playerData);
				});

				text = Lexicon("npc.bob.buy_fail" + string(variation_index), priceData, playerData);
			} else {
				state = 4;
				playerData.money -= priceData.applePrice;
				if (LexiconEntryHasVariations("npc.bob.buy_success")) {
					variation_index = irandom(LexiconEntryGetVariationsCount("npc.bob.buy_success")-1);
				} else {
					variation_index = "";
				}

				call_later(3, time_source_units_seconds, function() {
					state = 5;
					if (LexiconEntryHasVariations("npc.bob.goodbye")) {
						variation_index = irandom(LexiconEntryGetVariationsCount("npc.bob.goodbye")-1);
					} else {
						variation_index = "";
					}
					text = Lexicon("npc.bob.goodbye" + string(variation_index), priceData, playerData);
				});

				text = Lexicon("npc.bob.buy_success" + string(variation_index), priceData, playerData);
			}
		}
	break;

	case 3:


		var _entry = text;//Lexicon(_str, priceData, playerData);
		draw_text(8, 24, _entry.Get());
	break;

	case 4:
		//var _str = ;

		var _entry = text;//Lexicon(_str, priceData, playerData);
		draw_text(8, 24, _entry.Get());
	break;

	case 5:
		draw_text(8, 24, text.Get());

		if (keyboard_check_released(ord("Z"))) {
			state = 2;
			text = Lexicon("npc.bob.greeting", priceData, playerData);
		}
	break;
}