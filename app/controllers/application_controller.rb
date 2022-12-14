class ApplicationController < ActionController::Base

  # Clothing and shoe sizes are listed here as global variables. These choices will need to be available site wide.
  
  $clothing_sizes = [["", 0],
  ["Micro Preemie", 1],
  ["Preemie", 2],
  ["Prem 1", 3],
  ["Prem 2", 4],
  ["Early Baby", 5],
  ["Newborn", 6],
  ["3 Months", 7],
  ["6 Months", 8],
  ["9 Months", 9],
  ["12 Months", 10],
  ["18 Months", 11],
  ["24 Months", 12],
  ["2t", 13],
  ["3t", 14],
  ["4t", 15],
  ["5t", 16],
  ["6t", 17],
  ["6x girls", 18],
  ["7 boys", 19],
  ["7 girls S", 20],
  ["8 girls S / boys S", 21],
  ["10 girls M / boys M", 22],
  ["12 girls L / boys M", 23],
  ["14 girls L / boys L", 24],
  ["16 girls XL / boys L", 25],
  ["18 boys XL", 26],
  ["20 boys XL", 27]]

  $shoe_sizes = [["", 0],
  ["Preemie", 1],
  ["0    Infant", 2],
  ["1    Infant", 3],
  ["1.5  Infant", 4],
  ["2    Infant", 5],
  ["2.5  Infant", 6],
  ["3    Infant", 7],
  ["3.5  Toddler", 8],
  ["4    Toddler", 9],
  ["4.5  Toddler", 10],
  ["5    Toddler", 11],
  ["5.5  Toddler", 12],
  ["6    Toddler", 13],
  ["6.5  Toddler", 14],
  ["7    Toddler", 15],
  ["7.5  Toddler", 16],
  ["8    Toddler", 17],
  ["8.5  Toddler", 18],
  ["9    Toddler", 19],
  ["9.5  Toddler", 20],
  ["10   Toddler", 21],
  ["10.5 Little Kid", 22],
  ["11   Little Kid", 23],
  ["11.5 Little Kid", 24],
  ["12   Little Kid", 25],
  ["12.5 Little Kid", 26],
  ["13   Little Kid", 27],
  ["13.5 Little Kid", 28],
  ["1    Little Kid", 29],
  ["1.5  Little Kid", 30],
  ["2    Little Kid", 31],
  ["2.5  Little Kid", 32],
  ["3    Little Kid", 33],
  ["3.5  Big Kid", 34],
  ["4    Big Kid", 35],
  ["4.5  Big Kid", 36],
  ["5    Big Kid", 37],
  ["5.5  Big Kid", 38],
  ["6    Big Kid", 39],
  ["6.5  Big Kid", 40],
  ["7    Big Kid",41]]
  
  # List of catagories and the types within:

  $clothing_catagory = ["Tops",
  "Bottoms",
  "Dresses and Skirts",
  "Socks and Underwear",
  "PJs",
  "Outerwear",
  "Boots and Shoes"]

  $tops = ["Short sleeve shirt", "Long sleeve shirt", "Sweaters", "Sweatshirts", "Hoodies"]
  $bottoms = ["Shorts", "Jeans", "Dress Pants", "Sweatpants", "Leggings"]
  $dresses_and_skirts = ["Long dresses", "Short dresses", "Long skirts", "Short skirts"]
  $socks_and_underwear = ["Low cut socks", "High cut socks", "Boys' Underwear", "Girls Underwear"]
  $pjs = ["Warm Pj shirts", "Warm PJ pants", "Cool PJ Shirts", "Cool PJ Pants", "Warm Onesies", "Cool Onesies", "Nightgowns"]
  $outerwear = ["Winter hats", "Non Winter hats", "Gloves", "Mittens", "Winter Coats", "Fall Jackets", "Rain Coats", "Snowsuits", "Suit Jackets"]
  $shoes = ["Dress shoes", "Tennis Shoes", "Snow boots", "Rain boots", "Regular boots", "Sandals", "Flip flops"]

  # List of colors and seasons, used both for creation and searches.

  $colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink", "Brown", "Gray", "Black", "White"]
  $seasons = ["Spring", "Summer", "Fall", "Winter"]
end
