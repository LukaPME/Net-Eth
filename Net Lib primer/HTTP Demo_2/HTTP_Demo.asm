
_Net_Ethernet_28j60_UserTCP:

;HTTP_Demo.c,235 :: 		void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
;HTTP_Demo.c,257 :: 		if (sendHTML_mark == 0) {
	MOVF        _sendHTML_mark+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP0
;HTTP_Demo.c,258 :: 		sendHTML_mark = 1;
	MOVLW       1
	MOVWF       _sendHTML_mark+0 
;HTTP_Demo.c,277 :: 		pg_size = strlen(html_code);
	MOVF        _html_code+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        _html_code+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       _pg_size+0 
	MOVF        R1, 0 
	MOVWF       _pg_size+1 
;HTTP_Demo.c,279 :: 		}
L_Net_Ethernet_28j60_UserTCP0:
;HTTP_Demo.c,284 :: 		if (sendHTML_mark == 1) {
	MOVF        _sendHTML_mark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP1
;HTTP_Demo.c,285 :: 		while (pos[socket->ID] < pg_size) {
L_Net_Ethernet_28j60_UserTCP2:
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _pg_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP20
	MOVF        _pg_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP20:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP3
;HTTP_Demo.c,286 :: 		if (Net_Ethernet_28j60_putByteTCP(html_code[pos[socket->ID]++], socket) == 0) {
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	ADDWF       R2, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       R1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	ADDWF       _html_code+0, 0 
	MOVWF       FSR0 
	MOVF        R3, 0 
	ADDWFC      _html_code+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_ch+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP4
;HTTP_Demo.c,287 :: 		pos[socket->ID]--;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       1
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,288 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP3
;HTTP_Demo.c,289 :: 		}
L_Net_Ethernet_28j60_UserTCP4:
;HTTP_Demo.c,290 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP2
L_Net_Ethernet_28j60_UserTCP3:
;HTTP_Demo.c,291 :: 		if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= pg_size) ) {
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_bufferEmptyTCP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP7
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _pg_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP21
	MOVF        _pg_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP21:
	BTFSS       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP7
L__Net_Ethernet_28j60_UserTCP18:
;HTTP_Demo.c,292 :: 		Net_Ethernet_28j60_disconnectTCP(socket);
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_disconnectTCP+0, 0
;HTTP_Demo.c,293 :: 		socket_28j60[socket->ID].state = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       51
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _socket_28j60+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_socket_28j60+0)
	ADDWFC      R1, 1 
	MOVLW       37
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,294 :: 		sendHTML_mark = 0;
	CLRF        _sendHTML_mark+0 
;HTTP_Demo.c,295 :: 		pos[socket->ID] = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,296 :: 		}
L_Net_Ethernet_28j60_UserTCP7:
;HTTP_Demo.c,297 :: 		}
L_Net_Ethernet_28j60_UserTCP1:
;HTTP_Demo.c,298 :: 		}
L_end_Net_Ethernet_28j60_UserTCP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserTCP

_Net_Ethernet_28j60_UserUDP:

;HTTP_Demo.c,311 :: 		unsigned int    Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc) {
;HTTP_Demo.c,316 :: 		ByteToStr(udpDsc->remoteIP[0], dyna);                // first IP address byte
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, FSR0
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,317 :: 		dyna[3] = '.';
	MOVLW       46
	MOVWF       _dyna+3 
;HTTP_Demo.c,318 :: 		ByteToStr(udpDsc->remoteIP[1], dyna + 4);            // second
	MOVLW       1
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+4
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+4)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,319 :: 		dyna[7] = '.';
	MOVLW       46
	MOVWF       _dyna+7 
;HTTP_Demo.c,320 :: 		ByteToStr(udpDsc->remoteIP[2], dyna + 8);            // third
	MOVLW       2
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+8
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+8)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,321 :: 		dyna[11] = '.';
	MOVLW       46
	MOVWF       _dyna+11 
;HTTP_Demo.c,322 :: 		ByteToStr(udpDsc->remoteIP[3], dyna + 12);           // fourth
	MOVLW       3
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+12
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+12)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,324 :: 		dyna[15] = ':';                                // add separator
	MOVLW       58
	MOVWF       _dyna+15 
;HTTP_Demo.c,327 :: 		WordToStr(udpDsc->remotePort, dyna + 16);
	MOVLW       10
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+16
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+16)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.c,328 :: 		dyna[21] = '[';
	MOVLW       91
	MOVWF       _dyna+21 
;HTTP_Demo.c,329 :: 		WordToStr(udpDsc->destPort, dyna + 22);
	MOVLW       12
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+22
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+22)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.c,330 :: 		dyna[27] = ']';
	MOVLW       93
	MOVWF       _dyna+27 
;HTTP_Demo.c,331 :: 		dyna[28] = 0;
	CLRF        _dyna+28 
;HTTP_Demo.c,334 :: 		len = 28 + udpDsc->dataLength;
	MOVLW       14
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR2H 
	MOVLW       28
	ADDWF       POSTINC2+0, 0 
	MOVWF       Net_Ethernet_28j60_UserUDP_len_L0+0 
	MOVLW       0
	ADDWFC      POSTINC2+0, 0 
	MOVWF       Net_Ethernet_28j60_UserUDP_len_L0+1 
;HTTP_Demo.c,337 :: 		Net_Ethernet_28j60_putBytes(dyna, 28);
	MOVLW       _dyna+0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+1 
	MOVLW       28
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+0 
	MOVLW       0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+1 
	CALL        _Net_Ethernet_28j60_putBytes+0, 0
;HTTP_Demo.c,341 :: 		while(udpDsc->dataLength--)
L_Net_Ethernet_28j60_UserUDP8:
	MOVLW       14
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	SUBWF       R2, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      R3, 0 
	MOVWF       R1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	IORWF       R3, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserUDP9
;HTTP_Demo.c,343 :: 		Net_Ethernet_28j60_putByte(toupper(Net_Ethernet_28j60_getByte()));
	CALL        _Net_Ethernet_28j60_getByte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_toupper_character+0 
	CALL        _toupper+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByte_v+0 
	CALL        _Net_Ethernet_28j60_putByte+0, 0
;HTTP_Demo.c,344 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserUDP8
L_Net_Ethernet_28j60_UserUDP9:
;HTTP_Demo.c,345 :: 		return(len);
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+0, 0 
	MOVWF       R0 
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+1, 0 
	MOVWF       R1 
;HTTP_Demo.c,346 :: 		}
L_end_Net_Ethernet_28j60_UserUDP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserUDP

_MCUInit:

;HTTP_Demo.c,350 :: 		void MCUInit() {
;HTTP_Demo.c,351 :: 		cnt = 0;             // Initialize cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,352 :: 		TRISB = 0;           // PORTB is output
	CLRF        TRISB+0 
;HTTP_Demo.c,353 :: 		PORTB = 0xFF;        // Initialize PORTB
	MOVLW       255
	MOVWF       PORTB+0 
;HTTP_Demo.c,355 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;HTTP_Demo.c,356 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,357 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,358 :: 		INTCON = 0xC0;       // Set GIE, PEIE
	MOVLW       192
	MOVWF       INTCON+0 
;HTTP_Demo.c,359 :: 		TMR0IE_bit = 1;      // Enable TMRO interrupt
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;HTTP_Demo.c,360 :: 		}
L_end_MCUInit:
	RETURN      0
; end of _MCUInit

_interrupt:

;HTTP_Demo.c,363 :: 		void interrupt() {
;HTTP_Demo.c,364 :: 		if (TMR0IF_bit) {
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt10
;HTTP_Demo.c,365 :: 		cnt++;             // Increment value of cnt on every interrupt
	INFSNZ      _cnt+0, 1 
	INCF        _cnt+1, 1 
;HTTP_Demo.c,366 :: 		if (cnt >= 200) {
	MOVLW       0
	SUBWF       _cnt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt26
	MOVLW       200
	SUBWF       _cnt+0, 0 
L__interrupt26:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt11
;HTTP_Demo.c,367 :: 		cnt = 0;         // Reset cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,368 :: 		Net_Ethernet_28j60_UserTimerSec++;
	MOVLW       1
	ADDWF       _Net_Ethernet_28j60_UserTimerSec+0, 1 
	MOVLW       0
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+1, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+2, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+3, 1 
;HTTP_Demo.c,369 :: 		}
L_interrupt11:
;HTTP_Demo.c,370 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,371 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,372 :: 		TMR0IF_bit = 0;    // clear TMR0IF
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;HTTP_Demo.c,373 :: 		}
L_interrupt10:
;HTTP_Demo.c,374 :: 		}
L_end_interrupt:
L__interrupt25:
	RETFIE      1
; end of _interrupt

_main:

;HTTP_Demo.c,380 :: 		void    main() {
;HTTP_Demo.c,381 :: 		MCUInit();
	CALL        _MCUInit+0, 0
;HTTP_Demo.c,382 :: 		ANSEL = 0x0C;           // AN2 and AN3 convertors will be used
	MOVLW       12
	MOVWF       ANSEL+0 
;HTTP_Demo.c,383 :: 		C1ON_bit = 0;           // Disable comparators
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;HTTP_Demo.c,384 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;HTTP_Demo.c,385 :: 		PORTA = 0 ;
	CLRF        PORTA+0 
;HTTP_Demo.c,386 :: 		TRISA = 0xff ;          // set PORTA as input for ADC
	MOVLW       255
	MOVWF       TRISA+0 
;HTTP_Demo.c,387 :: 		ANSELH = 0x0C;
	MOVLW       12
	MOVWF       ANSELH+0 
;HTTP_Demo.c,388 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,389 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,390 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,391 :: 		PORTB = 0;
	CLRF        PORTB+0 
;HTTP_Demo.c,392 :: 		TRISB = 0xFF;           // set PORTB as input for buttons
	MOVLW       255
	MOVWF       TRISB+0 
;HTTP_Demo.c,394 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,395 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,396 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,403 :: 		Net_Ethernet_28j60_stackInitTCP();
	CALL        _Net_Ethernet_28j60_stackInitTCP+0, 0
;HTTP_Demo.c,404 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;HTTP_Demo.c,405 :: 		Net_Ethernet_28j60_Init(myMacAddr, myIpAddr, Net_Ethernet_28j60_FULLDUPLEX)  ;
	MOVLW       _myMacAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_Init_mac+0 
	MOVLW       hi_addr(_myMacAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_Init_mac+1 
	MOVLW       _myIpAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_Init_ip+0 
	MOVLW       hi_addr(_myIpAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_Init_ip+1 
	MOVLW       1
	MOVWF       FARG_Net_Ethernet_28j60_Init_fullDuplex+0 
	CALL        _Net_Ethernet_28j60_Init+0, 0
;HTTP_Demo.c,406 :: 		Net_Ethernet_28j60_confNetwork(ipMask, gwIpAddr, dnsIpAddr);
	MOVLW       _ipMask+0
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_ipMask+0 
	MOVLW       hi_addr(_ipMask+0)
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_ipMask+1 
	MOVLW       _gwIpAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_gwIpAddr+0 
	MOVLW       hi_addr(_gwIpAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_gwIpAddr+1 
	MOVLW       _dnsIpAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_dnsIpAddr+0 
	MOVLW       hi_addr(_dnsIpAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_dnsIpAddr+1 
	CALL        _Net_Ethernet_28j60_confNetwork+0, 0
;HTTP_Demo.c,408 :: 		while(1) {
L_main12:
;HTTP_Demo.c,410 :: 		Net_Ethernet_28j60_doPacket() ;   // process incoming Ethernet packets
	CALL        _Net_Ethernet_28j60_doPacket+0, 0
;HTTP_Demo.c,412 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	CLRF        _i+0 
L_main14:
	MOVLW       _NUM_OF_SOCKET_28j60
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main15
;HTTP_Demo.c,413 :: 		if(socket_28j60[i].open == 0)
	MOVLW       51
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _i+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _socket_28j60+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_socket_28j60+0)
	ADDWFC      R1, 1 
	MOVLW       34
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;HTTP_Demo.c,414 :: 		pos[i] = 0;
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
L_main17:
;HTTP_Demo.c,412 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	INCF        _i+0, 1 
;HTTP_Demo.c,415 :: 		}
	GOTO        L_main14
L_main15:
;HTTP_Demo.c,417 :: 		}
	GOTO        L_main12
;HTTP_Demo.c,418 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
