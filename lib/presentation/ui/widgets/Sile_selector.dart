
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.size, required this.onSelected, required this.initialSelected});
  final List<String>  size;
  final Function(int selectedIndex) onSelected;
  final int initialSelected;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int _selectedSizeindex = 0;

  void initState(){
    _selectedSizeindex = widget.initialSelected;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.size.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            _selectedSizeindex = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
              color: _selectedSizeindex == index
                  ? AppColor.primaryColor
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              widget.size[index],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: _selectedSizeindex == index
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
    );
  }
}