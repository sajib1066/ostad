import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int pulloverQty = 1;
  int tshirtQty = 1;
  int sportDressQty = 1;

  int pulloverPrice = 51;
  int tshirtPrice = 30;
  int sportDressPrice = 43;

  int get totalAmount =>
      (pulloverQty * pulloverPrice) +
          (tshirtQty * tshirtPrice) +
          (sportDressQty * sportDressPrice);

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Checkout successful.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildCartItem('Pullover', 'Black', 'L', pulloverQty,
                    pulloverPrice, (value) {
                      setState(() {
                        pulloverQty = value;
                      });
                    }),
                _buildCartItem('T-Shirt', 'Gray', 'L', tshirtQty, tshirtPrice,
                        (value) {
                      setState(() {
                        tshirtQty = value;
                      });
                    }),
                _buildCartItem('Sport Dress', 'Black', 'M', sportDressQty,
                    sportDressPrice, (value) {
                      setState(() {
                        sportDressQty = value;
                      });
                    }),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total amount:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalAmount.toString()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.redAccent,
                minimumSize: Size(double.infinity, 50), // Button width
              ),
              onPressed: () => _showSnackBar(context),
              child: Text(
                'CHECK OUT',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(String name, String color, String size, int quantity,
      int price, ValueChanged<int> onQuantityChanged) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Color: $color   Size: $size'),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: quantity > 1
                      ? () {
                    onQuantityChanged(quantity - 1);
                  }
                      : null,
                ),
                Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    onQuantityChanged(quantity + 1);
                  },
                ),
              ],
            ),
            SizedBox(width: 10),
            Text('\$${price * quantity}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
