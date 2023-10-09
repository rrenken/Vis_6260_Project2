import controlP5.*;

import interfascia.*;

import grafica.*;

import processing.data.*;

import g4p_controls.*;

Table table;
Table table2;
Table table3;

int isActive = 0;

GPlot plot1;

GPointsArray dataPoints;

ControlP5 cp5;
ControlP5 cp6;
ControlP5 cp7;
ControlP5 cp8;
ControlP5 cp9;
ControlP5 cp10;
ControlP5 cp11;
ControlP5 cp12;
ControlP5 cp13;
ControlP5 cp14;
ControlP5 cp15;
ControlP5 cp16;

String[] lines = null; // Declare lines as a global variable
ArrayList<String> carNamee = new ArrayList<String>();
ArrayList<String> Mpg = new ArrayList<String>();
ArrayList<String> No_Cylinders = new ArrayList<String>();
ArrayList<String> Eng_Dspl = new ArrayList<String>();
ArrayList<String> Horsepower = new ArrayList<String>();
ArrayList<String> Veh_Wgh = new ArrayList<String>();
ArrayList<String> Acc_Time = new ArrayList<String>();
ArrayList<String> Model_Year = new ArrayList<String>();
ArrayList<String> Car_Orgn = new ArrayList<String>();

ArrayList<ArrayList<String>> dataArrayList;
ArrayList<ArrayList<String>> dataArrayList2;
ArrayList<ArrayList<String>> dataArrayList3;

ArrayList<String> CarData_1Names = new ArrayList<String>();
ArrayList<String> CarData_1Mpg = new ArrayList<String>();
ArrayList<String> CarData_1Cyld = new ArrayList<String>();
ArrayList<String> CarData_1Engn = new ArrayList<String>();
ArrayList<String> CarData_1Hp = new ArrayList<String>();
ArrayList<String> CarData_1wght = new ArrayList<String>();
ArrayList<String> CarData_1time = new ArrayList<String>();
ArrayList<String> CarData_1year = new ArrayList<String>();
ArrayList<String> CarData_1orgn = new ArrayList<String>();

ArrayList<String> CarData_2Names = new ArrayList<String>();
ArrayList<String> CarData_2Mpg = new ArrayList<String>();
ArrayList<String> CarData_2Cyld = new ArrayList<String>();
ArrayList<String> CarData_2Engn = new ArrayList<String>();
ArrayList<String> CarData_2Hp = new ArrayList<String>();
ArrayList<String> CarData_2wght = new ArrayList<String>();
ArrayList<String> CarData_2time = new ArrayList<String>();
ArrayList<String> CarData_2year = new ArrayList<String>();
ArrayList<String> CarData_2orgn = new ArrayList<String>();

ArrayList<String> CarData_3Names = new ArrayList<String>();
ArrayList<String> CarData_3Mpg = new ArrayList<String>();
ArrayList<String> CarData_3Cyld = new ArrayList<String>();
ArrayList<String> CarData_3Engn = new ArrayList<String>();
ArrayList<String> CarData_3Hp = new ArrayList<String>();
ArrayList<String> CarData_3wght = new ArrayList<String>();
ArrayList<String> CarData_3time = new ArrayList<String>();
ArrayList<String> CarData_3year = new ArrayList<String>();
ArrayList<String> CarData_3orgn = new ArrayList<String>();

void setup() {
  size(2000,1300);
  
  loadData();
  getEng_Dspl();
  getNoCylinders();
  getCarNames();
  getHorsepower();
  getVeh_Wgh();
  getAcc_Time();
  getModel_Year();
  getCar_Orgn();
  getCarMpg();
  
  drawScatterPlot1();
  
  cp5 = new ControlP5(this);
  cp6 = new ControlP5(this);
  cp7 = new ControlP5(this);
  cp8 = new ControlP5(this);
  cp9 = new ControlP5(this);
  cp10 = new ControlP5(this);
  cp11 = new ControlP5(this);
  cp12 = new ControlP5(this);
  cp13 = new ControlP5(this);
  cp14 = new ControlP5(this);
  cp15 = new ControlP5(this);
  
  cp5.setColorBackground(color(33, 28, 1));
  cp6.setColorBackground(color(143, 50, 21));
  cp7.setColorBackground(color(11, 99, 32));
  cp8.setColorBackground(color(84, 3, 71));
  
  cp9.setColorBackground(color(158, 22, 49));
  cp10.setColorBackground(color(44, 39, 110));
  cp11.setColorBackground(color(93, 143, 145));
  cp12.setColorBackground(color(154, 158, 103));
  
  cp13.setColorBackground(color(66, 12, 11));
  cp14.setColorBackground(color(82, 31, 84));
  cp15.setColorBackground(color(189, 115, 51));
  
  cp5.addButton("Button1")
     .setPosition(240, 1130)
     .setSize(190, 90)
     .setLabel("Overall View")
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
  cp6.addButton("Button2")
     .setPosition(540, 1130)//300 950
     .setSize(190, 90)
     .setLabel("1. American")
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
  cp7.addButton("Button3")
     .setPosition(840, 1130)
     .setSize(190, 90)
     .setLabel("2. European")
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
  cp8.addButton("Button4")
     .setPosition(1140, 1130)
     .setSize(190, 90)
     .setLabel("3. Japanese")
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
   cp9.addButton("Button5")
     .setPosition(1630, 50)
     .setSize(60, 60)
     .setLabel("1.")
     .setColorForeground(color(204, 100, 20)) // Set the foreground color (purple)
     //.setColorActive(color(255, 0, 0)) 
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
   cp10.addButton("Button6")
     .setPosition(1630, 150)
     .setSize(60, 60)
     .setLabel("2.")
     .setColorForeground(color(204, 100, 20))
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
   cp11.addButton("Button7")
     .setPosition(1630, 250)
     .setSize(60, 60)
     .setLabel("3.")
     .setColorForeground(color(204, 100, 20))
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
       
   cp12.addButton("Button8")
     .setPosition(1630, 350)
     .setSize(60, 60)
     .setLabel("4.")
     .setColorForeground(color(204, 100, 20))
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
    cp13.addButton("Button9")
     .setPosition(1630, 450)
     .setSize(60, 60)
     .setLabel("5.")
     .setColorForeground(color(204, 100, 20))
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
   cp14.addButton("Button10")
     .setPosition(1630, 550)
     .setSize(60, 60)
     .setLabel("6.")
     .setColorForeground(color(204, 100, 20))
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
    cp15.addButton("Button11")
     .setPosition(1630, 650)
     .setSize(60, 60)
     .setLabel("7.")
     .setColorForeground(color(204, 100, 20))
     .getCaptionLabel().setFont(createFont("Arial Black", 20));
     
  table = loadTable("CarData_1.csv", "header");
  table2 = loadTable("CarData_2.csv", "header");
  table3 = loadTable("CarData_3.csv", "header");
  dataArrayList = new ArrayList<ArrayList<String>>();
  dataArrayList2 = new ArrayList<ArrayList<String>>();
  dataArrayList3 = new ArrayList<ArrayList<String>>();
  
  for (int i = 0; i < table.getColumnCount(); i++) {
    ArrayList<String> columnData = new ArrayList<String>();
    
    for (TableRow row : table.rows()) {
      columnData.add(row.getString(i));
    }
    
    dataArrayList.add(columnData);
  }
  for (int i = 0; i < table2.getColumnCount(); i++) {
    ArrayList<String> columnData1 = new ArrayList<String>();
    
    for (TableRow row : table2.rows()) {
      columnData1.add(row.getString(i));
    }
    
    dataArrayList2.add(columnData1);
  }
  for (int i = 0; i < table3.getColumnCount(); i++) {
    ArrayList<String> columnData2 = new ArrayList<String>();
    
    for (TableRow row : table3.rows()) {
      columnData2.add(row.getString(i));
    }
    
    dataArrayList3.add(columnData2);
  }
  //printColumn1(0);
  printColumn2(1);
  printColumn3(2);
  printColumn4(3);
  printColumn5(4);
  printColumn6(5);
  printColumn7(6);
  printColumn8(7);
  printColumn9(8);
  //printColumn21(0);
  printColumn22(1);
  printColumn23(2);
  printColumn24(3);
  printColumn25(4);
  printColumn26(5);
  printColumn27(6);
  printColumn28(7);
  printColumn29(8);
  //printColumn31(0);
  printColumn32(1);
  printColumn33(2);
  printColumn34(3);
  printColumn35(4);
  printColumn36(5);
  printColumn37(6);
  printColumn38(7);
  printColumn39(8);
}

void draw() {
  background(225, 230, 218);
  plot1.beginDraw();
  plot1.drawBackground();
  plot1.drawBox();
  plot1.drawXAxis();
  plot1.drawYAxis();
  plot1.drawTitle();
  plot1.drawGridLines(GPlot.BOTH);
  plot1.drawPoints();
  plot1.endDraw();
  
  
  
  String message = "Miles Per Gallon";
  String message1 = "No of Clyinders";
  String message2 = "Engine Displacement";
  String message3 = "Horsepower";
  String message4 = "Vehicle Weight";
  String message5 = "Model Year";
  String message6 = "Car Origin";
  
  textSize(24); // Font size
  fill(0); // Fill color (black)

  // Display the text
  text(message, 1695, 85);
  text(message1, 1695, 185);
  text(message2, 1695, 285);
  text(message3, 1695, 385);
  text(message4, 1695, 485);
  text(message5, 1695, 585);
  text(message6, 1695, 685);
 
}

void loadData() {
  String url = "http://lib.stat.cmu.edu/datasets/cars.data";
  String[] tempLines = loadStrings(url);

  if (tempLines != null) {
    lines = new String[tempLines.length];
    for (int i = 0; i < tempLines.length; i++) {
      lines[i] = tempLines[i];}
            
  } else {
    println("Error loading data from the URL");
  }
}

void getCarNames() {
  if (lines != null) {
    int count1 = 0;
    for (int i = 15; i < 421; i++) {
      String Name = lines[i];
      carNamee.add(Name);
      count1++;
    } //println(count1);
  } else {
    println("No data to print");
  }
}
void getCarMpg() {
  if (lines != null) {
    int count2 = 0;
    for (int i = 424; i < 830; i++) {
      String getMpg = lines[i].substring(1,5);
      Mpg.add(getMpg);
      count2++;      
    }//println(count2);
  } else {
    println("No data to print");
  }
}
void getNoCylinders() {
  if (lines != null) {
    int count3 = 0;
    for (int i = 424; i < 830; i++) {
      String noCylinders = lines[i].substring(8,9);
      No_Cylinders.add(noCylinders);
      count3++;
    }//println(count3);
  } else {
    println("No data to print");
  }
}
void getEng_Dspl() {
  if (lines != null) {
        int count4 = 0;
    for (int i = 424; i < 830; i++) {
      String engDspl = lines[i].substring(13,18);
      Eng_Dspl.add(engDspl);
      count4++;      
    }//println(count4);
  } else {
    println("No data to print");
  }
}
void getHorsepower() {
  if (lines != null) {
    int count5 = 0;
    for (int i = 424; i < 830; i++) {
      String horserPower = lines[i].substring(23,29);
      Horsepower.add(horserPower);
      count5++;     
    }//println(count5);
  } else {
    println("No data to print");
  }
}
void getVeh_Wgh() {
  if (lines != null) {
    int count6 = 0;
    for (int i = 424; i < 830; i++) {
      String vweight = lines[i].substring(33,39);
      Veh_Wgh.add(vweight);
      count6++;  
    }//println(count6);
  } else {
    println("No data to print");
  }
}
void getAcc_Time() {
  if (lines != null) {
    int count7 =0;
    for (int i = 424; i < 830; i++) {
      String accltime = lines[i].substring(43,50);
      Acc_Time.add(accltime);
      count7++;  
    }//println(count7);
  } else {
    println("No data to print");
  }
}void getModel_Year() {
  if (lines != null) {
    int count8 =0;
    for (int i = 424; i < 830; i++) {
      String modelYr = lines[i].substring(52,55);
      Model_Year.add(modelYr);
      count8++;   
    }//println(count8);
  } else {
    println("No data to print");
  }
}
void getCar_Orgn() {
  if (lines != null) {
    int count9 = 0;
    for (int i = 424; i < 830; i++) {
      String carOrign = lines[i].substring(57,59);
      Car_Orgn.add(carOrign);
      count9++;
    }//println(count9);
  } else {
    println("No data to print");
  }
}

  void drawScatterPlot1() {
  plot1 = new GPlot(this);
  plot1.setPos(0, 0);
  plot1.setDim(1500, 1000);
  plot1.getTitle().setText("CAR DATA");
  plot1.getXAxis().getAxisLabel().setText("Vehicle Weight (lbs)");
  plot1.getYAxis().getAxisLabel().setText("Acceleration time 0 to 60 (Sec)");
  plot1.setPointColor(color(0, 0, 0, 255));
  plot1.setPointSize(10);
  
  ArrayList<Float> Veh_WghFloat = new ArrayList<Float>();
  ArrayList<Float> Acc_TimeFloat = new ArrayList<Float>();
  dataPoints = new GPointsArray();
  
  for (String wght : Veh_Wgh) {
    Veh_WghFloat.add(Float.parseFloat(wght));
  }
  for (String time : Acc_Time) {
    Acc_TimeFloat.add(Float.parseFloat(time));
  }

  for (int i = 0; i < Veh_WghFloat.size(); i++) {
    float xValue = Veh_WghFloat.get(i);
    float yValue = Acc_TimeFloat.get(i);
    dataPoints.add(yValue, xValue);
    plot1.setPoints(dataPoints);
    plot1.activateZooming();
    plot1.activatePanning();    
    
    if (dist(mouseX, mouseY, yValue, xValue) < 9) {
      println("works");
      fill(0); // Change fill color for hover
      text(carNamee.get(i), yValue, xValue - 20);// Display car name above the circle
    }
  }       
  }

void Button1(int theValue) {
  
  drawScatterPlot1();
  
}

void Button2(int theValue) {
 isActive = 1;
 showAmerican();
} 
   
  void Button3(int theValue) {
    isActive = 2;
    showEuropean();
  
} 
    
  void Button4(int theValue) {
    isActive = 3;
    showJapanese();
  
  }
  void Button5(int theValue) {
    if(isActive == 1){
    xAxisMpg1();
    }else if(isActive ==2){
      xAxisMpg2();
    }else if(isActive == 3){
      xAxisMpg3();
    }
    else{
      println("Error");      
    }
  
  }
  void Button6(int theValue) {
    if(isActive == 1){
      xAxisCylinders1();
    }else if(isActive == 2){
      xAxisnoCylinder2();      
    }else if(isActive == 3){
      xAxisNoCylnd3();
    } else{
      println("Error");      
    }
  
  }
  void Button7(int theValue) {
    if(isActive == 1){
      xAxisEngine1();
    }else if(isActive == 2){
      xAxisEngDsp2();
    }else if(isActive == 3){
      xAxisEngDsp3();
    }else{
      println("Error");      
    }
  }
  void Button8(int theValue) {
    if(isActive == 1){
      xAxisHP1();
    }else if(isActive == 2){
      xAxisHp2();
    }else if(isActive ==3){
      xAxisHp3();
    }else{
      println("Error");      
    }
  }
  void Button9(int theValue) {
    if(isActive == 1){
      showAmerican();
    }else if(isActive == 2){
      showEuropean();      
    }else if(isActive ==3){
      showJapanese();
    }else{
      println("Error");      
    }
  
  }
  void Button10(int theValue) {
    if(isActive == 1){
      xAxisYear1();
    }else if(isActive == 2){
      xAxisYear2();  
    }else if(isActive == 3){
      xAxisYear3();
    }else{
      println("Error");      
    }
  }
  void Button11(int theValue) {
    if(isActive == 1){
      xAxisOrigin1();
    }else if(isActive ==2){
      xAxisOrigin2();
    }else if(isActive == 3){
      xAxisOrigin3();
    }else{
      println("Error");      
    }
  }
 
  void printColumn1(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1Names.add(value);   
    }
    for (String test : CarData_1Names) {
      //println(test);
  } 
  }
}
void printColumn2(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1Mpg.add(value);   
    }
    for (String test1 : CarData_1Mpg) {
      //println(test1);
  } 
  }
}
void printColumn3(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1Cyld.add(value);   
    }
    for (String test2 : CarData_1Cyld) {
      //println(test2);
  } 
  }
}
void printColumn4(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1Engn.add(value);   
    }
    for (String test3 : CarData_1Engn) {
      //println(test3);
  } 
  }
}
void printColumn5(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1Hp.add(value);   
    }
    for (String test4 : CarData_1Hp) {
      //println(test4);
  } 
  }
}
void printColumn6(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1wght.add(value);   
    }
    for (String test5 : CarData_1wght) {
      //println(test5);
  } 
  }
}
void printColumn7(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1time.add(value);   
    }
    for (String test6 : CarData_1time) {
      //println(test6);
  } 
  }
}
void printColumn8(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1year.add(value);   
    }
    for (String test7 : CarData_1year) {
      //println(test7);
  } 
  }
}
void printColumn9(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList.size()) {
    ArrayList<String> columnData = dataArrayList.get(columnIndex);
    
    for (String value : columnData) {
      CarData_1orgn.add(value);   
    }
    for (String test8 : CarData_1orgn) {
      //println(test8);
  } 
  }
}
void printColumn21(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2Names.add(value);   
    }
    for (String test : CarData_2Names) {
      //println(test);
  } 
  }
}
void printColumn22(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2Mpg.add(value);   
    }
    for (String test : CarData_2Mpg) {
      //println(test);
  } 
  }
}
void printColumn23(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2Cyld.add(value);   
    }
    for (String test : CarData_2Cyld) {
      //println(test);
  } 
  }
}
void printColumn24(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2Engn.add(value);   
    }
    for (String test : CarData_2Engn) {
      //println(test);
  } 
  }
}
void printColumn25(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2Hp.add(value);   
    }
    for (String test : CarData_2Hp) {
      //println(test);
  } 
  }
}
void printColumn26(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2wght.add(value);   
    }
    for (String test : CarData_2wght) {
      //println(test);
  } 
  }
}
void printColumn27(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2time.add(value);   
    }
    for (String test : CarData_2time) {
      //println(test);
  } 
  }
}
void printColumn28(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2year.add(value);   
    }
    for (String test : CarData_2year) {
      //println(test);
  } 
  }
}
void printColumn29(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList2.size()) {
    ArrayList<String> columnData1 = dataArrayList2.get(columnIndex);
    
    for (String value : columnData1) {
      CarData_2orgn.add(value);   
    }
    for (String test : CarData_2orgn) {
      //println(test);
  } 
  }
}
void printColumn31(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3Names.add(value);   
    }
    for (String test : CarData_3Names) {
      //println(test);
  } 
  }
}
void printColumn32(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3Mpg.add(value);   
    }
    for (String test : CarData_3Mpg) {
      //println(test);
  } 
  }
}
void printColumn33(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3Cyld.add(value);   
    }
    for (String test : CarData_3Cyld) {
      //println(test);
  } 
  }
}
void printColumn34(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3Engn.add(value);   
    }
    for (String test : CarData_3Engn) {
      //println(test);
  } 
  }
}
void printColumn35(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3Hp.add(value);   
    }
    for (String test : CarData_3Hp) {
      //println(test);
  } 
  }
}
void printColumn36(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3wght.add(value);   
    }
    for (String test : CarData_3wght) {
      //println(test);
  } 
  }
}
void printColumn37(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3time.add(value);   
    }
    for (String test : CarData_3time) {
      //println(test);
  } 
  }
}
void printColumn38(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3year.add(value);   
    }
    for (String test : CarData_3year) {
      //println(test);
  } 
  }
}
void printColumn39(int columnIndex) {
  if (columnIndex >= 0 && columnIndex < dataArrayList3.size()) {
    ArrayList<String> columnData2 = dataArrayList3.get(columnIndex);
    
    for (String value : columnData2) {
      CarData_3orgn.add(value);   
    }
    for (String test : CarData_3orgn) {
      //println(test);
  } 
  }
}

void showAmerican(){
  plot1.getTitle().setText("American Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Vehicle Weight (lbs)");
  
  ArrayList<Float> Acc_TimeFloatCarData_1 = new ArrayList<Float>();
  ArrayList<Float> CarData_1wghtFloat1 = new ArrayList<Float>();
  GPointsArray newDataPoints22 = new GPointsArray();
  
  for (String time : CarData_1time) {
    Acc_TimeFloatCarData_1.add(Float.parseFloat(time));
  }
   
   for (String wghtt : CarData_1wght) {
    CarData_1wghtFloat1.add(Float.parseFloat(wghtt));
  }
  
  
  for (int i = 0; i < Acc_TimeFloatCarData_1.size(); i++) {
    float xValue1 = Acc_TimeFloatCarData_1.get(i);
    float yValue2 = CarData_1wghtFloat1.get(i);
    newDataPoints22.add(xValue1, yValue2);
    plot1.setPoints(newDataPoints22);
    plot1.setPointColor(color(255, 0, 0));

}
}

void showEuropean(){
  plot1.getTitle().setText("European Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs) ");
  plot1.getYAxis().getAxisLabel().setText("Vehicle Weight (lbs)");
  
  
  ArrayList<Float> Acc_TimeFloatCarData_2 = new ArrayList<Float>();
  ArrayList<Float> CarData_2wghtFloat2 = new ArrayList<Float>();
  GPointsArray newDataPoints2 = new GPointsArray();
  
   for (String time : CarData_2time) {
    Acc_TimeFloatCarData_2.add(Float.parseFloat(time));
  }
   
   for (String origin : CarData_2wght) {
    CarData_2wghtFloat2.add(Float.parseFloat(origin));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_2.size(); i++) {
    float xValue11 = Acc_TimeFloatCarData_2.get(i);
    float yValue22 = CarData_2wghtFloat2.get(i);
    newDataPoints2.add(xValue11, yValue22);
    plot1.setPoints(newDataPoints2);
    plot1.setPointColor(color(11, 99, 32));
}   

}

void showJapanese(){
  
  plot1.getTitle().setText("Japanese Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Vehicle Weight (lbs)");
  
 
  ArrayList<Float> Acc_TimeFloatCarData_3 = new ArrayList<Float>();
  ArrayList<Float> CarData_1wghtFloat3 = new ArrayList<Float>();
  GPointsArray newDataPoints3 = new GPointsArray();
  
   for (String time : CarData_3time) {
    Acc_TimeFloatCarData_3.add(Float.parseFloat(time));
  }
   
   for (String wght2 : CarData_3wght) {
    CarData_1wghtFloat3.add(Float.parseFloat(wght2));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_3.size(); i++) {
    float xValue13 = Acc_TimeFloatCarData_3.get(i);
    float yValue24 = CarData_1wghtFloat3.get(i);
    newDataPoints3.add(xValue13, yValue24);
    plot1.setPoints(newDataPoints3);
    plot1.setPointColor(color(0, 0, 255));
  
 
} 
}

void xAxisYear1(){
  plot1.getTitle().setText("American Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Model Year (Years)");
  
  ArrayList<Float> Acc_TimeFloatCarData_1 = new ArrayList<Float>();
  ArrayList<Float> CarData_1yearFloat1 = new ArrayList<Float>();
  GPointsArray newDataPoints12 = new GPointsArray();
  
  for (String time : CarData_1time) {
    Acc_TimeFloatCarData_1.add(Float.parseFloat(time));
  }
   
   for (String yearr : CarData_1year) {
    CarData_1yearFloat1.add(Float.parseFloat(yearr));
  }
  
  
  for (int i = 0; i < Acc_TimeFloatCarData_1.size(); i++) {
    float xValue1 = Acc_TimeFloatCarData_1.get(i);
    float yValue255 = CarData_1yearFloat1.get(i);
    newDataPoints12.add(xValue1, yValue255);
    plot1.setPoints(newDataPoints12);
    plot1.setPointColor(color(255, 0, 0));

}
}
void xAxisEngine1(){
  plot1.getTitle().setText("American Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Engine Displacement");
  
  ArrayList<Float> Acc_TimeFloatCarData_1 = new ArrayList<Float>();
  ArrayList<Float> CarData_1EngnFloat1 = new ArrayList<Float>();
  GPointsArray newDataPoints13 = new GPointsArray();
  
  for (String time : CarData_1time) {
    Acc_TimeFloatCarData_1.add(Float.parseFloat(time));
  }
   
   for (String engDsp1 : CarData_1Engn) {
    CarData_1EngnFloat1.add(Float.parseFloat(engDsp1));
  }
  
  
  for (int i = 0; i < Acc_TimeFloatCarData_1.size(); i++) {
    float xValue1 = Acc_TimeFloatCarData_1.get(i);
    float yValue256 = CarData_1EngnFloat1.get(i);
    newDataPoints13.add(xValue1, yValue256);
    plot1.setPoints(newDataPoints13);
    plot1.setPointColor(color(255, 0, 0));

}
}
void xAxisCylinders1(){
  plot1.getTitle().setText("American Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Number of Cylinders");
  
  ArrayList<Float> Acc_TimeFloatCarData_1 = new ArrayList<Float>();
  ArrayList<Float> CarData_1CyldFloat1 = new ArrayList<Float>();
  GPointsArray newDataPoints14 = new GPointsArray();
  
  for (String time : CarData_1time) {
    Acc_TimeFloatCarData_1.add(Float.parseFloat(time));
  }
   
   for (String noCylnd1 : CarData_1Cyld) {
    CarData_1CyldFloat1.add(Float.parseFloat(noCylnd1));
  }
  
  
  for (int i = 0; i < Acc_TimeFloatCarData_1.size(); i++) {
    float xValue1 = Acc_TimeFloatCarData_1.get(i);
    float yValue257 = CarData_1CyldFloat1.get(i);
    newDataPoints14.add(xValue1, yValue257);
    plot1.setPoints(newDataPoints14);
    plot1.setPointColor(color(255, 0, 0));

}
}
void xAxisMpg1(){
  plot1.getTitle().setText("American Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Miles Per Gallon");
  
  ArrayList<Float> Acc_TimeFloatCarData_1 = new ArrayList<Float>();
  ArrayList<Float> CarData_1MpgFloat1 = new ArrayList<Float>();
  GPointsArray newDataPoints15 = new GPointsArray();
  
  for (String time : CarData_1time) {
    Acc_TimeFloatCarData_1.add(Float.parseFloat(time));
  }
   
   for (String mpg1 : CarData_1Mpg) {
    CarData_1MpgFloat1.add(Float.parseFloat(mpg1));
  }
  
  
  for (int i = 0; i < Acc_TimeFloatCarData_1.size(); i++) {
    float xValue1 = Acc_TimeFloatCarData_1.get(i);
    float yValue258 = CarData_1MpgFloat1.get(i);
    newDataPoints15.add(xValue1, yValue258);
    plot1.setPoints(newDataPoints15);
    plot1.setPointColor(color(255, 0, 0));

}
}
void xAxisHP1(){
  plot1.getTitle().setText("American Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Horsepower");
  
  ArrayList<Float> Acc_TimeFloatCarData_1 = new ArrayList<Float>();
  ArrayList<Float> CarData_1HpFloat1 = new ArrayList<Float>();
  GPointsArray newDataPoints16 = new GPointsArray();
  
  for (String time : CarData_1time) {
    Acc_TimeFloatCarData_1.add(Float.parseFloat(time));
  }
   
   for (String hp1 : CarData_1Hp) {
    CarData_1HpFloat1.add(Float.parseFloat(hp1));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_1.size(); i++) {
    float xValue1 = Acc_TimeFloatCarData_1.get(i);
    float yValue259 = CarData_1HpFloat1.get(i);
    newDataPoints16.add(xValue1, yValue259);
    plot1.setPoints(newDataPoints16);
    plot1.setPointColor(color(255, 0, 0));

}
}
void xAxisOrigin1(){
  plot1.getTitle().setText("American Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Car Origin");
  
  ArrayList<Float> Acc_TimeFloatCarData_1 = new ArrayList<Float>();
  ArrayList<Float> CarData_1orgnFloat1 = new ArrayList<Float>();
  GPointsArray newDataPoints17 = new GPointsArray();
  
  for (String time : CarData_1time) {
    Acc_TimeFloatCarData_1.add(Float.parseFloat(time));
  }
   
   for (String carOrigin1 : CarData_1orgn) {
    CarData_1orgnFloat1.add(Float.parseFloat(carOrigin1));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_1.size(); i++) {
    float xValue1 = Acc_TimeFloatCarData_1.get(i);
    float yValue260 = CarData_1orgnFloat1.get(i);
    newDataPoints17.add(xValue1, yValue260);
    plot1.setPoints(newDataPoints17);
    plot1.setPointColor(color(255, 0, 0));

}
}
void xAxisMpg2(){
  plot1.getTitle().setText("European Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Miles Per Gallon");
  
  
  ArrayList<Float> Acc_TimeFloatCarData_2 = new ArrayList<Float>();
  ArrayList<Float> CarData_2MpgFloat2 = new ArrayList<Float>();
  GPointsArray newDataPoints243 = new GPointsArray();
  
   for (String time : CarData_2time) {
    Acc_TimeFloatCarData_2.add(Float.parseFloat(time));
  }
 
   for (String mpg22 : CarData_2Mpg) {
    CarData_2MpgFloat2.add(Float.parseFloat(mpg22));
  }
  for (int i = 0; i < Acc_TimeFloatCarData_2.size(); i++) {
    float xValue11 = Acc_TimeFloatCarData_2.get(i);
    float yValue223 = CarData_2MpgFloat2.get(i);
    newDataPoints243.add(xValue11, yValue223);
    plot1.setPoints(newDataPoints243);
    plot1.setPointColor(color(11, 99, 32));
}   
}
void xAxisnoCylinder2(){
  plot1.getTitle().setText("European Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Number of Cylinders");
  
  ArrayList<Float> Acc_TimeFloatCarData_2 = new ArrayList<Float>();
  ArrayList<Float> CarData_2CyldFloat2 = new ArrayList<Float>();
  GPointsArray newDataPoints244 = new GPointsArray();
  
   for (String time : CarData_2time) {
    Acc_TimeFloatCarData_2.add(Float.parseFloat(time));
  }
 
   for (String cylnd22 : CarData_2Cyld) {
    CarData_2CyldFloat2.add(Float.parseFloat(cylnd22));
  }
  for (int i = 0; i < Acc_TimeFloatCarData_2.size(); i++) {
    float xValue11 = Acc_TimeFloatCarData_2.get(i);
    float yValue224 = CarData_2CyldFloat2.get(i);
    newDataPoints244.add(xValue11, yValue224);
    plot1.setPoints(newDataPoints244);
    plot1.setPointColor(color(11, 99, 32));
}   
}
void xAxisEngDsp2(){
  plot1.getTitle().setText("European Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Engine Displacement");
  
  ArrayList<Float> Acc_TimeFloatCarData_2 = new ArrayList<Float>();
  ArrayList<Float> CarData_2EngnFloat2 = new ArrayList<Float>();
  GPointsArray newDataPoints245 = new GPointsArray();
  
   for (String time : CarData_2time) {
    Acc_TimeFloatCarData_2.add(Float.parseFloat(time));
  }
 
   for (String engDsp22 : CarData_2Engn) {
    CarData_2EngnFloat2.add(Float.parseFloat(engDsp22));
  }
  for (int i = 0; i < Acc_TimeFloatCarData_2.size(); i++) {
    float xValue11 = Acc_TimeFloatCarData_2.get(i);
    float yValue225 = CarData_2EngnFloat2.get(i);
    newDataPoints245.add(xValue11, yValue225);
    plot1.setPoints(newDataPoints245);
    plot1.setPointColor(color(11, 99, 32));
}   
}
void xAxisHp2(){
  plot1.getTitle().setText("European Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Horsepower");
  
  ArrayList<Float> Acc_TimeFloatCarData_2 = new ArrayList<Float>();
  ArrayList<Float> CarData_2HpFloat2 = new ArrayList<Float>();
  GPointsArray newDataPoints246 = new GPointsArray();
  
   for (String time : CarData_2time) {
    Acc_TimeFloatCarData_2.add(Float.parseFloat(time));
  }
 
   for (String Hp22 : CarData_2Hp) {
    CarData_2HpFloat2.add(Float.parseFloat(Hp22));
  }
  for (int i = 0; i < Acc_TimeFloatCarData_2.size(); i++) {
    float xValue11 = Acc_TimeFloatCarData_2.get(i);
    float yValue226 = CarData_2HpFloat2.get(i);
    newDataPoints246.add(xValue11, yValue226);
    plot1.setPoints(newDataPoints246);
    plot1.setPointColor(color(11, 99, 32));
}   
}
void xAxisYear2(){
  plot1.getTitle().setText("European Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Model Year");
  
  ArrayList<Float> Acc_TimeFloatCarData_2 = new ArrayList<Float>();
  ArrayList<Float> CarData_2yearFloat2 = new ArrayList<Float>();
  GPointsArray newDataPoints247 = new GPointsArray();
  
   for (String time : CarData_2time) {
    Acc_TimeFloatCarData_2.add(Float.parseFloat(time));
  }
 
   for (String year22 : CarData_2year) {
    CarData_2yearFloat2.add(Float.parseFloat(year22));
  }
  for (int i = 0; i < Acc_TimeFloatCarData_2.size(); i++) {
    float xValue11 = Acc_TimeFloatCarData_2.get(i);
    float yValue227 = CarData_2yearFloat2.get(i);
    newDataPoints247.add(xValue11, yValue227);
    plot1.setPoints(newDataPoints247);
    plot1.setPointColor(color(11, 99, 32));
}   
}
void xAxisOrigin2(){
  plot1.getTitle().setText("European Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Car origin");
  
  ArrayList<Float> Acc_TimeFloatCarData_2 = new ArrayList<Float>();
  ArrayList<Float> CarData_2orgnFloat2 = new ArrayList<Float>();
  GPointsArray newDataPoints248 = new GPointsArray();
  
   for (String time : CarData_2time) {
    Acc_TimeFloatCarData_2.add(Float.parseFloat(time));
  }
 
   for (String orgn22 : CarData_2orgn) {
    CarData_2orgnFloat2.add(Float.parseFloat(orgn22));
  }
  for (int i = 0; i < Acc_TimeFloatCarData_2.size(); i++) {
    float xValue11 = Acc_TimeFloatCarData_2.get(i);
    float yValue228 = CarData_2orgnFloat2.get(i);
    newDataPoints248.add(xValue11, yValue228);
    plot1.setPoints(newDataPoints248);
    plot1.setPointColor(color(11, 99, 32));
}   
}
void xAxisMpg3(){
  
  plot1.getTitle().setText("Japanese Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Miles Per Gallon");
  
 
  ArrayList<Float> Acc_TimeFloatCarData_3 = new ArrayList<Float>();
  ArrayList<Float> CarData_3MpgFloat3 = new ArrayList<Float>();
  GPointsArray newDataPoints331 = new GPointsArray();
  
   for (String time : CarData_3time) {
    Acc_TimeFloatCarData_3.add(Float.parseFloat(time));
  }
   
   for (String mpg3 : CarData_3Mpg) {
    CarData_3MpgFloat3.add(Float.parseFloat(mpg3));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_3.size(); i++) {
    float xValue13 = Acc_TimeFloatCarData_3.get(i);
    float yValue2431 = CarData_3MpgFloat3.get(i);
    newDataPoints331.add(xValue13, yValue2431);
    plot1.setPoints(newDataPoints331);
    plot1.setPointColor(color(0, 0, 255));
  
 
} 
}
void xAxisNoCylnd3(){
  
  plot1.getTitle().setText("Japanese Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Number of Cylinders");
  
 
  ArrayList<Float> Acc_TimeFloatCarData_3 = new ArrayList<Float>();
  ArrayList<Float> CarData_3CyldFloat3 = new ArrayList<Float>();
  GPointsArray newDataPoints332 = new GPointsArray();
  
   for (String time : CarData_3time) {
    Acc_TimeFloatCarData_3.add(Float.parseFloat(time));
  }
   
   for (String noCyld3 : CarData_3Cyld) {
    CarData_3CyldFloat3.add(Float.parseFloat(noCyld3));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_3.size(); i++) {
    float xValue13 = Acc_TimeFloatCarData_3.get(i);
    float yValue2432 = CarData_3CyldFloat3.get(i);
    newDataPoints332.add(xValue13, yValue2432);
    plot1.setPoints(newDataPoints332);
    plot1.setPointColor(color(0, 0, 255));
  
 
} 
}
void xAxisEngDsp3(){
  
  plot1.getTitle().setText("Japanese Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Engine Displacement");
  
 
  ArrayList<Float> Acc_TimeFloatCarData_3 = new ArrayList<Float>();
  ArrayList<Float> CarData_3EngnFloat3 = new ArrayList<Float>();
  GPointsArray newDataPoints333 = new GPointsArray();
  
   for (String time : CarData_3time) {
    Acc_TimeFloatCarData_3.add(Float.parseFloat(time));
  }
   
   for (String noCyld3 : CarData_3Engn) {
    CarData_3EngnFloat3.add(Float.parseFloat(noCyld3));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_3.size(); i++) {
    float xValue13 = Acc_TimeFloatCarData_3.get(i);
    float yValue2433 = CarData_3EngnFloat3.get(i);
    newDataPoints333.add(xValue13, yValue2433);
    plot1.setPoints(newDataPoints333);
    plot1.setPointColor(color(0, 0, 255));
  
 
} 
}
void xAxisHp3(){
  
  plot1.getTitle().setText("Japanese Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Horsepower");
  
 
  ArrayList<Float> Acc_TimeFloatCarData_3 = new ArrayList<Float>();
  ArrayList<Float> CarData_3HpFloat3 = new ArrayList<Float>();
  GPointsArray newDataPoints334 = new GPointsArray();
  
   for (String time : CarData_3time) {
    Acc_TimeFloatCarData_3.add(Float.parseFloat(time));
  }
   
   for (String noCyld3 : CarData_3Hp) {
    CarData_3HpFloat3.add(Float.parseFloat(noCyld3));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_3.size(); i++) {
    float xValue13 = Acc_TimeFloatCarData_3.get(i);
    float yValue2434 = CarData_3HpFloat3.get(i);
    newDataPoints334.add(xValue13, yValue2434);
    plot1.setPoints(newDataPoints334);
    plot1.setPointColor(color(0, 0, 255));
  
 
} 
}
void xAxisYear3(){
  
  plot1.getTitle().setText("Japanese Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Model Year");
  
 
  ArrayList<Float> Acc_TimeFloatCarData_3 = new ArrayList<Float>();
  ArrayList<Float> CarData_3yearFloat3 = new ArrayList<Float>();
  GPointsArray newDataPoints335 = new GPointsArray();
  
   for (String time : CarData_3time) {
    Acc_TimeFloatCarData_3.add(Float.parseFloat(time));
  }
   for (String year3 : CarData_3year) {
    CarData_3yearFloat3.add(Float.parseFloat(year3));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_3.size(); i++) {
    float xValue13 = Acc_TimeFloatCarData_3.get(i);
    float yValue2435 = CarData_3yearFloat3.get(i);
    newDataPoints335.add(xValue13, yValue2435);
    plot1.setPoints(newDataPoints335);
    plot1.setPointColor(color(0, 0, 255));
  
 
} 
}
void xAxisOrigin3(){
  
  plot1.getTitle().setText("Japanese Cars");
  plot1.getXAxis().getAxisLabel().setText("Time to Accelerate 0 - 60 (Secs)");
  plot1.getYAxis().getAxisLabel().setText("Car Origin");
  
 
  ArrayList<Float> Acc_TimeFloatCarData_3 = new ArrayList<Float>();
  ArrayList<Float> CarData_3orgnFloat3 = new ArrayList<Float>();
  GPointsArray newDataPoints336 = new GPointsArray();
  
   for (String time : CarData_3time) {
    Acc_TimeFloatCarData_3.add(Float.parseFloat(time));
  }
   for (String origin3 : CarData_3orgn) {
    CarData_3orgnFloat3.add(Float.parseFloat(origin3));
  }
  
  for (int i = 0; i < Acc_TimeFloatCarData_3.size(); i++) {
    float xValue13 = Acc_TimeFloatCarData_3.get(i);
    float yValue2436 = CarData_3orgnFloat3.get(i);
    newDataPoints336.add(xValue13, yValue2436);
    plot1.setPoints(newDataPoints336);
    plot1.setPointColor(color(0, 0, 255));
  
 
} 
}

    
    

  


 

 
