import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarr extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final VoidCallback onFilterPressed;

  SearchBarr({required this.controller, required this.onSearch, required this.onFilterPressed});

  @override
  _SearchBarrState createState() => _SearchBarrState();
}

class _SearchBarrState extends State<SearchBarr> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {}); // Trigger rebuild when text changes
      widget.onSearch(widget.controller.text);
    });
  }

  void _clearSearch() {
    widget.controller.clear();
    widget.onSearch('');
    setState(() {}); // Update the state after clearing the text
  }

  @override
  Widget build(BuildContext context) {
    bool isFilled = widget.controller.text.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 1,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(
                  color: isFilled ? SecondaryColor.c8 : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: isFilled ? SecondaryColor.c8 : Colors.grey,
                    ),
                    onPressed: () => widget.onSearch(widget.controller.text),
                  ),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      decoration: const InputDecoration(
                        hintText: 'Cari nama pemesan',
                        border: InputBorder.none,
                        hintStyle: TextStyles.b1,
                      ),
                      onChanged: (text) {
                        widget.onSearch(text);
                      },
                    ),
                  ),
                  if (isFilled)
                    IconButton(
                      icon: const Icon(Icons.highlight_remove, color: Colors.grey),
                      onPressed: _clearSearch,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: PrimaryColor.c3,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.filter_list,
                color: PrimaryColor.c8,
              ),
              onPressed: widget.onFilterPressed,
            ),
          ),
        ],
      ),
    );
  }
}
