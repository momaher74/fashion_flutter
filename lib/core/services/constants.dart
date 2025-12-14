import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:flutter/widgets.dart';

const size16 = 16.0;
const size17 = 17.0;
const size18 = 18.0;
const size19 = 19.0;
const size20 = 20.0;
const size21 = 21.0;
const size22 = 22.0;
const size23 = 23.0;
const size24 = 24.0;
const size25 = 25.0;
const size26 = 26.0;
const size27 = 27.0;
const size28 = 28.0;
const size29 = 29.0;
const size30 = 30.0;

const themeKey = 'themeMode';
const langKey = 'lang';

const FontWeight bold = FontWeight.bold;

const FontWeight normal = FontWeight.normal;

const List<String> productImages = [
  "https://res.cloudinary.com/djfeplrup/image/upload/v1765583786/assets/shutterstock_1781009285_1_ttdh8c.png",
  "https://res.cloudinary.com/djfeplrup/image/upload/v1765583726/assets/image_55_v5zjiy.png",
  "https://res.cloudinary.com/djfeplrup/image/upload/v1765583714/assets/image_84_wbmdup.png",
  "https://res.cloudinary.com/djfeplrup/image/upload/v1765583430/assets/fast-fashion-concept-with-man-clothing-store_oag3vs.jpg",
  "https://res.cloudinary.com/djfeplrup/image/upload/v1765653347/image_64_vupi4b.png",
];

final List<ProductModel> products = [
  ProductModel(
    id: '1',
    name: 'Stylish Jacket',
    description: 'A trendy jacket for all seasons.',
    price: 59.99,
    imageUrl: productImages[0],
    isFavourite: false,
    discountPrice: 50,
    rate: 4
  ),
  ProductModel(
    id: '2',
    name: 'Casual Shirt',
    description: 'Perfect for everyday wear.',
    price: 29.99,
    imageUrl: productImages[1],
    isFavourite: true,
    discountPrice: 20,
      rate: 4

  ),
  ProductModel(
    id: '3',
    name: 'Elegant Dress',
    description: 'Sportswear is no longer under culture, it is no longer indie or cobbled together as it once was. Sport is fashion today. The top is oversized in fit and style, may need to size down.',
    price: 79.99,
    imageUrl: productImages[2],
    isFavourite: false,
    discountPrice: 60,
      rate: 4

  ),
  ProductModel(
    id: '4',
    name: 'Comfortable Jeans',
    description: 'Stylish and comfortable denim jeans.',
    price: 49.99,
    imageUrl: productImages[3],
    isFavourite: true,
    discountPrice: 37,
      rate: 3

  ),

  ProductModel(
    id: '5',
    name: 'Top',
    description: 'Stylish and comfortable denim jeans.',
    price: 49.99,
    imageUrl: productImages[4],
    isFavourite: true,
    discountPrice: 49.99,
      rate: 5

  ),
];

const List<String> recentSearch = ['Shirt', 'Watch', "Glass"];

// Hex string version if you prefer
const List<String> colorHex = [
  '0xFFFF0000', // Red
  '0xFF00FF00', // Green
  '0xFF0000FF', // Blue
  '0xFFFFFF00', // Yellow
  '0xFFFFA500', // Orange
  '0xFF800080', // Purple
  '0xFFFFC0CB', // Pink
  '0xFFA52A2A', // Brown
  '0xFF808080', // Grey
  '0xFF000000', // Black
  '0xFFFFFFFF', // White
];

// Sizes list
const List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

// Sort options for filtering
const List<String> sortOptions = [
  'New Arrivals',
  'Best Sellers',
  'Offers',
  'Price: Low to High',
  'Price: High to Low',

];


// Sort options for filtering
const List<String> discountOptions = [
  '20% 0ff',
  '30% 0ff',
  '35% 0ff',
];

const rating = [1,2,3,4,5] ;


