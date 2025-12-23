import 'dart:io';

import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/features/addresses/data/model/address_model.dart';
import 'package:fashion_flutter/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../features/home/data/models/home_model.dart';

const size14 = 14.0;
const size15 = 15.0;
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
    images: [productImages[0]],
    price: 59.99,
    finalPrice: 50.0,
    rate: 4,
    isFavourite: false,
    currency: 'USD',
    offerApplied: OfferAppliedModel(
      title: 'Winter Sale',
      type: 'percentage',
      value: 20,
      discount: 9.99,
    ),
    sizes: [
      SizeModel(id: 's1', name: 'S'),
      SizeModel(id: 's2', name: 'M'),
    ],
    colors: [
      ColorModel(id: 'c1', name: 'Red', hexCode: '#FF0000'),
      ColorModel(id: 'c2', name: 'Blue', hexCode: '#0000FF'),
    ],
    category: CategoryMiniModel(
      id: 'cat1',
      name: 'Jackets',
      nameMultilingual: MultilingualModel(ar: 'جاكيت', en: 'Jackets'),
    ),
    subCategory: CategoryMiniModel(
      id: 'sub1',
      name: 'Winter Jackets',
      nameMultilingual: MultilingualModel(ar: 'جاكيت شتوي', en: 'Winter Jackets'),
    ),
    variants: [
      VariantModel(sizeId: 's1', colorId: 'c1', stock: 10, price: 59.99, finalPrice: 50.0),
      VariantModel(sizeId: 's2', colorId: 'c2', stock: 5, price: 59.99, finalPrice: 50.0),
    ],
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  ProductModel(
    id: '2',
    name: 'Casual Shirt',
    description: 'Perfect for everyday wear.',
    images: productImages,
    price: 29.99,
    finalPrice: 20.0,
    rate: 4,
    isFavourite: true,
    currency: 'USD',
    offerApplied: OfferAppliedModel(
      title: 'Summer Sale',
      type: 'percentage',
      value: 33,
      discount: 9.99,
    ),
    sizes: [
      SizeModel(id: 's1', name: 'S'),
      SizeModel(id: 's2', name: 'M'),
      SizeModel(id: 's3', name: 'L'),
    ],
    colors: [
      ColorModel(id: 'c1', name: 'White', hexCode: '#FFFFFF'),
      ColorModel(id: 'c2', name: 'Black', hexCode: '#000000'),
    ],
    category: CategoryMiniModel(
      id: 'cat2',
      name: 'Shirts',
      nameMultilingual: MultilingualModel(ar: 'قميص', en: 'Shirts'),
    ),
    subCategory: CategoryMiniModel(
      id: 'sub2',
      name: 'Casual Shirts',
      nameMultilingual: MultilingualModel(ar: 'قميص كاجوال', en: 'Casual Shirts'),
    ),
    variants: [
      VariantModel(sizeId: 's1', colorId: 'c1', stock: 15, price: 29.99, finalPrice: 20.0),
      VariantModel(sizeId: 's2', colorId: 'c2', stock: 8, price: 29.99, finalPrice: 20.0),
    ],
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  // Add more products similarly...
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
const List<String> discountOptions = ['20% 0ff', '30% 0ff', '35% 0ff'];

final List<OrderModel> orders = [
  OrderModel(
    id: "1",
    code: "45999",
    quantity: "3",
    date: "23/12/2025",
    subTotal: "7778",
    status: "PENDING",
  ),
  OrderModel(
    id: "1",
    code: "45999",
    quantity: "3",
    date: "23/12/2025",
    subTotal: "7778",
    status: "PENDING",
  ),
  OrderModel(
    id: "1",
    code: "45999",
    quantity: "3",
    date: "23/12/2025",
    subTotal: "7778",
    status: "Cancelled",
  ),
  OrderModel(
    id: "1",
    code: "45999",
    quantity: "3",
    date: "23/12/2025",
    subTotal: "7778",
    status: "DELIVERED",
  ),
  OrderModel(
    id: "1",
    code: "45999",
    quantity: "3",
    date: "23/12/2025",
    subTotal: "7778",
    status: "DELIVERED",
  ),
];

const rating = [1, 2, 3, 4, 5];

const Color primaryColor =  Color(0xff508A7B);

bool isIos() {
  if (Platform.isIOS) {
    return true;
  } else {
    return false;
  }
}

Gap headerGap({double? gap}) {
  return Gap(gap ?? 60);
}

const double verticalSpace = 20;

void push({required BuildContext context, required Widget widget}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

Color getOrderStatusColor({required String status}) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange;

    case 'delivered':
      return Colors.green;

    case 'cancelled':
      return Colors.red;

    default:
      return Colors.grey;
  }
}


const Color starColor = Color(0xff508A7B) ;

List<String>  discoverImages = [] ;