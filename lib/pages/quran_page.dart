import 'package:fetch_api_learn/model/quran_mode.dart';
import 'package:fetch_api_learn/pages/detail_quran_page.dart';
import 'package:fetch_api_learn/services/quran_service.dart';
import 'package:flutter/material.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List<Quran> quran = [];
  void fetchQuran() async {
    final result = await QuranService.fetchQuran();
    quran = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchQuran();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetch Quran API',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          final quranResult = quran[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(
                    '${quranResult.nameSurahId} / ${quranResult.nameSurahAr} / ${quranResult.artiSurah}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total ayat: ${quranResult.totalAyat}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${quranResult.deskripsi}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  child: Text('${quranResult.no}'),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => DetaiQuranPage(
                              nomer: '${quranResult.no}',
                              nama: '${quranResult.nameSurahAr}',
                              namaLatin: '${quranResult.nameSurahId}',
                              jumlahAyat: '${quranResult.totalAyat}',
                              tempatTurun: '${quranResult.tempatTurun}',
                              arti: '${quranResult.artiSurah}',
                              deskripsi: '${quranResult.deskripsi}')));
                },
              ),
            ),
          );
        }),
        itemCount: quran.length,
      ),
    );
  }
}
