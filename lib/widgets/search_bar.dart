import 'package:flutter/material.dart';

class SearchScreenBar extends StatelessWidget {
  final Function(String) onSearch;
  final TextEditingController controller =
      TextEditingController(); // Add this line

  SearchScreenBar({
    super.key,
    required this.onSearch,
    required String placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller, // Use the controller here
        onSubmitted:
            onSearch, // Use the onSearch function when the text field is submitted
        decoration: InputDecoration(
          hintText: 'Enter city name',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () =>
                onSearch(controller.text), // Trigger search on icon click
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
