class ProductModel {
  final String image, name, subName, description;
  final double price;

  ProductModel(
      {required this.image,
      required this.name,
      required this.subName,
      required this.description,
      required this.price});
}

List<ProductModel> products = [
  ProductModel(
      image: 'imageedit_2_2286880304.png',
      name: 'Manual Grinder New',
      subName: 'Full Spectrume CBD Oil',
      description: description,
      price: 139.50),
  ProductModel(
      image: 'imageedit_4_5908409171.png',
      name: 'Electric Burr Coffee',
      subName: 'Adjustable Burr Mil',
      description: description,
      price: 124.90),
  ProductModel(
      image: 'imageedit_6_9120482275.png',
      name: 'Manual Grinder Moeni',
      subName: 'Vintage Black',
      description: description,
      price: 125.80),
];
String howToPouringCoffee =
    'Step 1: Heat the water and prepare the coffee grounds\nStep 2: Pre-wet the filter\nStep 3: Get your supplies and scale ready\nStep 4: Pour the water\nStep 5: Let the water draw down as you pour\nStep 6: Enjoy your perfect pour-over coffee';
String description =
    'Durable Stainless Steel 420 Cronical burr coffee grinder, 38mm efficient burr and double bearing support pin make coffee beans grinding more detailed and uniform. You can grind enough coffee for your family in one minute';
//ide ide mati oleh pikiran mereka sendiri tanpa pernah melihat sinar matahari