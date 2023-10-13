# Vis_6260_Project2 - Vehicle Analysis

# Authors
Ryan Renken & Elvis Chukwuani


# Description
Our goal is to enable users to analyze car data that was part of the 1983 Exposition of Statistical Graphics Technology. There are 406 cars included in this dataset; each car has a set of attributes including: 
MPG (miles per gallon), number of cylinders, engine displacement, horsepower, weight, acceleration, model year, and the region of origin. In our analysis, we will be specifically looking at car performance as a variable of acceleration (the time in seconds it takes the car to accelerate from 0 to 60 miles per hour). We also segmented our data into 4 views--an overview of all cars and each region of origin (U.S.A, Europe, and Japan) so viewers can see the trends within each region.


# Getting Started
Once a strong internet connection is secured and the Processing code is downloaded, users will only need to install a few Processing Libraries before running the program.

## Installing Libraries
### Step 1
Open Processing code and find the 'Import Library...' option under 'Sketch' in the toolbar atop the page. Then select 'Manage Libraries'. A new window will open.
### Step 2
In the search bar, type "ControlP5" and click on the correct resulting library listed below. After selecting it, please click the "Install" button that appears in the lower righthand side of the window.
### Step 3
Once the installation is complete, please repeat these steps for the following libraries:

interfascia , 
grafica , 
g4p  


# Data Collection
The data used for this project is hosted on a webpage along with other metadata associated with the data values. To load the data into our Processing program, we used a web scraping approach that allows us to store specific lines of data from the webpage directly into our program. Since the car names and attributes are separated by other text in the webpage HTML, we scrape each separately and store them as tables and merge them together.


# Interaction
Once all the appropriate libraries are installed, users will be able to simply click on the play button atop the screen to run the code. After executing the code, a new window will open with the programmed visualization.

The standard view is to see all the acceleration of cars from all regional origins (American, European, and Japanese) as a variable of vehicle weight. To cycle through other variables, simply click on the numbers associated with attributes along the righthand side of the screen (numbered 1 through 7). Selecting any other attributes will switch the X-axis of the scatter plot to the selected attribute. 

To drill down further, users can click on a region button along the bottom of the screen to filter the scatter plot for a specific region. However, the default view of all the attribute buttons is the 'Overall View,' so selecting a new attribute will automatically revert the regional origin filter back to showing all cars.

Users are also able to customize the viewing plane of the scatter plot by panning, zooming in, and zooming out manually using the mouse. Simply press the left-mouse button to zoom in on a targeted area; press the right-mouse button to zoom out from a targetted area. By clicking and holding the left-mouse button, users can drag the cursor on the plot to pan around the plane. Clicking on the 'Overall View' button will automatically reset the view back to the standard view.





