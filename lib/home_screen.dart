import 'package:flutter/material.dart';
import 'package:module_9c_1/add_new_product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRUD',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.only(left: 16),
                      contentPadding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      title: Row(
                        children: [
                          const Text('Choose which to want'),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close))
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit'),
                          ),
                          const Divider(height: 0),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Icons.delete_forever_outlined),
                            title: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  });
            },
            title: const Text('Product Name'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Product code'),
                Text('Total price'),
                Text('Available units'),
              ],
            ),
            leading: Image.network(
                'https://cdn.fuelrocks.com/1662629161341.jpg',
                width: 50,
                errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.image,
                size: 32,
              );
            }),
            trailing: const Text('Unit Price'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
