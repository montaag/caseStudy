import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value) onChanged;

  const CustomTextFormField({super.key, required this.controller, required this.onChanged});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Palette.grey, width: 2),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            backgroundColor: Colors.white,
            isScrollControlled: true,
            showDragHandle: true,
            useSafeArea: false,
            builder: (context) => MyDraggableSheet(
              controller: widget.controller,
              onChanged: widget.onChanged,
            ),
          );
        },
        child: Container(
          height: 64,
          width: 1000.w,
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Palette.lightGray), borderRadius: BorderRadius.circular(8)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.controller.text == "" ? "Search" : widget.controller.text,
                style: CustomTextStyle.body(context, color: Palette.hintTextColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDraggableSheet extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value) onChanged;
  const MyDraggableSheet({super.key, required this.controller, required this.onChanged});

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  DraggableScrollableSheet get sheet => (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.48) _collapse();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _anchor() => _animateSheet(sheet.snapSizes!.last);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => DraggableScrollableSheet(
        key: _sheet,
        initialChildSize: 0.5,
        maxChildSize: 1,
        minChildSize: 0,
        expand: false,
        snap: true,
        snapSizes: [
          0.5,
        ],
        controller: _controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverList.list(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 30),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: TextFormField(
                              controller: widget.controller,
                              onChanged: widget.onChanged,
                              autofocus: true,
                              maxLines: 99,
                              decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none), hintText: "Search"),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
