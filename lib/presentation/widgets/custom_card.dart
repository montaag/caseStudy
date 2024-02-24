import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/presentation/widgets/customAlertDialog.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final DogModel dog;
  final Image cachedImage;
  const CustomCard({super.key, required this.dog, required this.cachedImage});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCustomDialog(
            context,
            CustomAlertBig(
              dog: widget.dog,
            ));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Positioned.fill(
            child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: widget.cachedImage),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), borderRadius: const BorderRadius.only(topRight: Radius.circular(16), bottomLeft: Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.dog.breed,
                style: CustomTextStyle.body(context, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
