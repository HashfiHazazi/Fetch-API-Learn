import 'package:fetch_api_learn/pages/quran_cubit_page.dart';
import 'package:fetch_api_learn/view_model/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LandingQuranPage extends StatelessWidget {
  const LandingQuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuranCubit myQuranCubit = context.read<QuranCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: double.infinity,
                child: LottieBuilder.asset('assets/lottie/quran_lottie.json'),
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat, sem vitae cursus varius, eros metus facilisis metus, sit amet molestie velit elit et sem. Curabitur sit amet urna ut mi porttitor sollicitudin ut eu eros. Nam ut luctus leo, quis consectetur quam.',
                style:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: myQuranCubit,
                          child: const QuranCubitPage(),
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('CONTINUE'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
