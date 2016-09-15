int insertQuarterButtonX;
int insertQuarterButtonY;
int insertQuarterButtonSize=50;

int turnCrankButtonX;
int turnCrankButtonY;
int turnCrankButtonSize=50;

color insertQuarterButtonColor,turnCrankButtonColor;
color insertQuarterButtonHighlight, turnCrankButtonHighlight;
boolean insertQuarterButtonOver = false;
boolean turnCrankButtonOver = false;

String ClickedOver = null;

int blackColor =  color(0);
int gray = color(204);
int white = color(255);//color(51);
GumballMachine gumballMachine;

int currentCountOfGumballs;
String status = "waiting for quarter";

void setup() 
{
  size(800, 600) ;
  background(255) ;
  smooth() ;
  strokeWeight(3);
  strokeCap(ROUND);
  gumballMachine = new GumballMachine(5);
  currentCountOfGumballs = 5;
  // load font
  PFont font;
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font, 32);

  //insertQuarterButton
  insertQuarterButtonColor =  white; 
  insertQuarterButtonHighlight = gray;
  insertQuarterButtonX = width/4-insertQuarterButtonSize-10;
  insertQuarterButtonY = height/4;
  
  //turnCrankButton
  turnCrankButtonColor =  white;
  turnCrankButtonHighlight = gray;
  turnCrankButtonX = (width/4-turnCrankButtonSize-10)+(insertQuarterButtonSize+10);
  turnCrankButtonY = height/4;
  
  // Only draw once
 //noLoop();
}

void draw() {
  
  update();
  text("The Gumball Machine", 250, 60);
  PImage image = loadImage("gumball.jpg");
  image(image, (width-image.width)/2, (height-image.height)/2);  
  
  //----------Button insert coin heading----------
  String insertQuarterButtonHeading = "Quarter";
  textSize(11);
  fill(blackColor);
  text(insertQuarterButtonHeading, insertQuarterButtonX, insertQuarterButtonY-10, 70, 80);
  
  //----------------------
  
  //----------Button crank heading----------
  String turnCrankButtonHeading = "Crank";
  textSize(11);
  fill(blackColor);
  text(turnCrankButtonHeading, turnCrankButtonX, turnCrankButtonY-10, 70, 80);
  
  //----------------------
  
  
  //------------Inventory--------------
  String inventoryMessage = "Number Of Gumballs: ";
  textSize(11);
  fill(blackColor);
  text(inventoryMessage, 10, 10, 120, 80);
   
  fill(255);
  stroke(255);
  rect(140,10,120,80);
  stroke(blackColor); 
   
  textSize(11);
  fill(blackColor);
  text(currentCountOfGumballs+"", 140 , 10, 120, 80);
  //-------------------------
  
  
  //------------Status--------------
  String statusMessage = "Gumball machine Status: ";
  textSize(11);
  fill(blackColor);
  text(statusMessage, 10, 30, 120, 80);
  
  textSize(11);
  fill(blackColor);
  text(status, 140 , 30, 120, 80);
  //-------------------------
  
  
  //fill(white);
  
  if(!insertQuarterButtonOver &&!insertQuarterButtonOver)
  {
    fill(white);
    rect(insertQuarterButtonX,insertQuarterButtonY,insertQuarterButtonSize,insertQuarterButtonSize);
    rect(turnCrankButtonX,turnCrankButtonY,turnCrankButtonSize,turnCrankButtonSize);
  }
  else if(insertQuarterButtonOver)
         {
           
           fill(gray);
           rect(insertQuarterButtonX,insertQuarterButtonY,insertQuarterButtonSize,insertQuarterButtonSize);
           fill(white);
           rect(turnCrankButtonX,turnCrankButtonY,turnCrankButtonSize,turnCrankButtonSize);
           
         }
         
         if(turnCrankButtonOver)
         {
           
           fill(white);
           rect(insertQuarterButtonX,insertQuarterButtonY,insertQuarterButtonSize,insertQuarterButtonSize);
           fill(gray);
           rect(turnCrankButtonX,turnCrankButtonY,turnCrankButtonSize,turnCrankButtonSize);
        
         }
         if(ClickedOver !=null){
           System.out.println("---------------"+gumballMachine+"---------------");
           System.out.println("actions:--");
           if(ClickedOver.equals("insertQuarterButton")) 
           { 
                 gumballMachine.insertQuarter(); 
                 fill(blackColor);
                 rect(insertQuarterButtonX,insertQuarterButtonY,insertQuarterButtonSize,insertQuarterButtonSize);
           }
           if(ClickedOver.equals("turnCrankButton"))
           {
                 gumballMachine.turnCrank();
                 fill(blackColor);
                 rect(turnCrankButtonX,turnCrankButtonY,turnCrankButtonSize,turnCrankButtonSize);
           }
         }
         ClickedOver = null;
 // runTest();
}

public void update()
{
      turnCrankButtonOver = false;
      insertQuarterButtonOver = false;
  
  if(MouseOverButton(insertQuarterButtonX,insertQuarterButtonY,insertQuarterButtonSize,insertQuarterButtonSize))
  {
    insertQuarterButtonOver = true;
    turnCrankButtonOver = false;
  }  
  
  if(MouseOverButton(turnCrankButtonX,turnCrankButtonY,turnCrankButtonSize,turnCrankButtonSize))
  {
    
     turnCrankButtonOver = true;
     insertQuarterButtonOver = false;
  }

}

boolean MouseOverButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (insertQuarterButtonOver) {
    ClickedOver = "insertQuarterButton";
  }
  if (turnCrankButtonOver) {
    ClickedOver = "turnCrankButton";
  }
}



public void runTest() {
  GumballMachine gumballMachine = new GumballMachine(5);
  System.out.println("---------------"+gumballMachine+"----------------");
  System.out.println("actions:--"); //normal operation
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"----------------");
  System.out.println("actions:--");//normal operation
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"----------------");
  System.out.println("actions:--");//Directly turing crank
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");//Inseting two Quarters
  gumballMachine.insertQuarter();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");//Turing crank twice
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank 1)
  gumballMachine.turnCrank(); //(turn crank 2)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");//normal Operation
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");
  gumballMachine.insertQuarter(); 
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");
  gumballMachine.turnCrank(); //(turn crank with dispense)
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  
}