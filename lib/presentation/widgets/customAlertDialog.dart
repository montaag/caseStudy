import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/presentation/bloc/bloc/dog_bloc.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_button.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_close_button.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void showCustomDialog(BuildContext context, Widget customEventDialog) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return customEventDialog;
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

class CustomAlertBig extends StatelessWidget {
  final DogModel dog;

  const CustomAlertBig({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 20.0,
      ),
      actions: [
        CustomButton(
          title: "Generate",
          onPressed: () {
            showCustomDialog(context, CustomAlertSmall(breed: dog.breed));
          },
        ),
      ],
      backgroundColor: Colors.white,
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  child: Image.network(
                    dog.img,
                    fit: BoxFit.cover,
                    height: 37.h,
                    width: double.maxFinite,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: const CustomCloseButton(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "Breed",
                style: CustomTextStyle.title(context),
              ),
            ),
            const CustomDivider(),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                dog.breed,
                style: CustomTextStyle.body(context),
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Sub Breed",
                style: CustomTextStyle.title(context),
              ),
            ),
            const CustomDivider(),
            const SizedBox(height: 8),
            SizedBox(
              height: 8.h,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: dog.subreeds
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              e,
                              style: CustomTextStyle.body(context),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CustomAlertSmall extends StatefulWidget {
  final String breed;
  const CustomAlertSmall({super.key, required this.breed});

  @override
  State<CustomAlertSmall> createState() => _CustomAlertSmallState();
}

class _CustomAlertSmallState extends State<CustomAlertSmall> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DogBloc>().add(GenerateImage(breed: widget.breed));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<DogBloc, DogState>(
            builder: (context, state) {
              return state is DataLoaded && state.generatedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        state.generatedImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      color: Colors.amber,
                    );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: CustomCloseButton(
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
