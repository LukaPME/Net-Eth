#include "__Lib_NetEthEnc28j60.h"
#include "__Lib_NetEthEnc28j60Private.h"
#include "recources.h"
//#include "html.h"
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
char txt[27];
unsigned int pos[10];
char i;
unsigned long   httpCounter = 0 ;                                       // counter of HTTP requests
int ij, ik;
int index_br = 0;
char buff_slanje;
char promena1[] =" 30px";
char promena2[] ="#999999";
char promena3[] ="Naslov je mnogo dug";
int pg_size = 4880 ;
char end_petlja = 0;

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

#define putConstString  Net_Ethernet_28j60_putConstStringTCP
#define putString  Net_Ethernet_28j60_putStringTCP

const char *indexPagePtr;

const char RESET = 0;
const char SET   = 1;

char sendRestOfPage_flag = RESET;
char disconnect_flag     = RESET;

int my_strstr(int index, char *s1)
{
  int i, j, k;
  int flag = 0;

  //if ((s2 == 0 || s1 == 0)) return 0;

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

   /*k=0;
   for ( i = j ; i < (j + strlen(s3)) ; i++) {
       html_code[i] = s3[k];
       k++;
   }*/
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
   //return pom_promena;
}

void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
  unsigned int    len;                   // my reply length
  int    i;
  int res = 0;
  unsigned int prva_promena, druga_promena, treca_promena;

  // I listen only to web request on port 80
  if(socket->destPort != 80) {
    return;
  }

  // get 10 first bytes only of the request, the rest does not matter here
  for(len = 0; len < 10; len++){
    getRequest[len] = Net_Ethernet_28j60_getByte();
  }
  getRequest[len] = 0;
  len = 0 ;

  // only GET method is supported here
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

        else  if ( (pos[socket->ID] == druga_promena) || (end_petlja == 1) ) {
          if (end_petlja == 1) end_petlja = 0;
          Html_Change(druga_promena, socket, promena2);
          if (end_petlja == 1) break;
        }
        else  if ( (pos[socket->ID] == treca_promena) || (end_petlja == 1) ) {
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

  Net_Ethernet_28j60_stackInitTCP();
  SPI1_Init();
  SPI_Rd_Ptr = SPI1_Read;
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