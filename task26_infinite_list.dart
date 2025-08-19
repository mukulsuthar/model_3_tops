import 'package:flutter/material.dart';

void main() {
  runApp(const Task26App());
}

class Task26App extends StatelessWidget {
  const Task26App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 26 Infinite List",
      debugShowCheckedModeBanner: false,
      home: const InfiniteListScreen(),
    );
  }
}

class InfiniteListScreen extends StatefulWidget {
  const InfiniteListScreen({super.key});

  @override
  State<InfiniteListScreen> createState() => _InfiniteListScreenState();
}

class _InfiniteListScreenState extends State<InfiniteListScreen> {
  final List<int> _items = List.generate(20, (index) => index);
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  Future<void> _loadMore() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    setState(() {
      _items.addAll(
          List.generate(10, (index) => _items.length + index)); // add more
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("📜 Infinite Scrolling List")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1,
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _isLoading
                ? const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(child: CircularProgressIndicator()))
                : const SizedBox();
          }
          return ListTile(
            title: Text("Item ${_items[index]}"),
          );
        },
      ),
    );
  }
}
