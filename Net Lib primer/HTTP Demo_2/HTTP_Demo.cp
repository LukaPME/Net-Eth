#line 1 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
#line 1 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60.h"
#line 111 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60.h"
typedef struct
 {
 unsigned char valid;
 unsigned long tmr;
 unsigned char ip[4];
 unsigned char mac[6];
 } Net_Ethernet_28j60_arpCacheStruct;

extern Net_Ethernet_28j60_arpCacheStruct Net_Ethernet_28j60_arpCache[];

extern unsigned char Net_Ethernet_28j60_macAddr[6];
extern unsigned char Net_Ethernet_28j60_ipAddr[4];
extern unsigned char Net_Ethernet_28j60_gwIpAddr[4];
extern unsigned char Net_Ethernet_28j60_ipMask[4];
extern unsigned char Net_Ethernet_28j60_dnsIpAddr[4];
extern unsigned char Net_Ethernet_28j60_rmtIpAddr[4];

extern unsigned long Net_Ethernet_28j60_userTimerSec;



typedef struct {
 char remoteIP[4];
 char remoteMAC[6];
 unsigned int remotePort;
 unsigned int destPort;
 unsigned int dataLength;
 unsigned int broadcastMark;
} UDP_28j60_Dsc;


extern UDP_28j60_Dsc udpRecord_28j60;



typedef struct {
 char remoteIP[4];
 char remoteMAC[6];
 unsigned int remotePort;
 unsigned int destPort;

 unsigned int dataLength;
 unsigned int remoteMSS;
 unsigned int myWin;
 unsigned int myMSS;
 unsigned long mySeq;
 unsigned long myACK;

 char stateTimer;
 char retransmitTimer;
 unsigned int packetID;
 char open;
 char ID;
 char broadcastMark;
 char state;









 unsigned int nextSend;
 unsigned int lastACK;
 unsigned int lastSent;
 unsigned int lastWritten;
 unsigned int numToSend;
 char buffState;
 char *txBuffer;


} SOCKET_28j60_Dsc;


extern const char NUM_OF_SOCKET_28j60;
extern const unsigned int TCP_TX_SIZE_28j60;
extern const unsigned int MY_MSS_28j60;
extern const unsigned int SYN_FIN_WAIT_28j60;
extern const unsigned int RETRANSMIT_WAIT_28j60;

extern char tx_buffers_28j60[][];
extern SOCKET_28j60_Dsc socket_28j60[];
#line 206 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60.h"
extern void Net_Ethernet_28j60_Init(unsigned char *resetPort, unsigned char resetBit, unsigned char *CSport, unsigned char CSbit, unsigned char *mac, unsigned char *ip, unsigned char configuration);
extern unsigned char Net_Ethernet_28j60_doPacket();
extern void Net_Ethernet_28j60_putByte(unsigned char b);
extern void Net_Ethernet_28j60_putBytes(unsigned char *ptr, unsigned int n);
extern void Net_Ethernet_28j60_putConstBytes(const unsigned char *ptr, unsigned int n);
extern unsigned char Net_Ethernet_28j60_getByte();
extern void Net_Ethernet_28j60_getBytes(unsigned char *ptr, unsigned int addr, unsigned int n);
extern unsigned int Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc);
extern void Net_Ethernet_28j60_payloadInitUDP();
extern void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket);
extern void Net_Ethernet_28j60_confNetwork(char *ipMask, char *gwIpAddr, char *dnsIpAddr);

extern char Net_Ethernet_28j60_connectTCP(char *remoteIP, unsigned int remote_port ,unsigned int my_port, SOCKET_28j60_Dsc **used_socket);
extern char Net_Ethernet_28j60_disconnectTCP(SOCKET_28j60_Dsc *socket);
extern char Net_Ethernet_28j60_startSendTCP(SOCKET_28j60_Dsc *socket);

extern char Net_Ethernet_28j60_putByteTCP(char ch, SOCKET_28j60_Dsc *socket);
extern unsigned int Net_Ethernet_28j60_putBytesTCP(char *ptr,unsigned int n, SOCKET_28j60_Dsc *socket);
extern unsigned int Net_Ethernet_28j60_putConstBytesTCP(const char *ptr,unsigned int n, SOCKET_28j60_Dsc *socket);
extern unsigned int Net_Ethernet_28j60_putStringTCP(char *ptr, SOCKET_28j60_Dsc *socket);
extern unsigned int Net_Ethernet_28j60_putConstStringTCP(const char *ptr, SOCKET_28j60_Dsc *socket);
extern char Net_Ethernet_28j60_bufferEmptyTCP(SOCKET_28j60_Dsc *socket);
extern void Net_Ethernet_28j60_stackInitTCP();
#line 1 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
#line 10 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_readPacket();
#line 24 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
char Net_Ethernet_28j60_doTCP(unsigned int start, unsigned int ipHeaderLen, unsigned int payloadAddr);
#line 38 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doUDP(unsigned int start, unsigned char ipHeaderLen, unsigned int payloadAddr);
unsigned int Net_Ethernet_28j60_flushUDP(unsigned char *destMac, unsigned char *destIP, unsigned int sourcePort, unsigned int destPort, unsigned int pktLen);
#line 49 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doDHCP();
unsigned char Net_Ethernet_28j60_DHCPReceive(void);
unsigned char Net_Ethernet_28j60_DHCPmsg(unsigned char messageType, unsigned char renewFlag);
#line 62 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doDNS();
#line 72 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doARP();
#line 84 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_checksum(unsigned int start, unsigned int l);
#line 100 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_RAMcopy(unsigned int start, unsigned int stop, unsigned int dest, unsigned char w);
#line 111 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_MACswap();
#line 122 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_IPswap(void);
#line 133 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_TXpacket(unsigned int l);
#line 147 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_memcmp(unsigned int addr, unsigned char *s, unsigned char l);
#line 161 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_memcpy(unsigned int addr, unsigned char *s, unsigned int l);
#line 176 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeMemory(unsigned int addr, unsigned char v1, unsigned char v2);
#line 190 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeMemory2(unsigned int v);
#line 203 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeMem(unsigned int addr, unsigned char v1);
#line 215 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_readMem(unsigned int addr);
#line 228 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_readReg(unsigned char addr);
#line 242 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeReg(unsigned char addr, unsigned short v);
#line 256 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_setBitReg(unsigned char addr, unsigned char mask);
#line 270 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_clearBitReg(unsigned char addr, unsigned char mask);
#line 284 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_setRxReadAddress(unsigned addr);
#line 298 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeAddr(unsigned char addr, unsigned int v);
#line 312 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writePHY(unsigned char reg, unsigned short h, unsigned short l);
#line 326 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_readPHY(unsigned char reg, unsigned char *h, unsigned char *l);
#line 338 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_delay();
#line 352 "d:/luka-probe/microc/net lib primer/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_Init2(unsigned char fullDuplex);
void Net_Ethernet_28j60_socketInitTCP(char id);
void Net_Ethernet_28j60_timerTCP();

extern unsigned int Net_Ethernet_28j60_pktLen;

extern char Net_Ethernet_28j60_bufferTCP(char c, char tx, char curr_sock);
extern char Net_Ethernet_28j60_txTCP (char flag, char curr_sock);
#line 5 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
sbit Eth1_Link at RB5_bit;
sbit Net_Ethernet_28j60_Rst at LATA5_bit;
sbit Net_Ethernet_28j60_CS at LATA4_bit;
sbit Eth1_Link_Direction at TRISB5_bit;
sbit Net_Ethernet_28j60_Rst_Direction at TRISA5_bit;
sbit Net_Ethernet_28j60_CS_Direction at TRISA4_bit;
#line 16 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
const code unsigned char httpHeader[] = "HTTP/1.1 200 OK\nContent-Length: 7787\nConnection: close\nContent-type: ";
const code unsigned char httpMimeTypeHTML[] = "text/html\n\n";
const unsigned char httpMimeTypeScript[] = "text/plain\n\n" ;
unsigned char httpMethod[] = "GET /";
unsigned char httpRequ[] = "GET / HTTP/1.1";
char sendHTML_mark = 0;

unsigned int pos[10];
char i;
unsigned long httpCounter = 0 ;
char txt[7] = "";
char txt1[4]= "";
int ij;
int pg_size;
#line 101 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
char html_code[] = "\HTTP/1.1 200 OK\nConnection: close\nContent-type: text/html\n\n<HTML><HEAD><link rel=\"icon\" type=\"image/png\" href=\"https://png.icons8.com/ios/50/000000/facebook.png\"><TITLE>PME Clock</TITLE></HEAD><BODY><style>body {background-color: #ddffcc;}</style><center><h2>PME Clock</h2><h3>Time | <a href=/2>SNTP</a> | <a href=/3>Network</a> | <a href=/4>System</a> | <a href=/admin>ADMIN</a></h3><table border=1 style=\"font-size:20px ;font-family: terminal ;\" width=500><tr><td>Date and Time</td><td align=right><script>document.write(\"Cao\")</script></td></tr><tr><td>Unix Epoch</td><td align=right><script>document.write(\"EPOCH\")</script></td></tr><tr><td>Julian Day</td><td align=right><script>document.write(\"EPOCH / 24 / 3600 + 2440587.5\")</script></td></tr><tr><td>Last sync</td><td align=right><script>document.write(\"LAST\")</script></td></tr><HTML><HEAD></table><br>Pogledajte ceo proizvodni program na <a href=http://www.pme.rs target=_blank>www.pme.rs</a></center></BODY></HTML>" ;
#line 107 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
unsigned char myMacAddr[6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3b};
unsigned char myIpAddr[4] = {192, 168, 1, 222 };
unsigned char gwIpAddr[4] = {192, 168, 1, 1 };
unsigned char ipMask[4] = {255, 255, 255, 0 };
unsigned char dnsIpAddr[4] = {192, 168, 20, 1 };

unsigned char getRequest[15];
unsigned char dyna[31] ;
#line 181 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
SOCKET_28j60_Dsc *currSocket, *socketHTML;
const char *indexPagePtr;

const char RESET = 0;
const char SET = 1;

char sendRestOfPage_flag = RESET;
char disconnect_flag = RESET;

int my_strstr(int index, char *s2, char *s1, char *s3)
{
 int i, j, k;
 int flag = 0;



 for( i = index; s2[i] != '\0'; i++)
 {
 if (s2[i] == s1[0])
 {
 for (j = i; ; j++)
 {
 if (s1[j-i] == '\0'){ flag = 1;
 break;}
 if (s2[j] == s1[j-i])
 continue;
 else
 break;
 }
 }
 if (flag == 1)
 break;
 }

 k=0;
 for ( i = j ; i < (j + strlen(s3)) ; i++) {
 html_code[i] = s3[k];
 k++;
 }
 return j;
#line 225 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
}


void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
 unsigned int len;
 int i ;
 int res = 0;
 int rezSta;
 char pg_num;

 char promena[] ="#aa0f0f";
 char niz[] ="background-color: ";

 char j = 0;
 char pomniz[] = "";
#line 258 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
 if (sendHTML_mark == 0) {
 sendHTML_mark = 1;
#line 274 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
 res = 0;
 res = my_strstr(res, html_code, niz, promena);
#line 282 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
 res = my_strstr(res, html_code,"font-size:","40px");


 pg_size = strlen(html_code);

 }




 if (sendHTML_mark == 1) {

 while (pos[socket->ID] < pg_size) {
 if (Net_Ethernet_28j60_putByteTCP(html_code[pos[socket->ID]++], socket) == 0) {
 pos[socket->ID]--;
 break;
 }
 }
 if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= pg_size) ) {
 Net_Ethernet_28j60_disconnectTCP(socket);
 socket_28j60[socket->ID].state = 0;
 sendHTML_mark = 0;
 pos[socket->ID] = 0;
 }
 }
}


unsigned int Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc) {

 unsigned int len;


 ByteToStr(udpDsc->remoteIP[0], dyna);
 dyna[3] = '.';
 ByteToStr(udpDsc->remoteIP[1], dyna + 4);
 dyna[7] = '.';
 ByteToStr(udpDsc->remoteIP[2], dyna + 8);
 dyna[11] = '.';
 ByteToStr(udpDsc->remoteIP[3], dyna + 12);

 dyna[15] = ':';


 WordToStr(udpDsc->remotePort, dyna + 16);
 dyna[21] = '[';
 WordToStr(udpDsc->destPort, dyna + 22);
 dyna[27] = ']';
 dyna[28] = 0;


 len = 28 + udpDsc->dataLength;


 Net_Ethernet_28j60_putBytes(dyna, 28);



 while(udpDsc->dataLength--)
 {
 Net_Ethernet_28j60_putByte(toupper(Net_Ethernet_28j60_getByte()));
 }
 return(len);
}


unsigned int cnt;
void MCUInit() {
 cnt = 0;
 TRISB = 0;
 PORTB = 0xFF;

 T0CON = 0x88;
 TMR0H = 0x63;
 TMR0L = 0xC0;
 INTCON = 0xC0;
 TMR0IE_bit = 1;
}


void interrupt() {
 if (TMR0IF_bit) {
 cnt++;
 if (cnt >= 200) {
 cnt = 0;
 Net_Ethernet_28j60_UserTimerSec++;
 }
 TMR0H = 0x63;
 TMR0L = 0xC0;
 TMR0IF_bit = 0;
 }
}
#line 379 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
void main() {
 MCUInit();
 ANSEL = 0x0C;
 C1ON_bit = 0;
 C2ON_bit = 0;
 PORTA = 0 ;
 TRISA = 0xff ;
 ANSELH = 0x0C;
 PORTD = 0 ;
 TRISD = 0 ;
 SLRCON = 0;
 PORTB = 0;
 TRISB = 0xFF;

 PORTD = 0 ;
 TRISD = 0 ;
 SLRCON = 0;
#line 402 "D:/Luka-Probe/MicroC/Net Lib primer/HTTP Demo_2/HTTP_Demo.c"
 Net_Ethernet_28j60_stackInitTCP();
 SPI1_Init();
 Net_Ethernet_28j60_Init(myMacAddr, myIpAddr,  0b1 ) ;
 Net_Ethernet_28j60_confNetwork(ipMask, gwIpAddr, dnsIpAddr);

 while(1) {

 Net_Ethernet_28j60_doPacket() ;

 for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
 if(socket_28j60[i].open == 0)
 pos[i] = 0;
 }

 }
}
