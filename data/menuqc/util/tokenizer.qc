// NG-Menu
// util/tokenizer.qc

// stack
// containes the text strings
string __tokenizer_stack_texts[ TOKENIZER_STACK_DEPTH ];
bool __tokenizer_stack_ownsTexts[ TOKENIZER_STACK_DEPTH ];
float __tokenizer_stack_size;

// dont allow pushing or popping when the quickmode is activated
bool __tokenizer_stack_quick_mode;

void __tokenizer_check_quick_mode() {
	if( __tokenizer_stack_quick_mode ) {
		error( "Tokenizer stack operations aren't allowed in quick mode!" );
	}
}

void __tokenizer_stack_push( string pText, bool pStackOwnsText ) {
	string lText;
	__tokenizer_check_quick_mode();
	if( __tokenizer_stack_size > TOKENIZER_STACK_DEPTH ) {
		error( "Tokenizer stack is full!" );
	}

	if( pStackOwnsText ) {
		lText = String_Zone( pText );
	} else {
		lText = pText;
	}
	__tokenizer_stack_texts[ __tokenizer_stack_size ] = lText;
	__tokenizer_stack_ownsTexts[ __tokenizer_stack_size ] = pStackOwnsText;
	__tokenizer_stack_size++;
}

string __tokenizer_stack_get_top() {
	return __tokenizer_stack_texts[ __tokenizer_stack_size - 1 ];
}

void __tokenizer_stack_pop() {
	__tokenizer_check_quick_mode();
	__tokenizer_stack_size--;
	if( __tokenizer_stack_size < 0 ) {
		error( "Tokenizer stack is corrupted!" );
	}
	if( __tokenizer_stack_ownsTexts[ __tokenizer_stack_size ] ) {
		String_Free( __tokenizer_stack_texts[ __tokenizer_stack_size ] );
	}
	// RELEASE: remove this
	__tokenizer_stack_texts[ __tokenizer_stack_size ] = "";
	__tokenizer_stack_ownsTexts[ __tokenizer_stack_size ] = false;
}

float __tokenizer_token_count;

void __tokenizer_lex( string pText ) {
	__tokenizer_token_count = tokenize( pText );
}

float Tokenizer_LexStaticString( zoned pText ) {
	__tokenizer_stack_push( pText, false );
	__tokenizer_lex( pText );
	return __tokenizer_token_count;
}

float Tokenizer_LexTempString( string pText ) {
	__tokenizer_stack_push( pText, true );
	__tokenizer_lex( pText );
	return __tokenizer_token_count;
}

void Tokenizer_Finished() {
	__tokenizer_stack_pop();
	__tokenizer_lex( __tokenizer_stack_get_top() );
}

float Tokenizer_QuickLex( string pText ) {
	__tokenizer_stack_quick_mode = true;
	__tokenizer_lex( pText );
	return __tokenizer_token_count;
}

void Tokenizer_QuickLexFinished() {
	__tokenizer_stack_quick_mode = false;
	__tokenizer_lex( __tokenizer_stack_get_top() );
}

float Tokenizer_GetFreeSlotCount() {
	return TOKENIZER_STACK_DEPTH - __tokenizer_stack_size;
}

string Tokenizer_Get( float pIndex ) {
	if( pIndex >= __tokenizer_token_count ) {
		error( "Bad token index passed to Tokenizer_Get!" );
	}
	return argv( pIndex );
}

zoned Tokenizer_GetZoned( float pIndex ) {
	if( pIndex >= __tokenizer_token_count ) {
		error( "Bad token index passed to Tokenizer_GetZoned!" );
	}
	return String_Zone( argv( pIndex ) );
}

float Tokenizer_GetTokenCount() {
	return __tokenizer_token_count;
}
