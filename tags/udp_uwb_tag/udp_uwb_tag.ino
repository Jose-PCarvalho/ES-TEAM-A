#include <SPI.h>
#include <DW1000Ranging.h>
#include "DW1000.h"
#include <WiFi.h>

#include "link.h"

#define SPI_SCK 18
#define SPI_MISO 19
#define SPI_MOSI 23
#define DW_CS 4
#define PIN_RST 27
#define PIN_IRQ 34
char tag_addr[] = "7D:00:22:EA:82:60:3B:9C";
const char *ssid = "asv";
const char *password = "12345678";
const char *host = "192.168.1.253";

WiFiClient client;

struct MyLink *uwb_data;
int index_num = 0;
long runtime = 0;
String all_json = "";
float *ranges;

void setup()
{
    Serial.begin(115200);

    WiFi.mode(WIFI_STA);
    WiFi.setSleep(false);
    WiFi.begin(ssid, password);
    for(uint8_t cont=0; WiFi.status() != WL_CONNECTED; cont++)
    {
        delay(500);
        Serial.print(".");
        if(cont==10)
          ESP.restart();
    }
    Serial.println("Connected");
    Serial.print("IP Address:");
    Serial.println(WiFi.localIP());
    
    while(!client.connect(host, 8000))
    {
      Serial.println("Failed to connect to server");
      delay(250);    
    }

    delay(1000);

    //init the configuration
    SPI.begin(SPI_SCK, SPI_MISO, SPI_MOSI);
    DW1000Ranging.initCommunication(PIN_RST, DW_CS, PIN_IRQ);
    DW1000Ranging.attachNewRange(newRange);
    DW1000Ranging.attachNewDevice(newDevice);
    DW1000Ranging.attachInactiveDevice(inactiveDevice);

    //we start the module as a tag
    DW1000Ranging.startAsTag(tag_addr, DW1000.MODE_LONGDATA_RANGE_LOWPOWER, false);

    uwb_data = init_link();
}

void loop()
{
    DW1000Ranging.loop();
    if ((millis() - runtime) > 200)
    {
        make_link_json(uwb_data, &all_json);
        //Serial.println(uwb_data->next->range[0]);
        send_udp(&all_json);
        runtime = millis();        
    }
}

void newRange()
{
    char c[30];

     Serial.print("from: ");
     Serial.print(DW1000Ranging.getDistantDevice()->getShortAddress(), HEX);
     Serial.print("\t Range: ");
     Serial.print(DW1000Ranging.getDistantDevice()->getRange());
     Serial.print(" m");
     Serial.print("\t RX power: ");
     Serial.print(DW1000Ranging.getDistantDevice()->getRXPower());
     Serial.println(" dBm");
    if  (DW1000Ranging.getDistantDevice()->getRange()>0 && DW1000Ranging.getDistantDevice()->getRange()<8)
      fresh_link(uwb_data, DW1000Ranging.getDistantDevice()->getShortAddress(), DW1000Ranging.getDistantDevice()->getRange(), DW1000Ranging.getDistantDevice()->getRXPower());
}

void newDevice(DW1000Device *device)
{
    Serial.print("ranging init; 1 device added ! -> ");
    Serial.print(" short:");
    Serial.println(device->getShortAddress(), HEX);

    add_link(uwb_data, device->getShortAddress());
}

void inactiveDevice(DW1000Device *device)
{
    Serial.print("delete inactive device: ");
    Serial.println(device->getShortAddress(), HEX);

    delete_link(uwb_data, device->getShortAddress());
}

void send_udp(String *msg_json)
{ 
    if(client.connected())
    {
        client.print(*msg_json);
        Serial.println("UDP send");
    }
    else if(!client.connect(host, 8000))
        Serial.println("Fail Reconect");
    else
        Serial.println("Reconected");
}
