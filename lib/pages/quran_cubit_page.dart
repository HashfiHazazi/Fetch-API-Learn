import 'package:fetch_api_learn/view_model/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuranCubitPage extends StatelessWidget {
  const QuranCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuranCubit myQuranCubit = context.read<QuranCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Quran App',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
        },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: myQuranCubit,
          builder: (context, state) {
            if (state is QuranLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        'Fetching quran list...',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                ),
              );
            } else if (state is QuranLoaded) {
              final quranData = state.quranResult;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final quranResult = quranData[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      child: ListTile(
                        title: Text(
                            '${quranResult.name} / ${quranResult.englishName}'),
                        subtitle: Text(
                            '${quranResult.englishNameTranslation}\n${quranResult.revelationType}\n${quranResult.numberOfAyahs} ayat'),
                        leading:
                            CircleAvatar(child: Text('${quranResult.number}')),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(quranResult.englishName),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                itemCount: quranData.length,
              );
            } else if (state is QuranError) {
              return const Center(
                child: Text('Quran Error!'),
              );
            } else {
              return const Center(
                child: Text('Not Found Page!'),
              );
            }
          },
        ),
      ),
    );
  }
}
