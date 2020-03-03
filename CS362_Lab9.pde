//Gina Gerace, 664765515, ggerac3

import processing.serial.*;

  Serial myPort;        // The serial port
  int xPos = 1;         // horizontal position of the graph
  float val1 = 0;       //store potentiometer reading
  float val2 = 0;       //store photoresistor reading

  void setup () {
    // set the window size:
    size(800, 800);

    // arduino is plugged into port 5
    myPort = new Serial(this, "COM5", 9600);; //new Serial(this, Serial.list()[0], 9600);

    // don't generate a serialEvent() unless you get a newline character:
    myPort.bufferUntil('\n');

    // set initial background:
    background(0);
  }

  void draw () {
    // draw line1:
    stroke(127, 34, 255);
    line(xPos, height, xPos, height - val1);
   
    // draw line2:
    stroke(0, 0, 255);
    line(xPos, height/2, xPos, (height/2) - val2);

    // at the edge of the screen, go back to the beginning:
    if (xPos >= width) {
      xPos = 0;
      background(0);
    } else {
      // increment the horizontal position:
      xPos++;
    }
  }

  void serialEvent (Serial myPort) {
    String msg = myPort.readString();      //read in string printed by arduino
    String[] values = msg.split(",");      //split into two values
    if (values[0] != null) {
      // trim off any whitespace:
      values[0] = trim(values[0]);
      // convert to an int and map to the screen height:
      val1 = float(values[0]);
      println(val1);
      val1 = map(val1, 0, 1023, 0, height/2);
    }
    if (values[1] != null) {
      // trim off any whitespace:
      values[1] = trim(values[1]);
      // convert to an int and map to the screen height:
      val2 = float(values[1]);
      println(val2);
      val2 = map(val2, 0, 1023, 0, height/2);
    }
  }
