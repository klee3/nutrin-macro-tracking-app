# nutrin: macro orientated food tracker

### Most calorie trackers are not accurate: 
Macronutrients             |  MyFitnessPal's Evaluated Calories
:-------------------------:|:-------------------------:
![](/readmeimgs/macro.jpg) | ![](/readmeimgs/calorie.jpg)

Each gram of carbohydrate or protein has 4 calories and each gram of fat has 9 calories. By calculating the calories by hand `(156 * 4 + 52 * 9 + 83 * 4)` you end up with 1424 calories, which is 44 more calories than MyFitnessPal claims. If someone were to unknowingly eat 44 extra calories everyday for a year that ends up being 16060 extra calories or [4.6 pounds of body weight](https://www.mayoclinic.org/healthy-lifestyle/weight-loss/in-depth/calories/art-20048065). 

### You may be wondering, why aren't the calorie counts accurate? 
Well when companies create nutrition labels, they usually round down, and as a result the more you eat, the less accurate the calorie count becomes. You can find the exact rounding rules [here](https://www.fda.gov/food/food-labeling-nutrition/industry-resources-changes-nutrition-facts-label). Thus, the app I am creating does not calculate calories from a nutrition label, but rather the macronutrients. 

### sneakpeak
Main Screen                     |  Search Screen 
:------------------------------:|:-------------------------:
![](/readmeimgs/mainscreen.png) | will be added soon 

### try it out
to try it out git clone, `cd nutrin` and run `flutter pub get` and then `flutter run`. 
