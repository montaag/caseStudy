import 'dart:developer';

import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/presentation/bloc/bloc/dog_bloc.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_bottomNavBar.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  final List<Image> cachedImages;
  const Dashboard({super.key, required this.cachedImages});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppName"),
        ),
        body: BlocBuilder<DogBloc, DogState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1,
                    children: state.dogList
                        .map((e) => CustomCard(
                              dog: e,
                              cachedImage: widget.cachedImages[state.dogList.indexOf(e)],
                            ))
                        .toList(),
                  ),
                ),
                TrapezoidWidget()
              ],
            );
          },
        ));
    ;
  }
}
