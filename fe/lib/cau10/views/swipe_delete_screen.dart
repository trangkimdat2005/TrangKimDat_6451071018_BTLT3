import 'package:flutter/material.dart';

class SwipeDeleteScreen extends StatefulWidget {
  const SwipeDeleteScreen({Key? key}) : super(key: key);

  @override
  State<SwipeDeleteScreen> createState() => _SwipeDeleteScreenState();
}

class _SwipeDeleteScreenState extends State<SwipeDeleteScreen> {
  late List<String> _items;

  @override
  void initState() {
    super.initState();
    _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 10: Kéo để xóa item'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          _items.isEmpty
              ? Center(
                  child: Text(
                    'Không còn item nào',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(_items[index]),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        setState(() {
                          _items.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${_items.length < 4 ? 'Item đã bị xóa' : _items[index]} bị xóa'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(
                            _items[index],
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          subtitle: const Text('Kéo sang trái để xóa'),
                          trailing: const Icon(Icons.drag_handle),
                        ),
                      ),
                    );
                  },
                ),
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              'MSSV: 6451071018',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
