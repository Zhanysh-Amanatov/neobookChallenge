/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SegmentControlWidget extends StatefulWidget {
  final List<String> values;
  final int initialPosition;
  final Function(int index) onSelected;

  const SegmentControlWidget({
    super.key,
    required this.values,
    required this.onSelected,
    this.initialPosition = 0,
  });

  @override
  State<SegmentControlWidget> createState() => _SegmentControlWidgetState();
}

class _SegmentControlWidgetState extends State<SegmentControlWidget> {
  late int current;
  @override
  void initState() {
    super.initState();
    current = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.values.length, (index) {
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    current = index;
                  });
                  widget.onSelected(index);
                },
                child: Container(
                  height: 35.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 4.h),
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).hintColor),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: index == current
                          ? Theme.of(context).primaryColor
                          : Colors.white
                      // : Theme.of(context).hintColor,
                      ),
                  child: Text(widget.values[index],
                      style: index == current
                          ? Theme.of(context).textTheme.bodySmall
                          : Theme.of(context).textTheme.displaySmall
                      // style:  const TextStyle(colo Theme.of(context).hintColor),
                      ),
                ),
              );
            })),
      ),
    );
  }
}
