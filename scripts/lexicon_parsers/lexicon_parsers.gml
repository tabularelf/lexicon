
/// @func lexicon_add_async
/// @param filename
function lexicon_add_async(_filename) {
	return LEXICON_STRUCT.add_async(_filename);
}


/// @func lexicon_add
/// @param filename
function lexicon_add(_filename) {
	return LEXICON_STRUCT.add(_filename);
}

/// @func lexicon_async
function lexicon_async() {
	return LEXICON_STRUCT.async();	
}

// Parsers

/// @func lexicon_parse_json
/// @param filename
function lexicon_parse_json(_string) {
	return LEXICON_STRUCT.parse_json(_string);
}

/// @func parse_csv
/// @param buffer_string_grid
/// @param [is_buffer]
/// @param [force_strings]
/// @param [cell_delimiter]
/// @param [string_delimiter]
/// @param [mac_newline]
// Juju made this so I can't take credit
function lexicon_parse_csv(_buffer_grid, _is_buffer, _force_strings, _cell_delim, _string_delim, _mac_newline) {
var _buff = undefined, _grid = undefined, _using_own_buffer = false;

// Get arguments
var _is_string = is_real(_buffer_grid) ? buffer_exists(_buffer_grid) : false;
_is_buffer = is_undefined(_is_buffer) ? _is_string : _is_buffer;
_force_strings  =  is_undefined(_force_strings) ? false : _force_strings;
_cell_delim  =  is_undefined(_cell_delim) ? chr(44) : _cell_delim;
_string_delim  =  is_undefined(_string_delim) ? chr(34) : _string_delim;
_mac_newline  =  is_undefined(_mac_newline) ? false : _mac_newline;

	// Determine if string or buffer
	if !(_is_buffer) && (is_string(_buffer_grid)) {
		var _string = _buffer_grid;
		
		// Hijacking the _buffer_grid variable to make a custom buffer :)
		_buffer_grid = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
		buffer_write(_buffer_grid, buffer_text,_string);
		_using_own_buffer = true;
		_is_buffer = true;
	} 
	
	// Begin the loop
	if (_is_buffer) {
		_buff = _buffer_grid;	
		if ( string_length(_cell_delim) != 1 ) or ( string_length(_string_delim) != 1 ) {
			show_error("Delimiters must be one character", false);
			return undefined;
		}

		//More variables...
		var _cell_delimiter_ord  = ord(_cell_delim );
		var _string_delimiter_ord = ord(_string_delim);

		var _sheet_width  = 0;
		var _sheet_height = 1;
		var _max_width    = 0;

		var _prev_val   = 0;
		var _val        = 0;
		var _str        = "";
		var _in_string  = false;
		var _is_decimal = !_force_strings;
		var _grid       = ds_grid_create( 1, 1 ); _grid[# 0, 0 ] = "";

		var _size = buffer_get_size(_buff );
		buffer_seek(_buff, buffer_seek_start, 0 );
		//Handle byte order marks from some UTF-8 encoders (EF BB BF at the start of the file)
		var _bom_a = buffer_read( _buff, buffer_u8 );
		var _bom_b = buffer_read( _buff, buffer_u8 );
		var _bom_c = buffer_read( _buff, buffer_u8 );
		if !( ( _bom_a == 239 ) and ( _bom_b == 187 ) and ( _bom_c == 191 ) ) {
			show_debug_message( "CAUTION: csv_to_grid: " + _filename + ": CSV file might not be UTF-8 encoded (no BOM)" );
			buffer_seek( _buff, buffer_seek_start, 0 );
		} else {
			_size -= 3;
		}

		//Iterate over the buffer
		for( var _i = 0; _i < _size; _i++ ) {

			_prev_val = _val;
			var _val = buffer_read( _buff, buffer_u8 );

			//Handle UTF-8 encoding
			if ( ( _val & 224 ) == 192 ) { //two-byte

			_val  = (_val & 31 ) <<  6;
			_val += ( buffer_read( _buff, buffer_u8 ) & 63 );
			_i++;

			} else if ( ( _val & 240 ) == 224 ) { //three-byte

			_val  = (                              _val & 15 ) << 12;
			_val += ( buffer_read( _buff, buffer_u8 ) & 63 ) <<  6;
			_val +=   buffer_read( _buff, buffer_u8 ) & 63;
			_i += 2;

			} else if ( ( _val & 248 ) == 240 ) { //four-byte

			_val  = (                              _val &  7 ) << 18;
			_val += ( buffer_read( _buff, buffer_u8 ) & 63 ) << 12;
			_val += ( buffer_read( _buff, buffer_u8 ) & 63 ) <<  6;
			_val +=   buffer_read( _buff, buffer_u8 ) & 63;
			_i += 3;

		}

	
		//If we've found a string delimiter
		if ( _val == _string_delimiter_ord ) {
	
			//This definitely isn't a decimal number!
			_is_decimal = false;
	
			//If we're in a string...
			if ( _in_string ) {
	
				//If the next character is a string delimiter itself, skip this character
				if ( buffer_peek( _buff, buffer_tell( _buff ), buffer_u8 ) == _string_delimiter_ord ) continue;
	
				//If the previous character is a string delimiter itself, add the string delimiter to the working string
				if ( _prev_val == _string_delimiter_ord ) {
					_str += _string_delimiter;
					continue;
				}
	
			}
	
			//Toggle "we're in a string" behaviour
			_in_string = !_in_string;
			continue;
	
		}
		
		if ( _mac_newline ) {
			var _newline = ( _val == 10 );
		} else {
			var _newline = ( _prev_val == 13 ) and ( _val == 10 );
			
			//If we've found a newline and we're in a string, skip over the chr(10) character
			if ( _in_string ) and ( _newline ) continue;
		}
	
		//If we've found a new cell
		if ( ( _val == _cell_delimiter_ord ) or ( _newline ) ) and ( !_in_string ) {
	
			_sheet_width++;
	
			//If this cell is now longer than the maximum width of the grid, expand the grid
			if ( _sheet_width > _max_width ) {
	
				_max_width = _sheet_width;
				ds_grid_resize( _grid, _max_width, _sheet_height );
	
				//Clear cells vertically above to overwrite the default 0-value
				if ( _sheet_height >= 2 ) ds_grid_set_region( _grid, _max_width-1, 0, _max_width-1, _sheet_height-2, "" );
	
			}
	
			//Write the working string to a grid cell
			if ( _is_decimal )
					{
						if (_str == "") _str = 0; else _str = real( _str );
					}
					
			_grid[# _sheet_width-1, _sheet_height-1 ] = _str;
	
			_str = "";
			_in_string = false;
			_is_decimal = !_force_strings;
	
			//A newline outside of a string triggers a new line... unsurprisingly
			if ( _newline ) {
	
				//Clear cells horizontally to overwrite the default 0-value
				if ( _sheet_width < _max_width ) ds_grid_set_region( _grid, _sheet_width, _sheet_height-1, _max_width-1, _sheet_height-1, "" );
	
				_sheet_width = 0;
				_sheet_height++;
				ds_grid_resize( _grid, _max_width, _sheet_height );
			}
	
			continue;
	
		}
	
		//Check if we've read a "\n" dual-character
		if ( _prev_val == 92 ) and ( _val == 110 ) {
			_str = string_delete( _str, string_length( _str ), 1 ) + chr(13);
			continue;
		}
		
		//No newlines should appear outside of a string delimited cell
		if ( ( _val == 10 ) or ( _val == 13 ) ) and ( !_in_string ) continue;
		
		//Check if this character is outside valid decimal character range
		if ( _val != 45 ) and ( _val != 46 ) and ( ( _val < 48 ) or ( _val > 57 ) ) _is_decimal = false;
	
		//Finally add this character to the working string!
		_str += chr( _val );
	
	}
	
	//Catch hanging work string on end-of-file
	if ( _str != "" ) {
		
		_sheet_width++;
		
		if ( _sheet_width > _max_width ) {
			_max_width = _sheet_width;
			ds_grid_resize( _grid, _max_width, _sheet_height );
			if ( _sheet_height >= 2 ) ds_grid_set_region( _grid, _max_width-1, 0, _max_width-1, _sheet_height-2, "" );
		}
		
		if ( _is_decimal ) _str = real( _str );
		_grid[# _sheet_width-1, _sheet_height-1 ] = _str;
		
	}
	
	//If the last character was a newline then we'll have an erroneous extra row at the bottom
	if ( _mac_newline ) ds_grid_resize( _grid, _max_width, _sheet_height-1 );

	} else {
		// We'll assume it's a ds_grid!
		_grid = _buffer_grid;
	} 
	
	// Create Dummy variables
	var _language = undefined;
	var _locale = undefined;

	for(var _i = 0; _i < ds_grid_width(_grid); ++_i) {
		var _entry = _grid[# _i, 0];
		if (_entry == "Comments" || _entry == "Language") continue;
		for(var _j = 0; _j < ds_grid_height(_grid)-1; ++_j) {
			switch(_grid[# 0, _j]) {
			case "Language":
				_language = _grid[# _i, _j];
			break;	
			
			case "Locale":
				_locale = _grid[# _i, _j];
				if (lexicon_exists_language(_language) == false) && (lexicon_exists_locale(_locale) == false) {
					lexicon_add_language(_language,_locale);
				}
			break;
			
			default: 
				lexicon_add_entry(_locale, _grid[# 0, _j], _grid[# _i, _j]); 
			break;
			}
		}	
	}
	
	if (_is_buffer) {
		if (_using_own_buffer) {
			buffer_delete(_buff);
		}
		ds_grid_destroy(_grid);
	}

	return LEXICON_STRUCT.lang_map[$ _locale];
}