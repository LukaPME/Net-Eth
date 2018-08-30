
_my_strstr:

;HTTP_Demo.c,63 :: 		int my_strstr(int index, char *s1)
;HTTP_Demo.c,66 :: 		int flag = 0;
	CLRF        my_strstr_flag_L0+0 
	CLRF        my_strstr_flag_L0+1 
;HTTP_Demo.c,70 :: 		for( i = index; html_code[i] != '\0'; i++)
	MOVF        FARG_my_strstr_index+0, 0 
	MOVWF       R3 
	MOVF        FARG_my_strstr_index+1, 0 
	MOVWF       R4 
L_my_strstr0:
	MOVLW       _html_code+0
	ADDWF       R3, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_html_code+0)
	ADDWFC      R4, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_html_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R4, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_my_strstr1
;HTTP_Demo.c,72 :: 		if (html_code[i] == s1[0])
	MOVLW       _html_code+0
	ADDWF       R3, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_html_code+0)
	ADDWFC      R4, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_html_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R4, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVFF       FARG_my_strstr_s1+0, FSR2
	MOVFF       FARG_my_strstr_s1+1, FSR2H
	MOVF        R1, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr3
;HTTP_Demo.c,74 :: 		for (j = i; ; j++)
	MOVF        R3, 0 
	MOVWF       R5 
	MOVF        R4, 0 
	MOVWF       R6 
L_my_strstr4:
;HTTP_Demo.c,76 :: 		if (s1[j-i] == '\0'){ flag = 1;
	MOVF        R3, 0 
	SUBWF       R5, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	SUBWFB      R6, 0 
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
;HTTP_Demo.c,77 :: 		break;}
	GOTO        L_my_strstr5
L_my_strstr7:
;HTTP_Demo.c,78 :: 		if (html_code[j] == s1[j-i])
	MOVLW       _html_code+0
	ADDWF       R5, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_html_code+0)
	ADDWFC      R6, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_html_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R6, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R3, 0 
	SUBWF       R5, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	SUBWFB      R6, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_my_strstr_s1+0, 0 
	MOVWF       FSR2 
	MOVF        R1, 0 
	ADDWFC      FARG_my_strstr_s1+1, 0 
	MOVWF       FSR2H 
	MOVF        R2, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr8
;HTTP_Demo.c,79 :: 		continue;
	GOTO        L_my_strstr6
L_my_strstr8:
;HTTP_Demo.c,81 :: 		break;
	GOTO        L_my_strstr5
;HTTP_Demo.c,82 :: 		}
L_my_strstr6:
;HTTP_Demo.c,74 :: 		for (j = i; ; j++)
	INFSNZ      R5, 1 
	INCF        R6, 1 
;HTTP_Demo.c,82 :: 		}
	GOTO        L_my_strstr4
L_my_strstr5:
;HTTP_Demo.c,83 :: 		}
L_my_strstr3:
;HTTP_Demo.c,84 :: 		if (flag == 1)
	MOVLW       0
	XORWF       my_strstr_flag_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__my_strstr64
	MOVLW       1
	XORWF       my_strstr_flag_L0+0, 0 
L__my_strstr64:
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr10
;HTTP_Demo.c,85 :: 		break;
	GOTO        L_my_strstr1
L_my_strstr10:
;HTTP_Demo.c,70 :: 		for( i = index; html_code[i] != '\0'; i++)
	INFSNZ      R3, 1 
	INCF        R4, 1 
;HTTP_Demo.c,86 :: 		}
	GOTO        L_my_strstr0
L_my_strstr1:
;HTTP_Demo.c,93 :: 		return j;
	MOVF        R5, 0 
	MOVWF       R0 
	MOVF        R6, 0 
	MOVWF       R1 
;HTTP_Demo.c,94 :: 		}
L_end_my_strstr:
	RETURN      0
; end of _my_strstr

_Html_Change:

;HTTP_Demo.c,96 :: 		void Html_Change(unsigned int pom_promena, SOCKET_28j60_Dsc *socketHTML, char *pro) {
;HTTP_Demo.c,97 :: 		for (ik = index_br; ik < strlen(pro); ik++) {
	MOVF        _index_br+0, 0 
	MOVWF       _ik+0 
	MOVF        _index_br+1, 0 
	MOVWF       _ik+1 
L_Html_Change11:
	MOVF        FARG_Html_Change_pro+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_Html_Change_pro+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       128
	XORWF       _ik+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Html_Change66
	MOVF        R0, 0 
	SUBWF       _ik+0, 0 
L__Html_Change66:
	BTFSC       STATUS+0, 0 
	GOTO        L_Html_Change12
;HTTP_Demo.c,98 :: 		buff_slanje = pro[ik];
	MOVF        _ik+0, 0 
	ADDWF       FARG_Html_Change_pro+0, 0 
	MOVWF       FSR0 
	MOVF        _ik+1, 0 
	ADDWFC      FARG_Html_Change_pro+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _buff_slanje+0 
;HTTP_Demo.c,99 :: 		pom_promena = pos[socketHTML->ID];
	MOVLW       35
	ADDWF       FARG_Html_Change_socketHTML+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Html_Change_socketHTML+1, 0 
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
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Html_Change_pom_promena+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Html_Change_pom_promena+1 
;HTTP_Demo.c,100 :: 		pos[socketHTML->ID]++;
	MOVF        R2, 0 
	MOVWF       R0 
	MOVF        R3, 0 
	MOVWF       R1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,101 :: 		if (Net_Ethernet_28j60_putByteTCP(buff_slanje, socketHTML) == 0) {
	MOVF        _buff_slanje+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_ch+0 
	MOVF        FARG_Html_Change_socketHTML+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Html_Change_socketHTML+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Html_Change14
;HTTP_Demo.c,102 :: 		pos[socketHTML->ID]--;
	MOVLW       35
	ADDWF       FARG_Html_Change_socketHTML+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Html_Change_socketHTML+1, 0 
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
;HTTP_Demo.c,103 :: 		index_br = ik;
	MOVF        _ik+0, 0 
	MOVWF       _index_br+0 
	MOVF        _ik+1, 0 
	MOVWF       _index_br+1 
;HTTP_Demo.c,104 :: 		end_petlja = 1;
	MOVLW       1
	MOVWF       _end_petlja+0 
;HTTP_Demo.c,105 :: 		return;
	GOTO        L_end_Html_Change
;HTTP_Demo.c,106 :: 		}
L_Html_Change14:
;HTTP_Demo.c,97 :: 		for (ik = index_br; ik < strlen(pro); ik++) {
	INFSNZ      _ik+0, 1 
	INCF        _ik+1, 1 
;HTTP_Demo.c,107 :: 		}
	GOTO        L_Html_Change11
L_Html_Change12:
;HTTP_Demo.c,108 :: 		index_br = 0;
	CLRF        _index_br+0 
	CLRF        _index_br+1 
;HTTP_Demo.c,110 :: 		}
L_end_Html_Change:
	RETURN      0
; end of _Html_Change

_Net_Ethernet_28j60_UserTCP:

;HTTP_Demo.c,112 :: 		void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
;HTTP_Demo.c,115 :: 		int res = 0;
;HTTP_Demo.c,119 :: 		if(socket->destPort != 80) {
	MOVLW       12
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP68
	MOVLW       80
	XORWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP68:
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP15
;HTTP_Demo.c,120 :: 		return;
	GOTO        L_end_Net_Ethernet_28j60_UserTCP
;HTTP_Demo.c,121 :: 		}
L_Net_Ethernet_28j60_UserTCP15:
;HTTP_Demo.c,124 :: 		for(len = 0; len < 10; len++){
	CLRF        Net_Ethernet_28j60_UserTCP_len_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_len_L0+1 
L_Net_Ethernet_28j60_UserTCP16:
	MOVLW       0
	SUBWF       Net_Ethernet_28j60_UserTCP_len_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP69
	MOVLW       10
	SUBWF       Net_Ethernet_28j60_UserTCP_len_L0+0, 0 
L__Net_Ethernet_28j60_UserTCP69:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP17
;HTTP_Demo.c,125 :: 		getRequest[len] = Net_Ethernet_28j60_getByte();
	MOVLW       _getRequest+0
	ADDWF       Net_Ethernet_28j60_UserTCP_len_L0+0, 0 
	MOVWF       FLOC__Net_Ethernet_28j60_UserTCP+0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_len_L0+1, 0 
	MOVWF       FLOC__Net_Ethernet_28j60_UserTCP+1 
	CALL        _Net_Ethernet_28j60_getByte+0, 0
	MOVFF       FLOC__Net_Ethernet_28j60_UserTCP+0, FSR1
	MOVFF       FLOC__Net_Ethernet_28j60_UserTCP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,124 :: 		for(len = 0; len < 10; len++){
	INFSNZ      Net_Ethernet_28j60_UserTCP_len_L0+0, 1 
	INCF        Net_Ethernet_28j60_UserTCP_len_L0+1, 1 
;HTTP_Demo.c,126 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP16
L_Net_Ethernet_28j60_UserTCP17:
;HTTP_Demo.c,127 :: 		getRequest[len] = 0;
	MOVLW       _getRequest+0
	ADDWF       Net_Ethernet_28j60_UserTCP_len_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_len_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,128 :: 		len = 0 ;
	CLRF        Net_Ethernet_28j60_UserTCP_len_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_len_L0+1 
;HTTP_Demo.c,131 :: 		if(memcmp(getRequest, httpMethod, 5)&&(socket->state != 3)){
	MOVLW       _getRequest+0
	MOVWF       FARG_memcmp_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_memcmp_s1+1 
	MOVLW       _httpMethod+0
	MOVWF       FARG_memcmp_s2+0 
	MOVLW       hi_addr(_httpMethod+0)
	MOVWF       FARG_memcmp_s2+1 
	MOVLW       5
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP21
	MOVLW       37
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP21
L__Net_Ethernet_28j60_UserTCP62:
;HTTP_Demo.c,132 :: 		return;
	GOTO        L_end_Net_Ethernet_28j60_UserTCP
;HTTP_Demo.c,133 :: 		}
L_Net_Ethernet_28j60_UserTCP21:
;HTTP_Demo.c,135 :: 		if (sendHTML_mark == 0) {
	MOVF        _sendHTML_mark+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP22
;HTTP_Demo.c,136 :: 		sendHTML_mark = 1;
	MOVLW       1
	MOVWF       _sendHTML_mark+0 
;HTTP_Demo.c,139 :: 		res = my_strstr(res, "font-size:");
	CLRF        FARG_my_strstr_index+0 
	CLRF        FARG_my_strstr_index+1 
	MOVLW       ?lstr1_HTTP_Demo+0
	MOVWF       FARG_my_strstr_s1+0 
	MOVLW       hi_addr(?lstr1_HTTP_Demo+0)
	MOVWF       FARG_my_strstr_s1+1 
	CALL        _my_strstr+0, 0
;HTTP_Demo.c,140 :: 		prva_promena = res ;
	MOVF        R0, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_prva_promena_L0+0 
	MOVF        R1, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_prva_promena_L0+1 
;HTTP_Demo.c,141 :: 		res = my_strstr(res,"color:");
	MOVF        R0, 0 
	MOVWF       FARG_my_strstr_index+0 
	MOVF        R1, 0 
	MOVWF       FARG_my_strstr_index+1 
	MOVLW       ?lstr2_HTTP_Demo+0
	MOVWF       FARG_my_strstr_s1+0 
	MOVLW       hi_addr(?lstr2_HTTP_Demo+0)
	MOVWF       FARG_my_strstr_s1+1 
	CALL        _my_strstr+0, 0
;HTTP_Demo.c,142 :: 		druga_promena = res;
	MOVF        R0, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_druga_promena_L0+0 
	MOVF        R1, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_druga_promena_L0+1 
;HTTP_Demo.c,143 :: 		res = my_strstr(res,"<title> ");
	MOVF        R0, 0 
	MOVWF       FARG_my_strstr_index+0 
	MOVF        R1, 0 
	MOVWF       FARG_my_strstr_index+1 
	MOVLW       ?lstr3_HTTP_Demo+0
	MOVWF       FARG_my_strstr_s1+0 
	MOVLW       hi_addr(?lstr3_HTTP_Demo+0)
	MOVWF       FARG_my_strstr_s1+1 
	CALL        _my_strstr+0, 0
;HTTP_Demo.c,144 :: 		treca_promena = res;
	MOVF        R0, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_treca_promena_L0+0 
	MOVF        R1, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_treca_promena_L0+1 
;HTTP_Demo.c,147 :: 		}
L_Net_Ethernet_28j60_UserTCP22:
;HTTP_Demo.c,150 :: 		if (sendHTML_mark == 1) {
	MOVF        _sendHTML_mark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP23
;HTTP_Demo.c,152 :: 		while (pos[socket->ID] < pg_size) {
L_Net_Ethernet_28j60_UserTCP24:
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
	GOTO        L__Net_Ethernet_28j60_UserTCP70
	MOVF        _pg_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP70:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP25
;HTTP_Demo.c,154 :: 		if ( (pos[socket->ID] == prva_promena) || (end_petlja == 1) ) {
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
	MOVF        R2, 0 
	XORWF       Net_Ethernet_28j60_UserTCP_prva_promena_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP71
	MOVF        Net_Ethernet_28j60_UserTCP_prva_promena_L0+0, 0 
	XORWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP71:
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP61
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP61
	GOTO        L_Net_Ethernet_28j60_UserTCP28
L__Net_Ethernet_28j60_UserTCP61:
;HTTP_Demo.c,155 :: 		if (end_petlja == 1) end_petlja = 0;
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP29
	CLRF        _end_petlja+0 
L_Net_Ethernet_28j60_UserTCP29:
;HTTP_Demo.c,156 :: 		Html_Change(prva_promena, socket, promena1);
	MOVF        Net_Ethernet_28j60_UserTCP_prva_promena_L0+0, 0 
	MOVWF       FARG_Html_Change_pom_promena+0 
	MOVF        Net_Ethernet_28j60_UserTCP_prva_promena_L0+1, 0 
	MOVWF       FARG_Html_Change_pom_promena+1 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Html_Change_socketHTML+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Html_Change_socketHTML+1 
	MOVLW       _promena1+0
	MOVWF       FARG_Html_Change_pro+0 
	MOVLW       hi_addr(_promena1+0)
	MOVWF       FARG_Html_Change_pro+1 
	CALL        _Html_Change+0, 0
;HTTP_Demo.c,157 :: 		if (end_petlja == 1) break;
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP30
	GOTO        L_Net_Ethernet_28j60_UserTCP25
L_Net_Ethernet_28j60_UserTCP30:
;HTTP_Demo.c,158 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP31
L_Net_Ethernet_28j60_UserTCP28:
;HTTP_Demo.c,160 :: 		else  if ( (pos[socket->ID] == druga_promena) || (end_petlja == 1) ) {
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
	MOVF        R2, 0 
	XORWF       Net_Ethernet_28j60_UserTCP_druga_promena_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP72
	MOVF        Net_Ethernet_28j60_UserTCP_druga_promena_L0+0, 0 
	XORWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP72:
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP60
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP60
	GOTO        L_Net_Ethernet_28j60_UserTCP34
L__Net_Ethernet_28j60_UserTCP60:
;HTTP_Demo.c,161 :: 		if (end_petlja == 1) end_petlja = 0;
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP35
	CLRF        _end_petlja+0 
L_Net_Ethernet_28j60_UserTCP35:
;HTTP_Demo.c,162 :: 		Html_Change(druga_promena, socket, promena2);
	MOVF        Net_Ethernet_28j60_UserTCP_druga_promena_L0+0, 0 
	MOVWF       FARG_Html_Change_pom_promena+0 
	MOVF        Net_Ethernet_28j60_UserTCP_druga_promena_L0+1, 0 
	MOVWF       FARG_Html_Change_pom_promena+1 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Html_Change_socketHTML+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Html_Change_socketHTML+1 
	MOVLW       _promena2+0
	MOVWF       FARG_Html_Change_pro+0 
	MOVLW       hi_addr(_promena2+0)
	MOVWF       FARG_Html_Change_pro+1 
	CALL        _Html_Change+0, 0
;HTTP_Demo.c,163 :: 		if (end_petlja == 1) break;
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP36
	GOTO        L_Net_Ethernet_28j60_UserTCP25
L_Net_Ethernet_28j60_UserTCP36:
;HTTP_Demo.c,164 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP37
L_Net_Ethernet_28j60_UserTCP34:
;HTTP_Demo.c,165 :: 		else  if ( (pos[socket->ID] == treca_promena) || (end_petlja == 1) ) {
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
	MOVF        R2, 0 
	XORWF       Net_Ethernet_28j60_UserTCP_treca_promena_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP73
	MOVF        Net_Ethernet_28j60_UserTCP_treca_promena_L0+0, 0 
	XORWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP73:
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP59
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP59
	GOTO        L_Net_Ethernet_28j60_UserTCP40
L__Net_Ethernet_28j60_UserTCP59:
;HTTP_Demo.c,166 :: 		if (end_petlja == 1) end_petlja = 0;
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP41
	CLRF        _end_petlja+0 
L_Net_Ethernet_28j60_UserTCP41:
;HTTP_Demo.c,167 :: 		Html_Change(treca_promena, socket, promena3);
	MOVF        Net_Ethernet_28j60_UserTCP_treca_promena_L0+0, 0 
	MOVWF       FARG_Html_Change_pom_promena+0 
	MOVF        Net_Ethernet_28j60_UserTCP_treca_promena_L0+1, 0 
	MOVWF       FARG_Html_Change_pom_promena+1 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Html_Change_socketHTML+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Html_Change_socketHTML+1 
	MOVLW       _promena3+0
	MOVWF       FARG_Html_Change_pro+0 
	MOVLW       hi_addr(_promena3+0)
	MOVWF       FARG_Html_Change_pro+1 
	CALL        _Html_Change+0, 0
;HTTP_Demo.c,168 :: 		if (end_petlja == 1) break;
	MOVF        _end_petlja+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP42
	GOTO        L_Net_Ethernet_28j60_UserTCP25
L_Net_Ethernet_28j60_UserTCP42:
;HTTP_Demo.c,169 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP43
L_Net_Ethernet_28j60_UserTCP40:
;HTTP_Demo.c,172 :: 		buff_slanje = html_code[pos[socket->ID]++];
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
	MOVFF       R2, FSR2
	MOVFF       R3, FSR2H
	MOVLW       _html_code+0
	ADDWF       POSTINC2+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_html_code+0)
	ADDWFC      POSTINC2+0, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_html_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, _buff_slanje+0
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,173 :: 		if (Net_Ethernet_28j60_putByteTCP(buff_slanje, socket) == 0) {
	MOVF        _buff_slanje+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_ch+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP44
;HTTP_Demo.c,174 :: 		pos[socket->ID]--;
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
;HTTP_Demo.c,175 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP25
;HTTP_Demo.c,176 :: 		}
L_Net_Ethernet_28j60_UserTCP44:
;HTTP_Demo.c,177 :: 		}
L_Net_Ethernet_28j60_UserTCP43:
L_Net_Ethernet_28j60_UserTCP37:
L_Net_Ethernet_28j60_UserTCP31:
;HTTP_Demo.c,178 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP24
L_Net_Ethernet_28j60_UserTCP25:
;HTTP_Demo.c,180 :: 		if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= pg_size) ) {
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_bufferEmptyTCP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP47
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
	GOTO        L__Net_Ethernet_28j60_UserTCP74
	MOVF        _pg_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP74:
	BTFSS       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP47
L__Net_Ethernet_28j60_UserTCP58:
;HTTP_Demo.c,181 :: 		Net_Ethernet_28j60_disconnectTCP(socket);
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_disconnectTCP+0, 0
;HTTP_Demo.c,182 :: 		socket_28j60[socket->ID].state = 0;
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
;HTTP_Demo.c,183 :: 		sendHTML_mark = 0;
	CLRF        _sendHTML_mark+0 
;HTTP_Demo.c,184 :: 		pos[socket->ID] = 0;
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
;HTTP_Demo.c,185 :: 		}
L_Net_Ethernet_28j60_UserTCP47:
;HTTP_Demo.c,187 :: 		}
L_Net_Ethernet_28j60_UserTCP23:
;HTTP_Demo.c,188 :: 		}
L_end_Net_Ethernet_28j60_UserTCP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserTCP

_Net_Ethernet_28j60_UserUDP:

;HTTP_Demo.c,191 :: 		unsigned int    Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc) {
;HTTP_Demo.c,196 :: 		ByteToStr(udpDsc->remoteIP[0], dyna);                // first IP address byte
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, FSR0
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,197 :: 		dyna[3] = '.';
	MOVLW       46
	MOVWF       _dyna+3 
;HTTP_Demo.c,198 :: 		ByteToStr(udpDsc->remoteIP[1], dyna + 4);            // second
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
;HTTP_Demo.c,199 :: 		dyna[7] = '.';
	MOVLW       46
	MOVWF       _dyna+7 
;HTTP_Demo.c,200 :: 		ByteToStr(udpDsc->remoteIP[2], dyna + 8);            // third
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
;HTTP_Demo.c,201 :: 		dyna[11] = '.';
	MOVLW       46
	MOVWF       _dyna+11 
;HTTP_Demo.c,202 :: 		ByteToStr(udpDsc->remoteIP[3], dyna + 12);           // fourth
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
;HTTP_Demo.c,204 :: 		dyna[15] = ':';                                // add separator
	MOVLW       58
	MOVWF       _dyna+15 
;HTTP_Demo.c,207 :: 		WordToStr(udpDsc->remotePort, dyna + 16);
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
;HTTP_Demo.c,208 :: 		dyna[21] = '[';
	MOVLW       91
	MOVWF       _dyna+21 
;HTTP_Demo.c,209 :: 		WordToStr(udpDsc->destPort, dyna + 22);
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
;HTTP_Demo.c,210 :: 		dyna[27] = ']';
	MOVLW       93
	MOVWF       _dyna+27 
;HTTP_Demo.c,211 :: 		dyna[28] = 0;
	CLRF        _dyna+28 
;HTTP_Demo.c,214 :: 		len = 28 + udpDsc->dataLength;
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
;HTTP_Demo.c,217 :: 		Net_Ethernet_28j60_putBytes(dyna, 28);
	MOVLW       _dyna+0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+1 
	MOVLW       28
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+0 
	MOVLW       0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+1 
	CALL        _Net_Ethernet_28j60_putBytes+0, 0
;HTTP_Demo.c,221 :: 		while(udpDsc->dataLength--)
L_Net_Ethernet_28j60_UserUDP48:
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
	GOTO        L_Net_Ethernet_28j60_UserUDP49
;HTTP_Demo.c,223 :: 		Net_Ethernet_28j60_putByte(toupper(Net_Ethernet_28j60_getByte()));
	CALL        _Net_Ethernet_28j60_getByte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_toupper_character+0 
	CALL        _toupper+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByte_v+0 
	CALL        _Net_Ethernet_28j60_putByte+0, 0
;HTTP_Demo.c,224 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserUDP48
L_Net_Ethernet_28j60_UserUDP49:
;HTTP_Demo.c,225 :: 		return(len);
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+0, 0 
	MOVWF       R0 
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+1, 0 
	MOVWF       R1 
;HTTP_Demo.c,226 :: 		}
L_end_Net_Ethernet_28j60_UserUDP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserUDP

_MCUInit:

;HTTP_Demo.c,230 :: 		void MCUInit() {
;HTTP_Demo.c,231 :: 		cnt = 0;             // Initialize cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,232 :: 		TRISB = 0;           // PORTB is output
	CLRF        TRISB+0 
;HTTP_Demo.c,233 :: 		PORTB = 0xFF;        // Initialize PORTB
	MOVLW       255
	MOVWF       PORTB+0 
;HTTP_Demo.c,235 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;HTTP_Demo.c,236 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,237 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,238 :: 		INTCON = 0xC0;       // Set GIE, PEIE
	MOVLW       192
	MOVWF       INTCON+0 
;HTTP_Demo.c,239 :: 		TMR0IE_bit = 1;      // Enable TMRO interrupt
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;HTTP_Demo.c,240 :: 		}
L_end_MCUInit:
	RETURN      0
; end of _MCUInit

_interrupt:

;HTTP_Demo.c,243 :: 		void interrupt() {
;HTTP_Demo.c,244 :: 		if (TMR0IF_bit) {
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt50
;HTTP_Demo.c,245 :: 		cnt++;             // Increment value of cnt on every interrupt
	INFSNZ      _cnt+0, 1 
	INCF        _cnt+1, 1 
;HTTP_Demo.c,246 :: 		if (cnt >= 200) {
	MOVLW       0
	SUBWF       _cnt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt79
	MOVLW       200
	SUBWF       _cnt+0, 0 
L__interrupt79:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt51
;HTTP_Demo.c,247 :: 		cnt = 0;         // Reset cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,248 :: 		Net_Ethernet_28j60_UserTimerSec++;
	MOVLW       1
	ADDWF       _Net_Ethernet_28j60_UserTimerSec+0, 1 
	MOVLW       0
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+1, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+2, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+3, 1 
;HTTP_Demo.c,249 :: 		}
L_interrupt51:
;HTTP_Demo.c,250 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,251 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,252 :: 		TMR0IF_bit = 0;    // clear TMR0IF
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;HTTP_Demo.c,253 :: 		}
L_interrupt50:
;HTTP_Demo.c,254 :: 		}
L_end_interrupt:
L__interrupt78:
	RETFIE      1
; end of _interrupt

_main:

;HTTP_Demo.c,259 :: 		void    main() {
;HTTP_Demo.c,260 :: 		MCUInit();
	CALL        _MCUInit+0, 0
;HTTP_Demo.c,261 :: 		ANSEL = 0x0C;           // AN2 and AN3 convertors will be used
	MOVLW       12
	MOVWF       ANSEL+0 
;HTTP_Demo.c,262 :: 		C1ON_bit = 0;           // Disable comparators
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;HTTP_Demo.c,263 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;HTTP_Demo.c,264 :: 		PORTA = 0 ;
	CLRF        PORTA+0 
;HTTP_Demo.c,265 :: 		TRISA = 0xff ;          // set PORTA as input for ADC
	MOVLW       255
	MOVWF       TRISA+0 
;HTTP_Demo.c,266 :: 		ANSELH = 0x0C;
	MOVLW       12
	MOVWF       ANSELH+0 
;HTTP_Demo.c,267 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,268 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,269 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,270 :: 		PORTB = 0;
	CLRF        PORTB+0 
;HTTP_Demo.c,271 :: 		TRISB = 0xFF;           // set PORTB as input for buttons
	MOVLW       255
	MOVWF       TRISB+0 
;HTTP_Demo.c,273 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,274 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,275 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,277 :: 		Net_Ethernet_28j60_stackInitTCP();
	CALL        _Net_Ethernet_28j60_stackInitTCP+0, 0
;HTTP_Demo.c,278 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;HTTP_Demo.c,279 :: 		SPI_Rd_Ptr = SPI1_Read;
	MOVLW       _SPI1_Read+0
	MOVWF       _SPI_Rd_Ptr+0 
	MOVLW       hi_addr(_SPI1_Read+0)
	MOVWF       _SPI_Rd_Ptr+1 
	MOVLW       FARG_SPI1_Read_buffer+0
	MOVWF       _SPI_Rd_Ptr+2 
	MOVLW       hi_addr(FARG_SPI1_Read_buffer+0)
	MOVWF       _SPI_Rd_Ptr+3 
;HTTP_Demo.c,280 :: 		Net_Ethernet_28j60_Init(myMacAddr, myIpAddr, Net_Ethernet_28j60_FULLDUPLEX)  ;
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
;HTTP_Demo.c,281 :: 		Net_Ethernet_28j60_confNetwork(ipMask, gwIpAddr, dnsIpAddr);
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
;HTTP_Demo.c,283 :: 		while(1) {
L_main52:
;HTTP_Demo.c,285 :: 		Net_Ethernet_28j60_doPacket() ;   // process incoming Ethernet packets
	CALL        _Net_Ethernet_28j60_doPacket+0, 0
;HTTP_Demo.c,287 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	CLRF        _i+0 
L_main54:
	MOVLW       _NUM_OF_SOCKET_28j60
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main55
;HTTP_Demo.c,288 :: 		if(socket_28j60[i].open == 0)
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
	GOTO        L_main57
;HTTP_Demo.c,289 :: 		pos[i] = 0;
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
L_main57:
;HTTP_Demo.c,287 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	INCF        _i+0, 1 
;HTTP_Demo.c,290 :: 		}
	GOTO        L_main54
L_main55:
;HTTP_Demo.c,292 :: 		}
	GOTO        L_main52
;HTTP_Demo.c,293 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
