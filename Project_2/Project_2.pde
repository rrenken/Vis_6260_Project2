
// 1983 ASA Data Exposition dataset visualization

// Ryan Renken & Elvis Chukwuani


String carnames;
String carattributes;



void setup() {
  size(840, 560);
  loadData();
}

void draw() {
  background(255);
  fill(0);
  text("1983 ASA Data Exposition - Car Analysis", 0, 10);
  text(carnames, 20, 50);
  
}

void loadData() {
  String url = "http://lib.stat.cmu.edu/datasets/cars.data";
  String[] lines = loadStrings(url);
  String html = join(lines, "");
  
  String carnamestart = "<<'//GO.SYSIN DD cars.names'";
  String carnameend = "//GO.SYSIN DD cars.data";
  carnames = giveMeTextBetween(html, carnamestart, carnameend);
}

String giveMeTextBetween(String s, String before, String after) {
  String found = "";
  int carnamestart = s.indexOf(before);
  if( carnamestart == -1) {
    return "";
  }
  
  carnamestart += before.length();
  int carnameend = s.indexOf(after, carnamestart);
  if (carnameend == -1) {
    return "";
  }
  
  return s.substring(carnamestart, carnameend);
}
