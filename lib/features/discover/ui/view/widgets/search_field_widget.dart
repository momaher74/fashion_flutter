import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchFieldWidget extends StatefulWidget {
  final Function(String) onSearch; // callback for search input

  const SearchFieldWidget({super.key, required this.onSearch});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    // Cancel previous timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Start new timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(query); // Call the search callback
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: TextFormField(
                cursorColor: Colors.black,
                onChanged: _onSearchChanged, // attach debounced search
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Gap(8),
          SizedBox(
            height: 70,
            width: 70,
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  PhosphorIcons.faders(),
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Gap(10)
        ],
      ),
    );
  }
}
