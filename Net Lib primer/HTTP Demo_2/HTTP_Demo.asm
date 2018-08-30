
_my_strstr:

;HTTP_Demo.c,190 :: 		int my_strstr(int index, char *s2, char *s1, char *s3)
;HTTP_Demo.c,193 :: 		int flag = 0;
	CLRF        my_strstr_flag_L0+0 
	CLRF        my_strstr_flag_L0+1 
;HTTP_Demo.c,197 :: 		for( i = index; s2[i] != '\0'; i++)
	MOVF        FARG_my_strstr_index+0, 0 
	MOVWF       my_strstr_i_L0+0 
	MOVF        FARG_my_strstr_index+1, 0 
	MOVWF       my_strstr_i_L0+1 
L_my_strstr0:
	MOVF        my_strstr_i_L0+0, 0 
	ADDWF       FARG_my_strstr_s2+0, 0 
	MOVWF       FSR0 
	MOVF        my_strstr_i_L0+1, 0 
	ADDWFC      FARG_my_strstr_s2+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_my_strstr1
;HTTP_Demo.c,199 :: 		if (s2[i] == s1[0])
	MOVF        my_strstr_i_L0+0, 0 
	ADDWF       FARG_my_strstr_s2+0, 0 
	MOVWF       FSR0 
	MOVF        my_strstr_i_L0+1, 0 
	ADDWFC      FARG_my_strstr_s2+1, 0 
	MOVWF       FSR0H 
	MOVFF       FARG_my_strstr_s1+0, FSR2
	MOVFF       FARG_my_strstr_s1+1, FSR2H
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr3
;HTTP_Demo.c,201 :: 		for (j = i; ; j++)
	MOVF        my_strstr_i_L0+0, 0 
	MOVWF       my_strstr_j_L0+0 
	MOVF        my_strstr_i_L0+1, 0 
	MOVWF       my_strstr_j_L0+1 
L_my_strstr4:
;HTTP_Demo.c,203 :: 		if (s1[j-i] == '\0'){ flag = 1;
	MOVF        my_strstr_i_L0+0, 0 
	SUBWF       my_strstr_j_L0+0, 0 
	MOVWF       R0 
	MOVF        my_strstr_i_L0+1, 0 
	SUBWFB      my_strstr_j_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_my_strstr_s1+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_my_strstr_s1+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr7
	MOVLW       1
	MOVWF       my_strstr_flag_L0+0 
	MOVLW       0
	MOVWF       my_strstr_flag_L0+1 
;HTTP_Demo.c,204 :: 		break;}
	GOTO        L_my_strstr5
L_my_strstr7:
;HTTP_Demo.c,205 :: 		if (s2[j] == s1[j-i])
	MOVF        my_strstr_j_L0+0, 0 
	ADDWF       FARG_my_strstr_s2+0, 0 
	MOVWF       FSR0 
	MOVF        my_strstr_j_L0+1, 0 
	ADDWFC      FARG_my_strstr_s2+1, 0 
	MOVWF       FSR0H 
	MOVF        my_strstr_i_L0+0, 0 
	SUBWF       my_strstr_j_L0+0, 0 
	MOVWF       R0 
	MOVF        my_strstr_i_L0+1, 0 
	SUBWFB      my_strstr_j_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_my_strstr_s1+0, 0 
	MOVWF       FSR2 
	MOVF        R1, 0 
	ADDWFC      FARG_my_strstr_s1+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr8
;HTTP_Demo.c,206 :: 		continue;
	GOTO        L_my_strstr6
L_my_strstr8:
;HTTP_Demo.c,208 :: 		break;
	GOTO        L_my_strstr5
;HTTP_Demo.c,209 :: 		}
L_my_strstr6:
;HTTP_Demo.c,201 :: 		for (j = i; ; j++)
	INFSNZ      my_strstr_j_L0+0, 1 
	INCF        my_strstr_j_L0+1, 1 
;HTTP_Demo.c,209 :: 		}
	GOTO        L_my_strstr4
L_my_strstr5:
;HTTP_Demo.c,210 :: 		}
L_my_strstr3:
;HTTP_Demo.c,211 :: 		if (flag == 1)
	MOVLW       0
	XORWF       my_strstr_flag_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__my_strstr34
	MOVLW       1
	XORWF       my_strstr_flag_L0+0, 0 
L__my_strstr34:
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr10
;HTTP_Demo.c,212 :: 		break;
	GOTO        L_my_strstr1
L_my_strstr10:
;HTTP_Demo.c,197 :: 		for( i = index; s2[i] != '\0'; i++)
	INFSNZ      my_strstr_i_L0+0, 1 
	INCF        my_strstr_i_L0+1, 1 
;HTTP_Demo.c,213 :: 		}
	GOTO        L_my_strstr0
L_my_strstr1:
;HTTP_Demo.c,215 :: 		k=0;
	CLRF        my_strstr_k_L0+0 
	CLRF        my_strstr_k_L0+1 
;HTTP_Demo.c,216 :: 		for ( i = j ; i < (j + strlen(s3)) ; i++) {
	MOVF        my_strstr_j_L0+0, 0 
	MOVWF       my_strstr_i_L0+0 
	MOVF        my_strstr_j_L0+1, 0 
	MOVWF       my_strstr_i_L0+1 
L_my_strstr11:
	MOVF        FARG_my_strstr_s3+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_my_strstr_s3+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	ADDWF       my_strstr_j_L0+0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	ADDWFC      my_strstr_j_L0+1, 0 
	MOVWF       R3 
	MOVLW       128
	XORWF       my_strstr_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__my_strstr35
	MOVF        R2, 0 
	SUBWF       my_strstr_i_L0+0, 0 
L__my_strstr35:
	BTFSC       STATUS+0, 0 
	GOTO        L_my_strstr12
;HTTP_Demo.c,217 :: 		html_code[i] = s3[k];
	MOVLW       _html_code+0
	ADDWF       my_strstr_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_html_code+0)
	ADDWFC      my_strstr_i_L0+1, 0 
	MOVWF       FSR1H 
	MOVF        my_strstr_k_L0+0, 0 
	ADDWF       FARG_my_strstr_s3+0, 0 
	MOVWF       FSR0 
	MOVF        my_strstr_k_L0+1, 0 
	ADDWFC      FARG_my_strstr_s3+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,218 :: 		k++;
	INFSNZ      my_strstr_k_L0+0, 1 
	INCF        my_strstr_k_L0+1, 1 
;HTTP_Demo.c,216 :: 		for ( i = j ; i < (j + strlen(s3)) ; i++) {
	INFSNZ      my_strstr_i_L0+0, 1 
	INCF        my_strstr_i_L0+1, 1 
;HTTP_Demo.c,219 :: 		}
	GOTO        L_my_strstr11
L_my_strstr12:
;HTTP_Demo.c,220 :: 		return j;
	MOVF        my_strstr_j_L0+0, 0 
	MOVWF       R0 
	MOVF        my_strstr_j_L0+1, 0 
	MOVWF       R1 
;HTTP_Demo.c,225 :: 		else return 0;*/
L_end_my_strstr:
	RETURN      0
; end of _my_strstr

_Net_Ethernet_28j60_UserTCP:

;HTTP_Demo.c,228 :: 		void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
;HTTP_Demo.c,231 :: 		int res = 0;
;HTTP_Demo.c,235 :: 		char promena[] ="#aa0f0f";
	MOVLW       ?ICSNet_Ethernet_28j60_UserTCP_promena_L0+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICSNet_Ethernet_28j60_UserTCP_promena_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICSNet_Ethernet_28j60_UserTCP_promena_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       Net_Ethernet_28j60_UserTCP_promena_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(Net_Ethernet_28j60_UserTCP_promena_L0+0)
	MOVWF       FSR1H 
	MOVLW       27
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;HTTP_Demo.c,258 :: 		if (sendHTML_mark == 0) {
	MOVF        _sendHTML_mark+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP14
;HTTP_Demo.c,259 :: 		sendHTML_mark = 1;
	MOVLW       1
	MOVWF       _sendHTML_mark+0 
;HTTP_Demo.c,275 :: 		res = my_strstr(res, html_code, niz, promena);
	CLRF        FARG_my_strstr_index+0 
	CLRF        FARG_my_strstr_index+1 
	MOVLW       _html_code+0
	MOVWF       FARG_my_strstr_s2+0 
	MOVLW       hi_addr(_html_code+0)
	MOVWF       FARG_my_strstr_s2+1 
	MOVLW       Net_Ethernet_28j60_UserTCP_niz_L0+0
	MOVWF       FARG_my_strstr_s1+0 
	MOVLW       hi_addr(Net_Ethernet_28j60_UserTCP_niz_L0+0)
	MOVWF       FARG_my_strstr_s1+1 
	MOVLW       Net_Ethernet_28j60_UserTCP_promena_L0+0
	MOVWF       FARG_my_strstr_s3+0 
	MOVLW       hi_addr(Net_Ethernet_28j60_UserTCP_promena_L0+0)
	MOVWF       FARG_my_strstr_s3+1 
	CALL        _my_strstr+0, 0
;HTTP_Demo.c,282 :: 		res = my_strstr(res, html_code,"font-size:","40px");
	MOVF        R0, 0 
	MOVWF       FARG_my_strstr_index+0 
	MOVF        R1, 0 
	MOVWF       FARG_my_strstr_index+1 
	MOVLW       _html_code+0
	MOVWF       FARG_my_strstr_s2+0 
	MOVLW       hi_addr(_html_code+0)
	MOVWF       FARG_my_strstr_s2+1 
	MOVLW       ?lstr1_HTTP_Demo+0
	MOVWF       FARG_my_strstr_s1+0 
	MOVLW       hi_addr(?lstr1_HTTP_Demo+0)
	MOVWF       FARG_my_strstr_s1+1 
	MOVLW       ?lstr2_HTTP_Demo+0
	MOVWF       FARG_my_strstr_s3+0 
	MOVLW       hi_addr(?lstr2_HTTP_Demo+0)
	MOVWF       FARG_my_strstr_s3+1 
	CALL        _my_strstr+0, 0
;HTTP_Demo.c,285 :: 		pg_size = strlen(html_code);
	MOVLW       _html_code+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_html_code+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       _pg_size+0 
	MOVF        R1, 0 
	MOVWF       _pg_size+1 
;HTTP_Demo.c,287 :: 		}
L_Net_Ethernet_28j60_UserTCP14:
;HTTP_Demo.c,292 :: 		if (sendHTML_mark == 1) {
	MOVF        _sendHTML_mark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP15
;HTTP_Demo.c,294 :: 		while (pos[socket->ID] < pg_size) {
L_Net_Ethernet_28j60_UserTCP16:
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
	GOTO        L__Net_Ethernet_28j60_UserTCP37
	MOVF        _pg_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP37:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP17
;HTTP_Demo.c,295 :: 		if (Net_Ethernet_28j60_putByteTCP(html_code[pos[socket->ID]++], socket) == 0) {
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
	MOVLW       _html_code+0
	ADDWF       R2, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_html_code+0)
	ADDWFC      R3, 0 
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
	GOTO        L_Net_Ethernet_28j60_UserTCP18
;HTTP_Demo.c,296 :: 		pos[socket->ID]--;
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
;HTTP_Demo.c,297 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP17
;HTTP_Demo.c,298 :: 		}
L_Net_Ethernet_28j60_UserTCP18:
;HTTP_Demo.c,299 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP16
L_Net_Ethernet_28j60_UserTCP17:
;HTTP_Demo.c,300 :: 		if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= pg_size) ) {
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_bufferEmptyTCP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP21
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
	GOTO        L__Net_Ethernet_28j60_UserTCP38
	MOVF        _pg_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP38:
	BTFSS       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP21
L__Net_Ethernet_28j60_UserTCP32:
;HTTP_Demo.c,301 :: 		Net_Ethernet_28j60_disconnectTCP(socket);
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_disconnectTCP+0, 0
;HTTP_Demo.c,302 :: 		socket_28j60[socket->ID].state = 0;
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
;HTTP_Demo.c,303 :: 		sendHTML_mark = 0;
	CLRF        _sendHTML_mark+0 
;HTTP_Demo.c,304 :: 		pos[socket->ID] = 0;
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
;HTTP_Demo.c,305 :: 		}
L_Net_Ethernet_28j60_UserTCP21:
;HTTP_Demo.c,306 :: 		}
L_Net_Ethernet_28j60_UserTCP15:
;HTTP_Demo.c,307 :: 		}
L_end_Net_Ethernet_28j60_UserTCP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserTCP

_Net_Ethernet_28j60_UserUDP:

;HTTP_Demo.c,310 :: 		unsigned int    Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc) {
;HTTP_Demo.c,315 :: 		ByteToStr(udpDsc->remoteIP[0], dyna);                // first IP address byte
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, FSR0
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,316 :: 		dyna[3] = '.';
	MOVLW       46
	MOVWF       _dyna+3 
;HTTP_Demo.c,317 :: 		ByteToStr(udpDsc->remoteIP[1], dyna + 4);            // second
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
;HTTP_Demo.c,318 :: 		dyna[7] = '.';
	MOVLW       46
	MOVWF       _dyna+7 
;HTTP_Demo.c,319 :: 		ByteToStr(udpDsc->remoteIP[2], dyna + 8);            // third
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
;HTTP_Demo.c,320 :: 		dyna[11] = '.';
	MOVLW       46
	MOVWF       _dyna+11 
;HTTP_Demo.c,321 :: 		ByteToStr(udpDsc->remoteIP[3], dyna + 12);           // fourth
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
;HTTP_Demo.c,323 :: 		dyna[15] = ':';                                // add separator
	MOVLW       58
	MOVWF       _dyna+15 
;HTTP_Demo.c,326 :: 		WordToStr(udpDsc->remotePort, dyna + 16);
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
;HTTP_Demo.c,327 :: 		dyna[21] = '[';
	MOVLW       91
	MOVWF       _dyna+21 
;HTTP_Demo.c,328 :: 		WordToStr(udpDsc->destPort, dyna + 22);
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
;HTTP_Demo.c,329 :: 		dyna[27] = ']';
	MOVLW       93
	MOVWF       _dyna+27 
;HTTP_Demo.c,330 :: 		dyna[28] = 0;
	CLRF        _dyna+28 
;HTTP_Demo.c,333 :: 		len = 28 + udpDsc->dataLength;
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
;HTTP_Demo.c,336 :: 		Net_Ethernet_28j60_putBytes(dyna, 28);
	MOVLW       _dyna+0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+1 
	MOVLW       28
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+0 
	MOVLW       0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+1 
	CALL        _Net_Ethernet_28j60_putBytes+0, 0
;HTTP_Demo.c,340 :: 		while(udpDsc->dataLength--)
L_Net_Ethernet_28j60_UserUDP22:
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
	GOTO        L_Net_Ethernet_28j60_UserUDP23
;HTTP_Demo.c,342 :: 		Net_Ethernet_28j60_putByte(toupper(Net_Ethernet_28j60_getByte()));
	CALL        _Net_Ethernet_28j60_getByte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_toupper_character+0 
	CALL        _toupper+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByte_v+0 
	CALL        _Net_Ethernet_28j60_putByte+0, 0
;HTTP_Demo.c,343 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserUDP22
L_Net_Ethernet_28j60_UserUDP23:
;HTTP_Demo.c,344 :: 		return(len);
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+0, 0 
	MOVWF       R0 
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+1, 0 
	MOVWF       R1 
;HTTP_Demo.c,345 :: 		}
L_end_Net_Ethernet_28j60_UserUDP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserUDP

_MCUInit:

;HTTP_Demo.c,349 :: 		void MCUInit() {
;HTTP_Demo.c,350 :: 		cnt = 0;             // Initialize cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,351 :: 		TRISB = 0;           // PORTB is output
	CLRF        TRISB+0 
;HTTP_Demo.c,352 :: 		PORTB = 0xFF;        // Initialize PORTB
	MOVLW       255
	MOVWF       PORTB+0 
;HTTP_Demo.c,354 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;HTTP_Demo.c,355 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,356 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,357 :: 		INTCON = 0xC0;       // Set GIE, PEIE
	MOVLW       192
	MOVWF       INTCON+0 
;HTTP_Demo.c,358 :: 		TMR0IE_bit = 1;      // Enable TMRO interrupt
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;HTTP_Demo.c,359 :: 		}
L_end_MCUInit:
	RETURN      0
; end of _MCUInit

_interrupt:

;HTTP_Demo.c,362 :: 		void interrupt() {
;HTTP_Demo.c,363 :: 		if (TMR0IF_bit) {
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt24
;HTTP_Demo.c,364 :: 		cnt++;             // Increment value of cnt on every interrupt
	INFSNZ      _cnt+0, 1 
	INCF        _cnt+1, 1 
;HTTP_Demo.c,365 :: 		if (cnt >= 200) {
	MOVLW       0
	SUBWF       _cnt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt43
	MOVLW       200
	SUBWF       _cnt+0, 0 
L__interrupt43:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt25
;HTTP_Demo.c,366 :: 		cnt = 0;         // Reset cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,367 :: 		Net_Ethernet_28j60_UserTimerSec++;
	MOVLW       1
	ADDWF       _Net_Ethernet_28j60_UserTimerSec+0, 1 
	MOVLW       0
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+1, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+2, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+3, 1 
;HTTP_Demo.c,368 :: 		}
L_interrupt25:
;HTTP_Demo.c,369 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,370 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,371 :: 		TMR0IF_bit = 0;    // clear TMR0IF
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;HTTP_Demo.c,372 :: 		}
L_interrupt24:
;HTTP_Demo.c,373 :: 		}
L_end_interrupt:
L__interrupt42:
	RETFIE      1
; end of _interrupt

_main:

;HTTP_Demo.c,379 :: 		void    main() {
;HTTP_Demo.c,380 :: 		MCUInit();
	CALL        _MCUInit+0, 0
;HTTP_Demo.c,381 :: 		ANSEL = 0x0C;           // AN2 and AN3 convertors will be used
	MOVLW       12
	MOVWF       ANSEL+0 
;HTTP_Demo.c,382 :: 		C1ON_bit = 0;           // Disable comparators
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;HTTP_Demo.c,383 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;HTTP_Demo.c,384 :: 		PORTA = 0 ;
	CLRF        PORTA+0 
;HTTP_Demo.c,385 :: 		TRISA = 0xff ;          // set PORTA as input for ADC
	MOVLW       255
	MOVWF       TRISA+0 
;HTTP_Demo.c,386 :: 		ANSELH = 0x0C;
	MOVLW       12
	MOVWF       ANSELH+0 
;HTTP_Demo.c,387 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,388 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,389 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,390 :: 		PORTB = 0;
	CLRF        PORTB+0 
;HTTP_Demo.c,391 :: 		TRISB = 0xFF;           // set PORTB as input for buttons
	MOVLW       255
	MOVWF       TRISB+0 
;HTTP_Demo.c,393 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,394 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,395 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,402 :: 		Net_Ethernet_28j60_stackInitTCP();
	CALL        _Net_Ethernet_28j60_stackInitTCP+0, 0
;HTTP_Demo.c,403 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;HTTP_Demo.c,404 :: 		Net_Ethernet_28j60_Init(myMacAddr, myIpAddr, Net_Ethernet_28j60_FULLDUPLEX)  ;
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
;HTTP_Demo.c,405 :: 		Net_Ethernet_28j60_confNetwork(ipMask, gwIpAddr, dnsIpAddr);
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
;HTTP_Demo.c,407 :: 		while(1) {
L_main26:
;HTTP_Demo.c,409 :: 		Net_Ethernet_28j60_doPacket() ;   // process incoming Ethernet packets
	CALL        _Net_Ethernet_28j60_doPacket+0, 0
;HTTP_Demo.c,411 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	CLRF        _i+0 
L_main28:
	MOVLW       _NUM_OF_SOCKET_28j60
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main29
;HTTP_Demo.c,412 :: 		if(socket_28j60[i].open == 0)
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
	GOTO        L_main31
;HTTP_Demo.c,413 :: 		pos[i] = 0;
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
L_main31:
;HTTP_Demo.c,411 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	INCF        _i+0, 1 
;HTTP_Demo.c,414 :: 		}
	GOTO        L_main28
L_main29:
;HTTP_Demo.c,416 :: 		}
	GOTO        L_main26
;HTTP_Demo.c,417 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
