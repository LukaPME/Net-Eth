#line 1 "D:/Luka-Probe/MicroC/Net Lib header HTML/HTTP Demo_2/HTTP_Demo.c"
#line 1 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60.h"
#line 111 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60.h"
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
#line 206 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60.h"
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
#line 1 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
#line 10 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_readPacket();
#line 24 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
char Net_Ethernet_28j60_doTCP(unsigned int start, unsigned int ipHeaderLen, unsigned int payloadAddr);
#line 38 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doUDP(unsigned int start, unsigned char ipHeaderLen, unsigned int payloadAddr);
unsigned int Net_Ethernet_28j60_flushUDP(unsigned char *destMac, unsigned char *destIP, unsigned int sourcePort, unsigned int destPort, unsigned int pktLen);
#line 49 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doDHCP();
unsigned char Net_Ethernet_28j60_DHCPReceive(void);
unsigned char Net_Ethernet_28j60_DHCPmsg(unsigned char messageType, unsigned char renewFlag);
#line 62 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doDNS();
#line 72 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_doARP();
#line 84 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_checksum(unsigned int start, unsigned int l);
#line 100 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_RAMcopy(unsigned int start, unsigned int stop, unsigned int dest, unsigned char w);
#line 111 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_MACswap();
#line 122 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_IPswap(void);
#line 133 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_TXpacket(unsigned int l);
#line 147 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_memcmp(unsigned int addr, unsigned char *s, unsigned char l);
#line 161 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_memcpy(unsigned int addr, unsigned char *s, unsigned int l);
#line 176 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeMemory(unsigned int addr, unsigned char v1, unsigned char v2);
#line 190 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeMemory2(unsigned int v);
#line 203 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeMem(unsigned int addr, unsigned char v1);
#line 215 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_readMem(unsigned int addr);
#line 228 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
unsigned char Net_Ethernet_28j60_readReg(unsigned char addr);
#line 242 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeReg(unsigned char addr, unsigned short v);
#line 256 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_setBitReg(unsigned char addr, unsigned char mask);
#line 270 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_clearBitReg(unsigned char addr, unsigned char mask);
#line 284 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_setRxReadAddress(unsigned addr);
#line 298 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writeAddr(unsigned char addr, unsigned int v);
#line 312 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_writePHY(unsigned char reg, unsigned short h, unsigned short l);
#line 326 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_readPHY(unsigned char reg, unsigned char *h, unsigned char *l);
#line 338 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_delay();
#line 352 "d:/luka-probe/microc/net lib header html/http demo_2/__lib_netethenc28j60private.h"
void Net_Ethernet_28j60_Init2(unsigned char fullDuplex);
void Net_Ethernet_28j60_socketInitTCP(char id);
void Net_Ethernet_28j60_timerTCP();

extern unsigned int Net_Ethernet_28j60_pktLen;

extern char Net_Ethernet_28j60_bufferTCP(char c, char tx, char curr_sock);
extern char Net_Ethernet_28j60_txTCP (char flag, char curr_sock);
#line 1 "d:/luka-probe/microc/net lib header html/http demo_2/recources.h"
#line 142 "d:/luka-probe/microc/net lib header html/http demo_2/recources.h"
const char html_code[] = "\\HTTP/1.1 200 OK\nConnection: close\nContent-type: text/html\n\n<html xmlns='http://www.w3.org/1999/xhtml'><head><head><style>body{\margin: 0 ; padding:0; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 1.4em; color: #444444; background-color: #777777;}h1 {    margin:0px; font-weight: bold; font-size: 22px; color:#518b10;}h1 span {        font-size: 14px;        color: #666666;        line-height: 1.6em;}h2 {        font-weight: bold;        margin-bottom: 0px;        font-size: 14px;        color:#427707;        padding-top: 20px;}#templatemo_left_column {        float: left;        width: 483px;}#templatemo_left_content {        float: left;        margin: 0px 30px 30px 30px;        padding-left: 10px;        padding-bottom: 10px;        width: 413px;        text-align: justify;}.templatemo_service {        font-weight: bold;        font-size: 14px;        color:#427707;        height: 31px;        padding-top: 20px;        padding-left: 0px;        }#templatemo_right_column {        float: right;        width: 287px;}.templatemo_menu_list {        float: left;        width: 230px;        padding-left: 25px;}.templatemo_menu_list ul {        list-style-type: none;        margin: 10px;        padding: 0;        width: 213px;}#templatemo_right_content ul {        list-style-type: disc;}.templatemo_special {        float: left;        width: 180px;}#templatemo_footer {        clear: both;        width: 770px;        height: 32px;        padding-top: 20px;        text-align: center;        background: #545e54;        font-weight: bold;        color: #FFFFFF;}#templatemo_footer a {        color: #FFFFFF;}</style></head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><title> EasyPIC PRO v7      </title><meta name='keywords' content='free website template, CSS, cooking website, free layout download, templatemo' /><meta name='description' content='Cooking Template - free CSS website layout for anyone' /></head><body><div id='templatemo_container'>  <div id='templatemo_left_column'>    <div id='templatemo_title'>MikroElektronika</div>    <div id='templatemo_header'>    </div>    <div id='templatemo_left_content'>      <h1>EasyPIC PRO v7<br />      <span>Development system</span></h1>      <p>We presend PIC18 MCUs microcontrollers.</p>      <p>Board is delivered with MCU socket containing PIC18F87K22 microntroller.</p>      <div class='templatemo_service'>What is EasyPIC PRO v7?</div>      <p>EasyPIC PRO™ v7 is a full-featured development board for high pin-count 8-bit PIC® microntrollers. It contains many on-board           modules necessary for development variety of applications, including graphics, Ethernet, USB, Temperature measurement and other.           On-board mikroProg™ programmer and debugger supports over 155 PIC® microcontrollers. Board is delivered with MCU socket           containing PIC18F87K22 microntroller.</p>      <div class='templatemo_aboutus'>Key Benefits</div>      <p>Board features RS-232, USB UART, Ethernet connector, LCD, Serial EEPROM, Graphic LCD 128x64, Touch screen, Buzzer...</p>      <p>Development system features IDC10 connectors for all available ports, that are 100% compatible with over 70 additional boards from mikroElektronika.</p>    </div>  </div>  <div id='templatemo_right_column'>    <div class='templatemo_domain'><a href='http://www.mikroe.com' > http://www.mikroe.com</a></div>    <div id='templatemo_right_content'>        <h2>What&rsquo;s on EasyPIC PRO v7?</h2>        <ul>          <li>mikroProg with ICD support</li>          <li>RS-232 </li>          <li>Power supply source</li>          <li>External power supply</li>          <li>87 LEDs</li>          <li>87 push buttons</li>          <li>Temperature Sensor</li>          <li>LCD 2x16</li>          <li>Graphic LCD 128x64</li>        </ul>        <h2>About MikroElektronika</h2>                <p><strong>MikroElektronika</strong>        was established in 1997 as a publishing company specialized in electronics. It has experienced great expansion since then, in both domain and influence.</br></br>                Today MikroElektronika produces a wide range of development tools and compilers for various microcontroller families. The production facilities of mikroElektronika                 are equipped with true hole and SMD assembly technology. These two production lines enable the company                 to manufacture first class products with complete hardware and software solutions including printed manuals.</p>    </div>    <div id='templatemo_contact'>        <strong>Contact Us</strong><br />      Fax: + 381 11 63 09 644<br />      Email:   office@mikre.com<br />    </div>  </div>  <div id='templatemo_footer'><a href='http://www.mikroe.com' target='_parent'>Copyright &copy; 1998&ndash;2017. MikroElektronika. All rights reserved.</a></div></body></html>";
#line 6 "D:/Luka-Probe/MicroC/Net Lib header HTML/HTTP Demo_2/HTTP_Demo.c"
sbit Eth1_Link at RB5_bit;
sbit Net_Ethernet_28j60_Rst at LATA5_bit;
sbit Net_Ethernet_28j60_CS at LATA4_bit;
sbit Eth1_Link_Direction at TRISB5_bit;
sbit Net_Ethernet_28j60_Rst_Direction at TRISA5_bit;
sbit Net_Ethernet_28j60_CS_Direction at TRISA4_bit;
#line 17 "D:/Luka-Probe/MicroC/Net Lib header HTML/HTTP Demo_2/HTTP_Demo.c"
const code unsigned char httpHeader[] = "HTTP/1.1 200 OK\nContent-Length: 7787\nConnection: close\nContent-type: ";
const code unsigned char httpMimeTypeHTML[] = "text/html\n\n";
const unsigned char httpMimeTypeScript[] = "text/plain\n\n" ;
unsigned char httpMethod[] = "GET /";
unsigned char httpRequ[] = "GET / HTTP/1.1";
char sendHTML_mark = 0;
char txt[27];
unsigned int pos[10];
char i;
unsigned long httpCounter = 0 ;
int ij, ik;
int index_br = 0;
char buff_slanje;
char promena1[] =" 30px";
char promena2[] ="#999999";
char promena3[] ="Naslov je mnogo dug";
int pg_size = 4880 ;
char end_petlja = 0;
#line 39 "D:/Luka-Probe/MicroC/Net Lib header HTML/HTTP Demo_2/HTTP_Demo.c"
unsigned char myMacAddr[6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3b};
unsigned char myIpAddr[4] = {192, 168, 1, 222 };
unsigned char gwIpAddr[4] = {192, 168, 1, 1 };
unsigned char ipMask[4] = {255, 255, 255, 0 };
unsigned char dnsIpAddr[4] = {192, 168, 20, 1 };

unsigned char getRequest[15];
unsigned char dyna[31] ;
#line 56 "D:/Luka-Probe/MicroC/Net Lib header HTML/HTTP Demo_2/HTTP_Demo.c"
const char *indexPagePtr;

const char RESET = 0;
const char SET = 1;

char sendRestOfPage_flag = RESET;
char disconnect_flag = RESET;

int my_strstr(int index, char *s1)
{
 int i, j, k;
 int flag = 0;



 for( i = index; html_code[i] != '\0'; i++)
 {
 if (html_code[i] == s1[0])
 {
 for (j = i; ; j++)
 {
 if (s1[j-i] == '\0'){ flag = 1;
 break;}
 if (html_code[j] == s1[j-i])
 continue;
 else
 break;
 }
 }
 if (flag == 1)
 break;
 }
#line 94 "D:/Luka-Probe/MicroC/Net Lib header HTML/HTTP Demo_2/HTTP_Demo.c"
 return j;
}

void Html_Change(unsigned int pom_promena, SOCKET_28j60_Dsc *socketHTML, char *pro) {
 for (ik = index_br; ik < strlen(pro); ik++) {
 buff_slanje = pro[ik];
 pom_promena = pos[socketHTML->ID];
 pos[socketHTML->ID]++;
 if (Net_Ethernet_28j60_putByteTCP(buff_slanje, socketHTML) == 0) {
 pos[socketHTML->ID]--;
 index_br = ik;
 end_petlja = 1;
 return;
 }
 }
 index_br = 0;

}

void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
 unsigned int len;
 int i;
 int res = 0;
 unsigned int prva_promena, druga_promena, treca_promena;


 if(socket->destPort != 80) {
 return;
 }


 for(len = 0; len < 10; len++){
 getRequest[len] = Net_Ethernet_28j60_getByte();
 }
 getRequest[len] = 0;
 len = 0 ;


 if(memcmp(getRequest, httpMethod, 5)&&(socket->state != 3)){
 return;
 }

 if (sendHTML_mark == 0) {
 sendHTML_mark = 1;

 res = 0;
 res = my_strstr(res, "font-size:");
 prva_promena = res ;
 res = my_strstr(res,"color:");
 druga_promena = res;
 res = my_strstr(res,"<title> ");
 treca_promena = res;


 }


 if (sendHTML_mark == 1) {

 while (pos[socket->ID] < pg_size) {

 if ( (pos[socket->ID] == prva_promena) || (end_petlja == 1) ) {
 if (end_petlja == 1) end_petlja = 0;
 Html_Change(prva_promena, socket, promena1);
 if (end_petlja == 1) break;
 }

 else if ( (pos[socket->ID] == druga_promena) || (end_petlja == 1) ) {
 if (end_petlja == 1) end_petlja = 0;
 Html_Change(druga_promena, socket, promena2);
 if (end_petlja == 1) break;
 }
 else if ( (pos[socket->ID] == treca_promena) || (end_petlja == 1) ) {
 if (end_petlja == 1) end_petlja = 0;
 Html_Change(treca_promena, socket, promena3);
 if (end_petlja == 1) break;
 }

 else {
 buff_slanje = html_code[pos[socket->ID]++];
 if (Net_Ethernet_28j60_putByteTCP(buff_slanje, socket) == 0) {
 pos[socket->ID]--;
 break;
 }
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
#line 260 "D:/Luka-Probe/MicroC/Net Lib header HTML/HTTP Demo_2/HTTP_Demo.c"
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

 Net_Ethernet_28j60_stackInitTCP();
 SPI1_Init();
 SPI_Rd_Ptr = SPI1_Read;
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
