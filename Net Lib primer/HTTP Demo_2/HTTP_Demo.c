

#include "__Lib_NetEthEnc28j60.h"
#include "__Lib_NetEthEnc28j60Private.h"

// mE ehternet NIC pinout
sbit Eth1_Link at RB5_bit;
sbit Net_Ethernet_28j60_Rst at LATA5_bit;
sbit Net_Ethernet_28j60_CS  at LATA4_bit;
sbit Eth1_Link_Direction at TRISB5_bit;
sbit Net_Ethernet_28j60_Rst_Direction at TRISA5_bit;
sbit Net_Ethernet_28j60_CS_Direction  at TRISA4_bit;
// end ethernet NIC definitions

/************************************************************
 * ROM constant strings
 */
const code unsigned char httpHeader[] = "HTTP/1.1 200 OK\nContent-Length: 7787\nConnection: close\nContent-type: ";  // HTTP header
const code unsigned char httpMimeTypeHTML[] = "text/html\n\n";              // HTML MIME type
const unsigned char httpMimeTypeScript[] = "text/plain\n\n" ;           // TEXT MIME type
unsigned char httpMethod[] = "GET /";
unsigned char httpRequ[] = "GET / HTTP/1.1";
char sendHTML_mark = 0;

unsigned int pos[10];
char i;
unsigned long   httpCounter = 0 ;                                       // counter of HTTP requests
char txt[7];
char txt1[4];
int ij;
int pg_size;

/*
 * web page, splited into 2 parts :
 * when coming short of ROM, fragmented data is handled more efficiently by linker
 *
 * this HTML page calls the boards to get its status, and builds itself with javascript
 */

//<meta http-equiv=\"refresh\" content=\"5;url=http://192.168.1.200\">\
//<script src=/s></script>\

/*
 * stylesheets
 */
// clock not synchronized : red background
/*char    *CSSred = "\
HTTP/1.1 200 OK\nContent-type: text/css\n\n\
body {background-color: #ffccdd;}\
" ;

// clock synchronized : green background
const char    *CSSgreen = "\
HTTP/1.1 200 OK\nContent-type: text/css\n\n\
body {background-color: #ddffcc;}\
" ;*/

//<link rel=\"stylesheet\" type=\"text/css\" href=\"/s.css\">\

/*char    *HTMLheader = "\
HTTP/1.1 200 OK\nConnection: close\nContent-type: text/html\n\n\
<HTML><HEAD>\
<link rel=\"icon\" type=\"image/png\" href=\"https://png.icons8.com/ios/50/000000/facebook.png\">\
<TITLE>PME Clock</TITLE>\
</HEAD><BODY>\
<style>body {background-color: #ddffcc;}</style>\
<center>\
<h2>PME Clock</h2>\
" ;

char      HTMLtime[] = "\
<h3>Time | <a href=/2>SNTP</a> | <a href=/3>Network</a> | <a href=/4>System</a> | <a href=/admin>ADMIN</a></h3>\
<table border=1 style=\"font-size:20px ;font-family: terminal ;\" width=500>\
<tr><td>Date and Time</td><td align=right><script>document.write(\"Cao\")</script></td></tr>\
<tr><td>Unix Epoch</td><td align=right><script>document.write(\"EPOCH\")</script></td></tr>\
<tr><td>Julian Day</td><td align=right><script>document.write(\"EPOCH / 24 / 3600 + 2440587.5\")</script></td></tr>\
<tr><td>Last sync</td><td align=right><script>document.write(\"LAST\")</script></td></tr>" ;

char    HTMLfooter[] = "<HTML><HEAD>\
</table>\
<br>\
Pogledajte ceo proizvodni program na <a href=http://www.pme.rs target=_blank>www.pme.rs</a>\
</center>\
</BODY></HTML>" ;*/

char    *html_code = "\
HTTP/1.1 200 OK\nConnection: close\nContent-type: text/html\n\n\
<HTML><HEAD>\
<link rel=\"icon\" type=\"image/png\" href=\"https://png.icons8.com/ios/50/000000/facebook.png\">\
<TITLE>PME Clock</TITLE>\
</HEAD><BODY>\
<style>body {background-color: #ddffcc;}</style>\
<center>\
<h2>PME Clock</h2>\
<h3>Time | <a href=/2>SNTP</a> | <a href=/3>Network</a> | <a href=/4>System</a> | <a href=/admin>ADMIN</a></h3>\
<table border=1 style=\"font-size:20px ;font-family: terminal ;\" width=500>\
<tr><td>Date and Time</td><td align=right><script>document.write(\"Cao\")</script></td></tr>\
<tr><td>Unix Epoch</td><td align=right><script>document.write(\"EPOCH\")</script></td></tr>\
<tr><td>Julian Day</td><td align=right><script>document.write(\"EPOCH / 24 / 3600 + 2440587.5\")</script></td></tr>\
<tr><td>Last sync</td><td align=right><script>document.write(\"LAST\")</script></td></tr>\
<HTML><HEAD>\
</table>\
<br>\
Pogledajte ceo proizvodni program na <a href=http://www.pme.rs target=_blank>www.pme.rs</a>\
</center>\
</BODY></HTML>" ;

//char html_code[1000] = "";

/*const   char    *indexPage=                   // Change the IP address of the page to be refreshed
"<HTML><HEAD></HEAD><BODY>\
<h1>PIC + ENC28J60 Mini Web Server</h1>\
<a href=/>Reload</a>\
<table><tr><td valign=top><table border=1 style=\"font-size:20px ;font-family: terminal ;\">\
<tr><th colspan=2>ADC</th></tr>\
<tr><td>AN2</td><td><script>document.write(AN2)</script></td></tr>\
<tr><td>AN3</td><td><script>document.write(AN3)</script></td></tr>\
</table></td><td><table border=1 style=\"font-size:20px ;font-family: terminal ;\">\
<tr><th colspan=2>PORTB</th></tr>\
<script>\
var str,i;\
str=\"\";\
for(i=0;i<8;i++)\
{str+=\"<tr><td bgcolor=pink>BUTTON #\"+i+\"</td>\";\
if(PORTB&(1<<i)){str+=\"<td bgcolor=red>ON\";}\
else {str+=\"<td bgcolor=#cccccc>OFF\";}\
str+=\"</td></tr>\";}\
document.write(str) ;\
</script>\
" ;

const   char    *indexPage2 =  "</table></td><td>\
<table border=1 style=\"font-size:20px ;font-family: terminal ;\">\
<tr><th colspan=3>PORTD</th></tr>\
<script>\
var str,i;\
str=\"\";\
for(i=0;i<8;i++)\
{str+=\"<tr><td bgcolor=yellow>LED #\"+i+\"</td>\";\
if(PORTD&(1<<i)){str+=\"<td bgcolor=red>ON\";}\
else {str+=\"<td bgcolor=#cccccc>OFF\";}\
str+=\"</td><td><a href=/t\"+i+\">Toggle</a></td></tr>\";}\
document.write(str) ;\
</script>\
</table></td></tr></table>\
This is len length #<script>document.write(LENLEN)</script></BODY></HTML>\
" ;*/

/***********************************
 * RAM variables
 */
unsigned char   myMacAddr[6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3b};   // my MAC address
unsigned char   myIpAddr[4]  = {192, 168,  1, 222 };                   // my IP address
unsigned char   gwIpAddr[4]  = {192, 168,  1,  1 };                   // gateway (router) IP address
unsigned char   ipMask[4]    = {255, 255, 255,  0 };                   // network mask (for example : 255.255.255.0)
unsigned char   dnsIpAddr[4] = {192, 168,  20,  1 };                   // DNS server IP address

unsigned char   getRequest[15];                                        // HTTP request buffer
unsigned char   dyna[31] ;                                             // buffer for dynamic response


/*******************************************
 * functions
 */

/*
 * put the constant string pointed to by s to the ENC transmit buffer.
 */
/*unsigned int    putConstString(const char *s)
        {
        unsigned int ctr = 0 ;

        while(*s)
                {
                Net_Ethernet_24j600_putByte(*s++) ;
                ctr++ ;
                }
        return(ctr) ;
        }*/
/*
 * it will be much faster to use library Net_Ethernet_24j600_putConstString routine
 * instead of putConstString routine above. However, the code will be a little
 * bit bigger. User should choose between size and speed and pick the implementation that
 * suites him best. If you choose to go with the putConstString definition above
 * the #define line below should be commented out.
 *
 */
#define putConstString  Net_Ethernet_28j60_putConstStringTCP

/*
 * put the string pointed to by s to the ENC transmit buffer
 */
/*unsigned int    putString(char *s)
        {
        unsigned int ctr = 0 ;

        while(*s)
                {
                Net_Ethernet_24j600_putByte(*s++) ;

                ctr++ ;
                }
        return(ctr) ;
        }*/
/*
 * it will be much faster to use library Net_Ethernet_24j600_putString routine
 * instead of putString routine above. However, the code will be a little
 * bit bigger. User should choose between size and speed and pick the implementation that
 * suites him best. If you choose to go with the putString definition above
 * the #define line below should be commented out.
 *
 */
#define putString  Net_Ethernet_28j60_putStringTCP

/*
 * this function is called by the library
 * the user accesses to the HTTP request by successive calls to Net_Ethernet_24j600_getByte()
 * the user puts data in the transmit buffer by successive calls to Net_Ethernet_24j600_putByte()
 * the function must return the length in bytes of the HTTP reply, or 0 if nothing to transmit
 *
 * if you don't need to reply to HTTP requests,
 * just define this function with a return(0) as single statement
 *
 */

SOCKET_28j60_Dsc *currSocket, *socketHTML;
const char *indexPagePtr;

const char RESET = 0;
const char SET   = 1;

char sendRestOfPage_flag = RESET;
char disconnect_flag     = RESET;

void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
  unsigned int    len;                   // my reply length
  unsigned int    i ;                    // general purpose integer
  char pg_num;

  // I listen only to web request on port 80
  /*if(socket->destPort != 80) {
    return;
  }*/

  // get 10 first bytes only of the request, the rest does not matter here
  /*for(len = 0; len < 10; len++){
    getRequest[len] = Net_Ethernet_28j60_getByte();
  }
  getRequest[len] = 0;
  len = 0 ;*/

  // only GET method is supported here
  /*if(memcmp(getRequest, httpMethod, 5)&&(socket->state != 3)){
    return;
  }*/

    if (sendHTML_mark == 0) {
      sendHTML_mark = 1;
      /*switch(getRequest[5])
         {
         case 's':
              strcpy(html_code, "");
              strcat(html_code, CSSred);
              pg_size = strlen(html_code);
              break ;
         case '1':
         default:*/
              //strcpy(html_code, "");
              //strcat(html_code, HTMLheader);
              //strcat(html_code, HTMLtime);
              //strcat(html_code, HTMLfooter);
              
            //  background-color:  zazamenu"#ffccdd"
              
              
              
              pg_size = strlen(html_code);
         //}
     }
  

  //}

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

/*
 * this function is called by the library
 * the user accesses to the UDP request by successive calls to Net_Ethernet_24j600_getByte()
 * the user puts data in the transmit buffer by successive calls to Net_Ethernet_24j600_putByte()
 * the function must return the length in bytes of the UDP reply, or 0 if nothing to transmit
 *
 * if you don't need to reply to UDP requests,
 * just define this function with a return(0) as single statement
 *
 */

unsigned int    Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc) {

  unsigned int    len;                           // my reply length

  // reply is made of the remote host IP address in human readable format
  ByteToStr(udpDsc->remoteIP[0], dyna);                // first IP address byte
  dyna[3] = '.';
  ByteToStr(udpDsc->remoteIP[1], dyna + 4);            // second
  dyna[7] = '.';
  ByteToStr(udpDsc->remoteIP[2], dyna + 8);            // third
  dyna[11] = '.';
  ByteToStr(udpDsc->remoteIP[3], dyna + 12);           // fourth

  dyna[15] = ':';                                // add separator

  // then remote host port number
  WordToStr(udpDsc->remotePort, dyna + 16);
  dyna[21] = '[';
  WordToStr(udpDsc->destPort, dyna + 22);
  dyna[27] = ']';
  dyna[28] = 0;

  // the total length of the request is the length of the dynamic string plus the text of the request
  len = 28 + udpDsc->dataLength;

  // puts the dynamic string into the transmit buffer
  Net_Ethernet_28j60_putBytes(dyna, 28);

  // then puts the request string converted into upper char into the transmit buffer

  while(udpDsc->dataLength--)
          {
          Net_Ethernet_28j60_putByte(toupper(Net_Ethernet_28j60_getByte()));
          }
  return(len);
}

// Initialization of Timer1
unsigned int cnt;
void MCUInit() {
  cnt = 0;             // Initialize cnt
  TRISB = 0;           // PORTB is output
  PORTB = 0xFF;        // Initialize PORTB

  T0CON         = 0x88;
  TMR0H         = 0x63;
  TMR0L         = 0xC0;
  INTCON = 0xC0;       // Set GIE, PEIE
  TMR0IE_bit = 1;      // Enable TMRO interrupt
}

// Interrupt routine
void interrupt() {
  if (TMR0IF_bit) {
    cnt++;             // Increment value of cnt on every interrupt
    if (cnt >= 200) {
      cnt = 0;         // Reset cnt
      Net_Ethernet_28j60_UserTimerSec++;
    }
    TMR0H         = 0x63;
    TMR0L         = 0xC0;
    TMR0IF_bit = 0;    // clear TMR0IF
  }
}


/*
 * main entry
 */
void    main() {
  MCUInit();
  ANSEL = 0x0C;           // AN2 and AN3 convertors will be used
  C1ON_bit = 0;           // Disable comparators
  C2ON_bit = 0;
  PORTA = 0 ;
  TRISA = 0xff ;          // set PORTA as input for ADC
  ANSELH = 0x0C;
  PORTD = 0 ;
  TRISD = 0 ;             // set PORTD as output
  SLRCON = 0;
  PORTB = 0;
  TRISB = 0xFF;           // set PORTB as input for buttons

  PORTD = 0 ;
  TRISD = 0 ;             // set PORTD as output
  SLRCON = 0;
  /*
   * CS bit on RC1
   * my MAC & IP address
   * full duplex
   */

  Net_Ethernet_28j60_stackInitTCP();
  SPI1_Init();
  Net_Ethernet_28j60_Init(myMacAddr, myIpAddr, Net_Ethernet_28j60_FULLDUPLEX)  ;
  Net_Ethernet_28j60_confNetwork(ipMask, gwIpAddr, dnsIpAddr);

  while(1) {
    
    Net_Ethernet_28j60_doPacket() ;   // process incoming Ethernet packets
    
    for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
     if(socket_28j60[i].open == 0)
       pos[i] = 0;
    }

  }
}