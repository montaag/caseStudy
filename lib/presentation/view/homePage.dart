// import 'package:appnation_casestudy/presentation/bloc/bloc/dog_bloc.dart';
// import 'package:appnation_casestudy/presentation/view/dashboard.dart';
// import 'package:appnation_casestudy/presentation/view/splashScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<DogBloc>().add(FetchData());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DogBloc, DogState>(
//       builder: (context, state) {
//         if (state is SplashLoading) {
//           return SplashScreen();
//         } else {
//           return Dashboard();
//         }
//       },
//     );
//   }
// }
