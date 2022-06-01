import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SiparisSayfa extends StatefulWidget {
  const SiparisSayfa({Key? key}) : super(key: key);

  @override
  State<SiparisSayfa> createState() => _SiparisSayfaState();
}

class _SiparisSayfaState extends State<SiparisSayfa> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        //debugPrint("Scroll Aşağıya Kaydırıldı");
      }
      if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        //debugPrint("Scroll Yukarı Kaydırıldı");
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference siparislerRef = firestore.collection("siparisler");
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey.shade700,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Siparişlerim',
          style: TextStyle(
            color: Colors.black87.withOpacity(0.7),
            fontFamily: 'GilamSemiBold',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: siparislerRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Ters bir şeyler gitti. Tekrar Deneyiniz...');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 120,
                  ),
                  Text("Siparişlerim Yükleniyor..."),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      return DecoratedBox(
                        decoration: const BoxDecoration(),
                        child: ListTile(
                          leading: Column(children: [
                            const Text("Adet"),
                            Text("${data['siparis_sayisi']}")
                          ]),
                          title: Text("${data['isim']}"),
                          trailing: Text("${data['fiyat']}"),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
