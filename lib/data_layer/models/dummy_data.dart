class Product {
  final String id;
  final String title;
  final int price;
  final int oldPrice;
  final String imgUrl;
  final int discountValue;
  final String category;
  final int? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.imgUrl,
    this.discountValue = 0,
    this.category = 'Other',
    this.rate,
  });
}

List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'Hp 840 G5',
    price: 15,
    imgUrl: 'assets/images/category/lap.JPEG',
    category: 'Laptop',
    discountValue: 20,
    oldPrice: 7000,
  ),
  Product(
    id: '2',
    title: 'fujitsu b24-8 te pro',
    price: 1000,
    imgUrl: 'assets/images/category/monitor.PNG',
    category: 'Monitor',
    oldPrice: 1000,
  ),
  Product(
    id: '3',
    title: 'Opto Mechanical Gaming Keyboard',
    price: 180,
    imgUrl: 'assets/images/category/keyboard.JPEG',
    category: 'Keyboard',
    discountValue: 20,
    oldPrice: 300,
  ),
  Product(
    id: '3',
    title: 'Apple MacBook Pro',
    price: 180,
    imgUrl: 'assets/images/category/mackbook.jpg',
    category: 'Laptop',
    oldPrice: 180,
  ),
  Product(
    id: '3',
    title: 'Dragon mouse',
    price: 350,
    imgUrl: 'assets/images/category/mouse.jpg',
    category: 'Laptop',
    oldPrice: 350,
  ),
  Product(
    id: '3',
    title: 'Hard Drive',
    price: 500,
    imgUrl: 'assets/images/category/hard.jpg',
    category: 'Laptop',
    oldPrice: 500,
  ),
];
