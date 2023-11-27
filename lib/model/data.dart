import 'package:food_delivery/model/restaurant.dart';

List<DetailedRestaurant> dummyDetailedRestaurants = [
  DetailedRestaurant(
    id: '1',
    name: 'Fine Dining Restaurant',
    cuisineType: 'French',
    ratings: 4.7,
    imageUrl: 'https://source.unsplash.com/800x600/?restaurant',
    address: '123 Main Street, Cityville',
    menu: [
      MenuItem(
          name: 'Escargot',
          description: 'Classic French snails with garlic butter',
          price: '25.99',
          imageUrl: 'https://source.unsplash.com/800x600/?escargot'),
      MenuItem(
          name: 'Coq au Vin',
          description: 'Chicken braised with red wine, mushrooms, and onions',
          price: '32.99',
          imageUrl: 'https://source.unsplash.com/800x600/?coq-au-vin'),
      MenuItem(
          name: 'Crème Brûlée',
          description: 'Vanilla custard with a crispy caramelized top',
          price: '12.99',
          imageUrl: 'https://source.unsplash.com/800x600/?creme-brulee'),
    ],
    reviews: [
      Review(
          username: 'Foodie123',
          comment: 'Amazing food and atmosphere!',
          rating: 4.5),
      Review(
          username: 'GourmetChef',
          comment: 'The Coq au Vin is a must-try!',
          rating: 5.0),
    ],
  ),
  DetailedRestaurant(
    id: '2',
    name: 'Sushi Haven',
    cuisineType: 'Japanese',
    ratings: 4.4,
    imageUrl: 'https://source.unsplash.com/800x600/?food',
    address: '456 Broad Street, Townsville',
    menu: [
      MenuItem(
          name: 'Sashimi Platter',
          description: 'Fresh assorted raw fish slices',
          price: '28.99',
          imageUrl: 'https://source.unsplash.com/800x600/?sashimi'),
      MenuItem(
          name: 'Dragon Roll',
          description: 'Shrimp tempura, avocado, and eel sauce',
          price: '22.99',
          imageUrl: 'https://source.unsplash.com/800x600/?dragon-roll'),
      MenuItem(
          name: 'Miso Soup',
          description:
              'Traditional Japanese soybean broth with seaweed and tofu',
          price: '8.99',
          imageUrl: 'https://source.unsplash.com/800x600/?miso-soup'),
    ],
    reviews: [
      Review(
          username: 'SushiFanatic',
          comment: 'Best sushi in town!',
          rating: 4.7),
      Review(
          username: 'FoodExplorer',
          comment: 'The Dragon Roll is a taste sensation!',
          rating: 4.8),
    ],
  ),
  DetailedRestaurant(
    id: '3',
    name: 'Spice Kingdom',
    cuisineType: 'Indian',
    ratings: 4.6,
    imageUrl: 'https://source.unsplash.com/800x600/?cuisine',
    address: '789 Spice Lane, Flavortown',
    menu: [
      MenuItem(
          name: 'Butter Chicken',
          description: 'Tender chicken in a creamy tomato sauce',
          price: '18.99',
          imageUrl: 'https://source.unsplash.com/800x600/?butter-chicken'),
      MenuItem(
          name: 'Vegetable Biryani',
          description: 'Fragrant basmati rice with mixed vegetables',
          price: '15.99',
          imageUrl: 'https://source.unsplash.com/800x600/?vegetable-biryani'),
      MenuItem(
          name: 'Garlic Naan',
          description: 'Soft bread with a hint of garlic',
          price: '5.99',
          imageUrl: 'https://source.unsplash.com/800x600/?garlic-naan'),
    ],
    reviews: [
      Review(
          username: 'CurryConnoisseur',
          comment: 'Delicious flavors, authentic taste!',
          rating: 4.6),
      Review(
          username: 'SpiceLover',
          comment: 'The Butter Chicken is a must-have!',
          rating: 4.9),
    ],
  ),
  DetailedRestaurant(
    id: '4',
    name: 'Pizza Palace',
    cuisineType: 'Italian',
    ratings: 4.2,
    imageUrl: 'https://source.unsplash.com/800x600/?dining',
    address: '567 Pizza Street, Pizzatown',
    menu: [
      MenuItem(
          name: 'Margherita Pizza',
          description: 'Classic pizza with tomato, mozzarella, and basil',
          price: '14.99',
          imageUrl: 'https://source.unsplash.com/800x600/?margherita-pizza'),
      MenuItem(
          name: 'Pepperoni Delight',
          description: 'Loaded with pepperoni and cheese',
          price: '17.99',
          imageUrl: 'https://source.unsplash.com/800x600/?pepperoni-delight'),
      MenuItem(
          name: 'Garlic Knots',
          description: 'Soft knots of bread with garlic and butter',
          price: '6.99',
          imageUrl: 'https://source.unsplash.com/800x600/?garlic-knots'),
    ],
    reviews: [
      Review(
          username: 'PizzaLover22',
          comment: 'Great pizza, quick service!',
          rating: 4.2),
      Review(
          username: 'CheeseFanatic',
          comment: 'The Garlic Knots are addictive!',
          rating: 4.5),
    ],
  ),
  DetailedRestaurant(
    id: '5',
    name: 'Burger Bliss',
    cuisineType: 'American',
    ratings: 4.5,
    imageUrl: 'https://source.unsplash.com/800x600/?chef',
    address: '789 Burger Boulevard, Flavorville',
    menu: [
      MenuItem(
          name: 'Classic Cheeseburger',
          description: 'Juicy beef patty with cheese and all the fixings',
          price: '10.99',
          imageUrl: 'https://source.unsplash.com/800x600/?cheeseburger'),
      MenuItem(
          name: 'Veggie Delight',
          description: 'Grilled vegetable burger with special sauce',
          price: '12.99',
          imageUrl: 'https://source.unsplash.com/800x600/?veggie-delight'),
      MenuItem(
          name: 'Sweet Potato Fries',
          description: 'Crispy fries with a hint of sweetness',
          price: '5.99',
          imageUrl: 'https://source.unsplash.com/800x600/?sweet-potato-fries'),
    ],
    reviews: [
      Review(
          username: 'BurgerMaster',
          comment: 'Best burgers in town!',
          rating: 4.5),
      Review(
          username: 'VeggieEater',
          comment: 'The Veggie Delight is surprisingly delicious!',
          rating: 4.7),
    ],
  ),
  DetailedRestaurant(
    id: '6',
    name: 'Taco Town',
    cuisineType: 'Mexican',
    ratings: 4.3,
    imageUrl: 'https://source.unsplash.com/800x600/?gastronomy',
    address: '234 Taco Avenue, Salsaville',
    menu: [
      MenuItem(
          name: 'Chicken Tacos',
          description: 'Grilled chicken with salsa and guacamole',
          price: '9.99',
          imageUrl: 'https://source.unsplash.com/800x600/?chicken-tacos'),
      MenuItem(
          name: 'Beef Burrito',
          description: 'Hearty beef burrito with rice and beans',
          price: '12.99',
          imageUrl: 'https://source.unsplash.com/800x600/?beef-burrito'),
      MenuItem(
          name: 'Churros',
          description: 'Crispy fried dough with cinnamon sugar',
          price: '7.99',
          imageUrl: 'https://source.unsplash.com/800x600/?churros'),
    ],
    reviews: [
      Review(
          username: 'TacoFanatic',
          comment: 'Authentic flavors, great value!',
          rating: 4.3),
      Review(
          username: 'SpicyFoodLover',
          comment: 'The Churros are a sweet delight!',
          rating: 4.6),
    ],
  ),
  DetailedRestaurant(
    id: '7',
    name: 'Mediterranean Delight',
    cuisineType: 'Mediterranean',
    ratings: 4.8,
    imageUrl: 'https://source.unsplash.com/800x600/?delicious',
    address: '345 Olive Lane, Meditown',
    menu: [
      MenuItem(
          name: 'Hummus Platter',
          description: 'Smooth chickpea dip with olive oil and pita',
          price: '11.99',
          imageUrl: 'https://source.unsplash.com/800x600/?hummus-platter'),
      MenuItem(
          name: 'Falafel Wrap',
          description: 'Falafel balls in a wrap with veggies and tahini sauce',
          price: '13.99',
          imageUrl: 'https://source.unsplash.com/800x600/?falafel-wrap'),
      MenuItem(
          name: 'Baklava',
          description: 'Sweet pastry with layers of phyllo dough and honey',
          price: '8.99',
          imageUrl: 'https://source.unsplash.com/800x600/?baklava'),
    ],
    reviews: [
      Review(
          username: 'MediterraneanFan',
          comment: 'Fantastic flavors, loved the Baklava!',
          rating: 4.8),
      Review(
          username: 'HealthyEater',
          comment: 'The Falafel Wrap is a wholesome choice!',
          rating: 4.7),
    ],
  ),
  DetailedRestaurant(
    id: '8',
    name: 'Sizzling BBQ Shack',
    cuisineType: 'Barbecue',
    ratings: 4.4,
    imageUrl: 'https://source.unsplash.com/800x600/?tasty',
    address: '567 Grill Street, BBQville',
    menu: [
      MenuItem(
          name: 'Brisket Platter',
          description: 'Slow-cooked brisket with BBQ sauce',
          price: '19.99',
          imageUrl: 'https://source.unsplash.com/800x600/?brisket-platter'),
      MenuItem(
          name: 'BBQ Ribs',
          description: 'Tender ribs glazed with smoky barbecue sauce',
          price: '24.99',
          imageUrl: 'https://source.unsplash.com/800x600/?bbq-ribs'),
      MenuItem(
          name: 'Cornbread',
          description: 'Moist and buttery cornbread',
          price: '7.99',
          imageUrl: 'https://source.unsplash.com/800x600/?cornbread'),
    ],
    reviews: [
      Review(
          username: 'BBQKing',
          comment: 'The BBQ Ribs are mouthwatering!',
          rating: 4.4),
      Review(
          username: 'MeatLover99',
          comment: 'Sizzling BBQ Shack never disappoints!',
          rating: 4.6),
    ],
  ),
  DetailedRestaurant(
    id: '9',
    name: 'Café Mocha',
    cuisineType: 'Cafe',
    ratings: 4.6,
    imageUrl: 'https://source.unsplash.com/800x600/?yum',
    address: '789 Bean Boulevard, Brewtown',
    menu: [
      MenuItem(
          name: 'Cappuccino',
          description: 'Espresso with steamed milk and foam',
          price: '4.99',
          imageUrl: 'https://source.unsplash.com/800x600/?cappuccino'),
      MenuItem(
          name: 'Avocado Toast',
          description: 'Toasted bread with mashed avocado and toppings',
          price: '9.99',
          imageUrl: 'https://source.unsplash.com/800x600/?avocado-toast'),
      MenuItem(
          name: 'Chocolate Croissant',
          description: 'Flaky pastry filled with chocolate',
          price: '5.99',
          imageUrl: 'https://source.unsplash.com/800x600/?chocolate-croissant'),
    ],
    reviews: [
      Review(
          username: 'CoffeeLover',
          comment: 'Great coffee and cozy atmosphere!',
          rating: 4.6),
      Review(
          username: 'BrunchEnthusiast',
          comment: 'Avocado Toast is a brunch favorite!',
          rating: 4.8),
    ],
  ),
];
