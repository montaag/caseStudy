import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/presentation/bloc/bloc/dog_bloc.dart';
import 'package:appnation_casestudy/presentation/view/empty_screen.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_bottomNavBar.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_card.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  final List<Image> cachedImages;
  const Dashboard({super.key, required this.cachedImages});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController controller = TextEditingController();
  bool isVisible = true;

  List<DogModel> filter(String filterText, List<DogModel> list) {
    List<DogModel> filtered = [];
    for (var element in list) {
      if (element.breed.toLowerCase().contains(filterText.toLowerCase())) {
        filtered.add(element);
      }
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("\$AppName"),
        ),
        body: BlocBuilder<DogBloc, DogState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                filter(controller.text, state.dogList).isEmpty
                    ? const EmptyScreen()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                          children: filter(controller.text, state.dogList)
                              .map((e) => CustomCard(
                                    dog: e,
                                    cachedImage: widget.cachedImages[state.dogList.indexOf(e)],
                                  ))
                              .toList(),
                        ),
                      ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                        controller: controller,
                        onChanged: (value) {
                          setState(() {});
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomBottomNavBar(),
                  ],
                )
              ],
            );
          },
        ));
  }
}
