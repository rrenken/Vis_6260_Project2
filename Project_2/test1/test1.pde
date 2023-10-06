Table table;
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

void setup() {
  size(1000,1000);
  
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
  
  
String[] carNames = carNamee.toArray(new String[carNamee.size()]);
String[] Mpg1 = Mpg.toArray(new String[Mpg.size()]);
String[] No_Cylinders1 = No_Cylinders.toArray(new String[No_Cylinders.size()]);
String[] Eng_Dspl1 = Eng_Dspl.toArray(new String[Eng_Dspl.size()]);
String[] Horsepower1 = Horsepower.toArray(new String[Horsepower.size()]);
String[] Veh_Wgh1 = Veh_Wgh.toArray(new String[Veh_Wgh.size()]);
String[] Acc_Time1 = Acc_Time.toArray(new String[Acc_Time.size()]);
String[] Model_Year1 = Model_Year.toArray(new String[Model_Year.size()]);
String[] Car_Orgn1 = Car_Orgn.toArray(new String[Car_Orgn.size()]);
  

}
void draw() {
  background(255);
  textAlign(LEFT, CENTER);
  textSize(14);
  drawScatterPlot();
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
    } println(count1);
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
      
      
    }println(count2);
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
    }println(count3);
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
    }println(count4);
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
    }println(count5);
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
    }println(count6);
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
    }println(count7);
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
    }println(count8);
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
    }println(count9);
  } else {
    println("No data to print");
  }
}
//void displayTable() {
//  int x = 50;
//  int y = 50;
//  int colWidth = 100;
  
//  // Display headers
//  fill(0);
//  textAlign(CENTER, CENTER);
//  text("Car Name", x, y);
//  text("MPG", x + colWidth, y);
//  text("Cylinders", x + 2 * colWidth, y);
//  text("Engine Displacement", x + 3.4 * colWidth, y);
//  text("Horsepower", x + 4.6 * colWidth, y);
//  text("Vehicle Weight", x + 5.6 * colWidth, y);
//  text("Acceleration Time", x + 6.8 * colWidth, y);
//  text("Model Year", x + 7.9 * colWidth, y);
//  text("Car Origin", x + 8.7 * colWidth, y);
  
//  y += 30;  // Move to the next row
  
//  // Display data from ArrayLists
//  for (int i = 0; i < carNamee.size(); i++) {
//    textAlign(LEFT, CENTER);
//    text(carNamee.get(i), x, y);
//    text(Mpg.get(i), x + colWidth, y);
//    text(No_Cylinders.get(i), x + 2 * colWidth, y);
//    text(Eng_Dspl.get(i), x + 3.4 * colWidth, y);
//    text(Horsepower.get(i), x + 4.6 * colWidth, y);
//    text(Veh_Wgh.get(i), x + 5.6 * colWidth, y);
//    text(Acc_Time.get(i), x + 6.8 * colWidth, y);
//    text(Model_Year.get(i), x + 7.9 * colWidth, y);
//    text(Car_Orgn.get(i), x + 8.7 * colWidth, y);
    
//    y += 30;  // Move to the next row
//  }
//}

//void myTest(){

//for (int i = 0; i < carNamee.size(); i++) {
  
//  float mpg = row.getFloat("MPG");
//  float horsepower = row.getFloat("Horsepower");
//  float x = map(mpg, 0, 30, 50, width - 50);
//  float y = map(horsepower, 0, 250, height - 50, 50);
//    ellipse(x, y, 8, 8);

//}
//}
  void drawScatterPlot() {
  float xMargin = 100;
  float yMargin = 50;
  float xMax = width - xMargin;
  float yMax = height - yMargin;

  // Convert Model_Year and Car_Orgn to float values for plotting
  ArrayList<Float> modelYearFloat = new ArrayList<Float>();
  ArrayList<Float> carOrgnFloat = new ArrayList<Float>();
  for (String year : Veh_Wgh) {
    modelYearFloat.add(Float.parseFloat(year));
  }
  for (String orgn : Acc_Time) {
    carOrgnFloat.add(Float.parseFloat(orgn));
  }

  // Find the minimum and maximum values for scaling
  float minX = Float.MAX_VALUE;
  float maxX = Float.MIN_VALUE;
  float minY = Float.MAX_VALUE;
  float maxY = Float.MIN_VALUE;

  for (int i = 0; i < modelYearFloat.size(); i++) {
    float xValue = modelYearFloat.get(i);
    float yValue = carOrgnFloat.get(i);
    
    if (xValue < minX) {
      minX = xValue;
    }
    if (xValue > maxX) {
      maxX = xValue;
    }
    if (yValue < minY) {
      minY = yValue;
    }
    if (yValue > maxY) {
      maxY = yValue;
    }
  }

  // Define scaling factors for the map function to control spacing
  float xScaleFactor = 1.0; // Adjust this factor as needed
  float yScaleFactor = 1.0; // Adjust this factor as needed

  // Plot the data points
  for (int i = 0; i < modelYearFloat.size(); i++) {
    float x = map(modelYearFloat.get(i), minX, maxX, xMargin, xMax) * xScaleFactor;
    float y = map(carOrgnFloat.get(i), minY, maxY, yMax, yMargin) * yScaleFactor;
    
    if (dist(mouseX, mouseY, x, y) < 8) {
      fill(0); // Change fill color for hover
      text(carNamee.get(i), x, y - 10);// Display car name above the circle
    }

    // Draw a circle for each data point
    ellipse(x, y, 8, 8);
  }

  // Add labels
  textAlign(CENTER);
  textSize(14);
  fill(0);
  text("Model Year", width / 2, height - 10);
  textAlign(RIGHT);
  text("Car Origin", xMargin - 10, yMax + 10);
}

 
